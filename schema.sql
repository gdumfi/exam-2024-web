-- Создание таблицы для обложек
CREATE TABLE Covers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    filename VARCHAR NOT NULL,
    mime_type VARCHAR NOT NULL,
    md5_hash VARCHAR NOT NULL
);

-- Создание таблицы для жанров
CREATE TABLE Genres (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL UNIQUE
);

-- Создание таблицы для книг
CREATE TABLE Books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR NOT NULL,
    description TEXT NOT NULL,
    year INTEGER NOT NULL,
    publisher VARCHAR NOT NULL,
    author VARCHAR NOT NULL,
    pages INT NOT NULL,
    cover_id INTEGER NOT NULL,
    FOREIGN KEY (cover_id) REFERENCES Covers(id)
);

-- Создание таблицы для связывания книг с жанрами (многие ко многим)
CREATE TABLE BookGenres (
    book_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY (book_id, genre_id),
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id)
);

-- Создание таблицы для ролей пользователей
CREATE TABLE Roles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL,
    description TEXT NOT NULL
);

-- Создание таблицы для пользователей
CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR NOT NULL,
    password_hash VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
    middle_name VARCHAR,
    role_id INTEGER NOT NULL,
    FOREIGN KEY (role_id) REFERENCES Roles(id)
);

-- Создание таблицы для рецензий
CREATE TABLE Reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    rating INT NOT NULL,
    text TEXT NOT NULL,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Добавление данных для ролей
INSERT INTO Roles (name, description) VALUES
('admin', 'Суперюзер'),
('moderator', 'модератор'),
('user', 'пользователь');

-- Добавление данных для жанров
INSERT INTO Genres (name) VALUES ('Научная фантастика'), ('Фентези'), ('Мистика'), ('Роман'), ('Научно-популярная литература');

-- Добавление данных для тестовых пользователей
INSERT INTO Users (username, password_hash, last_name, first_name, middle_name, role_id) VALUES
('admin', 'admin_hash', 'Adminov', 'Admin', NULL, 1),
('moderator', 'moderator_hash', 'Moderov', 'Mod', NULL, 2),
('user', 'user_hash', 'Userov', 'User', NULL, 3);

-- Добавление данных для книг
INSERT INTO Books (title, description, year, publisher, author, pages, cover_id) VALUES
('Дюна', 'Научно-фантастический роман о сыне знатного рода, которому поручено защищать самое ценное вещество в галактике.', 1965, 'Чилтон Букс', 'Фрэнк Герберт', 412, 1),
('1984', 'Дистопический социально-фантастический роман-предостережение о опасностях тоталитаризма.', 1949, 'Секкер и Варбург', 'Джордж Оруэлл', 328, 2),
('Гордость и предубеждение', 'Роман, описывающий эмоциональное развитие главной героини Элизабет Беннет.', 1813, 'Т. Эгертон, Уайтхолл', 'Джейн Остин', 279, 3),
('Убить пересмешника', 'Роман о серьезных проблемах изнасилования и расового неравенства.', 1960, 'Дж. Б. Липпинкотт и Ко.', 'Харпер Ли', 281, 4),
('Великий Гэтсби', 'Роман, критикующий разочарование и моральный упадок общества в 1920-х годах.', 1925, 'Чарльз Скрибнер сыновья', 'Фрэнсис Скотт Фицджеральд', 180, 5),
('Моби Дик', 'Роман о путешествии китобойного судна "Пекод".', 1851, 'Харпер и братья', 'Герман Мелвилл', 585, 6),
('Война и мир', 'Роман, описывающий историю французского вторжения в Россию.', 1869, 'Русский Вестник', 'Лев Толстой', 1225, 7),
('Над пропастью во ржи', 'Роман о подростке, испытывающем отчуждение от взрослого мира.', 1951, 'Литтл, Браун и Ко.', 'Джером Дэвид Сэлинджер', 277, 8),
('Хоббит', 'Фэнтези-роман о путешествии Бильбо Бэггинса.', 1937, 'Джордж Аллен и Анвин', 'Джон Рональд Руэл Толкин', 310, 9),
('451 градус по Фаренгейту', 'Дистопический роман о будущем обществе, где книги запрещены.', 1953, 'Баллантайн Букс', 'Рэй Брэдбери', 158, 10),
('Джейн Эйр', 'Роман о жизненных испытаниях главной героини.', 1847, 'Смит, Элдер и Ко.', 'Шарлотта Бронте', 500, 11),
('О дивный новый мир', 'Дистопический роман о футуристическом обществе.', 1932, 'Чатто и Виндус', 'Олдос Хаксли', 311, 12),
('Властелин колец', 'Эпический фэнтези-роман.', 1954, 'Джордж Аллен и Анвин', 'Джон Рональд Руэл Толкин', 1216, 13),
('Скотный двор', 'Сатирическая аллегорическая повесть, отражающая события, приведшие к Русской революции.', 1945, 'Секкер и Варбург', 'Джордж Оруэлл', 112, 14),
('Преступление и наказание', 'Роман о душевных муках и моральных дилеммах бедного бывшего студента.', 1866, 'Русский Вестник', 'Фёдор Достоевский', 671, 15),
('Грозовой перевал', 'Роман о страстной и почти демонической любви между Кэтрин Эрншо и Хитклифом.', 1847, 'Томас Котли Ньюби', 'Эмили Бронте', 416, 16),
('Одиссея', 'Эпическая поэма о приключениях Одиссея.', -800, 'Древняя Греция', 'Гомер', 541, 17),
('Большие надежды', 'Роман о личном росте и развитии сироты по имени Пип.', 1861, 'Чэпмен и Холл', 'Чарльз Диккенс', 544, 18),
('Приключения Гекльберри Финна', 'Роман о приключениях мальчика, путешествующего по реке Миссисипи.', 1884, 'Чатто и Виндус / Чарльз Л. Вебстер и Ко.', 'Марк Твен', 366, 19),
('Дракула', 'Роман о попытке вампира графа Дракулы переселиться из Трансильвании в Англию.', 1897, 'Арчибальд Констебл и Ко.', 'Брэм Стокер', 418, 20);



INSERT INTO BookGenres (book_id, genre_id) VALUES
(1, 1),
(2, 5),
(3, 4),
(4, 4),
(5, 4),
(6, 5),
(7, 5),
(8, 5),
(9, 2),
(10, 1),
(11, 4),
(12, 1),
(13, 2),
(14, 5),
(15, 5),
(16, 4),
(17, 2),
(18, 4),
(19, 2),
(20, 3);