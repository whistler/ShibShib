# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      userPage = $('.userPage').attr('type')
      if !userPage && url && $(window).scrollTop() > $(document).height() - $(window).height() - 550
        $('.pagination').text("Fetching more posts...")
        $.getScript(url)
    $(window).scroll()
