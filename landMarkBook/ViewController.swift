//
//  ViewController.swift
//  landMarkBook
//
//  Created by Burak Afyonlu on 11.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landMarkNames.append("Çin Seddi")
        landMarkNames.append("Kolezyum")
        landMarkNames.append("Kremlin")
        landMarkNames.append("Stone Henge")
        landMarkNames.append("Taj Mahal")
        
        landMarkImages.append(UIImage(named: "cinSeddi.jpeg")!)
        landMarkImages.append(UIImage(named: "kolezyum.jpeg")!)
        landMarkImages.append(UIImage(named: "kremlin.jpeg")!)
        landMarkImages.append(UIImage(named: "stonehenge.jpeg")!)
        landMarkImages.append(UIImage(named: "tajMahal.jpeg")!)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return landMarkNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            var content = cell.defaultContentConfiguration()
            content.text = landMarkNames[indexPath.row]
            cell.contentConfiguration = content
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            chosenLandMarkName = landMarkNames[indexPath.row]
            chosenLandMarkImage = landMarkImages[indexPath.row]
        
            performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetailsVC" {
                let destinationVC = segue.destination as! DetailsVC
                destinationVC.selectedLandMarkName = chosenLandMarkName
                destinationVC.selectedLandMarkImage = chosenLandMarkImage
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                self.landMarkNames.remove(at: indexPath.row)
                self.landMarkImages.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}

