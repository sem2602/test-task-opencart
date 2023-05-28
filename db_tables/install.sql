START TRANSACTION;

CREATE TABLE pm_pets (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title varchar(255) NOT NULL
);

INSERT INTO `pm_pets` (`id`, `title`) VALUES
(1, 'Черепаха'),
(2, 'Кошка'),
(3, 'Собака'),
(4, 'Рыбы');


CREATE TABLE `pm_breeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `pet_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
);

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


CREATE TABLE `pm_customer_pets` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `customer_id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `breed_id` int(11) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
);







COMMIT;