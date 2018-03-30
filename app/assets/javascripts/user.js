$(document).ready(function() {
  $(".dropdown-button").dropdown();
  $('select').material_select();
});

function initMap() {
        var uluru = {lat: 34.719735, lng: 135.418066};
        var map = new google.maps.Map(document.getElementById('fukuei-map'), {
          zoom: 17,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
}

 // Initialize collapse button
  $(".button-collapse").sideNav();
  // Initialize collapsible (uncomment the line below if you use the dropdown variation)
  //$('.collapsible').collapsible();

// Materialize.toast(message, displayLength, className, completeCallback);
  Materialize.toast(message, duration) // 4000 is the duration of the toast
// function showToast(message, duration) {
//   Materialize.toast(message, duration,'rounded');
// }
  // $('#gyomu').fadeIn();
