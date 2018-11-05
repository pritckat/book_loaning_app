$(document).on('turbolinks:load', function(){
    $("a.load_books").on("click", function(e){
        var $title = $("div.all_books")
        $title.html("<ol></ol>")
        $title.prepend("<h3>Books</h3>")
        $.get(this.href).success(function(json){
            var $ol = $("div.all_books ol")
            $ol.html("")
            json.forEach(function(book){
                $ol.append("<li>" +`<a href="/books/${book.id}">` + book.title + "</li>")
            })
        })
        e.preventDefault();
    })
})
