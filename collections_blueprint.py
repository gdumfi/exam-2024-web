from flask import Blueprint, render_template, redirect, url_for, flash, request
from flask_login import login_required, current_user
from forms import CollectionForm, AddToCollectionForm
from models import Collection, Book
from extensions import db

collections_bp = Blueprint('collections_bp', __name__)

@collections_bp.route('/collections', methods=['GET'])
@login_required
def collections():
    collections = Collection.query.filter_by(user_id=current_user.id).all()
    return render_template('collections.html', collections=collections)

@collections_bp.route('/collection/<int:collection_id>')
@login_required
def view_collection(collection_id):
    collection = Collection.query.get_or_404(collection_id)
    return render_template('view_collection.html', collection=collection)

@collections_bp.route('/collection/add', methods=['GET', 'POST'])
@login_required
def add_collection():
    form = CollectionForm()
    if form.validate_on_submit():
        try:
            collection = Collection(title=form.title.data, user_id=current_user.id)
            db.session.add(collection)
            db.session.commit()
            flash('Подборка успешно добавлена!', 'success')
            return redirect(url_for('collections_bp.collections'))
        except Exception as e:
            db.session.rollback()
            flash('Ошибка при добавлении подборки. Пожалуйста, попробуйте еще раз.', 'danger')
    return render_template('add_collection.html', form=form)

@collections_bp.route('/book/<int:book_id>/add_to_collection', methods=['POST'])
@login_required
def add_to_collection(book_id):
    collection_id = request.form.get('collection')
    if not collection_id:
        flash('Необходимо выбрать подборку для добавления книги!', 'danger')
        return redirect(url_for('books.book', book_id=book_id))

    collection = Collection.query.get_or_404(collection_id)
    book = Book.query.get_or_404(book_id)
    
    try:
        if book not in collection.books:
            collection.books.append(book)
            db.session.commit()
            flash('Книга успешно добавлена в подборку!', 'success')
        else:
            flash('Книга уже есть в этой подборке!', 'info')

    except Exception as e:
        db.session.rollback()
        flash('Ошибка при добавлении книги в подборку. Пожалуйста, попробуйте еще раз.', 'danger')

    return redirect(url_for('books.book', book_id=book_id))

@collections_bp.route('/collection/<int:collection_id>/book/<int:book_id>/remove', methods=['POST'])
@login_required
def remove_from_collection(collection_id, book_id):
    collection = Collection.query.get_or_404(collection_id)
    book = Book.query.get_or_404(book_id)

    try:
        if book in collection.books:
            collection.books.remove(book)
            db.session.commit()
            flash('Книга успешно удалена из подборки!', 'success')
        else:
            flash('Эта книга не находится в подборке.', 'info')
    except Exception as e:
        db.session.rollback()
        flash('Ошибка при удалении книги из подборки. Пожалуйста, попробуйте еще раз.', 'danger')

    return redirect(url_for('collections_bp.view_collection', collection_id=collection_id))

@collections_bp.route('/collection/<int:collection_id>/delete', methods=['POST'])
@login_required
def delete_collection(collection_id):
    collection = Collection.query.get_or_404(collection_id)

    if current_user.id != collection.user_id:
        flash('Вы не имеете права удалять эту подборку.', 'warning')
        return redirect(url_for('collections_bp.collections'))

    try:
        db.session.delete(collection)
        db.session.commit()
        flash('Подборка успешно удалена!', 'success')
    except Exception as e:
        db.session.rollback()
        flash('Ошибка при удалении подборки. Пожалуйста, попробуйте еще раз.', 'danger')

    return redirect(url_for('collections_bp.collections'))
