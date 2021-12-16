const { execSync } = require("child_process");

function main() {
    const { argv } = process;
    const [, , ...args] = argv;
    if (args[0]) {
        execSync("brew services restart yabai");
        executeLimelight();
    } else {
        executeLimelight();
    }
}

function executeLimelight() {
    try {
        execSync("limelight");
    } catch {
        main();
    }
}

main();
