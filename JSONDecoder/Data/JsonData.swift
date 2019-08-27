//
//  JsonData.swift
//  JSONDecoder
//
//  Created by Nazim Uddin on 27/8/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit
class JsonData {
    var arrayData = [JsonModel]()
    var returnData = [JsonModel]()
    var url = URL(string: "https://restcountries.eu/rest/v2/all")
    static var shared = JsonData()
    func getJSONData(tableView:UITableView)->[JsonModel]{
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                if error == nil {
                    self.arrayData = try JSONDecoder().decode([JsonModel].self, from: data!)

                    for data in self.arrayData{
                        print(data.name,":",data.capital)
                        DispatchQueue.main.async {
                            tableView.reloadData()
                        }
                    }
                }
            }catch{
                print("Error in get json data")
            }
        }.resume()
        return arrayData
    }
}
