// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap3-editable/bootstrap-editable

//= require_tree .

var setXeditable;

$.fn.editable.defaults.mode = 'inline';

setXeditable = function() {
  return $("[data-xeditable=true]").each(function() {
    return $(this).editable({
      ajaxOptions: {
        type: "PUT",
        dataType: "json"
      },
      params: function(params) {
        var railsParams;
        railsParams = {};
        railsParams[$(this).data("model")] = {};
        railsParams[$(this).data("model")][params.name] = params.value;
        return railsParams;
      }
    });
  });
};
setXeditable()

var one = function(argg){
  t=argg
}

var setArrowDirection = function(arg){
  if(t == 'priority')
    d = document.getElementById("priority")
  else
    d = document.getElementById("due_date")

  if(arg == "asc"){
    d.className = "glyphicon glyphicon-arrow-down active"
  }
  else{
    d.className = "glyphicon glyphicon-arrow-up active"
  }
}
