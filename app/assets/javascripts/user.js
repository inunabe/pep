$(document).ready(function() {
  $(".dropdown-button").dropdown();
  $('select').material_select();
});

function initMap() {
        var uluru = {lat: 34.719735, lng: 135.418066};
        var map = new google.maps.Map(document.getElementById('fukuei-map'), {
          zoom: 19,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
}
