//
//  siswaViewController.swift
//  DataSiswaIDNApps
//
//  Created by abdul fatah on 11/20/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class siswaViewController: UIViewController {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var kelas: UILabel!
    @IBOutlet weak var alamat: UILabel!
    @IBOutlet weak var jenisKelamins: UILabel!
    
    var passID:String?
    var passUsername:String?
    var passKelas:String?
    var passalamat:String?
    var passJeniskelamin:String?
    
    override func viewDidLoad() {
        id.text = passID!
        username.text = passUsername!
        kelas.text = passKelas!
        alamat.text = passalamat!
        jenisKelamins.text = passJeniskelamin!
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
