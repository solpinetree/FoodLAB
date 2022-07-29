<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<ul>
    <c:forEach var="review" items="${reviews}">
    <li class=" margin-b5__09f24__pTvws border-color--default__09f24__NPAKY" id="${review.reviewId}">
        <div class=" review__09f24__oHr9V border-color--default__09f24__NPAKY">
            <div class=" margin-b3__09f24__l9v5d border-color--default__09f24__NPAKY">
                <div class=" arrange__09f24__LDfbs gutter-auto__09f24__W9jlL border-color--default__09f24__NPAKY">
                    <div class=" arrange-unit__09f24__rqHTg arrange-unit-fill__09f24__CUubG border-color--default__09f24__NPAKY">
                        <div class=" border-color--default__09f24__NPAKY" role="region" aria-label="Samantha A.">
                            <div class=" arrange__09f24__LDfbs gutter-1-5__09f24__vMtpw vertical-align-middle__09f24__zU9sE border-color--default__09f24__NPAKY">
                                <div class=" arrange-unit__09f24__rqHTg border-color--default__09f24__NPAKY">
                                    <div class=" css-0 border-color--default__09f24__NPAKY">
                                        <a
                                            href="/user_details?userid=2kl_zaWDKIgbpqvPJN1zVA" class="css-1fkqezt"
                                            target="_self">
                                        <img class=" css-1pz4y59"
                                            src="${resources}/img/defaultProfile.jpeg"
                                            alt="${review.writer.username}" height="64" width="64"
                                            loading="lazy" draggable="true"></a>
                                    </div>
                                </div>
                                <div class=" arrange-unit__09f24__rqHTg arrange-unit-fill__09f24__CUubG border-color--default__09f24__NPAKY">
                                    <div class=" user-passport-info border-color--default__09f24__NPAKY">
                                        <span class="fs-block css-ux5mu6" data-font-weight="bold">
                                            <a
                                                href="/user_details?userid=2kl_zaWDKIgbpqvPJN1zVA" class="css-1m051bw"
                                                role="link">${review.writer.username}</a>
                                        </span>
                                    </div>
                                    <div class=" margin-t0-5__09f24__gboxT border-color--default__09f24__NPAKY">
                                        <div class=" display--inline-block__09f24__fEDiJ border-color--default__09f24__NPAKY">
                                            <div class=" user-passport-stats__09f24__NQxB4 border-color--default__09f24__NPAKY">
                                                <div class=" display--inline-block__09f24__fEDiJ margin-r1__09f24__rN_ga border-color--default__09f24__NPAKY"
                                                     aria-label="Friends">
                                                    <span alt="" aria-hidden="true" role="img"
                                                          class="icon--16-friends-v2 css-1nrzw89"><svg
                                                        width="16" height="16" class="icon_svg"><path
                                                        d="M11.231 1.25H4.769A3.523 3.523 0 001.25 4.77v6.46a3.523 3.523 0 003.519 3.52h6.462a3.524 3.524 0 003.519-3.52V4.77a3.523 3.523 0 00-3.519-3.52zm-6.462 1.5h6.462a2.022 2.022 0 012.019 2.02v6.223a8.71 8.71 0 00-2.218-1.177c.164-.395.249-.819.25-1.247V7.562a3.281 3.281 0 10-6.563 0v1.007c0 .428.085.852.249 1.247-.792.283-1.54.68-2.218 1.177V4.77a2.022 2.022 0 012.019-2.02zm5.012 5.82a1.781 1.781 0 01-3.562 0V7.561a1.781 1.781 0 013.562 0v1.007zm1.45 4.68H4.769a2.007 2.007 0 01-1.49-.668.415.415 0 01.15-.237 7.259 7.259 0 012.498-1.254 3.21 3.21 0 004.144.002c.907.25 1.756.676 2.5 1.252.076.06.129.143.15.237a2.007 2.007 0 01-1.49.668z"></path></svg></span><span
                                                        class=" display--inline__09f24__c6N_k padding-l0-5__09f24__tBn3z border-color--default__09f24__NPAKY">
                                                        <span class=" css-1fnccdf" data-font-weight="semibold">204</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=" arrange-unit__09f24__rqHTg border-color--default__09f24__NPAKY">
                        <div class=" inline__09f24__zZaGy">
                            <div class="" role="presentation">
                                <div>
                                    <div class=" menu-popover-container__09f24__JN_XM display--inline-block__09f24__fEDiJ border-color--default__09f24__NPAKY">
                                        <button type="submit" class="css-e0tek0" data-activated="false"
                                                aria-haspopup="true"
                                                aria-expanded="false" aria-label="Menu" value="submit"
                                                data-button="true">
                                        <span class="css-1enow5j" data-font-weight="semibold"><span alt=""
                                                                                                    aria-hidden="true"
                                                                                                    role="img"
                                                                                                    class="icon--24-more-v2 css-ije6j5"><svg
                                                width="24" height="24" class="icon_svg"><path
                                                d="M12 13.5a1.5 1.5 0 100-3 1.5 1.5 0 000 3zm8 0a1.5 1.5 0 100-3 1.5 1.5 0 000 3zm-16 0a1.5 1.5 0 100-3 1.5 1.5 0 000 3z"></path></svg></span></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class=" margin-t1__09f24__w96jn margin-b1-5__09f24__NHcQi border-color--default__09f24__NPAKY">
                <div class=" arrange__09f24__LDfbs gutter-1__09f24__yAbCL vertical-align-middle__09f24__zU9sE border-color--default__09f24__NPAKY">
                    <div class=" arrange-unit__09f24__rqHTg border-color--default__09f24__NPAKY">
                        <span  class=" display--inline__09f24__c6N_k border-color--default__09f24__NPAKY">
                            <div class=" i-stars__09f24__M1AR7 i-stars--regular-5__09f24__tKNMk border-color--default__09f24__NPAKY overflow--hidden__09f24___ayzG" aria-label="5 star rating" role="img">
                                <div class="restaurants__rating__star five-stars">
                                    <c:forEach begin="1" end="${ review.rate }" >
                                        <i class="star-rate-icon icon_star"></i>
                                    </c:forEach>
                                    <c:forEach begin="${review.rate +1}" end="5">
                                        <i class="star-rate-icon icon_star_alt"></i>
                                    </c:forEach>
                                </div>
                            </div>
                        </span>
                    </div>
                    <div class=" arrange-unit__09f24__rqHTg arrange-unit-fill__09f24__CUubG border-color--default__09f24__NPAKY">
                        <span class=" css-chan6m">${review.createdAt}</span></div>
                </div>
            </div>
            <div class=" margin-b2__09f24__CEMjT border-color--default__09f24__NPAKY">
                <div class=" display--inline-block__09f24__fEDiJ margin-r2__09f24__XL72f margin-b0-5__09f24__BgShQ border-color--default__09f24__NPAKY">
                    <div class=" display--inline-block__09f24__fEDiJ margin-r0-5__09f24___nKcQ border-color--default__09f24__NPAKY">
                        <span alt="" aria-hidden="true" role="img" class="icon--16-camera-v2 css-6a0jil">
                            <svg width="16" height="16" class="icon_svg"><path
                                d="M3.06 14.76a2.086 2.086 0 01-2.084-2.083V5.344A2.091 2.091 0 013.06 3.25h1.393l.496-1.487a.75.75 0 01.711-.513h4.334a.75.75 0 01.711.513l.496 1.487h1.74a2.086 2.086 0 012.083 2.083v7.334a2.086 2.086 0 01-2.084 2.083l-9.88.01zm0-10.01a.59.59 0 00-.584.594v7.333a.584.584 0 00.584.584l9.88-.011a.584.584 0 00.584-.583V5.333a.584.584 0 00-.584-.583h-2.28a.75.75 0 01-.711-.513L9.453 2.75H6.201l-.496 1.487a.75.75 0 01-.711.513H3.06z"></path><path
                                d="M8 12.556a3.75 3.75 0 110-7.501 3.75 3.75 0 010 7.5zm0-6a2.25 2.25 0 100 4.5 2.25 2.25 0 000-4.5z"></path></svg>
                        </span>
                    </div>
                    <span class=" css-1oibaro" data-font-weight="semibold">${review.numOfUploadedImgs} 개의 사진</span>
                </div>
                <div class=" display--inline-block__09f24__fEDiJ margin-r2__09f24__XL72f margin-b0-5__09f24__BgShQ border-color--default__09f24__NPAKY">
                    <div class=" display--inline-block__09f24__fEDiJ margin-r0-5__09f24___nKcQ border-color--default__09f24__NPAKY">
                    <span alt="" aria-hidden="true" role="img" class="icon--16-check-in-v2 css-6a0jil">
                        <svg width="16" height="16"  class="icon_svg"><path
                            d="M7.925 14.629a.749.749 0 01-.435-.139l-1.374-.976-1.686.009a.803.803 0 01-.715-.51l-.54-1.597-1.37-.985a.75.75 0 01-.277-.832l.502-1.61-.527-1.6a.75.75 0 01.266-.837l1.354-1.004.514-1.605a.75.75 0 01.707-.521l1.686-.016 1.36-.997a.75.75 0 01.878-.007l1.374.977 1.685-.01h.005a.751.751 0 01.71.509l.541 1.598 1.37.986a.75.75 0 01.277.832l-.503 1.608.527 1.602a.75.75 0 01-.266.837l-1.353 1.004-.514 1.603a.75.75 0 01-.708.522l-1.685.015-1.36.998a.75.75 0 01-.443.146zm-1.571-2.616c.155 0 .307.048.434.138l1.13.803 1.118-.821a.75.75 0 01.437-.146l1.384-.012.423-1.318a.753.753 0 01.267-.374l1.113-.825-.433-1.315a.748.748 0 01-.003-.458l.413-1.322-1.125-.81a.749.749 0 01-.272-.367l-.445-1.314-1.386.008a1.238 1.238 0 01-.44-.139L7.84 2.94l-1.118.82a.757.757 0 01-.437.145L4.9 3.917l-.422 1.318a.753.753 0 01-.268.374l-1.112.826.432 1.314c.049.149.05.309.003.458l-.412 1.322 1.125.81c.127.091.222.22.272.368l.445 1.313 1.387-.007h.004z"></path><path
                            d="M7.195 10.161a.746.746 0 01-.53-.22L5.599 8.876a.75.75 0 111.06-1.06l.536.536 1.904-1.9a.75.75 0 111.06 1.06l-2.434 2.43a.746.746 0 01-.53.22z"></path></svg>
                    </span>
                    </div>
                    <span class=" css-1oibaro" data-font-weight="semibold"><span
                            class=" display--inline__09f24__c6N_k border-color--default__09f24__NPAKY">${restaurant.name} 에 n개의 리뷰 작성</span></span>
                </div>
            </div>
            <div class=" margin-b2__09f24__CEMjT border-color--default__09f24__NPAKY"><p
                    class="comment__09f24__gu0rG css-qgunke">
                <span class=" raw__09f24__T4Ezm">
                    ${review.content}
                </span>
            </p></div>
            <div class=" margin-t3__09f24__riq4X margin-b2__09f24__CEMjT border-color--default__09f24__NPAKY">
                <div class=" arrange__09f24__LDfbs gutter-2__09f24__CCmUo layout-wrap__09f24__GEBlv margin-b1__09f24__vaLrm border-color--default__09f24__NPAKY">
                    <div class=" arrange-unit__09f24__rqHTg border-color--default__09f24__NPAKY">
                        <div class=" photo-container-small__09f24__obhgq border-color--default__09f24__NPAKY">
                            <div class=" css-vzqfjs border-color--default__09f24__NPAKY"><a
                                    href="/biz_photos/almanac-beer-co-alameda?reviewid=lGId8L8yctz_6-YjANuhVg&amp;select=9hqHmIdcDah5z64EVfgS2Q"
                                    class="css-8dlaw4" target="_self"><img class=" css-xlzvdl"
                                                                           src="https://s3-media0.fl.yelpcdn.com/bphoto/9hqHmIdcDah5z64EVfgS2Q/180s.jpg"
                                                                           alt="Photo of Almanac Beer Co. - Alameda, CA, United States. Eco friendly:)"
                                                                           height="180" width="180" loading="lazy"
                                                                           draggable="true"></a></div>
                        </div>
                    </div>
                </div>
           </div>
        </div>
    </li>
    </c:forEach>
</ul>
