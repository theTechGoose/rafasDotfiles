const { execSync } = require("child_process");

async function main() {
    await executeLimelight();
}

async function executeLimelight() {
    execSync(`killall limelight &> /dev/null
limelight &> /dev/null &`);
    execSync("pkill limelight");
    await sleep(1000);
    try {
        execSync("limelight");
    } catch (err) {
        await main();
    }
    return
}

function sleep(ms) {
    return new Promise((r) => setTimeout(r, ms));
}

main();

