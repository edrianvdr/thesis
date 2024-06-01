<div>
    @include('partials.home-navbar')

    <main class="max-w-screen-lg mx-auto my-4">
        <h1 class="text-3xl font-bold my-4">Become a Worker</h1>

        @if ($errors->any())
            <div class="alert alert-danger  mb-4">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li class="text-red-600 text-base" role="alert" aria-live="polite">{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        @include('components.sign-up.worker-information')

        <x-button-primary-livewire value="Sign Up as a Worker" wireClick="sign_up_as_a_worker" />
    </main>
</div>
