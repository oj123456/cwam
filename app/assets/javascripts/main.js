spices_rack = null;
$(document).ready(function () {
  if($('#slider_cans')) {
    spices_rack = $('#slider_cans').slick({
      dots: false,
      infinite: true,
      speed: 300,
      slidesToShow: 9,
      slidesToScroll: 1,
      prevArrow: $('#slider_cans_previous'),
      nextArrow: $('#slider_cans_next'),
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 4,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
    });

    $('#slider_cans').on('init reInit afterChange', function (event, slick, currentSlide, nextSlide) {
      //currentSlide is undefined on init -- set it to 0 in this case (currentSlide is 0 based)
      var i = (currentSlide ? currentSlide : 0) ;
      getSpiceData(i);
    });

    getSpiceData(0);
  }


  $("#projects-slider .entry img").on("click", function () {
    var parent = $(this).closest(".entry");
    if (parent.hasClass("highlight")) {
      return;
    }
    $("#projects-slider .entry").removeClass("highlight");
    parent.addClass("highlight");
    console.log("ID:" + parent.attr("data-id"));
  });

  /*************************************************************/
  $('#slider_events').slick({
    dots: false,
    infinite: true,
    speed: 300,
    slidesToShow: 2,
    slidesToScroll: 2,
    prevArrow: $('#slider_events_previous'),
    nextArrow: $('#slider_events_next'),
    responsive: [
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });
  $('#slider_win').slick({
    dots: false,
    infinite: true,
    speed: 300,
    slidesToShow: 2,
    slidesToScroll: 2,
    prevArrow: $('#slider_win_previous'),
    nextArrow: $('#slider_win_next'),
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });
  $('#slider_interview').slick({
    dots: false,
    infinite: true,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 2,
    prevArrow: $('#slider_interview_previous'),
    nextArrow: $('#slider_interview_next'),
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });
  $('#slider_press').slick({
    dots: false,
    infinite: true,
    speed: 300,
    slidesToShow: 3,
    slidesToScroll: 1,
    prevArrow: $('#slider_press_previous'),
    nextArrow: $('#slider_press_next'),
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });

  $('#slider_iftar').slick({
    dots: false,
    infinite: true,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 2,
    prevArrow: $('#slider_iftar_previous'),
    nextArrow: $('#slider_iftar_next'),
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });

  $('#slider_dinner_2').slick({
    dots: false,
    infinite: true,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 2,
    prevArrow: $('#slider_dinner_2_previous'),
    nextArrow: $('#slider_dinner_2_next'),
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });

  $('#slider_dinner_party').slick({
    dots: false,
    infinite: true,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 2,
    prevArrow: $('#slider_dinner_party_previous'),
    nextArrow: $('#slider_dinner_party_next'),
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });


  $("#menu_open").on("click", function () {
    var el = $("#top_menu"),
      curHeight = el.height(),
      autoHeight = el.css('height', 'auto').height();
    el.height(curHeight).animate({height: autoHeight}, 500);
  });
  $("#menu_close").on("click", function () {
    $("#top_menu").animate({height: 0}, 500);
  });

  $("[is-add-recipe=1]").on("click",function(){
    addToRecipeBox($(this).data("id"));
  });

  $("[is-recipe-delete=1]").on("click", function(){
    deleteFromRecipeBox($(this).data("id"));
  });

  $("[is-event-description=1]").each(function(){
    $(this).readmore({
      speed: 200,
      moreLink: '<a class="read-more" href="#">+Read More</a>',
      lessLink: '<a class="read-more" href="#">-Read less</a>',
      afterToggle: function(trigger, element, expanded) {
        if(! expanded) { // The "Close" link was clicked
          $('html, body').animate( { scrollTop: element.parent().offset().top }, {duration: 200 } );
        }
      }
    });
  });

  $("[is-user-review=1]").on("click",function(){
    addGrowl("Submitting your Recipe review !", "warning");
    var review = $(this).data("id");
    var recipe_id = $(this).data("recipe-id");
    $("[is-user-review=1]").each(function(){
      $(this).removeClass("empty");
      $(this).removeClass("full");
      $(this).addClass("empty");
    });
    for(var i=0; i<review; i++){
      $("[is-user-review=1][data-id=" + (i+1) + "]").each(function(){
        $(this).addClass("full");
        $(this).removeClass("empty");
      });
    }
    $.ajax({
      type: "POST",
      url: "/users/review_recipe",
      data:{recipe_id:recipe_id, rating:review},
      dataType: "json",
      success: function(data){
        if (data.code == 1){
          addGrowl(data.message, "success");
        }else{
          addGrowl(data.message, "danger");
        }
      }
    });
  })



  if ($("[is-competition=1]").length > 0){
    var max_height = 0;
    $("[is-competition=1]").each(function(){
      if ($(this).height() > max_height)
        max_height = $(this).height()
    });
    $("[is-competition=1]").each(function(){
      $(this).height(max_height);
    });
  }

  $("[is-newsletter=1]").on("click", function(){
    var currentStatus = $("#newsletter").val();
    var image = "";
    if(currentStatus == "0"){
      currentStatus = "1";
      image = $(this).data("img-selected");
    }else{
      currentStatus = "0";
      image = $(this).data("img-notselected");
    }
    $("#newsletter").val(currentStatus);
    $(this).css("background-image", 'url(' + image + ')');
  });

  $("#submit_contact").on("click", function(){
    event.preventDefault();
    addGrowl("Submitting your message !", "warning");
    $.ajax({
      type: "POST",
      url: "/contact",
      data:$("#contact_form").serialize(),
      success: function(data){
        if (data.code == 1){
          $("#contact_form").find("input[type=text], input[type=email], textarea").val("");
          addGrowl(data.message, "success");
        }else{
          addGrowl(data.message, "danger");
        }
      }
    });
  });
 $("#submit_newsletter").on("click", function(){
    event.preventDefault();
    addGrowl("Submitting your request !", "warning");
    $.ajax({
      type: "POST",
      url: "/newsletter",
      data:{email: $("#newsletter_email").val() },
      success: function(data){
        if (data.code == 1){
          $("#newsletter_email").val("");
          addGrowl(data.message, "success");
        }else{
          addGrowl(data.message, "danger");
        }
      }
    });
  });

  $("[goto-newsletter=1]").on("click", function() {
    $("html, body").animate({ scrollTop: $('.footer').offset().top }, 1000);
    $("#newsletter_email").focus();
  });
});

function reloadPage(){
  location.reload();
}

function addGrowl(message, type){
  $.notify({
    message:message,
    icon: 'glyphicon glyphicon-warning-sign'
  },{
    timer: 1500,
    delay: 3000,
    type:type
  });
}

function getSpiceData(slider_id) {
  currentSlideData = $($("[data-slick-index=" + slider_id +"]")[0]);
  var isFresh = currentSlideData.attr("data-fresh");
  $("#selected_spice_image").attr("src", currentSlideData.attr("data-image"));
  $("#selected_spice_url").attr("href", currentSlideData.attr("data-url"));
  $("#selected_spice_title").html(currentSlideData.attr("data-name"));
  $("#selected_spice_description").html(currentSlideData.attr("data-description"));
  if (isFresh){
    $("#selected_fresh").css("display", "block");
  }else{
    $("#selected_fresh").css("display", "none");
  }
}

function addToRecipeBox(recipe_id){
  addGrowl("Adding recipe to Recipe box !", "warning");
  $.ajax({
    type: "POST",
    url: "/users/add_to_recipe_box",
    data:{recipe_id:recipe_id},
    dataType: "json",
    success: function(data){
      if (data.code == 1){
        addGrowl(data.message, "success");
      }else{
        addGrowl(data.message, "danger");
      }
    }
  });
}

function deleteFromRecipeBox(recipe_id){
  addGrowl("Deleting recipe from Recipe box !", "warning");
  $.ajax({
    type: "DELETE",
    url: "/users/delete_from_recipe_box",
    data:{recipe_id:recipe_id},
    dataType: "json",
    success: function(data){
      if(data.code == 1) { //deleted
        $("[is-recipe=1][data-id=" + recipe_id + "]").remove();
        addGrowl(data.message, "success");
      }else{
        addGrowl(data.message, "danger");
      }
    }
  });
}
