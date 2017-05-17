include RSpec

require_relative 'bacon'


RSpec.describe AdjMatrix, type: Class do

  let (:bacon_slice) {AdjMatrix.new("Kevin Bacon")}


  let (:foot_loose) {Array.new(["Kevin Bacon","Lori Singer",	"John Lithgow","Dianne Wiest","Chris Penn","Sarah Jessica Parker", "John Laughlin","Elizabeth Gorcey",	"Frances Lee McCain","Jim Youngs"])} #"Footloose",
  let (:apollo13) {Array.new( ["Tom Hanks", "Bill Paxton",	"Kevin Bacon","Gary Sinise",'Ed Harris',"Kathleen Quinlan","Mary Kate Schellhardt","Emily Ann Lloyd","Miko Hughes", "Max Elliott Slade"])}#"Apollo 13",
  let (:savingprivateryan){Array.new(["Tom Hanks", "Tom Sizemore", "Edward Burns", "Barry Pepper", "Adam Goldberg", "Vin Diesel", "Giovanni Ribisi", "Jeremy Davies", "Matt Damon", "Ted Danson"])}#"Saving Private Ryan",
  let (:matrix){Array.new(["Keanu Reeves","Laurence Fishburne", "Carrie-Anne Moss", 	"Carrie-Anne Moss", "Hugo Weaving", "Gloria Foster", "Joe Pantoliano", "Marcus Chong", "Julian Arahanga", "Matt Doran", "Belinda McClory"])}#"The Matrix",
  let (:afewgoodmen){Array.new(["Tom Cruise", "Jack Nicholson", 	"Demi Moore", "Kevin Bacon", "Kiefer Sutherland", "Kevin Pollak", "James Marshall", "J.T. Walsh" ,"Christopher Guest", "J.A. Preston"])}#"A Few Good Men",
  let (:somethingsgottagive){Array.new(["Jack Nicholson", "Diane Keaton", "Keanu Reeves", "Frances McDormand", "Amanda Peet", "Jon Favreau", "Paul Michael Glaser", "Rachel Ticotin", "Paige Butcher", "Tanya Sweet"])}#"Something's Gotta Give",
  let (:thegodfather) {Array.new( ["Marlon Brando",  "Al Pacino", 	"James Caan", "Richard S. Castellano", "Robert Duvall", "Sterling Hayden", "John Marley", "Richard Conte", "Al Lettieri", "Diane Keaton"])}#"The Godfather",
  let (:misery) {Array.new(["James Caan","Kathy Bates", "Richard Farnsworth", "Frances Sternhagen", "Lauren Bacall", "Graham Jarvis", "Jerry Potter", "Thomas Brunelle", "June Christopher", "Julie Payne" ])}#"Misery",
  let (:titanic) {Array.new( ["Leonardo DiCaprio", "Kate Winslet", "Billy Zane", "Kathy Bates", "Frances Fisher", "Gloria Stuart", "Bill Paxton", "Bernard Hill", "David Warner", "Victor Garber"])}#"Titanic",
  let (:backtothefuture){Array.new(["Michael J. Fox", "Christopher Lloyd", "Lea Thompson", "Crispin Glover", "Thomas F. Wilson", "Claudia Wells", "Marc McClure", "Wendie Jo Sperber", "George DiCenzo", "Frances Lee McCain", "Billy Zane"])}# "Back to the Future",
  let (:marsattacks){Array.new( ["Jack Nicholson"	, "Glenn Close", "Annette Bening", "Pierce Brosnan", "Danny DeVito", "Martin Short", "Sarah Jessica Parker", "Michael J. Fox", "Rod Steiger", "Tom Jones" ])}# "Mars Attacks!",
  let (:tremors){Array.new(["Kevin Bacon", "Fred Ward", "Finn Carter", "Michael Gross", "Reba McEntire", "Robert Jayne", "Charlotte Stewart", "Tony Genaro", "Ariana Richards", "Richard Marcus"])}#"Tremors",
  let (:lakeplacid){Array.new( ["Bill Pullman", "Bridget Fonda", "Oliver Platt", "Brendan Gleeson", "Betty White", "David Lewis", "Tim Dixon", "Natassia Malthe","Mariska Hargitay", "Meredith Salenger" ])}#"Lake Placid",
  let (:xmenfirstclass){Array.new(['James McAvoy', "Laurence Belcher", "Michael Fassbender", "Bill Milner", "Kevin Bacon", "Rose Byrne", "Jennifer Lawrence", "Beth Goddard", "Morgan Lily", "Oliver Platt"] )}#"X-Men: First Class",
  let (:independenceday){Array.new(["Will Smith", "Bill Pullman", "Jeff Goldblum", "Mary McDonnell", "Judd Hirsch", "Robert Loggia", "Randy Quaid", "Margaret Colin", "Vivica A. Fox", "James Rebhorn"]  )}#"Independence Day",

  let (:interstellar){Array.new([ "Ellen Burstyn", "Matthew McConaughey", "Mackenzie Foy", "John Lithgow", "Timothee Chalamet", "David Oyelowo","Collette Wolfe", "Francis McCarthy", "Bill Irwin", "Anne Hathaway", "Andrew Borba", "Wes Bentley", "William Devane","Michael Caine", "David Gyasi"])} #"Interstellar"
  let (:wolf_of_wallstreet){Array.new(["Leonardo DiCaprio", "Jonah Hill", "Margot Robbie", "Matthew McConaughey", "Kyle Chandler", "Rob Reiner","Jon Bernthal", "Jon Favreau", "Jean Dujardin", "Joanna Lumley", "Cristin Milloti", "Christine Ebersole", "Shea Whigham", "Katarina Cas", "P.J. Byrne"])} #"The Wolf of Wall Street"


  describe "#insert(node)" do
    it "returns true on a easy test" do
      # bacon_slice.insert_movies_into_array(foot_loose)
      # bacon_slice.insert_movies_into_array(apollo13)
      # bacon_slice.insert_movies_into_array(savingprivateryan)
      # bacon_slice.insert_movies_into_array(matrix)
      bacon_slice.add_film("Footloose", footloose)
      # bacon_slice.insert_movies_into_array(somethingsgottagive)
      # bacon_slice.insert_movies_into_array(thegodfather)
      # bacon_slice.insert_movies_into_array(misery)
      # bacon_slice.insert_movies_into_array(titanic)
      # bacon_slice.insert_movies_into_array(backtothefuture)
       #bacon_slice.add_film( "Mars Attacks!",marsattacks)
      # bacon_slice.insert_movies_into_array(tremors)
      # bacon_slice.insert_movies_into_array(lakeplacid)
      # bacon_slice.insert_movies_into_array(xmenfirstclass)
      # bacon_slice.insert_movies_into_array(independenceday)
      bacon_slice.add_film("Interstellar", interstellar)
      bacon_slice.add_film("The Wolf of Wall Street", wolf_of_wallstreet)
      puts "We're gonna find Leonardo DiCaprio's Bacon connection..."
      puts "#{matrix.find_kevin_bacon("Leonardo DiCaprio")}"
    end

    it "returns outputs results on a harder test" do
      bacon_slice.insert_movies_into_array(foot_loose)
      bacon_slice.insert_movies_into_array(apollo13)
      bacon_slice.insert_movies_into_array(savingprivateryan)
      bacon_slice.insert_movies_into_array(matrix)
      bacon_slice.insert_movies_into_array(afewgoodmen)
      bacon_slice.insert_movies_into_array(somethingsgottagive)
      bacon_slice.insert_movies_into_array(thegodfather)
      bacon_slice.insert_movies_into_array(misery)
      bacon_slice.insert_movies_into_array(titanic)
      bacon_slice.insert_movies_into_array(backtothefuture)
      bacon_slice.insert_movies_into_array(marsattacks)
      bacon_slice.insert_movies_into_array(tremors)
      bacon_slice.insert_movies_into_array(lakeplacid)
      bacon_slice.insert_movies_into_array(xmenfirstclass)
      bacon_slice.insert_movies_into_array(independenceday)
      bacon_slice.find_the_input("Mars Attacks!","Jack Nicholson")
    end




    it "returns false on a null test" do
      bacon_slice.insert_movies_into_array(foot_loose)
      bacon_slice.insert_movies_into_array(apollo13)
      bacon_slice.insert_movies_into_array(savingprivateryan)
      bacon_slice.insert_movies_into_array(matrix)
      bacon_slice.insert_movies_into_array(afewgoodmen)
      bacon_slice.insert_movies_into_array(somethingsgottagive)
      bacon_slice.insert_movies_into_array(thegodfather)
      bacon_slice.insert_movies_into_array(misery)
      bacon_slice.insert_movies_into_array(titanic)
      bacon_slice.insert_movies_into_array(backtothefuture)
      bacon_slice.insert_movies_into_array(marsattacks)
      bacon_slice.insert_movies_into_array(tremors)
      bacon_slice.insert_movies_into_array(lakeplacid)
      bacon_slice.insert_movies_into_array(xmenfirstclass)
      bacon_slice.insert_movies_into_array(independenceday)
      expect(bacon_slice.find_the_input("xxxxx!","xxxxxx")).to eq false
    end
  end




end
