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
                            <h1 class="m-0 text-dark text-left">Портфолио</h1>
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
                                    <h3 class="card-title">Список портфолио</h3>
                                </div>
                                <div class="card-body">
                                    <button type="button" class="btn btn-block btn-outline-primary"
                                            style="width: 240px;margin-bottom: 20px;" data-toggle="modal"
                                            data-target="#add-portfolioItem">Добавить деталь
                                    </button>
                                    <table id="table-portfolio" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Фото</th>
                                            <th>Название</th>
                                            <th>Материал</th>
                                            <th>Тип обработки</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        {foreach $portfolio as $portfolioItem}
                                            <tr>
                                                <td style="text-align: center">
                                                    <img src="/data/images/portfolio/original/{$portfolioItem->image}" alt="" style="max-width: 300px; border-radius: 10px; height: 100px">
                                                </td>
                                                <td>
                                                    {$portfolioItem->title}
                                                </td>
                                                <td>
                                                    {$portfolioItem->material}
                                                </td>
                                                <td>
                                                    {$portfolioItem->type}
                                                </td>
                                                <td>
                                                    <div class="buttons-list">
                                                        <div class="button-edit new-edit btn btn-sm btn-warning" title="Редактировать"
                                                             data-id="{$portfolioItem->id}" data-toggle="modal"
                                                             data-target="#update-portfolioItem" onclick="getPortfolioItem(this);">
                                                            <i class="fal fa-edit"></i>
                                                        </div>
                                                        <div class="button-delate new-delate btn btn-sm btn-danger" title="Удалить"
                                                             data-id="{$portfolioItem->id}" onclick="delPortfolioItem(this);">
                                                            <i class="fal fa-trash-alt"></i>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        {/foreach}
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Фото</th>
                                            <th>Название</th>
                                            <th>Материал</th>
                                            <th>Тип обработки</th>
                                            <th></th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="add-portfolioItem">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Добавить новую деталь</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form role="form" id="addPortfolioItem">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="titleInput">Фото</label>
                                            <input style="height: fit-content" type="file" aria-describedby="filesInputHelp" class="form-control" name="image" id="filesInput" accept=".jpeg, .jpg, .heic, .png" placeholder="Добавьте изображение">
                                            <small id="filesInputHelp" class="form-text text-muted">Максимальный размер файла — 5 Мб</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="nameInput">Название</label>
                                            <input type="text" class="form-control" name="title" id="nameInput"
                                                   placeholder="Введите название">
                                        </div>
                                        <div class="form-group">
                                            <label for="nameInput">Материал</label>
                                            <input type="text" class="form-control" name="material" id="materialInput"
                                                   placeholder="Введите материал">
                                        </div>
                                        <div class="form-group">
                                            <label for="nameInput">Тип обработки</label>
                                            <input type="text" class="form-control" name="type" id="typeInput"
                                                   placeholder="Введите тип обработки">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer justify-content-flex-end">
                                <button type="button" class="btn btn-primary save-portfolioItem">Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="update-portfolioItem">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Редактировать партнера</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form role="form" id="updatePortfolioItem">
                                    <input type="hidden" name="id" id="inputId">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="titleInput">Изображение</label>
                                            <div class="image-container my-2"></div>
                                            <input style="height: fit-content" type="file" aria-describedby="filesInputHelp" class="form-control" name="image" id="filesInput" accept=".jpeg, .jpg, .heic, .png" placeholder="Добавьте изображение">
                                            <small id="filesInputHelp" class="form-text text-muted">Максимальный размер файла — 5 Мб</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="nameInput">Название</label>
                                            <input type="text" class="form-control" name="title" id="nameInput"
                                                   placeholder="Введите название">
                                        </div>
                                        <div class="form-group">
                                            <label for="nameInput">Материал</label>
                                            <input type="text" class="form-control" name="material" id="materialInput"
                                                   placeholder="Введите материал">
                                        </div>
                                        <div class="form-group">
                                            <label for="nameInput">Тип обработки</label>
                                            <input type="text" class="form-control" name="type" id="typeInput"
                                                   placeholder="Введите тип обработки">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer justify-content-flex-end">
                                <button type="button" class="btn btn-primary update-portfolioItem">Сохранить</button>
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
