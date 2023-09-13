//
//  personagemTableView.swift
//  atv_APIrequests
//
//  Created by COTEMIG on 08/08/23.
//

import UIKit

class personagemTableView: UITableViewCell {
    
    
    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lblCharacterName: UILabel!
    @IBOutlet weak var lblamiiboSeries: UILabel!
    
    func setup(_ character: Character) {
        lblCharacterName.text = character.character
        lblamiiboSeries.text = character.amiiboSeries
        imgCharacter.kf.setImage(with: URL(string: character.image))
    }
}
