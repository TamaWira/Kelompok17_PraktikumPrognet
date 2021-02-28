<?php
	session_start();
	include 'koneksi.php';

	$periodePembayaran = $_POST['periode_pembayaran'];
	if($periodePembayaran == 0){
		echo "Harap pilih periode pembayaran!";
	} else {
		$idLapak = $_POST['id_lapak'];
		if($idLapak == ""){
			echo "";
		} else {
			$cekKontrak = "SELECT id_lapak FROM history_kontrak_lapak WHERE history_kontrak_lapak.id_lapak = $idLapak";
			$res_cek = mysqli_query($conn, $cekKontrak);
			$rowCek = mysqli_fetch_array($res_cek);
			if(!$rowCek){
				if($periodePembayaran == 0){
					echo "";
				} else if($idLapak == 0){
					echo "Harap masukan nama lapak!";
				} else {
					echo "Data kontrak lapak belum terdaftar. Harap tambah kontrak lapak!";
				}
			} else {
				$sql = "SELECT nilai_kontrak_tahunan, nilai_kontrak_bulanan, nilai_kontrak_semesteran
						FROM history_kontrak_lapak
						JOIN lapak ON history_kontrak_lapak.id_lapak = lapak.id_lapak
						WHERE history_kontrak_lapak.id_lapak = $idLapak";
				$result = mysqli_query($conn, $sql);
				while($row = mysqli_fetch_assoc($result)){
					if ($periodePembayaran == "1 bulan"){
				        $_SESSION['biayaLapakTampil'] = number_format($row['nilai_kontrak_bulanan'], 0, ",",".");
						$_SESSION['biayaLapak'] = $row['nilai_kontrak_bulanan'];
						echo "Biaya Pembayaran : Rp" . $_SESSION['biayaLapakTampil'];
				    } else if ($periodePembayaran == "6 bulan"){
				        $_SESSION['biayaLapakTampil'] = number_format($row['nilai_kontrak_semesteran'], 0, ",",".");
						$_SESSION['biayaLapak'] = $row['nilai_kontrak_semesteran'];
						echo "Biaya Pembayaran : Rp" . $_SESSION['biayaLapakTampil'];
				    } else if ($periodePembayaran == "1 tahun"){
				        $_SESSION['biayaLapakTampil'] = number_format($row['nilai_kontrak_tahunan'], 0, ",",".");
						$_SESSION['biayaLapak'] = $row['nilai_kontrak_tahunan'];
						echo "Biaya Pembayaran : Rp" . $_SESSION['biayaLapakTampil'];
				    } else if ($periodePembayaran == "2 tahun"){
				        $_SESSION['biayaLapakTampil'] = number_format($row['nilai_kontrak_tahunan'] * 2, 0, ",",".");
						$_SESSION['biayaLapak'] = $row['nilai_kontrak_tahunan'] * 2;
						echo "Biaya Pembayaran : Rp" . $_SESSION['biayaLapakTampil'];
				    } else {
						echo "Harap pilih periode pembayaran!";
					}
				}
			}
		}
	}
?>
