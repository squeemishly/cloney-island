$(document).on('turbolinks:load', function() {
  $("a.add-attraction-button").on("click", function() {
    let tripId = $("select#trips").val();
    let existingParams = window.location.split('?');
    window.location = '/search?trip'
  });
  // $("select#trips").on("change", function() {
  //   window.location = window.location +
  // });
});
