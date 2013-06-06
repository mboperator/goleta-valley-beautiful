// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require underscore
//= require backbone
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require backbone_rails_sync
//= require backbone_datalink
//= require backbone/goleta_valley_beautiful_postgres
//= require bootstrap-dropdown
//= require bootstrap
//= require pjax
//= require jquery.pjax
//= require_tree .

$(document).ready(function(){
    $('[data-pjax-container]').pjax('a');
});
