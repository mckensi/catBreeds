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
    
    var idBreed : String?
    private var imageRes : ImageBreedRes?
    private var viewModel = BreedDetailViewModel()
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var viewButtonContainer: UIView!
    
    @IBOutlet weak var imgButtonCloseContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        setUpButtonMore()
        setUpCloseView()
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
    
    //MARK: InitListeners
    
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
    
    private func setUpButtonMore(){
        viewButtonContainer.layer.cornerRadius = 8
        viewButtonContainer.layer.shadowColor = UIColor.black.cgColor
        viewButtonContainer.layer.shadowOpacity = 0.2
        viewButtonContainer.layer.shadowOffset = .zero
        viewButtonContainer.layer.shadowRadius = 1
    }
    
    private func setUpCloseView(){
        imgButtonCloseContainer.layer.cornerRadius = imgButtonCloseContainer.frame.width / 2
        imgButtonCloseContainer.layer.shadowColor = UIColor.black.cgColor
        imgButtonCloseContainer.layer.shadowOpacity = 0.2
        imgButtonCloseContainer.layer.shadowOffset = .zero
        imgButtonCloseContainer.layer.shadowRadius = 1
    }
    
    private func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
        let nibCell = UINib(nibName: "CatsDetailInfoTableViewCell", bundle: nil)
        tableView.register(nibCell.self, forCellReuseIdentifier: "infoCell")
        
        
        let nibCellWeight = UINib(nibName: "CatsWeightTableViewCell", bundle: nil)
        tableView.register(nibCellWeight.self, forCellReuseIdentifier: "weightCell")
        
    }
    
    //MARK: Actions
    
    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func actionShowWebInfo(_ sender: Any) {
        let vc = WebInfoViewController()
        vc.url = imageRes?.breeds?[0].wikipediaURL
        present(vc, animated: true, completion: nil)
    }
}

//MARK: Extensions and protocols

extension BreedDetailViewController : UITableViewDelegate{
}


extension BreedDetailViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as? CatsDetailInfoTableViewCell
            cell?.labelTitle.text = "Description"
            cell?.labelDescription.text = imageRes?.breeds?[0].breedListReDescription ?? ""
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as? CatsDetailInfoTableViewCell
            cell?.labelTitle.text = "Origen"
            cell?.labelDescription.text = imageRes?.breeds?[0].origin ?? ""
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as? CatsDetailInfoTableViewCell
            cell?.labelTitle.text = "Temperament"
            cell?.labelDescription.text = imageRes?.breeds?[0].temperament ?? ""
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "weightCell") as? CatsWeightTableViewCell
            cell?.labelImperial.text = imageRes?.breeds?[0].weight?.imperial ?? ""
            cell?.labelMetric.text = imageRes?.breeds?[0].weight?.metric ?? ""
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
    }
    
    
}
