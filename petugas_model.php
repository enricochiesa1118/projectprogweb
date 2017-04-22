<?php 
 
class petugas_model extends CI_Model{
	// function tampil_data(){
	// 	return $this->db->get('user');
	// }
 
	function input_data($data,$table){
		$this->db->insert($table,$data);
	}

	function tampil_data_daftar_berobat(){
		return $this->db->get('daftar_berobat');
	}

	function tampil_data(){
		return $this->db->get('pasien');
	}

	function hapus_data($where,$table){
		$this->db->where($where);
		$this->db->delete($table);
	}

	function edit_data($where,$table){		
		return $this->db->get_where($table,$where);
	}

	function update_data($where,$data,$table){
		$this->db->where($where);
		$this->db->update($table,$data);
	}	


	 // function antrian(){
  //           $this->db->select('*');
  //           $this->db->from('daftar_berobat');
  //           $list = $this->db->get('daftar_berobat');
  //           if($list->num_rows() == 0){
  //               return "A001";
  //           }
  //           else{
  //               $kode = (string)$list->num_rows()+1;
  //               if((strlen((string)$list->num_rows())) < 3){
  //                   for($i = strlen((string)$list->num_rows()); $i < 3; $i++){
  //                       $kode = "0".$kode;
  //                   }
  //               }
  //               $kode = "A".$kode;
  //               return $kode;
  //           }
  //       }
}

?>