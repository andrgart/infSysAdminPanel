-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 11 2023 г., 05:05
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `car_service_gc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL COMMENT 'id машины',
  `car_country` varchar(256) NOT NULL COMMENT 'страна изготовитель',
  `car_brand` varchar(256) NOT NULL COMMENT 'марка машины',
  `car_model` varchar(256) NOT NULL COMMENT 'модель машины',
  `availability` varchar(256) NOT NULL COMMENT 'наличие',
  `price` int(11) NOT NULL COMMENT 'цена машины'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='таблица с основной информацией о машине';

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`car_id`, `car_country`, `car_brand`, `car_model`, `availability`, `price`) VALUES
(2, 'Russia', 'neMoskvich', 'model_2.0', 'no', 2000000),
(3, 'Uganda', 'horse', 'aplleone', 'yes', 100),
(5, 'Turckmenistan', 'GreenCar', 'GurbanMobil', 'YES', 500000),
(6, 'Wololostan', 'WololoCar', 'mindControl', 'no', 463728),
(7, 'Wololostan', 'WololoCar', 'mindControl', 'no', 4638298),
(8, 'Wololostan3', 'WololoCar3', 'mindControl3', 'no3', 46382983),
(33, 'asd', 'asd', 'asd', 'asd', 100),
(35, 'asefae', 'asefef', 'asefasef', 'asefasef', 2147483647),
(36, 'Rus', 'Moshina', 'Lol v.20', 'yes', 15000000),
(38, 'RusUya', 'Moshina321', 'Lol v.21', 'no', 14000000);

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `c_id` int(11) NOT NULL COMMENT 'id клиента',
  `c_fname` varchar(256) NOT NULL COMMENT 'имя ',
  `c_sname` varchar(256) NOT NULL COMMENT 'фамилия ',
  `c_mname` varchar(256) NOT NULL COMMENT 'отчество ',
  `passport_serial` int(11) NOT NULL COMMENT 'серия паспорта ',
  `passport_number` int(11) NOT NULL COMMENT 'номер паспорта ',
  `address` varchar(256) NOT NULL COMMENT 'адрес',
  `phone` varchar(50) NOT NULL COMMENT 'номер телефона '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='информация о клиенте';

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`c_id`, `c_fname`, `c_sname`, `c_mname`, `passport_serial`, `passport_number`, `address`, `phone`) VALUES
(1, 'Oleg', 'Olegov', 'Olegovich', 14, 17, 'Russia', '88005553535'),
(4, 'test1', 'testov1', 'testovich1', 1, 1, 'Testostan', 'ttt ee ss ttt'),
(5, 'test2', 'testov2', 'testovich2', 2, 2, 'Testostan2', 'ttt ee ss ttt 2'),
(6, 'test3', 'testov3', 'testovich3', 3, 3, 'Testostan3', 'ttt ee ss ttt 3'),
(24, 'test4', 'testov4', 'testovich4', 13, 13, 'Rasia', '11111111111111111');

-- --------------------------------------------------------

--
-- Структура таблицы `client_cars`
--

CREATE TABLE `client_cars` (
  `client_car_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL COMMENT 'id машины',
  `c_id` int(11) NOT NULL COMMENT 'id клиента',
  `delivery` varchar(256) NOT NULL COMMENT 'доставка (да, нет)',
  `payment_method` varchar(256) NOT NULL COMMENT 'вид оплаты (нал, безнал)(кредит, разовая оплата)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client_cars`
--

INSERT INTO `client_cars` (`client_car_id`, `car_id`, `c_id`, `delivery`, `payment_method`) VALUES
(3, 5, 1, 'yes', 'beznal'),
(4, 5, 4, 'yes', 'nalichnie'),
(7, 6, 2, 'yes', 'nalichnuye');

-- --------------------------------------------------------

--
-- Структура таблицы `tech_data`
--

CREATE TABLE `tech_data` (
  `tech_data_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL COMMENT 'id машины',
  `body_type` varchar(256) NOT NULL COMMENT 'тип кузова',
  `door_num` int(11) NOT NULL COMMENT 'количество дверей',
  `seats_num` int(11) NOT NULL COMMENT 'количество мест',
  `engine_type` varchar(256) NOT NULL COMMENT 'тип двигателя',
  `engine_layout` varchar(256) NOT NULL COMMENT 'расположение двигателя',
  `engine_displacement` varchar(256) NOT NULL COMMENT 'рабочий объём двигателя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='технические данные машины';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`c_id`);

--
-- Индексы таблицы `client_cars`
--
ALTER TABLE `client_cars`
  ADD PRIMARY KEY (`client_car_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Индексы таблицы `tech_data`
--
ALTER TABLE `tech_data`
  ADD PRIMARY KEY (`tech_data_id`),
  ADD KEY `car_id` (`car_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id машины', AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id клиента', AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `client_cars`
--
ALTER TABLE `client_cars`
  MODIFY `client_car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `tech_data`
--
ALTER TABLE `tech_data`
  MODIFY `tech_data_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `client_cars`
--
ALTER TABLE `client_cars`
  ADD CONSTRAINT `client_cars_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `client_cars_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `client` (`c_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tech_data`
--
ALTER TABLE `tech_data`
  ADD CONSTRAINT `tech_data_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
