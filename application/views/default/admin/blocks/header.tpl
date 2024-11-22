{strip}
    <!DOCTYPE html>
<html lang="{$config['site_language']}" style="opacity: 1 !important">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        {if isset($title)}<title>{$title}</title>{/if}
        {if isset($description)}
            <meta name="description" content="{$description}">{/if}
        {if isset($keywords)}
            <meta name="keywords" content="{$keywords}">{/if}

        {foreach $config['languages'] as $lang}
            {if $lang == $config['default_language']}
                <link rel="alternate" hreflang="{$config['default_language']}" href="{$config['host']}{$config['uri']}">
            {else}
                <link rel="alternate" hreflang="{$lang}" href="{$config['host']}/{$lang}{$config['uri']}">
            {/if}
        {/foreach}

        {*Include Styles*}

        {*{combine input = $inputGlobalCssArray output = $outputGlobalCssPath age = '3' debug = true}*}

        {*{assign var=unique_version value=0|mt_rand:9999}*}

        {foreach $inputGlobalCssArray as $key => $css}
            <link type="text/css" rel="stylesheet" href="{$css}?v={*{$unique_version}*}">
        {/foreach}

        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

        <link rel="stylesheet" href="../../../../public/default/libraries/flatpickr/css/flatpickr.min.css">


        {if ($page === 'licenses')}
            <link href="https://unpkg.com/filepond@^4/dist/filepond.css" rel="stylesheet" />
            <script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
            <script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>
            <script src="https://unpkg.com/filepond@^4/dist/filepond.js"></script>
        {/if}

        <link rel="stylesheet" href="../../../../public/default/libraries/bootstrap/css/bootstrap.min.css">
        <script src="../../../../public/default/libraries/bootstrap/js/bootstrap.bundle.js"></script>

    </head>
<body class="hold-transition sidebar-mini admin-panel page-{$page}">

    {if $debug} {debug} {/if}

{/strip}