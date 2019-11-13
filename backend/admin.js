const AdminBro = require('admin-bro')
const AdminBroExpress = require('admin-bro-expressjs')
const AdminBroMongoose = require('admin-bro-mongoose')

const User = require('./models/user')
const Event = require('./models/event')

AdminBro.registerAdapter(AdminBroMongoose)
const adminBro = new AdminBro({
  rootPath: '/admin',
  resources: [
    {
      resource: User,
      options: {
        properties: {
          name: { isVisible: { list: true, filter: true, show: true, edit: false}},
          tags: { isVisible: { list: true, filter: true, show: true, edit: true}}
        }
      }
    },
    {
      resource: Event,
      options: {
        properties: {
          name: { isVisible: { list: true, filter: true, show: true, edit: false}}
        }
      }
    }
  ],
  branding: {
    companyName: 'NeTinder',
    softwareBrothers: false
  }
})

module.exports = adminRouter = AdminBroExpress.buildRouter(adminBro)
