$(document).on('turbolinks:load', function(){

    $("a.js-next").on("click", function(e){
        nextComment(e);
    });

    $("a.js-prev").on("click", function(e) {
        prevComment(e);
    });

    $("#new_reply").on("submit", function(e) {
        $.ajax({
            type: "POST",
            url: this.action,
            data: $(this).serialize(),
            success: function(r){
                newReply = new Reply(r.id, r.body, r.user.username, r.comment.id);
                $(".initial_replies ul").append("<li>" + newReply.printReply() + "</li>");
                $("#reply_body").val("");
            }
        })
        e.preventDefault();
    })
    const bookId = parseInt($(".js-next").attr("data-bookid"))

    console.log(bookId)

})



const showComment = (data) => {
    $(".comment_title").text(data["title"]);
    $(".js-next").attr("data-commentid", data["id"]);
    $(".comment_user").text(data["user"]["username"]);
    $(".comment_book").text(data["book"]["title"]);
    $(".comment_body").text(data["body"]);
    $("#reply_comment_id").val(data["id"]);       
    showReplies(data);
}

const prevComment = function(e) {
    e.preventDefault();
    //const bookId = parseInt($(".js-next").attr("data-bookid"))
    let nextId = parseInt($(".js-next").attr("data-commentid")) - 1;
    //console.log(nextId)
    console.log(bookId)
    $.get("/books/" + bookId + "/comments/" + nextId +".json", function(data) {
        showComment(data);
        console.log(data)
    })
}

const nextComment = function(e) {
    e.preventDefault();
    //const bookId = parseInt($(".js-next").attr("data-bookid"))
    console.log(bookId)
    let nextId = parseInt($(".js-next").attr("data-commentid")) + 1;
    //console.log(nextId)
    $.get("/books/" + bookId + "/comments/" + nextId +".json", function(data) {
        showComment(data);
        console.log(data)
    })
}

const showReplies = (data => {
    let $ul = $(".initial_replies ul");
    $ul.html("");
    data["replies"].forEach(reply =>
        $ul.append("<li>" + reply.user.username + " says: " + reply["body"] +"</li>")
    );
})

let Reply = class {
    constructor(id, body, userName, commentId) {
        this.id = id;
        this.body = body;
        this.userName = userName;
        this.commentId = commentId;
    }

    printReply() {
        return this.userName + " says: " + this.body;
    }
}