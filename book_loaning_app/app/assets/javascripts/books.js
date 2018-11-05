$(document).on('turbolinks:load', function(){
    $("#new_comment").on("submit", function(e){
        alert("Submitted")
        e.preventDefault()
    })

    const getComments = (id) => {
        return fetch(`http://localhost:3000/books/${id}/comments`)
        .then(res => res.json())
        .then(comments => console.log(comments))
    }

    $("a.log_comments").on("click", function() {
        getComments(17)
    })
})