$(document).on('turbolinks:load', function() {
  $("a.add-attraction-button").on("click", function(event) {
    let newUrl = $(this).attr("href");
    let selectedDay = $("select#days").val();
    // console.log(newUrl)

    $.ajax({
      url: newUrl,
      data: { day: selectedDay },
      method: "PUT"
    }).done(function(response) {
      // alert(response.responseText);
      alert(response);
    }).fail(function(response) {
      // alert(response.responseText);
      alert(response);
    });
    event.preventDefault();
  });
});
