function addClassToCurrentPageLinks() {
    const currentURL = document.URL.split("/");
    const currentPage = currentURL[currentURL.length - 1];

    const p = currentPage.replace(/\?.+/, "").replace(/#.+/, "");

    // We assume that the page structure is shallow
    document.querySelectorAll('a').forEach(elem => {
        const tURL = elem.href.split("/");
        const tPage = tURL[tURL.length - 1];

        if (tPage === p) {
            elem.classList.add('current-link');
        }
    });
}

function assignEnlargeable() {
    // We never assign enlargeable to img in the modal pane.
    document.querySelectorAll('img:not(#modalImage)').forEach(elem => {
        // The element is shrunken and can be enlarged when
        // presented in the view port.
        elem.classList.toggle('enlargeable',
            elem.clientHeight < elem.naturalHeight &&
            elem.clientHeight < window.innerHeight &&
            elem.clientWidth < window.innerWidth);
    });
}

function addModalImageViewPane() {
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
    closeButton.addEventListener('click', function () {
        div.style.display = "none";
    });

    div.addEventListener('click', function (event) {
        if (!img.contains(event.target)) {
            div.style.display = "none";
        }
    });
    window.addEventListener('keydown', function (event) {
        if (event.key == 'Escape') {
            div.style.display = "none";
        }
    });

    div.appendChild(closeButton);
    div.appendChild(img);

    document.body.appendChild(div);

    document.querySelectorAll('img:not(#modalImage)').forEach(elem => {
        elem.addEventListener('click', function () {
            if (elem.classList.contains('enlargeable')) {
                div.style.display = "block";
                img.src = elem.src;
            }
        });
    });
}

function addTouchEventHandlingToDD() {
    const dds = document.querySelectorAll('.dd');
    // FIXME: Just adding 'touchstart' would be enough for iPad 
    dds.forEach(elem => {
        elem.addEventListener('touchstart', function () {
            if (elem.classList.contains('touched')) {
                elem.classList.remove('touched');
            }
            else {
                dds.forEach(dd => {
                    dd.classList.remove('touched');
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

        copyButton.addEventListener('click', function () {
            navigator.clipboard.writeText(elem.innerText).then(function () {
                // copyButton.classList.add('copied');
                // setTimeout(function () {
                //     copyButton.classList.remove('copied');
                // }, 3000);
            }).catch(function () {
                copyButton.classList.add('failed');
                setTimeout(function () {
                    copyButton.classList.remove('failed');
                }, 3000);
            });
        });

        div.appendChild(copyButton);
        elem.prepend(div);
    });
}

function addStickyHeadingObserver() {
    const observer = new IntersectionObserver(
        ([e]) => e.target.classList.toggle('stuck', e.intersectionRatio < 1),
        { threshold: [1] }
    );

    document.querySelectorAll('h2').forEach((e) => observer.observe(e));
}

function installScroll() {
    document.querySelectorAll('.scroll-box').forEach((sc) => {
        let isScrolling = false;

        const addScrollClass = () => {
            const scH = sc.scrollHeight;
            const scW = sc.scrollWidth;
            const scTop = sc.scrollTop;
            const scLeft = sc.scrollLeft;

            const clH = sc.clientHeight;
            const clW = sc.clientWidth;

            sc.classList.toggle('off-top', scTop > 0);
            sc.classList.toggle('off-bottom', Math.abs(scH - scTop - clH) >= 1);
            sc.classList.toggle('off-left', scLeft > 0);
            sc.classList.toggle('off-right', Math.abs(scW - scLeft - clW) >= 1);
        };

        sc.addEventListener('scroll', () => {
            if (!isScrolling) {
                window.requestAnimationFrame(() => { addScrollClass(); isScrolling = false; });
                isScrolling = true;
            }
        });
        window.requestAnimationFrame(() => { addScrollClass() });
    });
}

function activateTocTracking() {
    const toc = document.querySelector('nav.toc');
    if (!toc) return;

    const tocLinks = Array.from(toc.querySelectorAll('a[href^="#"]'));
    if (tocLinks.length === 0) return;

    const idToLink = new Map(
        tocLinks.map(a => [decodeURIComponent(a.getAttribute('href').slice(1)), a])
    );

    const mainbody = document.querySelector('section.mainbody');
    if (!mainbody) return;

    // Observe <section> elements that correspond to a TOC entry
    const sections = Array.from(mainbody.querySelectorAll('section[id]'))
        .filter(s => idToLink.has(s.id));

    if (sections.length === 0) return;

    const visibleSections = new Set();

    const observer = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                visibleSections.add(entry.target);
            } else {
                visibleSections.delete(entry.target);
            }
        });
        tocLinks.forEach(a => a.classList.remove('toc-active'));
        visibleSections.forEach(s => idToLink.get(s.id)?.classList.add('toc-active'));
    });

    sections.forEach(s => observer.observe(s));
}

window.addEventListener('DOMContentLoaded', function () {
    addClassToCurrentPageLinks();
    addModalImageViewPane();
    addTouchEventHandlingToDD();
    addCopyButtons();
    addStickyHeadingObserver();
    installScroll();
    activateTocTracking();
});

window.addEventListener('load', function () {
    assignEnlargeable();
    window.addEventListener('resize', assignEnlargeable);
});


