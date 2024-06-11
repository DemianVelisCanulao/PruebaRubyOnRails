// app/javascript/controllers/tasks_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  save() {
    console.log("Guardando tarea...") // Verifica si se activa correctamente al desenfocar el campo
    const form = this.element

    fetch(form.action, {
      method: form.method,
      headers: { "Content-Type": "application/json", "Accept": "text/vnd.turbo-stream.html" },
      body: new FormData(form)
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
    .catch(error => console.error('Error:', error))
  }
}
