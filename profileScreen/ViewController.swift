//
//  ViewController.swift
//  profileScreen
//
//  Created by sahil pathania on 18/01/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var navigationProfilePic: UIImageView!
    @IBOutlet weak var navigationUsernameLbl: UILabel!
    @IBOutlet weak var navigationOverflowBtn: UIButton!
    
    let headerHeight : Int = 60
    let width : CGFloat = UIScreen.main.bounds.width
    var isNavigationViewHidden = true
    // SelectedIndex == 0 ? Activity Log : Your Post
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    func setupUI() {
        navigationView.isHidden = true
        navigationProfilePic.layer.cornerRadius = navigationProfilePic.frame.width / 2
        navigationProfilePic.layer.borderWidth = 1
        navigationProfilePic.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    @objc func activityLogBtnClicked(_: Any){
        print("activityLogBtnClicked")
        selectedIndex = 0
        if !navigationView.isHidden{
            isNavigationViewHidden = false
        }
        tableView.reloadData()
        if !isNavigationViewHidden{
            tableView.contentInset = UIEdgeInsets(top: navigationView.frame.height, left: 0, bottom: 0, right: 0)
            navigationView.isHidden = false
        }
    }
    @objc func yourPostBtnClicked(_: Any){
        print("yourPostBtnClicked")
        selectedIndex = 1
//        if !navigationView.isHidden{
//            isNavigationViewHidden = false
//        }
        tableView.reloadData()
//        if !isNavigationViewHidden{
//            tableView.contentInset = UIEdgeInsets(top: navigationView.frame.height, left: 0, bottom: 0, right: 0)
//            navigationView.isHidden = false
//        }
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
        return 1
        }else{
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return UIView()
        }else{
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: Int(width / 2), height: headerHeight))
            headerView.layer.borderWidth = 1
            headerView.layer.borderColor = #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1)
            headerView.backgroundColor = .white
            let activityLogBtn = UIButton(frame: CGRect(x: 0, y: 0, width: Int(width / 2), height: headerHeight))
            activityLogBtn.setTitle("Activity Log", for: .normal)
            activityLogBtn.setTitleColor(.black, for: .normal)
            activityLogBtn.addTarget(self, action: #selector(activityLogBtnClicked(_:)), for: .touchUpInside)
            
            let yourPostBtn = UIButton(frame: CGRect(x: Int(width / 2), y: 0, width: Int(width / 2), height: headerHeight))
            yourPostBtn.setTitle("Your Posts", for: .normal)
            yourPostBtn.setTitleColor(.black, for: .normal)
            yourPostBtn.addTarget(self, action: #selector(yourPostBtnClicked(_:)), for: .touchUpInside)
            
            let selectedView = UIView(frame: CGRect(x: 0, y: headerHeight - 3, width: Int(width / 2), height: 3))
            selectedView.backgroundColor = #colorLiteral(red: 0, green: 0.8205631375, blue: 0.5961772799, alpha: 1)
            selectedView.layer.cornerRadius = 1.5
            if selectedIndex == 0{
                activityLogBtn.addSubview(selectedView)
            }else{
                yourPostBtn.addSubview(selectedView)
            }
            headerView.addSubview(activityLogBtn)
            headerView.addSubview(yourPostBtn)
            return headerView
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 479
        }else{
            return 122 
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0.01
        }else{
        return CGFloat(headerHeight)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderCell", for: indexPath) as? ProfileHeaderCell else{ return UITableViewCell()}
//        cell.label.text = "header label"
            return cell
        }else if indexPath.section == 1{
            if selectedIndex == 0{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityLogCell", for: indexPath) as? ActivityLogCell else{ return UITableViewCell()}
                cell.activityLogLbl.text = "activityLogLblactivityLogLblactivityLogLblactivityLogLblactivityLogLblactivityLogLblactivityLogLblactivityLogLblactivityLogLblactivityLogLblactivityLogLbl"
                return cell
            }else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "YourPostCell", for: indexPath) as? YourPostCell else{ return UITableViewCell()}
                cell.yourPostLbl.text = "YourPostCell"
                return cell
            }
        }
        return UITableViewCell()
    }

    //pushing up
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {

        //lets ensure there are visible rows.  Safety first!
        guard let pathsForVisibleRows = tableView.indexPathsForVisibleRows,
            let lastPath = pathsForVisibleRows.last else { return }

        //compare the section for the header that just disappeared to the section
        //for the bottom-most cell in the table view
        if lastPath.section >= section {
            print("the next header is stuck to the top")
            self.tableView.contentInset = UIEdgeInsets(top: navigationView.frame.height, left: 0, bottom: 0, right: 0)
            navigationView.isHidden = false
        }

    }

    //pulling down
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        //lets ensure there are visible rows.  Safety first!
        guard let pathsForVisibleRows = tableView.indexPathsForVisibleRows,
            let firstPath = pathsForVisibleRows.first else { return }

        //compare the section for the header that just appeared to the se ction
        //for the top-most cell in the table view
        if firstPath.section == section {
            print("the previous header is stuck to the top")
            self.tableView.contentInset = .zero
            navigationView.isHidden = true
        }
    }

}
