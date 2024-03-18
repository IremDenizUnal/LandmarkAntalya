//
//  ViewController.swift
//  LandmarkAntalya
//
//  Created by ırem denız on 18.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    //defining variables
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //viewcontrollerin icindeki tanımladıgımız ozelligi kullanabilmek icin burada da tanımlıyoruz self olarak.
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Cennet Koyu")
        landmarkNames.append("Falezler")
        landmarkNames.append("Işıklar")
        landmarkNames.append("Konyaaltı")
        landmarkNames.append("Markantalya")
        
        
        landmarkImages.append(UIImage(named: "cennetkoyu.jpeg")!)
        landmarkImages.append(UIImage(named: "falezler.jpeg")!)
        landmarkImages.append(UIImage(named: "isiklar.jpeg")!)
        landmarkImages.append(UIImage(named: "konyaaltı.jpeg")!)
        landmarkImages.append(UIImage(named: "markantalya.jpeg")!)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ne gosterecegini soyluyor.
        
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //secileni ona esitliyor kaydediyor.
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toDetails", sender: nil)
    }
    
    
    //gorselleri 2.sayfaya aktarmak icin:
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    //tableviewin farklı ozellikleri
    //sola kaydırınca silmesini saglamak icin:
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row) //self yazmasak da olur ama karısık kodlar olunca neyden bahsettigimizi belli etmek icin kullansan olur.
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade) //sadece bir tanesini silmek icin.
        }
    }
    
    
    
    
    
}

