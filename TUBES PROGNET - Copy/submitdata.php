<?php
	session_start();

	include 'koneksi.php';

	date_default_timezone_set('asia/singapore');
	$date = date("Y-m-d H:i:s");

	$idLapak = $_POST['id_lapak'];

	$periodePembayaran = $_POST['periode_pembayaran'];

	$tglKontrakAwal = "SELECT tanggal_akhir_kontrak FROM lapak WHERE lapak.id_lapak = $idLapak";
	$result = mysqli_query($conn, $tglKontrakAwal);
	while($row = mysqli_fetch_assoc($result)){
		$tanggalAwal = $row['tanggal_akhir_kontrak'];
	}

	if($periodePembayaran == "1 bulan"){
		$tglKontrakAkhir = "SELECT (tanggal_akhir_kontrak + INTERVAL 1 MONTH) AS periode1 FROM lapak WHERE lapak.id_lapak = $idLapak";
	} else if($periodePembayaran == "6 bulan"){
		$tglKontrakAkhir = "SELECT (tanggal_akhir_kontrak + INTERVAL 6 MONTH) AS periode1 FROM lapak WHERE lapak.id_lapak = $idLapak";
	} else if($periodePembayaran == "1 tahun"){
		$tglKontrakAkhir = "SELECT (tanggal_akhir_kontrak + INTERVAL 1 YEAR) AS periode1 FROM lapak WHERE lapak.id_lapak = $idLapak";
	} else if($periodePembayaran == "2 tahun"){
		$tglKontrakAkhir = "SELECT (tanggal_akhir_kontrak + INTERVAL 2 YEAR) AS periode1 FROM lapak WHERE lapak.id_lapak = $idLapak";
	}

	$result2 = mysqli_query($conn, $tglKontrakAkhir);
	while($row2 = mysqli_fetch_assoc($result2)){
		$tanggalAkhir = $row2['periode1'];
	}

	$nilai = $_SESSION['biayaLapak'];
	$namaAdmin = $_SESSION["nama_pegawai"];

	$getIdAdmin = "SELECT id_pegawai FROM pegawai WHERE pegawai.nama_pegawai = '$namaAdmin'";
	$resAdmin = mysqli_query($conn, $getIdAdmin);
	while($row4 = mysqli_fetch_assoc($resAdmin)){
		$idAdmin = $row4['id_pegawai'];
	}

	$idManaj = NULL;
	$tglSerah = NULL;

	$sql = "INSERT INTO pembayaran_kontrak (id_lapak, tanggal_bayar,
						tanggal_kontrak_awal, tanggal_kontrak_akhir, nilai, id_admin)
			VALUES('$idLapak', '$date', '$tanggalAwal', '$tanggalAkhir', '$nilai', '$idAdmin')";

	$inputData = mysqli_query($conn, $sql);

	$updateTgl = "UPDATE lapak, pembayaran_kontrak SET lapak.tanggal_akhir_kontrak = '$tanggalAkhir'
					WHERE lapak.id_lapak = $idLapak";
	$result3 = mysqli_query($conn, $updateTgl);

	$valueLapak = "SELECT nama_lapak FROM lapak WHERE lapak.id_lapak = $idLapak";
	$getLapak = mysqli_query($conn, $valueLapak);
	while($row3 = mysqli_fetch_assoc($getLapak)){
		$namaLapak = $row3['nama_lapak'];
	}

	$getIdAdmin2 = "SELECT id_admin FROM admin WHERE admin.username = '$namaAdmin'";
	$resAdmin2 = mysqli_query($conn, $getIdAdmin2);
	while($row5 = mysqli_fetch_assoc($resAdmin2)){
		$idAdmin2 = $row5['id_admin'];
	}

	$log_1 = "Pegawai " . $namaAdmin . " mencari lapak " . $namaLapak;

	$log_2 = "Pegawai " . $namaAdmin . " mencatat pembayaran kontrak lapak " . $namaLapak . " dari tanggal " . $date . " dengan total " . $nilai . " rupiah";

	$query_log = "INSERT INTO log (aktivitas, tabel, modul, tanggal, id_admin) VALUES('$log_1', 'pembayaran_kontrak', 'PEMBAYARAN KOTRAK LAPAK', '$date', '$idAdmin2')";
	$result_log = mysqli_query($conn, $query_log);

	$query_log = "INSERT INTO log (aktivitas, tabel, modul, tanggal, id_admin) VALUES('$log_2', 'pembayaran_kontrak', 'PEMBAYARAN KOTRAK LAPAK', '$date', '$idAdmin2')";
	$result_log = mysqli_query($conn, $query_log);
?>
