import $ from 'jquery'
import axios from 'modules/axios'

document.addEventListener('DOMContentLoaded', (event) => {
  
  const url = event.path[0].URL
  if(url.indexOf('articles') > 0){
    $('#switch-left').addClass('active')
  } else if(url.indexOf('timelines') > 0) {
    $('#switch-right').addClass('active')
  }

  axios.get(`/api/picture`)
    .then((response) => {
      const pictures = response.data.pictures
      pictures.forEach((item) => {
        if(item.picture_num === 1){
          $(`#grid-item-${item.article_id}-0`).addClass('ptn2')
          $(`#grid-item-${item.article_id}-1`).addClass('hidden')
          $(`#grid-item-${item.article_id}-2`).addClass('hidden')
        } else if(item.picture_num === 2){
          $(`#grid-item-${item.article_id}-0`).addClass('ptn1')
          $(`#grid-item-${item.article_id}-1`).addClass('ptn1')
          $(`#grid-item-${item.article_id}-2`).addClass('hidden')
        } else {
          $(`#grid-item-${item.article_id}-0`).addClass('ptn1')
        }
        
        $(`#heart-${item.article_id}`).on('click', (event) => {
          const articleId = $(event.target)[0].getAttribute('article_id')
          const cls = $(event.target)[0].getAttribute('class')
          if(!cls.includes('active') ){
            axios.post(`/api/articles/${articleId}/like`)
              .then((response) => {
                if(response.data.status === 'ok'){
                  $(`#heart-${articleId}`).removeClass('far').addClass('fas active')
                }
              })
              .catch((e) => {
                window.alert('Error')
                console.log(e)
              })
          } else {
            axios.delete(`/api/articles/${articleId}/like`)
              .then((response) => {
                if(response.data.status === 'ok'){
                  $(`#heart-${articleId}`).removeClass('fas active').addClass('far')
                }
              })
              .catch((e) => {
                window.alert('Error')
                console.log(e)
              })
          }
            
        })

      })
    })

    axios.get(`/api/likes`)
    .then((response) => {
      const articleIds = response.data
      articleIds.forEach((item) => {
        $(`#heart-${item.article_id}`).removeClass('far').addClass('fas active')
      })
    })


})

