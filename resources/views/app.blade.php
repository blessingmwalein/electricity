<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title inertia>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="shortcut icon"
        href="https://templates.iqonic.design/product/qompac-ui-tailwind/tailwind/dist/assets/images/favicon.ico" />

    <!-- SwiperSlider css -->
    <link rel="stylesheet" href="/assets/vendor/swiper-slider/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/assets/vendor/swiper-slider/swiper-bundle.min.css" />

    <!-- SweetAlert2 css -->
    <link rel="stylesheet" href="/assets/vendor/sweetalert2/dist/sweetalert2.min.css" />

    <!-- Uppy css -->
    <link rel="stylesheet" href="/assets/vendor/uppy/uppy.min.css" />

    <!-- QuillEditor css -->
    <link rel="stylesheet" href="/assets/vendor/quill/quill.snow.css" />

    <!-- Flatpickr css -->
    <link rel="stylesheet" href="/assets/vendor/flatpickr/dist/flatpickr.min.css" />


    <!-- Choisejs css -->
    <link rel="stylesheet" href="/assets/vendor/choicejs/style/choices.min.css">

    <link rel="stylesheet" href="/assets/vendor/sheperd/dist/css/sheperd.css">


    <link rel="stylesheet" href="/assets/css/core/libs.min.css">
    <link rel="stylesheet" href="/assets/css/tailwinde209.css?v=1.0.0">
    <link rel="stylesheet" href="/assets/css/responsivee209.css?v=1.0.0">
    <!-- Scripts -->
    @routes
    @vite(['resources/js/app.js', "resources/js/Pages/{$page['component']}.vue"])
    @inertiaHead
</head>

<body class="overflow-x-hidden text-body bg-body dark:bg-dark-bg">
    @inertia

    <script src="/assets/js/alpine/sweet-alert.js"></script>
    <script src="/assets/js/alpine/swiper-slider.js"></script>


    <script src="/assets/js/setting-panel.js"></script>
    <!-- Library Bundle Script -->
    <script src="/assets/js/core/libs.min.js"></script>

    <!-- External Library Bundle Script -->
    <script src="/assets/js/core/external.min.js"></script>

    <!-- mapchart Script -->
    <script src="/assets/js/charts/vectore-chart.js"></script>

    <!-- fslightbox Script -->
    <script src="/assets/js/plugins/fslightbox.js"></script>

    <!-- App Script -->
    <script src="/assets/js/qompac-ui.js"></script>

    <!-- Alpine Js-->
    <script src="/assets/js/plugins/alpine.js" defer></script>

    <!-- Dashboard Chart & Slider -->
    <script src="/assets/js/charts/dashboard.js" defer></script>


    <!-- Choisejs Script -->
    <script src="/assets/vendor/choicejs/script/choices.min.js"></script>
    <script src="/assets/vendor/choicejs/script/choice.js" defer></script>

    <!-- Tour plugin Start -->
    <script src="/assets/vendor/sheperd/dist/js/sheperd.min.js"></script>
    <script src="/assets/js/plugins/tour.js" defer></script>

    <!-- Slider-tab Script -->
    <script src="/assets/js/plugins/slider-tabs.js"></script>

</body>

</html>
