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
                            <h1 class="m-0 text-dark text-left">Производственная площадка</h1>
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
                                    <h3 class="card-title">Список категорий оборудования</h3>
                                </div>
                                <div class="card-body">
                                    <button type="button" class="btn btn-block btn-outline-primary"
                                            style="width: 240px;margin-bottom: 20px;" data-toggle="modal"
                                            data-target="#add-productionCategory">Добавить категорию
                                    </button>
                                    <table id="table-production-categories" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Название</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        {foreach $productionCategories as $productionCategory}
                                            <tr>
                                                <td>
                                                    {$productionCategory->title}
                                                </td>
                                                <td>
                                                    <div class="buttons-list">
                                                        <div class="button-edit new-edit btn btn-sm btn-warning" title="Редактировать"
                                                             data-id="{$productionCategory->id}" data-toggle="modal"
                                                             data-target="#update-productionCategory" onclick="getProductionCategory(this);">
                                                            <i class="fal fa-edit"></i>
                                                        </div>
                                                        <div class="button-delate new-delate btn btn-sm btn-danger" title="Удалить"
                                                             data-id="{$productionCategory->id}" onclick="delProductionCategory(this);">
                                                            <i class="fal fa-trash-alt"></i>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        {/foreach}
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Название</th>
                                            <th></th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="card mb-5 card-primary card-outline">
                                <div class="card-header">
                                    <h3 class="card-title">Список оборудования</h3>
                                </div>
                                <div class="card-body">
                                    <button type="button" class="btn btn-block btn-outline-primary"
                                            style="width: 240px;margin-bottom: 20px;" data-toggle="modal"
                                            data-target="#add-production">Добавить оборудование
                                    </button>
                                    <table id="table-production" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Фото</th>
                                            <th>Название</th>
                                            <th>Описание</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        {foreach $production as $productionItem}
                                            <tr>
                                                <td style="text-align: center">
                                                    <img src="/data/images/production/original/{$productionItem->image}" alt="" style="max-width: 300px; border-radius: 10px; height: 100px">
                                                </td>
                                                <td>
                                                    {$productionItem->title}
                                                </td>
                                                <td>
                                                    {$productionItem->specs}
                                                </td>
                                                <td>
                                                    <div class="buttons-list">
                                                        <div class="button-edit new-edit btn btn-sm btn-warning" title="Редактировать"
                                                             data-id="{$productionItem->id}" data-toggle="modal"
                                                             data-target="#update-production" onclick="getProduction(this);">
                                                            <i class="fal fa-edit"></i>
                                                        </div>
                                                        <div class="button-delate new-delate btn btn-sm btn-danger" title="Удалить"
                                                             data-id="{$productionItem->id}" onclick="delProduction(this);">
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
                                            <th>Описание</th>
                                            <th></th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal fade" id="add-productionCategory">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Добавить новую категорию</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form role="form" id="addProductionCategory">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="nameInput">Название</label>
                                            <input type="text" class="form-control" name="title" id="nameInput"
                                                   placeholder="Введите название">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer justify-content-flex-end">
                                <button type="button" class="btn btn-primary save-production-category">Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="update-productionCategory">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Редактировать категорию</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form role="form" id="updateProductionCategory">
                                    <input type="hidden" name="id" id="inputId">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="nameInput">Название</label>
                                            <input type="text" class="form-control" name="title" id="nameInput"
                                                   placeholder="Введите название">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer justify-content-flex-end">
                                <button type="button" class="btn btn-primary update-production-category">Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="add-production">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Добавить новое оборудование</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form role="form" id="addProduction">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="categoryInput">Категория</label>
                                            <select class="form-control" name="category" id="categoryInput">
                                                <option value="" disabled selected hidden>Не выбрано</option>
                                                {foreach $productionCategories as $productionCategory}
                                                    <option value="{$productionCategory->id}">{$productionCategory->title}</option>
                                                {/foreach}
                                            </select>
                                        </div>
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
                                            <label for="descriptionInput">Описание</label>
                                            <textarea class="form-control textarea"
                                                      name="specs"
                                                      id="descriptionInput"
                                                      placeholder="Введите текст описания"></textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer justify-content-flex-end">
                                <button type="button" class="btn btn-primary save-production">Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="update-production">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Редактировать оборудование</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form role="form" id="updateProduction">
                                    <input type="hidden" name="id" id="inputId">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="categoryInput">Категория</label>
                                            <select class="form-control" name="category" id="categoryInput">
                                                <option value="" disabled selected hidden>Не выбрано</option>
                                                {foreach $productionCategories as $productionCategory}
                                                    <option value="{$productionCategory->id}">{$productionCategory->title}</option>
                                                {/foreach}
                                            </select>
                                        </div>
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
                                            <label for="descriptionInput">Описание</label>
                                            <textarea class="form-control textarea"
                                                      name="specs"
                                                      id="descriptionInput"
                                                      placeholder="Введите текст описания"></textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer justify-content-flex-end">
                                <button type="button" class="btn btn-primary update-production">Сохранить</button>
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
