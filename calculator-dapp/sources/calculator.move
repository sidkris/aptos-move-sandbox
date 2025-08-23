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

    public entry fun subtract(account : &signer, num_1 : u64, num_2 : u64) acquires Calculator {
        let calculator = borrow_global_mut<Calculator>(signer::address_of(account));
        if (num_1 > num_2) {
            calculator.result = num_1 - num_2;
        }
        else{
            calculator.result = num_2 - num_1;
        }
    }

    public entry fun multiply(account : &signer, num_1 : u64, num_2 : u64) acquires Calculator {
        let calculator = borrow_global_mut<Calculator>(signer::address_of(account));
        calculator.result = num_1 * num_2;
    }

    public entry fun divide(account : &signer, num_1 : u64, num_2 : u64) acquires Calculator {
        let calculator = borrow_global_mut<Calculator>(signer::address_of(account));
        assert!(num_2 != 0);
        calculator.result = num_1 / num_2;
    }

    public entry fun modulo(account : &signer, num_1 : u64, num_2 : u64) acquires Calculator {
        let calculator = borrow_global_mut<Calculator>(signer::address_of(account));
        calculator.result = num_1 % num_2;
    }

    #[test(account = @0x1)]
    public fun test_function(account : &signer) acquires Calculator {
        create_calculator(account);
        add(account, 100, 900);
        subtract(account, 10, 9);
        multiply(account, 10, 11);
        divide(account, 99, 9);
        modulo(account, 10, 5);
        print(&get_result(account));
    }   

}