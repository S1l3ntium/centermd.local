{strip}

    {include file='all/head.tpl'}

    <body>
    <div class="wrapper">
        <main class="page study">
            <div data-observ></div>
            {include file='all/header.tpl'}
            <section class="hero">
                <div class="hero__container">
                    <div class="hero__item">
                        <h1 class="hero__title">Профессиональное обучение</h1>
                        <p class="hero__title-sub">
                            Наша компания проводит профессиональную подготовку специалистов в сфере металлообработки при помощи современных программ и
                            передового оборудования
                        </p>
                    </div>
                    <div class="hero__item">
                        <div class="hero__buttons">
                            <a href="./study#feedback-form" class="hero__buttons-item order">Оставить заявку</a>
                            <a href="./study#about-us" class="hero__buttons-item details">Узнать подробнее</a>
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
                    <h1 class="about-us__title">Чему обучаем</h1>
                    <div class="about-us__items">
                        <div class="about-us__item">
                            <picture><source srcset="../public/default/images/all/img_4694.webp" type="image/webp"><img src="../public/default/images/all/img_4694.jpeg" alt="Чему обучаем"></picture>
                        </div>
                        <div class="about-us__item">
                            <p>
                                Наша компания проводит подготовку студентов технических ВУЗов, осуществляет повышение квалификации и подготовку специалистов предприятий по конструкторско-технологической подготовке производства, а также по наладке и эксплуатации станков с ЧПУ.
                            </p>
                            <br>
                            <p>По окончании обучения выдается документ: свидетельство или удостоверение.</p>
                        </div>
                    </div>
                </div>
            </section>
            <section class="benefits">
                <div class="benefits__container">
                    <h1 class="benefits__title">Наши преимущества</h1>
                    <div class="benefits__items">
                        <div class="benefits__item">
                            <div class="benefits__item-icon">
                                <img src="../public/default/images/icons/benefits-code.svg" alt="Широкий спектр программ">
                            </div>
                            <div class="benefits__item-title">Широкий спектр программ</div>
                        </div>
                        <div class="benefits__item">
                            <div class="benefits__item-icon">
                                <img src="../public/default/images/icons/benefits-manufacture.svg" alt="Практика на современном оборудовании">
                            </div>
                            <div class="benefits__item-title">Практика на современном оборудовании</div>
                        </div>
                        <div class="benefits__item">
                            <div class="benefits__item-icon">
                                <img src="../public/default/images/icons/benefits-grow.svg" alt="Быстрый рост">
                            </div>
                            <div class="benefits__item-title">Быстрый рост</div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="directions">
                <div class="directions__container">
                    <h1 class="directions__title">Направления подготовки</h1>
                    <div class="directions__cards">
                        <div class="directions__card">
                            <div class="directions__card-count"></div>
                            <div class="directions__card-title">
                                Основная программа профессионального обучения по профессии "Оператор станков с программным управлением"
                            </div>
                        </div>
                        <div class="directions__card">
                            <div class="directions__card-count"></div>
                            <div class="directions__card-title">
                                Дополнительная образовательная программа повышения квалификации "Разработка управляющих программ в среде NX"
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="licenses" id="licenses">
                <div class="licenses__container">
                    <h1 class="licenses__title">Лицензии и обучающая программа</h1>
                    {if isset($licenses) && $licenses|@count > 0}
                        <div class="licenses__items">
                            {foreach $licenses as $license}
                                <div class="licenses__item">
                                    <div class="licenses__item-img">
                                        <img src="/data/images/licenses/original/{$license->image}" alt="{$license->title}" />
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {else}
                        <div class="licenses__none">
                            <p>Информация появится в скором времени</p>
                        </div>
                    {/if}
                </div>
            </section>
            <section class="feedback-form" id="feedback-form">
                <div class="feedback-form__container">
                    <div class="feedback-form__header">
                        <h1 class="feedback-form__title">Хотите обучаться?</h1>
                        <h2 class="feedback-form__title-sub">Оставьте заявку, наш менеджер свяжется с вами</h2>
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
                            <div class="feedback-form__form-item checkbox">
                                <label for="accept" class="accept-checkbox">
                                    <input type="checkbox" name="accept" id="accept">
                                    <div class="accept-checkbox__checkmark"></div>
                                    <p class="accept-checkbox__body">Принимаю условия политики конфиденциальности</p>
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