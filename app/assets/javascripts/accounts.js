$(function() {
  $(".account-type").on("click", function(){
    changeBackgroundColor($(this));
  });
  
  $("#account-types-form").on("click", function() {
    cleanFormData();
  });
  
  var userId;
});

var accountsArr = [];
  
function changeBackgroundColor(accountSelected) {
  accountSelected.toggleClass("account-selected");
}

function cleanFormData() {
  var accountsSelected = $(".account-selected");
  $.each(accountsSelected, function(i, val) {
    var accName = val.children[0].innerHTML.trim();
    accountsArr.push(accName);
  });
  accountsAjax();
}

function accountsAjax() {
  userId = $(".account-types-container")[0].id;
  $.ajax({
    method: "POST",
    url: "/users/" + userId + "/accounts",
    data: { account: { account_names: accountsArr } }
  }).done(function(data) {
    window.location.href = "/users/" + data.id + "/investments/new"
  });
}

