import {TimeSheet_} from './main.spec'
import axios from 'axios'

/* <-- Import End --> */

const CONFIG = {
     url : "https://rest.tsheets.com/api/v1/timesheets",
     headers : {
        Authorization: "Bearer S.15__35c00571a09a30d0dc06b11d4f42d76d3ec33f16",
    }
}

/* <-- Variable Definition End --> */

export function createTimesheetsInQuickbooks(input: TimeSheet_) {
    const {headers,url} = CONFIG
    return axios.post(url, input, {headers});
}
