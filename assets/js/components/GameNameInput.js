import React, { useEffect, useState } from 'react'
import styled from 'styled-components'
import _ from 'lodash'

import {useKey} from 'react-use'

const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ '
const LETTERS = ALPHABET.split('')
const CHUNKED = _.chunk(LETTERS, 10)
CHUNKED[2].push('CLR')
CHUNKED[2].push('END')

const clampKeyboardPosition = (v) => (
  Math.max(0, Math.min(v, 28))
)
const c = clampKeyboardPosition

const prevDefault = f => e => {
  e.preventDefault()
  f(e)
}

const GameNameInput = (props) => {
  const [name, setName] = useState(props.name || '_')
  const [cursorPosition, setCursorPosition] = useState(0)
  const [entered, setEntered] = useState(false)
  const positionX = (cursorPosition % 10)
  const positionY = Math.floor(cursorPosition / 10)

  const enterDoctorName = () => {
    const DN = document.getElementById('doctor_name')
    DN.value = name
    setEntered(true)

    const DT = document.getElementById('doctor-form-type-input')
    DT.style = 'display: visible'

    const DS = document.getElementById('doctor-form-submit-input')
    DS.style = 'display: visible'
  }
  useEffect(() => {
    const DN = document.getElementById('doctor-form-name-input')
    DN.style = 'display: none'

    const DT = document.getElementById('doctor-form-type-input')
    DT.style = 'display: none'

    const DS = document.getElementById('doctor-form-submit-input')
    DS.style = 'display: none'
  }, [])

  useKey('ArrowUp', prevDefault(() => setCursorPosition(p => c(p - 10))))
  useKey('ArrowDown', prevDefault(() => setCursorPosition(p => c(p + 10))))
  useKey('ArrowLeft', prevDefault(() => setCursorPosition(p => c(p - 1))))
  useKey('ArrowRight', prevDefault(() => setCursorPosition(p => c(p + 1))))
  useKey('Enter', () => {
    setName(n => {
      const l = ALPHABET[cursorPosition]

      if (positionY === 2) {
        if (positionX === 7) {
          if (n === '_') return n
          const min = n.substring(0, n.length - 1)

          return (min === '') ? '_' : min
        } else if (positionX === 8) {
          enterDoctorName()
          return n
        }
      }

      if (n === '_') {
        return l
      } else {
        return n + l
      }
    })
  }, {}, [cursorPosition])

  return (
    <Container>
      <Name>{name}</Name>
      {!entered && (
        <Keyboard>
          {CHUNKED.map((c, y) => (
            <Row key={y}>
              {c.map((l, x) => (
                <Letter key={l} highlight={x === positionX && y === positionY}>{l}</Letter>
              ))}
            </Row>
          ))}
          <Cursor
            style={{ left: 50 * positionX, top: 50 * positionY }}
          />
        </Keyboard>
      )}
    </Container>
  )
}

const Container = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
`
const Name = styled.div`
  text-align: center;
  margin: 2rem;
  content: ' ';
`
const Cursor = styled.div`
  top: 0;
  left: 0;
  z-index: -1;
  position: absolute;
  background-color: red;
  height: 50px;
  width: 50px;
`
const Row = styled.div`
  display: flex;
`
const Keyboard = styled.div`
  position: relative;
  width: 500px;
  align-self: center;
`
const Letter = styled.div`
  ${props => props.highlight && `
    color: white;
  `}
  display: flex;
  align-items: center;
  font-weight: bold;
  justify-content: center;
  height: 50px;
  width: 50px;
`

export default GameNameInput
