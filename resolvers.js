const { nanoid } = require("nanoid");

const resolvers = {
  Query: {
    info: () => "Used Books API",

    getAllUsers: async (_parent, _args, context, _info) =>
      context.prisma.user.findMany(),

    getUserById: async (_parent, args, context, _info) =>
      context.prisma.user.findUnique({
        where: {
          emailid: args.id,
        },
      }),

    getAllCities: async (_parent, _args, context, _info) =>
      context.prisma.city.findMany(),

      getAllProvinces: async (_parent, _args, context, _info) =>
      context.prisma.province.findMany(),

      getAllCountries: async (_parent, _args, context, _info) =>
      context.prisma.country.findMany(),

    getAllBooks: async (_parent, _args, context, _info) =>
      context.prisma.book.findMany(),

    searchBook: async (_parent, _args, context, _info) =>
      context.prisma.book.findMany({
        where: {
          OR: [
            {
              book_name: {
                startsWith: _args.input,
              },
            },
            {
              isbn: {
                startsWith: _args.input,
              },
            },
            {
              author_name: {
                startsWith: _args.input,
              },
            },
          ],
        },
      }),

      getAllBookTransactions: async (_parent, _args, context, _info) => context.prisma.user_sells_book.findMany(),

      getBookTransactionsByBook: async (_parent, _args, context, _info) => context.prisma.user_sells_book.findMany({
        where: {
          book_id: {
            startsWith: _args.input
          }
        }
      }),

      getBookTransactionsByUser: async (_parent, _args, context, _info) => context.prisma.user_sells_book.findMany({
        where: {
          user_email: {
            startsWith: _args.input
          }
        }
      })
  },

  Mutation: {
    createNewUser: async (_parent, _args, context, _info) => {
      const newUser = context.prisma.user.create({
        data: {
          first_name: _args.input.first_name,
          last_name: _args.input.last_name,
          emailid: _args.input.emailid,
          phone_number: _args.input.phone_number,
        },
      });

      return newUser;
    },

    createNewCity: async (_parent, _args, context, _info) => {
      const newCity = context.prisma.city.create({
        data: {
          city_id: _args.input.city_id,
          city_name: _args.input.city_name,
        },
      });

      return newCity;
    },

    createNewProvince: async (_parent, _args, context, _info) => {
      const newProvince = context.prisma.province.create({
        data: {
          province_name: _args.input.province_name,
        },
      });

      return newProvince;
    },

    createNewCountry: async (_parent, _args, context, _info) => {
      const newCountry = context.prisma.country.create({
        data: {
          country_name: _args.input.country_name,
          country_code: _args.input.country_code,
        },
      });

      return newCountry;
    },

    createNewAddress: async (_parent, _args, context, _info) => {
      const newAddress = context.prisma.address.create({
        data: {
          address_id: nanoid(12),
          user_email: _args.input.user_email,
          first_line: _args.input.first_line,
          second_line: _args.input.second_line,
          third_line: _args.input.third_line,
          city_id: _args.input.city_id,
          province_id: _args.input.province_id,
          country_id: _args.input.country_id,
        },
      });

      return newAddress;
    },

    createNewBook: async (_parent, _args, context, _info) => {
      const newBook = context.prisma.book.create({
        data: {
          book_id: nanoid(12),
          book_name: _args.input.book_name,
          isbn: _args.input.isbn,
          author_name: _args.input.author_name,
        },
      });

      return newBook;
    },

    createNewUserSellsBook: async (_parent, _args, context, _info) => {
      const newUserSellsBook = context.prisma.user_sells_book.create({
        data: {
          selling_id: nanoid(13),
          user_email: _args.input.user_email,
          book_id: _args.input.book_id,
          status: _args.input.status,
          price: _args.input.price
        }
      })

      return newUserSellsBook
    }
  },

};
module.exports = resolvers;
