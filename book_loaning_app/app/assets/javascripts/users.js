$(document).on('turbolinks:load', function(){
    $(".alphabetize_books").on("click", function(e) {
        // debugger
        // console.log(this)
        $.get(this.attributes.href.value + ".json").success(function(json) {
            const books = sortBooks(json)
            $(".alphabetized_books ul").html("")
            books.forEach(book => {
                $(".alphabetized_books ul").append("<li>" + book.title + "</li>")
            })
        })
    })
})

const sortBooks = (books) => {
    return books.sort(function(a, b) {
        const nameA = a.title.toUpperCase()
        const nameB = b.title.toUpperCase()
        if (nameA < nameB) {
            return -1;
          }
        if (nameA > nameB) {
            return 1;
        }
        return 0;
    })
}
