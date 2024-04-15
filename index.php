<?php 
include('functions/userfunctions.php'); 
include('includes/header.php'); 
include('includes/slider.php'); 

?>
<div class="py-5">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h1 class="text-center">DANH MỤC NỔI BẬT</h1>
                <div class="row">
                <?php
                    $categories = getAllCategories();
                    if(mysqli_num_rows($categories) > 0) {
                        foreach($categories as $item) {
                            ?> 
                           <div class="col-md-3 md-2">
                                    <a href="products.php?category=<?= $item['name'];?>" style="text-decoration: none;">
                                        <div class="card shadow bg-white mb-4" style="border: 1px solid #ddd; border-radius: 10px;">
                                            <div class="card-body">
                                                <img src="uploads/<?= $item['image'];?>" alt="" class="w-100">
                                                <h4 style="font-family: Arial, sans-serif; color: black; text-align: center;"><?= $item['name'];?></h4>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            <?php
                        }
                    }   
                    ?>
                </div>
            </div>
        </div><br><hr><br>
        <div class="card">
    <div class="card-body">
        <div>
            <img src="assets/images/slider_3.jpg" alt="Sale Image" class="w-100">
            <hr>
        </div>

        <div class="row">
            <?php 
            $SaleProducts = getAllSale();
            if(mysqli_num_rows($SaleProducts) > 0){
                foreach($SaleProducts as $item){
            ?> 
            <div class="col-md-4 md-2">
                <a href="product-view.php?product=<?= $item['name'];?>" style="text-decoration: none;">
                    <div class="card shadow bg-white mb-3" style="border: 1px solid #ddd; border-radius: 10px;">
                        <div class="card-body d-flex justify-content-center">
                            <img src="uploads/<?= $item['image']; ?>" alt="" class="w-50">
                            <div class="ms-3">
                                <h4 style="font-family: Arial, sans-serif; color: black;"><?= $item['name']; ?></h4>
                                <h5 style="font-family: Arial, sans-serif; color: black;"><s><?= number_format($item['original_price'], 0, ',', '.') . " đ"; ?></s></h5>
                                <h5 style="font-family: Arial, sans-serif; color: red;"><?= number_format($item['selling_price'], 0, ',', '.') . " đ"; ?></h5>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <?php
                }
            }
            ?>
        </div>
        <div class="row mt-3">
            <div class="col-md-12 d-flex justify-content-between">
                <button class="btn btn-primary text-start" style="background-color: white; color: black;" onclick="prevPage()"><</button>
                <a href="all-product.php" class="btn btn-primary" style="background-color: white; color: black;">Xem tất cả ></a>
                <button class="btn btn-primary text-end" style="background-color: white; color: black;" onclick="nextPage()">></button>
            </div>
        </div>
    </div>
</div><br><hr><br>
</div>
</div>
<div class="py-5 bg-dark">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h4 class="text-white">THÔNG TIN VỀ BinhBui Gear</h4>
                <div class="is-divider small"></div>
                <a href="index.php" class="text-white"><i class="fa fa-angle-right"></i>Trang Chủ</a><br><br>
                <a href="#" class="text-white"><i class="fa fa-angle-right"></i>Thông Tin</a><br><br>
                <a href="cart.php" class="text-white"><i class="fa fa-angle-right"></i>Giỏ Hàng</a><br><br>
                <a href="#" class="text-white"><i class="fa fa-angle-right"></i>Liên Hệ</a><br><br>

            </div>
            <div class="col-md-3 center">
                <h4 class="text-white">CHÍNH SÁCH BÁN HÀNG</h4>
                <div class="is-divider small"></div>
                <a href="#" class="text-white"><i class=""></i>Hưỡng dẫn đặt hàng</a><br><br>
                <a href="#" class="text-white"><i class=""></i>Thời gian giao & nhận hàng</a><br><br>
                <a href="#" class="text-white"><i class=""></i>Bảo hành & đổi trả</a><br><br>
                <a href="#" class="text-white"><i class=""></i>Chính sách bảo mật</a><br><br>
            </div>
            <div class="col-md-6">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d125395.51267264174!2d106.44423723220825!3d10.841145876549964!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b932ab64357%3A0xd4621417ff6e4cbd!2shutech!5e0!3m2!1svi!2s!4v1711097924637!5m2!1svi!2s" width="100%"class="w-100" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="py-2 bg-danger">
    <div class="text-center">
        <p class="mb-0 text-white">All rights resserved. Copyright @ <a href="https://github.com/dbinhbui" target="_blank"class="text-white">Duy Bình</a> - <?= date('Y') ?> </p>
    </div>
</div>
<?php include('includes/footer.php'); ?>
<script>
    let currentPage = 1; // Giả sử trang bắt đầu từ 1
    const totalPages = Math.ceil(<?php echo mysqli_num_rows($SaleProducts); ?> / 6); // Giả sử có 6 sản phẩm mỗi hàng

    function nextPage() {
        if (currentPage < totalPages) {
            currentPage++;
            updatePage();
        }
    }

    function prevPage() {
        if (currentPage > 1) {
            currentPage--;
            updatePage();
        }
    }

    function updatePage() {
        // Ẩn tất cả các sản phẩm
        document.querySelectorAll('.col-md-4').forEach(element => {
            element.style.display = 'none';
        });

        // Hiển thị sản phẩm cho trang hiện tại
        const startIndex = (currentPage - 1) * 6; // Giả sử có 6 sản phẩm mỗi hàng
        const endIndex = Math.min(startIndex + 6, <?php echo mysqli_num_rows($SaleProducts); ?>);
        for (let i = startIndex; i < endIndex; i++) {
            document.querySelectorAll('.col-md-4')[i].style.display = 'block';
        }
    }

    updatePage(); // Cập nhật ban đầu
</script>
