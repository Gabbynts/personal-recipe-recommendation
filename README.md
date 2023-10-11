# personal-recipe-recommendation

## Rekayasa Sistem Berbasis Pengetahuan D
## Anggota Kelompok

| NRP        | Name                        |
| ---------- | --------------------------- |
| 5025211081 | Gabriella Natasya Br Ginting|
| 5025211102 | Adhira Riyanti Amanda       |

### Tiga rule baru untuk kasus mengenai food recommendation

Rule untuk user yang menginginkan rekomendasi `appetizer`

```
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
```

Rule untuk user yang menginginkan rekomendasi `main course`
```
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
```

Rule untuk user yang menginginkan rekomendasi `dessert`

```
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
```