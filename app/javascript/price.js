function price() {
document.getElementById("price-content")

const price = document.getElementById("item-price");

price.addEventListener("input", () => { 
  const priceA = price.value;
  priceB = priceA * 0.1
  priceC =  priceA - priceB
  const price２ = document.getElementById("add-tax-price");
  price２.innerHTML = priceB
  const price3 = document.getElementById("profit");
  price3.innerHTML = priceC
})
}

window.addEventListener("load", price);



