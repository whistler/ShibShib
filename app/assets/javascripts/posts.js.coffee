# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      img = $("<img />").attr('src', '/assets/loading.gif')
      #userPage = $('.userPage').attr('type')
      trigger = false
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 550
        $('.pagination').text("")
        $('.pagination').append(img);
        $.getScript(url)
    $(window).scroll()
