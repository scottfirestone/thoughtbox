"use strict";

$('document').ready(function() {
  $('body').on("click", ".edit", editThought);
  $('body').on("click", ".mark-read", changeToRead);
  $('body').on("click", ".mark-unread", changeToUnread);
})

function editThought(){
  let thought_id = $(this).parent().data("thought-id");
  let thought = $("div[data-thought-id*="+ thought_id + "]");
  let thoughtParams = {
    thought: {
      url : $(thought).children('.url').text(),
      title : $(thought).children('.title').text()
    }
  };

  $.ajax({
    url: "/api/v1/links/" + thought_id,
    method: "PUT",
    dataType: "json",
    data: thoughtParams,
    success: function() {
      alert("Thought updated!")
      location.reload();
    },
    error: function() {
      alert("URL needs to be in a proper format.");
      location.reload();
    }
  })
}

function changeToRead() {
  let thought_id = $(this).parent().data("thought-id");
  $(this).parents('.thought').children('.title').addClass('read').removeClass('unread');
  $(this).parents('.thought').children('.url').addClass('read').removeClass('unread');
  $(this).text("Mark as Unread");
  $(this).removeClass('mark-read').addClass('mark-unread');

  $.ajax({
    url: "/api/v1/links/" + thought_id,
    method: "PUT",
    dataType: "json",
    data: {
      "toggleRead" : true
    }
  });
}

function changeToUnread() {
  let thought_id = $(this).parent().data("thought-id");
  $(this).parents('.thought').children('.title').removeClass('read').addClass('unread');
  $(this).parents('.thought').children('.url').removeClass('read').addClass('unread');
  $(this).text("Mark as Read");
  $(this).removeClass('mark-unread').addClass('mark-read');

  $.ajax({
    url: "/api/v1/links/" + thought_id,
    method: "PUT",
    dataType: "json",
    data: {
      "toggleRead" : true
    }
  });
}
