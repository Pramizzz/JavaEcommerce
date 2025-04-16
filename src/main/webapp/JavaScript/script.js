/**
 * 
 */
// DOM Elements
document.addEventListener('DOMContentLoaded', function() {
    // Mobile menu toggle
    const menuToggle = document.getElementById('menuToggle');
    const navLinks = document.querySelector('.nav-links');
  
    if (menuToggle) {
      menuToggle.addEventListener('click', () => {
        navLinks.classList.toggle('show');
        
        // Animate the hamburger icon
        const bars = menuToggle.querySelectorAll('.bar');
        bars.forEach(bar => bar.classList.toggle('change'));
      });
    }
  
    // Cart functionality
    const cartButtons = document.querySelectorAll('.add-to-cart');
    const cartSidebar = document.getElementById('cartSidebar');
    const closeCartButton = document.getElementById('closeCart');
    const overlay = document.getElementById('overlay');
    const cartItems = document.getElementById('cartItems');
    const cartTotal = document.getElementById('cartTotal');
  
    // Products data
    const products = [
      {
        id: 1,
        name: 'Air Jordan 1 Mid',
        price: 125.00,
        image: 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/fd43a343-1651-4965-99df-68ca5c3a29f1/air-jordan-1-mid-shoes-SQf7DM.png',
        description: 'The Air Jordan 1 Mid is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of greatness. Fresh color trims the clean, classic materials, imbuing modernity into a classic design.',
        category: 'jordan-1'
      },
      {
        id: 2,
        name: 'Air Jordan 4 Retro',
        price: 210.00,
        image: 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/33533fe2-1157-4001-896e-1803c60f0ea8/air-jordan-4-retro-shoes-DbgkPK.png',
        description: 'Legendary design, signature comfort. The Air Jordan 4 Retro brings back a coveted 89 release with the iconic details of the OG. Combining leather, synthetic leather, and textile, this sturdy remake honors MJs first championship-clinching shot.',
        category: 'jordan-4'
      },
      {
        id: 3,
        name: 'Air Jordan 11 Retro',
        price: 225.00,
        image: 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6d1f8d21-6f3f-418f-ae0e-d25da8364dc8/air-jordan-11-retro-shoes-TnZ9vy.png',
        description: 'The Air Jordan 11 Retro brings back a classic design and adds a fresh spin. Premium materials like full-grain leather and synthetic patent leather combine with an iconic silhouette for a timeless look.',
        category: 'jordan-11'
      },
      {
        id: 4,
        name: 'Zion 2',
        price: 140.00,
        image: 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/e0479d12-3b22-4744-9489-5f4722196080/zion-2-basketball-shoes-bZ2Snk.png',
        description: 'The Zion 2 harnesses Zions power—his speed and versatility—while staying stable and connected to the court. Its light, stable, responsive—and built for one of the most exciting players in the league.',
        category: 'lifestyle'
      },
      {
        id: 5,
        name: 'Air Jordan 3 Retro',
        price: 200.00,
        image: 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8b04ed02-c3ee-4ca6-a1a5-b1c78132c9cb/air-jordan-3-retro-shoes-TJf2lm.png',
        description: 'Clean and Supreme. The AJ3 returns with all of its classic style and familiar comfort. Quality leather in the upper is paired with iconic elephant print details on the heel and toe for a look that started a legacy.',
        category: 'jordan-3'
      },
      {
        id: 6,
        name: 'Air Jordan 13 Retro',
        price: 200.00,
        image: 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/ed6efa3d-bb62-4d5d-af1b-17b19801be1f/air-jordan-13-retro-shoes-xcXV4N.png',
        description: 'The Air Jordan 13 Retro brings back the memorable game shoe that Michael Jordan wore during the 1997–98 season and his 6th championship with Chicago.',
        category: 'lifestyle'
      },
      {
        id: 7,
        name: 'Jordan Why Not 6',
        price: 150.00,
        image: 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/e04d1dc0-11a5-43c4-9c16-0ec6860e0fad/jordan-why-not-6-pf-shoes-v4xPBm.png',
        description: 'Russell Westbrook\'s 6th signature shoe is—you guessed it—all about speed. To get you goin\' as fast as possible, we\'ve wrapped the rubber outsole nearly up to the midsole, so you\'re not gonna slip when you explode from 0 to 100.',
        category: 'lifestyle'
      },
      {
        id: 8,
        name: 'Air Jordan 1 High OG',
        price: 180.00,
        image: 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6257a2b2-e50b-4aef-8e0d-a3ec2159575c/air-jordan-1-high-og-shoes-a7Zzxm.png',
        description: 'The Air Jordan 1 High OG celebrates the legacy of Michael Jordan with a classic silhouette that features premium materials and iconic colorways.',
        category: 'jordan-1'
      }
    ];
  
    // Initialize cart from localStorage or empty array
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    updateCartDisplay();
  
    // Add event listeners for cart buttons
    cartButtons.forEach(button => {
      button.addEventListener('click', function() {
        const productCard = this.closest('.product-card');
        if (productCard) {
          const productId = parseInt(productCard.getAttribute('data-id'));
          addToCart(productId);
        }
      });
    });
  
    // Add to cart function
    function addToCart(productId) {
      const product = products.find(p => p.id === productId);
      
      if (product) {
        // Check if product is already in cart
        const existingProductIndex = cart.findIndex(item => item.id === productId);
        
        if (existingProductIndex !== -1) {
          cart[existingProductIndex].quantity += 1;
        } else {
          cart.push({
            id: product.id,
            name: product.name,
            price: product.price,
            image: product.image,
            quantity: 1
          });
        }
        
        // Save cart to localStorage
        localStorage.setItem('cart', JSON.stringify(cart));
        
        // Update cart UI
        updateCartDisplay();
        
        // Open cart sidebar
        openCart();
      }
    }
  
    // Update cart display
    function updateCartDisplay() {
      if (!cartItems || !cartTotal) return;
      
      cartItems.innerHTML = '';
      
      if (cart.length === 0) {
        cartItems.innerHTML = '<p class="empty-cart-message">Your cart is empty</p>';
        cartTotal.textContent = '$0.00';
        return;
      }
      
      let total = 0;
      
      cart.forEach(item => {
        const itemTotal = item.price * item.quantity;
        total += itemTotal;
        
        const cartItemElement = document.createElement('div');
        cartItemElement.className = 'cart-item';
        cartItemElement.innerHTML = `
          <div class="cart-item-image">
            <img src="${item.image}" alt="${item.name}">
          </div>
          <div class="cart-item-details">
            <h4 class="cart-item-title">${item.name}</h4>
            <p class="cart-item-price">$${item.price.toFixed(2)}</p>
            <div class="item-quantity">
              <button class="quantity-btn decrease" data-id="${item.id}">-</button>
              <span>${item.quantity}</span>
              <button class="quantity-btn increase" data-id="${item.id}">+</button>
            </div>
            <button class="remove-item" data-id="${item.id}">Remove</button>
          </div>
        `;
        
        cartItems.appendChild(cartItemElement);
      });
      
      // Set total price
      cartTotal.textContent = `$${total.toFixed(2)}`;
      
      // Add event listeners to quantity buttons
      const decreaseButtons = cartItems.querySelectorAll('.decrease');
      const increaseButtons = cartItems.querySelectorAll('.increase');
      const removeButtons = cartItems.querySelectorAll('.remove-item');
      
      decreaseButtons.forEach(button => {
        button.addEventListener('click', function() {
          const id = parseInt(this.getAttribute('data-id'));
          updateItemQuantity(id, 'decrease');
        });
      });
      
      increaseButtons.forEach(button => {
        button.addEventListener('click', function() {
          const id = parseInt(this.getAttribute('data-id'));
          updateItemQuantity(id, 'increase');
        });
      });
      
      removeButtons.forEach(button => {
        button.addEventListener('click', function() {
          const id = parseInt(this.getAttribute('data-id'));
          removeFromCart(id);
        });
      });
    }
  
    // Update item quantity
    function updateItemQuantity(id, action) {
      const itemIndex = cart.findIndex(item => item.id === id);
      
      if (itemIndex !== -1) {
        if (action === 'increase') {
          cart[itemIndex].quantity += 1;
        } else if (action === 'decrease') {
          cart[itemIndex].quantity -= 1;
          
          if (cart[itemIndex].quantity <= 0) {
            removeFromCart(id);
            return;
          }
        }
        
        localStorage.setItem('cart', JSON.stringify(cart));
        updateCartDisplay();
      }
    }
  
    // Remove from cart
    function removeFromCart(id) {
      cart = cart.filter(item => item.id !== id);
      localStorage.setItem('cart', JSON.stringify(cart));
      updateCartDisplay();
    }
  
    // Open cart
    function openCart() {
      if (cartSidebar && overlay) {
        cartSidebar.classList.add('open');
        overlay.classList.add('show');
        document.body.style.overflow = 'hidden';
      }
    }
  
    // Close cart
    function closeCart() {
      if (cartSidebar && overlay) {
        cartSidebar.classList.remove('open');
        overlay.classList.remove('show');
        document.body.style.overflow = '';
      }
    }
  
    // Add event listeners for cart open/close
    if (closeCartButton) {
      closeCartButton.addEventListener('click', closeCart);
    }
    
    if (overlay) {
      overlay.addEventListener('click', closeCart);
    }
  
    // New Arrivals slider
    const slider = document.querySelector('.slider');
    const slides = document.querySelectorAll('.slide');
    const prevBtn = document.querySelector('.prev');
    const nextBtn = document.querySelector('.next');
    let slideIndex = 0;
    let slideWidth = 0;
  
    function initializeSlider() {
      if (!slider || slides.length === 0) return;
      
      // Calculate slide width
      slideWidth = slider.clientWidth;
      
      // Set slider width
      slider.style.width = `${slideWidth * slides.length}px`;
      
      // Set each slide width
      slides.forEach(slide => {
        slide.style.width = `${slideWidth}px`;
      });
      
      // Set initial position
      moveSlider();
    }
  
    function moveSlider() {
      if (!slider) return;
      slider.style.transform = `translateX(${-slideWidth * slideIndex}px)`;
    }
  
    function nextSlide() {
      if (slideIndex >= slides.length - 1) {
        slideIndex = 0;
      } else {
        slideIndex++;
      }
      moveSlider();
    }
  
    function prevSlide() {
      if (slideIndex <= 0) {
        slideIndex = slides.length - 1;
      } else {
        slideIndex--;
      }
      moveSlider();
    }
  
    if (prevBtn) prevBtn.addEventListener('click', prevSlide);
    if (nextBtn) nextBtn.addEventListener('click', nextSlide);
  
    // Initialize slider
    initializeSlider();
  
    // Reset slider on window resize
    window.addEventListener('resize', initializeSlider);
  
    // Auto slide every 5 seconds
    setInterval(nextSlide, 5000);
  
    // Newsletter form submission
    const newsletterForm = document.getElementById('newsletter-form');
    const newsletterMessage = document.getElementById('newsletter-message');
  
    if (newsletterForm) {
      newsletterForm.addEventListener('submit', function(e) {
        e.preventDefault();
        const email = this.querySelector('input[type="email"]').value;
        
        // Simulate form submission
        newsletterMessage.textContent = `Thank you! ${email} has been subscribed.`;
        newsletterMessage.style.color = 'green';
        
        // Reset form
        this.reset();
        
        // Clear message after 3 seconds
        setTimeout(() => {
          newsletterMessage.textContent = '';
        }, 3000);
      });
    }
  
    // Products page functionality
    const productsContainer = document.getElementById('productsContainer');
    const categoryFilter = document.getElementById('category');
    const priceSort = document.getElementById('price');
    const productModal = document.getElementById('productModal');
    const productDetailContainer = document.getElementById('productDetailContainer');
  
    function renderProducts(productsToRender) {
      if (!productsContainer) return;
      
      productsContainer.innerHTML = '';
      
      productsToRender.forEach(product => {
        const productCard = document.createElement('div');
        productCard.className = 'product-card';
        productCard.setAttribute('data-id', product.id);
        
        productCard.innerHTML = `
          <div class="product-image">
            <img src="${product.image}" alt="${product.name}" />
          </div>
          <div class="product-info">
            <h3>${product.name}</h3>
            <p class="price">$${product.price.toFixed(2)}</p>
            <button class="add-to-cart">Add to Cart</button>
          </div>
        `;
        
        productsContainer.appendChild(productCard);
        
        // Add click event to show product details
        productCard.addEventListener('click', function(e) {
          if (!e.target.classList.contains('add-to-cart')) {
            showProductDetails(product.id);
          }
        });
        
        // Add to cart functionality
        const addButton = productCard.querySelector('.add-to-cart');
        addButton.addEventListener('click', function() {
          addToCart(product.id);
        });
      });
    }
  
    function filterAndSortProducts() {
      if (!categoryFilter || !priceSort) return;
      
      let filteredProducts = [...products];
      
      // Filter by category
      const category = categoryFilter.value;
      if (category !== 'all') {
        filteredProducts = filteredProducts.filter(product => product.category === category);
      }
      
      // Sort by price
      const sortOption = priceSort.value;
      switch (sortOption) {
        case 'low-high':
          filteredProducts.sort((a, b) => a.price - b.price);
          break;
        case 'high-low':
          filteredProducts.sort((a, b) => b.price - a.price);
          break;
        case 'newest':
          filteredProducts.reverse();
          break;
        default:
          // Default sorting (featured)
          break;
      }
      
      renderProducts(filteredProducts);
    }
  
    // Show product details
    function showProductDetails(productId) {
      if (!productModal || !productDetailContainer) return;
      
      const product = products.find(p => p.id === productId);
      
      if (product) {
        productDetailContainer.innerHTML = `
          <div class="product-detail-image">
            <img src="${product.image}" alt="${product.name}" />
          </div>
          <div class="product-detail-info">
            <h2 class="product-detail-title">${product.name}</h2>
            <p class="product-detail-price">$${product.price.toFixed(2)}</p>
            <div class="product-detail-description">
              <p>${product.description}</p>
            </div>
            <div class="size-selection">
              <h4>Select Size</h4>
              <div class="size-options">
                <div class="size-option">7</div>
                <div class="size-option">8</div>
                <div class="size-option">9</div>
                <div class="size-option">10</div>
                <div class="size-option">11</div>
                <div class="size-option">12</div>
              </div>
            </div>
            <div class="product-actions">
              <button class="add-to-cart-detail" data-id="${product.id}">Add to Cart</button>
              <button class="wishlist-btn">♡</button>
            </div>
          </div>
        `;
        
        // Show modal
        productModal.classList.add('open');
        document.body.style.overflow = 'hidden';
        
        // Add event listeners
        const sizeOptions = productDetailContainer.querySelectorAll('.size-option');
        sizeOptions.forEach(option => {
          option.addEventListener('click', function() {
            sizeOptions.forEach(opt => opt.classList.remove('selected'));
            this.classList.add('selected');
          });
        });
        
        const addToCartBtn = productDetailContainer.querySelector('.add-to-cart-detail');
        addToCartBtn.addEventListener('click', function() {
          addToCart(parseInt(this.getAttribute('data-id')));
        });
        
        const closeModalBtn = productModal.querySelector('.close-modal');
        closeModalBtn.addEventListener('click', function() {
          productModal.classList.remove('open');
          document.body.style.overflow = '';
        });
      }
    }
  
    // Initialize products page
    if (productsContainer) {
      renderProducts(products);
      
      if (categoryFilter && priceSort) {
        categoryFilter.addEventListener('change', filterAndSortProducts);
        priceSort.addEventListener('change', filterAndSortProducts);
      }
    }
  
    // Contact page FAQ functionality
    const faqItems = document.querySelectorAll('.faq-item');
    
    faqItems.forEach(item => {
      const question = item.querySelector('.faq-question');
      
      question.addEventListener('click', () => {
        // Toggle current FAQ item
        item.classList.toggle('active');
        
        // Update toggle icon
        const toggleIcon = question.querySelector('.toggle-icon');
        toggleIcon.textContent = item.classList.contains('active') ? '-' : '+';
      });
    });
  
    // Contact form submission
    const contactForm = document.getElementById('contactForm');
    const formMessage = document.getElementById('form-message');
    
    if (contactForm) {
      contactForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Collect form data
        const name = this.querySelector('#name').value;
        
        // Simulate form submission
        formMessage.textContent = `Thank you, ${name}! Your message has been sent.`;
        formMessage.style.color = 'green';
        
        // Reset form
        this.reset();
        
        // Clear message after 3 seconds
        setTimeout(() => {
          formMessage.textContent = '';
        }, 3000);
      });
    }
  });