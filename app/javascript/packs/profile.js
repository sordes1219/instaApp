import $ from 'jquery'

const fileCheck = () => {
  $('#profile-post-form').on('submit', () => {
    const files = $('#profile-avatar')[0].files
    if(files.length === 0){
      alert('ファイルが選択されていません')
      return false
    } 
   })
}

document.addEventListener('DOMContentLoaded', () => {
  
  fileCheck()

  $('#display-profile-avatar').on('click', () => {
      $('#profile-avatar').click()
      $('#profile-post-form').submit()    
  } )
  
})

