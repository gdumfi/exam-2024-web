from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, TextAreaField, SelectField, SelectMultipleField, IntegerField, BooleanField, SubmitField
from wtforms.validators import InputRequired, Length, DataRequired, URL, ValidationError
from wtforms.widgets import ListWidget, CheckboxInput
from flask_wtf.file import FileField, FileAllowed

from extensions import db
from models import User, Genre, Book

class MultiCheckboxField(SelectMultipleField):
    widget = ListWidget(prefix_label=False)
    option_widget = CheckboxInput()

class LoginForm(FlaskForm):
    username = StringField('Логин', validators=[DataRequired()])
    password = PasswordField('Пароль', validators=[DataRequired()])
    remember = BooleanField('Запомнить меня')

class RegisterForm(FlaskForm):
    username = StringField('Логин', validators=[InputRequired(), Length(min=4, max=100)])
    password = PasswordField('Пароль', validators=[InputRequired(), Length(min=6, max=100)])
    last_name = StringField('Фамилия', validators=[InputRequired(), Length(max=100)])
    first_name = StringField('Имя', validators=[InputRequired(), Length(max=100)])
    middle_name = StringField('Отчество', validators=[Length(max=100)])

    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user:
            raise ValidationError('Такой логин уже занят. Пожалуйста, выберите другой.')

class BookForm(FlaskForm):
    title = StringField('Название книги', validators=[InputRequired(), Length(max=255)])
    short_description = TextAreaField('Краткое описание книги', validators=[InputRequired()])
    year = IntegerField('Год издания', validators=[InputRequired()])
    publisher = StringField('Издательство', validators=[InputRequired(), Length(max=255)])
    author = StringField('Автор', validators=[InputRequired(), Length(max=255)])
    page_count = IntegerField('Объём (в страницах)', validators=[InputRequired()])
    genre = MultiCheckboxField('Жанр')
    cover_image = FileField('Обложка книги', validators=[FileAllowed(['jpg', 'jpeg', 'png', 'gif'], 'Только изображения!')])

    def __init__(self, *args, **kwargs):
        super(BookForm, self).__init__(*args, **kwargs)
        self.genre.choices = [(genre.id, genre.name) for genre in Genre.query.all()]

class EditBookForm(FlaskForm):
    title = StringField('Название книги', validators=[InputRequired(), Length(max=255)])
    short_description = TextAreaField('Краткое описание книги', validators=[InputRequired()])
    year = IntegerField('Год издания', validators=[InputRequired()])
    publisher = StringField('Издательство', validators=[InputRequired(), Length(max=255)])
    author = StringField('Автор', validators=[InputRequired(), Length(max=255)])
    page_count = IntegerField('Объём (в страницах)', validators=[InputRequired()])
    genre = MultiCheckboxField('Жанр', coerce=int)

    def __init__(self, *args, **kwargs):
        super(EditBookForm, self).__init__(*args, **kwargs)
        self.genre.choices = [(genre.id, genre.name) for genre in Genre.query.all()]

    def populate_obj(self, book):
        self.title.populate_obj(book, 'title')
        self.short_description.populate_obj(book, 'short_description')
        self.year.populate_obj(book, 'year')
        self.publisher.populate_obj(book, 'publisher')
        self.author.populate_obj(book, 'author')
        self.page_count.populate_obj(book, 'page_count')
        book.genres = Genre.query.filter(Genre.id.in_(self.genre.data)).all()

    def validate_genre(self, field):
        genre_ids = [genre.id for genre in Genre.query.all()]
        for genre_id in field.data:
            if genre_id not in genre_ids:
                raise ValidationError('Неверное значение жанра.')

class ReviewForm(FlaskForm):
    rating = SelectField('Оценка', choices=[
        ('5', 'Отлично'),
        ('4', 'Хорошо'),
        ('3', 'Удовлетворительно'),
        ('2', 'Неудовлетворительно'),
        ('1', 'Плохо'),
        ('0', 'Ужасно')
    ], validators=[InputRequired()])

    text = TextAreaField('Текст рецензии', validators=[InputRequired(), Length(max=1000)])

    submit = SubmitField('Оставить рецензию')

class CollectionForm(FlaskForm):
    title = StringField('Название подборки', validators=[InputRequired(), Length(max=255)])

class AddToCollectionForm(FlaskForm):
    collection = SelectField('Выберите подборку', coerce=int, validators=[InputRequired()])

class SearchForm(FlaskForm):
    title = StringField('Название', validators=[Length(max=255)])
    genres = MultiCheckboxField('Жанр', coerce=int)
    year = SelectMultipleField('Год', coerce=int)
    volume_from = StringField('Объём от', validators=[Length(max=10)])
    volume_to = StringField('Объём до', validators=[Length(max=10)])
    author = StringField('Автор', validators=[Length(max=255)])
    submit = SubmitField('Поиск')

    def __init__(self, *args, **kwargs):
        super(SearchForm, self).__init__(*args, **kwargs)
        self.genres.choices = [(genre.id, genre.name) for genre in Genre.query.all()]
        years = [year[0] for year in db.session.query(Book.year).distinct().order_by(Book.year).all()]
        self.year.choices = [(year, year) for year in years]