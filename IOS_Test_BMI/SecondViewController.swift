//
//  SecondViewController.swift
//  IOS_Test_BMI
//
//  Created by Nisha Tandel on 2019-12-14.
//  Copyright © 2019 Nisha TAndel. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference!
    var Personalist = [Persona]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Personalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellController
        
        let persona: Persona
        
        persona = Personalist [indexPath.row]
        cell.disName.text = persona.name
        cell.disWeight.text = persona.weight
        print(persona.weight)
        cell.disHeight.text = persona.height
        cell.disBmi.text = persona.bmi
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let currentIndex:String = Personalist[indexPath.row].id ?? ""
            print(currentIndex)
            ref.child(currentIndex).removeValue()
            Personalist.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("Persona")
        viewData()
        // Do any additional setup after loading the view.
    }
    
    func viewData() {
        self.Personalist = [Persona]()
        ref.observeSingleEvent(of: .value) { (snapshots) in
                   for case let snapshot as DataSnapshot in snapshots.children{
                    let id = snapshot.key
                       let value = snapshot.value as? NSDictionary
                    let name = value?["name"] as? String
                       let weigh = value?["weight"] as? String
                       let heigh = value?["height"] as? String
                    let bmiIndex = value?["bmi"] as? String
                    let personaObj = Persona(id: id, name: name, weight: weigh, height: heigh, bmi: bmiIndex)
                       self.Personalist.append(personaObj)
                       self.tableView.reloadData()
                   }
        }
    }
}
