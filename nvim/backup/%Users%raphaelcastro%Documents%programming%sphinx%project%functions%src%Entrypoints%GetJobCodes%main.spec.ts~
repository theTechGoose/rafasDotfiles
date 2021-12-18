// import axios from 'axios'
// const apiClient = axios.create({
//   baseURL: 'https://rest.tsheets.com/api/v1/',
//   timeout: 1000,
//   method: ''
//   headers: {
//     Accept: 'application/json',
//     'Content-Type': 'application/json',
//   }
// })
// apiClient.interceptors.request.use(request => {
//   console.log('Starting Request', JSON.stringify(request, null, 2))
//   return request
// })
// ###   Get existing job codes
// _GET request to quick-books_

// **Input**
// - None

// **Output**
// - List of job-code objects
//   >  - id (job-code)
//   >  - active
//   >  - billable
//   >  - billable_rate
//   >  - name
//   >  - created
//   >  - last_modified


// ASSETS
// Extract into a constants folder route "job-codes" is the endpoint for this operation
// interface JobCodeObject_ {
//   "id": number,
//   "active": boolean,
//   "parent_id": number,
//   "assigned_to_all": boolean,
//   "type": string,
//   "billable": boolean,
//   "billable_rate": number,
//   "short_code": string,
//   "name": string,
//   "created": string,
//   "last_modified": string
//   "has_children": boolean
//   "required_customfields": Array<string>,
//   "filtered_customfielditems": string,
//   "locations": Array<string>,
//   "geofence_config_id": number,
//   "project_id": number,
// }
// interface ListJobCodesResponse_ {
//   "results": {
//     "jobcodes": {
//       [key: string]: JobCodeObject_
//     }
//   }
// }

// const getJobCodes = async (): Promise<ListJobCodesResponse_> => {
//   const response = await apiClient.get('/job-codes')
//   return response.data
// }

// Make a single get request to the API endpoint


// describe('Get Job Codes', () => {
//   it('Should load without crashing', () => {
//     expect(true).toBeTruthy()
//   })
//   it('Playground', async () => {
//     console.log('test')
//     const response = await getJobCodes()
//     console.log(response.results.jobcodes)
//     expect(response.results.jobcodes).toBeTruthy()
//   })
// });



