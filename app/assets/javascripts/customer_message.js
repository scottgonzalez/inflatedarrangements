$(function () {
  $('.customer-messages').on('click', 'tbody tr', function (event) {
    window.location = $(this).attr('data-href')
  })
})
