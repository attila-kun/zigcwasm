extern fn add(a: i32, b: i32) i32;

export fn doCalc(a: i32, b: i32) i32 {
    return add(a, b);
}
