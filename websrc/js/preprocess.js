function addClassToCurrentPageLinks() {
    const currentURL = document.URL.split("/");
    const currentPage = currentURL[currentURL.length - 1];

    const p = currentPage.replace(/\?.+/, "").replace(/#.+/, "");

    // We assume that the page structure is shallow
    document.querySelectorAll('a').forEach(elem => {
        const tURL = elem.href.split("/");
        const tPage = tURL[tURL.length - 1];

        if (tPage == p) {
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
    closeButton.appendChild(document.createTextNode(""));
    closeButton.onclick = function () {
        div.style.display = "none";
    };

    div.addEventListener('click', function (event) {
        if (!img.contains(event.target)) {
            div.style.display = "none";
        }
    });

    div.appendChild(closeButton);
    div.appendChild(img);

    mainElem.appendChild(div);

    document.querySelectorAll('img').forEach(elem => {
        if (elem.clientHeight < elem.naturalHeight) {
            elem.className += ' enlargeable'
            elem.onclick = function () {
                div.style.display = "block";
                img.src = elem.src;
            };
        }
    });
}

function addTouchEventHadnlingToDD() {
    const dds = document.querySelectorAll('.dd');
    // FIXME: Just adding 'touchstart' would be enough for iPad 
    dds.forEach(elem => {
        elem.addEventListener('touchstart', function (event) {
            if (elem.classList.contains('touched')) {
                elem.classList.remove('touched');
            }
            else {
                dds.forEach(elem => {
                    elem.classList.remove('touched');
                });
                elem.classList.add('touched');
            }
        });
    });
}

function addCopyButtons() {
    /*
      This relies on the fact that pandoc generates

      <div class="sourceCode"><pre class="sourceCode langName"><code class="sourceCode langName">...</code></pre></div>
      
      for code blocks.       

     */
    const codeBlocks = document.querySelectorAll('pre.sourceCode');


    /*
      <pre class="sourceCode">...</pre>

      -->

      <pre class="sourceCode">...
        <div class="code-control"><span class="copyButton"></span></div>
      </pre>      
     */

    codeBlocks.forEach(elem => {
        // const cs = elem.querySelectorAll('code');

        // if ( cs.length != 1 ) { return true; }
        // const code = cs[0]; 

        const div = document.createElement('div');
        div.classList.add('code-control');
        const copyButton = document.createElement("span");
        copyButton.classList.add('copy-button');

        const k = function () {
            navigator.clipboard.writeText(elem.innerText).then(function () {
                // copyButton.classList.add('copied');                        
                // setTimeout(function () {
                //     copyButton.classList.remove('copied');
                // }, 3000); 
            }).catch(function (error) {
                try {
                    console.log("fall back to execCommand");
                    elem.select();
                    document.execCommand("copy");
                }
                catch (err) {
                    copyButton.classList.add('copy-failed');
                    setTimeout(function () {
                        copyButton.classList.remove('copy-failed');
                    }, 3000);
                }
            });
        };

        copyButton.addEventListener('click', function (e) {
            navigator.permissions.query({ name: "clipboard-write" }).then(result => {
                if (result.state == "granted" || result.state == "prompt") {
                    k();
                }
            }).catch(function (error) {
                // try without permission
                k();
            });
        });

        div.appendChild(copyButton);
        elem.prepend(div);
    });
}


window.onload = function () {
    addClassToCurrentPageLinks();
    addModalImageViewPane();
    addTouchEventHadnlingToDD();
    addCopyButtons();
};


