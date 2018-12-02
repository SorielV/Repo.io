<template lang="pug">
  section.md-navbar
    .hero-nav2
      header#masthead(role='banner')
        .container
          button.hamburger.hamburger--boring(type='button')
            span.hamburger-box
              span.hamburger-inner
          .menu-options.is-flex.is-hidden-touch
            nuxt-link.navbar-item(to='/')
              | Inicio
            nuxt-link.navbar-item(
              to='/admin'
              v-if="$store.state.isAuth && $store.state.isAdmin"
            ) Dashboard
            nuxt-link.navbar-item(to='/repo')
              | Repositorio
            nuxt-link.navbar-item(to='/repo/types')
              | Recursos
            nuxt-link.navbar-item(to='/repo/topics')
              | Tematicas
            nuxt-link.navbar-item.is-hidden-desktop-only(to='/repo/authors')
              | Autores
            nuxt-link.navbar-item.is-hidden-desktop-only(to='/repo/editorials')
              | Editoriales
          form#masthead-search
            input.draw(type='search', name='s', aria-labelledby='search-label', placeholder='Buscar')
          nav#site-nav(role='navigation')
            .container
              .columns.is-centered(style="margin-top: 1rem;")
                .column
                  h4 Paginas
                  ul
                    li
                      nuxt-link(to='/')
                        | Inicio
                    li
                      nuxt-link(
                        to='/admin'
                        v-if="$store.state.isAuth && $store.state.isAdmin"
                      ) Dashboard
                    li
                      nuxt-link(to='/repo')
                        | Repositorio
                    li
                      nuxt-link(to='/repo/types')
                        | Recursos
                    li
                      nuxt-link(to='/repo/topics')
                        | Tematicas
                    li
                      nuxt-link(to='/repo/authors')
                        | Autores
                    li
                      nuxt-link(to='/repo/editorials')
                        | Editoriales
                .column
                  h4 Recursos
                  ul
                    li
                      a(href='#') 1
                    li
                      a(href='#') 2
                    li
                      a(href='#') 3
                    li
                      a(href='#') 4
                    li
                      a(href='#') 5
                .column
                  h4 Tematicas
                  ul
                    li
                      a(href='#') 1
                    li
                      a(href='#') 2
                    li
                      a(href='#') 3
                    li
                      a(href='#') 4
                    li
                      a(href='#') 5
                .column
                  h4 Usuario
                  ul
                    li
                      nuxt-link(to='/login') Login
                    li
                      nuxt-link(to='/singup') Registro
</template>

<style>
/*
Inspiration for this menu: https://dribbble.com/shots/2962837-Header-Nav by Scout: https://dribbble.com/scout
*/
/* 
Full screen background image
*/
.md-navbar {
  left: 0;
  position: fixed;
  right: 0;
  z-index: 30;
}

.hero-nav2 {
  width: 100%;
  height: 100%;
}

/*
Blueish tint overlay
*/
.hero-nav2:after {
  content: '';
  background: rgba(0, 0, 0, 0.5);
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
}

/*
Making sure everything in .hero-nav sits above our :after elements 
*/

.hero-nav2 * {
  position: relative;
  z-index: 1;
}

#masthead {
  padding: 0;
  position: relative;
}

#masthead.is-active {
  /*box-shadow: 0 4px 4px rgba(0, 0, 0, 0.15);*/
  height: 100vh;
}
/*
Using this method because browsers can transition opacity very cheaply as opposed to using background: rgba
https://www.html5rocks.com/en/tutorials/speed/high-performance-animations/
*/
#masthead:after {
  content: '';
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: #fff;
  opacity: 0;
  transition: opacity 0.3s ease;
}

#masthead.is-active:after {
  opacity: 1;
}

/*!
 * Hamburgers
 * @description Tasty CSS-animated hamburgers
 * @author Jonathan Suh @jonsuh
 * @site https://jonsuh.com/hamburgers
 * @link https://github.com/jonsuh/hamburgers
 */
.hamburger,
.menu-options {
  background-color: transparent;
  border: 0;
  color: inherit;
  cursor: pointer;
  display: inline-block;
  float: left;
  font: inherit;
  margin: 0.8125em 0 0;
  overflow: visible;
  outline: none;
  padding: 0;
  text-transform: none;
  transition: opacity 0.15s;
  -webkit-appearance: none;
}

.hamburger:hover {
  opacity: 0.7;
}

.hamburger-box {
  width: 30px;
  height: 24px;
  display: inline-block;
  position: relative;
}

button.hamburger {
  width: 5rem;
}

.hamburger-inner {
  display: block;
  top: 50%;
  margin-top: -2px;
}

.hamburger-inner,
.hamburger-inner::before,
.hamburger-inner::after {
  width: 30px;
  height: 2px;
  background-color: #fff;
  border-radius: 4px;
  position: absolute;
  transition-property: -webkit-transform;
  transition-property: transform;
  transition-property: transform, -webkit-transform;
  transition-duration: 0.15s;
  transition-timing-function: ease;
}

#masthead.is-active .hamburger-inner,
#masthead.is-active .hamburger-inner::before,
#masthead.is-active .hamburger-inner::after {
  background-color: #000;
}

.hamburger-inner::before,
.hamburger-inner::after {
  content: '';
  display: block;
}

.hamburger-inner::before {
  top: -6px;
}

.hamburger-inner::after {
  bottom: -6px;
}

/*
 * Boring
 */
.hamburger--boring .hamburger-inner {
  margin-left: 1.5rem;
}

.hamburger--boring .hamburger-inner,
.hamburger--boring .hamburger-inner::before,
.hamburger--boring .hamburger-inner::after {
  transition-property: none;
}

.hamburger--boring.is-active .hamburger-inner {
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}

.hamburger--boring.is-active .hamburger-inner::before {
  top: 0;
  opacity: 0;
}

.hamburger--boring.is-active .hamburger-inner::after {
  bottom: 0;
  -webkit-transform: rotate(-90deg);
  transform: rotate(-90deg);
}

.hamburger-label {
  color: #fff;
  display: inline-block;
  font-weight: 700;
  letter-spacing: 0.08em;
  line-height: 1;
  margin-left: 0.3125em;
  text-transform: uppercase;
}

.menu-options {
  color: #fff;
  display: inline-block;
  font-weight: 700;
  letter-spacing: 0.08em;
  line-height: 1;
  margin-left: 0.3125em;
  text-transform: uppercase;
}

.menu-options a {
  color: white;
  margin-left: 1rem;
}

#masthead.is-active .hamburger-label {
  color: #000;
}

.hamburger-box,
.hamburger-label {
  display: inline-block;
  vertical-align: middle;
}

#site-nav {
  clear: both;
  display: flex;
  flex-direction: column;
  height: 0;
  overflow: hidden;
  padding-top: 0.75em;
  padding-bottom: 0.5rem;
}

#site-nav.is-active {
  height: auto;
  overflow: visible;
}
/*
#site-nav .col {
  padding-bottom: 2.5em;
}
*/

@media screen and (min-width: 550px) {
  #site-nav {
    flex-direction: row;
    flex-wrap: wrap;
  }

  #site-nav .col {
    flex: 0 0 50%;
  }
}

@media screen and (min-width: 768px) {
  #site-nav .col {
    flex: 0 0 33.333333333%;
  }
}

@media screen and (min-width: 960px) {
  #site-nav {
    flex-wrap: nowrap;
  }

  #site-nav .col {
    flex: 0 0 20%;
  }

  #site-nav .col:last-child {
    display: flex;
    justify-content: flex-end;
  }
}

/*
#site-nav h4 {
  letter-spacing: 0.05em;
  text-transform: uppercase;
}

#site-nav ul {
  list-style-type: none;
  margin-top: 1em;
}

#site-nav li {
  margin-bottom: 0.3125em;
}

#site-nav li a {
  color: #b4b9ba;
  text-decoration: none;
  transition: color 0.3s ease;
}

#site-nav li a:hover,
#site-nav li a:focus {
  color: #686d6e;
}

#site-nav .social {
  margin: 0;
  overflow: hidden;
}

#site-nav .social li {
  float: left;
  margin: 0 0.3125em;
  width: 32px;
  height: 32px;
}

#site-nav .social li svg {
  display: block;
  fill: #b4b9ba;
  width: 100%;
  height: 100%;
  transition: fill 0.3s ease;
}

#site-nav .social li:hover svg {
  fill: #686d6e;
}
*/
#masthead-search {
  margin-right: 1.5rem;
  margin-left: 1.5rem;
  float: right;
  margin-top: 0.625em;
  width: 100%;
  max-width: 12em;
  position: relative;
  -webkit-appearance: none;
}

#masthead-search input {
  margin-right: 1.5rem;
  background: transparent;
  border: none;
  border-color: #fff;
  border-style: solid;
  border-width: 1px;
  /*border-radius: 50px;*/
  outline: none;
  width: 100%;
  padding: 0.75em 1.125em;
  transition: border-color 0.3s ease;
  -webkit-appearance: none;
}

#masthead-search button {
  margin-left: 1.5rem;
  background: none;
  border: none;
  color: #fff;
  font-size: 1em;
  padding: 0;
  position: absolute;
  top: 50%;
  right: 0.75em;
  transform: translateY(-50%);
  -webkit-appearance: none;
}

#masthead.is-active #masthead-search button {
  color: #b4b9ba;
}

#masthead.is-active #masthead-search input {
  border-color: #b4b9ba;
}

#masthead-search ::-webkit-input-placeholder {
  color: #fff;
}

#masthead-search :-moz-placeholder {
  color: #fff;
  opacity: 1;
}

#masthead-search ::-moz-placeholder {
  color: #fff;
  opacity: 1;
}

#masthead-search :-ms-input-placeholder {
  color: #fff;
}

#masthead.is-active #masthead-search ::-webkit-input-placeholder {
  color: #b4b9ba;
}

#masthead.is-active #masthead-search :-moz-placeholder {
  color: #b4b9ba;
  opacity: 1;
}

#masthead.is-active #masthead-search ::-moz-placeholder {
  color: #b4b9ba;
  opacity: 1;
}

#masthead.is-active #masthead-search :-ms-input-placeholder {
  color: #b4b9ba;
}

#masthead .col {
  opacity: 0;
}

#masthead.is-active .col {
  transform: translateY(40px);
  transition: opacity 0.3s ease;
  animation: fade-in-stagger 0.8s ease forwards;
}

#masthead.is-active .col:nth-child(1) {
  -webkit-animation-delay: 0;
}

#masthead.is-active .col:nth-child(2) {
  -webkit-animation-delay: 0.1s;
}

#masthead.is-active .col:nth-child(3) {
  -webkit-animation-delay: 0.2s;
}

#masthead.is-active .col:nth-child(4) {
  -webkit-animation-delay: 0.3s;
}

#masthead.is-active .col:nth-child(5) {
  -webkit-animation-delay: 0.4s;
}

@keyframes fade-in-stagger {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
