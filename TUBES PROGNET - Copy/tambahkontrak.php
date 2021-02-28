<?php
	include 'koneksi.php';

	$pesanSalah = "Data sudah tersedia. Silahkan pilih lapak lain";
	$pesanBenar = "Data berhasil diinputkan.";

	$idLapak = $_POST['id_lapak'];
	$cekLapak = "SELECT id_lapak FROM history_kontrak_lapak WHERE history_kontrak_lapak.id_lapak = '$idLapak'";
	$queryCekLapak = mysqli_query($conn, $cekLapak);
	$row2 = mysqli_fetch_assoc($queryCekLapak);
	if($row2){
		echo "<script type='text/javascript'>alert('$pesanSalah');</script>";
	} else {
		$biayaBulanan = $_POST['biaya_bulanan'];
		$biayaSemesteran = $_POST['biaya_semesteran'];
		$biayaTahunan = $_POST['biaya_tahunan'];

		$queryTanggalBerlaku = "SELECT tanggal_pendaftaran FROM lapak WHERE lapak.id_lapak = $idLapak";
		$exe1 = mysqli_query($conn, $queryTanggalBerlaku);
		while($row = mysqli_fetch_assoc($exe1)){
			$tanggalBerlaku = $row['tanggal_pendaftaran'];
		}

		$queryTanggalSelesai = "SELECT tanggal_akhir_kontrak FROM lapak WHERE lapak.id_lapak = $idLapak";
		$exe2 = mysqli_query($conn, $queryTanggalSelesai);
		while($row1 = mysqli_fetch_assoc($exe2)){
			$tanggalSelesai = $row1['tanggal_akhir_kontrak'];
		}

		$sql = "INSERT INTO history_kontrak_lapak (id_lapak, nilai_kontrak_tahunan, nilai_kontrak_bulanan, nilai_kontrak_semesteran, mulai_berlaku, selesai, status) VALUES($idLapak, $biayaTahunan, $biayaBulanan, $biayaSemesteran, '$tanggalBerlaku', '$tanggalSelesai', 1)";

		mysqli_query($conn, $sql);

		echo "<script type='text/javascript'>alert('$pesanBenar');</script>";
	}
	
?>
