$(document).on('turbolinks:load', function(){

    getComments(getBookId())
})
let idArray = []

const getComments = (id) => {
    return fetch(`http://localhost:3000/books/${id}/comments`)
    .then(res => res.json())
    .then(comments => {return listComments(comments)})
}

const getBookId = () => {
    let bookId = window.location.href.split("/")[4]
    return bookId
}

const listComments = (comments) => {
    const $ol = $("div.all_comments ol")
    $ol.html("")
    comments.forEach(comment => {
        $ol
        .append("<li><strong>" + comment.title +" </strong>"
        + " by " + comment.user.username + " " +
        `<a href="/books/${comment.book.id}/comments/${comment.id}">`
        + "View Comment</li>")
        idArray.push(comment.id)
    })
    return idArray
}