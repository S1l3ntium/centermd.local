<?php

namespace Application\controllers;

use GlobalController\BaseController;
use Kalinger\Debug;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;

class MainController extends BaseController
{
    public function indexAction()
    {

        $this->optionsTemplate['title'] = 'ООО «ЦМД» | Главная';
        $this->optionsTemplate['description'] = 'Мы являемся высокотехнологичным предприятием, работающим на рынке оказания услуг по производству деталей. В процессе работы нами освоено и внедрено в производство более 1100 наименований деталей и мы постоянно расширяем номенклатуру выпускаемой продукции.';
        $this->optionsTemplate['keywords'] = 'ООО «ЦМД»';
        $this->optionsTemplate['canonical'] = $this->view->config['host'];

        $this->optionsTemplate['production'] = $this->model->getAllProduction();
        $this->optionsTemplate['productionCategories'] = $this->model->getAllProductionCategories();
        $this->optionsTemplate['portfolio'] = $this->model->getAllPortfolio();

        $this->view->render('index', $this->optionsTemplate);
    }

    public function mailAction() {
        $data = $this->ajax::getAllPost();
        /*Debug::log($data);*/
        $this->model->addTicket($data);
        $type = isset($data['type']) && $data['type'] === 'personal'
            ? 'Физическое лицо'
            : 'Юридическое лицо';

        $page = isset($data['page'])
            ? ($data['page'] === 'home'
                ? 'Главная'
                : ($data['page'] === 'about'
                    ? 'О компании'
                    : 'Обучение'))
            : 'Обучение';

        $organization = isset($data['organization']) ? $data['organization'] : '';
        $name = isset($data['name']) ? $data['name'] : '';
        $email = isset($data['email']) ? $data['email'] : '';
        $phone = isset($data['phone']) ? $data['phone'] : '';
        $description = isset($data['description']) ? $data['description'] : '';


        $mail = new PHPMailer(true); // Passing `true` enables exceptions

        try {

            /*$mail->CharSet = 'UTF-8';*/
            /*$mail->Encoding = 'base64';*/

            /*$mail->SMTPOptions = array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );*/

            //Server settings
            //$mail->SMTPDebug = 7;                                 // Enable verbose debug output
            $mail->isSMTP();                                      // Set mailer to use SMTP
            $mail->CharSet = "UTF-8";
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
            $mail->Host = 'smtp.mail.ru';                       // Specify main and backup SMTP servers
            $mail->Username = 'info@centrmd.ru';        // SMTP username
            $mail->Password = 'JvCw5iNj6iEpPFcbfdNL';                // SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            /*$mail->SMTPAutoTLS = false;
            $mail->SMTPSecure = false;*/

            $mail->Port = 465;                                    // TCP port to connect to

            //Recipients

            $mail->setFrom('info@centrmd.ru', 'ООО «ЦМД»');
            //$mail->addAddress('denis.chichmarev@gmail.com');                    // Add a recipient
            //$mail->addAddress('denis.chichmarev@mail.ru');                    // Add a recipient
            $mail->addAddress('info@centrmd.ru');                    // Add a recipient


            //Content
            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Subject = 'Заявка с сайта ООО «ЦМД»';
            $mail->Body    = 'Страница: '.$page.' <br> Вид лица: '.$type.' <br> Название организации: '.$organization.' <br>Имя: '.$name.' <br>E-mail: '.$email.' <br>Телефон: '.$phone.' <br>Описание проекта: '.$description;

            if ($mail->send()) {

                $this->ajax::sendResponse(["success" => true, "info" => "Заявка успешно создана"], 'json');

            } else {

                $this->ajax::sendResponse(["success" => false, "info" => "Ошибка создания заявки"], 'json');

            }

            exit();

        } catch (Exception $e) {

            $this->ajax::sendResponse(["info" => "{$mail->ErrorInfo}"], 'json');

        }
    }
}