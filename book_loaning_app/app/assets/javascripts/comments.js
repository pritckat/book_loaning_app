$(document).on('turbolinks:load', function(){

    $("a.js-next").on("click", function(e){
        e.preventDefault()
        alert("hello")
    })
    alert("hello")
})