$(document).on('turbolinks:load', function(){
    $("#new_comment").on("submit", function(e){
        alert("Submitted")
        e.preventDefault()
    })

    getComments(getBookId())
})

const getComments = (id) => {
    return fetch(`http://localhost:3000/books/${id}/comments`)
    .then(res => res.json())
    .then(comments => console.log(comments))
}

const getBookId = () => {
    let bookId = window.location.href.split("/")[4]
    return bookId
}
