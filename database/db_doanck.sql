-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 14, 2024 lúc 08:21 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_doanck`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `prod_id`, `prod_qty`, `created_at`) VALUES
(41, 1, 33, 1, '2024-03-21 17:31:57'),
(42, 1, 19, 1, '2024-03-23 07:13:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `popular` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `popular`, `image`, `meta_title`, `meta_description`, `meta_keyword`, `created_at`) VALUES
(20, 'CPU Intel', '', 'cpu intel', 0, 1, 'intel--600.png', 'CPU Intel', '', 'cpu intel', '2024-04-12 20:29:28'),
(21, 'CPU AMD', '', 'cpu amd', 0, 1, '1712953991.webp', 'CPU AMD', '', '', '2024-04-12 20:33:11'),
(22, 'Mainboard Intel', '', 'Mainboard Intel', 0, 1, '1712954118.png', 'Mainboard Intel', '', '', '2024-04-12 20:35:18'),
(23, 'Mainboard AMD', '', 'mainboard amd', 0, 1, '1712954186.jpg', 'Mainboard AMD', '', '', '2024-04-12 20:36:26'),
(24, 'VGA', '', 'vga', 0, 1, '1712955221.jpg', 'vga', '', '', '2024-04-12 20:53:41'),
(25, 'Nguồn', '', 'nguồn', 0, 1, '1712955295.webp', 'Nguồn', '', '', '2024-04-12 20:54:55'),
(26, 'Tản nhiệt AIO', '', 'Tản nhiệt AIO', 0, 1, '1713113379.jpg', 'Tản nhiệt AIO', '', '', '2024-04-14 16:49:39'),
(27, 'Tản nhiệt khí', '', 'Tản nhiệt khí', 0, 1, '1713113472.png', 'Tản nhiệt khí', '', '', '2024-04-14 16:51:12'),
(28, 'Ram DDR4', '', 'Ram DDR4', 0, 1, '1713113604.jpg', 'Ram DDR4', '', '', '2024-04-14 16:53:24'),
(29, 'Ram DDR5', '', 'Ram DDR5', 0, 1, '1713113635.jpeg', 'Ram DDR5', '', '', '2024-04-14 16:53:55'),
(30, 'SSD', '', 'SSD', 0, 1, '1713113675.jpg', 'SSD', '', '', '2024-04-14 16:54:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `tracking_no` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `pincode` int(255) NOT NULL,
  `total_price` int(255) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `comments` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `tracking_no`, `user_id`, `name`, `email`, `phone`, `address`, `pincode`, `total_price`, `payment_mode`, `payment_id`, `status`, `comments`, `created_at`) VALUES
(18, 'madon741994207858', 9, 'Bùi Duy Bình', 'duybinhbui47@gmail.com', 794207858, 'Tổ 6, kp Kiên tân, tt.Kiên lương, h.kiên lương, t.Kiên Giang', 123, 3390000, 'Thanh Toán Khi Nhận Hàng', '', 0, NULL, '2024-04-14 17:57:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(255) NOT NULL,
  `prod_id` int(255) NOT NULL,
  `qty` int(255) NOT NULL,
  `price` int(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `prod_id`, `qty`, `price`, `created_at`) VALUES
(20, 18, 44, 1, 3390000, '2024-04-14 17:57:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `small_description` varchar(5000) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `original_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `trending` tinyint(4) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `small_description`, `description`, `original_price`, `selling_price`, `image`, `qty`, `status`, `trending`, `meta_title`, `meta_description`, `meta_keyword`, `created_at`) VALUES
(34, 20, 'CPU Intel Core i5-12600K', 'Bộ xử lý: Intel Core I5 12600K – Alder Lake', 'Bộ xử lý: I5 12600K – Alder Lake\r\nBộ nhớ đệm: 20 MB Cache (Total L2 Cache: 9.5 MB)\r\nTần số cơ sở của bộ xử lý: 3.70 GHz\r\nTần số turbo tối đa: 4.90 GHz\r\nHỗ trợ socket: FCLGA 1700\r\nSố lõi: 10, Số luồng: 16\r\nTDP: 125 W (Max. 150W)\r\nĐồ họa tích hợp: Intel UHD Graphics 770\r\nDung lượng bộ nhớ tối đa (tùy vào loại bộ nhớ): 128 GB (Up to DDR5 4800 MT/s | Up to DDR4 3200 MT/s)', 0, 4890000, '1713114824.jpg', 100, 0, 1, 'CPU Intel Core i5-12600K', '', '', '2024-04-14 17:13:44'),
(35, 21, 'AMD Ryzen 7 5800X3D', 'AMD Ryzen 7 5800X3D / 3.4GHz Boost 4.5GHz / 8 nhân 16 luồng / 96MB / AM4', 'Hãng sản xuất: AMD\r\nCPU Socket: AM4\r\nSố nhân/luồng: 8C/16T\r\nBộ nhớ đệm Cache : 96MB\r\nMức tiêu thụ điện năng TDP: 105 W', 0, 8990000, '1713115213.jpg', 100, 0, 1, '', '', '', '2024-04-14 17:20:13'),
(36, 22, 'Mainboard Asus TUF Gaming B760M-PLUS Wifi DDR5', 'Mainboard Asus TUF Gaming B760M-PLUS Wifi DDR5', 'Chipset B760\r\nDDR5\r\nWifi', 0, 3900000, '1713115412.jpg', 100, 0, 1, 'Mainboard Asus TUF Gaming B760M-PLUS Wifi DDR5', '', '', '2024-04-14 17:23:32'),
(37, 23, 'Mainboard ASUS TUF GAMING X670E-PLUS WIFI', 'Mainboard ASUS TUF GAMING X670E-PLUS WIFI', 'Chipset X670E\r\nWifi\r\n', 0, 7900000, '1713115582.jpg', 100, 0, 1, 'Mainboard ASUS TUF GAMING X670E-PLUS WIFI', '', '', '2024-04-14 17:26:22'),
(38, 24, 'Card màn hình GIGABYTE AORUS Radeon RX 6900 XT MASTER 16G', 'Card màn hình GIGABYTE AORUS Radeon RX 6900 XT MASTER 16G', 'GIGABYTE \r\nVRAM 16G\r\nGPU  Radeon RX 6900 XT', 0, 11900000, '1713115991.jpg', 100, 0, 1, 'Card màn hình GIGABYTE AORUS Radeon RX 6900 XT MASTER 16G', '', '', '2024-04-14 17:29:14'),
(39, 25, 'Nguồn Segotep GM 850W ATX 3.0 PCIE 5.0', 'Nguồn Segotep GM 850W ATX 3.0 PCIE 5.0', 'Thương hiệu: Segotep\r\nModel: GM850W\r\nCông suất thực: 850W\r\nChứng nhận: 80 Plus Gold\r\nMàu sắc: Đen\r\nQuạt làm mát: 120mm sử dụng cảm biến nhiệt độ AI Cooler độc quyền\r\nHỗ trợ tất cả các dòng CPU Intel& AMD\r\nKích thước: 150mm * 140mm * 85mm', 0, 2300000, '1713116258.jpg', 100, 0, 1, 'Nguồn Segotep GM 850W ATX 3.0 PCIE 5.0', '', '', '2024-04-14 17:37:38'),
(40, 26, 'Tản nhiệt ASUS ROG RYUJIN III 360 ARGB', 'Tản nhiệt ASUS ROG RYUJIN III 360 ARGB', 'Intel: LGA 1700, 1200, 115x, 20xx\r\nAMD: AM4, AM5\r\n', 0, 4900000, '1713116460.jpg', 100, 0, 1, 'Tản nhiệt ASUS ROG RYUJIN III 360 ARGB', '', '', '2024-04-14 17:41:00'),
(41, 27, 'tản nhiệt khí Cooler Master Hyper 620S', 'tản nhiệt khí Cooler Master Hyper 620S', 'tản nhiệt khí Cooler Master Hyper 620S', 0, 599000, '1713116556.jpg', 100, 0, 1, '', '', '', '2024-04-14 17:42:36'),
(42, 28, 'Ram Adata XPG D50 RGB 16GB DDR4 3200MHz White', 'Ram Adata XPG D50 RGB 16GB DDR4 3200MHz White', 'Ram Adata XPG D50 RGB 16GB DDR4 3200MHz White', 0, 499000, '1713116710.png', 100, 0, 1, '', '', '', '2024-04-14 17:45:10'),
(43, 29, 'Ram Kingston FURY Beast RGB 32GB (2x16GB) DDR5 bus 5200Mhz', 'Ram Kingston FURY Beast RGB 32GB (2x16GB) DDR5 bus 5200Mhz', 'Ram Kingston FURY Beast RGB 32GB (2x16GB) DDR5 bus 5200Mhz', 0, 3390000, '1713116751.jpg', 100, 0, 1, '', '', '', '2024-04-14 17:45:51'),
(44, 30, 'SSD Samsung 990 PRO 1TB PCIe NVMe 4.0x4', 'SSD Samsung 990 PRO 1TB PCIe NVMe 4.0x4', 'SSD Samsung 990 PRO 1TB PCIe NVMe 4.0x4', 0, 3390000, '1713116872.jpg', 99, 0, 1, 'SSD Samsung 990 PRO 1TB PCIe NVMe 4.0x4', '', '', '2024-04-14 17:47:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role_as` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `created_at`, `role_as`) VALUES
(9, 'Admin Binh', 'duybinhbui47@gmail.com', 0, '123', '2024-04-12 20:25:33', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
