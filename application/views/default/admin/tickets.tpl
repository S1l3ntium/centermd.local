{strip}
{include file="admin/blocks/header.tpl"}

<div class="wrapper">

    {include file="admin/blocks/navbar.tpl"}

    {include file="admin/blocks/menu.tpl"}


    <div class="content-wrapper">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark text-left">Заявки</h1>
                    </div>
                    <div class="col-sm-6">
                        {include file="admin/blocks/breadcrumb.tpl"}
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card mb-5 card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">Список заявок</h3>
                            </div>
                            <div class="card-body">
                                <table id="table-tickets" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Источник</th>
                                        <th>Тип <br> лица</th>
                                        <th>Название <br> организации</th>
                                        <th>Имя</th>
                                        <th>E-mail</th>
                                        <th>Телефон</th>
                                        <th>Описание</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    {foreach $tickets as $ticket}
                                        <tr>
                                            <td>
                                                {if $ticket->page === 'home'}
                                                    Главная
                                                {elseif $ticket->page === 'about'}
                                                    О компании
                                                {else}
                                                    Обучение
                                                {/if}
                                            </td>
                                            <td>
                                                {if $ticket->org_type === 'personal'}
                                                    Физическое лицо
                                                {else}
                                                    Юридическое лицо
                                                {/if}
                                            </td>
                                            <td>
                                                {$ticket->org_name}
                                            </td>
                                            <td>{$ticket->name}</td>
                                            <td>{$ticket->email}</td>
                                            <td>{$ticket->phone}</td>
                                            <td>{$ticket->description}</td>
                                        </tr>
                                    {/foreach}

                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>Источник</th>
                                        <th>Тип <br> лица</th>
                                        <th>Название <br> организации</th>
                                        <th>Имя</th>
                                        <th>E-mail</th>
                                        <th>Телефон</th>
                                        <th>Описание</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    {include file="admin/blocks/copyright.tpl"}

</div>

{include file="admin/blocks/footer.tpl"}
{/strip}
