-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-02-2016 a las 08:24:45
-- Versión del servidor: 5.5.45-cll-lve
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `jaimeira_plataforma`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden` text NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modulo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `orden`, `nombre`, `creado`, `modulo_id`) VALUES
(1, 'a:4:{i:1;s:1:"1";i:2;s:1:"3";i:3;s:1:"2";i:4;s:1:"4";}', 'Curso de Elegir Moto', '2016-02-19 20:15:35', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE IF NOT EXISTS `modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `publico` tinyint(1) DEFAULT '1',
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `nombre`, `publico`, `creado`) VALUES
(1, 'Motos', 1, '2016-02-19 17:39:15'),
(2, 'Curso de pago', 0, '2016-02-20 15:57:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peticion_ver_recurso`
--

CREATE TABLE IF NOT EXISTS `peticion_ver_recurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `recurso_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `habilitado` tinyint(1) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='tabla que se usa cuando un usuario quiere ver el siguiente video y le dice al ad' AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `peticion_ver_recurso`
--

INSERT INTO `peticion_ver_recurso` (`id`, `curso_id`, `modulo_id`, `orden`, `recurso_id`, `usuario_id`, `habilitado`, `creado`) VALUES
(1, 1, 1, 2, 3, 1, NULL, '2016-02-20 13:05:22'),
(2, 1, 1, 2, 3, 1, NULL, '2016-02-20 13:16:53'),
(3, 1, 1, 3, 2, 1, NULL, '2016-02-20 13:19:30'),
(4, 1, 1, 4, 4, 1, NULL, '2016-02-20 13:20:39'),
(5, 1, 1, 2, 3, 1, NULL, '2016-02-20 13:26:22'),
(6, 1, 1, 3, 2, 1, NULL, '2016-02-20 13:27:40'),
(7, 1, 1, 4, 4, 1, NULL, '2016-02-20 13:28:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso`
--

CREATE TABLE IF NOT EXISTS `recurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `url` text NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `descripcion` text,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `recurso`
--

INSERT INTO `recurso` (`id`, `nombre`, `url`, `modulo_id`, `descripcion`, `creado`, `tipo`) VALUES
(1, '2015 GSXR 1000 Test Ride ', '<iframe width="854" height="480" src="https://www.youtube.com/embed/FesGIn-7k74" frameborder="0" allowfullscreen></iframe>', 1, 'Publicado el 22 ene. 2016\r\n\r\nPage for this motorcycle: http://www.ctpowersports.com/2015-Suz...\r\n\r\nVisit Central Texas Powersports in Georgetown to see this bike, and many more in person, and let me know what you guys would like to see me review next!\r\n\r\nTheAK47s Facebook: www.facebook.com/KawiBear636\r\n\r\n    Categoría\r\n        Automovilismo \r\n    Licencia\r\n        Licencia estándar de YouTube \r\n\r\n', '2016-02-19 18:29:53', 'YOUTUBE'),
(2, 'The YZF-R1 Has Arrived ', '<iframe width="854" height="480" src="https://www.youtube.com/embed/zEACrPbb4aI" frameborder="0" allowfullscreen></iframe>', 1, 'Publicado el 12 feb. 2016\r\n\r\nPata Yamaha Official WorldSBK Team’s Alex Lowes and Sylvain Guintoli were joined by GMT94 Yamaha Official EWC Team’s David Checa, Louis Rossi and Niccolò Canepa and YART Yamaha Official EWC Team’s Broc Parkes, Max Neukirchner and Iván Silva at a desolate Circuito de Velocidad to start their pre-season workout.', '2016-02-19 18:46:03', 'YOUTUBE'),
(3, '!!Best Burnout!! Super New Compilation 2015 (BMW.HONDA.Suzuki.Yamaha R1) ', '<iframe width="854" height="480" src="https://www.youtube.com/embed/pbB4yFAi5Ys" frameborder="0" allowfullscreen></iframe>', 1, '!!Best Burnout!! Super New Compilation 2015 (BMW.HONDA.Suzuki.Yamaha R1) Subscribe!!Best Burnout!! Super New Compilation 2016 (BMW.HONDA.Suzuki.Yamaha R1)\r\nMotorcycle stunt riding, often referred to as stunting, is a motorcycle sport characterized by stunts involving acrobatic maneuvering of the motorcycle and sometimes the rider. Common maneuvers in stunt riding include wheelies, stoppies, and burnouts. Sport bikes have become a common vehicle for stunts.', '2016-02-19 18:47:29', 'YOUTUBE'),
(4, 'GMT94 Yamaha Official EWC Team 2016 Preview Video ', '<iframe width="854" height="480" src="https://www.youtube.com/embed/yOLcFkNwSZY" frameborder="0" allowfullscreen></iframe>', 1, 'Publicado el 17 feb. 2016\r\n\r\nThe GMT94 Yamaha Official EWC Team shows off its new Endurance spec YZF-R1 in an all-action video.\r\n\r\nLast month David Checa, Louis Rossi and Niccolò Canepa took their new race machine to an empty Circuito de velocidad de Jerez de la Frontera to put it to the test.\r\n\r\nWith first hand experience of all that the 2016 YZF-R1 has to offer, the three riders and Team Manager Christophe Guyot give their thoughts on the bike''s potential for the upcoming FIM Endurance World Championship.', '2016-02-19 18:49:12', 'YOUTUBE'),
(6, 'Capitan a', '/files/upload/videos/2016_02_20_11_20_26_02_capitan_a[1].mp4', 1, 'Capitan a', '2016-02-20 15:50:26', 'VIDEO'),
(7, 'Capitan a (dia2)', '/files/upload/videos/2016_02_20_11_28_20_02_capitan_a[1].mp4', 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis explicabo illum provident voluptas, ad harum quam iusto, ut ducimus fugit suscipit tempore velit neque dolorum eos minus unde quaerat, inventore.', '2016-02-20 15:58:20', 'VIDEO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso_usuario_habilitado`
--

CREATE TABLE IF NOT EXISTS `recurso_usuario_habilitado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id` int(11) NOT NULL,
  `recurso_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `habilitado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='tabla que usare para guardar cuando un usuario ve un video o le da click para ve' AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `recurso_usuario_habilitado`
--

INSERT INTO `recurso_usuario_habilitado` (`id`, `curso_id`, `recurso_id`, `usuario_id`, `creado`, `habilitado`) VALUES
(8, 1, 4, 1, '2016-02-20 13:28:09', 1),
(7, 1, 2, 1, '2016-02-20 13:27:48', 1),
(6, 1, 3, 1, '2016-02-20 13:27:14', 1),
(5, 1, 1, 1, '2016-02-20 13:26:02', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `password`, `email`, `creado`) VALUES
(1, 'Jaime Irazabal', 'e01936b1de6cb5998e0067ddf23ff215', 'jaimeirazabal1@gmail.com', '2016-02-19 15:26:44'),
(2, 'admin', 'admin', 'admin@admin.com', '2016-02-19 16:47:27'),
(3, 'rafael ', 'ca385a1919294cc627081903fa38bdfb', 'rafael.a@hotmail.com', '2016-02-19 16:50:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_admin`
--

CREATE TABLE IF NOT EXISTS `usuario_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuario_admin`
--

INSERT INTO `usuario_admin` (`id`, `usuario_id`, `creado`) VALUES
(1, 1, '2016-02-20 12:33:53');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
