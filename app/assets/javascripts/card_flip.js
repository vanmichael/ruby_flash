$(document).ready(function(){
  $(".card").click(function( event ){
     event.preventDefault();
     $(this).toggleClass('rotated');
  });
});
