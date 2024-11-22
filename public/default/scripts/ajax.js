document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('.feedback-form__form');
    const typeSelect = document.querySelector('#type');
    const organizationInput = document.querySelector('#organization');
    const emailInput = document.querySelector('#email');
    const phoneInput = document.querySelector('#phone');
    const acceptCheckbox = document.querySelector('#accept');

    let inputTimeout;

    // Применение маски для поля телефона
    Inputmask("+7 (999) 999-99-99").mask(phoneInput);

    // Показ и скрытие поля "Название организации" в зависимости от выбранного типа
    typeSelect.addEventListener('change', () => {
        const organizationField = document.querySelector('.feedback-form__form-item.organization');
        if (typeSelect.value === 'organization') {
            organizationField.style.display = 'flex';
            organizationInput.disabled = false;
            organizationInput.hidden = false;
        } else {
            organizationField.style.display = 'none';
            organizationInput.disabled = true;
            organizationInput.hidden = true;
            organizationInput.value = ''; // Сбрасываем значение поля
        }
    });

    // Универсальная функция для проверки и отображения ошибок
    function validateField(field) {
        let message = '';

        if (field === emailInput && !validateEmail(emailInput.value)) {
            message = 'Пожалуйста, введите корректный email.';
        } else if (field === phoneInput && !validatePhone(phoneInput.value)) {
            message = 'Пожалуйста, введите корректный номер телефона.';
        } else if (field === typeSelect && !typeSelect.value) {
            message = 'Пожалуйста, выберите кто вы.';
        } else if (field === acceptCheckbox && !acceptCheckbox.checked) {
            message = 'Необходимо принять условия политики конфиденциальности.';
        }

        if (message) showToast(message, 'error');
    }

    // Функция для валидации email
    function validateEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }

    // Функция для валидации телефона (российский формат)
    function validatePhone(phone) {
        const re = /^\+7\s\(\d{3}\)\s\d{3}-\d{2}-\d{2}$/;
        return re.test(phone);
    }

    // Функция для отображения Toast сообщений
    function showToast(message, type) {
        Toastify({
            text: message,
            duration: 3000,
            gravity: "top",
            position: "right",
            style: {
                background: type === 'error' ? "#f44336" : "#4CAF50",
            },
            stopOnFocus: true
        }).showToast();
    }

    // События для полей с валидацией при input и blur
    [emailInput, phoneInput, typeSelect, acceptCheckbox].forEach(field => {
        field.addEventListener('blur', () => validateField(field));

        field.addEventListener('input', () => {
            clearTimeout(inputTimeout);
            inputTimeout = setTimeout(() => validateField(field), 1000);
        });
    });

    // Обработчик отправки формы
    form.addEventListener('submit', function (event) {
        event.preventDefault();

        const isFormValid = [emailInput, phoneInput, typeSelect, acceptCheckbox].every(field => {
            validateField(field);
            return field.value && (field !== acceptCheckbox || field.checked);
        });

        if (!isFormValid) return;

        const formData = new FormData(this);

        $.ajax({
            url: '/ajax/feedback',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (result) {
                console.log(result);
                console.log(result.success);
                if (result.success) {
                    showToast('Спасибо! Ваша заявка отправлена.', 'success');
                    $('.feedback-form__form-item.organization').hide();
                } else {
                    showToast('Произошла ошибка при отправке формы. Пожалуйста, попробуйте снова.', 'error');
                }
            },
            error: function (xhr, status, error) {
                console.error('Ошибка:', error);
                showToast('Произошла ошибка при отправке формы.', 'error');
            }
        });

        setTimeout(()=>{
            form.reset();
        }, 500)

    });
});
