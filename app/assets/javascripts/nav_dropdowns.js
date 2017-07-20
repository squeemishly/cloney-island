$(document).on('turbolinks:load', function() {
  $("a.add-attraction-button").on("click", function(event) {
    let tripId = $("select#trips").val();
    let day = $("select#days").val();
    let url = window.location.href.split('?')[0];
    let newUrl = url + `?trip=${tripId}&day=${day}`;
    //window.location = newUrl;
    event.preventDefault();
  });
});
