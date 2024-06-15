INSERT INTO roles (name, description) VALUES
    ('admin', 'Администратор'),
    ('moderator', 'Модератор'),
    ('user', 'Пользователь');


INSERT INTO genres (name) VALUES
    ('Фантастика'),
    ('Роман'),
    ('Детектив'),
    ('Поэзия'),
    ('Документальная литература'),
    ('Фэнтези'),
    ('Классика'),
    ('Приключения');


INSERT INTO users (username, password, last_name, first_name, middle_name, role_id) VALUES
    ('admin', '12345678', 'Одменус', 'Алеша', NULL, 1),
    ('moderator', '12345678', 'Малый', 'Антон', NULL, 2),
    ('user', '12345678', 'Огурец', 'Юрец', NULL, 3);

INSERT INTO covers (filename, mime_type, md5_hash) VALUES
    ('cover1.jpg', 'image/jpeg', '1'),
    ('cover2.jpg', 'image/jpeg', '2'),
    ('cover3.jpg', 'image/jpeg', '3'),
    ('cover4.jpg', 'image/jpeg', '4'),
    ('cover5.jpg', 'image/jpeg', '5'),
    ('cover6.jpg', 'image/jpeg', '6'),
    ('cover7.jpg', 'image/jpeg', '7'),
    ('cover8.jpg', 'image/jpeg', '8'),
    ('cover9.jpg', 'image/jpeg', '9'),
    ('cover10.jpg', 'image/jpeg', '10'),
    ('cover11.jpg', 'image/jpeg', '11'),
    ('cover12.jpg', 'image/jpeg', '12');


INSERT INTO books (title, short_description, year, publisher, author, page_count, cover_id)
VALUES
    ('Дюна', 'Научно-фантастический роман о сыне знатного рода, которому поручено защищать самое ценное вещество в галактике.', 1965, 'Чилтон Букс', 'Фрэнк Герберт', 412, 1),
    ('1984', 'Антиутопия о тоталитарном обществе.', 1949, 'Секкер и Варбург', 'Джордж Оруэлл', 328, 2),
    ('Мастер и Маргарита', 'Роман о волшебстве и истории любви.', 1967, 'Азбука', 'Михаил Булгаков', 384, 3),
    ('Гордость и предубеждение', 'Роман о жизни и любви в Англии начала 19 века.', 1813, 'Т. Эгертон, Уайтхолл', 'Джейн Остин', 279, 4),
    ('Хоббит', 'Фэнтези-роман о путешествии Бильбо Бэггинса.', 1937, 'Джордж Аллен и Анвин', 'Джон Рональд Руэл Толкин', 310, 5),
    ('451 градус по Фаренгейту', 'Роман о мире, где книги запрещены и сжигаются.', 1953, 'Баллантайн Букс', 'Рэй Брэдбери', 158, 6),
    ('Убить пересмешника', 'История о расовых предрассудках и правосудии в США.', 1960, 'Дж. Б. Липпинкотт и Ко.', 'Харпер Ли', 281, 7),
    ('Над пропастью во ржи', 'Роман о подростке, испытывающем отчуждение от мира.', 1951, 'Литтл, Браун и Ко.', 'Джером Дэвид Сэлинджер', 277, 8),
    ('Властелин колец', 'Эпическая сага о борьбе добра и зла в Средиземье.', 1954, 'Джордж Аллен и Анвин', 'Джон Рональд Руэл Толкин', 1216, 9),
    ('Моби Дик', 'История капитана Ахава и его охоты на белого кита.', 1851, 'Харпер и братья', 'Герман Мелвилл', 585, 10),
    ('Великий Гэтсби', 'Роман о великой любви и американской мечте.', 1925, 'Чарльз Скрибнер сыновья', 'Фрэнсис Скотт Фицджеральд', 200, 11),
    ('Игра престолов', 'Первый роман из цикла "Песнь льда и огня".', 1996, 'HarperCollins', 'Джордж Р. Р. Мартин', 694, 12);


INSERT INTO book_genres (book_id, genre_id) VALUES
    (1, 1),    -- Дюна: Фантастика
    (2, 1),    -- 1984: Фантастика
    (3, 2),    -- Мастер и Маргарита: Роман
    (4, 2),    -- Гордость и предубеждение: Роман
    (5, 6),    -- Хоббит: Фэнтези
    (6, 1),    -- 451 градус по Фаренгейту: Фантастика
    (7, 2),    -- Убить пересмешника: Роман
    (8, 2),    -- Над пропастью во ржи: Роман
    (9, 6),    -- Властелин колец: Фэнтези
    (10, 7),   -- Моби Дик: Классика
    (11, 2),   -- Великий Гэтсби: Роман
    (12, 6);   -- Игра престолов: Фэнтези

