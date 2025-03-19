
const container = document.getElementById("container")
const mainMenu = document.getElementById("mainMenu")
const shopMenu = document.getElementById("shopMenu")
const ownedWeaponList = document.getElementById("ownedWeaponList")
const shopWeaponList = document.getElementById("shopWeaponList")
const closeButton = document.getElementById("closeButton")
const rotateLeft = document.getElementById("rotateLeft")
const rotateRight = document.getElementById("rotateRight")
const menuItems = document.querySelectorAll(".menu-item")
const skinItemTemplate = document.getElementById("skinItemTemplate")
const popularItemTemplate = document.getElementById("popularItemTemplate")
const notificationsContainer = document.getElementById("notifications")
const previewContainer = document.querySelector(".preview-container")
const previewInfo = document.querySelector(".preview-info")

let weapons = []
let activeSkins = {}
let currentMenu = "main"
let currentPreview = null

window.addEventListener("message", (event) => {
  const data = event.data

  switch (data.action) {
    case "open":
      weapons = data.weapons || []
      activeSkins = data.activeSkins || {}
      openMenu(data.menu || "main")
      if (data.popularSkins && data.popularSkins.length > 0) {
        renderPopularSkins(data.popularSkins)
      }
      break

    case "close":
      closeMenu()
      break

    case "updateWeapons":
      weapons = data.weapons || []
      renderWeapons()
      break

    case "changeMenu":
      openMenu(data.menu || "main")
      break

    case "notification":
      showNotification(data.message, data.type || "info")
      break
  }
})

function openMenu(menu) {
  container.classList.remove("hidden")
  currentMenu = menu

  menuItems.forEach((item) => {
    if (item.dataset.menu === menu) {
      item.classList.add("active")
    } else {
      item.classList.remove("active")
    }
  })


  if (menu === "main") {
    mainMenu.classList.remove("hidden")
    shopMenu.classList.add("hidden")
  } else if (menu === "shop") {
    mainMenu.classList.add("hidden")
    shopMenu.classList.remove("hidden")
  }

  renderWeapons()


  clearPreview()
}


function closeMenu() {
  container.classList.add("hidden")

  clearPreview()

  sendData("close", {})
    .then(() => {
      console.log("Menu closed successfully")
    })
    .catch((error) => {
      console.error("Error closing menu:", error)
    })
}


function renderPopularSkins(popularSkins) {
  const popularList = document.querySelector(".popular-list")
  if (!popularList) return

  popularList.innerHTML = ""


  popularSkins.forEach((popularSkin) => {
    const weapon = weapons.find((w) => w.id === popularSkin.skin_id)
    if (!weapon) return

    const item = popularItemTemplate.content.cloneNode(true)
    const popularItem = item.querySelector(".popular-item")


    popularItem.querySelector("img").src = weapon.image 
    popularItem.querySelector("h4").textContent = weapon.name


    popularItem.addEventListener("click", () => {
      updatePreviewInfo(weapon)
    })

    popularList.appendChild(popularItem)
  })
}

function renderWeapons() {
  if (currentMenu === "main") {
    renderOwnedWeapons()
  } else if (currentMenu === "shop") {
    renderShopWeapons()
  }
}


function renderOwnedWeapons() {
  ownedWeaponList.innerHTML = ""

  const ownedWeapons = weapons.filter((weapon) => weapon.owned)

  if (ownedWeapons.length === 0) {
    const emptyMessage = document.createElement("div")
    emptyMessage.className = "empty-message"
    emptyMessage.textContent = "Você não possui nenhuma skin ainda."
    ownedWeaponList.appendChild(emptyMessage)
    return
  }

  ownedWeapons.forEach((weapon) => {
    const item = createWeaponItem(weapon)
    const actionBtn = item.querySelector(".action-btn")

    actionBtn.textContent = "Equipar"
    actionBtn.className = "action-btn owned"


    if (activeSkins[weapon.weapon] === weapon.id) {
      actionBtn.textContent = "Equipada"
      actionBtn.disabled = true
    }

    actionBtn.addEventListener("click", () => {
      sendData("equipSkin", { skinId: weapon.id })
      showNotification("Skin equipada com sucesso!", "success")


      activeSkins[weapon.weapon] = weapon.id
      renderWeapons()
    })

    ownedWeaponList.appendChild(item)
  })
}

function renderShopWeapons() {
  shopWeaponList.innerHTML = ""

  weapons.forEach((weapon) => {
    const item = createWeaponItem(weapon)
    const actionBtn = item.querySelector(".action-btn")

    if (weapon.owned) {
      actionBtn.textContent = "Adquirida"
      actionBtn.className = "action-btn owned"
      actionBtn.disabled = true
    } else {
      actionBtn.textContent = `Comprar $${weapon.price}`

      actionBtn.addEventListener("click", () => {
        showConfirmationModal("Confirmar compra", `Deseja comprar ${weapon.name} por $${weapon.price}?`, () => {
          sendData("buySkin", { skinId: weapon.id }).then((response) => {
            if (response.success) {
              showNotification("Skin comprada com sucesso!", "success")
            } else {
              showNotification("Você não tem gemas suficientes!", "error")
            }
          })
        })
      })
    }

    shopWeaponList.appendChild(item)
  })
}

function createWeaponItem(weapon) {
  const template = skinItemTemplate.content.cloneNode(true)
  const item = template.querySelector(".weapon-item")


  item.querySelector(".weapon-image").src = weapon.image 
  item.querySelector(".weapon-name").textContent = weapon.name
  item.querySelector(".weapon-description").textContent = weapon.description || `Para ${weapon.weaponName}`
  item.querySelector(".weapon-price").textContent = `$${weapon.price}`



  return item
}

function updatePreviewInfo(weapon) {
  if (!previewInfo) return

  currentPreview = weapon

  clearPreview()

  const previewImage = document.createElement("img")
  previewImage.src = weapon.image 
  previewImage.className = "preview-image"
  previewContainer.appendChild(previewImage)
  previewInfo.querySelector("h3").textContent = weapon.name
  previewInfo.querySelector("p").textContent = weapon.description || `Para ${weapon.weaponName}`
  previewInfo.classList.remove("hidden")
}

function clearPreview() {
  const existingImages = previewContainer.querySelectorAll(".preview-image")
  existingImages.forEach((img) => img.remove())

  if (previewInfo) {
    previewInfo.classList.add("hidden")
  }

  currentPreview = null
}

function showNotification(message, type = "info") {
  const notification = document.createElement("div")
  notification.className = `notification ${type}`
  notification.innerHTML = `
        <span class="close">&times;</span>
        <p>${message}</p>
    `

  notificationsContainer.appendChild(notification)

  setTimeout(() => {
    notification.style.animation = "slideOut 0.3s ease-in forwards"
    setTimeout(() => {
      notificationsContainer.removeChild(notification)
    }, 300)
  }, 3000)

  const closeBtn = notification.querySelector(".close")
  closeBtn.addEventListener("click", () => {
    notification.style.animation = "slideOut 0.3s ease-in forwards"
    setTimeout(() => {
      notificationsContainer.removeChild(notification)
    }, 300)
  })
}

function showConfirmationModal(title, message, confirmCallback) {
  const backdrop = document.createElement("div")
  backdrop.className = "modal-backdrop"

  const modal = document.createElement("div")
  modal.className = "modal-container"

  modal.innerHTML = `
        <div class="modal-header">
            <h3>${title}</h3>
        </div>
        <div class="modal-body">
            <p>${message}</p>
        </div>
        <div class="modal-footer">
            <button class="modal-btn cancel">Cancelar</button>
            <button class="modal-btn confirm">Confirmar</button>
        </div>
    `

  backdrop.appendChild(modal)
  document.body.appendChild(backdrop)

  
  const cancelBtn = modal.querySelector(".cancel")
  const confirmBtn = modal.querySelector(".confirm")


  cancelBtn.addEventListener("click", () => {
    document.body.removeChild(backdrop)
  })


  confirmBtn.addEventListener("click", () => {
    document.body.removeChild(backdrop)
    if (typeof confirmCallback === "function") {
      confirmCallback()
    }
  })
}


function sendData(event, data = {}) {
  return new Promise((resolve) => {
    const resourceName = GetParentResourceName()
    const timeoutId = setTimeout(() => {
      console.error("NUI Callback Timeout:", event)
      resolve({ success: false, error: "timeout" })
    }, 5000)

    fetch(`https://${resourceName}/${event}`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data),
    })
      .then((response) => response.json())
      .then((responseData) => {
        clearTimeout(timeoutId)
        resolve(responseData)
      })
      .catch((error) => {
        clearTimeout(timeoutId)
        console.error("NUI Callback Error:", error)

        if (error.message && error.message.includes("Failed to fetch")) {
          console.log("Attempting to reconnect to resource...")
          fetch(`https://${resourceName}/ping`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({}),
          })
            .then(() => {
              console.log("Reconnection successful")
              // If we get here, try the original request again
              return fetch(`https://${resourceName}/${event}`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(data),
              })
            })
            .then((response) => response.json())
            .then((responseData) => {
              resolve(responseData)
            })
            .catch(() => {
              resolve({ success: false, error: "connection_lost" })
            })
        } else {
          resolve({ success: false, error: "fetch_error" })
        }
      })
  })
}

document.addEventListener("DOMContentLoaded", () => {
  closeButton.addEventListener("click", closeMenu)

  menuItems.forEach((item) => {
    item.addEventListener("click", () => {
      const menu = item.dataset.menu
      if (menu) {
        sendData("changeMenu", { menu })
      }
    })
  })
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
      closeMenu()
    }
  })
})

