import React from 'react';
import { Link } from "react-router-dom";
import { STATUS } from "../../utils/status";
import Error from '../Error/Error';
import Loader from '../Loader/Loader';
import "./Category.scss";

// Category component for displaying a list of categories
const Category = ({categories, status}) => {
    // Display error message component if status indicates an error
    if(status === STATUS.ERROR) return (<Error />);
    // Display loader component while fetching data if status is loading
    if(status === STATUS.LOADING) return (<Loader />);

    // Render the section displaying all categories
    return (
        <section className="categories py-5 bg-ghost-white" id="categories">
            <div className="container">
                <div className="categories-content">
                    <div className='section-title'>
                        <h3 className="text-uppercase fw-7 text-regal-blue ls-1">All Categories</h3>
                    </div>
                    <div className="category-items grid">
                        {
                            categories.map((category, index) => (
                                // Link to specific category page
                                <Link to={`category/${category}`} key={index}>
                                    <div className="category-item">
                                        <div className="category-item-name text-center">
                                            <h6 className='fs-20'>{category}</h6>
                                        </div>
                                    </div>
                                </Link>
                            ))
                        }
                    </div>
                </div>
            </div>
        </section>
    );
}

export default Category;
