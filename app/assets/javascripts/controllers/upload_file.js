import { Controller } from "stimulus";

export default class extends Controller {
    handleChange(event) {
      const fileInput = event.target;
      if (fileInput.files && fileInput.files[0]) {
        const reader = new FileReader();
        reader.onload = (e) => {
          const avatarImage = document.getElementById("avatarUser");
          avatarImage.src = e.target.result;
        };
        reader.readAsDataURL(fileInput.files[0]);
      }
    }
}