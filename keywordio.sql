-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2022 at 02:39 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keywordio`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_app_addbook`
--

CREATE TABLE `adminpanel_app_addbook` (
  `id` bigint(20) NOT NULL,
  `bookname` varchar(255) DEFAULT NULL,
  `bookcoverimage` varchar(100) DEFAULT NULL,
  `bookauthorname` varchar(255) DEFAULT NULL,
  `bookdescription` longtext DEFAULT NULL,
  `bookpdf` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_app_addbook`
--

INSERT INTO `adminpanel_app_addbook` (`id`, `bookname`, `bookcoverimage`, `bookauthorname`, `bookdescription`, `bookpdf`) VALUES
(1, 'Chhava', 'coverimage/chhava.jpg', 'Continental Prakashan', 'Chhatrapati Shambhaji Maharaj Story.', 'contentpdf/chhava.jpg'),
(2, 'Sambhaji', 'coverimage/Shambhaji.jpg', 'Mehta Publishing House Pune', 'Sambhaji Maharaj Story', 'contentpdf/Shambhaji.jpg'),
(3, 'Shriman Yogi', 'coverimage/Shriman_Yogi.jpg', 'Mehta Publishing House', 'Chhatrapati Maharaj Story', 'contentpdf/Shriman_Yogi.jpg'),
(4, 'Chanakya Neeti', 'coverimage/Chanakya_Neeti.jpg', 'Diamond Pocket Books', 'Chanakya Neeti with Chanakya Sutra Sahit', 'contentpdf/Chanakya_Neeti.jpg'),
(5, 'You Can', 'coverimage/you_can.jpg', 'Fingerprint! Publishing', 'Do you often wonder whether you really have it in you to accomplish your goals, to win over obstacles, and to succeed in life?', 'contentpdf/you_can.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_app_user`
--

CREATE TABLE `adminpanel_app_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminpanel_app_user`
--

INSERT INTO `adminpanel_app_user` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`) VALUES
(1, 'pbkdf2_sha256$320000$nWLEjP4Z04D6k7RnEs8g1s$n4qdBgNmeSmz0ZoyW5dyRwwGqQzlYVcpRoY6rD9cfoo=', '2022-06-05 11:15:32.483267', 1, '', '', 1, 1, '2022-06-05 11:15:18.514300', 'admin@gmail.com'),
(2, 'pbkdf2_sha256$320000$1nP6LlP2WFnLka8CBfpvCF$xPMSlKNGxxUjQZIPQ8EUuzy7RYBYxETsKmuUzgMUApQ=', '2022-06-05 11:35:09.402083', 0, 'Pankaj', 'Sajekar', 0, 1, '2022-06-05 11:34:40.239453', 'Pankaj@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_app_user_groups`
--

CREATE TABLE `adminpanel_app_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminpanel_app_user_user_permissions`
--

CREATE TABLE `adminpanel_app_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add add book', 6, 'add_addbook'),
(22, 'Can change add book', 6, 'change_addbook'),
(23, 'Can delete add book', 6, 'delete_addbook'),
(24, 'Can view add book', 6, 'view_addbook'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(6, 'adminpanel_app', 'addbook'),
(7, 'adminpanel_app', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-05 09:50:33.858189'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-06-05 09:50:33.960622'),
(3, 'auth', '0001_initial', '2022-06-05 09:50:34.378587'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-06-05 09:50:34.461403'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-06-05 09:50:34.473401'),
(6, 'auth', '0004_alter_user_username_opts', '2022-06-05 09:50:34.486536'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-06-05 09:50:34.502266'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-06-05 09:50:34.508909'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-06-05 09:50:34.520924'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-06-05 09:50:34.534910'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-06-05 09:50:34.547039'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-06-05 09:50:34.578229'),
(13, 'auth', '0011_update_proxy_permissions', '2022-06-05 09:50:34.593233'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-06-05 09:50:34.608470'),
(15, 'adminpanel_app', '0001_initial', '2022-06-05 09:50:35.072358'),
(16, 'admin', '0001_initial', '2022-06-05 09:50:35.253435'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-06-05 09:50:35.274448'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-05 09:50:35.289274'),
(19, 'adminpanel_app', '0002_alter_addbook_bookcoverimage_and_more', '2022-06-05 09:50:35.303934'),
(20, 'adminpanel_app', '0003_alter_addbook_bookpdf', '2022-06-05 09:50:35.315220'),
(21, 'sessions', '0001_initial', '2022-06-05 09:50:35.377729');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('po2d56hfj59ckkat1bqe8osbqs7nffbl', '.eJxVjMsOwiAUBf-FtSFQ4FZduu83NPcBUjWQlHZl_HfbpAvdnpk5bzXiuuRxbXEeJ1FX1anT70bIz1h2IA8s96q5lmWeSO-KPmjTQ5X4uh3u30HGlrcaxTKmECBBkuTAOGM9E1u-UHAQpO8RDDiGyF6C35iDjs6SjI1ARn2-_EE4Tw:1nxoXF:FX2seJOkXouePVzfm8z4t1cLDSA2-NlDfwVzt3Sd9CA', '2022-06-19 11:35:09.409082');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminpanel_app_addbook`
--
ALTER TABLE `adminpanel_app_addbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminpanel_app_user`
--
ALTER TABLE `adminpanel_app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `adminpanel_app_user_groups`
--
ALTER TABLE `adminpanel_app_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `adminpanel_app_user_groups_user_id_group_id_817f9d50_uniq` (`user_id`,`group_id`),
  ADD KEY `adminpanel_app_user_groups_group_id_f400f931_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `adminpanel_app_user_user_permissions`
--
ALTER TABLE `adminpanel_app_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `adminpanel_app_user_user_user_id_permission_id_0579e557_uniq` (`user_id`,`permission_id`),
  ADD KEY `adminpanel_app_user__permission_id_76ff1bc6_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_adminpanel_app_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminpanel_app_addbook`
--
ALTER TABLE `adminpanel_app_addbook`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `adminpanel_app_user`
--
ALTER TABLE `adminpanel_app_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `adminpanel_app_user_groups`
--
ALTER TABLE `adminpanel_app_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminpanel_app_user_user_permissions`
--
ALTER TABLE `adminpanel_app_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminpanel_app_user_groups`
--
ALTER TABLE `adminpanel_app_user_groups`
  ADD CONSTRAINT `adminpanel_app_user__user_id_f3c2e860_fk_adminpane` FOREIGN KEY (`user_id`) REFERENCES `adminpanel_app_user` (`id`),
  ADD CONSTRAINT `adminpanel_app_user_groups_group_id_f400f931_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `adminpanel_app_user_user_permissions`
--
ALTER TABLE `adminpanel_app_user_user_permissions`
  ADD CONSTRAINT `adminpanel_app_user__permission_id_76ff1bc6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `adminpanel_app_user__user_id_a5ea88f5_fk_adminpane` FOREIGN KEY (`user_id`) REFERENCES `adminpanel_app_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_adminpanel_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `adminpanel_app_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
