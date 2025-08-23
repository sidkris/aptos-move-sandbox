module sidkris::calculator {

    use std::signer;
    use std::debug::print;

    struct Calculator has key {
        result : u64,
    }

    public entry fun create_calculator(account : &signer) {
        let calculator = Calculator{result : 0};
        move_to(account, calculator);
    }


    public fun get_result(account : &signer) : u64 acquires Calculator {
        let calculator = borrow_global<Calculator>(signer::address_of(account));
        calculator.result
    }


    public entry fun add(account : &signer, num_1 : u64, num_2 : u64) acquires Calculator {
        let calculator = borrow_global_mut<Calculator>(signer::address_of(account));
        calculator.result = num_1 + num_2;
    }

    #[test(account = @0x1)]
    public fun test_function(account : &signer) acquires Calculator {
        create_calculator(account);
        add(account, 100, 900);
        print(&get_result(account));
    }   

}