<?php
	session_start();
	include "koneksi.php";
	//cek apakah user sudah login
	if(!isset($_SESSION["username"])){
		header('Location: login.php');
	}
?>


<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Sistem Pasar - Modul 5 Pembayaran Kontrak Lapak</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="asset/CSS/style2.css" type="text/css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- Icon Links -->
        <script src="https://kit.fontawesome.com/yourcode.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

		<!-- Font Links -->
		<link href='https://fonts.googleapis.com/css?family=Hammersmith+One' rel='stylesheet'>
	</head>
	<body class="content-body">
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-sm">
			<a class="logo navbar-brand" href="#"><img class="logo-img" src="asset/img/Logo.png">
				<span class="logo-name mt-3">Sistempasar</span>
			</a>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="logout.php"><button type="button" id="tombol-logout" class="btn">Logout</button></a>
        		</li>
        		<li class="nav-item">
          			<i id="akun-icon" class="material-icons">account_circle</i>
        		</li>
      		</ul>
		</nav>
		<div class="container">
			<div id="header" class="row">
				<span id="header-txt" class="mx-auto">PEMBAYARAN KONTRAK TAHUNAN LAPAK</span>
			</div>
            <div id="konten-row" class="row">

				<!-- KOLOM FILTER -->
                <div id="kol-filter" class="col-4 shadow">
					<div class="judul-filter text-center">Cek Biaya Kontrak Lapakmu</div>
                    <form class="form-lapak" method="post">

						<!-- NAMA LAPAK -->
                        <div class="form-group">
                            <label>Nama Lapak</label>
                            <select id="namaLapak" class="nama-lapak form-control" name="lapak">
                                <option value="0">Pilih Lapak</option>
								<?php
									$sql = "SELECT * FROM lapak";
                                    $result = mysqli_query($conn, $sql);
                                    while($row = mysqli_fetch_assoc($result)){ ?>
                                        <option value="<?php echo $row['id_lapak'] ?>"><?php echo $row['nama_lapak'] ?></option>
                                    <?php } ?>
                            </select>
                        </div>

						<!-- PERIODE PEMBAYARAN -->
						<div class="form-group">
							<label>Periode Pembayaran</label>
							<select id="periodePembayaran" class="periode-pembayaran form-control" name="periode">
								<option value="0">Pilih Periode Pembayaran</option>
								<option value="1 bulan">1 Bulan</option>
								<option value="6 bulan">6 Bulan</option>
								<option value="1 tahun">1 Tahun</option>
								<option value="2 tahun">2 Tahun</option>
							</select>
						</div>
                    </form>
					<div class="row">
						<button type="button" id="tombol-cek" class="tombol-cek btn">Cek Biaya</button>
						<button type="button" id="tombol-tambah" class="tombol-tambah btn" data-toggle="modal" data-target="#tambahKontrak">Tambah Kontrak Lapak</button>
					</div>

					<!-- MODAL TAMBAH KONTRAK -->
					<div id="tambahKontrak" class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- MODAL HEADER -->
								<div class="modal-header">
									<h4 class="modal-title">Tambah Kontrak Lapak</h4>
									<button type="button" class="close" data-dismiss="modal">&times</button>
								</div>

								<!-- MODAL BODY -->
								<div class="modal-body">
									<form class="form-tambah" method="POST">

										<!-- NAMA LAPAK -->
										<div class="form-group">
											<label>Nama Lapak</label> <br>
											<select id="namaLapakTambah" class="nama-lapak-tambah form-control" name="lapak-tambah">
				                                <option value="0">Pilih Lapak</option>
												<?php
													$sql = "SELECT * FROM lapak";
				                                    $result = mysqli_query($conn, $sql);
				                                    while($row = mysqli_fetch_assoc($result)){ ?>
				                                        <option value="<?php echo $row['id_lapak'] ?>"><?php echo $row['nama_lapak'] ?></option>
				                                    <?php } ?>
				                            </select>
										</div>

										<!-- BIAYA KONTRAK -->
										<div class="form-group">
											<label>Biaya Kontrak Bulanan</label>
											<div class="input-group">
												<div class="input-group-prepend">
											    	<span class="input-group-text">Rp</span>
											    </div>
												<input type="number" id="kontrak-bulanan" class="kontrak-bulanan form-control" name="kontrak-bulanan">
											</div>
										</div>
										<div class="form-group">
											<label>Biaya Kontrak Semesteran</label>
											<div class="input-group">
												<div class="input-group-prepend">
											    	<span class="input-group-text">Rp</span>
											    </div>
												<input type="number" id="kontrak-semesteran" class="kontrak-semesteran form-control" name="kontrak-semesteran">
											</div>
										</div>
										<div class="form-group">
											<label>Biaya Kontrak Tahunan</label>
											<div class="input-group">
												<div class="input-group-prepend">
											    	<span class="input-group-text">Rp</span>
											    </div>
												<input type="number" id="kontrak-tahunan" class="kontrak-tahunan form-control" name="kontrak-tahunan">
											</div>
										</div>
									</form>
								</div>

								<!-- MODAL FOOTER -->
								<div class="modal-footer">
									<div class="info"></div>
									<button type="button" id="tambah-kontrak" class="tambah-kontrak btn">Tambah kontrak</button>
									<button type="button" id="closeModal" class="btn" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
                </div>

				<!-- KOLOM TABEL DATA -->
                <div class="kolom-data col shadow">
					<div class="row-judul-data row">
						<span class="data-txt">Data</span>
						<span class="lapak-txt">Lapak</span>
					</div>
                    <div class="row-table row">
						<div class="tabel-lapak table">
							<div class="tampiltabel"></div>
						</div>
					</div>
					<div class="row-biaya row">
						<div class="kolom-biaya col">
							<div class="biaya"></div>
						</div>
					</div>
					<div class="row">
						<button type="button" id="tombol-bayar" class="tombol-bayar btn mx-auto d-block">Bayar</button>
					</div>
                </div>
            </div>
        </div>
		<!-- END OF CONTENT -->

		<script type="text/javascript">
			$(document).ready(function(){
				$('.nama-lapak').change(function(e){
					e.preventDefault();
					$.ajax({
						type : 'POST',
						url : "tampiltabel.php",
						data : {id_lapak : $('.nama-lapak').val()},
						success : function(data){
							console.log($('.nama-lapak').val());
							$('.tampiltabel').html(data);
						}
					});
				});
				$('.tombol-cek').click(function(e){
					e.preventDefault();
					$.ajax({
						type : 'POST',
						url : "tampilbiaya.php",
						data : {
							id_lapak : $('.nama-lapak').val(),
							periode_pembayaran : $('.periode-pembayaran').val(),
						},
						success : function(data){
							console.log($('.periode-pembayaran').val());
							$('.biaya').html(data);
						}
					});
				});
				$('.tombol-bayar').click(function(e){
					e.preventDefault();
					$.ajax({
						type : 'POST',
						url : "submitdata.php",
						data : {
							id_lapak : $('.nama-lapak').val(),
							periode_pembayaran : $('.periode-pembayaran').val(),
						},
						success : function(data){
							alert("Data berhasil disubmit!");
							console.log("Pembayaran Berhasil!");
						}
					});
				});
				$('#tambah-kontrak').click(function(e){
					e.preventDefault();
					$.ajax({
						type : 'POST',
						url : "tambahkontrak.php",
						data : {
							id_lapak : $('#namaLapakTambah').val(),
							biaya_bulanan : $('.kontrak-bulanan').val(),
							biaya_semesteran : $('.kontrak-semesteran').val(),
							biaya_tahunan : $('.kontrak-tahunan').val(),
						},
						success : function(data){
							console.log("submit berhasil");
							$('.info').html(data);
							$('#tambahKontrak form :input').val("");
						}
					});
				});
			});
		</script>
	</body>
</html>
