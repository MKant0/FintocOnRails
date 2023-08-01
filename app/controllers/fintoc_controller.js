import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log("Fintoc controller connected");
    this.loadFintoc()
  }

  loadFintoc() {
    const script = document.createElement('script')
    script.src = 'https://js.fintoc.com/v1/'
    script.onerror = () => console.error("Failed to load Fintoc script")
    script.onload = () => this.initFintoc()
    document.head.appendChild(script)
  }

  initFintoc() {
    console.log("Fintoc script loaded");
    const publicKey = this.element.dataset.fintocPublicKey
    const widgetToken = this.element.dataset.fintocWidgetToken

    console.log("Public key: ", publicKey);
    console.log("Widget token: ", widgetToken);

    try {
      this.createFintocWidget(publicKey, widgetToken);
    } catch (error) {
      console.error("Failed to create Fintoc widget", error);
    }
  }

  createFintocWidget(publicKey, widgetToken) {
    const widget = Fintoc.create({
      publicKey: publicKey,
      widgetToken: widgetToken,
      onSuccess: this.handleSuccess,
      // ... other options
    });
    widget.open();
  }

  handleSuccess(linkIntent) {
    const exchangeToken = linkIntent.exchangeToken;
    // Aquí puedes hacer lo que necesites con el exchangeToken
  }
}
