function pih(e) {
  const confirmation = document.querySelector('#password-confirmation')
  handle(this, confirmation)
}

function pcih(e) {
  const password = document.querySelector('#password-field')
  handle(password, this)
}

function handle(el, target) {
  if (target.value && target.value !== el.value) {
    target.classList.add('error')
    target.classList.remove('success')

    el.classList.add('error')
    el.classList.remove('success')
  } else if (target.value) {
    target.classList.add('success')
    target.classList.remove('error')

    el.classList.add('success')
    el.classList.remove('error')
  } else if (!target.value) {
    target.className = ''
    el.className = ''
  }
}

document.addEventListener('turbolinks:load', function() {
  const passwordConfirmationInput = document.querySelector('#password-confirmation')
  const passwordInput = document.querySelector('#password-field')
  if (passwordInput && passwordConfirmationInput) {
    passwordInput.addEventListener('input', pih)
    passwordConfirmationInput.addEventListener('input', pcih)
  }
})
