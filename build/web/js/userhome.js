/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Function to redirect to the selected page or perform a search
function redirectToPage(selectElement) {
  var selectedOption = selectElement.options[selectElement.selectedIndex];
  if (selectedOption.value) {
    // Redirect to the selected page if an option is chosen
    window.location.href = selectedOption.value;
  }
}

// Function to perform search and redirect
function searchRedirect() {
  var searchInput = document.querySelector('.search-input').value.trim();
  if (searchInput !== '') {
    // You can modify this part to handle the search functionality as needed
    // For now, just alert the search keyword
    alert('Searching for: ' + searchInput);
    // Redirect to a search results page or handle the search logic here
    // window.location.href = 'searchResults.jsp?keyword=' + encodeURIComponent(searchInput);
  } else {
    alert('Please enter a search keyword.');
  }
}

