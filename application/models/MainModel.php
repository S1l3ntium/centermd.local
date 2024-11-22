<?php

namespace Application\models;

use GlobalModel\BaseModel;
use Illuminate\Database\Capsule\Manager;
use Illuminate\Support\Facades\DB;

class MainModel extends BaseModel
{
    public function getAllPortfolio()
    {
        $query = Manager::table('portfolio')->select('*')->orderBy('title', 'ASC');
        return $query->get();
    }

    public function getAllProductionCategories()
    {
        $query = Manager::table('production_categories')->select('*')->orderBy('title', 'ASC');
        return $query->get();
    }

    public function getAllProduction()
    {
        $query = Manager::table('production')->select('*')->orderBy('title', 'ASC');
        return $query->get();
    }

    public function addTicket($data) {

        $dataToInsert = [
            'page' => $data['page'],
            'org_type' => $data['type'],
            'org_name' => $data['organization'] ?? null,
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'description' => $data['description'] ?? null,
        ];

        $query = Manager::table('tickets')->insert($dataToInsert);

        return $query;
    }
}
