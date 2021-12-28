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
        var checkedAns = [0, 0, 0, 0]
        var checkedPeg = [0, 0, 0, 0]
        var pinsByRow = [Int]()
        //check color and pos
        for i in 0..<4 {
            if answerPegs[i] == pegsByRow[i] && checkedAns[i] == 0 && checkedPeg[i] == 0  {
                pinsByRow.append(1)
                checkedAns[i] = 1
                checkedPeg[i] = 1
            }
        }
        //check color only
        for i in 0..<4 {
            for j in 0..<4 {
                if i != j {
                    if answerPegs[i] == pegsByRow[j] {
                        if checkedAns[i] == 0 && checkedPeg[j] == 0 {
                            pinsByRow.append(0)
                            checkedAns[i] = 1
                            checkedPeg[j] = 1
                            print("ok")
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
        var checkedAns = [0, 0, 0, 0]
        var checkedPeg = [0, 0, 0, 0]
        var pinsByRow = [Int]()
        //check color and pos
        for i in 0..<4 {
            if answerPegs[i] == pegsByRow[i] && checkedAns[i] == 0 && checkedPeg[i] == 0  {
                pinsByRow.append(1)
                checkedAns[i] = 1
                checkedPeg[i] = 1
            }
        }
        if (checkedAns == [1,1,1,1]){
            return true;
        }
        return false
    }
}
