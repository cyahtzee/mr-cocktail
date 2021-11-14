const tapCard = () => {
  document.querySelectorAll(".card-hello img").forEach((card) => {
    card.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("tapped");
    });
  }
  )
};

const flipCard = () => {
  document.querySelector(".item-flip")
    .addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("flipped");
    });
};

export { tapCard, flipCard };
