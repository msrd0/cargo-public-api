#![no_std] // Reduces rustdoc JSON size by 70%

#[derive(Debug)]
pub struct Struct {
    pub v1_field: usize,
}

pub fn function(v1_param: Struct) {}
