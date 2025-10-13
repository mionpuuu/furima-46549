const price = () => {

  const priceInput = document.getElementById("item-price");

  if (!priceInput) return;

  // 入力イベントがあるたびに処理を実行
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTax = Math.floor(inputValue * 0.1);
    const profit = inputValue - addTax;

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    addTaxDom.innerHTML = addTax;
    profitDom.innerHTML = profit;
  });
};

// Turbo対応：ページ読み込み時とrender時の両方で発火
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);