//! Copied and modified from:
//! https://github.com/seanmonstar/reqwest/blob/4fe07d81cfc51e6ab720ed5826b88687e762f002/examples/simple.rs

use std::collections::HashMap;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let res = reqwest::get("https://en.wikipedia.org/wiki/Ogbaru").await?;

    println!("Status: {}", res.status());

    let body = res.text().await?;

    println!("Body:\n\n{}", body);

    println!(r#"

It worked.
"#);

    Ok(())
}
