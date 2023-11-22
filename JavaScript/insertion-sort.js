let arr = [8, 7, 5, 9, 1, 6, 2, 4, 3]

insertionSort(arr)

function insertionSort(arr) {
  for (let i = 1; i < arr.length; i++) {
    let current = arr[i]

    let j = i - 1

    while (j > -1 && current < arr[j]) {
      arr[j + 1] = arr[j]
      j--
    }
    arr[j + 1] = current
  }
  return arr
}
