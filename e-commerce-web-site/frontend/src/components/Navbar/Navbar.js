import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link } from 'react-router-dom';
import { getCartTotal } from '../../store/cartSlice';
import { fetchCategories } from '../../store/categorySlice';
import "./Navbar.scss";

const Navbar = () => {
  const dispatch = useDispatch();
  const {data: categories} = useSelector((state) => state.category);
  const {totalItems} = useSelector((state => state.cart));

  const [isSidebarOpen, setIsSidebarOpen] = useState(false);

  useEffect(() => {
    dispatch(fetchCategories());
    dispatch(getCartTotal());
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <nav className = "navbar">
       <div className='navbar-content'>
    <div className = "container">
      <div className = "navbar-top flex flex-between">
        <Link to = "/" className = "navbar-brand">
          <span className = "text-regal-blue">Shopping</span><span className='text-gold'>Hub.</span>
        </Link>

        <form className = "navbar-search flex">
          <input type = "text" placeholder='Search here ...' />
          <button type = "submit" className = "navbar-search-btn">
            <i className = "fas fa-search"></i>
          </button>
        </form>

          <div className = "navbar-btns flex">
          <Link to = "/login" className="navbar-btn">Login</Link>
          <Link to = "/register" className="navbar-btn">Register</Link>

          <Link to = "/cart" className="add-to-cart-btn flex">
            <span className = "btn-ico">
              <i className = "fas fa-shopping-cart"></i>
            </span>
            <div className='btn-txt fw-5'>Cart
              <span className='cart-count-value'>{totalItems}</span>
            </div>
          </Link>
        </div>
      </div>
    </div>
        
        <div className='navbar-bottom bg-regal-blue'>
          <div className='container flex flex-between'>
            <ul className = {`nav-links flex ${isSidebarOpen ? 'show-nav-links' : ""}`}>
              <button type = "button" className='navbar-hide-btn text-white' onClick={() => setIsSidebarOpen(false)}>
                <i className='fas fa-times'></i>
              </button>
              {
                categories.slice(0, 5).map(category => (
                  <li key = {category}><Link to = {`/category/${category}`} className = "nav-link text-white" onClick={() => setIsSidebarOpen(false)}>{category}</Link></li>
                ))
              }
            </ul>

            <button type = "button" className='navbar-show-btn text-gold' onClick={() => setIsSidebarOpen(true)}>
              <i className = "fas fa-bars"></i>
            </button>
          </div>
        </div>
      </div>
    </nav>
  )
}

export default Navbar;