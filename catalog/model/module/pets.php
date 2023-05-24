<?php
class ModelModulePets extends Model
{

    public function getCustomerPets($customer_id)
    {

        $query = $this->db->query("SELECT cp.id, p.title AS pet, b.title AS breed 
            FROM ((pm_customer_pets AS cp
            INNER JOIN pm_pets AS p ON cp.pet_id = p.id)
            INNER JOIN pm_breeds AS b ON cp.breed_id = b.id) 
            WHERE customer_id = '" . (int)$customer_id . "'");

        return $query->rows;


    }

    public function getPets()
    {

        $query = $this->db->query("SELECT p.id AS pet_id, p.title AS pet, b.id AS breed_id, b.title AS breed 
            FROM pm_breeds b
            INNER JOIN pm_pets p ON b.pet_id = p.id");

        return $query->rows;


    }



}