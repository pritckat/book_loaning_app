$(document).on('turbolinks:load', function(){
    $("#new_comment").on("submit", function(e){
        alert("Submitted")
        e.preventDefault()
    })
})