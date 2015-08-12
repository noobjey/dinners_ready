$(document).ready(function(){
  getAllItems();

  $('#breakfast').on('click', function(){
    getChoiceItems("breakfast")
  });

  $('#lunch').on('click', function(){
    getChoiceItems("lunch")
  })

  $('#dinner').on('click', function(){
    getChoiceItems("dinner")
  })

  $('#full-menu').on('click', function(){
    getAllItems();
  })
});

function getAllItems() {
  $.ajax({
    url: "/api/v1/items",
    type: "GET",
    success: function(response) {
      clearItems();
      response.forEach(function(item){
        buildTheThing(item)
      })
    }, error: function(xhr) {
      console.log("You messed up.");
    }
  });
};

function getChoiceItems(choice){
  $.ajax({
    url: "/api/v1/items",
    type: "GET",
    data: { 'choice': choice },
    success: function(response) {
      clearItems();
      response.forEach(function(item){
        buildTheThing(item)
      })
    }, error: function(xhr) {
      console.log("You messed up.");
    }
  });
}

function clearItems() {
  $('#item-view').html("");
}

function buildTheThing(item) {
  var $html = getItemHtml(item);
  $html.find('.cart-btn').on('click', function () {
    $.post('/cart_items', { item_id: item.id });
  });
  $('#item-view').append($html);
}
