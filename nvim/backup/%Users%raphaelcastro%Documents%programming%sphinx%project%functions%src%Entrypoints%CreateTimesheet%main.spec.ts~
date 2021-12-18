import {createTimesheetsInQuickbooks} from "./CreateTimesheet.LX";

/* <-- Import End --> */

const CONFIG = {
    data: [
        {
            user_id: "1890976",
            jobcode_id: "42845724",
            type: "regular",
            start: `${new Date('12/13/2021').toISOString().replace(/.\d\d\dZ/, "")}-7:00`,
            end:`${new Date('12/14/2021').toISOString().replace(/.\d\d\dZ/, "")}-7:00`,
        },
    ],
}

export type TimeSheet_ = typeof CONFIG

/* <-- Variable Definition End --> */

describe("Timesheet Create", () => {
    it("e2e", async () => {
        const result = await createTimesheetsInQuickbooks(CONFIG); expect(result.data);
    });
});

