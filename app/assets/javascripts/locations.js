// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
  $('#location_name').keyup(function(){
    if ($(this).val() != ""){
         $(".location_submit").removeAttr("disabled").addClass("btn-danger").removeClass("btn-warning");
       }
    else{
       $(".location_submit").attr("disabled","disabled");
    }
      // $(this).attr("disabled", "disabled")
      // console.log("Rob");
}
  )
   $(".new_page").click(function() {
    console.log("hey man")
    var new_page = $(this).html()
    console.log(new_page)
    $(".location_list").addClass("hidden")
    $(".group_" + new_page).removeClass("hidden")

  })

})
