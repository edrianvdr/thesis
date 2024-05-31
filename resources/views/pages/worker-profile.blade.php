@extends('layout')

@section('content')

@include('partials.home-navbar')

<livewire:view-worker-profile :userId="$userId" :workerProfileId="$workerProfileId" />

@include('partials.footer')

@endsection


