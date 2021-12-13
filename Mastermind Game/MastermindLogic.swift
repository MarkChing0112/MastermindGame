import Foundation
//pegs:-1 - empty, 0 - white, 1 - black, 2 - b, 3 - y, 4 - r, 5 - g
//pins:-1 - empty, 0 - w, 1 - b
class MastermindLogic {
    var answerPegs : [Int]
    var inputPegs : [[Int]]
    var pins : [[Int]]
    var turn = 0
    init(){
        self.answerPegs = []
        for _ in 0..<4 {
            let ansPes = Int.random(in: 0...5)
            answerPegs.append(ansPes)
        }
        self.inputPegs = []
        self.pins = []
        for _ in 0..<10 {
            var inputPegsByRow = [Int]()
            var pinsPegsByRow = [Int]()
            for _ in 0..<4{
                inputPegsByRow.append(-1)
                pinsPegsByRow.append(-1)
            }
            inputPegs.append(inputPegsByRow)
            pins.append(pinsPegsByRow)
        }
    }
    
    func canNextTurn() -> Bool {
        let pegsByRow = inputPegs[turn]
        for peg in pegsByRow {
            if peg == -1 {
                return false
            }
        }
        return true
    }
    
    func nextTurn(){
        turn += 1
    }
    
    func check() -> [Int] {
        let pegsByRow = inputPegs[turn]
        var checked = [0, 0, 0, 0]
        var pinsByRow = [Int]()
        //check color and pos
        for i in 0..<4 {
            if answerPegs[i] == pegsByRow[i] {
                pinsByRow.append(1)
                checked[i] = 1
            }
        }
        //check color only
        for i in 0..<4 {
            for j in 0..<4 {
                if i != j {
                    if answerPegs[i] == pegsByRow[j] {
                        if checked[i] == 0 {
                            pinsByRow.append(0)
                            checked[i] = 1
                        }
                    }
                }
            }
        }
        self.pins[turn] = pinsByRow
            return pinsByRow
    }
    
    func checkWin() -> Bool{
        let pegsByRow = inputPegs[turn]
        var checked = [0, 0, 0, 0]
        var pinsByRow = [Int]()
        //check color and pos
        for i in 0..<4 {
            if answerPegs[i] == pegsByRow[i] {
                pinsByRow.append(1)
                checked[i] = 1
            }
        }
        //check color only
        for i in 0..<4 {
            for j in 0..<4 {
                if i != j {
                    if answerPegs[i] == pegsByRow[j] {
                        if checked[i] == 0 {
                            pinsByRow.append(0)
                            checked[i] = 1
                        }
                    }
                }
            }
        }
        if (checked == [1,1,1,1]){
            return true;
        }
        return false
    }
}
