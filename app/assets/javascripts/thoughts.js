"use strict";

$('document').ready(function() {
  $('body').on("click", ".edit", editThought);
  $('body').on("click", ".mark-read", changeToRead);
  $('body').on("click", ".mark-unread", changeToUnread);
  $('#filter-content').on('keyup', filterByContent);
  $('#filter-read').on('change', filterByReadedness);
  $('#sort').on('click', sortAlphabetically);
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

function filterByContent(){
  let $thoughts = $('.thought');
  let filterParam = this.value;
  $thoughts.each(function (index, thought) {
    let $thought = $(thought);
    if ($thought.children('.title').text().indexOf(filterParam) !== -1 || $thought.children('.url').text().indexOf(filterParam) !== -1 ) {
      $thought.show();
    } else {
      $thought.hide();
    }
  });
};

function filterByReadedness(){
  let $thoughts = $('.thought');
  let filterParam = this.value;

  showFiltered($thoughts, filterParam);
}

function showFiltered($thoughts, filterParam){
  $thoughts.each(function (index, thought) {
    let $thought = $(thought);
    if (filterParam === "all") {
      $thought.show();
    } else if (filterParam === "read") {
      $thought.hide();
      $thought.children('.read').parent().show();
    } else if (filterParam === "unread") {
      $thought.hide();
      $thought.children('.unread').parent().show();
    }
  });
}

function sortAlphabetically() {
  let $thoughts = $('.thought');
  let sortedDivs = $thoughts.sort(function(first, second) {
    return $(first).find('.title').text() < $(second).find('.title').text();
  });
  $('#container').empty();
  $('#container').append(sortedDivs);
}
