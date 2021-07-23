//
//  FeedsViewController.swift
//  GeeksForGeeksiOSAssignment
//
//  Created by Vibes Com on 22/07/21.
//  Copyright © 2021 garima. All rights reserved.
//

import UIKit
import AlamofireImage

class FeedsViewController: UIViewController {
    
    
    //MARK:- Properties
    
    @IBOutlet weak var newsFeedTable:UITableView!
    var apiCallObject=APICall()
    var newsFeedData:[Items]! = []
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        newsFeedTable.register(UINib(nibName: "ShortNewsCell", bundle: Bundle.main), forCellReuseIdentifier: "ShortNewsCell")
        
        newsFeedTable.register(UINib(nibName: "BigNewsCell", bundle: Bundle.main), forCellReuseIdentifier: "BigNewsCell")
        
        self.newsFeedTable.estimatedRowHeight=UITableView.automaticDimension
        
        self.newsFeedTable.rowHeight=UITableView.automaticDimension
        
        self.newsFeedTable.addSubview(refreshControl)
        
        self.getNewsFeeds()
    }
    
    //Api call
    
    func getNewsFeeds() {
        
        apiCallObject.serviceCall(url: Constants.newsFeedUrl, httpMethod: .get, params: nil, headers: nil) { result in
            
            switch result {
            case .success(let jsonData):
       
                let data = try! JSONDecoder().decode(NewsFeed.self, from: jsonData)
                if(data.status == "ok"){
                    self.newsFeedData=data.items!
                    self.newsFeedTable.reloadData()
                }
                else{
                    let alert=UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)
                }
                
            case .failure(let error):
                let alert=UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    // Refresh function
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.getNewsFeeds()
        self.newsFeedTable.reloadData()
        refreshControl.endRefreshing()
    }
    
}
extension FeedsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsFeedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dateformatter=DateFormatter()
        dateformatter.dateFormat="yyyy-MM-dd HH:mm:ss"
        let date=dateformatter.date(from: self.newsFeedData[indexPath.row].pubDate!)
     
        let finalDateFormatter=DateFormatter()
        finalDateFormatter.dateFormat="MMM dd, yyyy"
        let datetoShow=finalDateFormatter.string(from: date!)
        
        let finalTimeFormatter=DateFormatter()
        finalTimeFormatter.dateFormat="HH:mm a"
        let timetoShow=finalTimeFormatter.string(from: date!)
        
        if(indexPath.row == 0){
            let cell=tableView.dequeueReusableCell(withIdentifier: "BigNewsCell") as! BigNewsCell
            cell.selectionStyle = .none
            
            cell.titleLabel.text=self.newsFeedData[indexPath.row].title
            
            cell.titleLabel.addCharacterSpacing()
            
            let url = URL(string: self.newsFeedData[indexPath.row].enclosure?.link?.components(separatedBy: "?")[0] ?? "")!
            let placeholderImage = UIImage(named: "geeksLogo")!
            cell.newsImage.af.setImage(withURL: url, placeholderImage: placeholderImage)
            
            cell.dateLabel.text=datetoShow
            
            cell.timeLabel.text=timetoShow
            
            return cell
        }
        else{
            let cell=tableView.dequeueReusableCell(withIdentifier: "ShortNewsCell") as! ShortNewsCell
            
            cell.selectionStyle = .none
            
            cell.titleLabel.text=self.newsFeedData[indexPath.row].title
            
            cell.titleLabel.addCharacterSpacing(kernValue: 2.0)
            
            let url = URL(string: self.newsFeedData[indexPath.row].thumbnail?.components(separatedBy: "?")[0] ?? "")!
            let placeholderImage = UIImage(named: "geeksLogo")!
            cell.newsImage.af.setImage(withURL: url, placeholderImage: placeholderImage)
            
            cell.dateLabel.text=datetoShow
            
            cell.timeLabel.text=timetoShow
            
            return cell
        }
        
    }
    
    
}
