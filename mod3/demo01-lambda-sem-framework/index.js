async function handler(event, context) {
  console.debug("Ambiente..", JSON.stringify(process.env, null, 2));
  console.debug("Evento..", JSON.stringify(process.env, null, 2));

  return {
    Socorro: "Me tira daqui!",
  };
}

module.exports = {
  handler,
};
