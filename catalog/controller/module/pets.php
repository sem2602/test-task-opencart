<?php
class ControllerModulePets extends Controller
{

    public function index(){

        $customer_id = (int)$this->customer->getId();
        $data['customer_id'] = $customer_id;

        $this->load->model('module/pets');

        $data['customer_pets'] = $this->model_module_pets->getCustomerPets($customer_id);

        $pets = $this->model_module_pets->getPets();

        $pets_list = [];
        $breed_list = [];
        foreach ($pets as $pet){

            $pets_list[$pet['pet_id']] = $pet['pet'];

            $breed_list[$pet['pet_id']][] = [
                'id' => $pet['breed_id'],
                'breed' => $pet['breed'],
            ];

        }

        $data['pets_list'] = $pets_list;
        $data['breed_list'] = $breed_list;


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pets.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/pets.tpl', $data);
        } else {
            return $this->load->view('default/template/module/pets.tpl', $data);
        }

    }

    public function add(){

        $post = $this->request->post;

        $this->load->model('module/pets');
        $this->model_module_pets->addPet($post);
        $data['customer_pets'] = $this->model_module_pets->getCustomerPets($post['customer_id']);

        echo json_encode(['data' => $data]);

    }

    public function delete(){

        $post = $this->request->post;

        $this->load->model('module/pets');
        $this->model_module_pets->deletePet($post['id']);
        $data['customer_pets'] = $this->model_module_pets->getCustomerPets($post['customer_id']);

        echo json_encode(['data' => $data]);

    }

}
