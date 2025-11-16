// Utils
function randomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

// Classe principal
class DataFetcher {
    constructor(apiUrl) {
        this.apiUrl = apiUrl;
        this.cache = new Map();
    }

    async get(endpoint) {
        const url = `${this.apiUrl}/${endpoint}`;
        if (this.cache.has(url)) {
            console.log(`Cache hit: ${url}`);
            return this.cache.get(url);
        }
        console.log(`Fetching: ${url}`);
        const response = await fetch(url);
        const data = await response.json();
        this.cache.set(url, data);
        return data;
    }
}

// Dados de exemplo
const users = [
    { id: 1, name: "Alice", active: true },
    { id: 2, name: "Bob", active: false },
    { id: 3, name: "Charlie", active: true },
    { id: 4, name: "Diana", active: true }
];

const fetcher = new DataFetcher("https://api.example.com");

// Função principal
async function processUsers() {
    for (let user of users) {
        if (!user.active) {
            console.warn(`Usuário ${user.name} está inativo. Pulando...`);
            continue;
        }

        try {
            const profile = await fetcher.get(`users/${user.id}/profile`);
            console.log(`Perfil carregado para ${user.name}:`, profile);

            // Simulação de espera
            await delay(randomInt(500, 1500));

            console.log(`Processando dados de ${user.name}...`);
            const processedData = profile.data.map(item => ({
                id: item.id,
                value: item.value * 2,
                timestamp: Date.now()
            }));

            console.log(`Dados processados para ${user.name}:`, processedData);
        } catch (err) {
            console.error(`Erro ao processar ${user.name}:`, err.message);
        }
    }
}

// Executar script
(async () => {
    console.log("Iniciando processamento...");
    await processUsers();
    console.log("Processamento concluído.");
})();
