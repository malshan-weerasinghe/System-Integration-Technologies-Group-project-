/*
import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link, useParams } from 'react-router-dom';
import ProductListCategory from '../../components/ProductList/categoryList';
import { fetchProductsByCategory } from '../../store/categorySlice';
import "./CategoryPage.scss";

const CategoryPage = () => {
  const dispatch = useDispatch();
  const {name} = useParams();
  const {catProductSingle: products, catProductSingleStatus: status} = useSelector((state) => state.category);

  useEffect(() => {
    dispatch(fetchProductsByCategory(name));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [name]);

  return (
    <div className = "category-page">
      <div className = "container">
        <div className = "breadcrumb">
          <ul className = "breadcrumb-items flex">
            <li className = "breadcrumb-item">
              <Link to = "/">
                <i className = "fas fa-home"></i>
                <span className = "breadcrumb-separator">
                  <i className = "fas fa-chevron-right"></i>
                </span>
              </Link>
            </li>
            <li>
              Category
              <span className = "breadcrumb-separator">
                <i className = "fas fa-chevron-right"></i>
              </span>
            </li>
            <li>
              {name}
            </li>
          </ul>
        </div>
      </div>
      <ProductListCategory products = {products} status = {status} />
    </div>
  )
}

export default CategoryPage;
*/

import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link, useParams } from 'react-router-dom';
import Footer from "../../components/Footer/Footer";
import Navbar from '../../components/Navbar/Navbar';
import ProductList from '../../components/ProductList/ProductList';
import { fetchProductsCategory } from '../../store/productSlice';
import "./CategoryPage.scss";

/*
const CategoryPage = () => {
  const dispatch = useDispatch();
  const { name } = useParams();
  const { products, status } = useSelector((state) => state.product);

  useEffect(() => {
    dispatch(fetchProductsByCategory(name));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [name]);

  return (
    <div className = "category-page">
      <Navbar />
      <div className = "container">
        <div className = "breadcrumb">
          <ul className = "breadcrumb-items flex">
            <li className = "breadcrumb-item">
              <Link to = "/">
                <i className = "fas fa-home"></i>
                <span className = "breadcrumb-separator">
                  <i className = "fas fa-chevron-right"></i>
                </span>
              </Link>
            </li>
            <li>
              Category
              <span className = "breadcrumb-separator">
                <i className = "fas fa-chevron-right"></i>
              </span>
            </li>
            <li>
              {name}
            </li>
          </ul>
        </div>
      </div>
      <ProductList products = {products} status = {status} />
      <Footer />
    </div>
  )
}

export default CategoryPage;*/

import { fetchCategories, fetchProductsByCategory } from '../../store/categorySlice';
import { fetchProducts } from '../../store/productSlice';

const CategoryPage = () => {
 const dispatch = useDispatch();
  const {name} = useParams();
  const {data: categories, status: categoryStatus} = useSelector((state) => state.category);
  const {data: products, status: productStatus} = useSelector((state) => state.product);
  const {catProductAll: productsByCategory, catProductAllStatus} = useSelector((state) => state.category);
  useEffect(() => {
    dispatch(fetchProducts());
    dispatch(fetchCategories());
    dispatch(fetchProductsCategory(name))
    dispatch(fetchProductsByCategory('smartphones', 'all'));
    dispatch(fetchProductsByCategory('smartphones', 'all'));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);


  return (
    <div className = "category-page">
      <Navbar />
      <div className = "container">
        <div className = "breadcrumb">
          <ul className = "breadcrumb-items flex">
            <li className = "breadcrumb-item">
              <Link to = "/">
                <i className = "fas fa-home"></i>
                <span className = "breadcrumb-separator">
                  <i className = "fas fa-chevron-right"></i>
                </span>
              </Link>
            </li>
            <li>
              Category
              <span className = "breadcrumb-separator">
                <i className = "fas fa-chevron-right"></i>
              </span>
            </li>
            <li>
              {name}
            </li>
          </ul>
        </div>
      </div>
      <ProductList products = {products} status = {productStatus} />
    
      <Footer />
    </div>
  )
}

export default CategoryPage;



