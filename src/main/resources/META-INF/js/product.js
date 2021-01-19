

//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () { scrollFunction() };

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    try {
        window.scrollTo({
            top: 0,
            left: 0,
            behavior: "smooth",
        })
    }
    catch (err) {
        window.scrollTo(0, 0);
    }
}

// 
$('.owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    stagePadding: 30,
    responsiveClass: true,
    nav: true,
    navText: ['<i class="fa fa-angle-left fa-3x" aria-hidden="true"></i>', '<i class="fa fa-angle-right fa-3x" aria-hidden="true"></i>'],
    responsive: {
        0: {
            items: 1,
            nav: true
        },
        600: {
            items: 2,
            nav: true
        },
        1000: {
            items: 5,
            nav: true,
            loop: true
        }
    }
})




