# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Moe Howard", biography: "Moses Harry Horwitz (June 19, 1897 – May 4, 1975), known professionally as Moe Howard, was an American actor and comedian, best known as the leader of the Three Stooges, the farce comedy team who starred in motion pictures and television for four decades.")
User.create(name: "Larry Fine", biography: "Louis Feinberg (October 5, 1902 – January 24, 1975), known professionally as Larry Fine, was an American actor, comedian, musician, and boxer, best known as a member of the comedy act the Three Stooges.")
User.create(name: "Curly Howard", biography: "Jerome Lester Horwitz (October 22, 1903 – January 18, 1952), known professionally as Curly Howard, was an American vaudevillian actor and comedian. He was best known as a member of the American comedy team the Three Stooges, which also featured his elder brothers Moe and Shemp Howard and actor Larry Fine.")

Post.create(title: "A Plumbing We Will Go", body: "A Plumbing We Will Go is a 1940 short subject directed by Del Lord starring American slapstick comedy team The Three Stooges (Moe Howard, Larry Fine and Curly Howard). It is the 46th entry in the series released by Columbia Pictures starring the comedians, who released 190 shorts for the studio between 1934 and 1959.")
Post.create(title: "Disorder in the Court", body: "Disorder in the Court is a 1936 short subject directed by Preston Black starring American slapstick comedy team The Three Stooges (Moe Howard, Larry Fine and Curly Howard). It is the 15th entry in the series released by Columbia Pictures starring the comedians, who released 190 shorts for the studio between 1934 and 1959.")
Post.create(title: "Dizzy Doctors", body: "Dizzy Doctors is a 1937 short subject directed by Del Lord starring American slapstick comedy team The Three Stooges (Moe Howard, Larry Fine and Curly Howard). It is the 21st entry in the series released by Columbia Pictures starring the comedians, who released 190 shorts for the studio between 1934 and 1959.")