<?php

namespace Application\controllers;

use Application\models\AdminModel;
use Exception;
use Illuminate\Support\Facades\DB;
use Kalinger\Controller;
use Kalinger\Auth;
use Kalinger\Debug;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Verot\Upload\Upload;

/**
 * @property-read AdminModel $model
 */
class AdminController extends Controller
{

    protected $auth;

    public function __construct($route, $config, $user_info)
    {

        parent::__construct($route, $config, $user_info);

        $this->auth = new Auth();
    }

    protected function renderAdminPage($name, $optionsTemplate)
    {
        if ($user = $this->auth->sentinel::check()) {
            $optionsTemplate['idUser'] = $user->id;
            $this->view->render($name, $optionsTemplate);
        } else {
            $optionsTemplate['title'] = 'ООО «ЦМД» | Вход в админ-панель';
            $this->view->render('admin-login', $optionsTemplate);
        }
    }

    public function indexAction()
    {
        $optionsTemplate = [];

        $login = isset($_POST['login']) ? trim($_POST['login']) : null;
        $password = isset($_POST['password']) ? trim($_POST['password']) : null;

        if ($login && $password) {
            $user = $this->auth->sentinel::authenticate(['email' => $login, 'password' => $password], true, true);
        } else {
            $user = $this->auth->sentinel::check();
        }

        if (!$user) {
            $optionsTemplate['error'] = 'Неправильный логин или пароль !';
            $this->renderAdminPage('admin-login', $optionsTemplate); // Изменено на admin-login
            exit(403);
        } else {
            $optionsTemplate['title'] = 'Админ-панель';
            $this->renderAdminPage('admin', $optionsTemplate);
        }
    }


    public function exitAction()
    {

        $this->auth->sentinel::logout();

        $this->view->redirect('/admin/');
    }

    /*Tickets*/

    public function ticketsAction()
    {
        $optionsTemplate['title'] = 'Заявки';
        $optionsTemplate['tickets'] = $this->model->getAllTickets();
        $this->renderAdminPage('tickets', $optionsTemplate);
    }

    public function addTicketAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->addTicket($this->ajax::getAllPost());
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);

    }

    public function updTicketAction()
    {
        if ($this->auth->sentinel::check()) {


            if ($this->model->updTicket($this->ajax::getAllPost())) {

                $data['success'] = true;
            } else {

                $data['success'] = false;
                $data['errors'][] = 'Непредвиденная ошибка';
            }
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);

    }

    public function delTicketAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->delTicket($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);
    }

    public function getTicketAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->getTicket($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);

    }

    /*Production*/

    public function productionAction()
    {
        $optionsTemplate['title'] = 'Производственная площадка';
        $optionsTemplate['production'] = $this->model->getAllProduction();
        $optionsTemplate['productionCategories'] = $this->model->getAllProductionCategories();
        $this->renderAdminPage('production', $optionsTemplate);
    }
    public function addProductionAction()
    {

        ini_set('memory_limit', '512M');
        ini_set('upload_max_filesize', '5M');
        ini_set('post_max_size', '100M');

        $data = [];
        $image = null;

        if ($this->auth->sentinel::check()) {

            if ($this->ajax::getFilePost('image')) {

                $file = $this->ajax::getFilePost('image');

                $handle = new Upload($file);

                if ($handle->uploaded) {

                    $new_name = substr(md5(time()), 0, 16);

                    $handle->file_new_name_body = $new_name;
                    $handle->file_auto_rename = true;
                    $handle->image_convert = 'webp';
                    $handle->webp_quality = 100;

                    $dir = 'data/images/production/original';

                    if (!is_dir($dir)) mkdir($dir, 0777, true);

                    $handle->process($dir);

                    if ($handle->processed) {

                        $image = $new_name . '.webp';
                    } else {

                        $image = null;
                        $data['errors'][] = 'error : ' . $handle->error;
                    }


                    $handle->clean();
                } else {

                    $image = null;
                    $data['errors'][] = 'Ошибка добавления файла';
                }
            } else {

                $image = null;
                $data['errors'][] = 'Файл не существует';
            }
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        if ($image) {

            if ($this->model->addProduction($this->ajax->getAllPost(), $image)) {

                $data['success'] = true;
            }
        }

        $this->ajax::sendResponse($data);

    }
    public function addProductCategoryAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->addProductionCategory($this->ajax::getAllPost());
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);

    }
    public function updProductionAction()
    {
        $data = [];
        $image = null;

        if (!$this->auth->sentinel::check()) {
            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
            $this->ajax::sendResponse($data);
        }

        if ($this->ajax::getFilePost('image')) {
            $handle = new Upload($this->ajax::getFilePost('image'));
            if ($handle->uploaded) {
                $new_name = substr(md5(time()), 0, 16);
                $handle->file_new_name_body = $new_name;
                $handle->file_auto_rename = true;
                $handle->image_convert = 'webp';
                $handle->webp_quality = 100;
                $dir = 'data/images/production/original';
                if (!is_dir($dir)) mkdir($dir, 0777, true);
                $handle->process($dir);
                if ($handle->processed) {
                    $image = $new_name . '.webp';
                } else {
                    $data['errors'][] = 'error : ' . $handle->error;
                    $handle->clean();
                    $this->ajax::sendResponse($data);
                }
                $handle->clean();
            }
        }

        $posts = $this->ajax->getAllPost();

        $success = $this->model->updateProduction($posts, $image) || $this->model->updateProduction($posts, null);

        $data['success'] = $success;
        $this->ajax::sendResponse($data);

    }
    public function updProductCategoryAction()
    {
        if ($this->auth->sentinel::check()) {


            if ($this->model->updateProductionCategory($this->ajax::getAllPost())) {

                $data['success'] = true;
            } else {

                $data['success'] = false;
                $data['errors'][] = 'Непредвиденная ошибка';
            }
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);

    }
    public function delProductionAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->delProduction($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);
    }
    public function delProductionImageAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->delProductionImage($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);
    }
    public function delProductCategoryAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->delProductionCategory($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);
    }
    public function getProductionAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->getProduction($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);

    }
    public function getProductCategoryAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->getProductionCategory($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);

    }

    /*Portfolio*/

    public function portfolioAction()
    {
        $optionsTemplate['title'] = 'Портфолио';
        $optionsTemplate['portfolio'] = $this->model->getAllPortfolio();
        $this->renderAdminPage('portfolio', $optionsTemplate);
    }

    public function addPortfolioItemAction()
    {

        ini_set('memory_limit', '512M');
        ini_set('upload_max_filesize', '5M');
        ini_set('post_max_size', '100M');

        $data = [];
        $image = null;

        if ($this->auth->sentinel::check()) {

            if ($this->ajax::getFilePost('image')) {

                $file = $this->ajax::getFilePost('image');

                $handle = new Upload($file);

                if ($handle->uploaded) {

                    $new_name = substr(md5(time()), 0, 16);

                    $handle->file_new_name_body = $new_name;
                    $handle->file_auto_rename = true;
                    $handle->image_convert = 'webp';
                    $handle->webp_quality = 100;

                    $dir = 'data/images/portfolio/original';

                    if (!is_dir($dir)) mkdir($dir, 0777, true);

                    $handle->process($dir);

                    if ($handle->processed) {

                        $image = $new_name . '.webp';
                    } else {

                        $image = null;
                        $data['errors'][] = 'error : ' . $handle->error;
                    }


                    $handle->clean();
                } else {

                    $image = null;
                    $data['errors'][] = 'Ошибка добавления файла';
                }
            } else {

                $image = null;
                $data['errors'][] = 'Файл не существует';
            }
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        if ($image) {

            if ($this->model->addPortfolioItem($this->ajax->getAllPost(), $image)) {

                $data['success'] = true;
            }
        }

        $this->ajax::sendResponse($data);

    }

    public function updPortfolioItemAction()
    {
        $data = [];
        $image = null;

        if (!$this->auth->sentinel::check()) {
            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
            $this->ajax::sendResponse($data);
        }

        if ($this->ajax::getFilePost('image')) {
            $handle = new Upload($this->ajax::getFilePost('image'));
            if ($handle->uploaded) {
                $new_name = substr(md5(time()), 0, 16);
                $handle->file_new_name_body = $new_name;
                $handle->file_auto_rename = true;
                $handle->image_convert = 'webp';
                $handle->webp_quality = 100;
                $dir = 'data/images/portfolio/original';
                if (!is_dir($dir)) mkdir($dir, 0777, true);
                $handle->process($dir);
                if ($handle->processed) {
                    $image = $new_name . '.webp';
                } else {
                    $data['errors'][] = 'error : ' . $handle->error;
                    $handle->clean();
                    $this->ajax::sendResponse($data);
                }
                $handle->clean();
            }
        }

        $posts = $this->ajax->getAllPost();

        $success = $this->model->updatePortfolioItem($posts, $image) || $this->model->updatePortfolioItem($posts, null);

        $data['success'] = $success;
        $this->ajax::sendResponse($data);

    }

    public function delPortfolioItemAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->delPortfolioItem($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);
    }

    public function delPortfolioItemImageAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->delPortfolioItemImage($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);
    }

    public function getPortfolioItemAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->getPortfolioItem($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);

    }

    /*Partners*/

    public function partnersAction()
    {
        $optionsTemplate['title'] = 'Партнеры';
        $optionsTemplate['partners'] = $this->model->getAllPartners();
        $this->renderAdminPage('partners', $optionsTemplate);
    }

    public function addPartnerAction()
    {

        $data = [];
        $image = null;

        if (!$this->auth->sentinel::check()) {
            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
            $this->ajax::sendResponse($data);
        }

        if ($this->ajax::getFilePost('image')) {
            $handle = new Upload($this->ajax::getFilePost('image'));
            if ($handle->uploaded) {
                $new_name = substr(md5(time()), 0, 16);
                $handle->file_new_name_body = $new_name;
                $handle->file_auto_rename = true;
                $handle->image_convert = 'webp';
                $handle->webp_quality = 100;
                $dir = 'data/images/partners/original';
                if (!is_dir($dir)) mkdir($dir, 0777, true);
                $handle->process($dir);
                if ($handle->processed) {
                    $image = $new_name . '.webp';
                } else {
                    $data['errors'][] = 'error : ' . $handle->error;
                    $handle->clean();
                    $this->ajax::sendResponse($data);
                }
                $handle->clean();
            }
        }

        $posts = $this->ajax->getAllPost();

        $success = $this->model->addPartner($posts, $image) || $this->model->addPartner($posts, null);

        $data['success'] = $success;
        $this->ajax::sendResponse($data);

    }

    public function updPartnerAction()
    {
        $data = [];
        $image = null;

        if (!$this->auth->sentinel::check()) {
            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
            $this->ajax::sendResponse($data);
        }

        if ($this->ajax::getFilePost('image')) {
            $handle = new Upload($this->ajax::getFilePost('image'));
            if ($handle->uploaded) {
                $new_name = substr(md5(time()), 0, 16);
                $handle->file_new_name_body = $new_name;
                $handle->file_auto_rename = true;
                $handle->image_convert = 'webp';
                $handle->webp_quality = 100;
                $dir = 'data/images/partners/original';
                if (!is_dir($dir)) mkdir($dir, 0777, true);
                $handle->process($dir);
                if ($handle->processed) {
                    $image = $new_name . '.webp';
                } else {
                    $data['errors'][] = 'error : ' . $handle->error;
                    $handle->clean();
                    $this->ajax::sendResponse($data);
                }
                $handle->clean();
            }
        }

        $posts = $this->ajax->getAllPost();

        $success = $this->model->updatePartner($posts, $image) || $this->model->updatePartner($posts, null);

        $data['success'] = $success;
        $this->ajax::sendResponse($data);

    }

    public function delPartnerAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->delPartner($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);
    }

    public function delPartnerImageAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->delPartnerImage($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);
    }

    public function getPartnerAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->getPartner($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);

    }

    /*Licenses*/

    public function licensesAction()
    {
        $optionsTemplate['title'] = 'Лицензии';
        $optionsTemplate['licenses'] = $this->model->getAllLicenses();
        $this->renderAdminPage('licenses', $optionsTemplate);
    }

    public function addLicenseAction()
    {

        ini_set('memory_limit', '512M');
        ini_set('upload_max_filesize', '5M');
        ini_set('post_max_size', '100M');

        $data = [];
        $image = null;

        if ($this->auth->sentinel::check()) {

            if ($this->ajax::getFilePost('image')) {

                $file = $this->ajax::getFilePost('image');

                $handle = new Upload($file);

                if ($handle->uploaded) {

                    $new_name = substr(md5(time()), 0, 16);

                    $handle->file_new_name_body = $new_name;
                    $handle->file_auto_rename = true;
                    $handle->image_convert = 'webp';
                    $handle->webp_quality = 100;

                    $dir = 'data/images/licenses/original';

                    if (!is_dir($dir)) mkdir($dir, 0777, true);

                    $handle->process($dir);

                    if ($handle->processed) {

                        $image = $new_name . '.webp';
                    } else {

                        $image = null;
                        $data['errors'][] = 'error : ' . $handle->error;
                    }


                    $handle->clean();
                } else {

                    $image = null;
                    $data['errors'][] = 'Ошибка добавления файла';
                }
            } else {

                $image = null;
                $data['errors'][] = 'Файл не существует';
            }
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        if ($image) {

            if ($this->model->addLicense($this->ajax->getAllPost(), $image)) {

                $data['success'] = true;
            }
        }

        $this->ajax::sendResponse($data);

    }

    public function updLicenseAction()
    {
        $data = [];
        $image = null;

        if (!$this->auth->sentinel::check()) {
            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
            $this->ajax::sendResponse($data);
        }

        if ($this->ajax::getFilePost('image')) {
            $handle = new Upload($this->ajax::getFilePost('image'));
            if ($handle->uploaded) {
                $new_name = substr(md5(time()), 0, 16);
                $handle->file_new_name_body = $new_name;
                $handle->file_auto_rename = true;
                $handle->image_convert = 'webp';
                $handle->webp_quality = 100;
                $dir = 'data/images/licenses/original';
                if (!is_dir($dir)) mkdir($dir, 0777, true);
                $handle->process($dir);
                if ($handle->processed) {
                    $image = $new_name . '.webp';
                } else {
                    $data['errors'][] = 'error : ' . $handle->error;
                    $handle->clean();
                    $this->ajax::sendResponse($data);
                }
                $handle->clean();
            }
        }

        $posts = $this->ajax->getAllPost();

        $success = $this->model->updateLicense($posts, $image) || $this->model->updateLicense($posts, null);

        $data['success'] = $success;
        $this->ajax::sendResponse($data);

    }

    public function delLicenseAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->delLicense($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);
    }

    public function delLicenseImageAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->delLicenseImage($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);
    }

    public function getLicenseAction()
    {
        if ($this->auth->sentinel::check()) {

            $data['success'] = true;
            $data['data'] = $this->model->getLicense($this->ajax::getElementPost('id'));
        } else {

            $data['success'] = false;
            $data['errors'][] = 'Нет доступа';
        }

        $this->ajax::sendResponse($data);

    }

}
