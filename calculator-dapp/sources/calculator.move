module sidkris::calculator {

    // use std::signer;

    struct Calculator has key {
        result : u64,
    }

    public entry fun create_calculator(account : &signer) {
        
        let calculator = Calculator{result : 0};

        move_to(account, calculator);
    
    }


    #[test(account = @0x1)]
    public fun test_function(account : &signer) {
        
        create_calculator(account);

    }

}