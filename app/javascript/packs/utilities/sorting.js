const compareRowsAsc = (row1, row2) => {
  const title1 = row1.querySelector('td').textContent
  const title2 = row2.querySelector('td').textContent

  return title1 < title2 ? -1 : title1 > title2 ? 1 : 0
}

const compareRowsDesc = (row1, row2) => {
  const title1 = row1.querySelector('td').textContent
  const title2 = row2.querySelector('td').textContent

  return title1 > title2 ? -1 : title1 < title2 ? 1 : 0
}

function sortRowsByTitle() {
  const table = document.querySelector('table')
  const rows = table.querySelectorAll('tr')
  const rowsArray = []

  for (let i = 1; i < rows.length; i++) {
    rowsArray.push(rows[i])
  }

  const arrowUp = this.querySelector('.octicon-arrow-up')
  const arrowDown = this.querySelector('.octicon-arrow-down')

  if (arrowUp.classList.contains('hide')) {
    rowsArray.sort(compareRowsAsc)
    arrowUp.classList.remove('hide')
    arrowDown.classList.add('hide')
  } else {
    rowsArray.sort(compareRowsDesc)
    arrowUp.classList.add('hide')
    arrowDown.classList.remove('hide')
  }

  const sortedTable = document.createElement('table')
  sortedTable.className = 'table table-bordered'
  sortedTable.appendChild(rows[0])
  for (let row of rowsArray) { sortedTable.appendChild(row) }
  table.parentNode.replaceChild(sortedTable, table)
}

document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-title')
  control?.addEventListener('click', sortRowsByTitle)
})
