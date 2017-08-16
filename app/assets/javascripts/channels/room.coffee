$(document).on 'turbolinks:load', ->
  private_chat_id = $("#message_private_chat_id").val()
  enter_message()

  App.room = App.cable.subscriptions.create {
    channel: "RoomChannel"
    private_chat_id: private_chat_id
  },

  connected: ->
  disconnected: ->

  received: (data) ->
    $('#messages-table').append(
      """
      <div class="message">
        <p class="message-user">#{data.username}</p>
        <p class="message-body">#{data.content}</p>
      </div>
      """
    )

enter_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('.message-btn').click()
      event.target.value = ""
      event.preventDefault()

