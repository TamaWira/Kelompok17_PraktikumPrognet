<?php
	include 'koneksi.php'
?>

<?php
	$value_select = $_POST['id_lapak'];
	if($value_select == ""){
		echo "";
	} else {
		echo '
		<table>
			<tr class="table-head">
				<th>ID Lapak</th>
				<th>Nama Lapak</th>
				<th>Nama Pemilik</th>
				<th>Posisi Lapak</th>
				<th>Tanggal Pendaftaran</th>
			</tr>
		';
		$sql = "SELECT * FROM lapak WHERE lapak.id_lapak = $value_select";
		$result = mysqli_query($conn, $sql);

		while($row = mysqli_fetch_assoc($result)){?>
			<tr>
				<td><?php echo $row['id_lapak'] ?></td>
				<td><?php echo $row['nama_lapak'] ?></td>
				<td><?php echo $row['nama_pemilik'] ?></td>
				<td><?php echo $row['posisi_lapak'] ?></td>
				<td><?php echo date("d M Y H:i:s a", strtotime($row['tanggal_pendaftaran'])) ?></td>
			</tr>
		<?php } ?>
	<?php } ?>
	</table>
