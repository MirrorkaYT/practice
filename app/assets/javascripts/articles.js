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
  setXeditable()
};
$(document).ready(setXeditable)

setXeditable()

function setArrowDirection(dir, sort ){
  var nam = document.getElementById(sort)
  if(dir == "asc")
    nam.className = "glyphicon glyphicon-arrow-down active"
  else
    nam.className = "glyphicon glyphicon-arrow-up active"
  setXeditable()
}

function completet(arg){
  var nam = document.getElementById("check_"+arg)
      id = $(nam).attr('data-id')
      value = $(nam).is(":checked")
      path = $(nam).attr('data-path')
      console.log($(nam).attr('data-id'))
      console.log($(nam).closest(".articleObj").remove())
      html=$(nam).closest(".articleObj")

       if(value)
         $('#Read').last().after(html)
       else
          $('#Unread').last().after(html)

      $.ajax({
        url : path,
        type : 'PUT',
        dataType: "json",
        data: { article: {id: id, completed: value}}
      })
      setXeditable()
    }
setXeditable()

function sticky_relocate() {
    var window_top = $(window).scrollTop();
    var div_top = $('#sticky-anchor').offset().top;
    if (window_top > div_top) {
        $('#sticky').addClass('stick');
    } else {
        $('#sticky').removeClass('stick');
    }
}

$(function () {
    $(window).scroll(sticky_relocate);
    sticky_relocate
});

