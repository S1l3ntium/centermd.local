{strip}

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>404 - Страница не найдена</title>
    <link rel="shortcut icon" href="/favicon.ico" type="image/vnd.microsoft.icon">
{*    <link rel="stylesheet" href="/public/default/styles/fonts.css">*}
    <link rel="stylesheet" href="/public/default/styles/errors.css">
    <link href='//fonts.googleapis.com/css?family=Source+Sans+Pro:400,200italic,200,300,300italic,400italic,600,600italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style>
        body{
            background-color: #000!important;
            font-family: "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        }
        body::after {
            content: "";
            background-image: url(/public/default/images/404.png);
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
            color: #06093A;
            opacity: 0.7;
            font-size: 14px;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            position: absolute;
            z-index: -1;
        }
        .error .main h1,  .error .main h3, .footer p{
            color: #fff!important;
            font-family: "Source Sans Pro";
        }
        .footer p{
            margin-top: 8px;
        }
        .back{
            background: #fff!important;
            border: none!important;
            color: #06093A!important;
        }
        .back:hover{
            transform: translateY(-4px);
        }
    </style>
</head>
<body class="error">
<div class="main w3l">
    <h1>404</h1>
    <h3>Страница не найдена</h3>
    <a href="/" class="back">НА ГЛАВНУЮ</a>
    <div class="footer agileits">
        <p>ООО «ЦМД» 2024 &copy; {$smarty.now|date_format:"%Y"}</p>
    </div>
</div>

</body>
</html>

{/strip}