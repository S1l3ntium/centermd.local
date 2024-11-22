<?php

namespace Application\models;

use Cocur\Slugify\Slugify;
use Illuminate\Database\Capsule\Manager;
use Illuminate\Support\Facades\DB;
use Kalinger\DateTime;
use Kalinger\Debug;
use Kalinger\Model;
use Kalinger\Url;

class AdminModel extends Model
{

    /*Tickets*/

    public function getAllTickets()
    {
        $query = Manager::table('tickets')->select('*');
        return $query->get();
    }

    public function getTicket($id) {
        $query = Manager::table('tickets')
            ->where('id', $id)
            ->select('*');
        return $query->get();
    }

    /*Production Categories*/
    public function getAllProductionCategories()
    {
        $query = Manager::table('production_categories')->select('*')->orderBy('title', 'DESC');
        return $query->get();
    }
    public function addProductionCategory($data) {

        return $this->DB->add("
                INSERT INTO `production_categories` 
                SET  
                    `title` = ?",
            [
                $data['title']
            ]);

    }
    public function delProductionCategory($id) {
        $query = Manager::table('production_categories')->where('id', $id)->delete();
        return $query > 0; // Возвращаем true, если количество удаленных записей больше нуля
    }
    public function getProductionCategory($id) {

        $query = $this->DB->getRow("SELECT * FROM `production_categories` g WHERE g.id=?", [$id]);

        return $query;
    }
    public function updateProductionCategory($data)
    {

        $sql = "
                UPDATE `production_categories` 
                SET  
                    `title` = ? 
                WHERE `id` = ?";

        $parameters = [
            $data['title'],
            $data['id']
        ];


        return $this->DB->set($sql, $parameters);
    }

    /*Production*/

    public function getAllProduction()
    {
        $query = Manager::table('production')->select('*')->orderBy('title', 'DESC');
        return $query->get();
    }
    public function addProduction($data, $image) {

        return $this->DB->add("
                INSERT INTO `production` 
                SET  
                    `image` = ?, 
                    `title` = ?,
                    `specs` = ?,
                    `category` = ?",
            [
                $image,
                $data['title'],
                $data['specs'],
                $data['category'],

            ]);

    }
    public function delProduction($id) {
        $query = Manager::table('production')->where('id', $id)->delete();
        return $query > 0; // Возвращаем true, если количество удаленных записей больше нуля
    }
    public function getProduction($id) {

        $query = $this->DB->getRow("SELECT * FROM `production` g WHERE g.id=?", [$id]);

        return $query;
    }
    public function delProductionImage($id) {

        $query = $this->DB->set("UPDATE `production` set `image` = NULL WHERE `id` = ?", [$id]);

        return $query;

    }
    public function updateProduction($data, $image)
    {
        if ($image != null) {
            $sql = "
                UPDATE `production` 
                SET 
                    `image` = ?, 
                    `title` = ?,
                    `specs` = ?,
                    `category` = ? 
                WHERE `id` = ?";

            $parameters = [
                $image,
                $data['title'],
                $data['specs'],
                $data['category'],
                $data['id']
            ];

        } else {
            $sql = "
                UPDATE `production` 
                SET  
                    `title` = ?,
                    `specs` = ?,
                    `category` = ? 
                WHERE `id` = ?";

            $parameters = [
                $data['title'],
                $data['specs'],
                $data['category'],
                $data['id']
            ];
        }

        return $this->DB->set($sql, $parameters);
    }

    /*Portfolio*/

    public function getAllPortfolio()
    {
        $query = Manager::table('portfolio')->select('*')->orderBy('title', 'DESC');
        return $query->get();
    }

    public function addPortfolioItem($data, $image) {

        return $this->DB->add("
                INSERT INTO `portfolio` 
                SET  
                    `title` = ?, 
                    `material` = ?, 
                    `type` = ?, 
                    `image` = ?",
            [
                $data['title'],
                $data['material'],
                $data['type'],
                $image
            ]);

    }

    public function delPortfolioItem($id) {
        $query = Manager::table('portfolio')->where('id', $id)->delete();
        return $query > 0; // Возвращаем true, если количество удаленных записей больше нуля
    }

    public function getPortfolioItem($id) {

        $query = $this->DB->getRow("SELECT * FROM `portfolio` g WHERE g.id=?", [$id]);

        return $query;
    }

    public function delPortfolioItemImage($id) {

        $query = $this->DB->set("UPDATE `portfolio` set `image` = NULL WHERE `id` = ?", [$id]);

        return $query;

    }

    public function updatePortfolioItem($data, $image)
    {
        if ($image != null) {
            $sql = "
                UPDATE `portfolio` 
                SET 
                    `title` = ?, 
                    `material` = ?, 
                    `type` = ?, 
                    `image` = ? 
                WHERE `id` = ?";

            $parameters = [
                $data['title'],
                $data['material'],
                $data['type'],
                $image,
                $data['id']
            ];

        } else {
            $sql = "
                UPDATE `portfolio` 
                SET 
                    `title` = ?, 
                    `material` = ?,
                    `type` = ? 
                WHERE `id` = ?";

            $parameters = [
                $data['title'],
                $data['material'],
                $data['type'],
                $data['id']
            ];
        }

        return $this->DB->set($sql, $parameters);
    }

    /*Partners*/

    public function getAllPartners()
    {
        $query = Manager::table('partners')->select('*')->orderBy('title', 'DESC');
        return $query->get();
    }

    public function addPartner($data, $image) {

        if ($image != null) {
            $sql = "
                INSERT INTO `partners` 
                SET 
                    `title` = ?, 
                    `image` = ?";

            $parameters = [
                $data['title'],
                $image
            ];

        } else {
            $sql = "
                INSERT INTO `partners` 
                SET 
                    `title` = ?";

            $parameters = [
                $data['title']
            ];
        }

        return $this->DB->set($sql, $parameters);

    }

    public function delPartner($id) {
        $query = Manager::table('partners')->where('id', $id)->delete();
        return $query > 0; // Возвращаем true, если количество удаленных записей больше нуля
    }

    public function getPartner($id) {

        $query = $this->DB->getRow("SELECT * FROM `partners` g WHERE g.id=?", [$id]);

        return $query;
    }

    public function delPartnerImage($id) {

        $query = $this->DB->set("UPDATE `partners` set `image` = NULL WHERE `id` = ?", [$id]);

        return $query;

    }

    public function updatePartner($data, $image)
    {
        if ($image != null) {
            $sql = "
                UPDATE `partners` 
                SET 
                    `title` = ?, 
                    `image` = ? 
                WHERE `id` = ?";

            $parameters = [
                $data['title'],
                $image,
                $data['id']
            ];

        } else {
            $sql = "
                UPDATE `partners` 
                SET 
                    `title` = ? 
                WHERE `id` = ?";

            $parameters = [
                $data['title'],
                $data['id']
            ];
        }

        return $this->DB->set($sql, $parameters);
    }

    /*Licenses*/

    public function getAllLicenses()
    {
        $query = Manager::table('licenses')->select('*')->orderBy('title', 'DESC');
        return $query->get();
    }

    public function addLicense($data, $image) {

        return $this->DB->add("
                INSERT INTO `licenses` 
                SET  
                    `title` = ?, 
                    `description` = ?, 
                    `image` = ?",
                [
                    $data['title'],
                    $data['description'],
                    $image
                ]);

    }

    public function delLicense($id) {
        $query = Manager::table('licenses')->where('id', $id)->delete();
        return $query > 0; // Возвращаем true, если количество удаленных записей больше нуля
    }

    public function getLicense($id) {

        $query = $this->DB->getRow("SELECT * FROM `licenses` g WHERE g.id=?", [$id]);

        return $query;
    }

    public function delLicenseImage($id) {

        $query = $this->DB->set("UPDATE `licenses` set `image` = NULL WHERE `id` = ?", [$id]);

        return $query;

    }

    public function updateLicense($data, $image)
    {
        if ($image != null) {
            $sql = "
                UPDATE `licenses` 
                SET 
                    `title` = ?, 
                    `description` = ?, 
                    `image` = ? 
                WHERE `id` = ?";

            $parameters = [
                $data['title'],
                $data['description'],
                $image,
                $data['id']
            ];

        } else {
            $sql = "
                UPDATE `licenses` 
                SET 
                    `title` = ?, 
                    `description` = ? 
                WHERE `id` = ?";

            $parameters = [
                $data['title'],
                $data['description'],
                $data['id']
            ];
        }

        return $this->DB->set($sql, $parameters);
    }

}
