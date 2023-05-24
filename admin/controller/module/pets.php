<?php
class ControllerModulePets extends Controller
{

    public function install(){

        $this->load->model('setting/setting');
        $this->model_setting_setting->editSetting('pets', array('pets_status' => 1));

        $data['name'] = 'pets';
        $data['layout_route'][] = [
            'store_id' => 0,
            'route' => 'account/account',
        ];
        $data['layout_module'][] = [
            'code' => 'pets',
            'position' => 'content_top',
            'sort_order' => 0,
        ];

        $this->load->model('design/layout');
        $this->model_design_layout->addLayout($data);

    }

    public function uninstall(){

        $this->load->model('setting/setting');
        $this->model_setting_setting->deleteSetting('pets');

//        $this->load->model('design/layout');
//        $this->model_design_layout->deleteLayoutByCode('pets');


    }

}
