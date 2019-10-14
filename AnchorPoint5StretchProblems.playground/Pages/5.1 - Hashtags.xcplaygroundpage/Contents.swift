/*:
 # Monday Stretch Problem 5.1
 ## Hashtags
 ### Instructions - Hashtags
 - Build a `Restaurant` model object with `name`, `streetAddress`, `city`, `state`, and `reviews` properties.
 - Build a `Review` model object with a `username` and `text` property.
 - Instantiate an array of `Restaurant` and `Review` objects. Make sure that each `Restaurant` object holds an array of reviews. Add hashtags to some of your reviews or restaruant descriptions. (Use Yelp or Google to help you come up with `Restaurants` and `Reviews`).
 - Add a `hashtags` computed property to the `Restaurant` object that returns an array of any hashtags in the `Restaurant` or `Review`.
 `- Check your computed property by printing a list of hashtags of each review and restaurant.
 
 ### Instructions - Searching
 - Add a `SearchableObject` protocol with one function `matchesSearchTerm(searchTerm: String)`.
 - Implement the function on both model objects.
 - Demonstrate your search by printing a list of `Restaurants` that match a variety of search terms.
 */
import UIKit


//class Restaurant {
//    let name: String
//    let streetAddress: String
//    let city: String
//    let state: String
//    let reviews: [Review]
//    init(name: String, streetAddress: String, city: String, state: String, reviews: [Review]) {
//        self.name = name
//        self.streetAddress = streetAddress
//        self.city = city
//        self.state = state
//        self.reviews = reviews
//    }
//}
//class Review  {
//    let username: String
//    let text: String
//    init(username: String, text: String) {
//        self.username = username
//        self.text = text
//    }
//}
//
//var resturantInfo:[Restaurant] {
//    let cubby = Restaurant(name: "Cubby", streetAddress: "3700 N Thanksgiving Way", city: "Lehi", state: "UT", reviews: [])
//    let jDawgs = Restaurant(name: "JDaws", streetAddress: "3750 N Thanksgiving Way B", city: "Lehi", state: "UT", reviews: [])
// return [cubby, jDawgs]
//}
//var reviewPerson:[Review] {
//    let bob = Review(username: "bob", text: "The Houdini burger is amazing. Get two patties, you won’t be disappointed. My wife and I went on our first date to Cubby’s exactly one year ago. We’ve been married for 3 months and we came back to Cubby’s today for our one-year first date anniversary and had a wonderful time. We count on going back soon!")
//    let john = Review(username: "john", text: "I love the restaurant. I serve a good quality dog, for a good quality price. They have apple beer on tap. And the overall dog experience with all the fixings and toppings on it turns out to be quite pleasurable the way they slice the dogs helps to get more flavor into each bite and helps them cook more thoroughly. Not a bad idea for just a hot dog stand.")
//    return [bob, john]
//}
//
//protocol searchableObject {
//    func matchesSearchTerm(searchTerm: String) {
//
//    }
//}

/// BLACK DIAMOND
protocol SearchableObject {
    func matchesSearchTerm(_ searchTerm: String) -> Bool
}
struct Restaurant: SearchableObject {
    
    let name: String
    let description: String
    let address: String
    let city: String
    let state: String
    let reviews: [Review]
    
    var hashtags: [String] {
        // temp array
        var hashtagsFound: [String] = []
        // loop through reviews
        for review in reviews {
            // append found hashtags
            hashtagsFound.append(contentsOf: review.hashtags)
        }
        // separate words in description into components
        let words = description.components(separatedBy: .whitespacesAndNewlines)
        // check to see if any are hashtags (start with "#")
        let descriptionHashtags = words.filter({ $0.hasPrefix("#")})
        // append found hashtags in description
        hashtagsFound.append(contentsOf: descriptionHashtags)
        // return the temp array
        return hashtagsFound
    }
    
    func matchesSearchTerm(_ searchTerm: String) -> Bool {
        // base case
        var foundMatch = false
        // loop through reviews
        for review in reviews {
            // check if review contains search term
            if review.matchesSearchTerm(searchTerm) {
                foundMatch = true
            }
        }
        
        // check if description contains search term
        if description.description.lowercased().contains(searchTerm.lowercased()) {
            foundMatch = true
        }
        
        return foundMatch
    }
}
struct Review: SearchableObject {
    
    let username: String
    let text: String
    
    var hashtags: [String] {
        // Sepparate words
        let words = text.components(separatedBy: " ")
        // Find words with hashtags
        return words.filter({ $0.hasPrefix("#")})
    }
    
    func matchesSearchTerm(_ searchTerm: String) -> Bool {
        // check if review contains search term
        if text.lowercased().contains(searchTerm.lowercased()) {
            return true
        } else {
            return false
        }
    }
}

//: [Longest Word](@next)
