$(document).ready(function(){
  $('.list-group').on('click', '*', function(){
    console.log("You clicked on " + $(this).text());

    if ($(this).text() == "Full Menu") {
      $(this).show();
      // show all items, no filter
    } else {
      $(this).show();
    }
  })
});
