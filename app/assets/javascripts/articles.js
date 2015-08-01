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

function setArrowDirection(dir, sort ){
  var nam = document.getElementById(sort)
  if(dir == "asc")
    nam.className = "glyphicon glyphicon-arrow-down active"
  else
    nam.className = "glyphicon glyphicon-arrow-up active"
}

function completet(arg){
  id = id + 1
  var nam = document.getElementById("check_"+arg)
      id = $(nam).attr('data-id')
      value = $(nam).is(":checked")
      path = $(nam).attr('data-path')
      console.log($(nam).attr('data-id'))
      console.log($(nam).closest("div").remove())
       html=$(nam).closest("div")

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
    }
