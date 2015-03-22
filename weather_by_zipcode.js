<script>
var ready;
ready = function() {
  var renderPageTitleBasedOnZipCodeCityName = function(zipCode) {
    $.ajax({
    url: "http://poncho.is/api/v2/location/" + zipCode + "/",
      context: document.body
    }).done(function(response) {
      var weather = response.data
      console.dir(weather);
      $('#main-title').html('<h1>' + weather.city + '</h1>');
    });
  }

  $("#main-button").click(function() {
    var zipCode = $("#main-input").val();
    console.log(zipCode);
    renderPageTitleBasedOnZipCodeCityName(zipCode);
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
</script>

<div id="main-title">
  <input id="main-input"></input>
  <button id="main-button">Click Me </button>
</div>
