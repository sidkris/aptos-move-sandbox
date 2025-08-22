module sidkris::message {

    use std::string::String;
    
    struct Message has key {
        my_message : String,
    }

    public entry fun create_message(account : &signer, msg : String) {
        let message = Message{
            my_message : msg
        };
        move_to(account, message);
    }

}