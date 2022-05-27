-- --------------------------------------------------------
-- Хост:                         192.168.10.10
-- Версия сервера:               8.0.28-0ubuntu0.20.04.3 - (Ubuntu)
-- Операционная система:         Linux
-- HeidiSQL Версия:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных basicdecor
CREATE DATABASE IF NOT EXISTS `basicdecor` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `basicdecor`;

-- Дамп структуры для таблица basicdecor.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы basicdecor.failed_jobs: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Дамп структуры для таблица basicdecor.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы basicdecor.migrations: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_05_26_093829_create_tasks_table', 2),
	(6, '2022_05_26_095524_del_key_field_tasks_table', 3),
	(7, '2022_05_26_095713_add_key_field_tasks_table', 4),
	(8, '2022_05_26_102633_del_task_name_field_tasks_table', 5),
	(9, '2022_05_26_102736_add_task_name_field_tasks_table', 6),
	(10, '2022_05_26_212131_add_comment_field_tasks_table', 7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Дамп структуры для таблица basicdecor.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы basicdecor.password_resets: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Дамп структуры для таблица basicdecor.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы basicdecor.personal_access_tokens: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Дамп структуры для таблица basicdecor.tasks
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('новая','в работе','выполнена','ошибка') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'новая',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tasks_key_unique` (`key`),
  UNIQUE KEY `tasks_task_name_unique` (`task_name`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы basicdecor.tasks: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` (`id`, `user_id`, `user_name`, `status`, `created_at`, `updated_at`, `key`, `task_name`, `comment`) VALUES
	(40, 4, 'Jack', 'новая', '2022-05-27 00:18:59', '2022-05-27 00:18:59', '129ec203-a05b-4ac9-a6ef-7d7b2650077a', 'починить машину', NULL),
	(41, 4, 'Jack', 'выполнена', '2022-05-27 00:19:08', '2022-05-27 00:24:33', '0f60c364-056a-489e-9812-c19117047aa0', 'выучить уроки', 'в процессе'),
	(42, 4, 'Jack', 'выполнена', '2022-05-27 00:19:18', '2022-05-27 00:23:07', '4655bdc1-b8d5-4166-8c6f-4c462786383d', 'настроить компьютер', 'сделано'),
	(43, 4, 'Jack', 'ошибка', '2022-05-27 00:19:24', '2022-05-27 00:19:55', '6a1a799a-1d81-4500-989b-9d6004265d62', 'встреча', 'ERROR: не работает'),
	(44, 5, 'Konstantin', 'новая', '2022-05-27 00:21:09', '2022-05-27 00:21:09', '1e70a2b4-05b4-4444-a179-bfdcdd09feb6', 'тест 1', NULL),
	(45, 5, 'Konstantin', 'новая', '2022-05-27 00:21:16', '2022-05-27 00:21:16', '04027eb6-80be-4a51-84cb-0eda0a49e064', 'тест 2', NULL),
	(46, 5, 'Konstantin', 'в работе', '2022-05-27 00:21:26', '2022-05-27 00:24:37', 'a3c1ab08-d43f-49f1-8bbf-d3700cb13c6a', 'доделать задание', NULL),
	(47, 5, 'Konstantin', 'новая', '2022-05-27 00:21:34', '2022-05-27 00:21:34', '5a7f39f6-7d36-4b10-beab-25beac31dd26', 'пройти обучение', NULL),
	(48, 5, 'Konstantin', 'новая', '2022-05-27 00:21:44', '2022-05-27 00:21:44', '6afcd2c1-afea-4d03-a20f-d1b7d3c0f63e', 'повторить PHP', NULL),
	(49, 3, 'Alina', 'новая', '2022-05-27 00:23:38', '2022-05-27 00:23:38', '49a70a7a-9bfa-47ed-ad51-615dbac5ee91', 'поесть', NULL),
	(50, 3, 'Alina', 'новая', '2022-05-27 00:23:47', '2022-05-27 00:23:47', '0bf86ef7-6ab2-4743-a97a-b399fd9c9e2c', 'выучить песню', NULL),
	(51, 3, 'Alina', 'новая', '2022-05-27 00:23:55', '2022-05-27 00:23:55', '6a705df3-6453-40d5-841a-29da8f12478d', 'настроить CRM', NULL),
	(52, 3, 'Alina', 'новая', '2022-05-27 00:24:11', '2022-05-27 00:24:11', 'ca510229-0892-4197-b137-12f09b69b185', 'тест 3', NULL),
	(53, 3, 'Alina', 'в работе', '2022-05-27 00:24:21', '2022-05-27 00:24:41', 'fb7b9ee5-d9da-4010-b389-efc2ce532cc8', 'выучить английский язык', NULL),
	(54, 1, 'Ivan', 'новая', '2022-05-27 00:25:29', '2022-05-27 00:25:29', 'f9beb406-453f-4dbe-9356-09a4a6fb98b2', 'тест 4', NULL),
	(55, 2, 'Peter', 'новая', '2022-05-27 00:25:57', '2022-05-27 00:25:57', 'e3029aa6-5d1f-4c1f-9313-011863cd4858', 'настроить валидацию', NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;

-- Дамп структуры для таблица basicdecor.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы basicdecor.users: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Ivan', 'ivan@mail.ru', NULL, '$2y$10$338cjw6Llyz9yvJFYVkg7O6bXHms4hWFxMe28kTW8YnjxCsTK5pOC', NULL, '2022-05-26 13:51:48', '2022-05-26 13:51:48'),
	(2, 'Peter', 'peter@mail.ru', NULL, '$2y$10$XAgs6maXY31tRHWqtLzdIuCp7QNMsrLOQcP2FnpO/VlB4V3wii5om', NULL, '2022-05-26 13:52:18', '2022-05-26 13:52:18'),
	(3, 'Alina', 'alina@mail.ru', NULL, '$2y$10$DFWPM3RoqinrRsuSAAtZMeEiKu0p7NbzXFdEd67F9Zrulb8A8VlqG', NULL, '2022-05-26 15:33:48', '2022-05-26 15:33:48'),
	(4, 'Jack', 'jack@mail.ru', NULL, '$2y$10$dCNboVKyXvfY0Etoh/Vzz.g8G0hPomV91PFoC2EaLMmVLoGY1PlL.', NULL, '2022-05-27 00:11:39', '2022-05-27 00:11:39'),
	(5, 'Konstantin', 'konstantin@mail.ru', NULL, '$2y$10$yLfnXXj2Mfu0KxgT.pJMq.eps8h5DJEjXSDTLU3/t4S0RS3OxQgeS', NULL, '2022-05-27 00:20:55', '2022-05-27 00:20:55');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
