bindbutton = () ->
	console.log "binding button"
	$('button').each () ->
		$(this).click func

func = () ->
	# alert $(this).attr("data-amaid")
	del_url = "/delete/" + $(this).attr("data-amaid")
	$.ajax({
	  url: del_url,
	  type: 'GET',
	  # dataType: 'xml/html/script/json/jsonp',
	  # data: {param1: 'value1'},
	  complete: (xhr, textStatus) ->
	  	$("body").load("/listama")
	    # //called when complete
	  success: (data, textStatus, xhr) ->
	  	console.log "DATA IS => " + data
	    # //called when successful
	  error: (xhr, textStatus, errorThrown) ->
	    # //called when there is an error
	    alert errorThrown
	
	});
	
	# alert "function works"
	# event.preventDefault()

$ ->
	console.log "Loaded function script"
	bindbutton()