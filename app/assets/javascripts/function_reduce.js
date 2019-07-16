$(document).on('turbolinks:load', function(){
  $(".basement__right__border__contents__content__reduce").click(function(){
    var selectedId = $(this).parent().data().id;
    var url = "/foods/"+selectedId
    var quantity = $(this).siblings(".basement__right__border__contents__content__quantity").text()
    var data = { quantity: quantity}
    if(quantity == 1){
      $.ajax({
        type: "DELETE",
        url: url,
        data: data,
        dataType: "JSON",
        context: this,
        processData: false,
        contentType: false
      })
      .done(function(data){
        $(this).parent().hide();
      })
      .fail(function(){
        alert('error')
      })
    }else{
      $.ajax({
        type: "PUT",
        url: url,
        data: data,
        dataType: "JSON",
        context: this,
        processData: false,
        contentType: false
      })
      .done(function(data){
        $(this).siblings(".basement__right__border__contents__content__quantity").text(data.quantity)
        if(data.quantity == 1){
          $(this).text("×")
        }
      })
      .fail(function(){
        alert('error')
      })
    }
    return false
  });
});