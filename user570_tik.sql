-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 16 2020 г., 02:31
-- Версия сервера: 10.3.25-MariaDB-0+deb10u1
-- Версия PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `user570_tik`
--

-- --------------------------------------------------------

--
-- Структура таблицы `pks_player`
--

CREATE TABLE `pks_player` (
  `pid` int(10) NOT NULL,
  `plogin` varchar(50) NOT NULL DEFAULT '0',
  `ppassw` varchar(50) NOT NULL DEFAULT '0',
  `pemail` varchar(50) NOT NULL DEFAULT '0',
  `pfio` varchar(255) NOT NULL DEFAULT '0',
  `pdolzh` varchar(255) NOT NULL DEFAULT '0',
  `plastup` int(10) NOT NULL DEFAULT 0,
  `pstatus` int(10) NOT NULL DEFAULT 0,
  `pagent` varchar(255) NOT NULL DEFAULT '0',
  `pip` varchar(50) NOT NULL DEFAULT '0',
  `hotword` varchar(50) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pks_player`
--

INSERT INTO `pks_player` (`pid`, `plogin`, `ppassw`, `pemail`, `pfio`, `pdolzh`, `plastup`, `pstatus`, `pagent`, `pip`, `hotword`) VALUES
(1, '71000318', '6122', '0', 'Белоногов Илья Юрьевич', 'Программист', 1606761484, 1000, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '95.174.107.153', 'илья'),
(2, '71000111', '123456', '0', 'Соболев Еввгений Игоревич', 'Главный инженер', 1606761484, 1000, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '95.174.107.153', 'соболев'),
(23, '71000769', '123456', '0', 'Ягодкин Артём Николаевич', 'Зам.ген.дир. по безопасности', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.103 YaBrowser/18.7.1.920 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(24, '71000700', '123456', '0', 'Ласточкина Валерия Валерьевна', 'Техник I категории (секретарь)', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(25, '71000697', '123456', '0', 'Зимоглядов Павел Анатольевич', 'Водитель автомобиля', 0, 0, '0', '0', '0'),
(26, '71000008', '123456', '0', 'Ким Андрей Енсуевич', 'Зам.ген.дир. по экономике и финансам', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(27, '71000729', '123456', '0', 'Костыренко Дмитрий Алексеевич', 'Генеральный директор', 0, 0, '0', '0', '0'),
(28, '71000834', '123456', '0', 'Уланин Виктор Григорьевич', 'Бухгалтер II категории', 1606761484, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '95.174.107.153', 'виктор'),
(29, '71000016', '123456', '0', 'Зинченко Анна Николаевна', 'Заместитель главного бухгалтера', 0, 0, '0', '0', '0'),
(30, '71000018', '123456', '0', 'Калашникова Наталья Павловна', 'Бухгалтер I категории', 0, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.18362', '188.168.190.76', '0'),
(31, '71000017', '123456', '0', 'Кривошапкина Татьяна Александровна', 'Бухгалтер I категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(32, '71000453', '123456', '0', 'Лакшенко Зоя Юрьевна', 'Бухгалтер I категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(33, '71000403', '123456', '0', 'Носова Оксана Николаевна', 'Главный бухгалтер', 0, 0, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E)', '188.168.190.76', '0'),
(34, '71000317', '123456', '0', 'Ободова Наталия Игоревна', 'Бухгалтер II категории', 0, 0, '0', '0', '0'),
(35, '71000541', '123456', '0', 'Светова Светлана Валентиновна', 'Ведущий бухгалтер', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.76', '0'),
(36, '71000034', '123456', '0', 'Беседина Ирина Валерьевна', 'Бухгалтер I категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.76', '0'),
(37, '71000515', '123456', '0', 'Блохина Оксана Владимировна', 'Начальник сектора', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 YaBrowser/19.9.3.314 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(38, '71000611', '123456', '0', 'Олейникова Анна Владимировна', 'Ведущий бухгалтер', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(39, '71000593', '123456', '0', 'Севостьянова Ирина Вячеславовна', 'Ведущий бухгалтер', 1606491678, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0', '127.0.0.1', '0'),
(40, '71000796', '123456', '0', 'Деревцова Марина Ивановна', 'Начальник сектора', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 YaBrowser/18.9.1.954 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(41, '71000021', '123456', '0', 'Казакова Елена Александровна', 'Ведущий специалист по управ. персоналом', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 YaBrowser/18.9.0.3409 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(42, '71000331', '123456', '0', 'Коковкина Оксана Михайловна', 'Инженер по подготовке кадров II категор.', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 YaBrowser/17.10.1.1204 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(43, '71000004', '123456', '0', 'Королюк Олеся Александровна', 'Специалист по упр-нию персоналом I катег', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.103 YaBrowser/18.7.1.920 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(44, '71000628', '123456', '0', 'Буравченко Ирина Васильевна', 'Ведущий экономист', 0, 0, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', '188.168.190.74', '0'),
(45, '71000256', '123456', '0', 'Квон Маргарита', 'Начальник отдела', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.76', '0'),
(46, '71000684', '123456', '0', 'Ким Евгений Хвасикович', 'Экономист I категории', 0, 0, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', '188.168.190.76', '0'),
(47, '71000276', '123456', '0', 'Рим Юлия Зонуновна', 'Ведущий экономист', 1606491679, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0', '127.0.0.1', '0'),
(48, '71000262', '123456', '0', 'Хотиловская Наталья Юрьевна', 'Инженер по орг.и нормир.труда I категор.', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 YaBrowser/18.9.1.954 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(49, '71000010', '123456', '0', 'Черепанова Светлана Владимировна', 'Вед.инженер по организ.и нормиров.труда', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.76', '0'),
(50, '71000286', '123456', '0', 'Вагина Ольга Леонидовна', 'Ведущий инженер', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(51, '71000668', '123456', '0', 'Горбачева Елена Евгеньевна', 'Инженер I категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.76', '0'),
(52, '71000629', '123456', '0', 'Калачева Марина Александровна', 'Заведующий билетными кассами', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', '188.168.190.74', '0'),
(53, '71000693', '123456', '0', 'Ким Ден Ир', 'Инженер I категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 YaBrowser/18.9.0.3409 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(54, '71000298', '123456', '0', 'Мозговая Инна Леонидовна', 'Технолог I категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(55, '71000100', '123456', '0', 'Шамбаева Надежда Владимировна', 'Начальник отдела', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:80.0) Gecko/20100101 Firefox/80.0', '188.168.190.76', '0'),
(56, '654321', '654321', '0', 'Петрович Петр Алексеевич', 'Кладовщик', 1606761484, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '95.174.107.153', 'петрович'),
(57, '71000797', '123456', '0', 'Абрамова Ксения Васильевна', 'Слесарь', 1606761484, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '95.174.107.153', '0'),
(58, '71000794', '123456', '0', 'Анцупова Елена Юрьевна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 YaBrowser/16.10.1.1116 Yowser/2.5 Safari/537.36', '192.168.1.24', '0'),
(59, '71000295', '123456', '0', 'Атясов Евгений Александрович', 'Слесарь', 1606646394, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', '188.113.158.69', '0'),
(60, '71000073', '123456', '0', 'Беляева Елена Брониславовна', 'Слесарь', 0, 0, '0', '0', '0'),
(61, '71000260', '123456', '0', 'Богафо Екатерина Андреевна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 YaBrowser/20.4.3.257 Yowser/2.5 Safari/537.36', '188.168.190.76', '0'),
(62, '71000071', '123456', '0', 'Бойцова Наталья Васильевна', 'Слесарь', 0, 0, '0', '0', '0'),
(63, '71000708', '123456', '0', 'Большакова Оксана Леонидовна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 YaBrowser/16.10.1.1116 Yowser/2.5 Safari/537.36', '192.168.1.24', '0'),
(64, '71000351', '123456', '0', 'Горенкова Анна Викторовна', 'Слесарь', 0, 0, '0', '0', '0'),
(65, '71000328', '123456', '0', 'Давыдов Вячеслав Михайлович', 'Слесарь', 0, 0, '0', '0', '0'),
(66, '71000053', '123456', '0', 'Журавлева Любовь Николаевна', 'Слесарь', 0, 0, '0', '0', '0'),
(67, '71000063', '123456', '0', 'Зуева Евгения Александровна', 'Слесарь', 0, 0, '0', '0', '0'),
(68, '71000308', '123456', '0', 'Комарова Анна Петровна', 'Слесарь', 0, 0, '0', '0', '0'),
(69, '71000570', '123456', '0', 'Корчагин Константин Сергеевич', 'Слесарь', 0, 0, '0', '0', '0'),
(70, '71000807', '123456', '0', 'Кулагина Татьяна Геннадьевна', 'Слесарь', 0, 0, '0', '0', '0'),
(71, '71000258', '123456', '0', 'Куц Виктория Валерьевна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 YaBrowser/17.7.1.719 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(72, '71000653', '123456', '0', 'Ли Олег Енчерович', 'Слесарь', 0, 0, '0', '0', '0'),
(73, '71000227', '123456', '0', 'Логвинова Ирина Вениаминовна', 'Слесарь', 0, 0, '0', '0', '0'),
(74, '71000630', '123456', '0', 'Махина Елена Евгеньевна', 'Слесарь', 0, 0, '0', '0', '0'),
(75, '71000058', '123456', '0', 'Минченко Наталья Юрьевна', 'Слесарь', 0, 0, '0', '0', '0'),
(76, '71000559', '123456', '0', 'Пак Владимир Сантэевич', 'Слесарь', 0, 0, '0', '0', '0'),
(77, '71000687', '123456', '0', 'Пержинская Алина Николаевна', 'Слесарь', 0, 0, '0', '0', '0'),
(78, '71000747', '123456', '0', 'Петрова Ксения Игоревна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 YaBrowser/16.10.1.1116 Yowser/2.5 Safari/537.36', '192.168.1.24', '0'),
(79, '71000705', '123456', '0', 'Попок Ольга Анатольевна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 YaBrowser/16.10.1.1116 Yowser/2.5 Safari/537.36', '192.168.1.24', '0'),
(80, '71000225', '123456', '0', 'Пятковская Татьяна Викторовна', 'Слесарь', 0, 0, '0', '0', '0'),
(81, '71000066', '123456', '0', 'Ровняга Елена Ивановна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 YaBrowser/18.9.0.3467 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(82, '71000790', '123456', '0', 'Рязанцева Ирина Александровна', 'Слесарь', 0, 0, '0', '0', '0'),
(83, '71000059', '123456', '0', 'Семакина Елена Валерьевна', 'Слесарь', 0, 0, '0', '0', '0'),
(84, '71000107', '123456', '0', 'Стаецкий Игорь Васильевич', 'Слесарь', 0, 0, '0', '0', '0'),
(85, '71000685', '123456', '0', 'Сулаймонов Фаррух Аслонбоевич', 'Слесарь', 0, 0, '0', '0', '0'),
(86, '71000682', '123456', '0', 'Титова Анастасия Федоровна', 'Слесарь', 0, 0, '0', '0', '0'),
(87, '71000064', '123456', '0', 'Черникова Елена Юрьевна', 'Слесарь', 0, 0, '0', '0', '0'),
(88, '71000748', '123456', '0', 'Шамин Илья Андреевич', 'Водитель электро- и автотележки', 0, 0, '0', '0', '0'),
(89, '71000513', '123456', '0', 'Яхвак Светлана Андреевна', 'Слесарь', 0, 0, '0', '0', '0'),
(90, '71000089', '123456', '0', 'Шилина Любовь Борисовна', 'Слесарь', 0, 0, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', '80.83.234.169', '0'),
(91, '71000040', '123456', '0', 'Врагова Евгения Анатольевна', 'Слесарь', 0, 0, '0', '0', '0'),
(92, '71000128', '123456', '0', 'Им Наталья Петровна', 'Слесарь', 0, 0, '0', '0', '0'),
(93, '71000129', '123456', '0', 'Левашова Галия Айсановна', 'Слесарь', 0, 0, '0', '0', '0'),
(94, '71000127', '123456', '0', 'Попова Светлана Владимировна', 'Слесарь', 0, 0, '0', '0', '0'),
(95, '71000126', '123456', '0', 'Фадеева Елена Ивановна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '80.83.238.22', '0'),
(96, '71000381', '123456', '0', 'Артемова Елена Ярославльевна', 'Слесарь', 0, 0, '0', '0', '0'),
(97, '71000264', '123456', '0', 'Швецова Анастасия Александровна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', '188.168.190.74', '0'),
(98, '71000698', '123456', '0', 'Комарова Ирина Сергеевна', 'Слесарь', 0, 0, '0', '0', '0'),
(99, '71000092', '123456', '0', 'Кузнецова Римма Викторовна', 'Слесарь', 0, 0, '0', '0', '0'),
(100, '71000632', '123456', '0', 'Черепанова Елена Викторовна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', '188.168.190.74', '0'),
(101, '71000619', '123456', '0', 'Яблоновский Алексей Александрович', 'Приемосдатчик груза и багажа', 0, 0, '0', '0', '0'),
(102, '71000096', '123456', '0', 'Задохина Марина Алексеевна', 'Слесарь', 0, 0, '0', '0', '0'),
(103, '71000095', '123456', '0', 'Робак Наталья Андреевна', 'Слесарь', 0, 0, '0', '0', '0'),
(104, '71000097', '123456', '0', 'Суручан Ольга Александровна', 'Приемосдатчик груза и багажа', 0, 0, '0', '0', '0'),
(105, '71000094', '123456', '0', 'Сухарева Татьяна Валерьевна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '80.83.234.196', '0'),
(106, '71000284', '123456', '0', 'Токарева Наталья Сергеевна', 'Слесарь', 0, 0, '0', '0', '0'),
(107, '71000751', '123456', '0', 'Дударева Наталья Анатольевна', 'Слесарь', 0, 0, '0', '0', '0'),
(108, '71000831', '123456', '0', 'Кудрявцева Илона Николаевна', 'Слесарь', 0, 0, '0', '0', '0'),
(109, '71000647', '123456', '0', 'Наумова Оксана Викторовна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', '188.168.190.74', '0'),
(110, '71000348', '123456', '0', 'Павлюк Ксения Владимировна', 'Слесарь', 0, 0, '0', '0', '0'),
(111, '71000572', '123456', '0', 'Пономарева Евгения Сергеевна', 'Слесарь', 0, 0, '0', '0', '0'),
(112, '71000681', '123456', '0', 'Сусоева Надежда Леонидовна', 'Слесарь', 0, 0, '0', '0', '0'),
(113, '71000504', '123456', '0', 'Удотова Ольга Владимировна', 'Слесарь', 0, 0, '0', '0', '0'),
(114, '71000810', '123456', '0', 'Шинкевич Ольга Николаевна', 'Слесарь', 0, 0, '0', '0', '0'),
(115, '71000098', '123456', '0', 'Григорьева Светлана Петровна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '80.83.224.13', '0'),
(116, '71000141', '123456', '0', 'Воробьева Елена Сергеевна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(117, '71000037', '123456', '0', 'Гаврилова Татьяна Ивановна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.103 YaBrowser/18.7.1.920 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(118, '71000202', '123456', '0', 'Иванова Виктория Николаевна', 'Слесарь', 0, 0, '0', '0', '0'),
(119, '71000142', '123456', '0', 'Кирсанова Алена Анатольевна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 YaBrowser/17.7.1.791 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(120, '71000036', '123456', '0', 'Никифорова Татьяна Васильевна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', '188.168.190.74', '0'),
(121, '71000143', '123456', '0', 'Рахманова Елена Павловна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(122, '71000145', '123456', '0', 'Ширимет Оксана Вадимовна', 'Слесарь', 0, 0, '0', '0', '0'),
(123, '71000011', '123456', '0', 'Бридицкий Сергей Николаевич', 'Инженер I категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.76', '0'),
(124, '71000014', '123456', '0', 'Бутенко Олеся Вячеславовна', 'Специалист по охране труда I категории', 0, 0, '0', '0', '0'),
(125, '71000224', '123456', '0', 'Гребенщикова Лариса Зиновьевна', 'Инженер I категории', 0, 0, '0', '0', '0'),
(126, '71000535', '123456', '0', 'Калинченко Василий Геннадьевич', 'Технолог I категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.76', '0'),
(127, '71000641', '123456', '0', 'Лукин Дмитрий Сергеевич', 'Инженер I категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.103 YaBrowser/18.7.1.920 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(128, '71000814', '123456', '0', 'Назаров Александр Владимирович', 'Инженер II категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 YaBrowser/18.9.0.3409 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(129, '71000013', '123456', '0', 'Рокотов Алексей Вадимович', 'Начальник отдела (на транспорте,в связи)', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(130, '71000809', '123456', '0', 'Туник Наталья Анатольевна', 'Инженер I категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 YaBrowser/18.9.0.3409 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(131, '71000679', '123456', '0', 'Андрианова Юлия Алексеевна', 'Слесарь', 0, 0, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 YaBrowser/19.10.3.281 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(132, '71000386', '123456', '0', 'Барков Денис Николаевич', 'Начальник пункта', 0, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:81.0) Gecko/20100101 Firefox/81.0', '91.212.81.159', '0'),
(133, '71000707', '123456', '0', 'Бойко Елена Викторовна', 'Кладовщик', 0, 0, '0', '0', '0'),
(134, '71000793', '123456', '0', 'Давыдова Юлия Владимировна', 'Кладовщик', 0, 0, '0', '0', '0'),
(135, '71000387', '123456', '0', 'Долженко Евгений Вячеславович', 'Мастер участка производства', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 YaBrowser/18.9.1.954 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(136, '71000400', '123456', '0', 'Завалова Анжела Григорьевна', 'Мастер участка производства', 0, 0, '0', '0', '0'),
(137, '71000646', '123456', '0', 'Кац Валерия Сергеевна', 'Кладовщик', 0, 0, '0', '0', '0'),
(138, '71000483', '123456', '0', 'Мубаракшина Татьяна Хамитовна', 'Мастер участка производства', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(139, '71000327', '123456', '0', 'Лукина Елена Олеговна', 'Кладовщик', 0, 0, '0', '0', '0'),
(140, '71000150', '123456', '0', 'Лукина Ирина Ивановна', 'Кладовщик', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 YaBrowser/17.7.1.791 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(141, '71000598', '123456', '0', 'Полищук Анна Александровна', 'Заведующий складом', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 YaBrowser/17.7.1.719 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(142, '71000296', '123456', '0', 'Швец Татьяна Владимировна', 'Кладовщик', 0, 0, '0', '0', '0'),
(143, '71000289', '123456', '0', 'Безрукова Елена Юрьевна', 'Мастер участка производства', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 YaBrowser/18.9.1.954 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(144, '71000376', '123456', '0', 'Голева Ирина Викторовна', 'Инженер I категории', 0, 0, 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(145, '71000514', '123456', '0', 'Иванова Ксения Сергеевна', 'Юрисконсульт I категории', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.76', '0'),
(146, '71000294', '123456', '0', 'Митрофанова Марина Николаевна', 'Начальник сектора', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 YaBrowser/18.9.0.3409 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(147, '71000573', '123456', '0', 'Яцкова Александра Сергеевна', 'Ведущий юрисконсульт', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 YaBrowser/19.9.3.315 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(148, '71000106', '123456', '0', 'Афанасьева Светлана Дмитриевна', 'Мастер участка производства', 1606575591, 0, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.114 YaBrowser/20.11.1.86 Yowser/2.5 Safari/537.36', '81.4.208.251', '0'),
(149, '71000101', '123456', '0', 'Баринова Ирина Алексеевна', 'Мастер участка производства', 0, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:81.0) Gecko/20100101 Firefox/81.0', '91.212.81.159', '0'),
(150, '71000329', '123456', '0', 'Колосова Ирина Валентиновна', 'Мастер участка производства', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 YaBrowser/17.10.1.1204 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(151, '71000057', '123456', '0', 'Малышева Оксана Геннадьевна', 'Мастер участка производства', 0, 0, '0', '0', '0'),
(152, '71000102', '123456', '0', 'Миронова Надежда Анатольевна', 'Мастер участка производства', 0, 0, '0', '0', '0'),
(153, '71000105', '123456', '0', 'Павлова Евгения Анатольевна', 'Мастер участка производства', 0, 0, '0', '0', '0'),
(154, '71000144', '123456', '0', 'Салова Анастасия Леонидовна', 'Заведующий группой', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 YaBrowser/19.6.3.185 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(155, '71000103', '123456', '0', 'Усманова Виолетта Валерьевна', 'Мастер участка производства', 0, 0, '0', '0', '0'),
(156, '71000640', '123456', '0', 'Кованова Галина Васильевна', 'Бухгалтер и.о.', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(157, '71000710', '123456', '0', 'Сукманов Игорь Иванович', 'Мастер участка производства', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 YaBrowser/17.1.0.2034 Yowser/2.5 Safari/537.36', '188.168.190.74', '0'),
(158, 'Пассажир', 'Пассажир', '0', 'Самостоятельное бронирование на сайте', 'Мастер участка производства', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 YaBrowser/16.10.1.1116 Yowser/2.5 Safari/537.36', '192.168.1.24', '0'),
(159, '71000851', '123456', '0', 'Бова Евгений Петрович', 'Мастер участка производства', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '188.168.190.74', '0'),
(160, '71000870', '71000870', '0', 'Куприянова Светлана Павловна', 'Мастер участка производства', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 YaBrowser/20.4.3.257 Yowser/2.5 Safari/537.36', '188.168.190.76', '0'),
(161, '71000861', '123456', '0', 'Кузнецова Татьяна владимировна', 'Бухгалтер', 0, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 YaBrowser/17.7.1.719 Yowser/2.5 Safari/537.36', '188.168.190.74', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `pks_subject`
--

CREATE TABLE `pks_subject` (
  `sid` int(11) NOT NULL,
  `stitle` varchar(255) NOT NULL DEFAULT '0',
  `playerid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pks_subject`
--

INSERT INTO `pks_subject` (`sid`, `stitle`, `playerid`) VALUES
(1, 'Организационное - Общее', 1),
(2, 'Организационное - Провести инструктаж на участке', 1),
(3, 'Организационное - Соблюдать требования безопасности', 1),
(4, 'Организационное - Ожидание комиссии', 1),
(5, 'Технологическое - Общее', 1),
(6, 'Технологическое - Объем производства продукции на будущую смену', 1),
(7, 'Технологическое - Провести замеры геометрии', 1),
(8, 'Технологическое - Провести визуальный осмотр, контроль', 1),
(9, 'Техническое - Общее', 1),
(10, 'Техническое - Следить за работой', 1),
(11, 'Техническое - Провести замену', 1),
(12, 'Техническое - Дополнительный контроль', 1),
(13, 'Техническое - Изменение режима работы установки', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `pks_tickets`
--

CREATE TABLE `pks_tickets` (
  `id` int(11) UNSIGNED NOT NULL,
  `prioritet` int(4) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `user_comment` text DEFAULT NULL,
  `worker_comment` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'open',
  `progress` int(11) DEFAULT 0,
  `last_update` datetime DEFAULT NULL,
  `ok_date` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `pks_tickets`
--

INSERT INTO `pks_tickets` (`id`, `prioritet`, `user_id`, `worker_id`, `date_create`, `subject`, `user_comment`, `worker_comment`, `status`, `progress`, `last_update`, `ok_date`, `parent_id`) VALUES
(1562, 1, 1, 56, '2020-11-28 02:51:09', '13', 'Выдать 100 гр. полония Мастеру участка Евремову В.Г.', 'Выдал', 'close', 100, '2020-11-28 02:52:33', '2020-11-28 02:52:33', 0),
(1563, 2, 56, 1, '2020-11-28 02:53:40', '4', 'Прошу предоставить тару для хранения плутония-238', 'тара для плутония предоставлено', 'close', 100, '2020-11-28 05:10:49', '2020-11-28 05:10:49', 0),
(1564, 1, 1, 56, '2020-11-28 01:38:49', '1', 'петрович ступай на склад получить товар', NULL, 'open', 0, NULL, NULL, 0),
(1565, 1, 1, 56, '2020-11-28 01:42:56', '1', 'петрович ступай на склад ещё раз и получи ещё раз товар', NULL, 'open', 0, NULL, NULL, 0),
(1566, 1, 1, 56, '2020-11-28 01:48:26', '1', 'петрович ступай на склад ещё раз и получи ещё раз товар', NULL, 'open', 0, NULL, NULL, 0),
(1567, 1, 1, 1, '2020-11-28 02:01:05', '1', 'илья сделай сайт для хака тона', 'все сделано', 'close', 100, '2020-11-28 05:13:29', '2020-11-28 05:13:29', 0),
(1568, 1, 1, 56, '2020-11-28 02:01:55', '1', 'петрович разгрузить грузовик положить всё на склад и ты ходи попить чай', '', 'close', 50, '2020-11-28 05:37:42', NULL, 0),
(1569, 1, 1, 1, '2020-11-28 02:02:57', '1', 'илья хватит работать приказываю пойти поспать', '', 'close', 100, '2020-11-28 03:58:35', '2020-11-28 03:58:35', 0),
(1570, 1, 1, 1, '2020-11-28 02:04:32', '1', 'илья ехал грека через реку видит грека в реке рак сунул грека руку в реку рак за руку греку цап', '', 'close', 100, '2020-11-28 04:03:29', '2020-11-28 04:03:29', 0),
(1571, 1, 1, 56, '2020-11-28 02:05:37', '1', 'петрович хватит работать заходи на чай', NULL, 'open', 0, NULL, NULL, 0),
(1574, 1, 1, 56, '2020-11-28 02:11:19', '1', 'петрович налей чаю', 'Сделано!', 'close', 100, '2020-11-28 06:13:45', '2020-11-28 06:13:45', 0),
(1575, 1, 1, 1, '2020-11-28 02:13:40', '1', 'илья хватит работать', '', 'close', 100, '2020-11-28 03:58:26', '2020-11-28 03:58:26', 0),
(1581, 1, 56, 1, '2020-11-28 05:23:35', '1', 'илья не работает ричи вик', 'подчинил', 'close', 100, '2020-11-28 05:26:32', '2020-11-28 05:26:32', 0),
(1576, 1, 1, 1, '2020-11-28 04:00:59', '1', 'я развелись', '', 'close', 100, '2020-11-28 04:03:14', '2020-11-28 04:03:14', 0),
(1577, 1, 1, 56, '2020-11-28 04:39:15', '1', 'петрович для вас новое поручение загляните в журнал', NULL, 'open', 0, NULL, NULL, 0),
(1578, 1, 1, 56, '2020-11-28 04:39:54', '1', 'петрович я переделал систему звукозаписи посмотри', NULL, 'open', 0, NULL, NULL, 0),
(1579, 1, 1, 56, '2020-11-28 04:44:08', '1', 'петрович для вас новое поручение загляните в журнал', NULL, 'open', 0, NULL, NULL, 0),
(1580, 1, 1, 56, '2020-11-28 04:45:05', '1', 'петрович для вас новое поручение загляните в журнал', '', 'close', 50, '2020-11-28 05:37:07', NULL, 0),
(1582, 1, 56, 1, '2020-11-28 05:25:35', '1', 'илья налей чай', 'петрович для вас всегда пожалуйста', 'close', 100, '2020-11-28 05:26:11', '2020-11-28 05:26:11', 0),
(1583, 1, 1, 1, '2020-11-28 05:26:56', '1', '', 'неправильно сформированное задание я его отменяю', 'close', 99, '2020-11-28 05:43:04', NULL, 0),
(1584, 1, 1, 56, '2020-11-28 05:27:23', '1', 'петрович на складе нужно разгрузить грузовик', 'петрович пока ты ходил мы сами все сделали', 'close', 99, '2020-11-28 05:43:44', NULL, 0),
(1585, 1, 56, 1, '2020-11-28 05:39:31', '1', 'илья не работает отказ по задачам', '', 'close', 99, '2020-11-28 05:39:46', NULL, 0),
(1586, 1, 1, 2, '2020-11-28 05:44:55', '1', 'соболев протестируйте систему', NULL, 'open', 0, NULL, NULL, 0),
(1587, 1, 1, 28, '2020-11-28 05:48:21', '1', 'виктор за бэкап те сервера', NULL, 'open', 0, NULL, NULL, 0),
(1588, 1, 1, 1, '2020-11-28 07:35:34', '1', 'илья ильич лиц', 'я все одеял', 'close', 100, '2020-11-28 07:36:28', '2020-11-28 07:36:28', 0),
(1589, 3, 1, 1, '2020-11-28 10:49:00', '10', 'Это первое поручения, вот его и будем пересылать.', NULL, 'open', 0, NULL, NULL, 0),
(1590, 1, 1, 1, '2020-11-28 11:45:12', '1', '', 'по ошибке, поэтому отмена', 'close', 99, '2020-11-28 15:56:48', NULL, 0),
(1591, 1, 1, 1, '2020-11-28 11:45:19', '1', '', 'по ошибке, поэтому отмена', 'close', 99, '2020-11-28 15:56:35', NULL, 0),
(1592, 1, 1, 28, '2020-11-28 12:19:50', '1', 'виктор перепоручил для вас', NULL, 'open', 0, NULL, NULL, 1589),
(1614, 1, 1, 28, '2020-11-28 14:56:48', '1', 'виктор поменяли лампочки', 'лампочек нет', 'close', 99, '2020-11-28 14:57:26', NULL, 0),
(1611, 3, 148, 59, '2020-11-28 14:47:17', '11', 'Йцукен гшщзх', NULL, 'open', 0, NULL, NULL, 0),
(1610, 1, 1, 1, '2020-11-28 14:39:02', '1', 'и создать задачу', NULL, 'open', 0, NULL, NULL, 0),
(1609, 1, 1, 1, '2020-11-28 14:39:02', '1', 'и создать задачу', 'готово', 'close', 100, '2020-11-28 14:39:38', '2020-11-28 14:39:38', 0),
(1605, 1, 1, 56, '2020-11-28 13:53:38', '1', 'петрович сходи на склад забери муку соль сахар', NULL, 'open', 0, NULL, NULL, 0),
(1615, 1, 1, 28, '2020-11-28 14:56:56', '1', 'виктор поменяли лампочки', NULL, 'open', 0, NULL, NULL, 0),
(1616, 3, 148, 57, '2020-11-28 14:59:51', '11', '12334545645645', NULL, 'open', 0, NULL, NULL, 0),
(1617, 1, 1, 57, '2020-11-28 15:00:28', '13', '123456', '00000', 'close', 99, '2020-11-28 15:40:52', NULL, 0),
(1633, 1, 1, 1, '2020-11-30 14:37:49', '1', '', NULL, 'open', 0, NULL, NULL, 0),
(1632, 1, 1, 1, '2020-11-30 14:37:09', '13', '123213', '213213', 'close', 100, '2020-11-30 14:37:19', '2020-11-30 14:37:19', 0),
(1631, 1, 1, 56, '2020-11-29 10:40:40', '1', 'петрович необходимо поставить станок', NULL, 'open', 0, NULL, NULL, 0),
(1624, 2, 2, 1, '2020-11-28 20:24:10', '1', 'Test\r\nJURY\r\n\r\nGood luck!', '', 'close', 100, '2020-11-29 07:00:39', '2020-11-29 07:00:39', 0),
(1630, 2, 59, 1, '2020-11-29 10:39:54', '13', 'олрполролро', NULL, 'open', 0, NULL, NULL, 0),
(1627, 1, 1, 56, '2020-11-29 06:38:01', '1', 'петрович пойди на завод', NULL, 'open', 0, NULL, NULL, 0),
(1628, 1, 1, 56, '2020-11-29 06:38:04', '1', 'петрович пойди на завод', NULL, 'open', 0, NULL, NULL, 0),
(1629, 1, 1, 1, '2020-11-29 07:00:43', '13', 'фцвфцв', '', 'close', 99, '2020-11-29 10:41:37', NULL, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `pks_player`
--
ALTER TABLE `pks_player`
  ADD PRIMARY KEY (`pid`);

--
-- Индексы таблицы `pks_subject`
--
ALTER TABLE `pks_subject`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `pks_tickets`
--
ALTER TABLE `pks_tickets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `pks_player`
--
ALTER TABLE `pks_player`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT для таблицы `pks_subject`
--
ALTER TABLE `pks_subject`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `pks_tickets`
--
ALTER TABLE `pks_tickets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1634;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
