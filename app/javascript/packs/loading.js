let isLoading = false;
$(document).on('turbolinks:load', function() {
    $(window).scroll(function() {
        if (($(window).scrollTop() + $(document).height() >= $('footer').offset().top) && !isLoading) {
            let url = $('.pagination > .next > a').attr('href');
            isLoading = true;
            $('#loading').css('display', 'block');
            if (url) {
                setTimeout(function() {
                    $.ajax({
                        url: url,
                        type: 'GET',
                        dataType: 'html',
                        success: function(data) {
                            $('#loading-wrapper').append($(data).find('#loading-wrapper').html());

                            if(String($(data).find('#loading-wrapper').html()) == "undefined" || $(data).find('#loading-wrapper').html().length == 1){
                                $('#loading').css('display', 'none');
                            } else {
                                pageNumber = parseInt(url.split("=")[1]);
                                nextPageNumber = String(pageNumber + 1);
                                url = $('.pagination > .next > a').attr('href');
                                url = url.replace(/page=(\d+)/, 'page=' + nextPageNumber);
                                $('.pagination > .next > a').attr('href', url);
                                console.log(url);
                                $('#loading').css('display', 'none');
                                isLoading = false;
                            }
                        }
                    });
                }, 2000);
            } else {
                $('#loading').css('display', 'none');
                isLoading = false;
            }
        }
    });
});