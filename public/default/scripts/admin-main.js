function getLicense(el) {

    qweryAjax(400, $(el).attr('data-id'));

}
function getProduction(el) {

    qweryAjax(404, $(el).attr('data-id'));

}
function getProductionCategory(el) {

    qweryAjax(403, $(el).attr('data-id'));

}
function getPartner(el) {

    qweryAjax(401, $(el).attr('data-id'));

}
function getPortfolioItem(el) {

    qweryAjax(402, $(el).attr('data-id'));

}
function delLicense(el) {

    qweryAjax(200, $(el).attr('data-id'));

}
function delProduction(el) {

    qweryAjax(204, $(el).attr('data-id'));

}
function delProductionCategory(el) {

    qweryAjax(203, $(el).attr('data-id'));

}
function delPartner(el) {

    qweryAjax(201, $(el).attr('data-id'));

}
function delPortfolioItem(el) {

    qweryAjax(202, $(el).attr('data-id'));

}
function dellLicenseImage(el) {

    qweryAjax(500, $(el).attr('data-id'));

}
function dellPartnerImage(el) {

    qweryAjax(501, $(el).attr('data-id'));

}
function dellProductionImage(el) {

    qweryAjax(503, $(el).attr('data-id'));

}
function dellPortfolioItemImage(el) {

    qweryAjax(502, $(el).attr('data-id'));

}

$(document).ready(function () {

    $('#updateLicense .image-container').on('click', '.del-license-image', function (){

        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });

        Toast.fire({
            icon: 'error',
            title: 'Изображение удалено'
        });

        qweryAjax(500, this);

    });

    $('#updatePartner .image-container').on('click', '.del-partner-image', function (){

        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });

        Toast.fire({
            icon: 'error',
            title: 'Изображение удалено'
        });

        qweryAjax(501, this);

    });

    $('#updatePortfolioItem .image-container').on('click', '.del-portfolio-item-image', function (){

        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });

        Toast.fire({
            icon: 'error',
            title: 'Изображение удалено'
        });

        qweryAjax(502, this);

    });

    $('#updateProduction .image-container').on('click', '.del-production-image', function (){

        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });

        Toast.fire({
            icon: 'error',
            title: 'Изображение удалено'
        });

        qweryAjax(504, this);

    });

    function sendFile(file, editor, welEditable) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            data: data,
            type: "POST",
            url: "/ajax/save-image-summernote",
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                var url = JSON.parse(response);
                if (url.success === true) {
                    editor.summernote('editor.insertImage', url.url, welEditable);
                    console.log('da da da');
                } else {
                    console.log('Ошибка загрузки изображения в редактор');
                }
            },
            error: function () {
                console.log('Ошибка при отправке файла');
            }
        });
    }

    $('.textarea').each(function () {
        var $textarea = $(this);
        $textarea.summernote({
            height: 350,
            placeholder: 'Введите описание',
            callbacks: {
                onImageUpload: function (files, editor, welEditable) {
                    sendFile(files[0], $textarea, welEditable);
                }
            },
            dialogsInBody: true
        });
    });

    $('.save-license').click(function () {

        qweryAjax(100);

    });

    $('.save-production-category').click(function () {

        qweryAjax(103);

    });

    $('.save-production').click(function () {

        qweryAjax(104);

    });

    $('.save-partner').click(function () {

        qweryAjax(101);

    });

    $('.save-portfolioItem').click(function () {

        qweryAjax(102);

    });

    $('.update-license').click(function () {

        qweryAjax(300);

    });

    $('.update-production').click(function () {

        qweryAjax(304);

    });

    $('.update-production-category').click(function () {

        qweryAjax(303);

    });

    $('.update-partner').click(function () {

        qweryAjax(301);

    });

    $('.update-portfolioItem').click(function () {

        qweryAjax(302);

    });

    if ($('body').is('.page-tickets')) {
        $("#table-tickets").DataTable({
            "responsive": true,
            "autoWidth": false,
            "language": {
                "processing": "Подождите...",
                "search": "Поиск:",
                "lengthMenu": "Показать _MENU_ записей",
                "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
                "infoEmpty": "Записи с 0 до 0 из 0 записей",
                "infoFiltered": "(отфильтровано из _MAX_ записей)",
                "infoPostFix": "",
                "loadingRecords": "Загрузка записей...",
                "zeroRecords": "Записи отсутствуют.",
                "emptyTable": "В таблице отсутствуют данные",
                "paginate": {
                    "first": "Первая",
                    "previous": "Предыдущая",
                    "next": "Следующая",
                    "last": "Последняя"
                },
                "aria": {
                    "sortAscending": ": активировать для сортировки столбца по возрастанию",
                    "sortDescending": ": активировать для сортировки столбца по убыванию"
                },
                "select": {
                    "rows": {
                        "_": "Выбрано записей: %d",
                        "0": "Кликните по записи для выбора",
                        "1": "Выбрана одна запись"
                    }
                }
            }
        });
    } else if ($('body').is('.page-production')) {
        $("#table-production").DataTable({
            "responsive": true,
            "autoWidth": false,
            "language": {
                "processing": "Подождите...",
                "search": "Поиск:",
                "lengthMenu": "Показать _MENU_ записей",
                "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
                "infoEmpty": "Записи с 0 до 0 из 0 записей",
                "infoFiltered": "(отфильтровано из _MAX_ записей)",
                "infoPostFix": "",
                "loadingRecords": "Загрузка записей...",
                "zeroRecords": "Записи отсутствуют.",
                "emptyTable": "В таблице отсутствуют данные",
                "paginate": {
                    "first": "Первая",
                    "previous": "Предыдущая",
                    "next": "Следующая",
                    "last": "Последняя"
                },
                "aria": {
                    "sortAscending": ": активировать для сортировки столбца по возрастанию",
                    "sortDescending": ": активировать для сортировки столбца по убыванию"
                },
                "select": {
                    "rows": {
                        "_": "Выбрано записей: %d",
                        "0": "Кликните по записи для выбора",
                        "1": "Выбрана одна запись"
                    }
                }
            }
        });
        $("#table-production-categories").DataTable({
            "responsive": true,
            "autoWidth": false,
            "language": {
                "processing": "Подождите...",
                "search": "Поиск:",
                "lengthMenu": "Показать _MENU_ записей",
                "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
                "infoEmpty": "Записи с 0 до 0 из 0 записей",
                "infoFiltered": "(отфильтровано из _MAX_ записей)",
                "infoPostFix": "",
                "loadingRecords": "Загрузка записей...",
                "zeroRecords": "Записи отсутствуют.",
                "emptyTable": "В таблице отсутствуют данные",
                "paginate": {
                    "first": "Первая",
                    "previous": "Предыдущая",
                    "next": "Следующая",
                    "last": "Последняя"
                },
                "aria": {
                    "sortAscending": ": активировать для сортировки столбца по возрастанию",
                    "sortDescending": ": активировать для сортировки столбца по убыванию"
                },
                "select": {
                    "rows": {
                        "_": "Выбрано записей: %d",
                        "0": "Кликните по записи для выбора",
                        "1": "Выбрана одна запись"
                    }
                }
            }
        });
    } else if ($('body').is('.page-portfolio')) {
        $("#table-portfolio").DataTable({
            "responsive": true,
            "autoWidth": false,
            "language": {
                "processing": "Подождите...",
                "search": "Поиск:",
                "lengthMenu": "Показать _MENU_ записей",
                "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
                "infoEmpty": "Записи с 0 до 0 из 0 записей",
                "infoFiltered": "(отфильтровано из _MAX_ записей)",
                "infoPostFix": "",
                "loadingRecords": "Загрузка записей...",
                "zeroRecords": "Записи отсутствуют.",
                "emptyTable": "В таблице отсутствуют данные",
                "paginate": {
                    "first": "Первая",
                    "previous": "Предыдущая",
                    "next": "Следующая",
                    "last": "Последняя"
                },
                "aria": {
                    "sortAscending": ": активировать для сортировки столбца по возрастанию",
                    "sortDescending": ": активировать для сортировки столбца по убыванию"
                },
                "select": {
                    "rows": {
                        "_": "Выбрано записей: %d",
                        "0": "Кликните по записи для выбора",
                        "1": "Выбрана одна запись"
                    }
                }
            }
        });
    } else if ($('body').is('.page-partners')) {
        $("#table-partners").DataTable({
            "responsive": true,
            "autoWidth": false,
            "language": {
                "processing": "Подождите...",
                "search": "Поиск:",
                "lengthMenu": "Показать _MENU_ записей",
                "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
                "infoEmpty": "Записи с 0 до 0 из 0 записей",
                "infoFiltered": "(отфильтровано из _MAX_ записей)",
                "infoPostFix": "",
                "loadingRecords": "Загрузка записей...",
                "zeroRecords": "Записи отсутствуют.",
                "emptyTable": "В таблице отсутствуют данные",
                "paginate": {
                    "first": "Первая",
                    "previous": "Предыдущая",
                    "next": "Следующая",
                    "last": "Последняя"
                },
                "aria": {
                    "sortAscending": ": активировать для сортировки столбца по возрастанию",
                    "sortDescending": ": активировать для сортировки столбца по убыванию"
                },
                "select": {
                    "rows": {
                        "_": "Выбрано записей: %d",
                        "0": "Кликните по записи для выбора",
                        "1": "Выбрана одна запись"
                    }
                }
            }
        });
    } else if ($('body').is('.page-licenses')) {
        $("#table-licenses").DataTable({
            "responsive": true,
            "autoWidth": false,
            "language": {
                "processing": "Подождите...",
                "search": "Поиск:",
                "lengthMenu": "Показать _MENU_ записей",
                "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
                "infoEmpty": "Записи с 0 до 0 из 0 записей",
                "infoFiltered": "(отфильтровано из _MAX_ записей)",
                "infoPostFix": "",
                "loadingRecords": "Загрузка записей...",
                "zeroRecords": "Записи отсутствуют.",
                "emptyTable": "В таблице отсутствуют данные",
                "paginate": {
                    "first": "Первая",
                    "previous": "Предыдущая",
                    "next": "Следующая",
                    "last": "Последняя"
                },
                "aria": {
                    "sortAscending": ": активировать для сортировки столбца по возрастанию",
                    "sortDescending": ": активировать для сортировки столбца по убыванию"
                },
                "select": {
                    "rows": {
                        "_": "Выбрано записей: %d",
                        "0": "Кликните по записи для выбора",
                        "1": "Выбрана одна запись"
                    }
                }
            }
        });
    }
});



// ** автовысота textare`и
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('[data-autoresize]').forEach(function (element) {
        element.style.boxSizing = 'border-box';
        var offset = element.offsetHeight - element.clientHeight;
        element.addEventListener('input', function (event) {
            event.target.style.height = 'auto';
            event.target.style.height = event.target.scrollHeight + offset + 'px';
        });
        element.removeAttribute('data-autoresize');
    });
});

// ** Ограничение символов для всех textarea с классом 'limited-textarea'
const textAreas = document.querySelectorAll('.limited-textarea');
textAreas.forEach((textArea) => {
    textArea.addEventListener('input', () => {
        if (textArea.value.length > 255) {
            textArea.value = textArea.value.slice(0, 255);
        }
    });
});