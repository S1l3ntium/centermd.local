<?php

namespace Application\models;

use Illuminate\Database\Capsule\Manager;
use Kalinger\Debug;
use Kalinger\Model;

class AboutModel extends Model
{
    public function getAllPartners()
    {
        $query = Manager::table('partners')->select('*')->orderBy('id', 'ASC');
        return $query->get();
    }
}
