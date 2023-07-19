$(document).ready(function() {
    $('#image-upload').change(function() {
      var input = this;
      var reader = new FileReader();
  
      reader.onload = function(e) {
        $('#image-preview').attr('src', e.target.result);
      };
  
      reader.readAsDataURL(input.files[0]);
    });
  });
  

  document.addEventListener('DOMContentLoaded', function() {
    const zoomableImage = document.getElementById('zoomable-image');
    const photoDetails = document.querySelector('.photo-details');
  
    zoomableImage.addEventListener('click', function() {
      const zoomedImgSrc = this.getAttribute('src');
      const name = photoDetails.querySelector('h2').textContent;
      const des = photoDetails.querySelector('p').textContent;
  
      const zoomedImg = document.createElement('div');
      zoomedImg.classList.add('zoomed-image');
      zoomedImg.innerHTML = `
        <img src="${zoomedImgSrc}">
        <div class="photo-details">
          <h2>${name}</h2>
          <p>${des}</p>
        </div>
      `;
  
      document.body.appendChild(zoomedImg);
  
      zoomedImg.addEventListener('click', function() {
        document.body.removeChild(this);
      });
    });
  });
  