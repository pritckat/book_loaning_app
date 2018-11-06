$(document).on('turbolinks:load', function(){

    $("a.js-next").on("click", function(e){
        nextComment(e)
    })

    $("a.js-prev").on("click", function(e) {
        prevComment(e)
    })

    $("#new_reply").on("submit", function(e) {

        $.ajax({
            type: "POST",
            url: this.action,
            data: $(this).serialize(),
            success: function(r){
                newReply = new Reply(r.id, r.body, r.user.username, r.comment.id)
                console.log(newReply)
                $(".initial_replies").append("<li>" + newReply.printReply() + "</li>")
                $("#reply_body").val("")
            }
        })
        e.preventDefault()
    })

})

const bookId = parseInt($(".js-next").attr("data-bookid"))

const showComment = (data) => {
    $(".comment_title").text(data["title"]);
    $(".js-next").attr("data-commentid", data["id"])
    $(".comment_user").text(data["user"]["username"])
    $(".comment_book").text(data["book"]["title"])
    $(".comment_body").text(data["body"])        
    showReplies(data)
}

const prevComment = function(e) {
    e.preventDefault()
    let nextId = parseInt($(".js-next").attr("data-commentid")) - 1;
    $.get("/books/" + bookId + "/comments/" + nextId +".json", function(data) {
        console.log(data)
        showComment(data)
    })
}

const nextComment = function(e) {
    e.preventDefault()
    let nextId = parseInt($(".js-next").attr("data-commentid")) + 1;
    $.get("/books/" + bookId + "/comments/" + nextId +".json", function(data) {
        console.log(data)
        showComment(data)
    })
}

const showReplies = (data => {
    $(".initial_replies").html("")
    let $ul = $(".comment_replies ul")
    $ul.html("")
    data["replies"].forEach(reply =>
        $ul.append("<li>" + reply["body"] +"</li>")
    )
})

let Reply = class {
    constructor(id, body, userName, commentId) {
        this.id = id;
        this.body = body;
        this.userName = userName;
        this.commentId = commentId;
    }

    printReply() {
        return this.userName + " says: " + this.body
    }
}