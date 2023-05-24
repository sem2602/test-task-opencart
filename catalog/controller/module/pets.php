<?php
class ControllerModulePets extends Controller
{

    public function index(){

        $customer_id = (int)$this->customer->getId();

        $this->load->model('module/pets');

        $data['customer_pets'] = $this->model_module_pets->getCustomerPets($customer_id);





//        echo '<pre>';
//        var_dump($data);
//        exit;


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pets.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/pets.tpl', $data);
        } else {
            return $this->load->view('default/template/module/pets.tpl', $data);
        }


    }
}
