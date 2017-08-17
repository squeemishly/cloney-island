$(document).on('turbolinks:load', function() {
  $("a.add-attraction-button").on("click", function(event) {
    event.preventDefault();
    var newUrl = $(this).attr("href");
    var selectedDay = $("select#days").val();

    $.ajax({
      url: newUrl,
      data: { day: selectedDay },
      method: "PUT"
    }).done(function(response) {
      alert(response);
    }).fail(function(response) {
      alert(response);
    });
    event.stopPropagation();
    event.preventDefault();
  });
});
