jQuery ($) ->
  $(".persona-button").click (e) ->
    e.preventDefault()
    navigator.id.get (assertion) ->
      if assertion
        $.ajax
          url: "/users/sign_in"
          type: "POST"
          cache: false
          data:
            assertion: assertion
          success: ->
            window.location.reload()
