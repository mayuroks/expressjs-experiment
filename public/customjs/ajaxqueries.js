// Generated by CoffeeScript 1.6.3
var bindbutton, func;

bindbutton = function() {
  console.log("binding button");
  return $('button').each(function() {
    return $(this).click(func);
  });
};

func = function() {
  var del_url;
  del_url = "/delete/" + $(this).attr("data-amaid");
  return $.ajax({
    url: del_url,
    type: 'GET',
    complete: function(xhr, textStatus) {
      return $("body").load("/listama");
    },
    success: function(data, textStatus, xhr) {
      return console.log("DATA IS => " + data);
    },
    error: function(xhr, textStatus, errorThrown) {
      return alert(errorThrown);
    }
  });
};

$(function() {
  console.log("Loaded function script");
  return bindbutton();
});
