A Sound class fornece uma maneira simples e reutilizável de gerenciar e reproduzir sons em um jogo Roblox usando Programação Orientada a Objetos (POO).

## Funcionalidades
Lógica de som encapsulada: Toda a lógica relacionada a sons está dentro da classe Sound.
Reutilizável: Permite reproduzir qualquer som em diferentes partes do jogo sem repetir código.
Gerenciamento dinâmico de sons: Cria automaticamente uma pasta ActiveSounds para gerenciar os sons que estão sendo reproduzidos no workspace.

## Métodos
Sound.new()
Cria uma nova instância da classe Sound.

local SoundManager = Sound.new()
playSound(location, volume, looped)
Reproduz um som da localização especificada.


location: O objeto de som (será clonado).
volume: O nível de volume do som.
looped: Define se o som será reproduzido em loop ou apenas uma vez.

local soundLocation = game.ReplicatedStorage.Sounds.ZombieAttack
SoundManager:playSound(soundLocation, 1, false) -- Reproduz o som com volume 1, sem looping


## Como Funciona
A classe verifica se o som especificado existe.
Se a pasta ActiveSounds não existir, ela é criada automaticamente no workspace para gerenciar sons ativos.
O som é clonado, reproduzido e destruído após terminar, caso não esteja configurado para repetir.

local SoundManager = Sound.new()
local RS = game:GetService("ReplicatedStorage")
local zombieSound = RS.Sounds.ZombieAttack
SoundManager:playSound(zombieSound, 0.8, false) -- Reproduz um som de ataque zumbi com volume de 80%

## Por que Usar?
Princípios de POO: Encapsula a funcionalidade de sons em uma classe, tornando o código mais modular e fácil de manter.
Flexibilidade: Reproduza sons de qualquer local com configuração mínima.
Limpeza Automática: Sons são automaticamente removidos do jogo após serem reproduzidos, mantendo o ambiente organizado.
