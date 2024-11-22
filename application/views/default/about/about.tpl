{strip}

    {include file='all/head.tpl'}

    <body>
    <div class="wrapper">
        <main class="page about">
            <div data-observ></div>
            {include file='all/header.tpl'}
            <section class="hero">
                <div class="hero__container">
                    <div class="hero__item">
                        <h1 class="hero__title">О нашей компании</h1>
                        <p class="hero__title-sub">
                            Мы являемся высокотехнологичным предприятием, работающим на рынке оказания услуг по производству деталей. В процессе работы нами освоено и внедрено в производство более 1100 наименований деталей и мы постоянно расширяем номенклатуру выпускаемой продукции.
                        </p>
                    </div>
                    <div class="hero__item">
                        <div class="hero__buttons">
                            <a href="./about#about-us" class="details hero__buttons-item">Узнать подробнее</a>
                            <a href="./about#map" class="details hero__buttons-item">Где нас найти</a>
                        </div>
                    </div>
                    <div class="hero__item">
                        <svg width="58" height="58" viewBox="0 0 58 58" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="29" cy="29" r="29" fill="$colors-accent"/>
                            <path d="M30.5 16C30.5 15.1716 29.8284 14.5 29 14.5C28.1716 14.5 27.5 15.1716 27.5 16L30.5 16ZM27.9393 42.0607C28.5251 42.6464 29.4749 42.6464 30.0607 42.0607L39.6066 32.5147C40.1924 31.9289 40.1924 30.9792 39.6066 30.3934C39.0208 29.8076 38.0711 29.8076 37.4853 30.3934L29 38.8787L20.5147 30.3934C19.9289 29.8076 18.9792 29.8076 18.3934 30.3934C17.8076 30.9792 17.8076 31.9289 18.3934 32.5147L27.9393 42.0607ZM27.5 16L27.5 41L30.5 41L30.5 16L27.5 16Z" fill="white"/>
                        </svg>
                    </div>
                </div>
            </section>
            <section class="stroke">
                <div class="stroke__container">
                    <p>Металлообработка деталей любой сложности</p>
                    <p>Металлообработка деталей любой сложности</p>
                    <p>Металлообработка деталей любой сложности</p>
                    <p>Металлообработка деталей любой сложности</p>
                    <p>Металлообработка деталей любой сложности</p>
                    <p>Металлообработка деталей любой сложности</p>
                    <p>Металлообработка деталей любой сложности</p>
                    <p>Металлообработка деталей любой сложности</p>
                    <p>Металлообработка деталей любой сложности</p>
                    <p>Металлообработка деталей любой сложности</p>
                </div>
            </section>
            <section class="about-us" id="about-us">
                <div class="about-us__container">
                    <h1 class="about-us__title">Подробнее о нас</h1>
                    <div class="about-us__items">
                        <div class="about-us__item">
                            <picture><source srcset="../public/default/images/all/img_4885.webp" type="image/webp"><img src="../public/default/images/all/img_4885.jpeg" alt="Подробнее о нас"></picture>
                        </div>
                        <div class="about-us__item">
                            <p>
                                Мы являемся высокотехнологичным предприятием, работающим на рынке оказания услуг по производству деталей. В процессе работы нами освоено и внедрено в производство более 1100 наименований деталей и мы постоянно расширяем номенклатуру выпускаемой продукции.
                            </p>
                            <br>
                            <p>
                                На нашем оборудовании мы осуществляем изготовление деталей различной сложности, из различных цветных титановых сплавов, нержавеющих, конструкционных и инструментальных сталей. Причем, это могут быть как единичные изделия, так и партии деталей до нескольких десятков тысяч штук.
                            </p>
                            <br>
                            <p>
                                Контроль качества продукции осуществляется на каждом этапе, что позволяет гарантировать соответствие готовых изделий принятым стандартам и нормам. На производстве работают высококвалифицированные специалисты, имеющие возможность постоянно повышать свою квалификацию. Их высокий профессионализм, а также богатейший опыт работы дает возможность успешно решать задачи, поставленные нашими клиентами в рамках технического задания.
                            </p>
                        </div>
                    </div>
                </div>
            </section>
            <section class="feedback">
                <div class="feedback__container">
                    <div class="feedback__item">
                        <h1 class="feedback__item-title">Обучение</h1>
                        <p class="feedback__item-desc">
                            Наша компания проводит профессиональную подготовку специалистов в сфере металлообработки при помощи современных программ и передового оборудования.
                        </p>
                    </div>
                    <div class="feedback__item">
                        <a href="./study#feedback-form">Посмотреть подробнее</a>
                    </div>
                </div>
            </section>
            <section class="partners">
                <div class="partners__container">
                    <h1 class="partners__title">Наши партнеры</h1>

                    {if isset($partners) && $partners|@count > 0}
                        <div class="partners__cards">
                            {foreach $partners as $partner}

                                {if isset($partner->image)}
                                    <div class="partners__card">
                                        <div class="partners__card-img">
                                            <img src="/data/images/partners/original/{$partner->image}" alt="{$partner->title}" />
                                        </div>
                                        <span class="partners__card-name">{$partner->title}</span>
                                    </div>
                                {else}
                                    <div class="partners__card no-logo">
                                        <span class="partners__card-name">{$partner->title}</span>
                                    </div>
                                {/if}

                            {/foreach}
                        </div>
                    {else}
                        <div class="partners__none">
                            <p>Информация появится в скором времени</p>
                        </div>
                    {/if}

                </div>
            </section>
            <section class="map" id="map">
                <div class="map__container">
                    <h1 class="map__title">Где мы находимся</h1>
                    <div class="map__body">
                        <div style="position: relative; overflow: hidden; height: 100%">
                            <a href="https://yandex.ru/maps/193/voronezh/?utm_medium=mapframe&utm_source=maps" style="color: #eee; font-size: 12px; position: absolute; top: 0px">Воронеж</a><a href="https://yandex.ru/maps/193/voronezh/house/ulitsa_merkulova_7/Z0AYdARnTEIBQFtrfXpycXhgYA==/?ll=39.237576%2C51.630434&utm_medium=mapframe&utm_source=maps&z=17" style="color: #eee; font-size: 12px; position: absolute; top: 14px">Улица Меркулова, 7 на карте Воронежа — Яндекс Карты</a><iframe src="https://yandex.ru/map-widget/v1/?ll=39.237576%2C51.630434&mode=whatshere&utm_source=share&whatshere%5Bpoint%5D=39.237576%2C51.630434&whatshere%5Bzoom%5D=17&z=17" width="100%" height="100%" frameborder="1" allowfullscreen="true" style="position: relative"></iframe>
                        </div>
                    </div>
                </div>
            </section>
            <section class="feedback-form">
                <div class="feedback-form__container">
                    <div class="feedback-form__header">
                        <h1 class="feedback-form__title">Заказать расчет</h1>
                        <h2 class="feedback-form__title-sub">Звоните и обращайтесь - наш опыт будет полезен</h2>
                    </div>
                    <form class="feedback-form__form">
                        <input type="text" name="page" hidden value="{$page}">
                        <div class="feedback-form__form-items">
                            <div class="feedback-form__form-item">
                                <label for="type" class="feedback-form__form-item-label">Кто вы?</label>
                                <select class="feedback-form__form-item-input" name="type" id="type" required>
                                    <option value="" disabled="disabled" hidden selected="selected">Выберите тип</option>
                                    <option value="organization">Юридическое лицо</option>
                                    <option value="personal">Физическое лицо</option>
                                </select>
                            </div>
                            <div class="feedback-form__form-item organization" style="display: none">
                                <label for="organization" class="feedback-form__form-item-label">Название организации</label>
                                <input type="text" class="feedback-form__form-item-input" name="organization" id="organization" placeholder="ООО «ЦМД»" disabled="disabled" hidden>
                            </div>
                            <div class="feedback-form__form-item">
                                <label for="name" class="feedback-form__form-item-label">Ваше имя</label>
                                <input type="text" class="feedback-form__form-item-input" name="name" id="name" placeholder="Иван">
                            </div>
                            <div class="feedback-form__form-item">
                                <label for="email" class="feedback-form__form-item-label">Ваш e-mail</label>
                                <input type="email" class="feedback-form__form-item-input" name="email" id="email" placeholder="example@example.ru">
                            </div>
                            <div class="feedback-form__form-item">
                                <label for="phone" class="feedback-form__form-item-label">Ваш телефон</label>
                                <input type="text" class="feedback-form__form-item-input" name="phone" id="phone" placeholder="+7 (999) 999-99-99">
                            </div>
                            <div class="feedback-form__form-item">
                                <label for="description" class="feedback-form__form-item-label">Немного про ваш проект</label>
                                <textarea class="feedback-form__form-item-input" name="description" id="description" placeholder="Например: Металлообработка сложного профиля"></textarea>
                            </div>
                            <div class="feedback-form__form-item checkbox">
                                <label for="accept" class="accept-checkbox">
                                    <input type="checkbox" name="accept" id="accept">
                                    <div class="accept-checkbox__checkmark"></div>
                                    <div class="accept-checkbox__body">Принимаю условия политики конфиденциальности</div>
                                </label>
                            </div>

                            <div class="feedback-form__form-item button">
                                <button class="feedback-form__form-send">
                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M0 1.125C0 0.50368 0.50368 0 1.125 0H1.98628C2.51356 0 2.9701 0.366224 3.08449 0.880953L3.62165 3.29818C3.75078 3.87928 3.40488 4.4604 2.8325 4.62394L2.13291 4.82382C1.82482 4.91184 1.6508 5.23999 1.77297 5.53619C2.64751 7.65656 4.34344 9.35249 6.46381 10.227C6.76001 10.3492 7.08815 10.1752 7.17618 9.86709L7.37606 9.1675C7.5396 8.59512 8.12072 8.24922 8.70182 8.37835L11.119 8.91551C11.6338 9.02989 12 9.48643 12 10.0137V10.875C12 11.4963 11.4963 12 10.875 12H9.75C8.88858 12 8.05244 11.8882 7.25568 11.6779C3.87498 10.7857 1.21431 8.12502 0.322119 4.74432C0.111848 3.94756 0 3.11142 0 2.25V1.125Z" fill="white"/>
                                    </svg>
                                    <span>Заказать расчет</span>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            {include file='all/footer.tpl'}
        </main>
    </div>
    </body>
    </html>

{/strip}