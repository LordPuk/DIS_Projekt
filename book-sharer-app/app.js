// Sample book data
const books = [
  { 
    title: "Book 1", 
    author: "Author 1", 
    avgRating: 0, 
    description: "", 
    pageCount: 0, 
    language: "", 
    publisher: "", 
    date: "", 
    ISBN: ""
  },
  { 
    title: "Book 2", 
    author: "Author 1", 
    avgRating: 0, 
    description: "", 
    pageCount: 0, 
    language: "", 
    publisher: "", 
    date: "", 
    ISBN: ""
  },
  { 
    title: "Book 3", 
    author: "Author 1", 
    avgRating: 0, 
    description: "", 
    pageCount: 0, 
    language: "", 
    publisher: "", 
    date: "", 
    ISBN: "" 
  }
];
const users = [
  {
    id: 1,
    username: "astrid",
    password: "123",
    savedBooks: [] // Initialize with an empty array
  },
  // Add more user objects as needed
];


// Function to get the user by username
function getUserByUsername(username) {
  return users.find((user) => user.username === username);
}

// Function to get the book by title
function getBookByTitle(title) {
  return books.find((book) => book.title.toLowerCase() === title.toLowerCase());
}

// Function to populate the book list on the Discover page
function populateBookList() {
  const bookList = document.getElementById("books");
  bookList.innerHTML = "";

  books.forEach((book) => {
    const listItem = document.createElement("li");
    const bookTitle = document.createElement("h3");
    const viewDetailsLink = document.createElement("a");

    bookTitle.textContent = book.title;
    viewDetailsLink.textContent = "View Details";
    viewDetailsLink.href = `book_details.html?title=${encodeURIComponent(book.title)}`;

    listItem.appendChild(bookTitle);
    listItem.appendChild(viewDetailsLink);
    bookList.appendChild(listItem);
  });
}

// Function to redirect to the book details page
function redirectToBookDetails(bookTitle) {
  const encodedTitle = encodeURIComponent(bookTitle);
  window.location.href = `book_details.html?title=${encodedTitle}`;
}

// Function to handle saving a book to the user's collection
function saveBook(user, book) {
  user.savedBooks.push(book);
  alert("Book saved!");
}



// Add an event listener to the submit rating button
const submitRatingButton = document.getElementById("submit-rating");
submitRatingButton.addEventListener("click", function () {
  // Get the user rating from the input field
  const userRatingInput = document.getElementById("user-rating");
  const userRating = parseInt(userRatingInput.value);

  // Perform validation on the user rating
  if (userRating >= 1 && userRating <= 5) {
    // Update the book's average rating based on the user rating
    books.avgRating = calculateNewAverageRating(books.avgRating, userRating);

    // Update the book details section to reflect the new average rating
    const bookRating = document.getElementById("book-rating");
    bookRating.textContent = books.avgRating.toFixed(1);

    // Optionally, provide feedback to the user
    alert("Thank you for your rating!");
  } else {
    alert("Invalid rating. Please enter a number between 1 and 5.");
  }
});

// Calculate the new average rating based on the current average and the new rating
function calculateNewAverageRating(currentAverage, newRating) {
  const totalRatings = books.numRatings + 1;
  const newAverage = (currentAverage * books.numRatings + newRating) / totalRatings;
  return newAverage;
}

document.addEventListener("DOMContentLoaded", function () {
  // Retrieve the stars HTML elements
  const stars = document.querySelectorAll(".stars .fa-star");

  // Loop through the "stars" NodeList
  stars.forEach((star, index) => {
    // Add an event listener that runs a function when the "click" event is triggered
    star.addEventListener("click", () => {
      // Remove "active" class from all stars
      stars.forEach((star) => {
        star.classList.remove(".stars .fa-active");
      });

      // Add "active" class to the clicked star and any stars with a lower index
      for (let i = 0; i <= index; i++) {
        stars[i].classList.add(".stars .fa-active");
      }
    });
  });
});






/* Simulating user's book collection
/const myBooks = [
  { title: "My Book 1", author: "Me" },
  { title: "My Book 2", author: "Me" }
];

// Function to populate my book list
function populateMyBookList() {
  const myBookList = document.getElementById("my-book-list");

  myBooks.forEach(book => {
    const listItem = document.createElement("li");
    listItem.textContent = `${book.title} by ${book.author}`;
    myBookList.appendChild(listItem);
  });
}}*/

// Event listener for form submission
document.getElementById("login-form").addEventListener("submit", function(event) {
  event.preventDefault();
  const usernameInput = document.getElementById("username");
  const passwordInput = document.getElementById("password");
  const username = usernameInput.value;
  const password = passwordInput.value;
  const user = getUserByUsername(username);

  if (user && user.password === password) {
    alert("Login successful!");
    window.location.href="mybooks.html";
    // Code to show the user's saved books on the My Books page
  } else {
    alert("Invalid username or password.");
  }

  // Clear input fields
  usernameInput.value = "";
  passwordInput.value = "";
});


// Populate book list on page load
document.addEventListener("DOMContentLoaded", function () {
  populateBookList();
});