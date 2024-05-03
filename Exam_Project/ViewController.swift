
import UIKit

/// Custom UITableViewCell for displaying country information
class CountryTableViewCell: UITableViewCell {
    let continentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(continentImageView)
        contentView.addSubview(countryImageView)
        contentView.addSubview(countryLabel)
        
        NSLayoutConstraint.activate([
            continentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            continentImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            continentImageView.widthAnchor.constraint(equalToConstant: 30),
            continentImageView.heightAnchor.constraint(equalToConstant: 30),
            
            countryImageView.leadingAnchor.constraint(equalTo: continentImageView.trailingAnchor, constant: 10),
            countryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countryImageView.widthAnchor.constraint(equalToConstant: 30),
            countryImageView.heightAnchor.constraint(equalToConstant: 30),
            
            countryLabel.leadingAnchor.constraint(equalTo: countryImageView.trailingAnchor, constant: 10),
            countryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import UIKit

// Country Details View Controller
class CountryDetailsViewController: UIViewController {
    
    
    var selectedCountry: String = ""
    var countryName: String = ""
    var countryDescription: String = ""
    //var cities: [String] = []
    var countryImageName: String?
    var flagImageName: String? // Add flag image name
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
  let countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    
   let descriptionButton: UIButton = {
       let button = UIButton()
       button.translatesAutoresizingMaskIntoConstraints = false
       button.setTitle("Explore More", for: .normal)
       button.setTitleColor(.white, for: .normal)
       button.backgroundColor = .black // Set background color to black
       button.layer.cornerRadius = 8 // Set corner radius to 8 (adjust as needed)
       button.layer.masksToBounds = true // Ensure that the corner radius is applied
       button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20) // Add padding
       button.addTarget(self, action: #selector(descriptionButtonTapped), for: .touchUpInside)
       return button
   }()



   let descriptionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true

        // Add a back button
        let backButton = UIButton(type: .system)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Back", for: .normal) // You can also set a custom image for the button
        backButton.setTitleColor(.blue, for: .normal)
    
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)

        // Add constraints for the back button
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 50), // Adjust width as needed
            backButton.heightAnchor.constraint(equalToConstant: 30) // Adjust height as needed
        ])

        return view
    }()


    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        // Set initial placeholder text for the description label
        label.text = "Select a country to see its description."
        // Configure label properties as needed
        return label
    }()
    func didSelectCountry(_ country: String) {
        selectedCountry = country
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI()
        populateData()
    }
    
  func setupUI() {
    
    view.addSubview(descriptionButton)

    NSLayoutConstraint.activate([
        descriptionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        descriptionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
    ])
        view.addSubview(backgroundImageView)
        view.addSubview(countryLabel)
        view.addSubview(flagImageView)
      //  view.addSubview(descriptionLabel) // Remove countryImageView from the view hierarchy

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            flagImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 40),
            flagImageView.heightAnchor.constraint(equalToConstant: 40),
            
            countryLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 10),
            countryLabel.centerXAnchor.constraint(equalTo: flagImageView.centerXAnchor),
            
         /*   descriptionLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 10), // Adjust the spacing here
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    
             citiesTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            citiesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            citiesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            citiesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)*/
        ])
        
        // Set delegates
       /* citiesTableView.delegate = self
        citiesTableView.dataSource = self*/
    }
    @objc func backButtonTapped() {
        // Handle the action of closing the description view here
        descriptionView.removeFromSuperview() // Example: Remove the description view from its superview
    }

      @objc func descriptionButtonTapped() {
      guard !selectedCountry.isEmpty else {
          print("No country selected")
          return
      }

      // Set description and background image based on the selected country
switch selectedCountry {
    case "Algeria":
        descriptionLabel.text = "Algeria, officially known as the People's Democratic Republic of Algeria, is the largest country in Africa and the Arab world. Its capital and most populous city is Algiers. Algeria is known for its diverse landscapes, including the Sahara Desert, the Atlas Mountains, and the Mediterranean coastline. The country has a rich history, with influences from Berber, Arab, and French cultures evident in its architecture, cuisine, and traditions."
    
    case "Angola":
        descriptionLabel.text = "Angola, officially the Republic of Angola, is a country in Southern Africa bordered by Namibia to the south, the Democratic Republic of the Congo to the north, Zambia to the east, and the Atlantic Ocean to the west. Its capital and largest city is Luanda. Angola is known for its rich natural resources, including oil and diamonds. Despite its economic potential, the country faces challenges related to infrastructure development, healthcare, and education."
   
    case "Cabo Verde":
        descriptionLabel.text = "Cabo Verde, officially the Republic of Cabo Verde, is an island country in the central Atlantic Ocean. Its capital city is Praia. Cabo Verde is known for its volcanic islands, vibrant culture, and stunning beaches. The country has a mixed African and Portuguese heritage, reflected in its language, music, and cuisine. Tourism is a major industry, with visitors drawn to the islands' natural beauty, historic towns, and vibrant festivals."
   
    case "Comoros":
        descriptionLabel.text = "Comoros, officially the Union of the Comoros, is an island nation in the Indian Ocean, located at the northern end of the Mozambique Channel off the eastern coast of Africa. Its capital and largest city is Moroni. Comoros is known for its beautiful beaches, coral reefs, and rich marine life. The country has a diverse culture influenced by African, Arab, and French traditions. Agriculture and fishing are the mainstays of the economy."
  
    case "Egypt":
        descriptionLabel.text = "Egypt, officially the Arab Republic of Egypt, is a transcontinental country spanning the northeast corner of Africa and the southwest corner of Asia by a land bridge formed by the Sinai Peninsula. Its capital and largest city is Cairo. Egypt is known for its ancient civilization and iconic landmarks, such as the Great Pyramids of Giza, the Sphinx, and the Nile River. Tourism is a major industry, with millions of visitors drawn to Egypt's archaeological sites, beaches, and vibrant culture."
   
    case "Ethiopia":
        descriptionLabel.text = "Ethiopia, officially known as the Federal Democratic Republic of Ethiopia, is a landlocked country in the Horn of Africa. Its capital and largest city is Addis Ababa. Ethiopia is one of the oldest countries in the world, with a rich history and culture dating back thousands of years. The country is known for its diverse landscapes, including the Ethiopian Highlands, the Great Rift Valley, and the Danakil Depression. Ethiopia is also famous for its ancient churches, rock-hewn monasteries, and unique cuisine."
   
    case "Gabon":
        descriptionLabel.text = "Gabon, officially the Gabonese Republic, is a country on the west coast of Central Africa. Its capital and largest city is Libreville. Gabon is known for its dense rainforests, diverse wildlife, and pristine beaches. The country is home to 13 national parks, offering opportunities for eco-tourism and wildlife viewing, including encounters with lowland gorillas. Gabon is also one of the wealthiest countries in Africa due to its oil reserves."
  
    case "Ivory Coast":
        descriptionLabel.text = "Ivory Coast, officially the Republic of Côte d'Ivoire, is a country in West Africa. Its capital and largest city is Yamoussoukro, while Abidjan is the economic capital and the most populous city. Ivory Coast is known for its cultural diversity, cocoa production, and vibrant music scene. The country has a rich history influenced by various ethnic groups and French colonial rule. Despite its natural resources, Ivory Coast faces challenges related to political instability and social cohesion."
  
    case "Mauritania":
        descriptionLabel.text = "Mauritania, officially the Islamic Republic of Mauritania, is a country in Northwest Africa. Its capital and largest city is Nouakchott. Mauritania is known for its vast desert landscapes, ancient cities, and rich nomadic culture. The country is home to UNESCO World Heritage sites such as the ancient trading town of Chinguetti and the Banc d'Arguin National Park, a haven for migratory birds. Mauritania's economy is heavily reliant on agriculture, fishing, and mining."
    case "Morocco":
        descriptionLabel.text = "Morocco, officially the Kingdom of Morocco, is a country located in North Africa. Its capital and largest city is Rabat, and the largest city is Casablanca. Morocco is known for its vibrant culture, rich history, and stunning landscapes. The country's attractions include the bustling souks of Marrakech, the blue-washed streets of Chefchaouen, and the ancient Roman ruins of Volubilis. Tourism is a major industry, with millions of visitors drawn to Morocco's diverse attractions every year."
  
   case "Senegal":
    descriptionLabel.text = "Senegal, officially the Republic of Senegal, is a country located on the west coast of Africa. It is bordered by Mauritania to the north and northeast, Mali to the east, Guinea to the southeast, and Guinea-Bissau to the southwest. The capital city is Dakar, a bustling metropolis overlooking the Atlantic Ocean. Senegal is known for its vibrant culture, rich history, and stunning natural beauty. The country's attractions include the historic island of Gorée, the vibrant markets of Saint-Louis, and the pristine beaches of the Petite Côte. Senegal's cuisine is renowned for its use of fresh seafood, rice, and vegetables, with dishes such as thiéboudienne (a traditional fish stew) and yassa (marinated chicken or fish) being staples of Senegalese cuisine."

   case "Tunisia":
    descriptionLabel.text = "Tunisia, officially known as the Republic of Tunisia, is a country located in North Africa. It is bordered by Algeria to the west and southwest, Libya to the southeast, and the Mediterranean Sea to the north and east. The capital city is Tunis, while the largest city is Sfax. Tunisia is known for its rich history, stunning beaches, and vibrant culture. The country's attractions include the ancient city of Carthage, the Roman amphitheater of El Djem, and the picturesque villages of Sidi Bou Said and Dougga. Tunisia's cuisine is influenced by Arab, Berber, and Mediterranean flavors, with dishes such as couscous, brik, and tajine being popular across the country."
   
       case "Albania":
        descriptionLabel.text = "Albania, officially known as the Republic of Albania, is a country in Southeast Europe on the Balkan Peninsula. It is bordered by Montenegro to the northwest, Kosovo to the northeast, North Macedonia to the east, and Greece to the south. The capital city is Tirana, the largest city in the country. Albania is known for its stunning landscapes, including rugged mountains, pristine beaches, and ancient castles. The country has a rich history, with influences from Greek, Roman, and Ottoman civilizations shaping its culture and traditions."

    case "Austria":
        descriptionLabel.text = "Austria, officially known as the Republic of Austria, is a landlocked country in Central Europe. It is bordered by Germany to the northwest, the Czech Republic to the north, Slovakia to the northeast, Hungary to the east, Slovenia to the south, and Italy to the southwest. The capital city is Vienna, the largest city in Austria and one of its cultural and economic centers. Austria is known for its stunning Alpine landscapes, historic cities, and rich cultural heritage. The country has a long history of classical music, art, and architecture, with figures such as Mozart, Beethoven, and Gustav Klimt leaving a lasting legacy."

    case "Bulgaria":
        descriptionLabel.text = "Bulgaria, officially known as the Republic of Bulgaria, is a country in Southeast Europe. It is bordered by Romania to the north, Serbia and North Macedonia to the west, Greece and Turkey to the south, and the Black Sea to the east. The capital city is Sofia, the largest city in Bulgaria and its cultural and economic center. Bulgaria is known for its diverse landscapes, including mountains, forests, and coastline. The country has a rich history, with influences from Thracian, Greek, Roman, and Ottoman civilizations shaping its culture, cuisine, and traditions."

    case "Croatia":
        descriptionLabel.text = "Croatia, officially known as the Republic of Croatia, is a country in Southeast Europe. It is bordered by Slovenia to the northwest, Hungary to the northeast, Serbia to the east, Bosnia and Herzegovina, and Montenegro to the southeast, and the Adriatic Sea to the southwest. The capital city is Zagreb, the largest city in Croatia and its political and cultural center. Croatia is known for its stunning coastline, historic cities, and picturesque islands. The country has a rich cultural heritage, with influences from Roman, Byzantine, Venetian, and Austro-Hungarian civilizations evident in its architecture, cuisine, and traditions."

    case "Denmark":
        descriptionLabel.text = "Denmark, officially known as the Kingdom of Denmark, is a country in Northern Europe. It is bordered by Germany to the south, Sweden to the northeast, and Norway to the north. The capital city is Copenhagen, the largest city in Denmark and its cultural and economic center. Denmark is known for its progressive social policies, high standard of living, and stunning landscapes. The country has a rich history, with influences from Viking, medieval, and modern eras shaping its culture, architecture, and traditions."

    case "Finland":
        descriptionLabel.text = "Finland, officially known as the Republic of Finland, is a country in Northern Europe. It is bordered by Sweden to the west, Russia to the east, and Norway to the north. The capital city is Helsinki, the largest city in Finland and its cultural and economic center. Finland is known for its stunning natural landscapes, including forests, lakes, and islands. The country has a rich cultural heritage, with influences from Finnish, Swedish, and Russian civilizations shaping its language, cuisine, and traditions."

    case "Germany":
        descriptionLabel.text = "Germany, officially known as the Federal Republic of Germany, is a country in Central Europe. It is bordered by Denmark to the north, Poland and the Czech Republic to the east, Austria and Switzerland to the south, and France, Luxembourg, Belgium, and the Netherlands to the west. The capital city is Berlin, the largest city in Germany and its political and cultural center. Germany is known for its rich history, vibrant culture, and strong economy. The country has a diverse landscape, including mountains, forests, rivers, and coastline. Germany has made significant contributions to art, science, philosophy, and literature, with figures such as Goethe, Beethoven, and Einstein leaving a lasting legacy."

    case "Italy":
        descriptionLabel.text = "Italy, officially known as the Italian Republic, is a country in Southern Europe. It is bordered by France, Switzerland, Austria, and Slovenia to the north, and it is surrounded by the Mediterranean Sea to the south. The capital city is Rome, the largest city in Italy and its cultural and political center. Italy is known for its stunning landscapes, historic cities, and rich cultural heritage. The country has a long history of art, architecture, and cuisine, with influences from ancient Roman, Renaissance, and Baroque civilizations shaping its culture and traditions."

    case "Netherlands":
        descriptionLabel.text = "The Netherlands, informally known as Holland, is a country in Western Europe. It is bordered by Germany to the east, Belgium to the south, and the North Sea to the northwest. The capital city is Amsterdam, the largest city in the Netherlands and its cultural and economic center. The Netherlands is known for its flat landscape, extensive canal systems, and iconic windmills. The country has a rich history, with influences from Dutch, Spanish, and French civilizations shaping its culture, architecture, and traditions."

    case "Spain":
        descriptionLabel.text = "Spain, officially known as the Kingdom of Spain, is a country in Southern Europe. It is bordered by Portugal to the west, France to the northeast, and Andorra and Gibraltar to the south. The capital city is Madrid, the largest city in Spain and its political and cultural center. Spain is known for its stunning landscapes, vibrant culture, and rich history. The country has a diverse culture, with influences from Celtic, Roman, Moorish, and Christian civilizations shaping its language, cuisine, and traditions."

    case "Sweden":
    descriptionLabel.text = "Sweden, officially known as the Kingdom of Sweden, is a country in Northern Europe. It is bordered by Norway to the west and north, Finland to the east, and the Baltic Sea to the south and east. The capital city is Stockholm, the largest city in Sweden and its cultural and economic center. Sweden is known for its stunning natural landscapes, including forests, lakes, and archipelagos. The country has a rich cultural heritage, with influences from Viking, medieval, and modern eras shaping its culture, language, and traditions. Sweden is known for its progressive social policies, high standard of living, and innovation. The country has made significant contributions to music, design, and technology, with figures such as ABBA, IKEA, and Spotify gaining international recognition."
   
    case "Switzerland":
    descriptionLabel.text = "Switzerland, officially known as the Swiss Confederation, is a country in Central Europe. It is bordered by Germany to the north, France to the west, Italy to the south, and Austria and Liechtenstein to the east. The capital city is Bern, while the largest city is Zurich. Switzerland is known for its stunning Alpine landscapes, historic cities, and political neutrality. The country has a strong economy, with a focus on banking, finance, and tourism. Switzerland is also renowned for its chocolate, watches, and cheese, with Swiss craftsmanship and precision being highly valued worldwide."

    case "Armenia":
        descriptionLabel.text = "Armenia, officially known as the Republic of Armenia, is a country in the South Caucasus region of Eurasia. It is bordered by Turkey to the west, Georgia to the north, Azerbaijan to the east, and Iran to the south. The capital city is Yerevan, the largest city in Armenia and its cultural and economic center. Armenia is known for its rich history, ancient landmarks, and stunning landscapes. The country has a unique cultural heritage, with influences from Armenian, Persian, and Russian civilizations shaping its language, cuisine, and traditions."

    case "China":
        descriptionLabel.text = "China, officially known as the People's Republic of China, is a country in East Asia. It is the world's most populous country, with a population of over 1.4 billion people. China is known for its rich history, ancient civilizations, and rapid economic growth. The capital city is Beijing, the largest city in China and its political, cultural, and economic center. China has a diverse landscape, including mountains, deserts, and rivers. The country has made significant contributions to art, science, philosophy, and technology, with innovations such as papermaking, gunpowder, and the compass originating from China."

    case "India":
        descriptionLabel.text = "India, officially known as the Republic of India, is a country in South Asia. It is the seventh-largest country by land area and the second-most populous country in the world, with over 1.3 billion people. India is known for its diverse culture, rich history, and vibrant traditions. The capital city is New Delhi, while the largest city is Mumbai. India has a diverse landscape, including mountains, plains, deserts, and coastline. The country has made significant contributions to mathematics, science, philosophy, and literature, with figures such as Mahatma Gandhi, Rabindranath Tagore, and Ramanujan leaving a lasting legacy."

    case "Iran":
        descriptionLabel.text = "Iran, officially known as the Islamic Republic of Iran, is a country in Western Asia. It is bordered by Armenia, Azerbaijan, and Turkmenistan to the north, Afghanistan and Pakistan to the east, and Turkey and Iraq to the west. The capital city is Tehran, the largest city in Iran and its cultural, political, and economic center. Iran is known for its rich history, ancient civilizations, and diverse culture. The country has a diverse landscape, including mountains, deserts, and coastal regions. Iran has made significant contributions to art, literature, science, and philosophy, with figures such as Avicenna, Rumi, and Omar Khayyam being celebrated worldwide."

    case "Iraq":
        descriptionLabel.text = "Iraq, officially known as the Republic of Iraq, is a country in Western Asia. It is bordered by Turkey to the north, Iran to the east, Kuwait to the southeast, Saudi Arabia to the south, Jordan to the southwest, and Syria to the west. The capital city is Baghdad, the largest city in Iraq and its cultural, political, and economic center. Iraq is known for its rich history, ancient civilizations, and diverse culture. The country has a diverse landscape, including deserts, rivers, and fertile plains. Iraq has made significant contributions to human civilization, with ancient Mesopotamia being the cradle of civilization and home to the world's earliest known writing system."

    case "Japan":
        descriptionLabel.text = "Japan is an island country in East Asia located in the Pacific Ocean. It consists of four main islands and numerous smaller ones, with Tokyo being the capital and largest city. Japan is known for its rich cultural heritage, cutting-edge technology, and stunning natural landscapes. The country has a unique blend of tradition and modernity, with ancient temples and shrines coexisting with futuristic skyscrapers. Japan has made significant contributions to art, literature, cuisine, and technology, with innovations such as sushi, anime, and robotics gaining international acclaim."

    case "Jordan":
        descriptionLabel.text = "Jordan, officially known as the Hashemite Kingdom of Jordan, is a country in the Middle East. It is bordered by Saudi Arabia to the south and east, Iraq to the northeast, Syria to the north, and Israel and Palestine to the west. The capital city is Amman, the largest city in Jordan and its cultural, political, and economic center. Jordan is known for its rich history, ancient landmarks, and stunning desert landscapes. The country has a diverse culture, with influences from Arab, Bedouin, and Ottoman civilizations shaping its language, cuisine, and traditions."

    case "Kuwait":
        descriptionLabel.text = "Kuwait, officially known as the State of Kuwait, is a country in Western Asia. It is bordered by Iraq to the north and west, Saudi Arabia to the south, and the Persian Gulf to the east. The capital city is Kuwait City, the largest city in Kuwait and its political, cultural, and economic center. Kuwait is known for its rich oil reserves, modern architecture, and vibrant cultural scene. The country has a diverse population, with Kuwaiti nationals and expatriates from various countries contributing to its multicultural society."

    case "Palestine":
        descriptionLabel.text = "Palestine is a geographical region in Western Asia located between the Mediterranean Sea to the west and the Jordan River to the east. It includes the State of Palestine and the Gaza Strip. The capital city of the State of Palestine is Ramallah, while Gaza City serves as the administrative center of the Gaza Strip. Palestine has a rich history, with Jerusalem being one of the oldest cities in the world and a holy site for Judaism, Christianity, and Islam. The region has been a focal point of conflict due to competing claims and geopolitical interests."

    case "Qatar":
        descriptionLabel.text = "Qatar, officially known as the State of Qatar, is a country located in Western Asia on the northeastern coast of the Arabian Peninsula. It is bordered by Saudi Arabia to the south and the Persian Gulf to the north. The capital city is Doha, the largest city in Qatar and its political, cultural, and economic center. Qatar is known for its modern skyline, luxurious shopping malls, and vibrant cultural scene. The country has a high standard of living, with a diverse population and a thriving expatriate community contributing to its cosmopolitan atmosphere."

 case "Bahamas":
    descriptionLabel.text = "The Bahamas is an archipelago nation located in the Atlantic Ocean, known for its stunning beaches, clear turquoise waters, and vibrant marine life. The capital city is Nassau, situated on New Providence Island. The Bahamas offer a range of experiences, from relaxing on pristine beaches to exploring historic sites like Fort Charlotte and diving in the crystal-clear waters of the Exuma Cays Land and Sea Park. The country's culture is a fusion of African, British, and Caribbean influences, reflected in its music, cuisine, and festivals."

case "Belize":
    descriptionLabel.text = "Belize, located on the northeastern coast of Central America, is a country known for its rich biodiversity, ancient Mayan ruins, and stunning coral reefs. The capital city is Belmopan, while Belize City is the largest urban center. Belize's diverse landscapes include lush rainforests, rolling hills, and the second-largest barrier reef system in the world. The country's culture is a melting pot of Mayan, Creole, Garifuna, and Mestizo influences, evident in its food, music, and traditions."

case "Canada":
    descriptionLabel.text = "Canada, the second-largest country in the world, is renowned for its natural beauty, multicultural cities, and high quality of life. Ottawa serves as the capital city, while Toronto is the largest urban center. Canada's vast and diverse landscape encompasses majestic mountains, pristine lakes, and vast forests. The country's cultural mosaic is shaped by indigenous peoples, French and British settlers, and immigrants from around the globe, contributing to a rich tapestry of traditions, languages, and cuisines."

case "Costa Rica":
    descriptionLabel.text = "Costa Rica, situated in Central America between Nicaragua and Panama, is known for its stunning natural beauty, eco-friendly ethos, and adventurous spirit. The capital city is San José, while popular destinations include the lush rainforests of Monteverde and the pristine beaches of Manuel Antonio National Park. Costa Rica's commitment to sustainability is evident in its extensive network of national parks, wildlife reserves, and eco-lodges. The country's culture is influenced by indigenous, Spanish, and Afro-Caribbean traditions, reflected in its music, dance, and cuisine."

case "Cuba":
    descriptionLabel.text = "Cuba, an island nation in the Caribbean, is famous for its rich history, vibrant culture, and picturesque landscapes. Havana, the capital city, is known for its colorful colonial architecture, lively music scene, and vintage cars. Cuba's diverse landscapes range from pristine beaches and tobacco fields to lush mountains and UNESCO-listed colonial towns. The country's culture is a blend of Spanish, African, and indigenous influences, evident in its music, dance, and cuisine."

case "Dominica":
    descriptionLabel.text = "Dominica, often called the 'Nature Island of the Caribbean,' is known for its lush rainforests, sparkling waterfalls, and vibrant underwater world. Roseau serves as the capital and largest city. Dominica offers abundant opportunities for eco-tourism, including hiking through the Morne Trois Pitons National Park, diving in the Champagne Reef, and exploring the Boiling Lake. The country's culture is influenced by African, French, and indigenous Kalinago traditions, reflected in its music, art, and cuisine."

case "El Salvador":
    descriptionLabel.text = "El Salvador, the smallest and most densely populated country in Central America, is known for its rich cultural heritage, stunning landscapes, and warm hospitality. San Salvador is the capital and largest city. El Salvador's diverse geography includes volcanoes, lakes, and Pacific beaches, offering opportunities for surfing, hiking, and wildlife spotting. The country's culture is a blend of indigenous, Spanish, and mestizo influences, reflected in its art, music, and cuisine."

case "Grenada":
    descriptionLabel.text = "Grenada, known as the 'Spice Isle,' is a Caribbean nation famous for its fragrant spices, pristine beaches, and lush rainforests. St. George's serves as the capital and largest city. Grenada's volcanic landscape provides fertile soil for nutmeg, cloves, and cinnamon, which are grown across the island. Visitors can explore historic forts, snorkel in crystal-clear waters, and hike through tropical forests. The country's culture is influenced by African, French, and British traditions, evident in its cuisine, festivals, and architecture."

case "Guatemala":
    descriptionLabel.text = "Guatemala, situated in Central America, is a country of rich cultural heritage and natural beauty. Guatemala City serves as its capital and largest city. The country is renowned for its ancient Mayan ruins, such as the impressive Tikal archaeological site. Guatemala's landscape is diverse, encompassing towering volcanoes, dense rainforests, and picturesque highlands. Its people, with a blend of indigenous and Spanish influences, contribute to a vibrant culture showcased in its colorful textiles, traditional music, and delicious cuisine."

case "Haiti":
    descriptionLabel.text = "Haiti, located on the island of Hispaniola in the Caribbean, shares the island with the Dominican Republic to the east. Port-au-Prince serves as the capital and largest city, known for its vibrant arts scene and historical landmarks. Haiti's landscape features mountain ranges, waterfalls, and stunning beaches, attracting tourists seeking both relaxation and adventure. The country has a rich cultural heritage influenced by African, French, and indigenous Taíno traditions, reflected in its music, dance, and cuisine."

case "Mexico":
    descriptionLabel.text = "Mexico, a country in North America, is famous for its rich history, diverse culture, and stunning landscapes. Mexico City serves as the capital and largest city, renowned for its historic center and pre-Columbian ruins. Mexico's landscape includes deserts, mountains, and beautiful coastlines along both the Pacific Ocean and the Gulf of Mexico. The country's culture is a blend of indigenous Mesoamerican, Spanish colonial, and modern influences, reflected in its art, architecture, and cuisine."

case "Panama":
    descriptionLabel.text = "Panama, located in Central America, is known for its iconic canal connecting the Atlantic and Pacific oceans, as well as its biodiversity and vibrant urban centers. Panama City serves as the capital and largest city, boasting a modern skyline juxtaposed with colonial architecture. Panama's natural beauty includes tropical rainforests, pristine beaches, and diverse wildlife in places like the Darién Gap. The country's culture is a fusion of indigenous, African, European, and Asian influences, evident in its festivals, cuisine, and traditions."

case "United States":
    descriptionLabel.text = "The United States, a vast country in North America, is known for its cultural diversity, iconic landmarks, and dynamic cities. Washington, D.C., serves as the capital, while New York City is the largest urban center. The U.S. boasts diverse landscapes, ranging from towering skyscrapers in urban centers to breathtaking national parks like Yellowstone and the Grand Canyon. The country's culture is shaped by a melting pot of ethnicities, resulting in a rich tapestry of traditions, languages, and cuisines."

    case "Argentina":
        descriptionLabel.text = "Argentina, officially the Argentine Republic, is a country in South America. It is bordered by Chile to the west, Bolivia to the northwest, Paraguay to the north, Brazil to the northeast and east, and Uruguay to the northeast. The capital is Buenos Aires, the largest city and cultural, political, and economic center of Argentina. Argentina is known for its vast plains, imposing Andes mountains, Iguazú Falls, and rich culture, with influences from indigenous, Spanish, and Italian peoples shaping its language, cuisine, and traditions. It is a popular destination for tango dancing, wine tasting, and exploring historical sites."

    case "Bolivia":
        descriptionLabel.text = "Bolivia, officially known as the Plurinational State of Bolivia, is a landlocked country in South America. It is bordered by Brazil to the east, Paraguay and Argentina to the south, Chile to the southwest, Peru to the west, and northwest. The capital is Sucre, while the largest city is La Paz. Bolivia is known for its diverse landscapes, including the Andes, Lake Titicaca, the Amazon rainforest, and the Uyuni Salt Flats. The country has a rich cultural heritage, with influences from indigenous, Spanish, and African civilizations shaping its language, cuisine, and traditions. Bolivia is a paradise for adventure seekers, offering opportunities for trekking, mountain climbing, and exploring ancient ruins."

    case "Brazil":
        descriptionLabel.text = "Brazil, officially the Federative Republic of Brazil, is the largest country in South America and the fifth largest in the world by area. It is bordered by all South American countries except Chile and Ecuador. The capital is Brasília, while the largest city is São Paulo. Brazil is known for its cultural diversity, the Amazon rainforest, pristine beaches, and the famous Carnival festival. The country has a rich cultural heritage, with influences from indigenous, African, Portuguese, and European peoples shaping its language, cuisine, and traditions. Visitors can enjoy samba music, football matches, and exploring the iconic Christ the Redeemer statue."

    case "Chile":
        descriptionLabel.text = "Chile is a long, narrow country stretching along South America's western edge, with the Andes Mountains to the east and the Pacific Ocean to the west. It is bordered by Peru to the north, Bolivia to the northeast, Argentina to the east, and the Drake Passage in the far south. The capital is Santiago, the largest city and cultural, political, and economic center of Chile. Chile is known for its varied landscapes, ranging from the Atacama Desert in the north to the fjords and glaciers of Patagonia in the south. The country has a rich cultural heritage, with influences from indigenous, Spanish, and European civilizations shaping its language, cuisine, and traditions. Chile is a paradise for nature lovers, offering opportunities for skiing, wine tasting, and exploring Easter Island's mysterious Moai statues."

    case "Colombia":
        descriptionLabel.text = "Colombia is a country in South America bordered by Venezuela and Brazil to the east, Peru and Ecuador to the south, Panama, and the Caribbean Sea to the north. The capital is Bogotá, the largest city and cultural, political, and economic center of Colombia. Colombia is known for its biodiversity, Andes Mountains, Caribbean and Pacific coastlines, and rich culture, with influences from indigenous, Spanish, and African civilizations shaping its language, music, and traditions. Visitors can explore colonial cities, hike to ancient ruins, and enjoy vibrant festivals like the Carnaval de Barranquilla."

    case "Ecuador":
        descriptionLabel.text = "Ecuador is a country in South America bordered by Colombia to the north, Peru to the east and south, and the Pacific Ocean to the west. The capital is Quito, the largest city and cultural, political, and economic center of Ecuador. Ecuador is known for its diverse geography, including the Andes, the Amazon rainforest, and the Galápagos Islands. The country has a rich cultural heritage, with influences from indigenous, Spanish, and African civilizations shaping its language, cuisine, and traditions. Ecuador is a paradise for wildlife enthusiasts, offering opportunities for birdwatching, snorkeling, and exploring indigenous markets."

    case "Guyana":
        descriptionLabel.text = "Guyana is a country in South America located north of Trinidad and Tobago. The capital is Georgetown, the largest city and administrative center of Guyana. Guyana is known as the 'Land of Many Waters' due to its abundant water resources, including rivers and waterfalls. The country has a diverse culture, with influences from African, French, and British civilizations shaping its language, cuisine, and traditions. Guyana is a paradise for eco-tourism, offering opportunities for jungle trekking, birdwatching, and exploring historic plantations."

    case "Paraguay":
        descriptionLabel.text = "Paraguay is a landlocked country in South America bordered by Brazil to the east and northeast, Argentina to the south and west, and Bolivia to the northwest. The capital is Asunción, the largest city and cultural, political, and economic center of Paraguay. Paraguay is known for its colonial history, baroque architecture, vast wilderness, and Guarani culture. The country has a rich culture, with influences from Guarani, Spanish, and European civilizations shaping its language, cuisine, and traditions. Paraguay is a paradise for outdoor enthusiasts, offering opportunities for exploring Jesuit ruins, river cruises, and experiencing traditional Guarani festivals."

    case "Peru":
        descriptionLabel.text = "Peru is a country in South America bordered by Ecuador and Colombia to the north, Brazil to the east, Bolivia to the southeast, Chile to the south, and the Pacific Ocean to the west. The capital is Lima, the largest city and cultural, political, and economic center of Peru. Peru is known for its ancient civilizations, including the Incas, its iconic ruins such as Machu Picchu, its vibrant culture, and diverse cuisine. The country has a rich cultural heritage, with influences from indigenous, Spanish, and African civilizations shaping its language, cuisine, and traditions. Peru is a paradise for history enthusiasts, offering opportunities to explore ancient archaeological sites, trek through the Andes Mountains, and indulge in delicious Peruvian cuisine like ceviche and lomo saltado."

    case "Suriname":
    descriptionLabel.text = "Suriname is a country on the northeastern Atlantic coast of South America. It is bordered by French Guiana to the east, Guyana to the west, Brazil to the south, and the Atlantic Ocean to the north. The capital is Paramaribo, the largest city and cultural, political, and economic center of Suriname. Suriname is known for its ethnic diversity, lush rainforests, and colonial architecture. The country has a diverse culture, with influences from indigenous, African, Indian, Dutch, and Javanese civilizations shaping its language, cuisine, and traditions. Suriname is a paradise for nature lovers, offering opportunities for jungle exploration, river cruises, and birdwatching in pristine rainforests."

case "Uruguay":
    descriptionLabel.text = "Uruguay is a country in South America bordered by Argentina to the west, Brazil to the north, and the Atlantic Ocean to the southeast. The capital is Montevideo, the largest city and cultural, political, and economic center of Uruguay. Uruguay is known for its progressive social policies, vibrant culture, and beautiful coastline. The country has a rich cultural heritage, with influences from indigenous, Spanish, and European civilizations shaping its language, cuisine, and traditions. Uruguay is a paradise for beachgoers, offering miles of sandy beaches, as well as opportunities for wine tasting, tango dancing, and exploring charming colonial towns."

case "Venezuela":
    descriptionLabel.text = "Venezuela is a country on the northern coast of South America. It is bordered by Colombia to the west, Brazil to the south, Guyana to the east, and the Caribbean Sea to the north. The capital is Caracas, the largest city and cultural, political, and economic center of Venezuela. Venezuela is known for its diverse geography, including the Andes Mountains, the Amazon rainforest, and the Orinoco River. The country has a rich cultural heritage, with influences from indigenous, Spanish, African, and Caribbean civilizations shaping its language, cuisine, and traditions. Venezuela is a paradise for outdoor enthusiasts, offering opportunities for trekking, birdwatching, and exploring stunning natural landscapes."


    case "Australia":
        descriptionLabel.text = "Australia, officially known as the Commonwealth of Australia, is a country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands. It is the largest country in Oceania and the world's sixth-largest country by total area. The capital is Canberra, while the largest city is Sydney. Australia is known for its stunning natural landscapes, including the Great Barrier Reef, Uluru, and the Outback. The country has a diverse culture, with influences from Indigenous Australian, British, and multicultural communities shaping its language, cuisine, and traditions."

    case "Fiji":
        descriptionLabel.text = "Fiji is an island country in Melanesia in the South Pacific Ocean. It is composed of 333 islands, with the two largest being Viti Levu and Vanua Levu. The capital and largest city is Suva. Fiji is known for its stunning beaches, vibrant coral reefs, and rich cultural heritage. The country has a diverse culture, with influences from Indigenous Fijian, Indian, Chinese, and European communities shaping its language, cuisine, and traditions."

    case "Kiribati":
        descriptionLabel.text = "Kiribati is a sovereign state in Micronesia in the central Pacific Ocean. The country comprises 33 atolls and reef islands, with the capital and largest city being South Tarawa. Kiribati is known for its pristine coral atolls, abundant marine life, and unique culture. The country has a rich cultural heritage, with influences from Micronesian, Polynesian, and British colonial influences shaping its language, cuisine, and traditions."

    case "Marshall Islands":
        descriptionLabel.text = "The Marshall Islands is a sovereign country in Oceania, located near the equator in the Pacific Ocean. The country is composed of 29 atolls and five islands, with the capital and largest city being Majuro. The Marshall Islands are known for their stunning coral reefs, World War II historical sites, and traditional Marshallese culture. The country has a unique cultural heritage, with influences from Micronesian, American, and Japanese cultures shaping its language, cuisine, and traditions."

    case "Micronesia":
        descriptionLabel.text = "Micronesia is a subregion of Oceania, comprising thousands of small islands in the western Pacific Ocean. It includes four sovereign states: the Federated States of Micronesia, Palau, Marshall Islands, and Kiribati. Micronesia is known for its stunning coral reefs, diverse marine life, and rich cultural heritage. The region has a diverse culture, with influences from Micronesian, Polynesian, and Western cultures shaping its language, cuisine, and traditions."

    case "Nauru":
        descriptionLabel.text = "Nauru is a tiny island country in Micronesia, located in the Central Pacific. It is the third smallest country in the world by land area. The capital and largest city is Yaren. Nauru is known for its phosphate mining industry, stunning coral reefs, and traditional Nauruan culture. The country has a unique cultural heritage, with influences from Micronesian, Polynesian, and European cultures shaping its language, cuisine, and traditions."

    case "New Zealand":
        descriptionLabel.text = "New Zealand is a sovereign island country in the southwestern Pacific Ocean. It comprises two main landmasses—the North Island and the South Island—and numerous smaller islands. The capital is Wellington, while the largest city is Auckland. New Zealand is known for its stunning natural landscapes, including fjords, mountains, and beaches, as well as its vibrant Maori culture. The country has a diverse culture, with influences from Maori, European, Pacific Island, and Asian communities shaping its language, cuisine, and traditions."

    case "Palau":
        descriptionLabel.text = "Palau is an island country in the western Pacific Ocean, located in the Micronesia subregion. It is composed of over 340 islands, with the most populous being Koror. Palau is known for its pristine coral reefs, World War II historical sites, and vibrant marine life. The country has a rich cultural heritage, with influences from Micronesian, Asian, and European cultures shaping its language, cuisine, and traditions."

    case "Samoa":
        descriptionLabel.text = "Samoa, officially the Independent State of Samoa, is a country consisting of two main islands—Upolu and Savai'i—and four smaller islands. The capital and largest city is Apia. Samoa is known for its lush tropical landscapes, stunning beaches, and traditional Polynesian culture. The country has a rich cultural heritage, with influences from Polynesian, European, and Christian traditions shaping its language, cuisine, and customs."

  case "Solomon Islands":
    descriptionLabel.text = "The Solomon Islands is a sovereign country consisting of a large archipelago in Oceania, situated to the east of Papua New Guinea and northwest of Vanuatu. The capital and largest city is Honiara, located on the island of Guadalcanal. The Solomon Islands are known for their stunning coral reefs, lush rainforests, and rich cultural heritage. The country has a diverse population with over 70 distinct languages spoken, reflecting its Melanesian, Polynesian, and Micronesian influences. Traditional practices and customs remain integral to Solomon Islands' society, including rituals, music, and storytelling."

case "Tonga":
    descriptionLabel.text = "Tonga, officially the Kingdom of Tonga, is a Polynesian sovereign state composed of 169 islands, of which 36 are inhabited. The capital and largest city is Nuku'alofa. Tonga is known for its stunning coral reefs, pristine beaches, and rich Polynesian culture. The country has a unique cultural heritage, with influences from Polynesian, European, and Christian traditions shaping its language, cuisine, and customs."

case "Tuvalu":
    descriptionLabel.text = "Tuvalu is a Polynesian island country located in the Pacific Ocean, situated midway between Hawaii and Australia. It is composed of nine atolls and reef islands, with the capital being Funafuti. Tuvalu is known for its low-lying atolls, stunning marine biodiversity, and traditional Polynesian culture. The country has a rich cultural heritage, with influences from Polynesian, Micronesian, and European cultures shaping its language, cuisine, and traditions."

case "Vanuatu":
    descriptionLabel.text = "Vanuatu is a South Pacific Ocean nation consisting of approximately 80 islands, with the capital and largest city being Port Vila. Vanuatu is known for its stunning tropical landscapes, active volcanoes, and diverse indigenous cultures. The country has a rich cultural heritage, with influences from Melanesian, Polynesian, and European cultures shaping its language, cuisine, and traditions."

case "Antarctica":
    descriptionLabel.text = "Antarctica, Earth's southernmost continent, is renowned for its extreme conditions and pristine wilderness. It's the coldest, windiest, and driest place on the planet, with temperatures dropping as low as -80°C (-112°F) and winds reaching over 320 km/h (200 mph). Despite its harsh environment, Antarctica supports a diverse array of wildlife, including penguins, seals, and whales. Scientific research conducted in this region provides invaluable insights into climate change and Earth's ecosystems. Governed by the Antarctic Treaty System, research stations from various countries collaborate to explore this unique continent. Antarctica represents a captivating frontier for scientific discovery and international cooperation."


      default:
          // Handle the case for other countries
          descriptionLabel.text = "Description for other countries."
      }

          // Add description view when button is tapped
          view.addSubview(descriptionView)
          NSLayoutConstraint.activate([
              descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              descriptionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
              descriptionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
          ])

          // Add description label to the description view
          descriptionView.addSubview(descriptionLabel)
          NSLayoutConstraint.activate([
              descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 20),
              descriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -20),
              descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 20),
              descriptionLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -20)
          ])
      }
    func populateData() {
     // Set country name
    countryLabel.text = countryName;
   


    
    var backgroundImage: UIImage?
     switch countryName {
     case "Algeria":

         flagImageName = "algeria"
         countryImageName = "alg"
         // Set background image for Algeria
         backgroundImage = UIImage(named: "alg")
     case "Morocco":
         // Set background image for Morocco
         flagImageName = "morocco"
         countryImageName = "mar"
         backgroundImage = UIImage(named: "mar")
     case "Angola":
         // Set background image for Angola
         flagImageName = "angola"
         backgroundImage = UIImage(named: "ang")
     case "Cabo Verde":
        
         // Set background image for Cabo Verde
         flagImageName = "cabo_verde"
         backgroundImage = UIImage(named: "cap")
     case "Comoros":
         
         // Set background image for Comoros
         backgroundImage = UIImage(named: "com")
         flagImageName = "comoros"
     case "Egypt":
         
         // Set background image for Egypt
         backgroundImage = UIImage(named: "egy")
         // Set flag image for Egypt
         flagImageName = "egypt"
     case "Ethiopia":
        
         // Set background image for Ethiopia
         backgroundImage = UIImage(named: "eth")
         // Set flag image for Ethiopia
         flagImageName = "ethiopia"
     case "Gabon":
         // Set background image for Gabon
         backgroundImage = UIImage(named: "gab")
             // Set flag image for Gabon
             flagImageName = "gabon"
         case "Ivory Coast":
             // Set background image for Ivory Coast
             backgroundImage = UIImage(named: "cot")
             // Set flag image for Ivory Coast
             flagImageName = "ivory_coast"
         case "Mauritania":
             // Set background image for Mauritania
             backgroundImage = UIImage(named: "mau")
             // Set flag image for Mauritania
             flagImageName = "mauritania"
         case "Senegal":
             
             // Set background image for Senegal
             backgroundImage = UIImage(named: "sen")
             // Set flag image for Senegal
             flagImageName = "senegal"
         case "Tunisia":
             
             // Set background image for Tunisia
             backgroundImage = UIImage(named: "tun")
             // Set flag image for Tunisia
             flagImageName = "tunisia"
     case "Albania":
         // Set background image for Albania
         backgroundImage = UIImage(named: "alb")
         // Set flag image for Albania
         flagImageName = "albania"
     case "Austria":
         // Set description for Austria
         descriptionLabel.text = "Austria is a Central European country famous for its picturesque Alpine landscapes, historic cities like Vienna and Salzburg, and classical music heritage."
         // Set background image for Austria
         backgroundImage = UIImage(named: "aus")
         // Set flag image for Austria
         flagImageName = "austria"
     case "Bulgaria":
         // Set description for Bulgaria
         descriptionLabel.text = "Bulgaria is a country in Southeast Europe known for its diverse landscapes, including mountains, rivers, and beaches, as well as its rich history and cultural traditions."
         // Set background image for Bulgaria
         backgroundImage = UIImage(named: "bul")
         // Set flag image for Bulgaria
         flagImageName = "bulgaria"
     case "Croatia":
         // Set description for Croatia
         descriptionLabel.text = "Croatia is a European country known for its stunning Adriatic coastline, medieval cities, and beautiful national parks, making it a popular tourist destination."
         // Set background image for Croatia
         backgroundImage = UIImage(named: "cro")
         // Set flag image for Croatia
         flagImageName = "croatia"
     case "Denmark":
         // Set description for Denmark
         descriptionLabel.text = "Denmark is a Scandinavian country known for its fairy-tale-like castles, colorful harbor towns, and progressive society, as well as being the birthplace of the Lego."
         // Set background image for Denmark
         backgroundImage = UIImage(named: "den")
         // Set flag image for Denmark
         flagImageName = "denmark"
     case "Finland":
         // Set description for Finland
         descriptionLabel.text = "Finland, the land of a thousand lakes, is a Nordic country known for its stunning natural beauty, saunas, and Northern Lights, as well as its strong design and technology sectors."
         // Set background image for Finland
         backgroundImage = UIImage(named: "fin")
         // Set flag image for Finland
         flagImageName = "finland"
     case "Germany":
         // Set description for Germany
         descriptionLabel.text = "Germany is a Central European country known for its rich history, vibrant cities like Berlin and Munich, cultural landmarks, and contributions to science and the arts."
         // Set background image for Germany
         backgroundImage = UIImage(named: "ger")
         // Set flag image for Germany
         flagImageName = "germany"
     case "Italy":
         // Set description for Italy
         descriptionLabel.text = "Italy is a Southern European country known for its ancient ruins, Renaissance art and architecture, delicious cuisine, and scenic landscapes, including the iconic canals of Venice and the rolling hills of Tuscany."
         // Set background image for Italy
         backgroundImage = UIImage(named: "ita")
         // Set flag image for Italy
         flagImageName = "italy"
     case "Netherlands":
         // Set description for Netherlands
         descriptionLabel.text = "The Netherlands, often referred to as Holland, is a European country known for its flat landscape, extensive canal systems, tulip fields, windmills, and vibrant cities like Amsterdam."
         // Set background image for Netherlands
         backgroundImage = UIImage(named: "net")
         // Set flag image for Netherlands
         flagImageName = "netherlands"
     case "Spain":
         // Set description for Spain
         descriptionLabel.text = "Spain is a European country known for its diverse culture, stunning beaches, historic landmarks, vibrant festivals, and delicious cuisine, including paella and tapas."
         // Set background image for Spain
         backgroundImage = UIImage(named: "spa")
         // Set flag image for Spain
         flagImageName = "spain"
     case "Sweden":
         // Set description for Sweden
         descriptionLabel.text = "Sweden is a Scandinavian country known for its beautiful landscapes, including forests, lakes, and islands, as well as its commitment to sustainability, innovation, and social welfare."
         // Set background image for Sweden
         backgroundImage = UIImage(named: "swe")
         // Set flag image for Sweden
         flagImageName = "sweden"
     case "Switzerland":
         // Set description for Switzerland
         descriptionLabel.text = "Switzerland, a land of mountains and lakes, is a Central European country known for its breathtaking Alpine scenery, chocolate, cheese, precision watches, and efficient public transportation."
         // Set background image for Switzerland
         backgroundImage = UIImage(named: "swi")
         // Set flag image for Switzerland
         flagImageName = "switzerland"
     case "Armenia":
         // Set description for Armenia
         descriptionLabel.text = "Armenia, located in the South Caucasus region of Eurasia, is known for its rich history, ancient Christian heritage, and stunning landscapes including the scenic Lake Sevan and Mount Ararat."
         // Set background image for Armenia
         backgroundImage = UIImage(named: "arm")
         // Set flag image for Armenia
         flagImageName = "armenia"
     case "China":
         // Set description for China
         descriptionLabel.text = "China, the world's most populous country, is a vast land of diverse cultures, ancient landmarks such as the Great Wall and the Terracotta Army, bustling modern cities, and delicious cuisine."
         // Set background image for China
         backgroundImage = UIImage(named: "chi")
         // Set flag image for China
         flagImageName = "china"
     case "India":
         // Set description for India
         descriptionLabel.text = "India, known for its vibrant culture, diverse landscapes, and rich history, is home to iconic landmarks such as the Taj Mahal, bustling cities like Mumbai and Delhi, and a myriad of languages and traditions."
         // Set background image for India
         backgroundImage = UIImage(named: "ind")
         // Set flag image for India
         flagImageName = "india"
     case "Iran":
         // Set description for Iran
         descriptionLabel.text = "Iran, situated in the Middle East, boasts a rich cultural heritage, stunning architecture such as the ancient city of Persepolis, and a diverse landscape that includes deserts, mountains, and lush forests."
         // Set background image for Iran
         backgroundImage = UIImage(named: "ira")
         // Set flag image for Iran
         flagImageName = "iran"
     case "Iraq":
         // Set description for Iraq
         descriptionLabel.text = "Iraq, with its ancient Mesopotamian history, is a land of fertile plains, historic cities like Baghdad and Babylon, and significant cultural sites such as the Ziggurat of Ur and the Citadel of Erbil."
         // Set background image for Iraq
         backgroundImage = UIImage(named: "iraqq")
         // Set flag image for Iraq
         flagImageName = "iraq"
     case "Japan":
         // Set description for Japan
         descriptionLabel.text = "Japan, an island nation in East Asia, is renowned for its unique blend of traditional culture and modernity, stunning natural scenery, delicious cuisine including sushi and ramen, and cutting-edge technology."
         // Set background image for Japan
         backgroundImage = UIImage(named: "jap")
         
         // Set flag image for Japan
         flagImageName = "japan"
     case "Jordan":
         // Set description for Jordan
         descriptionLabel.text = "Jordan, located in the Middle East, is famed for its ancient archaeological sites such as Petra and Jerash, picturesque desert landscapes, and the tranquil waters of the Dead Sea."
         // Set background image for Jordan
         backgroundImage = UIImage(named: "jor")
         // Set flag image for Jordan
         flagImageName = "jordan"
     case "Kuwait":
         // Set description for Kuwait
         descriptionLabel.text = "Kuwait, a small but wealthy country in the Arabian Gulf, is known for its modern skyline dominated by sleek towers, rich oil reserves, and a vibrant cultural scene."
         // Set background image for Kuwait
         backgroundImage = UIImage(named: "kuw")
         // Set flag image for Kuwait
         flagImageName = "kuwait"
     case "Palestine":
         // Set description for Palestine
         descriptionLabel.text = "Palestine, a region in the Middle East, is known for its longstanding political conflict, historic landmarks such as the Dome of the Rock, and vibrant cultural heritage."
         // Set background image for Palestine
         backgroundImage = UIImage(named: "pal")
         // Set flag image for Palestine
         flagImageName = "palestine"
     case "Qatar":
         // Set description for Qatar
         descriptionLabel.text = "Qatar, a wealthy peninsula nation in the Arabian Gulf, is renowned for its futuristic skyline, luxury shopping, modern architecture, and hosting major international sporting events such as the FIFA World Cup."
         // Set background image for Qatar
         backgroundImage = UIImage(named: "qat")
         // Set flag image for Qatar
         flagImageName = "qatar"
     case "Bahamas":
         // Set description for Bahamas
         descriptionLabel.text = "The Bahamas, an archipelago in the Caribbean, is famous for its stunning white-sand beaches, crystal-clear turquoise waters, vibrant coral reefs, and laid-back island atmosphere."
         // Set background image for Bahamas
         backgroundImage = UIImage(named: "bah")
         // Set flag image for Bahamas
         flagImageName = "bahamas"
     case "Belize":
         // Set description for Belize
         descriptionLabel.text = "Belize, located on the eastern coast of Central America, is known for its lush jungles, ancient Mayan ruins such as Caracol and Xunantunich, and the stunning Belize Barrier Reef."
         // Set background image for Belize
         backgroundImage = UIImage(named: "bel")
         // Set flag image for Belize
         flagImageName = "belize"
     case "Canada":
         // Set description for Canada
         descriptionLabel.text = "Canada, the second-largest country in the world, is renowned for its breathtaking natural landscapes, multicultural cities like Toronto and Vancouver, and friendly people."
         // Set background image for Canada
         backgroundImage = UIImage(named: "can")
         // Set flag image for Canada
         flagImageName = "canada"
     case "Costa Rica":
         // Set description for Costa Rica
         descriptionLabel.text = "Costa Rica, located in Central America, is celebrated for its incredible biodiversity, lush rainforests, pristine beaches, and adventure activities such as zip-lining and surfing."
         // Set background image for Costa Rica
         backgroundImage = UIImage(named: "cos")
         // Set flag image for Costa Rica
         flagImageName = "costa_rica"
     case "Cuba":
         // Set description for Cuba
         descriptionLabel.text = "Cuba, an island nation in the Caribbean, is famous for its vintage cars, colorful architecture in Havana, lively music and dance scenes, and pristine beaches."
         // Set background image for Cuba
         backgroundImage = UIImage(named: "cub")
         // Set flag image for Cuba
         flagImageName = "cuba"
     case "Dominica":
         // Set description for Dominica
         descriptionLabel.text = "Dominica, known as the 'Nature Island' of the Caribbean, is celebrated for its lush rainforests, pristine rivers and waterfalls, and vibrant marine life."
         // Set background image for Dominica
         backgroundImage = UIImage(named: "dom")
         // Set flag image for Dominica
         flagImageName = "dominica"
     case "El Salvador":
         // Set description for El Salvador
         descriptionLabel.text = "El Salvador, the smallest and most densely populated country in Central America, is renowned for its Pacific Ocean beaches, volcanic landscapes, and vibrant cultural heritage."
         // Set background image for El Salvador
         backgroundImage = UIImage(named: "els")
         // Set flag image for El Salvador
         flagImageName = "el_salvador"
     case "Grenada":
         // Set description for Grenada
         descriptionLabel.text = "Grenada, located in the Caribbean, is known for its stunning beaches, lush rainforests, and flavorful spices such as nutmeg, earning it the nickname 'Spice Isle'."
         // Set background image for Grenada
         backgroundImage = UIImage(named: "gre")
         // Set flag image for Grenada
         flagImageName = "grenada"
     case "Guatemala":
         // Set description for Guatemala
         descriptionLabel.text = "Guatemala, located in Central America, is famous for its ancient Mayan ruins such as Tikal, colorful indigenous markets, volcanic landscapes, and rich cultural heritage."
         // Set background image for Guatemala
         backgroundImage = UIImage(named: "gua")
         // Set flag image for Guatemala
         flagImageName = "guatemala"
     case "Haiti":
         // Set description for Haiti
         descriptionLabel.text = "Haiti, located on the island of Hispaniola in the Caribbean, is known for its vibrant art scene, historic landmarks such as the Citadelle Laferrière, and stunning beaches."
         // Set background image for Haiti
         backgroundImage = UIImage(named: "hai")
         // Set flag image for Haiti
         flagImageName = "haiti"
     case "Mexico":
         // Set description for Mexico
         descriptionLabel.text = "Mexico, a country in North America, is famed for its ancient ruins such as Chichen Itza and Teotihuacan, vibrant culture, delicious cuisine, and diverse landscapes ranging from deserts to tropical beaches."
         // Set background image for Mexico
         backgroundImage = UIImage(named: "mex")
         // Set flag image for Mexico
         flagImageName = "mexico"
     case "Panama":
         // Set description for Panama
         descriptionLabel.text = "Panama, known for its eponymous canal linking the Atlantic and Pacific oceans, is celebrated for its biodiversity in places like the Darien Gap, vibrant cities such as Panama City, and stunning beaches."
         // Set background image for Panama
         backgroundImage = UIImage(named: "pan")
         // Set flag image for Panama
         flagImageName = "panama"
     case "United States":
         // Set description for United States
         descriptionLabel.text = "The United States, a vast country in North America, is known for its diverse landscapes, iconic landmarks such as the Statue of Liberty and the Grand Canyon, vibrant cities, and cultural influence."
         // Set background image for United States
         backgroundImage = UIImage(named: "usa")
         // Set flag image for United States
         flagImageName = "united_states"
 
 // Adding cases for South American countries
case "Argentina":
    descriptionLabel.text = "Argentina, located in South America, is famous for its tango dance, beef, and gauchos. It is also home to stunning natural wonders like the Andes Mountains, Iguazu Falls, and Patagonia."
    backgroundImage = UIImage(named: "arg")
    flagImageName = "argentina"
case "Bolivia":
    descriptionLabel.text = "Bolivia, a landlocked country in South America, boasts diverse landscapes ranging from the Andes Mountains to the Amazon Basin. It is known for its rich indigenous culture and the world's largest salt flat, Salar de Uyuni."
    backgroundImage = UIImage(named: "bol")
    flagImageName = "bolivia"
case "Brazil":
    descriptionLabel.text = "Brazil, the largest country in South America, is famed for its vibrant carnival celebrations, samba music, and Amazon rainforest. It also features iconic landmarks like Christ the Redeemer statue and Copacabana Beach."
    backgroundImage = UIImage(named: "bra")
    flagImageName = "brazil"
case "Chile":
    descriptionLabel.text = "Chile, a long, narrow country stretching along South America's western edge, is known for its diverse landscapes, including the Atacama Desert, the Andes Mountains, and the Patagonia region. It's also famous for its wine production."
    backgroundImage = UIImage(named: "chil")
    flagImageName = "chile"
case "Colombia":
    descriptionLabel.text = "Colombia, located in South America, is renowned for its diverse culture, coffee production, and biodiversity. It features attractions like the historic city of Cartagena, the Amazon rainforest, and the Andean mountains."
    backgroundImage = UIImage(named: "col")
    flagImageName = "colombia"
case "Ecuador":
    descriptionLabel.text = "Ecuador, straddling the equator on South America's west coast, is known for its diverse landscapes, including the Galapagos Islands, the Andes Mountains, and the Amazon rainforest. It's also famous for its indigenous cultures."
    backgroundImage = UIImage(named: "ecu")
    flagImageName = "ecuador"
case "Guyana":
    descriptionLabel.text = "Guyana, located on the northern mainland of South America, is known for its lush rainforests, diverse wildlife, and cultural heritage. It's home to Kaieteur Falls, one of the world's largest single-drop waterfalls, and offers opportunities for eco-tourism and exploration of its pristine natural landscapes."
    backgroundImage = UIImage(named: "guy")
    flagImageName = "guyana"
case "Paraguay":
    descriptionLabel.text = "Paraguay, a landlocked country in South America, is known for its Guarani culture, Jesuit missions, and the Pantanal, one of the world's largest tropical wetland areas. It offers a mix of urban centers and rural landscapes."
    backgroundImage = UIImage(named: "par")
    flagImageName = "paraguay"
case "Peru":
    descriptionLabel.text = "Peru, located in South America, is renowned for its ancient Incan city of Machu Picchu, the Amazon rainforest, and the Nazca Lines. It boasts diverse geography, rich history, and vibrant indigenous cultures."
    backgroundImage = UIImage(named: "per")
    flagImageName = "peru"
case "Suriname":
    descriptionLabel.text = "Suriname, located on the northeastern coast of South America, is known for its dense rainforests, diverse wildlife, and multicultural society. It offers opportunities for eco-tourism and exploration of its natural wonders."
    backgroundImage = UIImage(named: "sur")
    flagImageName = "suriname"
case "Uruguay":
    descriptionLabel.text = "Uruguay, a small country in South America, is known for its laid-back lifestyle, beautiful beaches, and historic colonial towns. It's also famous for its mate tea culture and vibrant cultural scene."
    backgroundImage = UIImage(named: "uru")
    flagImageName = "uruguay"
case "Venezuela":
    descriptionLabel.text = "Venezuela, located on the northern coast of South America, is known for its stunning landscapes, including the Andes Mountains, the Amazon rainforest, and Angel Falls, the world's highest waterfall. It has a rich cultural heritage and diverse cuisine."
    backgroundImage = UIImage(named: "ven")
    flagImageName = "venezuela"

    // Adding cases for Australia and Pacific countries...
    case "Australia":
        descriptionLabel.text = "Australia, the largest country in Oceania, is known for its vast Outback, iconic landmarks such as the Sydney Opera House and the Great Barrier Reef, and diverse wildlife including kangaroos and koalas."
        backgroundImage = UIImage(named: "aust")
        flagImageName = "australia"
    case "Fiji":
        descriptionLabel.text = "Fiji, an island country in the South Pacific, is renowned for its stunning beaches, clear waters, and vibrant coral reefs. It offers opportunities for diving, snorkeling, and relaxation in a tropical paradise."
        backgroundImage = UIImage(named: "fij")
        flagImageName = "fiji"
    case "Kiribati":
        descriptionLabel.text = "Kiribati, a Pacific island nation, is known for its low-lying coral atolls, pristine beaches, and rich marine life. It faces challenges due to climate change and rising sea levels."
        backgroundImage = UIImage(named: "kir")
        flagImageName = "kiribati"
    case "Marshall Islands":
        descriptionLabel.text = "The Marshall Islands, located in the Pacific Ocean, is known for its beautiful coral reefs, World War II history, and traditional Marshallese culture. It is also facing threats from climate change."
        backgroundImage = UIImage(named: "mars")
        flagImageName = "marshall_islands"
    case "Micronesia":
        descriptionLabel.text = "Micronesia, a region in the western Pacific Ocean, is famous for its stunning natural beauty, diverse cultures, and World War II relics. It consists of thousands of small islands and atolls."
        backgroundImage = UIImage(named: "mic")
        flagImageName = "micronesia"
    case "Nauru":
        descriptionLabel.text = "Nauru, one of the world's smallest countries, is known for its phosphate mining industry and unique natural landscapes. It faces challenges related to environmental degradation and sustainability."
        backgroundImage = UIImage(named: "nau")
        flagImageName = "nauru"
    case "New Zealand":
        descriptionLabel.text = "New Zealand, a country in the southwestern Pacific Ocean, is famous for its stunning landscapes, Maori culture, and adventure sports. It offers opportunities for hiking, skiing, and exploring pristine nature."
        backgroundImage = UIImage(named: "new")
        flagImageName = "new_zealand"
    case "Palau":
        descriptionLabel.text = "Palau, an island country in the western Pacific Ocean, is known for its pristine dive sites, lush forests, and vibrant marine life. It offers opportunities for eco-tourism and adventure in a tropical paradise."
        backgroundImage = UIImage(named: "pala")
        flagImageName = "palau"
    case "Samoa":
        descriptionLabel.text = "Samoa, located in the South Pacific Ocean, is renowned for its lush rainforests, stunning waterfalls, and vibrant Polynesian culture. It offers a mix of natural beauty and cultural experiences."
        backgroundImage = UIImage(named: "sam")
        flagImageName = "samoa"
    case "Solomon Islands":
        descriptionLabel.text = "The Solomon Islands, a sovereign country consisting of a large number of islands in the South Pacific Ocean, is known for its World War II history, diverse cultures, and pristine natural beauty."
        backgroundImage = UIImage(named: "sol")
        flagImageName = "solomon_islands"
    case "Tonga":
        descriptionLabel.text = "Tonga, a Polynesian kingdom in the South Pacific Ocean, is known for its stunning beaches, coral reefs, and ancient Polynesian culture. It offers opportunities for snorkeling, diving, and cultural immersion."
        backgroundImage = UIImage(named: "ton")
        flagImageName = "tonga"
    case "Tuvalu":
        descriptionLabel.text = "Tuvalu, a small island nation in the Pacific Ocean, is known for its low-lying atolls, stunning lagoons, and friendly locals. It faces challenges related to climate change and rising sea levels."
        backgroundImage = UIImage(named: "tuv")
        flagImageName = "tuvalu"
    case "Vanuatu":
        backgroundImage = UIImage(named: "van")
        flagImageName = "vanuatu"

    case "Antarctica":
    descriptionLabel.text = "Antarctica, the southernmost continent, is characterized by its vast ice shelves, extreme cold, and unique wildlife such as penguins and seals. It is primarily governed by international treaties and is a hub for scientific research."
    backgroundImage = UIImage(named: "ant")
    flagImageName = "antarctica"
    
         default:
               // Set a default description and background image if the country is not found
               descriptionLabel.text = "Description for \(countryName) is not available."     }
     // Set flag image
     if let flagImageName = flagImageName {
         flagImageView.image = UIImage(named: flagImageName)
     } else {
         // Set a default flag image if the image name is not available
         flagImageView.image = UIImage(named: "defaultFlagImage")
     }
    
    if let countryImageName = countryImageName {
        countryImageView.image = UIImage(named: countryImageName)
    } else {
        // Set a default country image if the image name is not available
        countryImageView.image = UIImage(named: "defaultCountryImage")
    }

     if let backgroundImage = backgroundImage {
         let backgroundImageView = UIImageView(image: backgroundImage)
         backgroundImageView.contentMode = .scaleAspectFill
         backgroundImageView.frame = UIScreen.main.bounds
         backgroundImageView.clipsToBounds = true
         view.addSubview(backgroundImageView)
         view.sendSubviewToBack(backgroundImageView)
      //  backgroundImageView.alpha=0.6
     } else {
         // Set a default background color if the image is not available
         view.backgroundColor = .white
     }
 }

           
       }


// Section Model
class Section {
    let countryTitle: String
    let option: [(name: String, imageName: String)]
    var isOpened: Bool = false
    
    init(title: String, option: [(name: String, imageName: String)], isOpened: Bool = false) {
        self.countryTitle = title
        self.option = option
        self.isOpened = isOpened
    }
}

// Main View Controller
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let continentImages: [String: String] = [
        "Africa": "africa",
        "Europe": "europe",
        "Asia": "asia",
        "North America": "northamerica",
        "South America": "South_America",
        "Australia": "australia",
        "Antarctica": "antarctica"
    ]
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 let titleLabel = UILabel()
 titleLabel.text = "Countries Within Continents"
 titleLabel.textAlignment = .center
 titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
 titleLabel.translatesAutoresizingMaskIntoConstraints = false
   titleLabel.backgroundColor = .systemGray6
        
   view.addSubview(titleLabel)
        view.backgroundColor = .white

        sections = [
            Section(title: "Africa", option: [
                ("Algeria", "algeria"),
                ("Angola", "angola"),
                ("Cabo Verde", "cabo_verde"),
                ("Comoros", "comoros"),
                ("Egypt", "egypt"),
                ("Ethiopia", "ethiopia"),
                ("Gabon", "gabon"),
                ("Ivory Coast", "ivory_coast"),
                ("Mauritania", "mauritania"),
                ("Morocco", "morocco"),
                ("Senegal", "senegal"),
                ("Tunisia", "tunisia")
            ]),
            Section(title: "Europe", option: [
                ("Albania", "albania"),
                ("Austria", "austria"),
                ("Bulgaria", "bulgaria"),
                ("Croatia", "croatia"),
                ("Denmark", "denmark"),
                ("Finland", "finland"),
                ("Germany", "germany"),
                ("Italy", "italy"),
                ("Netherlands", "netherlands"),
                ("Spain", "spain"),
                ("Sweden", "sweden"),
                ("Switzerland", "switzerland")
            ]),
            Section(title: "Asia", option: [
                ("Armenia", "armenia"),
                ("China", "china"),
                ("India", "india"),
                ("Iran", "iran"),
                ("Iraq", "iraq"),
                ("Japan", "japan"),
                ("Jordan", "jordan"),
                ("Kuwait", "kuwait"),
                ("Palestine", "palestine"),
                ("Qatar", "qatar")
            ]),

            Section(title: "North America", option: [
                ("Bahamas", "bahamas"),
                ("Belize", "belize"),
                ("Canada", "canada"),
                ("Costa Rica", "costa_rica"),
                ("Cuba", "cuba"),
                ("Dominica", "dominica"),
                ("El Salvador", "el_salvador"),
                ("Grenada", "grenada"),
                ("Guatemala", "guatemala"),
                ("Haiti", "haiti"),
                ("Mexico", "mexico"),
                ("Panama", "panama"),
                ("United States", "united_states")
            ]),

            Section(title: "South America", option: [
                ("Argentina", "argentina"),
                ("Bolivia", "bolivia"),
                ("Brazil", "brazil"),
                ("Chile", "chile"),
                ("Colombia", "colombia"),
                ("Ecuador", "ecuador"),
                ("Guyana", "guyana"),
                ("Paraguay", "paraguay"),
                ("Peru", "peru"),
                ("Suriname", "suriname"),
                ("Uruguay", "uruguay"),
                ("Venezuela", "venezuela")
            ]),
            Section(title: "Australia", option: [
                ("Australia", "australia_"),
                ("Fiji", "fiji"),
                ("Kiribati", "kiribati"),
                ("Marshall Islands", "marshall_islands"),
                ("Micronesia", "micronesia"),
                ("Nauru", "nauru"),
                ("New Zealand", "new_zealand"),
                ("Palau", "palau"),
                ("Samoa", "samoa"),
                ("Solomon Islands", "solomon_islands"),
                ("Tonga", "tonga"),
                ("Tuvalu", "tuvalu"),
                ("Vanuatu", "vanuatu")
            ]),

            Section(title: "Antarctica", option: [("","")])

        
        
        
        
        ]
        
      view.addSubview(tableView)
              tableView.delegate = self
              tableView.dataSource = self
              tableView.frame = view.bounds
              tableView.translatesAutoresizingMaskIntoConstraints = false
              
              NSLayoutConstraint.activate([
                  // Title label constraints
                  titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                  titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                  titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                  
                  // Table view constraints
                  tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                  tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                  tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                  tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
              ])
          }
          
          func numberOfSections(in tableView: UITableView) -> Int {
              return sections.count
          }
          
          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              let section = sections[section]
              if section.isOpened {
                  return section.option.count + 1 // Add 1 for the continent title
              } else {
                  return 1 // Only the continent title cell
              }
          }
          
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
            
            let section = sections[indexPath.section]
            if indexPath.row == 0 {
                // Configure the cell for the continent title
                cell.countryLabel.text = section.countryTitle
                if let continentImageName = continentImages[section.countryTitle] {
                    cell.continentImageView.image = UIImage(named: continentImageName)
                } else {
                    // If image for the continent is not found, set a default image or handle it as appropriate
                    cell.continentImageView.image = UIImage(named: "default_continent_image")
                }
                cell.countryImageView.image = nil // Reset country image for continent title cell
                cell.backgroundColor = .white // Set background color to white for continent title cell
            } else {
                // Configure the cell for country
                let country = section.option[indexPath.row - 1]
                cell.countryLabel.text = country.name
                cell.countryLabel.font = UIFont(name: "Verdana", size: 16) // Change the font of the country label
                cell.continentImageView.image = nil // Reset continent image for country cell
                cell.countryImageView.image = UIImage(named: country.imageName)
                cell.backgroundColor = .white // Set background color to white for option cell
            }
            
            return cell
        }



          func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            
              let section = sections[indexPath.section]
              if indexPath.row == 0 {
                  // Toggle the isOpened property of the selected section when continent title cell is tapped
                  section.isOpened.toggle()
                  tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
                  
                  if section.isOpened && section.countryTitle == "Antarctica" {
                      // If the Antarctica section is opened, directly display the description
                      let countryDetailsVC = CountryDetailsViewController()
                      countryDetailsVC.countryName = "Antarctica"
                    countryDetailsVC.didSelectCountry("Antarctica")
                    countryDetailsVC.countryDescription = "Antarctica, Earth's southernmost continent, is renowned for its extreme conditions and pristine wilderness. It's the coldest, windiest, and driest place on the planet, with temperatures dropping as low as -80°C (-112°F) and winds reaching over 320 km/h (200 mph). Despite its harsh environment, Antarctica supports a diverse array of wildlife, including penguins, seals, and whales. Scientific research conducted in this region provides invaluable insights into climate change and Earth's ecosystems. Governed by the Antarctic Treaty System, research stations from various countries collaborate to explore this unique continent. Antarctica represents a captivating frontier for scientific discovery and international cooperation." // Set description for Antarctica here

                      // Create UINavigationController if not created already
                      if navigationController == nil {
                          let navController = UINavigationController(rootViewController: countryDetailsVC)
                          present(navController, animated: true, completion: nil)
                      } else {
                          navigationController?.pushViewController(countryDetailsVC, animated: true)
                      }
                  }
              } else {
                  // If a country cell is tapped, push the CountryDetailsViewController
                  let country = section.option[indexPath.row - 1]
                  let countryDetailsVC = CountryDetailsViewController()
                  countryDetailsVC.countryName = country.name
                countryDetailsVC.didSelectCountry(country.name)
                countryDetailsVC.countryDescription = "Description for \(country.name)" // Set country description here

                  // Create UINavigationController if not created already
                  if navigationController == nil {
                      let navController = UINavigationController(rootViewController: countryDetailsVC)
                      present(navController, animated: true, completion: nil)
                  } else {
                      navigationController?.pushViewController(countryDetailsVC, animated: true)
                  }
              }
          }


    
    
      }
