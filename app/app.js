const statusButton = document.getElementById("statusButton");
const statusMessage = document.getElementById("statusMessage");

statusButton.addEventListener("click", () => {
  statusMessage.textContent = "Platform status: healthy. Security gates are active.";
});
