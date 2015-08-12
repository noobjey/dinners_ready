function getItemHtml(item) {
  var html = "<div class='col-sm-4 col-lg-4 col-md-4 item-box'>"
             +"<div class='thumbnail'>"
             +"<img alt='image_url' class='item-image' src='" + item.image_url + "'>"
             +"<div class='caption'>"
             +"<h4 class='pull-right'>$" + item.price + "</h4>"
             +"<a href='/meals/item.id'>" + item.name + "</a><br>"
             +item.description
             +"<button class='btn btn-primary btn-large center-block cart-btn'>Add to Cart</button>"
             + "</div>"
             + "</div>"
             + "</div>"
  return $(html);
}
