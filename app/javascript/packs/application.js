// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import ReactOnRails from 'react-on-rails';
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels";
import 'bootstrap/dist/js/bootstrap'
import "bootstrap/dist/css/bootstrap";
Rails.start()
Turbolinks.start()
ActiveStorage.start()
var jQuery = require('jquery')

// Import Components
import AppReviews from '../components/administration/app_review'
import CategoryFix from '../components/administration/category'

// include jQuery in global and window scope (so you can access it globally)
// in your web browser, when you type $('.div'), it is actually refering to global.$('.div')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

ReactOnRails.register({
  AppReviews,
  CategoryFix
});

