//
//  ViewController.swift
//  jsonParse&Search
//
//  Created by Md Kamrul Hasan on 19/3/19.
//  Copyright © 2019 Md Kamrul Hasan. All rights reserved.
//https://restcountries.eu/rest/v2/all

import UIKit

var countryName:[String] = []

class ViewController: UIViewController,UISearchBarDelegate {

    var filterArray: [String]?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonString = "https://restcountries.eu/rest/v2/all"
        
        guard let url = URL(string: jsonString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{
                return
            }
            do{
                var countryList = try JSONDecoder().decode([Info].self, from: data)
                
                for i in 0..<countryList.count{
                    countryName.append(countryList[i].name)
                 //   countryName.append(countryList[i].flag)
                }
                
                self.filterArray = countryName
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch let error{
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if (searchBar.text?.isEmpty)! {
            self.filterArray = countryName
        }else{
            self.filterArray = countryName.filter({ $0.lowercased().contains(searchBar.text!.lowercased())})
        }
        self.tableView.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let count = filterArray?.count{
//            return count
//        }else{
//            return 0
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! customTableViewCell
//
//
//        if let value = self.filterArray?[indexPath.row]{
//            cell.countryNameLabel.text = value
////            if let imageURL = URL(string: "https://restcountries.eu/rest/v2/all" ){
////                DispatchQueue.global().async {
////                    let data = try? Data(contentsOf: imageURL)
////                    if let data  = data {
////                        let image = UIImage(data: data)
////                        DispatchQueue.main.async {
////                            cell.img.image = image
////                        }
////                    }
////                }
////
//    }
//        return cell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedValue = tableView.cellForRow(at: indexPath) as! UITableViewCell
////        let cell = self.tableView.cellForRow(at: indexPath) as! UITableViewCell
//
////        let toy = countryName[indexPath.row]
////        print("Selected Row \(toy)")
//
//        let indexpath = tableView.indexPathForSelectedRow
//        let currentCell = tableView.cellForRow(at: indexPath)
//        print("selected value \(currentCell?.textLabel?.text)")
//        print(indexPath.row)
//        print(filterArray![indexPath.row])
//    }
//
//
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if let count = filterArray?.count{
                return count
            }else{
                return 0
            }
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! customTableViewCell
    
    
            if let value = self.filterArray?[indexPath.row]{
                cell.countryNameLabel.text = value
                if let imageURL = URL(string: "https://restcountries.eu/rest/v2/all" ){
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: imageURL)
                        if let data  = data {
                            let image = UIImage(data: data)
                            DispatchQueue.main.async {
                                cell.img.image = image
                            }
                        }
                    }
    
        }
            return cell
        }
        return cell
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedValue = tableView.cellForRow(at: indexPath) as! UITableViewCell
    //        let cell = self.tableView.cellForRow(at: indexPath) as! UITableViewCell

    //        let toy = countryName[indexPath.row]
    //        print("Selected Row \(toy)")

            let indexpath = tableView.indexPathForSelectedRow
            let currentCell = tableView.cellForRow(at: indexPath)
            print("selected value \(currentCell?.textLabel?.text)")
            print(indexPath.row)
            print(filterArray![indexPath.row])
        }
    
}
