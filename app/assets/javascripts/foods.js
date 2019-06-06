$(document).on('turbolinks:load', function(){
  $(".footer").on("click", function(){
    $("new-html").show();
  })

  function buildhtml(food){
    var foodHAML = `.foods__food 
                      .foods__food__name
                        = ${food.name}
                      .foods__food__expiration-date
                        = ${food.expiration_date}
                      .foods__food__quantity
                        = ${food.quantity}
                      %div{class: "foods__food__minus-sign", data: {id: "${food.id}"}}
                        - if ${food.quantity} > 1
                          =link_to "ー", "/foods/${food.id}", method: :patch
                        - else
                          =link_to "ー", "/foods/${food.id}", method: :delete`
    return foodHAML
  }

  $("submit-create").on("submit", function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    
    $.ajax({
      type: "POST",
      url: url,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(food){
      var html = buildHAML(food);
      $(".foods").append(foodHAML);
      $('form')[0].reset();
    })

    .fail(function(){
      alert('error');
    });

  })

})