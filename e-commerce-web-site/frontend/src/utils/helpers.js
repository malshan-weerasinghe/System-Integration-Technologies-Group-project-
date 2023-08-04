export const formatPrice = (price) => {
    return new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: "USD",
        minimumFractionDigits: 2,  // force two decimal places
    }).format(price);
}