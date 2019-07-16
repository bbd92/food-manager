// $(document).on('turbolinks:load', function(){
//   $('button').on("click", function(e){
//     e.preventDefault();
//     var val = $(this).siblings("textarea").val().replace(/[０-９]/g, function(s) {
//       return String.fromCharCode(s.charCodeAt(0) - 65248);
//     });
//     console.log(val)
//     var array = val.split(/\n+|\r\n+|\r+/);
//     console.log(array)
//     var format;
//     for (var i = 0; i < array.length; i++){
//       console.log(format)
//       array[i] = array[i].replace(/\s+/g, "")
//       console.log(array[i])
//       if (array[i].match(/^.+{1,16}([1-9]|1[0-2])月([1-9]|1[0-9]|2[0-9]|3[0-1])日\d{1,3}/)){
//         format = true
//       }else{
//         format = false
//       }
//     } 
//     return false
//   })
// });