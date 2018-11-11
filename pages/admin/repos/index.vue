<template lang="pug">
  section(style="padding: 2%;")
    section.card
      b-tabs.block(
        position="is-centered"
        v-model="selectedTab"
      )
        // Administrar
        b-tab-item(label="Administrar")
          section
            .field.is-grouped
              p.control.is-expanded
                input.input(type="text" placeholder="Busqueda" v-model="search.param")
              p.control
                .field.is-grouped
                  p.control
                    .select
                      select(v-model='search.field')
                        option(v-for="column in table.columns" v-text="column.label" :value="column.field")
                  p.control(v-show="!search.local")
                    .select(v-show="!search.local")
                      select(v-model='search.order')
                        option(value="ASC") ASC
                        option(value="DESC") DESC
              p.control
                p.field
                  b-checkbox(
                    style="margin: 0.5rem;"
                    v-model="search.local"
                  )
                    | {{ search.local ? 'Local' : 'Servidor'}}
              p.control(v-show="!search.local")
                .buttons(v-show="!search.local")
                  button.button.is-light Buscar {{ search.local }}
          section.block
            b-table(
              style="overflow: auto"
              icon-pack="fa"
              :data="table.data"
              :loading="table.loading"
              :page="search.page"
              :per-page="search.perPage"
              checkable
              detailed
              detail-field="id"
              paginated
              backend-pagination
              mobile-cards
              :default-sort-direction="search.sort"
              :default-sort="[search.field, search.sort]"
              :checked-rowstable..sync='table.checkedRows'
              :opened-detailed='table.defaultOpenedDetails'
              :is-row-checkable='(row) => row.id !== 100'
              :total="table.total"
              @page-change="onPageChange"
            )
              template(slot-scope="props")
                b-table-column(
                  field="id"
                  label="Id"
                  :visible="true"
                  :sortable="true"
                ) {{ props.row['id'] }}

                b-table-column(
                  field="title"
                  label="Titulo"
                  :visible="true"
                  :sortable="true"
                ) {{ props.row['title'] }}

                b-table-column(
                  field="url"
                  label="Enlace"
                  :visible="true"
                  :sortable="true"
                )
                  a(:href="props.row['url']" :disabled="props.row['url']" target="_blank")
                    i.mdi.mdi-external-link-alt

                b-table-column(
                  field="type"
                  label="Tipo"
                  :visible="true"
                  :sortable="true"
                ) {{ props.row['type'].map(({ value }) => value).join(',') }}


                b-table-column(
                  field="topic"
                  label="Tema"
                  :visible="true"
                  :sortable="true"
                ) {{ props.row['topic'].map(({ value }) => value).join(',') }}


                b-table-column(
                  field="tags"
                  label="Tags"
                  :visible="true"
                  :sortable="true"
                )
                  b-tooltip(:label="props.row.tags" position="is-bottom")
                    span.tag.is-primary
                      | {{ props.row['tags'] ? props.row['tags'].split(',').length : 0}}


                b-table-column(
                  field="visibility"
                  label="Visibilidad"
                  :visible="true"
                  :sortable="true"
                ) {{ props.row['visibility'] }}

                //-b-table-column(
                  field="file"
                  label="Archivo"
                  :visible="true"
                  :sortable="true"
                //-)
                //-  a(v-if="props.row['file']" :href="props.row['file']" download)
                    i.mdi.mdi-file-download
                  a(v-else)
                    i.mdi.mdi-file-times

                b-table-column(
                  field="image"
                  label="Imagen"
                  :visible="false"
                  :sortable="false"
                ) {{ props.row['image'] }}
                

                b-table-column(
                  field="description"
                  label="Descripcion"
                  :visible="false"
                  :sortable="true"
                ) {{ props.row['description'] }}

                b-table-column(
                  field="author"
                  label="Autores"
                  :visible="true"
                  :sortable="true"
                ) 
                  b-tooltip(:label="props.row.author.map(author => author.firstName + ' ' + author.lastName).join(' , ')" position="is-bottom")
                    span.tag.is-warning
                      | {{ props.row['author'].length }}

                b-table-column(
                  field="username"
                  label="Usuario"
                  :visible="true"
                  :sortable="true"
                ) {{ props.row['username'] }}
  
                b-table-column(
                  field="id" 
                  label="Acciones"
                ) 
                  .buttons.block
                    button.button.is-info.is-small(@click="showDetail($event, props.row)")
                      i.mdi.mdi-eye
                    button.button.is-dark.is-small(@click="showUpdate($event, props.row)")
                      i.mdi.mdi-pencil
                    button.button.is-danger.is-small(@click="handleRemoveDialog(props.row)")
                      i.mdi.mdi-delete

              template(slot="detail" slot-scope="props")
                .content(style="margin: 3%")
                  h1 {{ props.row.title }} 
                    a(v-if="props.row['url']" :href="props.row['url']" target="_blank")
                      i.mdi.fa-external-link-alt
                    a(v-if="props.row['file']" :href="props.row['file']" download)
                      i.mdi.fa-file-download
                  p {{ props.row.description }}

                // pre {{ props }} 
                  {
                    "id": 107,
                    "title": "Nuevo Repo :v",
                    "url": "http://jesus.biz",
                    "topic": 1,
                    "type": 3,
                    "createdAt": null,
                    "tags": "solution,program,programming,Executive",
                    "username": "Soriel",
                    "userId": 1,
                    "visibility": 2,
                    "file": "http://taryn.info",
                    "image": "https://s3.amazonaws.com/uifaces/faces/twitter/yalozhkin/128.jpg",
                    "description": "reboot Consultant transmit Vermont Cambridgeshire cross-platform Small Rubber Chair Tasty Avon New Leu Practical world-class Awesome Concrete Gloves Agent target synthesizing Customer-focused Berkshire online 1080p Legacy SMS",
                    "author": [
                      {
                        "id": 2,
                        "idAuthor": 4,
                        "idRepository": 107,
                        "firstName": "Larissa",
                        "lastName": "Beier"
                      },
                      {
                        "id": 4,
                        "idAuthor": 6,
                        "idRepository": 107,
                        "firstName": "Dena",
                        "lastName": "Okuneva"
                      }
                    ]
                  }
              template(slot='bottom-left')
                | {{ (search.page * search.perPage) > table.total ? table.total : (search.page * search.perPage)  }} de {{ table.total }}
              template(slot="empty")
                section.container
                  section.hero.has-text-centered
                    .hero-body
                      .container
                        h1.title
                          | Error
                        h2.subtitle
                          | Repositorios no encontrados
                        h2.subtitle(v-if="this.data.length !== 0")
                          | Busqueda: {{ search.param }}
                        iframe.container(src="http://wayou.github.io/t-rex-runner/" style="height: 150px")
        // Crear
        b-tab-item(label="Crear")
          form.block(v-on:submit.prevent="handleSubmitCreate")

            b-field(
              label="Titulo"
            )
              b-input(
                type="text"
                v-model="create.title"
                value=""
                maxlength="45"
                :required="true"
              )

            .field.is-grouped
              .field
                label.label Tipo
                .control
                  .select
                    select(v-model="create.type")
                      option(v-for="(type, key) in catalog.types" v-text="type.text" :value="type.value")
              .field
                label.label Tema
                .control
                  .select
                    select(v-model="create.topic")
                      option(v-for="(type, key) in catalog.topics" v-text="type.text" :value="type.value")
            b-field(
              label="Descripcion"
            )
              b-input(
                type="textarea"
                v-model="create.description"
                value=""
                maxlength="400"
                :required="true"
              )

            b-field(
              label="Enlace"
            )
              b-input(
                type="url"
                v-model="create.url"
                value=""
                maxlength="80"
                :required="false"
              )

            b-field(
              label="Tags"
            )
              b-input(
                type="text"
                v-model="create.tags"
                value=""
                maxlength="200"
                :required="false"
              )

            .field
              label.label Visibilidad
              .control
                .select
                  select(v-model="create.visibility")
                    option(v-for="(type, key) in catalog.visibility" v-text="type.text" :value="type.value")
            //.field
              b-checkbox(
                v-model="create.visibility" 
                true-value="Number(2)"
                false-value="Number(1)"
              ) Publico 

            b-field(
              label="Archivo"
            )
              b-input(
                type="text"
                v-model="create.file"
                value=""
                maxlength="60"
                :required="false"
              )

            b-field(
              label="Imagen"
            )
              b-input(
                type="text"
                v-model="create.image"
                value=""
                maxlength="80"
                :required="false"
              )

            .buttons.is-centered
              button.button.is-danger(@click="handleCancelEvent") Cancelar
              button.button.is-dark(type="submit") Crear Repositorio
          pre {{ create }}
        // Actualizar
        b-tab-item(:label='`Actualizar (id: ${update.data.id})`' :disabled="update.index === null")
          form.block(v-on:submit.prevent="handleSubmitUpdate")

            b-field(
              label="Titulo"
            )
              b-input(
                type="text"
                v-model="update.data.title"
                value=""
                maxlength="45"
                :required="true"
              )

            .field.is-grouped
              .field
                label.label Tipo
                .control
                  .select
                    select(v-model="update.data.type")
                      option(v-for="(type, key) in catalog.types" v-text="type.text" :value="type.value")
              .field
                label.label Tema
                .control
                  .select
                    select(v-model="update.data.topic")
                      option(v-for="(type, key) in catalog.topics" v-text="type.text" :value="type.value")
            b-field(
              label="Descripcion"
            )
              b-input(
                type="textarea"
                v-model="update.data.description"
                value=""
                maxlength="400"
                :required="true"
              )

            b-field(
              label="Enlace"
            )
              b-input(
                type="url"
                v-model="update.data.url"
                value=""
                maxlength="80"
                :required="false"
              )

            b-field(
              label="Tags"
            )
              b-input(
                type="text"
                v-model="update.data.tags"
                value=""
                maxlength="200"
                :required="false"
              )

            section
              .block.has-text-centered
                div
                  h1.subtitle Autores
                    button.button.is-info.is-small(@click="handleShowCreateAuthor" style="margin-left: 0.5%;")
                      i.mdi.mdi-plus
              b-table(
                icon-pack="fa"
                :data="update.data.author"
                :loading="false"
                mobile-cards
                :total="update.data.author ? update.data.author.length : 0"
              )
                template(slot-scope="props")
                  b-table-column(
                    field="id"
                    label="Id"
                    :visible="true"
                    :sortable="true"
                  ) {{ props.row['id'] }}

                  b-table-column(
                    field="idAuthor"
                    label="Id Author"
                    :visible="true"
                    :sortable="true"
                  ) {{ props.row['idAuthor'] }}

                  b-table-column(
                    field="idRepository"
                    label="Id Repositorio"
                    :visible="true"
                    :sortable="true"
                  ) {{ props.row['idRepository'] }}

                  b-table-column(
                    field="firstName"
                    label="Nombre"
                    :visible="true"
                    :sortable="true"
                  ) {{ props.row['firstName'] }}

                  b-table-column(
                    field="lastName"
                    label="Apellido"
                    :visible="true"
                    :sortable="true"
                  ) {{ props.row['lastName'] }}

                  b-table-column(
                    field="id" 
                    label="Acciones"
                  ) 
                    .buttons.block
                      button.button.is-danger.is-small(@click="handleRemoveDialog(props.row)")
                        i.mdi.mdi-window-close
                      button.button.is-success.is-small(v-if="props.row.id === null" @click="handleSaveAuthorDialog(props.row)")
                        i.mdi.mdi-check

            .field
              label.label Visibilidad
              .control
                .select
                  select(v-model="update.data.visibility")
                    option(v-for="(type, key) in catalog.visibility" v-text="type.text" :value="type.value")
            //.field
              b-checkbox(
                v-model="update.data.visibility" 
                true-value="Number(2)"
                false-value="Number(1)"
              ) Publico 

            b-field(
              label="Archivo"
            )
              b-input(
                type="text"
                v-model="update.data.file"
                value=""
                maxlength="60"
                :required="false"
              )

            b-field(
              label="Imagen"
            )
              b-input(
                type="text"
                v-model="update.data.image"
                value=""
                maxlength="80"
                :required="false"
              )

            .buttons.is-centered
              button.button.is-danger(@click="handleCancelEvent") Cancelar
              button.button.is-dark(type="submit") Actualizar Repositorio
    // Agregar Author [Repo]
    b-modal(:active.sync="update.showModalAuthor" :width="640" scroll="keep")
      section.card(style="padding: 10%; width: auto; height: 400px;")
        b-field(label="Busca Autores")
          b-autocomplete(
            v-model="update.filter"
            :data="filterAuthors"
            field="lastName"
            :open-on-focus="true"
            :clear-on-select="true"
            placeholder="Buscar Autor"
            @select="hadleSelectAuthor"
          )
            template(slot-scope="props")
              p {{ props.option.lastName + ' ' + props.option.firstName }}
        b-table(
          :data="update.data.author"
          :loading="false"
          mobile-cards
          :total="update.data.author ? update.data.author.length : 0"
        )
          template(slot-scope="props")
            b-table-column(
              field="id"
              label="Id"
              :visible="true"
              :sortable="true"
            ) {{ props.row['id'] }}

            b-table-column(
              field="idAuthor"
              label="Id Author"
              :visible="true"
              :sortable="true"
            ) {{ props.row['idAuthor'] }}

            b-table-column(
              field="idRepository"
              label="Id Repositorio"
              :visible="false"
              :sortable="true"
            ) {{ props.row['idRepository'] }}

            b-table-column(
              field="firstName"
              label="Nombre"
              :visible="true"
              :sortable="true"
            ) {{ props.row['firstName'] }}

            b-table-column(
              field="lastName"
              label="Apellido"
              :visible="true"
              :sortable="true"
            ) {{ props.row['lastName'] }}

            b-table-column(
              field="id" 
              label="Acciones"
            )
              .buttons
                button.button.is-danger.is-small(@click="handleRemoveDialog(props.row)")
                  i.mdi.mdi-window-close
                button.button.is-success.is-small(v-if="props.row.id === null" @click="handleSaveAuthorDialog(props.row)")
                  i.mdi.mdi-check
</template>

<script>
import debounce from 'lodash/debounce'

const columns = [
  {
    field: 'id',
    label: 'Id',
    sortable: true,
    visible: true,
    type: 'number'
  },
  {
    field: 'title',
    label: 'Titulo',
    sortable: true,
    visible: true,
    type: 'string'
  },
  {
    field: 'url',
    label: 'Enlace',
    sortable: true,
    visible: true,
    type: 'string'
  },
  {
    field: 'type',
    label: 'Tipo',
    sortable: true,
    visible: true,
    type: 'string'
  },
  {
    field: 'topic',
    label: 'Tema',
    sortable: true,
    visible: true,
    type: 'string'
  },
  {
    field: 'tags',
    label: 'Tags',
    sortable: true,
    visible: true,
    type: 'string'
  },
  {
    field: 'visibility',
    label: 'Visibilidad',
    sortable: true,
    visible: true,
    type: 'string'
  },
  {
    field: 'file',
    label: 'Archivo',
    sortable: true,
    visible: true,
    type: 'string'
  },
  {
    field: 'image',
    label: 'Imagen',
    sortable: true,
    visible: false,
    type: 'string'
  },
  {
    field: 'description',
    label: 'Descripcion',
    sortable: true,
    visible: false,
    type: 'string'
  },
  {
    field: 'authors',
    label: 'Autores',
    sortable: true,
    visible: true,
    type: 'string'
  },
  {
    field: 'username',
    label: 'Usuario',
    sortable: true,
    visible: true,
    type: 'string'
  }
]

export default {
  layout: 'admin',
  head() {
    return {
      title: 'Repositorios'
    }
  },
  async asyncData({ app }) {
    try {
      const {
        data: { data }
      } = await app.$axios.get('/api/repo')
      return {
        data: data,
        table: {
          loading: false,
          columns,
          defaultOpenedDetails: [],
          checkedRows: [],
          data: data,
          total: data.length
        }
      }
    } catch (error) {
      alert(error)
      return {
        data: [],
        table: {
          loading: false,
          columns,
          defaultOpenedDetails: [],
          checkedRows: [],
          data: [],
          total: 0
        }
      }
    }
  },
  data() {
    return {
      author: null,
      data: [],
      selectedTab: 0,
      update: {
        index: null,
        filterAuthors: [],
        selected: [],
        filter: '',
        showModalAuthor: false,
        data: {
          author: [],
          id: 0
        }
      },
      create: {
        type: 1,
        topic: 1
      },
      search: {
        local: true,
        field: 'id',
        order: 'ASC',
        param: null,
        perPage: 10,
        page: 1
      },
      table: {
        loading: true,
        columns,
        defaultOpenedDetails: [],
        checkedRows: [],
        data: [],
        total: 0
      },
      catalog: {
        types: [
          { text: 'Papers', value: 1 },
          { text: 'Books', value: 2 },
          { text: 'Cursos', value: 3 },
          { text: 'Videos', value: 4 },
          { text: 'Portales Blogs', value: 5 },
          { text: 'Tools Software', value: 6 },
          { text: 'PPTs SlideShare', value: 7 },
          { text: 'Infografias y Memes', value: 8 },
          { text: 'People To Follow', value: 9 },
          { text: 'Comunidades', value: 10 },
          { text: 'APIs', value: 11 },
          { text: 'DataSets', value: 12 }
        ],
        topics: [
          { text: 'Arte', value: 1 },
          { text: 'Comics', value: 2 },
          { text: 'Cultura', value: 3 },
          { text: 'Comida', value: 4 },
          { text: 'Videojuegos', value: 5 },
          { text: 'Humor', value: 6 },
          { text: 'Musica', value: 7 },
          { text: 'Fotografia', value: 8 },
          { text: 'Deportes', value: 9 },
          { text: 'Estilo', value: 10 },
          { text: 'TV', value: 11 },
          { text: 'Negocios', value: 12 },
          { text: 'Disenio', value: 13 },
          { text: 'Negocios', value: 14 },
          { text: 'Econimia', value: 16 },
          { text: 'Javascript', value: 17 },
          { text: 'Machine Learning', value: 19 },
          { text: 'Programing', value: 20 },
          { text: 'Sotfware', value: 21 },
          { text: 'Tecnologia', value: 22 },
          { text: 'Otros', value: 23 }
        ],
        visibility: [
          { text: 'Visible', value: 1 },
          { text: 'Oculto', value: 2 },
          { text: 'Inhabilitado', value: 3 }
        ]
      }
    }
  },
  computed: {
    filterAuthors() {
      if (this.author === null) {
        this.getAuthors()
      }

      const filter = this.update.filter
      if (filter.length > 1) {
        const filtered = Array.apply(null, this.author).filter(author => {
          return (
            `${author.firstName} ${author.lastName}`
              .toLowerCase()
              .indexOf(filter.toLowerCase()) >= 0
          )
        })
        console.log(filtered, Array.apply(null, this.author))
        return filtered
      } else {
        return []
      }
    }
  },
  watch: {
    'search.param'(nparam) {
      if (this.search.local) {
        if (nparam === '' || nparam === null) {
          this.table.data = this.data
          return
        }

        const _field = this.search.field
        const { type } = Array.apply(null, this.table.columns).find(
          ({ field }) => field === _field
        )

        if (type === 'string' || type === 'date') {
          const param = nparam.toUpperCase()
          this.table.data = Array.apply(null, this.data).filter(item => {
            return item[_field].toUpperCase().includes(param)
          })
        } else if (type === 'number') {
          const param = nparam
          this.table.data = Array.apply(null, this.data).filter(item => {
            return item[_field] == param
          })
        }
      }
    }
  },
  methods: {
    hadleSelectAuthor(data) {
      if (data !== null) {
        const author = data
        if (
          Array.apply(null, this.update.data.author).findIndex(
            item => item.idAuthor === author.id
          ) === -1
        ) {
          this.update.data.author.push({
            id: null,
            idRepository: this.update.data.id,
            idAuthor: author.id,
            lastName: author.lastName,
            firstName: author.firstName,
            createdAt: Date.now()
          })
        }
        console.log(data)
      }
    },
    async getAuthors() {
      try {
        const { data } = await this.$axios.get('/public/authors.json')
        this.author = data
      } catch (error) {
        console.error(error)
        this.$toast.open({
          message: 'Error al obtener lista de autores',
          type: 'is-danger'
        })
        this.author = []
      }
    },
    onPageChange(page) {
      this.search.page = page
    },
    handleCancelEvent(ev) {
      ev.preventDefault()
      this.selectedTab = 0
    },
    async handleSubmitCreate() {
      const author = this.create
      try {
        const {
          data: { data }
        } = await this.$axios.post('/api/repo', this.create)
        this.create = {}
        data.author = [] // Estado Inicial
        this.data.push(data)
        // this.table.data.push(data)
        this.showUpdate(null, data)
        this.selectedTab = 2
        this.$toast.open({
          message: 'Repositorio Creado C:',
          type: 'is-success'
        })
      } catch (error) {
        console.error(error)
        this.$toast.open({
          message: 'Error al creare Repositorio',
          type: 'is-danger'
        })
      }
    },
    async handleSubmitUpdate(ev) {
      const item = this.update.data
      try {
        const { data } = await this.$axios.put(
          '/api/repo/' + item.id,
          this.update.data
        )
        this.update.index = null
        this.update.data = {
          author: [],
          id: 0
        }
        this.data.splice(this.update.index, 1, data.data)

        const index = Array.apply(null, this.table.data).findIndex(
          ({ id }) => id === item.id
        )
        if (index !== -1) {
          this.table.data.splice(index, 1, data.data)
        }
        this.selectedTab = 0
        this.$toast.open({
          message: 'Autor de Repositorio Actulizado',
          type: 'is-success'
        })
      } catch (error) {
        console.error(error)
        this.$toast.open({
          message: 'Erro al actualizar Autor de Repositorio',
          type: 'is-danger'
        })
      }
    },
    async removeAuthor(row) {
      try {
        const { data } = await this.$axios.delete('/api/repo/' + row.id)
        this.data.splice(this.data.indexOf(row), 1) // General
        const dataIndex = this.table.data.indexOf(row) // Subbusqueda

        if (dataIndex !== -1) {
          this.table.data.splice(dataIndex, 1)
        }

        this.$toast.open({
          message: 'Usuario Borrado!',
          type: 'is-success'
        })
      } catch (error) {
        console.error(error)
        this.$toast.open({
          message: 'Error al eliminar autor!',
          type: 'is-danger'
        })
      }
    },
    handleShowCreateAuthor(ev) {
      ev.preventDefault()
      this.update.showModalAuthor = true
    },
    handleRemoveDialog(row) {
      this.$dialog.confirm({
        iconPack: 'fa',
        message: `<pre>${JSON.stringify(row, undefined, 4)}</pre>`,
        title: 'Borrar Cuenta',
        confirmText: 'Borrar',
        type: 'is-danger',
        hasIcon: false,
        onConfirm: () => {
          this.removeAuthor(row)
        }
      })
    },
    showDetail(ev, row) {
      const index = Array.apply(
        null,
        this.table.defaultOpenedDetails
      ).findIndex(({ id }) => id === row.id)
      if (index === -1) {
        this.table.defaultOpenedDetails.push(row)
      } else {
        this.table.defaultOpenedDetails.splice(index, 1)
      }
    },
    showUpdate(ev, row) {
      const index = this.data.indexOf(row)
      console.log(index)
      const data = JSON.parse(JSON.stringify(row))
      this.update.index = index
      this.update.data = data
      this.selectedTab = 2
    },
    async handleSaveAuthorDialog({
      idRepository,
      idAuthor,
      firstName,
      lastName
    }) {
      const indexRepo = this.update.index
      const indexAuthor = Array.apply(null, this.update.data.author).indexOf(
        item => item.id === idAuthor
      )
      const repoAuthor = {
        id: null,
        idAuthor,
        idRepository
      }
      const repository = this.data[indexRepo] // Ref
      if (!repository.hasOwnProperty('author')) {
        repository.author = []
      }

      try {
        const {
          data: { data }
        } = await this.$axios.post(
          `/api/repo/${idRepository}/author`,
          repoAuthor
        )
        data.lastName = lastName
        data.firstName = firstName
        console.log(data)
        repository.author.push(data)
        if (this.update.data.id === data.idRepository) {
          this.update.data.author.splice(indexAuthor, 1, data)
        }
      } catch (error) {
        console.error(error)
        alert(error.message)
      }
    }
  }
}
</script>
