// document.querySelectorAll('a[href="'+document.URL+'"]').forEach(
//     function(elem){
//         elem.className += ' current-link'
//     });
function addClassToCurrentPageLinks() {
    var currentURL = document.URL.split("/");
    var currentPage = currentURL[ currentURL.length - 1 ];

    // We assume that the menu list are shallow

    document.querySelectorAll('a').forEach( elem => {
        var tURL = elem.href.split("/");
        var tPage = tURL[ tURL.length - 1 ];
        
        if ( tPage == currentPage ) {
            elem.className += ' current-link';
        }
    });
}

window.onload = addClassToCurrentPageLinks;


