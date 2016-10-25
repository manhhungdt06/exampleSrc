//
//  ViewController.swift
//  Math
//
//  Created by techmaster on 10/25/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lblsign: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var lbldivzero: UILabel!
    
    @IBAction func btnAct(_ sender: UIButton) {
        setRandom()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandom()
    }
    func setRandom() {
        // chi rand cac so tu 1->9
        let random1 = Int(arc4random_uniform(10))
        let random2 = Int(arc4random_uniform(10))
        let randomOperator = Int(arc4random_uniform(4))
        lbl1.text = String(random1)
        lbl2.text = String(random2)
        btn1.setTitle(String(random1), for: UIControlState())
        btn2.setTitle(String(random2), for: UIControlState())
        lbldivzero.isHidden = true;
        if randomOperator == 0 {
            lblsign.text = "+"
            sum(random1, p2: random2)
        } else if randomOperator == 1 {
            lblsign.text = "-"
            sub(random1, p2: random2)
        } else if randomOperator == 2 {
            lblsign.text = "x"
            multi(random1, p2: random2)
        } else {
            lblsign.text = ":"
            div(random1, p2: random2)
        }
    }
    func sum(_ p1: Int, p2: Int) {
        lbl3.text = String(p1+p2)
        btn3.setTitle(String(p1+p2), for: UIControlState())
    }
    func sub(_ p1: Int, p2: Int) {
        lbl3.text = String(p1-p2)
        btn3.setTitle(String(p1-p2), for: UIControlState())
    }
    func multi(_ p1: Int, p2: Int) {
        lbl3.text = String(p1*p2)
        btn3.setTitle(String(p1*p2), for: UIControlState())
    }
    func div(_ p1: Int, p2: Int) {
        if p2 != 0 {
            if p1 % p2 == 0 {
                lbl3.text = String(p1/p2)
                btn3.setTitle(String(p1/p2), for: UIControlState())
            } else {
                lbl3.text = String(format: "%.3f",Float(p1)/Float(p2))
                btn3.setTitle(String(format: "%.3f",Float(p1)/Float(p2)), for: UIControlState())
            }
        } else {
            lbldivzero.isHidden = false
            lbl3.text = ""
            btn3.setTitle("", for: UIControlState())
        }
    }
}

