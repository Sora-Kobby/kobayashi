// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
document.addEventListener("DOMContentLoaded", function() {
    // 画像リストを配列として定義
    const leftImages = [
      "/assets/left/beer1.jpg",
      "/assets/left/highball.jpg",
      "/assets/left/lemon.jpeg",
      "/assets/left/chamisuru.jpeg",
      "/assets/left/wine.jpg",
      "/assets/left/makkori.jpg",
    ];
  
    const rightImages = [
      "/assets/right/motsuni.jpg",
      "/assets/right/yakitori.jpg",
      "/assets/right/yakitori2.jpg"
    ];

  
     // 現在のインデックス
  let currentLeftIndex = 0;
  let currentRightIndex = 0;

   // 左右のセクション要素を取得
   const leftSection = document.querySelector('.left-section');
   const rightSection = document.querySelector('.right-section');
 
  // フェードアウトとフェードインを管理する関数
  function changeBackgroundImage() {
    // フェードアウト
    leftSection.classList.add('fade-out');
    rightSection.classList.add('fade-out');

    // フェードアウト完了後（2秒後）に画像を変更し、フェードイン
    setTimeout(function() {
      // 新しい画像を選択
      currentLeftIndex = (currentLeftIndex + 1) % leftImages.length;
      currentRightIndex = (currentRightIndex + 1) % rightImages.length;

      leftSection.style.backgroundImage = `url(${leftImages[currentLeftIndex]})`;
      rightSection.style.backgroundImage = `url(${rightImages[currentRightIndex]})`;

      // フェードアウトクラスを削除してフェードインを行う
      leftSection.classList.remove('fade-out');
      rightSection.classList.remove('fade-out');
      
      // すぐにフェードインを開始
      leftSection.classList.add('fade-in');
      rightSection.classList.add('fade-in');

      // フェードインが完了したらフェードインのクラスを削除
      setTimeout(function() {
        leftSection.classList.remove('fade-in');
        rightSection.classList.remove('fade-in');
      }, 2000); // フェードインの完了まで待機
    }, 2000); // フェードアウト後に画像を変更
  }

  // 初期画像設定
  leftSection.style.backgroundImage = `url(${leftImages[currentLeftIndex]})`;
  rightSection.style.backgroundImage = `url(${rightImages[currentRightIndex]})`;

  // 10秒ごとに背景画像を切り替える
  setInterval(changeBackgroundImage, 10000);
});