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
                        <h1 class="m-0 text-dark text-left">Лицензии</h1>
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
                                <h3 class="card-title">Список лицензий</h3>
                            </div>
                            <div class="card-body">
                                <button type="button" class="btn btn-block btn-outline-primary"
                                        style="width: 240px;margin-bottom: 20px;" data-toggle="modal"
                                        data-target="#add-license">Добавить лицензию
                                </button>
                                <table id="table-licenses" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Лицензия</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    {foreach $licenses as $license}
                                        <tr>
                                            <td style="text-align: center">
                                                <img src="/data/images/licenses/original/{$license->image}" alt="" style="max-width: 300px; border-radius: 10px; height: 100px; object-fit: contain">
                                            </td>
                                            <td>
                                                <div class="buttons-list">
                                                    <div class="button-edit new-edit btn btn-sm btn-warning" title="Редактировать"
                                                         data-id="{$license->id}" data-toggle="modal"
                                                         data-target="#update-license" onclick="getLicense(this);">
                                                        <i class="fal fa-edit"></i>
                                                    </div>
                                                    <div class="button-delate new-delate btn btn-sm btn-danger" title="Удалить"
                                                         data-id="{$license->id}" onclick="delLicense(this);">
                                                        <i class="fal fa-trash-alt"></i>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>Лицензия</th>
                                        <th></th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="add-license">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Добавить новую лицензию</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form role="form" id="addLicense">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="titleInput">Изображение</label>
                                        <input style="height: fit-content" type="file" aria-describedby="filesInputHelp" class="form-control" name="image" id="filesInput" accept=".jpeg, .jpg, .heic, .png" placeholder="Добавьте изображение">
                                        <small id="filesInputHelp" class="form-text text-muted">Максимальный размер файла — 5 Мб</small>
                                    </div>
                                    {*<div class="form-group">
                                        <label for="nameInput">Заголовок</label>
                                        <input type="text" class="form-control" name="title" id="nameInput"
                                               placeholder="Введите заголовок">
                                    </div>
                                    <div class="form-group">
                                        <label for="descriptionInput">Текст описания</label>
                                        <textarea class="form-control textarea"
                                                  name="description"
                                                  id="descriptionInput"
                                                  placeholder="Введите текст описания"></textarea>
                                    </div>*}
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer justify-content-flex-end">
                            <button type="button" class="btn btn-primary save-license">Сохранить</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="update-license">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Редактировать лицензию</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form role="form" id="updateLicense">
                                <input type="hidden" name="id" id="inputId">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="titleInput">Изображение</label>
                                        <div class="image-container my-2"></div>
                                        <input style="height: fit-content" type="file" aria-describedby="filesInputHelp" class="form-control" name="image" id="filesInput" accept=".jpeg, .jpg, .heic, .png" placeholder="Добавьте изображение">
                                        <small id="filesInputHelp" class="form-text text-muted">Максимальный размер файла — 5 Мб</small>
                                    </div>
                                    {*<div class="form-group">
                                        <label for="nameInput">Заголовок</label>
                                        <input type="text" class="form-control" name="title" id="nameInput"
                                               placeholder="Введите заголовок">
                                    </div>
                                    <div class="form-group">
                                        <label for="descriptionInput">Текст описания</label>
                                        <textarea class="form-control textarea"
                                                  name="description"
                                                  id="descriptionInput"
                                                  placeholder="Введите текст описания"></textarea>
                                    </div>*}
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer justify-content-flex-end">
                            <button type="button" class="btn btn-primary update-license">Сохранить</button>
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
