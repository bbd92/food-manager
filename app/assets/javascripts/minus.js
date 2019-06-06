// $(document).on('turbolinks:load', function(){
//   $('.foods__food__minus-sign').on('click', function(){
//     var foodId = $(this).data();
//     var url = '/foods/'+foodId.id
//     var quantity = $(this).siblings('.foods__food__quantity').text()
//     var subtractedQuantity = quantity - 1

//     $.ajax({
//       url: url,
//       type: 'PATCH',
//       dataType: 'json',
//       data: { quantity: subtractedQuantity },
//       processData: false,
//       contentType: false
//     })

//     .done(function(data){
//       console.log(data)
//       $(this).siblings('.foods__food__quantity').text(subtractedQuantity)
//     })

//     .fail(function(data){
//       console.log('fail')
//     })
//   })
// })