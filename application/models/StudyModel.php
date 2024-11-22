<?php

namespace Application\models;

use Illuminate\Database\Capsule\Manager;
use Kalinger\Debug;
use Kalinger\Model;

class StudyModel extends Model
{
    public function getAllLicenses()
    {
        $query = Manager::table('licenses')->select('*')->orderBy('id', 'DESC');
        return $query->get();
    }
}
