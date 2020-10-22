import $ from 'jquery'

const checkFileExist = () => {
  $('#article-post-form').on('submit', () => {
    const files = $('#article_pictures')[0].files
    if(files.length === 0){
      alert('ファイルが選択されていません')
      return false
    } 
   })
}

document.addEventListener('DOMContentLoaded',() => {

  checkFileExist()

  $('#article-post-btn').on('click', () => {
    $('#article-post-form').submit()
  })

})