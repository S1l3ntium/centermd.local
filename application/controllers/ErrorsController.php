<?php

namespace Application\controllers;

use Kalinger\Errors;

class ErrorsController extends Errors {

    public function errorAction($code) {

        http_response_code($code);

        $optionsTemplate = [];

        $this->view->render($code, $optionsTemplate);

        exit;

    }

}