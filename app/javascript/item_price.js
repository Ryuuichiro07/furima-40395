window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  
  const addTaxDom = document.getElementById("add-tax-price");
  const salesFee =  Math.floor(inputValue*0.1);//"入力した金額をもとに販売手数料を計算する処理"
  addTaxDom.innerHTML = salesFee;

  const calculatedProfit  = document.getElementById("profit");
  const profit = inputValue - salesFee;
  calculatedProfit.innerHTML = profit;
  })
});