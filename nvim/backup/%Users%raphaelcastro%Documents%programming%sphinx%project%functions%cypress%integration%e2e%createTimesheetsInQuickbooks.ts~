describe("e2e", () => {
    it("should load without crashing", () => {
        cy.visit("http://www.google.com");
    });
    it("should respond with a 200 code", () => {
        cy.request(
            "http://localhost:5001/sphinx-37db0/us-central1/createTimesheet",
            {
                url: 'https://zapier.com/engine/hydrate/2552233/.eJxNkcmOm0AARH8l6rOJ2BffsMGsXsAzBhxFCJrFgGmY7sYMGc2_x9mkXEuvXh3qA8AB0RLRlC5jCdZAByvQIEIzBMu0KcBaUzlJluQVgBOhQz-REv_OeUnieUFYgQzCYXoK_oUKx61A1ZT3IkVZ_8uZUZrBW_9cIU97N2e4JmD9AfqSkKz-MwM4pYCCJggqn6tZxmZP8v_e-tsH-M3pB6stXJUTG5v1UcIp53Y4N4rG-GJLKtXjj1Zgq2NyHJICWr6TvEHRaxC0j24Q0nEXCFcmum2i-BRp7IKu6nTC6dWv9rVfsyG6RnaiVn1JF6Yng4fifeVwg8QaHuqax3E_yy9Rw44K95ioC1_s3YaPHwRXjK7l9Xslipg3D_2WCPfRuZHkHFmGHUzuaIT4IHab3cWC8DI9dI5Jg479geDpFoalmTpy7J5776bKr35st7Pc94sR5VadRLnLmtt8k-xf79Vuazi4cJvEdM61b2i4qBFLj0SrllbQqGQl9AAnu-MwyRtJJ9gPZKhfWlU1l5Mr4JZccJQ6JolO93Zb91v0JuiHAM8H9tIvUu4Jui0-JJMJKxlR2KVNSOeuURg-FthdTp0smcze0Fovf4vv3Tw775FSP7_6e_XL-VaWlHwx38cB06-QPMDn98_Pn1Kuy6Q:1mxsPp:9DW6DJYJXZBCh3o54y0m6s5-LOs/'
            }
        ).then((response1) => {
            expect(response1.status).to.eq(200);
        });
    });
});
