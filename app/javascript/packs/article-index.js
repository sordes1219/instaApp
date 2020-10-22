import $ from 'jquery'
import axios from 'modules/axios'

document.addEventListener('DOMContentLoaded', () => {
  axios.get(`/api/picture`)
    .then((response) => {
      const length = response.data.length
      console.log(typeof(length))
      length.forEach((value,index) => {
        console.log(value,index)
        if(value === 1){
          $(`#grid-item-${index + 1}-0`).addClass('ptn2')
          $(`#grid-item-${index + 1}-1`).addClass('hidden')
          $(`#grid-item-${index + 1}-2`).addClass('hidden')
        } else if(value === 2){
          $(`#grid-item-${index + 1}-0`).addClass('ptn1')
          $(`#grid-item-${index + 1}-1`).addClass('ptn1')
          $(`#grid-item-${index + 1}-2`).addClass('hidden')
        } else {
          $(`#grid-item-${index + 1}-0`).addClass('ptn1')
        }
      })
    })

})

