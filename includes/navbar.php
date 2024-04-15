<?php
if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = array();
}

// Tính tổng số lượng sản phẩm trong giỏ hàng
$totalQuantity = 0;
foreach ($_SESSION['cart'] as $item) {
    $totalQuantity += $item['quantity'];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BinhBui Gear</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light sticky-top bg-light">
    <div class="container justify-content-end">
        <a class="navbar-brand" href="index.php"><strong> BinhBui Gear </strong></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.php"> <strong> Trang Chủ </strong> <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="categories.php">Danh Mục</a>
                </li>
                <?php if (isset($_SESSION['auth'])) { ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?= $_SESSION['auth_user']['name'] ?>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="my-orders.php">Đơn Hàng Của Tôi</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="DangXuat.php">Đăng Xuất</a>
                        </div>
                    </li>
                <?php } else { ?>
                    <li class="nav-item">
                        <a class="nav-link" href="DangNhap.php">Đăng Nhập</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="DangKy.php">Đăng Ký</a>
                    </li>
                <?php } ?>
            </ul>
            <form class="d-flex" action="cart.php" method="GET">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <?php if ($totalQuantity > 0) { ?>
                        <span class="badge bg-dark text-white ms-1 rounded-pill"><?= $totalQuantity ?></span>
                    <?php } ?>
                </button>
            </form>
        </div>
    </div>
</nav>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
