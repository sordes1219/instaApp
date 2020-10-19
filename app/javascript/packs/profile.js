import $ from 'jquery'

document.addEventListener('DOMContentLoaded', () => {
  
  $('#display-profile-avatar').on('click', () => {
      $('#profile-avatar').click()
      $('#profile-post-form').submit()    
  } )

  $('#profile-post-form').on('submit', () => {
    const files = $('#profile-avatar')[0].files
    if(files.length === 0){
      alert('ファイルが選択されていません')
      return false
    } 
   })

})

