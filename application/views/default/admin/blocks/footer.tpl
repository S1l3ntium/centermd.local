{strip}

    {*Include Scripts*}

    {*{combine input = $inputGlobalJsArray output = $outputGlobalJsPath age = '3' debug = true}*}

    {*{assign var=unique_version value=0|mt_rand:9999}*}

    {foreach $inputGlobalJsArray as $key => $js}
        <script src="{$js}?v={*{$unique_version}*}"></script>
    {/foreach}

    </body>
    </html>
{/strip}