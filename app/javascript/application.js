// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import jquery from "jquery"
window.$ = jquery


// console.log("js ok");

// $(function(){
//   alert('ok');
// });

// 定数
const task_creat_form = document.getElementById('task_create_form');

// タスク登録を登録したらフォームを空欄にリセットする
document.addEventListener("turbo:submit-end", function(){
  task_creat_form.value = '';
  console.log("submit-end");
});