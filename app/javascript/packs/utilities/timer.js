const secondsToTime = (seconds) => {
  if (seconds <= 0) return "00:00:00"

  let rem = seconds

  let sec = rem % 60
  rem -= sec
  rem /= 60
  let min = rem % 60
  rem -= min
  rem /= 60
  let h = rem

  return `${h || '00'}:${min || '00'}:${sec || '00'}`
}

const showTimer = timer => {
  const timeLeft = timer.dataset.timeLeft
  let diff = 0;
  const interval = setInterval(() => {
    timer.innerHTML = secondsToTime(timeLeft - diff)
    if (timeLeft - diff <= 0) document.querySelector('form').submit()
    diff += 1
  }, 1000)
}

document.addEventListener('turbolinks:load', function() {
  const timer = document.querySelector('#time-left')
  if (timer) showTimer(timer)
})
