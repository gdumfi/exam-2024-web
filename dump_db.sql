--
-- Файл сгенерирован с помощью SQLiteStudio v3.4.4 в Вт июн 25 15:00:40 2024
--
-- Использованная кодировка текста: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: alembic_version
CREATE TABLE IF NOT EXISTS alembic_version (
	version_num VARCHAR(32) NOT NULL, 
	CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);
INSERT INTO alembic_version (version_num) VALUES ('dcbf7b3b4cbb');

-- Таблица: book_collections
CREATE TABLE IF NOT EXISTS book_collections (book_id INTEGER NOT NULL, collection_id INTEGER NOT NULL, PRIMARY KEY (book_id, collection_id), FOREIGN KEY (book_id) REFERENCES books (id), FOREIGN KEY (collection_id) REFERENCES test (id));
INSERT INTO book_collections (book_id, collection_id) VALUES (11, 1);
INSERT INTO book_collections (book_id, collection_id) VALUES (1, 1);
INSERT INTO book_collections (book_id, collection_id) VALUES (11, 2);

-- Таблица: book_genres
CREATE TABLE IF NOT EXISTS book_genres (book_id INTEGER NOT NULL, genre_id INTEGER NOT NULL, PRIMARY KEY (book_id, genre_id), FOREIGN KEY (book_id) REFERENCES books (id), FOREIGN KEY (genre_id) REFERENCES genres (id));
INSERT INTO book_genres (book_id, genre_id) VALUES (1, 5);
INSERT INTO book_genres (book_id, genre_id) VALUES (2, 1);
INSERT INTO book_genres (book_id, genre_id) VALUES (4, 5);
INSERT INTO book_genres (book_id, genre_id) VALUES (5, 5);
INSERT INTO book_genres (book_id, genre_id) VALUES (6, 5);
INSERT INTO book_genres (book_id, genre_id) VALUES (7, 5);
INSERT INTO book_genres (book_id, genre_id) VALUES (8, 2);
INSERT INTO book_genres (book_id, genre_id) VALUES (9, 4);
INSERT INTO book_genres (book_id, genre_id) VALUES (10, 5);
INSERT INTO book_genres (book_id, genre_id) VALUES (12, 5);
INSERT INTO book_genres (book_id, genre_id) VALUES (3, 1);
INSERT INTO book_genres (book_id, genre_id) VALUES (3, 2);
INSERT INTO book_genres (book_id, genre_id) VALUES (9, 3);
INSERT INTO book_genres (book_id, genre_id) VALUES (11, 1);
INSERT INTO book_genres (book_id, genre_id) VALUES (11, 6);
INSERT INTO book_genres (book_id, genre_id) VALUES (11, 2);
INSERT INTO book_genres (book_id, genre_id) VALUES (11, 3);
INSERT INTO book_genres (book_id, genre_id) VALUES (11, 4);
INSERT INTO book_genres (book_id, genre_id) VALUES (11, 5);
INSERT INTO book_genres (book_id, genre_id) VALUES (11, 7);
INSERT INTO book_genres (book_id, genre_id) VALUES (11, 8);
INSERT INTO book_genres (book_id, genre_id) VALUES (13, 1);
INSERT INTO book_genres (book_id, genre_id) VALUES (14, 1);
INSERT INTO book_genres (book_id, genre_id) VALUES (14, 2);
INSERT INTO book_genres (book_id, genre_id) VALUES (14, 3);
INSERT INTO book_genres (book_id, genre_id) VALUES (15, 1);
INSERT INTO book_genres (book_id, genre_id) VALUES (15, 7);
INSERT INTO book_genres (book_id, genre_id) VALUES (15, 8);
INSERT INTO book_genres (book_id, genre_id) VALUES (16, 1);
INSERT INTO book_genres (book_id, genre_id) VALUES (16, 2);
INSERT INTO book_genres (book_id, genre_id) VALUES (16, 3);
INSERT INTO book_genres (book_id, genre_id) VALUES (16, 4);
INSERT INTO book_genres (book_id, genre_id) VALUES (16, 5);
INSERT INTO book_genres (book_id, genre_id) VALUES (16, 6);
INSERT INTO book_genres (book_id, genre_id) VALUES (16, 7);
INSERT INTO book_genres (book_id, genre_id) VALUES (16, 8);

-- Таблица: books
CREATE TABLE IF NOT EXISTS books (
	id INTEGER NOT NULL, 
	title VARCHAR(255) NOT NULL, 
	short_description TEXT NOT NULL, 
	year INTEGER NOT NULL, 
	publisher VARCHAR(255) NOT NULL, 
	author VARCHAR(255) NOT NULL, 
	page_count INTEGER NOT NULL, 
	cover_id INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(cover_id) REFERENCES covers (id)
);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (1, 'Тихое море', 'Эпическая история путешествия через неизведанный океан, полный мифических существ и скрытых опасностей.', 2018, 'Oceanic Press', 'Джеймс Картер', 432, 1);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (2, 'Эхо прошлого', 'Исторический роман, исследующий секреты маленького города через серию найденных писем.', 2020, 'Heritage Books', 'Эмили Сондерс', 350, 2);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (3, 'Квантовые мечты', 'Научно-фантастический роман, исследующий последствия квантовых вычислений и искусственного интеллекта.', 2019, ' TechFuture Publications', 'Натан Роджерс', 289, 3);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (4, 'Забытый сад', 'Детективный роман о ботанике, который обнаруживает скрытый сад с темной тайной.', 2021, ' Green Thumb Press', 'Лора Митчелл', 412, 4);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (5, 'Город теней', 'Захватывающий криминальный триллер, происходящий в огромном мегаполисе, полном коррупции и интриг.', 2017, 'Noir Fiction House', 'Майкл Тернер', 378, 5);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (6, 'Восстание Феникса', 'Фэнтезийный роман о молодом герое, который пытается воскресить легендарного феникса, чтобы спасти свое королевство.', 2022, 'Dragonfire Books', 'Анджела Стивенс', 456, 6);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (7, 'Параллельные жизни', 'Современный роман, исследующий пересекающиеся жизни двух незнакомцев, которые больше связаны, чем они думают.', 2016, 'Urban Tales Publishing', 'Саманта Грей', 301, 7);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (8, 'Последняя экспедиция', 'Приключенческий роман о группе исследователей, отправившихся в опасное путешествие, чтобы найти затерянную цивилизацию.', 2015, 'Adventure Ink', 'Роберт Лоусон', 368, 8);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (9, 'Тёмные начала', 'Темные это плохо как-то...', 1995, 'Азбука', 'Филипп Пулман', 288, 9);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (10, 'Шепот в ветре', 'Романтическая драма, происходящая в небольшом прибрежном городке, где сталкиваются старые любви и новые начала.', 2020, 'Seaside Reads', 'Меган Тейлор', 344, 10);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (11, 'Бесконечный горизонт', ' Философское исследование места человечества во вселенной, рассказанное глазами астронавта на миссии в глубокий космос.', 2023, 'Cosmic Insights', 'Дэвид Уэст', 298, 11);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (12, 'Голоса из бездны', 'Ужасный роман о глубоководной экспедиции, пробуждающей древние, злые силы.', 2021, 'Dark Waters Press', 'Фиона Харпер', 384, 12);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (13, 'Искусство обмана', 'Психологический триллер о мастере подделки произведений искусства, который оказывается втянутым в смертельную игру в кошки-мышки.', 2018, 'Mind Games Publishing', 'Ричард Коллинз', 336, 13);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (14, 'Далекие солнца', 'Космическая опера, происходящая в далекой галактике, следуя за эпической борьбой между союзом повстанцев и угнетающим режимом.', 2019, 'Starbound Books', 'Изабелла Флорес', 512, 13);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (15, 'Под поверхностью', 'Детективный роман, сосредоточенный на обнаружении тела в отдаленном озере и раскрытии связанных с этим секретов.', 2022, 'Deep Mysteries Press', 'Кэтрин Эллис', 407, 13);
INSERT INTO books (id, title, short_description, year, publisher, author, page_count, cover_id) VALUES (16, 'Наследие пепла', 'Историческая драма, охватывающая несколько поколений, рассказывающая о взлете и падении могущественной династии.', 2017, 'Heritage Press', 'Оливер Стоун', 453, 13);

-- Таблица: covers
CREATE TABLE IF NOT EXISTS covers (
	id INTEGER NOT NULL, 
	filename VARCHAR(255) NOT NULL, 
	mime_type VARCHAR(255) NOT NULL, 
	md5_hash VARCHAR(32) NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (md5_hash)
);
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (1, 'cover1.jpg', 'image/jpeg', '1');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (2, 'cover2.jpg', 'image/jpeg', '2');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (3, 'cover3.jpg', 'image/jpeg', '3');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (4, 'cover4.jpg', 'image/jpeg', '4');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (5, 'cover5.jpg', 'image/jpeg', '5');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (6, 'cover6.jpg', 'image/jpeg', '6');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (7, 'cover7.jpg', 'image/jpeg', '7');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (8, 'cover8.jpg', 'image/jpeg', '8');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (9, 'cover9.jpg', 'image/jpeg', '9');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (10, 'cover10.jpg', 'image/jpeg', '10');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (11, 'cover11.jpg', 'image/jpeg', '11');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (12, 'cover12.jpg', 'image/jpeg', '12');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (13, 'e5582b937ac8909b2618c4c8aa221163.png', 'image/png', 'e5582b937ac8909b2618c4c8aa221163');
INSERT INTO covers (id, filename, mime_type, md5_hash) VALUES (14, '1f5843653d5ee2dba16c9995a35f76a9.png', 'image/png', '1f5843653d5ee2dba16c9995a35f76a9');

-- Таблица: genres
CREATE TABLE IF NOT EXISTS genres (id INTEGER NOT NULL, name VARCHAR (100) NOT NULL, PRIMARY KEY (id), UNIQUE (name));
INSERT INTO genres (id, name) VALUES (1, 'Фантастика');
INSERT INTO genres (id, name) VALUES (2, 'Роман');
INSERT INTO genres (id, name) VALUES (3, 'Детектив');
INSERT INTO genres (id, name) VALUES (4, 'Поэзия');
INSERT INTO genres (id, name) VALUES (5, 'Документальная литература');
INSERT INTO genres (id, name) VALUES (6, 'Фэнтези');
INSERT INTO genres (id, name) VALUES (7, 'Классика');
INSERT INTO genres (id, name) VALUES (8, 'Приключения');

-- Таблица: reviews
CREATE TABLE IF NOT EXISTS reviews (
	id INTEGER NOT NULL, 
	book_id INTEGER NOT NULL, 
	user_id INTEGER NOT NULL, 
	rating INTEGER NOT NULL, 
	text TEXT NOT NULL, 
	date_added TIMESTAMP NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(book_id) REFERENCES books (id), 
	FOREIGN KEY(user_id) REFERENCES users (id)
);
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (1, 11, 1, 0, 'WOW', '2024-06-03 16:58:14.006994');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (2, 11, 1, 5, 'GOOD', '2024-06-30 18:18:16.420816');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (3, 11, 1, 5, 'COOLLL', '2024-06-06 18:18:23.872246');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (4, 9, 1, 3, 'OMG', '2024-06-05 18:33:09.327917');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (6, 11, 3, 5, 'LMAO', '2024-06-15 20:57:52.608747');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (7, 5, 1, 5, 'I LOVE IT', '2024-06-12 21:54:02.039271');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (8, 12, 1, 5, 'YEA', '2024-06-14 21:54:21.800747');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (9, 2, 1, 5, 'GOOD JOB', '2024-06-14 21:54:49.966955');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (10, 11, 3, 5, 'NICE TEE', '2024-06-11 10:26:08.965706');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (11, 16, 3, 5, 'haah', '2024-06-11 15:17:48.875874');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (12, 9, 3, 5, 'WOWWW', '2024-06-11 15:21:04.421878');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (13, 5, 5, 5, 'sedfasd', '2024-06-15 19:55:54.226661');
INSERT INTO reviews (id, book_id, user_id, rating, text, date_added) VALUES (14, 11, 8, 5, 'wdfgsdf', '2024-06-25 10:46:01.436906');

-- Таблица: roles
CREATE TABLE IF NOT EXISTS roles (
	id INTEGER NOT NULL, 
	name VARCHAR(50) NOT NULL, 
	description TEXT NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (name)
);
INSERT INTO roles (id, name, description) VALUES (1, 'admin', 'Администратор');
INSERT INTO roles (id, name, description) VALUES (2, 'moderator', 'Модератор');
INSERT INTO roles (id, name, description) VALUES (3, 'user', 'Пользователь');

-- Таблица: test
CREATE TABLE IF NOT EXISTS test (id INTEGER NOT NULL, title VARCHAR (255) NOT NULL, user_id INTEGER NOT NULL, PRIMARY KEY (id), FOREIGN KEY (user_id) REFERENCES users (id));
INSERT INTO test (id, title, user_id) VALUES (1, 'OLD', 1);
INSERT INTO test (id, title, user_id) VALUES (2, 'NOT OLD', 3);
INSERT INTO test (id, title, user_id) VALUES (3, 'NEWEST', 4);

-- Таблица: users
CREATE TABLE IF NOT EXISTS users (
	id INTEGER NOT NULL, 
	username VARCHAR(100) NOT NULL, 
	password VARCHAR(100) NOT NULL, 
	last_name VARCHAR(100) NOT NULL, 
	first_name VARCHAR(100) NOT NULL, 
	middle_name VARCHAR(100), 
	role_id INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(role_id) REFERENCES roles (id), 
	UNIQUE (username)
);
INSERT INTO users (id, username, password, last_name, first_name, middle_name, role_id) VALUES (1, 'admin', 'scrypt:32768:8:1$I7EmQQOMTNlPGpLh$ce7fe06531edb0725a156bc3fed14e5a9aedc6d2cc438f500802f741e25961941040107de78c68a0a9cb02053e374213cb10620d24879958797237aa372f5ce4', 'Админов', 'Админ', NULL, 1);
INSERT INTO users (id, username, password, last_name, first_name, middle_name, role_id) VALUES (2, 'moderator', 'scrypt:32768:8:1$ZzUWZFnVtuRnPFNx$970625a81d0a3a7c9a244234e7474cc3f378f697788fcbe8877e71ee096139504833adca9a41000b31164f6f25ffcc91f767dc918c7676dd36ef838be635755d', 'Модер', 'Атор', NULL, 2);
INSERT INTO users (id, username, password, last_name, first_name, middle_name, role_id) VALUES (3, 'user', 'scrypt:32768:8:1$3f7EWOwNEVAwyd24$c942029ea37e9ec5108161918acc803f896ceb0b2d46282404ac98fcb7610c275f688cfad1b872e2138c863e3a9e7205b89fbf3d31acf30f376424a07f38dd61', 'Юзер', 'Юзер', NULL, 3);
INSERT INTO users (id, username, password, last_name, first_name, middle_name, role_id) VALUES (4, 'user1', 'pbkdf2:sha256:600000$Ovr0rimXY3PWRtAy$8aac1a5073bf73886d3c10fef5640a854515f34686459379002e614f2e1b0a55', 'dd', 'dd', 'dd', 3);
INSERT INTO users (id, username, password, last_name, first_name, middle_name, role_id) VALUES (5, 'login', 'pbkdf2:sha256:600000$xw7qj9XuzVK7pqjn$caccf23c841c8d41a2da7ccd0bfee767636cd84f21cf764c673dc580a61519d1', 'adsf', 'asfas', 'asd', 3);
INSERT INTO users (id, username, password, last_name, first_name, middle_name, role_id) VALUES (6, 'loginsds', 'pbkdf2:sha256:600000$Ya4FQZlpUtXk7IXj$06bee3d11b8857795c611636ca56b52f18e530d7d5fde8f373d0d4080a4ec2b2', 'asdf', 'asd', 'ddd', 3);
INSERT INTO users (id, username, password, last_name, first_name, middle_name, role_id) VALUES (7, 'user1ads', 'pbkdf2:sha256:600000$K0GYXQ8osvOAgoyf$0c0c45496f3408003ef7d326f5f84240f5bb1d962b1f624e5cf4301d039154a2', 'фыва', 'фыва', 'фыва', 3);
INSERT INTO users (id, username, password, last_name, first_name, middle_name, role_id) VALUES (8, 'qwerty', 'pbkdf2:sha256:600000$jltADgHVkUNyVmzU$31adf6c116774c7aab0e6a92b4a27c3b7ee02f34e52929ae1073a0180888e261', 'qwe', 'qwe', 'qwe', 1);
INSERT INTO users (id, username, password, last_name, first_name, middle_name, role_id) VALUES (9, 'qwerty1', 'pbkdf2:sha256:600000$hjElDPd0FKu1Y97c$ec92a06471314e333bc46c975821bf81d4cf169e904ddd35c35dc08237e96ae4', 'qwe1', 'qwe1', 'qwe1', 2);
INSERT INTO users (id, username, password, last_name, first_name, middle_name, role_id) VALUES (10, 'qwerty12', 'pbkdf2:sha256:600000$VvaVoczNeR81gkXb$9eb3e8636436d7bd3e87d29fd481fae584c24b2682480f116aef5cf77c74961d', 'qwe12', 'qwe12', 'qwe12', 3);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
