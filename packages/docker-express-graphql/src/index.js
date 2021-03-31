const { graphqlHTTP } = require('express-graphql');
const { Docker } = require('node-docker-api');
const { makeExecutableSchema } = require('@graphql-tools/schema');

const graphqlMiddleware = () => {
	const docker = new Docker({ socketPath: '/var/run/docker.sock' });

	// Construct a schema, using GraphQL schema language
	const typeDefs = `
		type ContainerStatusState {
			Status: String
			Running: Boolean
			Paused: Boolean
			Restarting: Boolean
			OOMKilled: Boolean
			Dead: Boolean
			Pid: Float
			ExitCode: Float
			Error: String
			StartedAd: String
			FinishedAt: String
		}

		type ContainerStatus {
			Id: String
			Created: String
			Path: String
			State: ContainerStatusState
			Image: String
			Name: String
			Driver: String
			Platform: String
			MountLabel: String
			ProcessLabel: String
		}

		type Container {
			id: String
			status: ContainerStatus
		}

		type Query {
			containers: [Container]
		}

		schema {
			query: Query
		}
	`;

	const resolvers = {
		Query: {
			containers: async () => {
				const list = await docker.container.list();
				return list;
			}
		},
		Container: {
			status: async (container) => {
				const stats = await container.status();
				return stats.data;
			}
		}
	};

	const executableSchema = makeExecutableSchema({
		  typeDefs,
		  resolvers,
	});

	return graphqlHTTP({
		schema: executableSchema,
		graphiql: true,
	});
}

module.exports = graphqlMiddleware;
