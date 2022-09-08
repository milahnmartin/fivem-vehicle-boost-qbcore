let _TabletPropObject;
let _PedId;
const boostingContainer = document.querySelector(
  ".boosting-inner .boosting-logo-container"
);
const boostingIcon = document.querySelector(
  ".boosting-inner .boosting-logo-container .boosting-logo"
);
window.addEventListener("message", ({ data }) => {
  if (data.action == "open") {
    document.querySelector(".container").style.visibility = "visible";
    _TabletPropObject = data.tabletObj;
    _PedId = data.pedId;
    if (data.donglePresent) {
      boostingContainer.style.display = "flex";
    } else {
      boostingContainer.style.display = "none";
    }
  } else {
    document.querySelector(".container").style.visibility = "hidden";
  }
});

document.querySelector("body").addEventListener("keyup", (event) => {
  if (event.keyCode == 27) {
    document.querySelector(".container").style.visibility = "hidden";
    fetch(`https://${GetParentResourceName()}/qb-vehicleboosting:close`, {
      method: "POST",
      headers: { "content-type": "application/json" },
      body: JSON.stringify({
        tabletObject: _TabletPropObject,
        pedId: _PedId,
      }),
    });
  }
});

const modal = document.querySelector(".modal");
let modalOpen = false;
boostingIcon.addEventListener("click", (event) => {
  if (!modalOpen) {
    // let people = ["person1", "person2", "person3", "person4", "person5"];
    // console.log(people[Math.floor(Math.random() * people.length)]);
    modal.style.visibility = "visible";
    modalOpen = true;
    return;
  }
  modal.style.visibility = "hidden";
  modalOpen = false;
});

document.querySelector("body").addEventListener("keyup", (event) => {
  if (event.keyCode == 27) {
    modal.style.visibility = "hidden";
    boostingContainer.style.display = "none";
    modalOpen = false;
  }
});

document.querySelector("body").addEventListener("dblclick", ({ target }) => {
  if (!target.classList.contains("modal")) {
    modal.style.visibility = "hidden";
    modalOpen = false;
  }
});

const pMorAm = new Date().getHours() > 12 ? " PM" : " AM";
const currentTime = new Date().getHours() + ":" + new Date().getMinutes() + pMorAm;
document.querySelector("#current-time-h1").innerHTML = currentTime;
