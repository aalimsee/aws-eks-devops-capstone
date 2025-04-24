


import React, { useEffect, useState } from 'react';

function App() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch('http://a6ea81d9551ec437e98ab8746f7baf93-84350743.us-east-1.elb.amazonaws.com/product')
  // Adjust this to your backend endpoint
      .then(response => response.json())
      .then(data => {
        setProducts(data);
        setLoading(false);
      })
      .catch(err => {
        console.error('Error fetching products:', err);
        setLoading(false);
      });
  }, []);

  return (
    <div style={{ padding: '20px', fontFamily: 'Arial' }}>
      <h1>Product List</h1>
      {loading ? <p>Loading...</p> : (
        <ul>
          {products.map((product, index) => (
            <li key={index}>{product.name} — ${product.price}</li>
          ))}
        </ul>
      )}
    </div>
  );
}

export default App;
