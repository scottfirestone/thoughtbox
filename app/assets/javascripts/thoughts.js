"use strict";

// let editThought = require('editThought');

$('document').ready(function() {
  $('body').on("click", ".edit", editThought);
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
