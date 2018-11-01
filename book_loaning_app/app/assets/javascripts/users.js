$(document).ready(function(){
    $("a.load_books").on("click", function(e){
        $.get(this.href).success(function(response){
            $('div.all_books').html(response)
        })
        e.preventDefault();
    })
})
