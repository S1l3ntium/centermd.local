<?php

namespace GlobalController;

use Kalinger\Controller;
use Kalinger\DBM;
use Kalinger\Debug;

class BaseController extends Controller
{

    public function __construct($route, $config, $user_info)
    {
        parent::__construct($route, $config, $user_info);
    }

}