import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import Category from '../../components/Category/Category';
import Footer from "../../components/Footer/Footer";
import Navbar from '../../components/Navbar/Navbar';
import ProductList from '../../components/ProductList/ProductList';
import Slider from '../../components/Slider/Slider';
import { fetchCategories, fetchProductsByCategory } from '../../store/categorySlice';
import { fetchProducts } from '../../store/productSlice';
import "./HomePage.scss";

const HomePage = () => {
  const dispatch = useDispatch();
  const {data: categories, status: categoryStatus} = useSelector((state) => state.category);
  const {data: products, status: productStatus} = useSelector((state) => state.product);
  const {catProductAll: productsByCategory, catProductAllStatus} = useSelector((state) => state.category);
  useEffect(() => {
    dispatch(fetchProducts());
    dispatch(fetchCategories());
    dispatch(fetchProductsByCategory('smartphones', 'all'));
    dispatch(fetchProductsByCategory('smartphones', 'all'));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <div className = "home-page">
      <Navbar />
      <Slider /> 
      <ProductList products = {products} status = {productStatus} />
      <Category categories = {categories} status = {categoryStatus} />
      <Footer />
    </div>
    
  )
}

export default HomePage;