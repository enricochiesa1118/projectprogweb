<?php
	class admin_model extends CI_Model{
		// function user
		function get_list_user(){
			$this->db->select('*');
			$this->db->from('users');
			$list = $this->db->get();
			if($list->num_rows() > 0){
				return $list->result_array();
			}else{
				return "kosong";
			}
		}

		function get_list_dokter(){
			$this->db->select('*');
			$this->db->from('dokter');
			$list = $this->db->get();
			if($list->num_rows() > 0){
				return $list->result_array();
			}else{
				return "kosong";
			}
		}
		function get_list_jam(){
			$this->db->select('*');
			$this->db->from('jam');
			$list = $this->db->get();
			if($list->num_rows() > 0){
				return $list->result_array();
			}else{
				return "kosong";
			}
		}
		function get_specific_user($data){
			$this->db->select('*');
			$this->db->from('users');
			$this->db->like('ID_USER', $data);
			$this->db->or_like('ID_POLIKLINIK', $data);
			$this->db->or_like('USERNAME', $data);
			$list = $this->db->get();
			if($list->num_rows() > 0){
				return $list->result_array();
			}else{
				return "kosong";
			}	
		}
		
		function get_specific_dokter($data){
			$this->db->select('*');
			$this->db->from('dokter');
			$this->db->like('ID_DOKTER', $data);
			$this->db->or_like('NAMA', $data);
			$this->db->or_like('ALAMAT', $data);
			$this->db->or_like('NO_TELP', $data);
			$this->db->or_like('ID_POLI', $data);
			$list = $this->db->get();
			if($list->num_rows() > 0){
				return $list->result_array();
			}else{
				return "kosong";
			}	
		}

		function get_specific_perawat($data){
			$this->db->select('*');
			$this->db->from('perawat');
			$this->db->like('ID_PERAWAT', $data);
			$list = $this->db->get();
			if($list->num_rows() > 0){
				return $list->row_array();
			}else{
				return "kosong";
			}	
		}

		function generate_id_user(){
			$this->db->select('*');
			$this->db->from('users');
			$list = $this->db->get();
			if($list->num_rows() == 0){
				return "USR001";
			}
			else{
				$data = $list->result();
				$kode = (int)substr($data[$list->num_rows-1]->ID_USER,3);
				$kode++;
				// $kode = (string)$list->num_rows()+1;
				// if((strlen((string)$list->num_rows())) < 3){
					for($i = strlen((string)$list->num_rows()); $i < 3; $i++){
						$kode = "0".$kode;
					}
				// }
				$kode = "USR".$kode;
				return $kode;
			}
		}

		function get_specific_poli($id_poli){
			$this->db->select('*');
			$this->db->from('poliklinik');
			$this->db->like('ID_POLI', $id_poli);
			$list = $this->db->get();
			if($list->num_rows() > 0){
				return $list->result_array();
			}else{
				return "kosong";
			}	
		}

		function get_list_poli(){
			$this->db->select('*');
			$this->db->from('poliklinik');
			$list = $this->db->get();
			if($list->num_rows() > 0){
				return $list->result_array();
			}else{
				return "kosong";
			}
		}

		function generate_id_poli(){
			$this->db->select('*');
			$this->db->from('poliklinik');
			$list = $this->db->get();
			if($list->num_rows() == 0){
				return "POL001";
			}
			else{
				$data = $list->result();
				$kode = (int)substr($data[$list->num_rows-1]->ID_POLI,3);
				$kode++;
					for($i = strlen((string)$list->num_rows()); $i < 3; $i++){
						$kode = "0".$kode;
					}
				$kode = "POL".$kode;
				return $kode;
			}
		}

		function generate_id_dokter(){
			$this->db->select('*');
			$this->db->from('dokter');
			$list = $this->db->get();
			if($list->num_rows() == 0){
				return "DOK001";
			}
			else{
				$data = $list->result();
				$kode = (int)substr($data[$list->num_rows-1]->ID_DOKTER,3);
				$kode++;
				// $kode = (string)$list->num_rows()+1;
				// if((strlen((string)$list->num_rows())) < 3){
					for($i = strlen((string)$list->num_rows()); $i < 3; $i++){
						$kode = "0".$kode;
					}
				// }
				$kode = "DOK".$kode;
				return $kode;
			}
		}

		function generate_id_perawat(){
			$this->db->select('*');
			$this->db->from('perawat');
			$list = $this->db->get();
			if($list->num_rows() == 0){
				return "PRW001";
			}
			else{
				$kode = (string)$list->num_rows()+1;
				if((strlen((string)$list->num_rows())) < 3){
					for($i = strlen((string)$list->num_rows()); $i < 3; $i++){
						$kode = "0".$kode;
					}
				}
				$kode = "PRW".$kode;
				return $kode;
			}
		}
		function generate_id_jadwal(){
			$this->db->select('*');
			$this->db->from('jadwal');
			$list = $this->db->get();
			if($list->num_rows() == 0){
				return "JDW001";
			}
			else{
				$data = $list->result();
				$kode = (int)substr($data[$list->num_rows-1]->ID_JADWAL,3);
				$kode++;
				// $kode = (string)$list->num_rows()+1;
				// if((strlen((string)$list->num_rows())) < 3){
					for($i = strlen((string)$list->num_rows()); $i < 3; $i++){
						$kode = "0".$kode;
					}
				// }
				$kode = "JDW".$kode;
				return $kode;
			}
		}
		function get_specific_jadwal($id_jadwal){
			$this->db->select('*');
			$this->db->from('jadwal');
			$this->db->like('ID_JADWAL', $id_jadwal);
			$list = $this->db->get();
			if($list->num_rows() > 0){
				return $list->result_array();
			}else{
				return "kosong";
			}	
		}
		function get_list_jadwal(){
			$this->db->select('*');
			$this->db->from('jadwal');
			$list = $this->db->get();
			if($list->num_rows() > 0){
				return $list->result_array();
			}else{
				return "kosong";
			}
		}
		function insert_dokter($data){
			$this->db->insert('dokter', $data);
			return $this->db->affected_rows() > 0;
		}

		function insert_perawat($data){
			$this->db->insert('perawat', $data);
			return $this->db->affected_rows() > 0;
		}

		function insert_user($data){
			$this->db->insert('users', $data);
			return $this->db->affected_rows() > 0;
		}		

		function insert_poli($data){
			$this->db->insert('poliklinik', $data);
			return $this->db->affected_rows() > 0;
		}
		
		function insert_jadwal($data){
			$this->db->insert('jadwal', $data);
			return $this->db->affected_rows() > 0;
		}
		
		function delete_user($id_poli){
			$this->db->delete('users', array('ID_POLIKLINIK'=>$id_poli));
			return $this->db->affected_rows() > 0;
		}

		function delete_dokter($id_dokter){
			$this->db->delete('dokter', array('ID_DOKTER'=>$id_dokter));
			return $this->db->affected_rows() > 0;
		}

		function delete_perawat($id_users){
			$this->db->delete('perawat', array('ID_PERAWAT'=>$id_perawat));
			return $this->db->affected_rows() > 0;
		}

		function delete_poli($id_poli){
			$this->db->delete('poliklinik', array('ID_POLI'=>$id_poli));
			return $this->db->affected_rows() > 0;
		}
		function delete_jadwal($id_jadwal){
			$this->db->delete('jadwal', array('ID_JADWAL'=>$id_jadwal));
			return $this->db->affected_rows() > 0;
		}
		function update_user($data){
			$this->db->where('ID_USER', $data['ID_USER']);
			$this->db->update('users', $data);
			return $this->db->affected_rows() > 0;
		}

		function update_dokter($data){
			$this->db->where('ID_DOKTER', $data['ID_DOKTER']);
			$this->db->update('dokter', $data);
			return $this->db->affected_rows() > 0;
		}

		function update_perawat($data){
			$this->db->where('ID_PERAWAT', $data['ID_PERAWAT']);
			$this->db->update('perawat', $data);
			return $this->db->affected_rows() > 0;
		}

		function update_poli($data){
			$this->db->where('ID_POLI', $data['ID_POLI']);
			$this->db->update('poliklinik', $data);
			return $this->db->affected_rows() > 0;
		}
		function update_jadwal($data){
			$this->db->where('ID_JADWAL', $data['ID_JADWAL']);
			$this->db->update('jadwal', $data);
			return $this->db->affected_rows() > 0;
		}
	}
?>