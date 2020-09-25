function inlineEditHandler(e) {
  e.preventDefault()

  const testId = this.dataset.testId
  formHandler(testId)
}

function formHandler(testId) {
  const link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
  const title = document.querySelector(`.test-title[data-test-id="${testId}"]`)
  const form = document.querySelector(`.form-inline[data-test-id="${testId}"]`)

  if (form.classList.contains('hide')) {
    link.textContent = 'Cancel'
    title.classList.add('hide')
    form.classList.remove('hide')
  } else {
    link.textContent = 'Edit'
    title.classList.remove('hide')
    form.classList.add('hide')
  }
}

document.addEventListener('turbolinks:load', function() {
  const controls = document.querySelectorAll('.form-inline-link')

  if (!controls.length) return

  for (let control of controls) {
    control.addEventListener('click', inlineEditHandler)
  }

  const errors = document.querySelector('.resource-errors')
  if (errors) {
    const resourceId = errors.dataset.resourceId
    formHandler(resourceId)
  }
})
