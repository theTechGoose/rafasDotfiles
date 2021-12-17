const { execSync } = require("child_process");

function main() {
    executeLimelight()
}

async function executeLimelight() {
    execSync(`killall limelight &> /dev/null
limelight &> /dev/null &`)
    await sleep(5000)
    try {
        execSync("limelight");
    } catch(err) {
        main();
    }
}

function sleep(ms) {
    return new Promise( (r)=> setTimeout(r,ms))
}

main();
