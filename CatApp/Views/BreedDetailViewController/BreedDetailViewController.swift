//
//  BreedDetailViewController.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import UIKit
import Kingfisher
import SVProgressHUD
import NotificationBannerSwift

class BreedDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var idBreed : String?
    private var imageRes : ImageBreedRes?
    private var viewModel = BreedDetailViewModel()
    
    
    @IBOutlet weak var imgMain: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        initListener()
        getInfoBreed()
        
        // Do any additional setup after loading the view.
    }
    
    
    init(){
        super.init(nibName: "BreedDetailViewController", bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initListener(){
        viewModel.imageBreedRes = { [weak self] response in
            guard let strongSelf = self else {return}
            if response.count != 0 {
                strongSelf.imageRes = response[0]
                DispatchQueue.main.async {
                    strongSelf.tableView.reloadData()
                    SVProgressHUD.dismiss()
                    
                    if let url = URL(string: strongSelf.imageRes?.url ?? "") {
                        strongSelf.imgMain?.kf.setImage(with: url)
                    }
                    
                }
            }
        }
        
        viewModel.onFailure = {
            let banner = NotificationBanner(title: "Error", subtitle: "Ocurrio un problema con tu busqueda, trabajamos para resolverlo.", style: .danger)
            banner.backgroundColor = .systemYellow
            banner.show()
        }
    }
    
    private func getInfoBreed(){
        if let id = idBreed{
            SVProgressHUD.show()
            viewModel.getBreedsCats(id: id)
        }
    }
    
    private func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
        let nibCell = UINib(nibName: "CatsDetailInfoTableViewCell", bundle: nil)
        tableView.register(nibCell.self, forCellReuseIdentifier: "infoCell")
    }
    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func actionShowWebInfo(_ sender: Any) {
        let vc = WebInfoViewController()
        vc.url = imageRes?.breeds?[0].wikipediaURL
        present(vc, animated: true, completion: nil)
    }
}


extension BreedDetailViewController : UITableViewDelegate{
}


extension BreedDetailViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as? CatsDetailInfoTableViewCell
            cell?.labelTitle.text = "Description"
            cell?.labelDescription.text = imageRes?.breeds?[0].breedListReDescription ?? ""
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    
}
