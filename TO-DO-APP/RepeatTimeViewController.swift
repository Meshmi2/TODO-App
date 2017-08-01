//
//  RepeatTimeViewController.swift
//  TO-DO-APP
//
//  Created by ha.van.duc on 8/1/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

class RepeatTimeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    let arrDatas = [0, 5 , 10, 15, 30, 45, 60]
    var timeRepeat: Int?
    var pickRepeatOptionCompletion: ((Int?) -> Void)?

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrDatas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(arrDatas[row]) minute"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let time = arrDatas[row]
        timeRepeat = time
    }

    @IBAction func dismissViewController(_ sender: Any) {
        pickRepeatOptionCompletion?(timeRepeat)
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var index = 0
        if let _index = arrDatas.index(where: {$0 == timeRepeat}) {
            index = _index
        }
        pickerView.selectRow(index, inComponent: 0, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
