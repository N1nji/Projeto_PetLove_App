require('dotenv').config();
const express = require('express')
const mongoose = require('mongoose')
const cors = require('cors')

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use(cors());

mongoose.connect(process.env.MONGO_URI,)
  .then(() => console.log('O MONGODB ESTÁ CONECTADO RAPAZIADAAAAAAAAAAAA'))
  .catch(err => console.log('ERRO AO CONECTAR O MONGO', err));

  app.get('/', (req, res) =>{
    res.send('API ESTÁ RODANDO');
  });

  app.listen(PORT,  () => {
    console.log(`🚀 Servidor rodando na porta ${PORT}`);
  });
