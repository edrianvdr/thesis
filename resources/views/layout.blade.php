<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $settings->app_name }}</title>

    {{-- Tailwind CSS --}}
    <link href="{{ asset('css/styles.css') }}" rel="stylesheet">
    {{-- Flowbite --}}
    <script src="{{ asset('/js/flowbite.min.js') }}"></script>

    <style>
    .bg-blue-800 {
        background-color: #1d4ed8;
    }

    .text-blue-800 {
        color: #1d4ed8;
    }

    .border-blue-800 {
        border-color: #1d4ed8;
    }

    .divide-blue-800 {
        border-color: #1d4ed8;
    }

    .divide-blue-800 > :not([hidden]) ~ :not([hidden]) {
        border-color: #1d4ed8;
    }

    /* Ring Color */
    .ring-blue-800 {
        --tw-ring-color: #1d4ed8;
    }

    /* Ring-offset Color */
    .ring-offset-blue-800 {
        --tw-ring-offset-color: #1d4ed8;
    }

    </style>
</head>
<body>

    @yield('content')

</body>
</html>
