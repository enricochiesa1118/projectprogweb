<script type="text/javascript">
	var xmlHttp;
	get_list(null);
	function get_list(STR){
		xmlHttp = GetXmlHttpObject();		
		if(xmlHttp == null){
			alert("Not Compatible");
			return;
		}
		var url = "";
		if(!STR){
			url = "<?php echo base_url();?>admin/get_data_jadwal";
			xmlHttp.onreadystatechange = stateChanged;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
		}
		else{
			url = "<?php echo base_url();?>admin/get_single_jadwal/" + STR;
			xmlHttp.onreadystatechange = stateChanged;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
		}
	}
	function stateChanged(){
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
			document.getElementById("result").innerHTML=xmlHttp.responseText;
		}
	}
	function GetXmlHttpObject(){
		var xmlHttp = null;
		try{
			xmlHttp = new XMLHttpRequest();
		}
		catch(e){
			try{
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			}catch(e){
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		return xmlHttp;
	}
	function check(){
		document.getElementById("search").value="isi";
	}
	function delete_jadwal(ID_Jadwal){
		if(confirm("Apakah yakin ingin menghapus data dengan id : " + ID_Jadwal + " ? ") == true){
			return true;
		}else{
			return false;
		}
	}
</script>
<article class="topcontent">
	<header><h2>Manage Jadwal -> View Jadwal</h2></header>
	<content>
		<button class="button" onclick="location.href='<?php echo base_url();?>admin/show_input_jadwal';">Tambah Data</button>

		<div id="result" >
		</div>
	</content>
</article>