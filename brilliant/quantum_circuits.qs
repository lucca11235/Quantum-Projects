namespace Brilliant {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;

    operation QuantumMain() : Unit {
        for (i in 0 .. 5) {
            using ( q = Qubit() ) {
                Circuit(q);
                    
                ResetQubit(q);
            } 
        }
    }
 
    operation Circuit(target : Qubit) : Unit {
        H(target); T(target); H(target);
    }
    
    operation ResetQubit(target : Qubit) : Unit {
        let result = M(target);
        let resultInt = ResultArrayAsInt([result]);
        
        Message($"Result: {resultInt}");
        
        if (result == Zero) {
            // No operation is necessary, since the qubit is already in |0>
        } else {
            // Perform a quantum NOT gate to return the qubit from |1> to |0>
            X(target);
        }
    }
}
