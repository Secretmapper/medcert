import React, { useCallback, useState, useEffect } from 'react'
import styled from 'styled-components'

const NathanGame = (props) => {
  const [inGame, setInGame] = useState(false)
  const onClick = useCallback((e) => {
    e.preventDefault()

    if (!inGame) {
      setInGame(true)
    }
  }, [inGame, setInGame])

  useEffect(() => {
    document.getElementById('nathan-delete')
      .removeEventListener('click', onClick)

    document.getElementById('nathan-delete')
      .addEventListener('click', onClick)
  }, [onClick])

  return (
    <Container inGame={inGame}>
      <RPGText>
        <p>Nathan does not want to be deleted</p>
        <p>Nathan CANNOT be deleted</p>
      </RPGText>
    </Container>
  )
}

const Container = styled.div`
  ${props => !props.inGame && `
    display: none;
  `}
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: #0a0a0a;
  text-align: left;
  color: white;
`

const RPGText = styled.div`
  position: absolute;
  bottom: 50px;
  left: 50px
`

export default NathanGame
