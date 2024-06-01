<main class="max-w-screen-lg mx-auto my-4">
    <h1 class="text-3xl font-bold my-4">Create an Account</h1>

    @if ($errors->any())
    <divv class="alert alert-danger  mb-4">
        <ul>
            @foreach ($errors->all() as $error)
                <li class="text-red-600 text-base" role="alert" aria-live="polite">{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

    @include('components.sign-up.user-information')

    <x-button-primary-livewire value="Sign Up" wireClick="sign_up" />

    <a
        href="/"
        class="text-blue-800 py-2 px-4 hover:underline focus:underline rounded focus:outline-none"
        >
        Already have an account?
    </a>
</main>
