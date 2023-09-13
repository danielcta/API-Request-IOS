//
//  ViewController.swift
//  atv_APIrequests
//
//  Created by COTEMIG on 08/08/23.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character_ = characterList[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "personagemCell") as? personagemTableView {
            cell.setup(character_)
            return cell
        }
        
        return UITableViewCell()
        
    }
    

    var characterList: [Character] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        
        AF.request("https://www.amiiboapi.com/api/amiibo/?name=mario").responseDecodable(of: Resultados.self){
            response in
            if let characters = response.value {
                self.characterList = characters.amiibo
                self.tableview.reloadData()
            }
        }
        
    }

   
}

struct Resultados: Codable {
    let amiibo: [Character]
}

struct Character: Codable {
    let character: String
    let amiiboSeries: String
    let image: String
}



