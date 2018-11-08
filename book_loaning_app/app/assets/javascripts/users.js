// $(document).on('turbolinks:load', function(){
//     $("a.load_books").on("click", function(e){
//         let $title = $("div.all_books")
//         $title.html("<ol></ol>")
//         $title.prepend("<h3>Books</h3>")
//         //debugger
//         $.get(this.href + ".json").success(function(json){
//             //debugger
//             let $ol = $("div.all_books ol")
//             $ol.html("")
//             json.forEach(function(book){
//                 //debugger
//                 $ol.append("<li>" +`<a href="/books/${book.id}">` + book.title + "</li>")
//             })
//         })
//         e.preventDefault();
//     })
// })
