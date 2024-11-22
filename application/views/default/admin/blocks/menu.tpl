{strip}
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="/admin" class="brand-link">
        <img src="{$templateWebPath}images/logo/logo.svg" alt="Центр металлообработки деталей" class="brand-image" >
        <span class="brand-text font-weight-light" style="margin-left: 14px">{$LANG['WORDS']['ADMIN']}</span>
    </a>
    <div class="sidebar">
{*        <div class="user-panel mt-3 pb-3 mb-3 d-flex">*}
{*            *}{*<div class="image">*}
{*                <img src="{$templateWebPath}images/user.png" class="img-circle elevation-2" alt="User Image">*}
{*            </div>*}
{*            <div class="info">*}
{*                <a href="#" class="d-block" data-toggle="modal" data-target="#user-profile">Профиль</a>*}
{*            </div>*}
{*        </div>*}
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a class="nav-link {if $page == 'tickets'}active{/if}" href="{SmartyExtensions->URL uri="/admin/tickets/"}" class="nav-link">
                        <i class="nav-icon fas fa-comments-alt"></i>
                        <p>Заявки</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {if $page == 'production'}active{/if}" href="{SmartyExtensions->URL uri="/admin/production/"}" class="nav-link">
                        <i class="nav-icon fas fa-industry-alt"></i>
                        <p>Производственная <br> площадка</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {if $page == 'portfolio'}active{/if}" href="{SmartyExtensions->URL uri="/admin/portfolio/"}" class="nav-link">
                        <i class="nav-icon fas fa-cogs"></i>
                        <p>Портфолио</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {if $page == 'partners'}active{/if}" href="{SmartyExtensions->URL uri="/admin/partners/"}" class="nav-link">
                        <i class="nav-icon fas fa-handshake"></i>
                        <p>Партнеры</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {if $page == 'licenses'}active{/if}" href="{SmartyExtensions->URL uri="/admin/licenses/"}" class="nav-link">
                        <i class="nav-icon fas fa-file-certificate"></i>
                        <p>Лицензии</p>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</aside>
{*<div class="modal fade" id="user-profile">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Личные данные</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                    <div class="row">
                        <div class="col-7">
                            <h2 class="lead"><b>Ваше Имя</b></h2>
                            <p class="text-muted text-sm">Статус</p>
                            <h6><b>Информация:</b></h6>
                            <ul class="profile-user-line-info ml-4 mb-0 fa-ul text-muted">
                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-envelope-open-text"></i></span> Почта: <a href="mailto:rkalinger@auto-sputnik.ru">mail@mail.ru</a></li>
                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> Рабочий телефон: 555</li>
                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-mobile"></i></span> Мобильный телефон: <a href="tel:89100409097">8(999)-999-99-99</a></li>
                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-flower"></i></span> ICQ: @rtyrtyr</li>
                            </ul>
                        </div>
                        <div class="col-5 text-center">
                            <img src="{$templateWebPath}images/user2-160x160.jpg" alt="" class="img-circle img-fluid">
                        </div>
                    </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-danger" onclick="location.href='/admin/exit/'">Выход из админ панели</button>
                <button type="button" class="btn btn-primary">Сохранить изменения</button>
            </div>
        </div>
    </div>
</div>*}
{/strip}