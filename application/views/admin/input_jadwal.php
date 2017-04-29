<article class="topcontent">
	<header><h2>Manage Jadwal -> Input Jadwal</h2></header>
	<content>
		<div class="input_table">
			<form method="post" action="<?php echo base_url()?>admin/input_data_jadwal">
			<table>
				<?php
					echo "<div style=\"color:red; \">".validation_errors();
				?>
				<?php
					if(isset($res)){
						if($res == TRUE){
							echo "<tr>
									<td colspan=\"2\">Input Berhasil</td>
								</tr>";
							}		
						}
				?>
				<tr>
					<th colspan="2">Input Jadwal</th>
				</tr>
				<tr>
					<td class="title"><label>ID Jadwal</label></td>
					<td><input type="text" readonly="readonly" name="txtIdJadwal" value="<?php echo $kode;?>"/></td>
				</tr>
				<tr>
					<td class="title"><label>ID Dokter</label></td>
					<td>
						<select name="txtIdDokter">
							<option value="null">-- pilih -- </option>
							<?php 
								foreach ($dokter as $row) {
									if($row['ID_DOKTER'] == $data_dokter['ID_DOKTER']){
										echo "<option value=\"".$row['ID_DOKTER']."\" selected=\"selected\">".$row['NAMA']."</option>";
										continue;
									}
									echo "<option value=\"".$row['ID_DOKTER']."\">".$row['NAMA']."</option>";
								}
							?>
						</select>
					</td>
				</tr>
				<tr>
					<td class="title"><label>Jam</label></td>
					<td>
						<select name="txtJam">
							<option value="null">-- pilih -- </option>
							<?php 
								foreach ($jam as $row) {
									if($row['ID_JAM'] == $data_jam['ID_JAM']){
										echo "<option value=\"".$row['ID_JAM']."\" selected=\"selected\">".$row['JAM']."</option>";
										continue;
									}
									echo "<option value=\"".$row['ID_JAM']."\">".$row['JAM']."</option>";
								}
							?>
						</select>
					</td>
				</tr>
				<tr>
					<td class="title"><label>Hari</label></td>
					<td>
						<select name="txtHari">
							<option value="Senin">Senin</option>
							<option value="Selasa">Selasa</option>
							<option value="Rabu">Rabu</option>
							<option value="Kamis">Kamis</option>
							<option value="Jumat">Jum'at</option>
							<option value="Sabtu">Sabtu</option>
							<option value="Minggu">Minggu</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="title"><label>Ruangan</label></td>
					<td><input type="text" name="txtRuangan"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" name="submit" value="Tambahkan"/></td>
				</tr>
			</table>
		</div>
	</content>
</article>