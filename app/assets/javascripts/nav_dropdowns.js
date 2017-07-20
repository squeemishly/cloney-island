$(document).on('turbolinks:load', function() {
  $("a.add-attraction-button").on("click", function(event) {
    let newUrl = $(this).attr("href");
    let selectedDay = $("select#days").val();
    $.ajax({
      url: newUrl,
      data: { day: selectedDay },
      method: "PUT"
    }).done(function(response) {
      alert(response.responseText);
    }).fail(function(response) {
      alert(response.responseText);
    });
    event.preventDefault();
  });
});
