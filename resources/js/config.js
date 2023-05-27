$(document).ready(function () {
    loadJSON(processData);
});


function loadJSON(callback) {
    var xobj = new XMLHttpRequest();
    xobj.overrideMimeType("application/json");
    xobj.open('GET', './config.json', true);
    xobj.onreadystatechange = function () {
        if (xobj.readyState === 4 && xobj.status === 200) {
            callback(xobj.responseText);
        }
    };
    xobj.send(null);
}


function processData(data) {
    var config = JSON.parse(data);
    let info = config.MAIN; 
    let pageName = $('#pagename').attr('data-title');
    $('title').text(info.NAME +' - '+pageName);
    $('#favicon').attr('href','/public/images/'+info.FAVICON+'.png');

    if(info.FRAMEWORK == "bootstrap") {
        $('head').append(`<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"></link>`);
        $('body').append(`<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>`)
        $('#navBootstrap').css('display','block');
    }else if(info.FRAMEWORK == "tailwind"){
        $('head').append(`<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css" rel="stylesheet" />`);
        $('body').append(`<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.js"></script>`)
        $('#navTailwind').css('display','block');
    }
    $('#navTitle').text(info.NAME);
}

