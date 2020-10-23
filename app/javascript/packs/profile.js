import $ from 'jquery'

const checkFileExist = () => {
  $('#profile-post-form').on('submit', () => {
    const files = $('#profile-avatar')[0].files
    if(files.length === 0){
      alert('ファイルが選択されていません')
      return false
    } 
   })
}

document.addEventListener('DOMContentLoaded', () => {
  
  checkFileExist()

  $('#display-profile-avatar').on('click', () => {
      $('#profile-avatar').click()
      $('#profile-post-form').submit()    
  } )
  
})

