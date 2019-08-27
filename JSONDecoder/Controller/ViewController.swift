//
//  ViewController.swift
//  JSONDecoder
//
//  Created by Nazim Uddin on 27/8/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    var arrayData = [JsonModel]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
       // arrayData = JsonData.shared.getJSONData(tableView: tableView)
        getJSONData()
    }
    func getJSONData(){
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                if error == nil {
                    self.arrayData = try JSONDecoder().decode([JsonModel].self, from: data!)
                    
                    for data in self.arrayData{
                        print(data.name,":",data.capital)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }catch{
                print("Error in get json data")
            }
            }.resume()
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.data = arrayData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details:DetailsViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        details.data = arrayData[indexPath.row]
        navigationController?.pushViewController(details, animated: true)
    }
}
