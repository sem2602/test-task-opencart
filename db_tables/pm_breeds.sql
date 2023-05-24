-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 24 2023 г., 17:13
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pets_oc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `pm_breeds`
--

CREATE TABLE `pm_breeds` (
  `id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `pm_breeds`
--

INSERT INTO `pm_breeds` (`id`, `pet_id`, `title`) VALUES
(1, 2, 'Абиссинская'),
(2, 2, 'Австралийский мист'),
(3, 2, 'Азиатская'),
(4, 3, 'Акита-ину'),
(5, 3, 'Алабай'),
(6, 3, 'Бернский зенненхунд'),
(7, 1, 'Среднеазиатская сухопутная'),
(8, 1, 'Американская болотная'),
(9, 1, 'Звездчатая сухопутная'),
(10, 4, 'Петушок'),
(11, 4, 'Скалярия'),
(12, 4, 'Анциструс');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `pm_breeds`
--
ALTER TABLE `pm_breeds`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `pm_breeds`
--
ALTER TABLE `pm_breeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
