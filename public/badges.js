var params = document.getElementById('badges_script');
query = params.classList;
var image_size = params.getAttribute("data-image");
var charity_link = params.getAttribute("data-url");

document.write('<a href="'+ charity_link +'" style="width: 220px; display: inline-block;"><img alt="" src="http://onebillionshirts.org/badges/'+ image_size +'.png"></a>');