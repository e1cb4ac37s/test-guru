function fillProgress() {
  const progress = document.querySelector('.test-passage-progress')
  const slider = document.querySelector('.test-passage-progress .slider')
  const textBlock = document.querySelector('.test-passage-progress .text')

  const current = +progress.dataset.currentQuestion - 1
  const total = +progress.dataset.questionsAmount
  const percentage = Math.round((current / total) * 100)

  textBlock.textContent = `${percentage}%`
  slider.setAttribute('style', `width: ${percentage}%`)
}

document.addEventListener('turbolinks:load', function() {
  const progress = document.querySelector('.test-passage-progress')

  if (progress) { window.addEventListener('load', fillProgress) }
})
