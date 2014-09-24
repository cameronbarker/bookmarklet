// This script is only injected when the popup form is loaded
// (see popup.js), so we don't need to worry about waiting for page load

//Get Keywords with out breaking
//http://stackoverflow.com/questions/6288598/javascript-get-meta-keywords-and-if-non-dont-break-bookmarklet
function document_keywords(){
    var keywords = '';
    var metas = document.getElementsByTagName('meta');

    for (var x=0,y=metas.length; x<y; x++) {
        if (metas[x].name.toLowerCase() == "keywords") {
            keywords += metas[x].content;
        }
    }
    return keywords != '' ? keywords : '';
}

//get all the document images
function document_images(){
  var src = [];
  var images = document.images;
  for(var i = 0; i < images.length; i++) {
    src[i] = [images[i].src, sum([images[i].height, images[i].width])];
  }

  var sorted = sortImages(src)

  var finalsrc = []
  for(var i = 0; i < sorted.length; i++) {
    finalsrc[i] = sorted[i][0];
  }

  return finalsrc
}

function sum(array){
  return array.reduce(function(pv, cv) { return pv + cv; }, 0);
}

function sortImages(array){
  var sorted = array.sort(function(a,b) {
                return a[1] > b[1];
              });
  return sorted.reverse();
}


// Object to hold information about the current page
var pageInfo = {
    'title': document.title,
    'url': window.location.href,
    'note': window.getSelection().toString(),
    'tags': document_keywords(),
    "secondary_images": document_images()
};

// Send the information back to the extension
chrome.extension.sendMessage(pageInfo);



// Helpers that are currently commented out for various reasons

// not needed currently using chrome built in screenshot

// html2canvas(document.body, {
//  onrendered: function(canvas) {
//    dataURL = canvas.toDataURL('image/png');
//    // alert("saved");
//    // document.body.appendChild(canvas);
//  },
//  width: window.innerWidth,
//  height: window.innerHeight
// });

// Get og image and extra images
// Not needed currently
// function document_ogimage(){
//     var image = '';
//     var metas = document.getElementsByTagName('meta');
//
//     for (var x=0,y=metas.length; x<y; x++) {
//         if (String(metas[x].getAttribute("property")).toLowerCase() == "og:image") {
//             image += metas[x].content;
//         }
//     }
//     return image != '' ? image : '';
// }
