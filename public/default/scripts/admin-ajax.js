/**
 *
 *  Собрать данные с формы
 *
 *  **/

var Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
});

function getData(obj_form) {

    var hData = [];

    $('input, textarea, select', obj_form).each(function () {

        if (this.name && this.name != '') {

            var res = [];

            res[$(this).attr('data-lang')] = this.value;

            if (hData[this.name]) {

                res = hData[this.name];

                res[$(this).attr('data-lang')] = this.value;

                hData[this.name] = res;

            } else {

                hData[this.name] = res;

            }

        }

    });

    return hData;

}

function appendArray(form_data, values, name) {

    if (!values && name) {

        form_data.append(name, '');

    } else {

        if (typeof values == 'object') {

            for (var key in values) {

                if (typeof values[key] == 'object') {

                    appendArray(form_data, values[key], name + '[' + key + ']');

                } else {

                    form_data.append(name + '[' + key + ']', values[key]);

                }
            }

        } else {

            form_data.append(name, values);

        }

    }

    return form_data;

}

function qweryAjax(n, parameters) {

    var data;

    if (n == 100) {

        data = new FormData(document.querySelector('#addLicense'));

    }

    if (n == 103) {

        data = new FormData(document.querySelector('#addProductionCategory'));

    }

    if (n == 104) {

        data = new FormData(document.querySelector('#addProduction'));

    }

    if (n == 101) {

        data = new FormData(document.querySelector('#addPartner'));

    }

    if (n == 102) {

        data = new FormData(document.querySelector('#addPortfolioItem'));

    }

    if (n == 200) {

        data = new FormData();
        data.append('id', parameters);

    }

    if (n == 203) {

        data = new FormData();
        data.append('id', parameters);

    }

    if (n == 204) {

        data = new FormData();
        data.append('id', parameters);

    }

    if (n == 201) {

        data = new FormData();
        data.append('id', parameters);

    }

    if (n == 202) {

        data = new FormData();
        data.append('id', parameters);

    }

    if (n == 300) {

        data = new FormData(document.querySelector('#updateLicense'));

    }

    if (n == 303) {

        data = new FormData(document.querySelector('#updateProductionCategory'));

    }

    if (n == 304) {

        data = new FormData(document.querySelector('#updateProduction'));

    }

    if (n == 301) {

        data = new FormData(document.querySelector('#updatePartner'));

    }

    if (n == 302) {

        data = new FormData(document.querySelector('#updatePortfolioItem'));

    }

    if (n == 400) {

        data = new FormData();
        data.append('id', parameters);

    }

    if (n == 403) {

        data = new FormData();
        data.append('id', parameters);

    }

    if (n == 404) {

        data = new FormData();
        data.append('id', parameters);

    }

    if (n == 401) {

        data = new FormData();
        data.append('id', parameters);

    }

    if (n == 402) {

        data = new FormData();
        data.append('id', parameters);

    }

    if (n == 500) {

        data = new FormData();
        data.append('id', $(parameters).attr('data-id'));

    }

    if (n == 504) {

        data = new FormData();
        data.append('id', $(parameters).attr('data-id'));

    }

    if (n == 501) {

        data = new FormData();
        data.append('id', $(parameters).attr('data-id'));

    }

    if (n == 502) {

        data = new FormData();
        data.append('id', $(parameters).attr('data-id'));

    }

    /*------------------------url-----------------------------*/

    if (n == 100) url = '/admin/ajax/add-license/';
    if (n == 200) url = '/admin/ajax/del-license/';
    if (n == 300) url = '/admin/ajax/upd-license/';
    if (n == 400) url = '/admin/ajax/get-license/';
    if (n == 500) url = '/admin/ajax/del-license-image/';

    if (n == 101) url = '/admin/ajax/add-partner/';
    if (n == 201) url = '/admin/ajax/del-partner/';
    if (n == 301) url = '/admin/ajax/upd-partner/';
    if (n == 401) url = '/admin/ajax/get-partner/';
    if (n == 501) url = '/admin/ajax/del-partner-image/';

    if (n == 102) url = '/admin/ajax/add-portfolio-item/';
    if (n == 202) url = '/admin/ajax/del-portfolio-item/';
    if (n == 302) url = '/admin/ajax/upd-portfolio-item/';
    if (n == 402) url = '/admin/ajax/get-portfolio-item/';
    if (n == 502) url = '/admin/ajax/del-portfolio-item-image/';

    if (n == 103) url = '/admin/ajax/add-product-category/';
    if (n == 203) url = '/admin/ajax/del-product-category/';
    if (n == 303) url = '/admin/ajax/upd-product-category/';
    if (n == 403) url = '/admin/ajax/get-product-category/';

    if (n == 104) url = '/admin/ajax/add-production/';
    if (n == 204) url = '/admin/ajax/del-production/';
    if (n == 304) url = '/admin/ajax/upd-production/';
    if (n == 404) url = '/admin/ajax/get-production/';
    if (n == 504) url = '/admin/ajax/del-production-image/';

    ajaxSend(n, data, url, parameters);

}

function ajaxSend(n, data, url, parameters) {

    $.ajax({
        type: 'POST',
        url: url,
        data: data,
        dataType: 'json',
        contentType: false,
        processData: false,
        enctype: 'multipart/form-data',

        success: function (result) {

            ajaxReturn(n, result, url, parameters);

        },

        error: function (e) {

            Toast.fire({
                icon: 'error',
                title: 'ERROR : ' + e
            });

        }

    });

}

function ajaxReturn(n, data, url, parameters) {

    if (n == 100) {

        if (data.success) {

            Toast.fire({
                icon: 'success',
                title: 'Лицензия успешно добавлена',
                onClose: function () {

                    location.reload();

                }
            });

        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }

    }

    if (n == 103) {

        if (data.success) {

            Toast.fire({
                icon: 'success',
                title: 'Категория успешно добавлена',
                onClose: function () {

                    location.reload();

                }
            });

        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }

    }

    if (n == 104) {

        if (data.success) {

            Toast.fire({
                icon: 'success',
                title: 'Оборудование успешно добавлена',
                onClose: function () {

                    location.reload();

                }
            });

        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }

    }

    if (n == 101) {

        if (data.success) {

            Toast.fire({
                icon: 'success',
                title: 'Партнер успешно добавлен',
                onClose: function () {

                    location.reload();

                }
            });

        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }

    }

    if (n == 102) {

        if (data.success) {

            Toast.fire({
                icon: 'success',
                title: 'Предмет портфолио успешно добавлен',
                onClose: function () {

                    location.reload();

                }
            });

        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }

    }

    if (n == 200) {

        if (data.success) {

            Toast.fire({
                icon: 'success',
                title: 'Лицензия успешно удалена',
                onClose: function () {

                    location.reload();

                }
            });

        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }

    }

    if (n == 203) {

        if (data.success) {

            Toast.fire({
                icon: 'success',
                title: 'Категория успешно удалена',
                onClose: function () {

                    location.reload();

                }
            });

        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }

    }

    if (n == 204) {

        if (data.success) {

            Toast.fire({
                icon: 'success',
                title: 'Оборудование успешно удалено',
                onClose: function () {

                    location.reload();

                }
            });

        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }

    }

    if (n == 201) {

        if (data.success) {

            Toast.fire({
                icon: 'success',
                title: 'Партнер успешно удален',
                onClose: function () {

                    location.reload();

                }
            });

        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }

    }

    if (n == 202) {

        if (data.success) {

            Toast.fire({
                icon: 'success',
                title: 'Предмет портфолио успешно удален',
                onClose: function () {

                    location.reload();

                }
            });

        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }

    }

    if (n == 300 || n == 301|| n == 302|| n == 303 || n == 304) {

        if (data.success) {

            Toast.fire({
                icon: 'success',
                title: 'Изменение успешно добавлено',
                onClose: function () {

                    location.reload();

                }
            });

        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }

    }

    if (n == 400) {

        if (data.success) {

            $('#updateLicense #inputId').val(data.data['id']);
            $('#updateLicense #nameInput').val(data.data['title']);
            $('#updateLicense #descriptionInput').summernote("code", data.data['description']);

            if (data.data['image']){
                var imagesData = '';


                imagesData += '<div class="gallery-image-conainer"><div class="del-license-image" data-id="'+data.data['id']+'">Удалить</div> <img class="gallery-image" src="/data/images/licenses/original/' + data.data['image'] + '"></div>'


                $('#updateLicense .image-container').empty();
                $('#updateLicense .image-container').append(imagesData);
            }
        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }
    }

    if (n == 404) {

        if (data.success) {

            $('#updateProduction #inputId').val(data.data['id']);
            $('#updateProduction #nameInput').val(data.data['title']);
            $('#updateProduction #categoryInput').val(data.data['category']);
            $('#updateProduction #descriptionInput').summernote("code", data.data['specs']);

            if (data.data['image']){
                var imagesData = '';


                imagesData += '<div class="gallery-image-conainer"><div class="del-production-image" data-id="'+data.data['id']+'">Удалить</div> <img class="gallery-image" src="/data/images/production/original/' + data.data['image'] + '"></div>'


                $('#updateProduction .image-container').empty();
                $('#updateProduction .image-container').append(imagesData);
            }
        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }
    }

    if (n == 403) {

        if (data.success) {

            $('#updateProductionCategory #inputId').val(data.data['id']);
            $('#updateProductionCategory #nameInput').val(data.data['title']);
        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }
    }

    if (n == 401) {

        if (data.success) {

            $('#updatePartner #inputId').val(data.data['id']);
            $('#updatePartner #nameInput').val(data.data['title']);
            $('#updatePartner #descriptionInput').summernote("code", data.data['description']);

            if (data.data['image']){
                var imagesData = '';


                imagesData += '<div class="gallery-image-conainer"><div class="del-partner-image" data-id="'+data.data['id']+'">Удалить</div> <img class="gallery-image" src="/data/images/partners/original/' + data.data['image'] + '"></div>'


                $('#updatePartner .image-container').empty();
                $('#updatePartner .image-container').append(imagesData);
            }
        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }
    }

    if (n == 402) {

        if (data.success) {

            $('#updatePortfolioItem #inputId').val(data.data['id']);
            $('#updatePortfolioItem #nameInput').val(data.data['title']);
            $('#updatePortfolioItem #materialInput').val(data.data['material']);
            $('#updatePortfolioItem #typeInput').val(data.data['type']);

            if (data.data['image']){
                var imagesData = '';


                imagesData += '<div class="gallery-image-conainer"><div class="del-portfolio-item-image" data-id="'+data.data['id']+'">Удалить</div> <img class="gallery-image" src="/data/images/portfolio/original/' + data.data['image'] + '"></div>'


                $('#updatePortfolioItem .image-container').empty();
                $('#updatePortfolioItem .image-container').append(imagesData);
            }
        }

        if (data.errors) {
            Toast.fire({
                icon: 'error',
                title: data.errors
            });
        }
    }

    if (n == 500) {

        if (data.success) {

            var parent = $(parameters).closest('.gallery-image-conainer').remove();

        }

    }

    if (n == 501) {

        if (data.success) {

            var parent = $(parameters).closest('.gallery-image-conainer').remove();

        }

    }

    if (n == 502) {

        if (data.success) {

            var parent = $(parameters).closest('.gallery-image-conainer').remove();

        }

    }

    if (n == 504) {

        if (data.success) {

            var parent = $(parameters).closest('.gallery-image-conainer').remove();

        }

    }

    console.log(url, data);

}
