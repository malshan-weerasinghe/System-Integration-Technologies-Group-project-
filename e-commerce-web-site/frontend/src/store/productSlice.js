import { createSlice } from "@reduxjs/toolkit";
import { BASE_URL } from "../utils/apiURL";
import { STATUS } from "../utils/status";

const productSlice = createSlice({
    name: "product",
    initialState: {
        data: [],
        status: STATUS.IDLE,
    },

    reducers: {
        setProducts(state, action){
            state.data = action.payload;
        },
        setStatus(state, action){
            state.status = action.payload;
        },
    },
});

export const {setProducts, setStatus} = productSlice.actions;
export default productSlice.reducer;

export const fetchProducts = () => {
    return async function fetchProductThunk(dispatch){
        dispatch(setStatus(STATUS.LOADING));
        try{
            const response = await fetch(`${BASE_URL}products`);
            //const response = await fetch(`http://localhost:3000/proxy?url=${encodeURIComponent(`${BASE_URL}products/category/laptops}`)}`);
            const data = await response.json();
            console.log(data);
            dispatch(setProducts(data));
            dispatch(setStatus(STATUS.IDLE));
        } catch(error){
            dispatch(setStatus(STATUS.ERROR));
        }
    }
}

export const fetchProductsCategory = (categoryName) => {
    return async function fetchProductThunk(dispatch){
        dispatch(setStatus(STATUS.LOADING));
        try{
            const response = await fetch(`http://localhost:3000/proxy?url=${encodeURIComponent(`${BASE_URL}products/category/${categoryName}`)}`);

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            if (data.products.length === 0) {
                // Handle case where no products are returned
                console.log('No products found for this category');
            } else {
                console.log(data);
                dispatch(setProducts(data));
            }
            dispatch(setStatus(STATUS.IDLE));
        } catch(error){
            console.log('Fetch failed:', error);
            dispatch(setStatus(STATUS.ERROR));
        }
    }
}


