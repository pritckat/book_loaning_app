$(document).on('turbolinks:load', function(){

    $("a.js-next").on("click", function(e){
        switchComment(e, "next");
    });

    $("a.js-prev").on("click", function(e) {
        switchComment(e, "prev");
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

    const getBookId = () => {
        let bookId = window.location.href.split("/")[4]
        return bookId
    }

    const getComments = function(id) {
        return fetch(`http://localhost:3000/books/${id}/comments`)
        .then(res => res.json())
        .then(comments => collectCommentIds(comments))
    }

    const collectCommentIds = function(comments) {
        let idsArray = []
        comments.forEach(comment => {
            idsArray.push(comment.id)
        })
        console.log(idsArray)
        return idsArray 
    }
    getComments(getBookId())


    const switchComment = function(e, dir) {
        e.preventDefault();
        let nextId
        if (dir === "next") {
            nextId = parseInt($(".js-next").attr("data-commentid")) + 1;
        }
        else if (dir === "prev") {
            nextId = parseInt($(".js-next").attr("data-commentid")) - 1;
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
})