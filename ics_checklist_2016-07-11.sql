-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 11, 2016 at 10:54 AM
-- Server version: 5.5.49-0+deb8u1
-- PHP Version: 5.6.20-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ics_checklist`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_devices`
--
CREATE TABLE IF NOT EXISTS `all_devices` (
`id` int(11)
,`vendor` varchar(255)
,`series` varchar(300)
,`name` varchar(500)
,`type` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE IF NOT EXISTS `devices` (
`id` int(11) NOT NULL,
  `vendor` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `vendor`, `series`, `name`) VALUES
(1, 1, 1, 'S615'),
(2, 5, 2, '5120'),
(3, 1, 3, 'S7-1500');

-- --------------------------------------------------------

--
-- Table structure for table `device_services`
--

CREATE TABLE IF NOT EXISTS `device_services` (
  `device` int(11) NOT NULL,
  `service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `device_services`
--

INSERT INTO `device_services` (`device`, `service`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(1, 7),
(1, 10),
(1, 11),
(1, 12),
(3, 13);

-- --------------------------------------------------------

--
-- Table structure for table `device_types`
--

CREATE TABLE IF NOT EXISTS `device_types` (
  `device` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `device_types`
--

INSERT INTO `device_types` (`device`, `type`) VALUES
(1, 1),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `protocols`
--

CREATE TABLE IF NOT EXISTS `protocols` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `protocols`
--

INSERT INTO `protocols` (`id`, `name`) VALUES
(24, 'DNS'),
(5, 'FTP'),
(1, 'HTTP'),
(2, 'HTTPS'),
(15, 'IKEv2'),
(17, 'IMAP'),
(11, 'L2TP'),
(23, 'NTP'),
(10, 'OpenVPN'),
(18, 'POP3'),
(13, 'PPTP'),
(22, 'RDP'),
(26, 'S7'),
(6, 'SFTP'),
(9, 'SMB'),
(16, 'SMTP'),
(4, 'SNMP'),
(7, 'SSH'),
(3, 'SSL'),
(14, 'SSTP'),
(25, 'Syslog'),
(20, 'TeamViewer'),
(19, 'Telnet'),
(21, 'VNC'),
(8, 'WebDAV');

-- --------------------------------------------------------

--
-- Table structure for table `protocol_warnings`
--

CREATE TABLE IF NOT EXISTS `protocol_warnings` (
  `protocol` int(11) NOT NULL,
  `warning` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `protocol_warnings`
--

INSERT INTO `protocol_warnings` (`protocol`, `warning`) VALUES
(4, 1),
(19, 2),
(26, 3);

-- --------------------------------------------------------

--
-- Table structure for table `recommendations`
--

CREATE TABLE IF NOT EXISTS `recommendations` (
`id` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `recommendations`
--

INSERT INTO `recommendations` (`id`, `name`, `description`) VALUES
(1, 'SNMP Versie', 'Schakel alle SNMP versies onder verse 3 uit.'),
(2, 'SNMP Communtiy String', 'Gebruik een sterke community string (wachtwoord) voor de SNMP service.'),
(3, 'SNMP Uitschakelen', 'Schakel SNMP uit indien deze niet gebruikt wordt.'),
(4, 'S7 Toegang Beperken', 'Beperk netwerktoegang tot S7 toestellen door bv. netwerksegmentatie toe te passen mbv subnets of VLANs.');

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE IF NOT EXISTS `series` (
`id` int(11) NOT NULL,
  `vendor` int(11) NOT NULL,
  `name` varchar(300) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`id`, `vendor`, `name`) VALUES
(1, 1, 'SCALANCE'),
(2, 5, 'CX'),
(3, 1, 'SIMATIC');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`) VALUES
(12, 'Log client'),
(3, 'Mail client'),
(4, 'Mail server'),
(7, 'NTP client'),
(11, 'Name service'),
(10, 'Remote management'),
(8, 'SNMP client'),
(2, 'SNMP server'),
(13, 'Siemens S7'),
(6, 'Time server'),
(5, 'VPN server'),
(1, 'Web server');

-- --------------------------------------------------------

--
-- Table structure for table `service_protocols`
--

CREATE TABLE IF NOT EXISTS `service_protocols` (
  `service` int(11) NOT NULL,
  `protocol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `service_protocols`
--

INSERT INTO `service_protocols` (`service`, `protocol`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(3, 16),
(3, 17),
(3, 18),
(4, 16),
(4, 17),
(4, 18),
(5, 10),
(5, 11),
(5, 13),
(5, 14),
(5, 15),
(6, 23),
(7, 23),
(8, 4),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(11, 24),
(12, 25),
(13, 26);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE IF NOT EXISTS `types` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`) VALUES
(2, 'Access Point'),
(4, 'Controller'),
(8, 'Drive'),
(12, 'Firewall'),
(5, 'HMI'),
(9, 'IO Device'),
(3, 'PLC'),
(1, 'Router'),
(6, 'SCADA'),
(7, 'Switch');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE IF NOT EXISTS `vendors` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`) VALUES
(5, 'Beckhoff Automation'),
(2, 'Cisco'),
(6, 'Lenze'),
(3, 'Phoenix Contact'),
(7, 'SEW'),
(4, 'Schneider Electric'),
(1, 'Siemens');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_series`
--

CREATE TABLE IF NOT EXISTS `vendor_series` (
  `vendor` int(11) NOT NULL,
  `series` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `vendor_series`
--

INSERT INTO `vendor_series` (`vendor`, `series`) VALUES
(1, 1),
(1, 3),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `warnings`
--

CREATE TABLE IF NOT EXISTS `warnings` (
`id` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `warnings`
--

INSERT INTO `warnings` (`id`, `name`, `description`) VALUES
(1, 'SNMP Informatie', 'Foutieve implementatie van SNMP zorgt voor mogelijke vrijgave van administratieve data zoals gebruikersnamen en wachtwoorden.'),
(2, 'Telnet Gebruik', 'Telnet stuurt gebruikersgegevens in cleartext door. Een lokale aanvaller kan de gegevens eenvoudig uitlezen.'),
(3, 'S7 Authenticatie', 'Siemens S7 protocol laat toe netwerkinstellingen zonder authenticatie vanop afstand te configureren.');

-- --------------------------------------------------------

--
-- Table structure for table `warning_recommendations`
--

CREATE TABLE IF NOT EXISTS `warning_recommendations` (
  `warning` int(11) NOT NULL,
  `recommendation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `warning_recommendations`
--

INSERT INTO `warning_recommendations` (`warning`, `recommendation`) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Structure for view `all_devices`
--
DROP TABLE IF EXISTS `all_devices`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_devices` AS select `d`.`id` AS `id`,`v`.`name` AS `vendor`,`s`.`name` AS `series`,`d`.`name` AS `name`,`t`.`name` AS `type` from (((((`devices` `d` join `vendors` `v` on((`d`.`vendor` = `v`.`id`))) join `device_types` `dt` on((`d`.`id` = `dt`.`device`))) join `types` `t` on((`t`.`id` = `dt`.`type`))) join `vendor_series` `vs` on((`vs`.`vendor` = `v`.`id`))) join `series` `s` on((`s`.`id` = `vs`.`series`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
 ADD PRIMARY KEY (`id`), ADD KEY `vendor` (`vendor`), ADD KEY `series` (`series`);

--
-- Indexes for table `device_services`
--
ALTER TABLE `device_services`
 ADD KEY `device` (`device`,`service`), ADD KEY `service` (`service`);

--
-- Indexes for table `device_types`
--
ALTER TABLE `device_types`
 ADD KEY `device` (`device`,`type`), ADD KEY `type` (`type`);

--
-- Indexes for table `protocols`
--
ALTER TABLE `protocols`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `protocol_warnings`
--
ALTER TABLE `protocol_warnings`
 ADD KEY `protocol` (`protocol`,`warning`), ADD KEY `warning` (`warning`);

--
-- Indexes for table `recommendations`
--
ALTER TABLE `recommendations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
 ADD PRIMARY KEY (`id`), ADD KEY `vendor` (`vendor`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `service_protocols`
--
ALTER TABLE `service_protocols`
 ADD KEY `service` (`service`), ADD KEY `protocol` (`protocol`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `vendor_series`
--
ALTER TABLE `vendor_series`
 ADD KEY `vendor` (`vendor`,`series`), ADD KEY `series` (`series`);

--
-- Indexes for table `warnings`
--
ALTER TABLE `warnings`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warning_recommendations`
--
ALTER TABLE `warning_recommendations`
 ADD KEY `warning` (`warning`,`recommendation`), ADD KEY `recommendation` (`recommendation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `protocols`
--
ALTER TABLE `protocols`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `recommendations`
--
ALTER TABLE `recommendations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `series`
--
ALTER TABLE `series`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `warnings`
--
ALTER TABLE `warnings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
ADD CONSTRAINT `fk_series_devices` FOREIGN KEY (`series`) REFERENCES `series` (`id`),
ADD CONSTRAINT `fk_vendor_devices` FOREIGN KEY (`vendor`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `device_services`
--
ALTER TABLE `device_services`
ADD CONSTRAINT `fk_device_deviceservices` FOREIGN KEY (`device`) REFERENCES `devices` (`id`),
ADD CONSTRAINT `fk_service_deviceservices` FOREIGN KEY (`service`) REFERENCES `services` (`id`);

--
-- Constraints for table `device_types`
--
ALTER TABLE `device_types`
ADD CONSTRAINT `fk_device_devicetypes` FOREIGN KEY (`device`) REFERENCES `devices` (`id`),
ADD CONSTRAINT `fk_type_devicetypes` FOREIGN KEY (`type`) REFERENCES `types` (`id`);

--
-- Constraints for table `protocol_warnings`
--
ALTER TABLE `protocol_warnings`
ADD CONSTRAINT `fk_protocol_protocolwarnings` FOREIGN KEY (`protocol`) REFERENCES `protocols` (`id`),
ADD CONSTRAINT `fk_warning_protocolwarnings` FOREIGN KEY (`warning`) REFERENCES `warnings` (`id`);

--
-- Constraints for table `series`
--
ALTER TABLE `series`
ADD CONSTRAINT `fk_vendor_series` FOREIGN KEY (`vendor`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `service_protocols`
--
ALTER TABLE `service_protocols`
ADD CONSTRAINT `fk_protocol_serviceprotocols` FOREIGN KEY (`protocol`) REFERENCES `protocols` (`id`),
ADD CONSTRAINT `fk_service_serviceprotocols` FOREIGN KEY (`service`) REFERENCES `services` (`id`);

--
-- Constraints for table `vendor_series`
--
ALTER TABLE `vendor_series`
ADD CONSTRAINT `fk_series_vendorseries` FOREIGN KEY (`series`) REFERENCES `series` (`id`),
ADD CONSTRAINT `fk_vendor_vendorseries` FOREIGN KEY (`vendor`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `warning_recommendations`
--
ALTER TABLE `warning_recommendations`
ADD CONSTRAINT `fk_recommendation_warningrecommendations` FOREIGN KEY (`recommendation`) REFERENCES `recommendations` (`id`),
ADD CONSTRAINT `fk_warning_warningrecommendations` FOREIGN KEY (`warning`) REFERENCES `warnings` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
