<?php

namespace Application\controllers;

use GlobalController\BaseController;
use Kalinger\Debug;

class StudyController extends BaseController
{
    public function indexAction()
    {

        $this->optionsTemplate['title'] = 'ООО «ЦМД» | Профессиональное обучение';
        $this->optionsTemplate['description'] = 'Мы являемся высокотехнологичным предприятием, работающим на рынке оказания услуг по производству деталей. В процессе работы нами освоено и внедрено в производство более 1100 наименований деталей и мы постоянно расширяем номенклатуру выпускаемой продукции.';
        $this->optionsTemplate['keywords'] = 'ООО «ЦМД»';
        $this->optionsTemplate['canonical'] = $this->view->config['host'];
        $this->optionsTemplate['licenses'] = $this->model->getAllLicenses();

        $this->view->render('study', $this->optionsTemplate);
    }
}