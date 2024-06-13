import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  validate(event) {
    const title = this.titleTarget.value.trim();
   
    console.log("dasda");
    if (title === "") {
      alert("El campo título no puede estar vacío.");
      event.preventDefault();
      return false;
    }
    return true;
  }

  toggleStyle(event) {
    const checkbox = event.target;
    const titleInput = checkbox.closest("form").querySelector(".task-title");
    
    if (titleInput) {
      if (checkbox.checked) {
        titleInput.classList.add("completed");
        titleInput.readOnly = true;
      } else {
        titleInput.classList.remove("completed");
        titleInput.readOnly = false;
      }
    }

    this.save(); // Llama a la función save después de cambiar el estilo
  }

  save() {

    const form = event.target.closest("form");

    fetch(form.action, {
      method: form.method,
      headers: {"Accept": "text/vnd.turbo-stream.html" },
      body: new FormData(form)
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
    .catch(error => console.error('Error:', error))
  }


}
