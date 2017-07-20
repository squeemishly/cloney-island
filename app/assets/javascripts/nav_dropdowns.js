$(document).on('turbolinks:load', function() {
  $("a.add-attraction-button").on("click", function(event) {
    let selectedDay = $("select#days").val();
    $.ajax({
      url: newUrl,
      data: { day: selectedDay },
      method: "PUT"
    }).done(function(response) {
      alert("response");
    });
    event.preventDefault();
  });
});
