$(document).on('turbolinks:load', function(){

    $("a.js-next").on("click", function(e){
        e.preventDefault()
        let nextId = parseInt($(".js-next").attr("data-commentid")) + 1;
        const bookId = parseInt($(".js-next").attr("data-bookid"))
        $.get("/books/" + bookId + "/comments/" + nextId +".json", function(data) {
            console.log(data)
            $(".comment_title").text(data["title"]);
            $(".js-next").attr("data-commentid", data["id"])
            console.log(".js-next")
        })
    })
})
