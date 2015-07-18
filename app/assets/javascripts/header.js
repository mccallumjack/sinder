console.log('page load');
$('#lang-nav li').on('click', 'a', function(e){
    e.preventDefault();
    var lang = $(this).text();
    console.log(lang);
});

