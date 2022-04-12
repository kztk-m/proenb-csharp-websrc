function addClassToCurrentPageLinks() {
    const currentURL = document.URL.split("/");
    const currentPage = currentURL[ currentURL.length - 1 ];

    // We assume that the menu list are shallow

    document.querySelectorAll('a').forEach( elem => {
        const tURL = elem.href.split("/");
        const tPage = tURL[ tURL.length - 1 ];
        
        if ( tPage == currentPage ) {
            elem.className += ' current-link';
        }
    });
}

function addModalImageViewPane() {
    const mainElem = document.getElementsByTagName("body")[0]; 

    // <div id="modalPane" class="modal-pane">
    //     <span class="close-button">&times;</span>
    //     <img id="modalImage" class="modal-image">
    // </div>

    const div = document.createElement("div");
    div.setAttribute("id", "modalPane");
    div.setAttribute("class", "modal-pane");
    
    const img = document.createElement("img");
    img.setAttribute("id", "modalImage");
    img.setAttribute("class", "modal-image");

    const closeButton = document.createElement("span");
    closeButton.setAttribute("class", "close-button");
    closeButton.appendChild( document.createTextNode("×") );
    closeButton.onclick = function () {
        div.style.display = "none";
    };

    div.onclick = function () {
        div.style.display = "none"; 
    };
    
    div.appendChild( closeButton ); 
    div.appendChild( img ); 

    mainElem.appendChild( div ); 

    document.querySelectorAll('img').forEach( elem => {
        if (elem.clientHeight < elem.naturalHeight) {
            elem.className += ' enlargeable'
            elem.onclick = function () {
                div.style.display = "block";
                img.src = elem.src;
            };        
        }
    });
}

window.onload = function () {
    addClassToCurrentPageLinks();
    addModalImageViewPane();
};


