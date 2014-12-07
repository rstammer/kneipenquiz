"use strict";

var FullscreenHandler = (function(){

  var control = {};

  control.init = function(){
        var fscrArea     = document.getElementById("fscr-area"),
            fscrButton   = document.getElementById("fscr-button"),
            nextButton   = document.getElementById("next-button"),
            currentSlide = document.getElementById("current_slide");

        nextButton.onclick = getNextSlide();

        // Chooses the correct browser prefix for HTML5-Fullscreen-call
        var vendor_prefix = ["moz", "webkit", "ms", "o", ""];
        function VendorPrefixMethod(obj, method) {
        var p = 0, m, t;
        while (p < vendor_prefix.length && !obj[m]) {
            m = method;
            if (vendor_prefix[p] == "") {
                m = m.substr(0,1).toLowerCase() + m.substr(1);
            }
            m = vendor_prefix[p] + m;
            t = typeof obj[m];
            if (t != "undefined") {
                vendor_prefix = [vendor_prefix[p]];
                return (t == "function" ? obj[m]() : obj[m]);
            }
            p++;
            }
        }

        function getNextSlide(number) {
            $.get("/games/1/slides/1.js", function(data){
                currentSlide.innerHTML = data
            });
        }

        function runFullscreen(element) {
            if (VendorPrefixMethod(document, "FullScreen") || VendorPrefixMethod(document, "IsFullScreen")) {
                VendorPrefixMethod(document, "CancelFullScreen");
            }

            else {
                VendorPrefixMethod(element,"RequestFullScreen");
            }
        }

        if(fscrButton) {
            fscrButton.onclick = function() {
                fscrArea.style.display = 'block'
                runFullscreen(fscrArea);
            };
        };
  };

  return control;

}());
