<article class="topcontent">
	<header><h2>Management User - > Edit Jadwal</h2></header>
	<content>
		<div class="input_table">
			<?php 
				if(isset($msg)){
					echo $msg;
				}
			?>
	<form method="post" id="form_input" action="<?php echo base_url();?>admin/input_data_dokter/1">
		<table>
			<tr>
				<th colspan="2">Data Jadwal</th>
			</tr>
			<tr>	
				<td class="title"><label>ID Jadwal</label></td>
				<td><input type="text" name="txtIdJadwal" readonly="readonly" value="<?php echo $data_jadwal['ID_JADWAL'];?>"/></td>
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
				<td><input type="text" name="txtRuangan" value="<?php echo $data_jadwal['RUANGAN'];?>"/><?php echo form_error('txtRuangan');?></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="submit" value="Tambahkan"/></td>
			</tr>
		</table>
	</content>
</article>