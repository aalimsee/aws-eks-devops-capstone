


import React, { useEffect, useState } from 'react';

function App() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);

  // useEffect(() => {
  //   fetch(`${process.env.REACT_APP_API_URL}/product`)
  // // Adjust this to your backend endpoint
  //     .then(response => response.json())
  //     .then(data => {
  //       setProducts(data);
  //       setLoading(false);
  //     })
  //     .catch(err => {
  //       console.error('Error fetching products:', err);
  //       setLoading(false);
  //     });
  // }, []);

  useEffect(() => {
    console.log('Fetching from:', `${process.env.REACT_APP_API_URL}/product`);
    fetch(`${process.env.REACT_APP_API_URL}/product`)
      .then(response => response.json())
      .then(data => {
        console.log('Fetched data:', data);
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
        {products
          .filter(product => product.name && product.price)
          .map((product, index) => (
            <li key={index}>{product.name} — ${product.price}</li>
        ))}
        </ul>
      )}
    </div>
  );
}

export default App;
