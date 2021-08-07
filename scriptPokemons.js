const axios = require('axios').default;

async function scriptPokemon(){
    let pokemon;
    for(let i = 1; i<50; i++){
        let pokemon = await axios.get(`https://pokeapi.co/api/v2/pokemon/${i}`);
        let description = await axios.get(`https://pokeapi.co/api/v2/characteristic/${i}`);
        let body = {
            name:pokemon.data.name,
            number:pokemon.data.order,
            image:pokemon.data.sprites.front_default,
            weight:pokemon.data.weight,
            height:pokemon.data.height,
            baseExp:pokemon.data.base_experience,
            description:description.data.descriptions[2].description,
            inMyPokemons:false
        };
        const request = await axios.post("http://localhost:4001/addPokemons",body);
        console.log('pokemon adicionado numero:'+i);
    }
    console.log('todos os pokemons foram adicionados');
}

scriptPokemon();
