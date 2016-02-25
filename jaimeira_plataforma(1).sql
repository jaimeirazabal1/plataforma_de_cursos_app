-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-02-2016 a las 14:59:00
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
-- Estructura de tabla para la tabla `boton_pago`
--

CREATE TABLE IF NOT EXISTS `boton_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `boton` text NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `boton_pago`
--

INSERT INTO `boton_pago` (`id`, `descripcion`, `boton`, `modulo_id`, `creado`, `usuario_id`) VALUES
(1, 'Boton creado para probar', ' <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">\r\n   <input type="hidden" name="cmd" value="_s-xclick">\r\n    <input type="hidden" name="hosted_button_id" value="GHBCMLBLBMCA8">\r\n   <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">\r\n   <img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">\r\n  </form>', 2, '2016-02-23 15:56:05', 2),
(2, 'Boton de pago de prueba', '  <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">\r\n   <input type="hidden" name="cmd" value="_s-xclick">\r\n    <input type="hidden" name="hosted_button_id" value="GHBCMLBLBMCA8">\r\n   <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">\r\n   <img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">\r\n  </form>', 3, '2016-02-23 16:02:19', 2);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `orden`, `nombre`, `creado`, `modulo_id`) VALUES
(1, 'a:4:{i:1;s:1:"1";i:2;s:1:"3";i:3;s:1:"2";i:4;s:1:"4";}', 'Curso de Elegir Moto', '2016-02-19 20:15:35', 1),
(2, 'a:3:{i:8;s:1:"3";i:9;s:1:"2";i:10;s:1:"1";}', 'Curso de modulo avanzado', '2016-02-23 16:12:35', 3),
(3, 'a:1:{i:12;s:1:"1";}', 'Curso Básico de Poderes Mentales', '2016-02-23 18:31:18', 5),
(4, 'a:8:{i:18;s:1:"7";i:19;s:1:"8";i:16;s:1:"5";i:17;s:1:"6";i:15;s:1:"4";i:12;s:1:"1";i:13;s:1:"2";i:14;s:1:"3";}', 'Prueba', '2016-02-23 18:44:23', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos_usuario`
--

CREATE TABLE IF NOT EXISTS `fotos_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `fotos_usuario`
--

INSERT INTO `fotos_usuario` (`id`, `usuario_id`, `url`, `creado`) VALUES
(1, 1, '/files/upload/imagenes_perfil/2016_02_21_09_32_32_jaime_freud.jpg', '2016-02-21 08:32:32'),
(2, 1, '/files/upload/imagenes_perfil/2016_02_21_09_33_24_jaime_freud.jpg', '2016-02-21 08:33:24'),
(3, 1, '/files/upload/imagenes_perfil/2016_02_21_09_34_48_jaime_freud.jpg', '2016-02-21 08:34:48'),
(4, 3, '/files/upload/imagenes_perfil/2016_02_23_13_40_21_157px-mago_zorro.jpg', '2016-02-23 18:10:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE IF NOT EXISTS `mensaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado_por` int(11) NOT NULL,
  `para` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `asunto` varchar(200) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`id`, `creado_por`, `para`, `mensaje`, `asunto`, `creado`) VALUES
(1, 2, 1, 'Hola, bienvenido al sistema, soy el administrador...', 'Bienvenida al sistema', '2016-02-21 09:27:28'),
(2, 1, 1, 'Te doy las gracias por ofrecerme la bienvenida', 'Gracias', '2016-02-21 10:28:05'),
(3, 1, 1, 'Te doy las gracias por ofrecerme la bienvenida', 'Gracias', '2016-02-21 10:48:24'),
(4, 1, 1, 'Te doy las gracias por ofrecerme la bienvenida', 'Gracias', '2016-02-21 10:48:56'),
(5, 2, 3, 'Hola Rafael estoy probando la plataforma de mensajes', 'Saludos', '2016-02-21 11:21:24'),
(6, 3, 2, 'Hola que tal, todo bien, funciona perfecto', 'Respuesta', '2016-02-21 11:22:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE IF NOT EXISTS `modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `publico` tinyint(1) DEFAULT '1',
  `orden` int(11) DEFAULT NULL,
  `boton_pago` text,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `nombre`, `publico`, `orden`, `boton_pago`, `creado`) VALUES
(5, 'Gratuito', 1, 1, NULL, '2016-02-23 18:17:18'),
(4, 'Avanzado', 0, 2, NULL, '2016-02-23 18:17:09');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='tabla que se usa cuando un usuario quiere ver el siguiente video y le dice al ad' AUTO_INCREMENT=11 ;

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
(7, 1, 1, 4, 4, 1, NULL, '2016-02-20 13:28:01'),
(8, 1, 1, 4, 4, 1, NULL, '2016-02-21 23:27:53'),
(9, 1, 1, 4, 4, 1, NULL, '2016-02-21 23:28:26'),
(10, 1, 1, 4, 4, 1, NULL, '2016-02-21 23:31:05');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `recurso`
--

INSERT INTO `recurso` (`id`, `nombre`, `url`, `modulo_id`, `descripcion`, `creado`, `tipo`) VALUES
(18, 'Poder3000 - Inicio - Parte 07', '<iframe width="560" height="315" src="https://www.youtube.com/embed/nRpFg_u0HJQ" frameborder="0" allowfullscreen></iframe>', 5, 'Parte 7', '2016-02-23 18:39:25', 'YOUTUBE'),
(19, 'Poder3000 - Inicio - Parte 08', '<iframe width="560" height="315" src="https://www.youtube.com/embed/V_53cRE-pL8" frameborder="0" allowfullscreen></iframe>', 5, 'Parte 8', '2016-02-23 18:41:47', 'YOUTUBE'),
(7, 'Capitan a (dia2)', '/files/upload/videos/2016_02_20_11_28_20_02_capitan_a[1].mp4', 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis explicabo illum provident voluptas, ad harum quam iusto, ut ducimus fugit suscipit tempore velit neque dolorum eos minus unde quaerat, inventore.', '2016-02-20 15:58:20', 'VIDEO'),
(16, 'Poder3000 - Inicio - Parte 05', '<iframe width="560" height="315" src="https://www.youtube.com/embed/r2p5400yYRo" frameborder="0" allowfullscreen></iframe>', 5, 'Parte 5', '2016-02-23 18:37:51', 'YOUTUBE'),
(17, 'Poder3000 - Inicio - Parte 06', '<iframe width="560" height="315" src="https://www.youtube.com/embed/mQs724p7gxs" frameborder="0" allowfullscreen></iframe>', 5, 'Parte 6', '2016-02-23 18:38:42', 'YOUTUBE'),
(15, 'Poder3000 - Inicio - Parte 04', '<iframe width="560" height="315" src="https://www.youtube.com/embed/jaGi9Gr_Agw" frameborder="0" allowfullscreen></iframe>', 5, 'Parte 4', '2016-02-23 18:37:15', 'YOUTUBE'),
(12, 'Poder3000 - Inicio -  Parte 01', '<iframe width="560" height="315" src="https://www.youtube.com/embed/xZjjhbN9C88" frameborder="0" allowfullscreen></iframe>', 5, 'Parte 1', '2016-02-23 18:18:22', 'YOUTUBE'),
(13, 'Poder3000 - Inicio -  Parte 02', '<iframe width="560" height="315" src="https://www.youtube.com/embed/wWsrrcuCkSE" frameborder="0" allowfullscreen></iframe>', 5, 'Parte 2', '2016-02-23 18:19:12', 'YOUTUBE'),
(14, 'Poder3000 - Inicio - Parte 03', '<iframe width="560" height="315" src="https://www.youtube.com/embed/8ZlLNFk9Mso" frameborder="0" allowfullscreen></iframe>', 5, 'Parte 3', '2016-02-23 18:36:01', 'YOUTUBE');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='tabla que usare para guardar cuando un usuario ve un video o le da click para ve' AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `recurso_usuario_habilitado`
--

INSERT INTO `recurso_usuario_habilitado` (`id`, `curso_id`, `recurso_id`, `usuario_id`, `creado`, `habilitado`) VALUES
(21, 1, 4, 1, '2016-02-22 19:52:37', 1),
(7, 1, 2, 1, '2016-02-20 13:27:48', 1),
(6, 1, 3, 1, '2016-02-20 13:27:14', 1),
(5, 1, 1, 1, '2016-02-20 13:26:02', 1),
(15, 1, 1, 4, '2016-02-22 18:52:10', 1),
(16, 1, 3, 4, '2016-02-22 18:52:21', 1),
(17, 1, 1, 3, '2016-02-22 19:27:36', 1),
(18, 1, 3, 3, '2016-02-22 19:27:58', 1),
(19, 1, 2, 3, '2016-02-22 19:28:16', 1),
(20, 1, 4, 3, '2016-02-22 19:28:37', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `password`, `email`, `creado`) VALUES
(1, 'Jaime Irazabal', 'e01936b1de6cb5998e0067ddf23ff215', 'jaimeirazabal1@gmail.com', '2016-02-19 15:26:44'),
(2, 'admin', 'admin', 'admin@admin.com', '2016-02-19 16:47:27'),
(3, 'rafael ', 'ca385a1919294cc627081903fa38bdfb', 'rafael.a@hotmail.com', '2016-02-19 16:50:24'),
(4, 'Jaime Irazabal Gonzalez', 'ecc379db8401f9156b9bcd21a91a6721', 'jaimeirazabal1@hotmail.com', '2016-02-22 18:49:44');

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
