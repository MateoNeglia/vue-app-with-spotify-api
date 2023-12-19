SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
-- -----------------------------------------------------
-- Schema id21660595_apdm_neglia_mateo
-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `id21660595_apdm_neglia_mateo` DEFAULT CHARACTER SET utf8mb4 ;
USE `id21660595_apdm_neglia_mateo` ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

-- -----------------------------------------------------
-- Table `id21660595_apdm_neglia_mateo`.`users`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `id21660595_apdm_neglia_mateo`.`users` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_role` TINYINT(3),
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `name` VARCHAR(65) NULL,
  `last_name` VARCHAR(65) NULL,
  `nick_name` VARCHAR(65) NULL,  
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `user_role`, `email`, `password`, `name`, `last_name`, `nick_name`) VALUES
(1, 1, 'admin@lchoice.com', '$2y$10$tu7ws/uOl6fWYu8jtBfKBeELaBmKCBrm287DUklmNd.iTsb8npyo2', 'Admin', 'Admin', 'Admin'),
(2, 3, 'nullcheck@lchoice.com', '$2y$10$VkwDjpTtGltdF9vag./B4uUpp41D4f39cmXlvWsFgiwUzCxiaUo76', NULL, NULL, NULL),
(3, 2, 'mod1@lchoice.com', '$2y$10$UTCPQwtBAygCuW3h7KuA8eR.cc5/eynizowc3.uepjL1rfMOZkwCa', 'Mod1', 'Mod1', 'Mod1'),
(4, 2, 'mod2@lchoice.com', '$2y$10$p3KXQp.aYcwIxgWruXFT.eFjSX1AtKd0EvWKUIQljfNhBJIEtqI86', 'Mod2', 'Mod2', 'Mod2'),
(5, 2, 'mod3@lchoice.com', '$2y$10$W1JN7wpF6aM7eA51da1SKOBwJUEDUbub5IiCTd4jS39PPuuqaFnwa', 'Mod3', 'Mod3', 'Mod3'),
(6, 3, 'testmail@gmail.com', '$2y$10$p3KXQp.aYcwIxgWruXFT.eFjSX1AtKd0EvWKUIQljfNhBJIEtqI86', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album_ids`
--

-- -----------------------------------------------------
-- Table `id21660595_apdm_neglia_mateo`.`album_ids`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `id21660595_apdm_neglia_mateo`.`album_ids` ( 
  `album_charid` VARCHAR(255) NOT NULL,  
ENGINE = InnoDB;


--
-- Volcado de datos para la tabla `album_ids`
--

INSERT INTO `album_ids` (`album_id`, `album_charid`) VALUES
('3dPZH0a4kjtjq6Hm53BS9S'),
('1P9AuGH530Oy9JEW5XVuxo'),
('1ZxChDw03SUFGUz0RC8A8M'),
('3dck2tBxGfxj9m3CguDgjb'),
('0kBfgEilUFCMIQY5IOjG4t'),
('180jTzor4W2MQ9HW5h5Fh4'),
('2ANVost0y2y52ema1E9xAZ'),
('2Yyh46jU6QOZ4OSCRMwaon'),
('1LVYzlSY6TdYsxm7KGBcY4'),
('6P7vL4vGgyrD7q9VR9BcnV')
;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

-- -----------------------------------------------------
-- Table `id21660595_apdm_neglia_mateo`.`users`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `id21660595_apdm_neglia_mateo`.`reviews` (
  `review_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,  
  `artist` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `name` VARCHAR(65) NULL,
  `rank` VARCHAR(65) NULL,
  `selected` VARCHAR(255) NOT NULL,  
  `review` VARCHAR(500) NOT NULL,
  `isMailsOn` BOOLEAN NOT NULL,
  `wannaListenMore` BOOLEAN NOT NULL,
  `wannaBuy` VARCHAR(65) NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `reviews` (`artist`, `email`, `name`, `rank`, `selected`, `review`, `isMailsOn`, `wannaListenMore`, `wannaBuy`) VALUES
  ('Jethro Tull', 'testmail@test.com', 'David', 'Gold', 'Thick as a Brick', '¿Qué más puedo decir sobre esta obra maestra? Este disco me introdujo a la flauta traversa en el rock cuando era chico e Ian Anderson es uno de los pilares del Rock Progresivo, sinceramente una calidad única y una joya que merece más reconocimiento.', false, true, 'true'),
  ('Michael Jackson', 'testmail2@test.com', 'Matt', 'Diamond', 'Thriller', 'Este fue el álbum que me hizo amar el pop, ¿ya no lo hacen como antes no? Si bien la figura pública de MJ fue controversial a lo largo de los años, veo a esta creación como un antes y un después en la música moderna.', true, true, 'true'),
  ('Metallica', 'testmail4@test.com', 'Juan', 'Silver', 'Metallica(Remastered 2021)', 'Creo que este fue el disco que convirtió a todo el desconfiado del género del metal a un fiel seguidor en su momento, esta es una puerta de entrada a muchas otras grandes bandas.', true, true, 'true');



-- --------------------------------------------------------