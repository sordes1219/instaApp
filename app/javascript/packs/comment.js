import $ from 'jquery'
import axios from 'modules/axios'

document.addEventListener('DOMContentLoaded' , () => {
  $('#post-new-comment').on('click', () => {
    const description = $('#comment_content').val()
    const articleId = $('#post-new-comment').attr('article_id')
    if(description){
      axios.post(`/articles/${articleId}/comments`,{
        description: description
      }).then((response) => {
        location.reload()
      })
    } else {
      alert('コメントが入力されていません')
    }
  })

})