-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 24 May 2018, 21:24:18
-- Sunucu sürümü: 5.7.17-log
-- PHP Sürümü: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `contactmanager`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contacts`
--

CREATE TABLE `contacts` (
  `kullanıcı_id` int(255) NOT NULL,
  `id` int(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `tnumber` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `contacts`
--

INSERT INTO `contacts` (`kullanıcı_id`, `id`, `firstname`, `lastname`, `city`, `tnumber`, `email`) VALUES
(2, 110, 'dogu', 'perincek', 'ankara', '555', '2322'),
(2, 111, 'deniz', 'gezmis', 'ankara ', '232', '222'),
(18, 113, 'kemal', 'kemal', 'cetÄ±n', '99999', 'gfdsasdf');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `kullanıcı_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `isim` varchar(255) NOT NULL,
  `soyisim` varchar(255) NOT NULL,
  `sifre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`kullanıcı_id`, `username`, `isim`, `soyisim`, `sifre`) VALUES
(2, 'mete', 'mete', 'mete', 'mete'),
(13, 'bilal', 'bilal', 'gÃ¼ngÃ¶r', 'bilal'),
(14, 'a', 'a', 'a', 'a'),
(15, 'ali', 'ali', 'ali', 'ali'),
(16, 'bilal', 'bilal', 'bilal', 'bilal'),
(17, 'eray', '1', '1', 'eray'),
(18, 'kemal', 'kemal', 'cetÄ±n', 'kemal');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`kullanıcı_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `kullanıcı_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
