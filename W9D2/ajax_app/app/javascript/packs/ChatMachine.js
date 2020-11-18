const { $ } = require('@rails/ujs');
const { message } = require('statuses');

var ChatMachine = function ($el) {
  this.$messages = $el.find('ul');
  this.$form = $el.find('form');
  this.$form.on('submit', this.submitMessage.bind(this));
};

ChatMachine.prototype.submitMessage = function (e) {
  e.preventDefault();
  alert('nothing but the alert');
  $.ajax({
    method: 'POST',
    url: '/messages',
    dataType: 'json',
    data: this.$form.serialize(),
    // must be json here
    success: function (res) {
      this.addMessage(res);
      this.clearForm();
      alert('it works');
    }.bind(this),
  });
};
ChatMachine.prototype.addMessage = function (message) {
  var $message = $('<li>').text(message.author + ': ' + message.text);
  this.$messages.append(this.$message);
};
ChatMachine.prototype.clearForm = function () {
  this.$form.find("input[type='text']").val('');
};
module.exports = ChatMachine;
