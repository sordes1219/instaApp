import $ from 'jquery'
import axios from 'modules/axios'

const checkLength = (description) => {
  if(description.length > 140 || description.length < 2){
    alert('コメントは２文字以上、140文字以下にしてください')
    return false
  }
}

document.addEventListener('DOMContentLoaded' , () => {
  $('#post-new-comment').on('click', () => {
    const description = $('#comment_content').val()
    const articleId = $('#post-new-comment').attr('article_id')

    if(checkLength(description)){
      axios.post(`/articles/${articleId}/comments`,{
        description: description
      }).then((response) => {
        location.reload()
      })
    }
  })

})