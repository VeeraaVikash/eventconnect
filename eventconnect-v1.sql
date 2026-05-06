-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 14, 2026 at 06:48 PM
-- Server version: 8.0.45-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventconnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `preloaded_events`
--

CREATE TABLE `preloaded_events` (
  `id` int NOT NULL,
  `sl_no` varchar(50) DEFAULT NULL,
  `event_date` varchar(50) DEFAULT NULL,
  `event_month` varchar(50) DEFAULT NULL,
  `activity` text,
  `budget` varchar(100) DEFAULT NULL,
  `university_contribution` varchar(100) DEFAULT NULL,
  `convener` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

CREATE TABLE `proposals` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `past_events` text,
  `total_expected_participants` int NOT NULL,
  `participant_categories` varchar(255) NOT NULL,
  `status` enum('Pending','Approved','Rejected','Review','Cancelled','Rescheduled') DEFAULT 'Pending',
  `hod_remarks` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `other_details` text,
  `student_categories` varchar(255) DEFAULT NULL,
  `report_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_budgets`
--

CREATE TABLE `proposal_budgets` (
  `id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `cost_per_unit` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_financials`
--

CREATE TABLE `proposal_financials` (
  `id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `university_fund` decimal(10,2) DEFAULT '0.00',
  `registration_fund` decimal(10,2) DEFAULT '0.00',
  `sponsorship_fund` decimal(10,2) DEFAULT '0.00',
  `other_sources` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_guests`
--

CREATE TABLE `proposal_guests` (
  `id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `address` text,
  `contact_number` varchar(50) DEFAULT NULL,
  `pan_number` varchar(50) DEFAULT NULL,
  `reason_for_inviting` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_messages`
--

CREATE TABLE `proposal_messages` (
  `id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `sender_id` int NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_sponsors`
--

CREATE TABLE `proposal_sponsors` (
  `id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `sponsor_category` varchar(255) DEFAULT NULL,
  `amount_contributed` decimal(10,2) DEFAULT NULL,
  `reward_perk` text,
  `mode` varchar(255) DEFAULT NULL,
  `about` text,
  `benefits` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_travel_accomm`
--

CREATE TABLE `proposal_travel_accomm` (
  `id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `hotel_name_address` text,
  `accommodation_days` int DEFAULT NULL,
  `who_arranges` enum('SRM','Guest') DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `number_of_trips` int DEFAULT NULL,
  `who_provides` enum('SRM','Guest') DEFAULT NULL,
  `travel_address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT 'Computing Technologies',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `designation` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `preloaded_events`
--
ALTER TABLE `preloaded_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `proposal_budgets`
--
ALTER TABLE `proposal_budgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_id` (`proposal_id`);

--
-- Indexes for table `proposal_financials`
--
ALTER TABLE `proposal_financials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_id` (`proposal_id`);

--
-- Indexes for table `proposal_guests`
--
ALTER TABLE `proposal_guests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_id` (`proposal_id`);

--
-- Indexes for table `proposal_messages`
--
ALTER TABLE `proposal_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_id` (`proposal_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `proposal_sponsors`
--
ALTER TABLE `proposal_sponsors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_id` (`proposal_id`);

--
-- Indexes for table `proposal_travel_accomm`
--
ALTER TABLE `proposal_travel_accomm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_id` (`proposal_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `preloaded_events`
--
ALTER TABLE `preloaded_events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposals`
--
ALTER TABLE `proposals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_budgets`
--
ALTER TABLE `proposal_budgets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_financials`
--
ALTER TABLE `proposal_financials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_guests`
--
ALTER TABLE `proposal_guests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_messages`
--
ALTER TABLE `proposal_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_sponsors`
--
ALTER TABLE `proposal_sponsors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_travel_accomm`
--
ALTER TABLE `proposal_travel_accomm`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `proposals`
--
ALTER TABLE `proposals`
  ADD CONSTRAINT `proposals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proposal_budgets`
--
ALTER TABLE `proposal_budgets`
  ADD CONSTRAINT `proposal_budgets_ibfk_1` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proposal_financials`
--
ALTER TABLE `proposal_financials`
  ADD CONSTRAINT `proposal_financials_ibfk_1` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proposal_guests`
--
ALTER TABLE `proposal_guests`
  ADD CONSTRAINT `proposal_guests_ibfk_1` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proposal_messages`
--
ALTER TABLE `proposal_messages`
  ADD CONSTRAINT `proposal_messages_ibfk_1` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `proposal_messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proposal_sponsors`
--
ALTER TABLE `proposal_sponsors`
  ADD CONSTRAINT `proposal_sponsors_ibfk_1` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proposal_travel_accomm`
--
ALTER TABLE `proposal_travel_accomm`
  ADD CONSTRAINT `proposal_travel_accomm_ibfk_1` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
