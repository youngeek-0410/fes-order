// Loads all Fomantic javascripts
//= require fomantic-ui
$(document).on('turbolinks:load', function() {

  // Override the default dimmer page behaviour for Sidebar 
  $('.sidebar')
    .sidebar({
      dimPage: false,
      closable: false,
    })
    .sidebar('attach events', '#vk-header-icon-a')
    .sidebar('setting', 'transition', 'push');

  // Initialize the table
  $('#example').DataTable({
    "stripeClasses": ['odd-row', 'even-row']
  });

});