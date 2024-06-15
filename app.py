from flask import Flask, render_template, redirect, url_for, flash, request
from config import Config
from extensions import db, migrate, login_manager
from forms import LoginForm, RegisterForm
from books import books
from collections_blueprint import collections_bp
from models import User, Book, Review, Genre, Cover, Role, book_genres, Collection, book_collections
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import login_user, logout_user, login_required

app = Flask(__name__)
app.config.from_object(Config)

db.init_app(app)
migrate.init_app(app, db)
login_manager.init_app(app)
login_manager.login_view = 'login'

app.register_blueprint(books)
app.register_blueprint(collections_bp, url_prefix='/collections')

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

@app.route('/')
@app.route('/index')
def index():
    page = request.args.get('page', 1, type=int)
    books = Book.query.order_by(Book.year.desc()).paginate(page=page, per_page=10, error_out=False)

    for book in books.items:
        reviews = Review.query.filter_by(book_id=book.id).all()
        if reviews:
            total_ratings = sum(review.rating for review in reviews)
            book.avg_rating = total_ratings / len(reviews)
            book.review_count = len(reviews)
        else:
            book.avg_rating = 0
            book.review_count = 0

    return render_template('index.html', books=books)

@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(username=form.username.data).first()
        if user and check_password_hash(user.password, form.password.data):
            login_user(user, remember=form.remember.data)
            flash('Вход успешно выполнен!', 'success')
            next_page = request.args.get('next')
            return redirect(next_page or url_for('index'))
        else:
            flash('Неверное имя пользователя или пароль.', 'danger')

    return render_template('login.html', form=form)

@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegisterForm()
    if form.validate_on_submit():
        existing_user = User.query.filter_by(username=form.username.data).first()

        hashed_password = generate_password_hash(form.password.data, method='pbkdf2:sha256')
        new_user = User(username=form.username.data,
                        password=hashed_password,
                        last_name=form.last_name.data,
                        first_name=form.first_name.data,
                        middle_name=form.middle_name.data)

        base_role = Role.query.filter_by(id=3).first()
        new_user.role = base_role

        db.session.add(new_user)
        db.session.commit()

        flash('Регистрация успешно завершена! Теперь вы можете войти.', 'success')
        return redirect(url_for('login'))

    return render_template('register.html', form=form)

@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash('Выход успешно выполнен!', 'success')
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
