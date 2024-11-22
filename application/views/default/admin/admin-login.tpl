{strip}
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta name="robots" content="noindex, nofollow"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="/favicon.ico" type="image/vnd.microsoft.icon">

        {if isset($title)}<title>{$title}</title>{/if}

        {*Include Styles*}

        {*{combine input = $inputGlobalCssArray output = $outputGlobalCssPath age = '3' debug = false}*}

        {*{assign var=unique_version value=0|mt_rand:9999}*}

        {*{foreach $inputGlobalCssArray as $key => $css}
            <link type="text/css" rel="stylesheet" href="{$css}?v=*}{*{$unique_version}*}{*">
        {/foreach}*}

        <link rel="stylesheet" href="{$templateWebPath}styles/admin.css">
        <link rel="stylesheet" href="{$templateWebPath}libraries/fontawesome/css/all.css">
        <link rel="stylesheet" href="{$templateWebPath}libraries/bootstrap/css/bootstrap.min.css">

        {*    {foreach $css as $c}*}
        {*        <link rel="stylesheet" href="{$templateWebPath}{$c}">*}
        {*    {/foreach}*}

    </head>
    <body>
    {if $debug} {debug} {/if}
    <div id="login">
        {if isset($errors)}
            <div class="alert alert-danger my-2 w-100 text-center"><span>{$errors}</span></div>
        {/if}

        <form action="/admin/" method="POST">
            <fieldset class="clearfix">
                <a class="logo-as" href="/">
                    <img src="{$templateWebPath}images/logo/logo.svg" alt="Центр металлообработки деталей">
                </a>
                <p>
                    <span class="fontawesome-user">
                        <i class="fal fa-user"></i>
                    </span>
                    <input type="text" name="login" value="Логин" onBlur="if(this.value == '') this.value = 'Логин'" onFocus="if(this.value == 'Логин') this.value = ''" required>
                </p>
                <p>
                    <span class="fontawesome-lock">
                        <i class="fal fa-lock-alt"></i>
                    </span>
                    <input type="password" name="password" value="Пароль" onBlur="if(this.value == '') this.value = 'Пароль'" onFocus="if(this.value == 'Пароль') this.value = ''" required>
                </p>
                <p><input type="submit" value="ВОЙТИ"></p>
            </fieldset>
        </form>
    </div>
    </body>
    </html>
{/strip}