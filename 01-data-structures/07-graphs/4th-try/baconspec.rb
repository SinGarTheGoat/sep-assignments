
require_relative 'bacon'

RSpec.describe Bacon, type: Class do

  let (:bacon_slice) {Bacon.new}
  let (:foot_loose) {Node.new("Footloose",["Kevin Bacon","Lori Singer",	"John Lithgow","Dianne Wiest","Chris Penn","Sarah Jessica Parker", "John Laughlin","Elizabeth Gorcey",	"Frances Lee McCain","Jim Youngs"])}
  let (:apollo13) {Node.new("Apollo 13", ["Tom Hanks", "Bill Paxton",	"Kevin Bacon","Gary Sinise",'Ed Harris',"Kathleen Quinlan","Mary Kate Schellhardt","Emily Ann Lloyd","Miko Hughes", "Max Elliott Slade"])}
  let (:savingprivateryan){Node.new("Saving Private Ryan",["Tom Hanks", "Tom Sizemore", "Edward Burns", "Barry Pepper", "Adam Goldberg", "Vin Diesel", "Giovanni Ribisi", "Jeremy Davies", "Matt Damon", "Ted Danson"])}
  let (:matrix){Node.new("The Matrix", ["Keanu Reeves","Laurence Fishburne", "Carrie-Anne Moss", 	"Carrie-Anne Moss", "Hugo Weaving", "Gloria Foster", "Joe Pantoliano", "Marcus Chong", "Julian Arahanga", "Matt Doran", "Belinda McClory"])}
  let (:afewgoodmen){Node.new("A Few Good Men", ["Tom Cruise", "Jack Nicholson", 	"Demi Moore", "Kevin Bacon", "Kiefer Sutherland", "Kevin Pollak", "James Marshall", "J.T. Walsh" ,"Christopher Guest", "J.A. Preston"])}
  let (:somethingsgottagive){Node.new("Something's Gotta Give", ["Jack Nicholson", "Diane Keaton", "Keanu Reeves", "Frances McDormand", "Amanda Peet", "Jon Favreau", "Paul Michael Glaser", "Rachel Ticotin", "Paige Butcher", "Tanya Sweet"])}
  let (:thegodfather) {Node.new("The Godfather", ["Marlon Brando",  "Al Pacino", 	"James Caan", "Richard S. Castellano", "Robert Duvall", "Sterling Hayden", "John Marley", "Richard Conte", "Al Lettieri", "Diane Keaton"])}
  let (:misery) {Node.new("Misery",["James Caan","Kathy Bates", "Richard Farnsworth", "Frances Sternhagen", "Lauren Bacall", "Graham Jarvis", "Jerry Potter", "Thomas Brunelle", "June Christopher", "Julie Payne" ])}
  let (:titanic) {Node.new("Titanic", ["Leonardo DiCaprio", "Kate Winslet", "Billy Zane", "Kathy Bates", "Frances Fisher", "Gloria Stuart", "Bill Paxton", "Bernard Hill", "David Warner", "Victor Garber"])}
  let (:backtothefuture){Node.new( "Back to the Future", ["Michael J. Fox", "Christopher Lloyd", "Lea Thompson", "Crispin Glover", "Thomas F. Wilson", "Claudia Wells", "Marc McClure", "Wendie Jo Sperber", "George DiCenzo", "Frances Lee McCain", "Billy Zane"])}
  let (:marsattacks){Node.new( "Mars Attacks!", ["Jack Nicholson"	, "Glenn Close", "Annette Bening", "Pierce Brosnan", "Danny DeVito", "Martin Short", "Sarah Jessica Parker", "Michael J. Fox", "Rod Steiger", "Tom Jones" ])}
  let (:tremors){Node.new("Tremors", ["Kevin Bacon", "Fred Ward", "Finn Carter", "Michael Gross", "Reba McEntire", "Robert Jayne", "Charlotte Stewart", "Tony Genaro", "Ariana Richards", "Richard Marcus"])}
  let (:lakeplacid){Node.new("Lake Placid", ["Bill Pullman", "Bridget Fonda", "Oliver Platt", "Brendan Gleeson", "Betty White", "David Lewis", "Tim Dixon", "Natassia Malthe","Mariska Hargitay", "Meredith Salenger" ])}
  let (:xmenfirstclass){Node.new("X-Men: First Class",['James McAvoy', "Laurence Belcher", "Michael Fassbender", "Bill Milner", "Kevin Bacon", "Rose Byrne", "Jennifer Lawrence", "Beth Goddard", "Morgan Lily", "Oliver Platt"] )}
  let (:independenceday){Node.new("Independence Day", ["Will Smith", "Bill Pullman", "Jeff Goldblum", "Mary McDonnell", "Judd Hirsch", "Robert Loggia", "Randy Quaid", "Margaret Colin", "Vivica A. Fox", "James Rebhorn"]  )}

  describe "#insert(node)" do
    it "returns true on a easy test" do
      # bacon_slice.insert_movies_into_array(foot_loose)
      # bacon_slice.insert_movies_into_array(apollo13)
      # bacon_slice.insert_movies_into_array(savingprivateryan)
      # bacon_slice.insert_movies_into_array(matrix)
      bacon_slice.insert_movies_into_array(afewgoodmen)
      # bacon_slice.insert_movies_into_array(somethingsgottagive)
      # bacon_slice.insert_movies_into_array(thegodfather)
      # bacon_slice.insert_movies_into_array(misery)
      # bacon_slice.insert_movies_into_array(titanic)
      # bacon_slice.insert_movies_into_array(backtothefuture)
       bacon_slice.insert_movies_into_array(marsattacks)
      # bacon_slice.insert_movies_into_array(tremors)
      # bacon_slice.insert_movies_into_array(lakeplacid)
      # bacon_slice.insert_movies_into_array(xmenfirstclass)
      # bacon_slice.insert_movies_into_array(independenceday)
      bacon_slice.find_the_input("Mars Attacks!","Annette Bening")
    end

  end
end
