module sidkris::message {

    use std::string::String;
    use std::signer;
    
    struct Message has key {
        my_message : String,
    }

    public entry fun  create_message(account : &signer, msg : String) {
        let message = Message{
            my_message : msg
        };
        move_to(account, message);
    }

    public entry fun update_message(account : &signer, new_msg : String) acquires Message {
        let account_address = signer::address_of(account);
        let message = borrow_global_mut<Message>(account_address);
        message.my_message = new_msg;
    }

}