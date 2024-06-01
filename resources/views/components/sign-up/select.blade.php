<div>
    <label for="{{ $name }}">{{ $label }}</label>
    <select
        name="{{ $name }}"
        id="{{ $name }}"
        aria-label="{{ $label }}"
        @if ($required) aria-required="true" required @endif
        class="rounded w-full py-2 px-3"
        wire:model="{{ $name }}"
        wire:change="{{ $wireChange }}"
    >
        {{ $slot }}
    </select>

    @if ($required)
        <div class="text-red-600 text-base" id="{{ $name }}-error" role="alert" aria-live="polite">
            @error($name) {{ $message }} @enderror
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const select = document.getElementById('{{ $name }}');
                const error = document.getElementById('{{ $name }}-error');

                select.addEventListener('change', function () {
                    if (select.value === '') {
                        error.textContent = '{{ $label }} is required';
                    } else {
                        error.textContent = '';
                    }
                });

                select.addEventListener('blur', function () {
                    if (select.value === '') {
                        error.textContent = '{{ $label }} is required';
                    }
                });
            });
        </script>
    @endif
</div>
