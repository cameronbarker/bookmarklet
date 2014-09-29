//Base code pulled from:
// http://markashleybell.com/building-a-simple-google-chrome-extension.html

// Might want to compress the images further
// http://pieroxy.net/blog/pages/lz-string/index.html


//Global Variables
var mainSrc, chromeScreenShot, statusDisplay = null;

// This callback function is called when the content script has been
// injected and returned its results
function onPageInfo(o)  {
    console.log(o);
    document.getElementById('title').value = o.title;
    document.getElementById('url').value = o.url;
    document.getElementById('note').innerText = o.note;
    document.getElementById('tags').value = o.tags;
    document.getElementById('main_image').src = chromeScreenShot;
    mainSrc = chromeScreenShot;

    //create secondary image li
    buildSecondaryImages(o.secondary_images);

    //pull data and build group select options
    getBookmarkData.buildGroups();

}

// Add secondary image choices to UL
// Add hover preview for secondary images
function buildSecondaryImages(array){
  var ul = document.getElementById('secondary_images')
  for(var i = 0; i < array.length; i++) {
    var li = document.createElement("li");
    var image = new Image();
    image.src = array[i];
    image.width = 25;
    image.className = "secondary_images";
    li.appendChild(image);
    ul.appendChild(li);
  }

  $( ".secondary_images" ).hover(
    function() {
      document.getElementById('main_image').src = $(this).attr("src");
    }, function() {
      document.getElementById('main_image').src = mainSrc;
    }
  );

}



// POST the data to the server using AJAX
function addBookmark() {
    // Cancel the form submit
    event.preventDefault();

    statusDisplay.innerHTML = 'Saving...';
    var title = $('#title').val();
    var image = $('#main_image').attr('src');
    var note = $('#note').val();
    var tags = $('#tags').val();
    var sendto = $('#sendto').val();
    var url = $('#url').val();

    //get group data
    var group, locked;
    if(!$('#newGroup').val()){
      group = $('#groups option:selected').val();
      locked = $('#groups option:selected').data("locked");
    }
    else{
      group = $('#newGroup').val();
      if($('input[name=newGroupPrivate]').is(":checked")){
        locked = true
      }
      else{
        locked = false
      }

    }

    var query = {
                  bookmark: {
                    "title":title,
                    "url": url,
                    "group": group,
                    "locked": locked,
                    "image": image,
                    "note": note,
                    "tags": tags,
                    "sendto": sendto
                    }
                  }
   //submit data
   $.ajax({
          url: 'http://localhost:3000/api/v1/bookmarks',
          type: 'post',
          dataType: 'json',
          data: query,
          success: function (data) {
            statusDisplay.innerHTML = 'Saved';
          },
          failure: function(errMsg) {
            statusDisplay.innerHTML = 'Error';
          }
      });
}

//Work with an object for fun
var getBookmarkData = {
    buildGroups: function(){
      $.ajax({
             url: 'http://localhost:3000/api/v1/groups',
             type: 'get',
             dataType: 'json',
             success: function (data) {
               var select = document.getElementById('groups');
               for(i=0; i < data.length; i++){
                 var option = document.createElement("option");
                 option.text = data[i].title;
                 option.value = data[i].id;
                 option.dataset.locked = data[i].locked;
                 select.add(option);
               }
             },
             failure: function(errMsg) {
               console.log("error");
             }
         });

    }
}



//set beautiful cookies
var cookies = {
  new: function(name, value){
    return $.cookie(name, value);
  },
  read: function(name){
      return $.cookie(name);
    }
};




// When the popup HTML has loaded
window.addEventListener('load', function(evt) {
    // Handle the bookmark form submit event with our addBookmark function
    document.getElementById('addbookmark').addEventListener('submit', addBookmark);
    // Cache a reference to the status display SPAN
    statusDisplay = document.getElementById('status-display');

    //When page loads pull screenshot of current page
    chrome.tabs.captureVisibleTab(
            chrome.windows.WINDOW_ID_CURRENT,
            function (src) {
              chromeScreenShot = src;
              // displays a link to the image. Can be replaced by an alert() to
              // verify the result is 'undefined'
            }
          );


    //focus cursor on form
    document.getElementById('title').focus();

    if(cookies.read("bookmarklet-auth") !== undefined){
      $('#loggedin').show();
    }else{
      $('#login').show();
    }

    $('textarea').on( "click", function() {
      $('.other').prop('checked', true);
    });

    $('.other').on( "click", function() {
      $('textarea').focus();
    });


    // Call the getPageInfo function in the background page, injecting content_script.js
    // into the current HTML page and passing in our onPageInfo function as the callback
    chrome.extension.getBackgroundPage().getPageInfo(onPageInfo);
});
