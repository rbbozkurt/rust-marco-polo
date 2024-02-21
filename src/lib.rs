//! A Marco polo game
//! If the name 'Marco' passed as an argument, then the program respons with 'Polo',
//! otherwise respons 'What's your name?'. 
//! # Examples:
//! ```
//! use marco_polo::marco;
//! let result = marco("Marco");
//! assert_eq!(result, "Polo");
//! 
//! let result = marco("John");
//! assert_eq!(result, "What's your name?");
//! 
pub fn marco(name: &str) -> String {
    if name == "Marco" {
        "Polo".to_string()
    }else {
        "What's your name?".to_string()
    }   
}