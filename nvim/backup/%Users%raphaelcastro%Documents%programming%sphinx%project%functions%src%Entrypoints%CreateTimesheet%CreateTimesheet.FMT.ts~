import * as functions from 'firebase-functions'
import * as papa from 'papaparse'
import axios from 'axios'
import {createTimesheetsInQuickbooks} from './CreateTimesheet.LX'

/* <-- Import End --> */

export const createTimesheet = functions.https.onRequest(async (request, response) => {
    const axiosResponse = await axios.get(request.body.url)
    const rawTimesheet = axiosResponse.data
    console.log(rawTimesheet)
    const timesheet: any = papa.parse(rawTimesheet, {
        header: true,
        skipEmptyLines: true,
    })
    console.log(timesheet)

    await createTimesheetsInQuickbooks(timesheet);
    response.status(200).send({status: 'success'})
})

interface Logged_ {
    [key: string]: any
}
let count = 0
export function log(message: Logged_ ) {
    console.log(`${count++}*****************************`)
    console.log(message)
    console.log(`${count++}*****************************`)
}




