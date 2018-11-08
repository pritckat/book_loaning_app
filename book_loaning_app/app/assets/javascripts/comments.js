$(document).on('turbolinks:load', function(){
    const bookId = getBookId()

    $("a.js-next").on("click", function(e){
        switchComment(e, "next", bookId);
    });

    $("a.js-prev").on("click", function(e) {
        switchComment(e, "prev", bookId);
    });

    $("#new_reply").on("submit", function(e) {
        $.ajax({
            type: "POST",
            url: this.action,
            data: $(this).serialize(),
            success: function(r){
                if (r.body != "") {
                    newReply = new Reply(r.id, r.body, r.user.username, r.comment.id);
                    $(".initial_replies ul").append("<li>" + newReply.printReply() + "</li>");
                    $("#reply_body").val("");
                }
            }
        })
        e.preventDefault();
    })
})

const switchComment = function(e, dir, bookId) {
    let uniqueIdArray = [...new Set(idArray)]
    e.preventDefault();
    let nextId = parseInt($(".js-next").attr("data-commentid"))
    let currentIndex = uniqueIdArray.indexOf(nextId)
    if (dir === "next") {
        nextId = uniqueIdArray[`${currentIndex + 1}`]
    }
    else if (dir === "prev") {
        nextId = uniqueIdArray[`${currentIndex - 1}`]
    }
    let nextUrl = "/books/" + bookId + "/comments/" + nextId +".json"
    $.get(nextUrl, function(data) {
    showComment(data);
    })
}
const showComment = (data) => {
    $(".comment_title").text(data["title"]);
    $(".js-next").attr("data-commentid", data["id"]);
    $(".comment_user").text(data["user"]["username"]);
    $(".comment_book").text(data["book"]["title"]);
    $(".comment_body").text(data["body"]);
    $("#reply_comment_id").val(data["id"]);       
    showReplies(data);
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
