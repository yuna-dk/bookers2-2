// Swiperのオプションを定数化
const opt = {
  loop: true,
  pagination: {
    el: '.swiper-pagination',
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
  autoplay: {
    delay: 5000, // 自動スライドの間隔（ミリ秒）
    disableOnInteraction: false, // ユーザーの操作後に自動スライドを再開するかどうか
  },
}

// Swiperを実行(初期化)
$(document).on('turbolinks:load', function() {
    let swiper = new Swiper('.swiper', opt);
});