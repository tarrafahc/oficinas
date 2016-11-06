# Minhas (Lucas Tonussi) criações na linguagem Puredata

Puredata é uma linguagem de programaçao baseada em fluxo
onde você cria elementos e da nome a eles. Assim você
determina o que aquele objeto representado figuramente por
um pequeno retângulo é e quais ações ele vai realizar.

# Comece a programar em puredata

Puredata pode ser encontrado [aqui](http://puredata.info/downloads)

# ZynAddSubFX

Zynaddsubfx pode ser instalado diretamente dos repositórios da sua distro favorita (das mais famosas)

`sudo apt-get install zynaddsubfx`

# Patchage

Esse software é muito importante para você entender como os softwares de manipulação sonora estão se interligando e se comunicando. Ele faz o papel de conexão do __qjackctl__ mas com um interface gráfica mais avançada e bonita. E isso irá te ajudar a conectar MIDI ao seu Puredata Vanilla ou Extended.

`sudo apt-get install patchage`

# QJACKCTL

Esse software é necessário para que você possa trabalhar em baixa latência para criar um âmbito realtime.

```json
// search on the internet for

search: [ "low latency kernel"
        , "realtime kernel"
        , "low latency audio"]
```

`sudo apt-get install qjackctl`

Agora como complemento eu uso:

`sudo apt-get install pulseaudio pulseaudio-utils pulseaudio-module-jack`

# Como você deverá ligar no patchage

A princípio os softwares automaticamente buscam conexões abertas. Mas alguns como o zynaddsubfx ou yoshimi (fork do zynaddsubfx) não se irão buscar conexão de audio ou midi automaticamente.

![Patchage Conn](patchage.jpg "Patchage Conn")

# Reactivision

Encontre tudo sobre [aqui](http://reactivision.sourceforge.net/)

# TUIO

Baixe TUIO_PD para interagir com sua Reactable e TUIO_SIMULATOR para simular uma Reactable Virtual.

Encontre tudo sobre [aqui](http://www.tuio.org/?software)
