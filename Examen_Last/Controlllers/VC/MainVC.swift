//
//  MainVC.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "CellTypeTVC", bundle: nil), forCellReuseIdentifier: "CellTypeTVC")
            tableView.register(UINib(nibName: "ComplexesTVC", bundle: nil), forCellReuseIdentifier: "ComplexesTVC")
            tableView.register(UINib(nibName: "PopularTVC", bundle: nil), forCellReuseIdentifier: "PopularTVC")
            tableView.register(UINib(nibName: "DevelopersTVC", bundle: nil), forCellReuseIdentifier: "DevelopersTVC")
            tableView.register(UINib(nibName: "NewsTVC", bundle: nil), forCellReuseIdentifier: "NewsTVC")
        }
    }
    
    var cellTypeData = [CellTypeDM]()
    var complexses = [ComplexDM]()
    var popularData = [PopularDM]()
    var developers = [DeveloperDM]()
    var newsData = [NewsDM]()
    
    var imgs = ["Icon","Icon-2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        setupModals()
    }

    
    func setupNavbar() {
        title = "Главная"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(bellTapped))
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.137254902, green: 0.1215686275, blue: 0.1254901961, alpha: 1)
    }
    
    @objc func bellTapped() {
        print("BELL")
    }
    
    func setupModals() {
        
        API.shared.getCellType { types in
            self.cellTypeData = types
            self.tableView.reloadData()
        }
        
        API.shared.getComplexHouse { complex in
            self.complexses = complex
            self.tableView.reloadData()
        }
        
        API.shared.getPopularHouse { popular in
            self.popularData = popular
            self.tableView.reloadData()
        }
        
        API.shared.getDeveloperDetails { dev in
            self.developers = dev
            self.tableView.reloadData()
        }
        
        API.shared.getNews { news in
            self.newsData = news
            self.tableView.reloadData()
        }
    }
}


extension MainVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTypeTVC", for: indexPath) as! CellTypeTVC
            cell.updateCell(type: self.cellTypeData, images: imgs)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ComplexesTVC", for: indexPath) as! ComplexesTVC
            cell.updateCell(complex: self.complexses)
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTVC", for: indexPath) as! PopularTVC
            cell.updateCell(popular: self.popularData)
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DevelopersTVC", for: indexPath) as! DevelopersTVC
            cell.updateCell(dev: self.developers)
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTVC", for: indexPath) as! NewsTVC
            cell.updateCell(news: self.newsData)
            return cell
        }
        return UITableViewCell()
     
    }
    
    
}
