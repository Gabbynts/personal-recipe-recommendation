; Create templates
(deftemplate Recipe
   (slot name)
   (slot type)
   (slot difficulty)
   (slot ingredients)
   (slot instructions)
)

(deftemplate User
   (slot name)
   (slot appetizer-preference)
   (slot main-course-preference)
   (slot dessert-preference)
   (slot difficulty-preference)
)

; Create Rules

(defrule GetUserPreferences
    (not (User (name ?name)))
    =>
    ; inputs for user
    (printout t "insert your name !")
    (bind ?name (read))
    (printout t "Welcome, " ?name ". Let's find you a recipe!" crlf)
    (printout t "Do you want to make an Appetizer? (yes/no)")
    (bind ?appetizer-pref (read))
    (printout t "Do you want to make a Main Course? (yes/no)")
    (bind ?main-course-pref (read))
    (printout t "Do you want to make a Dessert? (yes/no)")
    (bind ?dessert-pref (read))
    (printout t "How difficult should the recipe be? (Easy, Intermediate, Difficult) ")
    (bind ?difficulty-pref (read))
    ; create new user fact
    (assert (User 
        (name ?name) 
        (appetizer-preference ?appetizer-pref)
        (main-course-preference  ?main-course-pref)
        (dessert-preference ?dessert-pref)
        (difficulty-preference ?difficulty-pref)
    ))
)

(defrule RecommendAppetizerRecipe
    (User 
        (name ?name) 
        (appetizer-preference ?appetizer-pref)
        (main-course-preference  ?main-course-pref)
        (dessert-preference ?dessert-pref)
        (difficulty-preference ?difficulty-pref)
    )
    (Recipe 
        (name ?recipe)
        (type ?type)
        (difficulty ?difficulty)
        (ingredients ?ingredients)
        (instructions ?instructions)
    )
    (test (eq ?appetizer-pref yes))
    (test (eq Appetizer ?type))
    (test (eq ?difficulty ?difficulty-pref))
    =>
    (printout t "Based on your preferences, the appetizer we recommend: " ?recipe crlf)
    (printout t "Ingredients: " ?ingredients crlf)
    (printout t "Instructions: " ?instructions crlf)
    (printout t "Enjoy your meal!" crlf)
    ;(retract (User (name ?name)))
    ;(retract (Recipe (name ?recipe)))
)

(defrule RecommendMainCourseRecipe
    (User 
        (name ?name) 
        (appetizer-preference ?appetizer-pref)
        (main-course-preference  ?main-course-pref)
        (dessert-preference ?dessert-pref)
        (difficulty-preference ?difficulty-pref)
    )
    (Recipe 
        (name ?recipe)
        (type ?type)
        (difficulty ?difficulty)
        (ingredients ?ingredients)
        (instructions ?instructions)
    )
    (test (eq ?main-course-pref yes))
    (test (eq MainCourse ?type))
    (test (eq ?difficulty ?difficulty-pref))
    =>
    (printout t "Based on your preferences, the main course we recommend: " ?recipe crlf)
    (printout t "Ingredients: " ?ingredients crlf)
    (printout t "Instructions: " ?instructions crlf)
    (printout t "Enjoy your meal!" crlf)
    ;(retract (User (name ?name)))
    ;(retract (Recipe (name ?recipe)))
)


(defrule RecommendDessertRecipe
    (User 
        (name ?name) 
        (appetizer-preference ?appetizer-pref)
        (main-course-preference  ?main-course-pref)
        (dessert-preference ?dessert-pref)
        (difficulty-preference ?difficulty-pref)
    )
    (Recipe 
        (name ?recipe)
        (type ?type)
        (difficulty ?difficulty)
        (ingredients ?ingredients)
        (instructions ?instructions)
    )
    (test (eq ?dessert-pref yes))
    (test (eq Dessert ?type))
    (test (eq ?difficulty ?difficulty-pref))
    =>
    (printout t "Based on your preferences, the dessert we recommend: " ?recipe crlf)
    (printout t "Ingredients: " ?ingredients crlf)
    (printout t "Instructions: " ?instructions crlf)
    (printout t "Enjoy your meal!" crlf)
    ;(retract (User (name ?name)))
    ;(retract (Recipe (name ?recipe)))
)

(defrule ExitRecommendations
   (User (name ?name))
   =>
   (printout t "Thank you for using the personalized recipe recommender, " ?name "!" crlf)
   ;(retract (User (name ?name)))
   ;(exit)
)

; set initial facts

(deffacts SampleRecipes
    (Recipe 
        (name "Spaghetti Carbonara") 
        (type MainCourse) 
        (difficulty Easy)
        (ingredients "spaghetti, eggs, bacon, Parmesan cheese") 
        (instructions "1. Cook spaghetti. 2. Fry bacon. 3. Mix eggs and cheese. 4. Toss with pasta.")
    )

    (Recipe 
        (name "Chicken Tikka Masala") 
        (type MainCourse) 
        (difficulty Intermediate)
        (ingredients "chicken, yogurt, tomato sauce, spices") 
        (instructions "1. Marinate chicken. 2. Cook chicken. 3. Simmer in sauce.")
    )

    (Recipe 
        (name "Tofu Tikka Masala") 
        (type MainCourse) 
        (difficulty Intermediate)
        (ingredients "tofu, lettuce, tomato sauce, spices") 
        (instructions "1. Marinate tofu. 2. Cook tofu. 3. Simmer in sauce.")
    )

    (Recipe 
        (name "Caesar Salad") 
        (type Appetizer) 
        (difficulty Easy)
        (ingredients "romaine lettuce, croutons, Caesar dressing") 
        (instructions "1. Toss lettuce with dressing. 2. Add croutons.")
    )

    (Recipe 
        (name "Terang Bulan") 
        (type Dessert) 
        (difficulty Intermediate)
        (ingredients "butter, pancake mix, chocolate") 
        (instructions "1. Mix the pancake mix. 2. Cook the pancake mix in a pan. 3. Spread the butter 4. Spread the chocolate")
    )

    (Recipe 
        (name "Lava Cake") 
        (type Dessert) 
        (difficulty Difficult)
        (ingredients "cake mix, chocolate") 
        (instructions "1. Mix the cake mix. 2. Put chocolate inside. 3. Bake the cake mix")
    )

    (Recipe 
        (name "Indomie") 
        (type Appetizer) 
        (difficulty Easy)
        (ingredients "indomie, eggs") 
        (instructions "1. Boil water. 2.Put the noodle into the boiling water 3. Put the sauce in a bowl. 4. Drain the noodle")
    )

    (Recipe 
        (name "Sosis Solo") 
        (type Appetizer) 
        (difficulty Hard)
        (ingredients "bacon, mayonaisse") 
        (instructions "1. Make the batter. 2. Cook the bacon. 3. Wrap the bacon and mayonaisse in the batter")
    )
)