fn main(){
    erlangb(50.0, 11.0);
}

fn factorial(n: u64) -> u64 {
    let mut result = 1;
    for i in 2..=n {
        result *= i;
    }
    result
}

fn erlangb(e:f64,c:f64) -> f64 {
    let mut sum = 0.0;
    for i in 0..=c as usize {
        sum += e.powi(i as i32) / factorial(i as u64) as f64;
    }
    println!("c! * sum = {}", factorial(c as u64) as f64 * sum);
    e.powi(c as i32) / (factorial(c as u64) as f64 * sum)
}