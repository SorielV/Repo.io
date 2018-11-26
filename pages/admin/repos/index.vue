<template lang="pug">
  section(style="padding: 2% 2% 2% 2%;")
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

                //-b-table-column(
                  field="url"
                  label="Enlace"
                  :visible="true"
                  :sortable="true"
                //-)
                  a(:href="props.row['url']" :disabled="props.row['url']" target="_blank")
                    i.mdi.mdi-external-link-alt

                b-table-column(
                  field="resource"
                  label="Archivos"
                  :visible="true"
                  :sortable="true"
                  centered
                ) 
                  .buttons.is-centered(@click="handleShowAddResources")
                    .button.is-danger.is-small {{ props.row['resource'].length }}

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
                  centered
                )
                  .buttons.is-centered
                    b-tooltip(
                      :label="props.row.tags"
                      position="is-bottom"
                      type="is-info"
                    )
                      span.tag.is-info
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
                  centered
                ) 
                  .buttons.is-centered(@click="handleShowCreateAuthor")
                    b-tooltip(
                      :label="props.row.author.map(author => author.firstName + ' ' + author.lastName).join(' , ')"
                      position="is-bottom"
                      type="is-warning"
                    )
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

              template(slot='bottom-left')
                | {{ (search.page * search.perPage) > table.total ? table.total : (search.page * search.perPage)  }} a {{ table.total }} de {{ pagination.total }} 

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
        b-tab-item(label="Crear Base (?)")
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

            //-.field.is-grouped
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
              label="Tags"
            )
              b-input(
                type="text"
                v-model="create.tags"
                value=""
                maxlength="200"
                :required="false"
              )

            //-b-field(
              label="Imagen"
            //-)
              b-input(
                type="text"
                v-model="create.image"
                value=""
                maxlength="80"
                :required="false"
              )

            .field
              label.label Imagen
              .control.is-box(v-if="upload.isSelected")
                figure.image.is-256x256
                  img#createImage(src='"/public/empty.png"' )
                .is-overlay
                  .buttons
                    button.button.is-danger(v-on:click.stop="handleRemoveInputFileupload")
                      i.mdi.mdi-close
              .control
                b-upload(
                  v-show="!upload.isSelected"
                  v-model='upload.imageFile'
                  type="is-black"
                  single drag-drop
                  style="width: 100%;"
                  @input="handleCreateInputFile"
                )
                  section.section
                    center
                      .content.has-text-centered
                        p
                          b-icon(icon='upload', size='is-large')
                        p Suelta La Imagen
              

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

            //-b-field(
              label="Archivo"
              )
              b-input(
                type="text"
                v-model="create.file"
                value=""
                maxlength="60"
                :required="false"
              )

            .buttons.is-centered
              button.button.is-danger(@click="handleCancelEvent") Cancelar
              button.button.is-dark(type="submit") Crear Repositorio Base
          pre {{ create }}

        // Actualizar
        b-tab-item(:label='`Actualizar (id: ${update.data.id})`' :disabled="update.index === null")
          b-tabs.block(position='is-centered')
            // Informacion Basica
            b-tab-item(label='Informacion Basica')
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
                  label="Tags"
                )
                  b-input(
                    type="text"
                    v-model="update.data.tags"
                    value=""
                    maxlength="200"
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

                .field
                  label.label Visibilidad
                  .control
                    .select
                      select(v-model="update.data.visibility")
                        option(v-for="(type, key) in catalog.visibility" v-text="type.text" :value="type.value")

                .buttons.is-centered
                  button.button.is-danger(@click="handleCancelEvent") Cancelar
                  button.button.is-dark(type="submit") Actualizar Repositorio

            // Autores, Tipos, Temas
            b-tab-item(label='Autores, Tipos, Temas')
              .field
                label.label Autores
                .control
                  b-autocomplete(
                    v-model="catalog.authorFilter"
                    :data="filterAuthors"
                    placeholder="Agregar Autores"
                    @select='author => addAuthor(author)'
                  )
                    template(slot-scope='props')
                      .media
                        .media-left
                          img(width='32' :src="props.option.image || 'https://bulma.io/images/placeholders/128x128.png'")
                        .media-content
                          | {{ props.option.firstName + ' ' + props.option.lastName }}
                          br
                          small
                            | rated

                  section.has-my-1
                    .columns.is-multiline
                      .column.is-4(v-for='(author, index) in update.data.author' :key='index')
                        .box
                          article.media
                            .media-left
                              figure.image.is-64x64
                                img(:src="author.image || 'https://bulma.io/images/placeholders/128x128.png'" alt='Image')
                            .media-content
                              .content
                                p
                                  strong {{ author.firstName + ' ' + author.lastName }}
                              nav.level.is-mobile
                                .level-left
                                  a.button.is-danger.is-small.level-item(aria-label='reply')
                                    span.icon.is-small
                                      i.mdi.mdi-window-close(aria-hidden='true')

              b-field(label='Tipos')
                b-taginput(
                  v-model='update.data.type'
                  :data='catalog.filteredTypes'
                  autocomplete
                  :allow-new='false'
                  field='value'
                  icon='label'
                  @typing='getFilteredTypes'
                  @remove="removeType"
                  @add="addType"
                )

              b-field(label='Temas')
                b-taginput(
                  v-model='update.data.topic'
                  :data='catalog.filteredTopics'
                  autocomplete
                  :allow-new='false'
                  field='value'
                  icon='label'
                  @typing='getFilteredTopics'
                  @remove="removeTopic"
                  @add="addTopic"
                )
            // Recursos
            b-tab-item(label='Recursos')
              button.is-info(@click="upload.isModalResourceActive = true") Agregar
              b-table(
                v-cloak
                :data="update.data.resource"
                mobile-cards
                :total="update.data.resource.length"
              )
                template(slot-scope="props")
                  b-table-column(
                    field="name"
                    label="Nombre"
                    :visible="true"
                    sortable
                  )
                    span(v-if="props.row['name']") {{ props.row['name'] }} 
                    i(v-else) Sin Nombre

                  b-table-column(
                    field="description"
                    label="Descripcion"
                    :visible="true"
                    sortable
                  )
                    span(v-if="props.row['description']") {{ props.row['description'] }} 
                    i(v-else) Sin Descripcion
                  
                  b-table-column(
                    field="file"
                    label="Recurso"
                    :visible="true"
                    sortable
                  ) {{ props.row['file'] }}
                  
                  b-table-column(
                    field="id"
                    label="Acciones"
                  )
                    .buttons
                      button.button.is-dark.is-small(@click="showUpdateResource($event, props.row)")
                        i.mdi.mdi-pencil
                      button.button.is-danger.is-small(@click="handleRemoveResourceDialog($event, props.row)")
                        i.mdi.mdi-delete
                      button.button.is-link.is-small(@click="downloadFile(props.row)")
                        i.mdi.mdi-download

              // Nuevo Recurso
              b-modal(:active.sync='upload.isModalResourceActive', has-modal-card='')
                .card(style="padding: 2rem; border-radius: 0.275rem;")
                  form(v-on:submit.prevent="handleSubmitCreateResource")
                    b-field(
                      label="Nombre"
                    )
                      b-input(type="Nombre"
                        v-model="upload.resource.name"
                        maxlength="60"
                        :required="true"
                      )

                    b-field(
                      label="Descripcion"
                    )
                      b-input(type="text"
                        v-model="upload.resource.description"
                        maxlength="120"
                        :required="true"
                      )

                    .field
                      label.label Tipo
                      .control
                        .select
                          select(v-model="upload.resource.type")
                            option(value="1") Imagen
                            option(value="2") Documento
                            option(value="3") Video Youtube
                            option(value="4") Playlist Youtube
                            option(value="5") Audios

                    .field
                      b-checkbox(v-model='upload.resource.uploaded')
                        | {{ upload.resource.uploaded ? 'Interna' : 'Externa' }}

                    .field(v-if="upload.resource.uploaded")
                      label.label Recurso
                      .control.is-box
                        div
                          b-upload(
                            v-model='upload.file.file'
                            type="is-black"
                            :single='true'
                            drag-drop
                            :required="true"
                            style="width: 100%;"
                            @input="resourceSelected"
                          )
                            section.section
                              center
                                .content.has-text-centered
                                  p
                                    b-icon(icon='upload', size='is-large')
                                  p Suelta La Imagen
                    .field(v-else)
                      b-field(
                        label="Recurso"
                      )
                        b-input(type="text"
                          v-model="upload.resource.file"
                          maxlength="120"
                          :required="true"
                        )
                    .buttons
                      button.button.is-danger(@click="closeResourceModal") Cancelar
                      button.button.is-info(type="submit") Guardar
        //- Upload File
        //-b-upload(v-model='update.dropFiles' type="is-black" multiple drag-drop style="width: 100%;")
          section.section
            center
              .content.has-text-centered
                p
                  b-icon(icon='upload', size='is-large')
                p Suelta tus Archivos
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
        data: { data = [], ...pagination }
      } = await app.$axios.get('/api/repo?full=true')

      return {
        data: data,
        pagination,
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
      pagination: {},
      author: null,
      data: [],
      selectedTab: 0,
      update: {
        index: null,
        filterAuthors: [],
        selected: [],
        filter: '',
        dropFiles: [],
        showModalAuthor: false,
        showModalResource: false,
        data: {
          resource: [],
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
      upload: {
        isModalResourceActive: false,
        isSelected: false,
        file: {
          fileName: '',
          file: []
        },
        resource: {}
      },
      catalog: {
        authorFilter: '',
        filteredTypes: [],
        filteredTopics: [],
        authors: [],
        types: [
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'Papers',
            idCatalog: 1
          },
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'Books',
            idCatalog: 2
          },
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'Cursos',
            idCatalog: 3
          },
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'Videos',
            idCatalog: 4
          },
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'Portales Blogs',
            idCatalog: 5
          },
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'Tools Software',
            idCatalog: 6
          },
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'PPTs SlideShare',
            idCatalog: 7
          },
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'Infografias y Memes',
            idCatalog: 8
          },
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'People To Follow',
            idCatalog: 9
          },
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'Comunidades',
            idCatalog: 10
          },
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'APIs',
            idCatalog: 11
          },
          {
            image: 'http://www.nyan.cat/cats/original.gif',
            value: 'DataSets',
            idCatalog: 12
          }
        ],
        topics: [
          { value: 'Arte', idCatalog: 1 },
          { value: 'Comics', idCatalog: 2 },
          { value: 'Cultura', idCatalog: 3 },
          { value: 'Comida', idCatalog: 4 },
          { value: 'Videojuegos', idCatalog: 5 },
          { value: 'Humor', idCatalog: 6 },
          { value: 'Musica', idCatalog: 7 },
          { value: 'Fotografia', idCatalog: 8 },
          { value: 'Deportes', idCatalog: 9 },
          { value: 'Estilo', idCatalog: 10 },
          { value: 'TV', idCatalog: 11 },
          { value: 'Negocios', idCatalog: 12 },
          { value: 'Disenio', idCatalog: 13 },
          { value: 'Negocios', idCatalog: 14 },
          { value: 'Econimia', idCatalog: 16 },
          { value: 'Javascript', idCatalog: 17 },
          { value: 'Machine Learning', idCatalog: 19 },
          { value: 'Programing', idCatalog: 20 },
          { value: 'Sotfware', idCatalog: 21 },
          { value: 'Tecnologia', idCatalog: 22 },
          { value: 'Otros', idCatalog: 23 }
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
      // console.log(this.catalog.authors)
      if (this.catalog.authors.length === 0) {
        this.getAuthors()
      }

      // console.log(this.catalog.authors, this.catalog.authorFilter)
      const filter = this.catalog.authorFilter || ''

      if (filter.length > 1) {
        const filtered = Array.from(this.catalog.authors).filter(author => {
          return (
            `${author.firstName} ${author.lastName}`
              .toLowerCase()
              .indexOf(filter.toLowerCase()) !== -1
          )
        })
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
    },
    'update.dropFiles'(newFile, oldFile) {
      const newFiles =
        oldFile.length !== 0
          ? newFile.filter(file => oldFile.indexOf(file) === -1)
          : newFile
    }
  },
  methods: {
    handleRemoveResourceDialog(ev, resource) {
      ev.preventDefault()

      this.$dialog.confirm({
        iconPack: 'mdi',
        message: `<pre>${JSON.stringify(resource, undefined, 2)}</pre>`,
        title: 'Eliminar Recurso',
        confirmText: 'Eliminar',
        type: 'is-danger',
        hasIcon: false,
        onConfirm: async () => {
          console.log('Eliminar')
          // API Call
          // Then
          const { id: idResource } = resource
          const {
            data: { id: idRepository }
          } = this.update

          try {
            await this.$axios.delete(
              `/api/repo/${idRepository}/resource/${idResource}`
            )

            const index = Array.from(this.table.data).findIndex(
              ({ id }) => id === idRepository
            )

            const itemIndex =
              index !== -1
                ? Array.from(this.table.data[index].resource).findIndex(
                    ({ id }) => id === resource.id
                  )
                : null

            console.log(index, itemIndex)

            if (itemIndex !== null) {
              console.log(
                'Removed',
                this.table.data[index].resource.splice(itemIndex, 1),
                this.update.data.resource.splice(itemIndex, 1)
              )
            }

            this.$toast.open({
              message: 'Recurso Borrado',
              type: 'is-success'
            })
          } catch (err) {
            this.$toast.open({
              message: 'Error al borrar recurso',
              type: 'is-danger'
            })
          }
        }
      })
    },
    showUpdateResource() {
      return
    },
    async handleSubmitCreateResource() {
      const {
        file: {
          file: [file]
        },
        resource
      } = this.upload

      const {
        data: { id: idRepository }
      } = this.update

      const data = resource.uploaded ? this.createFormData(resource) : resource

      if (resource.uploaded) {
        data.delete('file')
        data.append('file', file)
      }

      const index = Array.from(this.table.data).findIndex(
        ({ id }) => id === idRepository
      )

      try {
        const {
          data: { data: resource }
        } = await this.$axios.post(`/api/repo/${idRepository}/resource`, data)

        // Agregar A Lista
        this.table.data[index].resource.push(resource)

        // Actualizar Repositorio Actual [Editando]
        this.update.data.resource.push(resource)

        this.uploaded.isModalResourceActive = false

        this.$toast.open({
          message: 'Recurso Agregado',
          type: 'is-success'
        })
      } catch (error) {
        this.$toast.open({
          message: 'Error al Agregar recurso',
          type: 'is-danger'
        })
        console.error(error.message)
      }

      /*
      const index = Array.from(this.table.data).findIndex(
        ({ id }) => id === idRepository
      )

      this.table.data[index].resource.push(this.upload.resource)

      console.log(index)
      console.log(this.upload.resource)
      */
    },
    closeResourceModal(ev) {
      ev.preventDefault()
      this.upload.isModalResourceActive = false
    },
    resourceSelected() {
      return
    },
    async fileRender() {
      const [file] = this.upload.imageFile
      if (file) {
        const reader = new FileReader()
        return await new Promise((resolve, reject) => {
          reader.onerror = e => {
            reader.abort()
            return reject(null)
          }
          reader.onload = e => {
            document.getElementById('createImage').src = e.target.result
            return resolve()
          }
          reader.readAsDataURL(file)
        })
      }
      return Promise.resolve(null)
    },
    handleRemoveInputFileupload() {
      this.upload.imageFile = []
      this.upload.isSelected = false
    },
    async handleCreateInputFile(files) {
      console.log(this.upload.imageFile)
      this.upload.isSelected = true
      await this.fileRender()
    },
    /*
    filterAuthors(param) {
      this.catalog.filterAuthors = Array.from(this.catalog.authors).filter(
        author => {
          return (
            `${author.firstName} ${author.lastName}`
              .toLowerCase()
              .indexOf(param.toLowerCase()) >= 0
          )
        }
      )
    },
    */
    addType(type) {
      this.$dialog.confirm({
        iconPack: 'mdi',
        message: `<pre>${JSON.stringify(type, undefined, 2)}</pre>`,
        title: 'Agregar Tipo a Repositorio',
        confirmText: 'Agregar',
        type: 'is-success',
        hasIcon: false,
        onConfirm: async () => {
          const { id } = this.update.data
          const { idCatalog } = type

          // API Call
          try {
            const {
              data: { data: item }
            } = await this.$axios.post(`/api/repo/${id}/type`, { idCatalog })

            const index = Array.from(this.table.data).findIndex(
              ({ id }) => id === this.update.data.id
            )

            if (index !== -1) {
              type.id = item.id
              const { value = 'otro' } = Array.from(this.catalog.types).find(
                ({ idCatalog }) => idCatalog === item.idCatalog
              )
              item.value = value
              this.table.data[index].type.push(item)
            }
          } catch (err) {
            console.log(err.message)
          }
        },
        onCancel: () => {
          const index = this.update.data.type.indexOf(type)
          console.log(index)
          this.update.data.type.splice(index)
        }
      })
    },
    addTopic(topic) {
      this.$dialog.confirm({
        iconPack: 'mdi',
        message: `<pre>${JSON.stringify(topic, undefined, 2)}</pre>`,
        title: 'Agregar Tipo a Repositorio',
        confirmText: 'Agregar',
        type: 'is-success',
        hasIcon: false,
        onConfirm: async () => {
          const { id } = this.update.data
          const { idCatalog } = topic

          // API Call
          try {
            const {
              data: { data: item }
            } = await this.$axios.post(`/api/repo/${id}/topic`, { idCatalog })

            const index = Array.from(this.table.data).findIndex(
              ({ id }) => id === this.update.data.id
            )

            if (index !== -1) {
              topic.id = item.id
              const { value = 'otro' } = Array.from(this.catalog.topics).find(
                ({ idCatalog }) => idCatalog === item.idCatalog
              )
              item.value = value
              this.table.data[index].topic.push(item)
            }
          } catch (err) {
            console.log(err.message)
          }
        },
        onCancel: () => {
          const index = this.update.data.topic.indexOf(topic)
          console.log(index)
          this.update.data.topic.splice(index)
        }
      })
    },
    removeType(type) {
      if (type.id) {
        this.$dialog.confirm({
          iconPack: 'mdi',
          message: `<pre>${JSON.stringify(type, undefined, 2)}</pre>`,
          title: 'Eliminar Tipo en Repositorio',
          confirmText: 'Eliminar',
          type: 'is-danger',
          hasIcon: false,
          onConfirm: () => {
            // API Call

            // Then
            const index = Array.from(this.table.data).findIndex(
              ({ id }) => id === this.update.data.id
            )

            const itemIndex =
              index !== -1
                ? Array.from(this.table.data[index].type).findIndex(
                    ({ id }) => id === type.id
                  )
                : null

            if (itemIndex !== null) {
              console.log(
                'Removed',
                this.table.data[index].type.splice(itemIndex)
              )
            }
          },
          onCancel: () => {
            this.update.data.type.push(type)
          }
        })
      }
    },
    removeTopic(topic) {
      if (topic.id) {
        this.$dialog.confirm({
          iconPack: 'mdi',
          message: `<pre>${JSON.stringify(topic, undefined, 2)}</pre>`,
          title: 'Eliminar Tema de Repositorio',
          confirmText: 'Eliminar',
          type: 'is-danger',
          hasIcon: false,
          onConfirm: () => {
            // API Call

            // Then
            const index = Array.from(this.table.data).findIndex(
              ({ id }) => id === this.update.data.id
            )

            const itemIndex =
              index !== -1
                ? Array.from(this.table.data[index].topic).findIndex(
                    ({ id }) => id === topic.id
                  )
                : null

            if (itemIndex !== null) {
              console.log(
                'Removed',
                this.table.data[index].topic.splice(itemIndex)
              )
            }
          },
          onCancel: () => {
            this.update.data.topic.push(topic)
          }
        })
      }
    },
    getFilteredTopics(param) {
      this.catalog.filteredTopics = Array.from(this.catalog.topics).filter(
        ({ value }) => {
          return value
            .toString()
            .toLowerCase()
            .includes(param.toLowerCase())
        }
      )
    },
    getFilteredTypes(param) {
      this.catalog.filteredTypes = Array.from(this.catalog.types).filter(
        ({ value }) => {
          return value
            .toString()
            .toLowerCase()
            .includes(param.toLowerCase())
        }
      )
    },
    dropFile(files) {
      console.log(files)
    },
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
        this.catalog.authors = data
      } catch (error) {
        console.error(error)
        this.$toast.open({
          message: 'Error al obtener lista de autores',
          type: 'is-danger'
        })
        this.catalog.authors = []
      }
    },
    onPageChange(page) {
      this.search.page = page
    },
    handleCancelEvent(ev) {
      ev.preventDefault()
      this.selectedTab = 0
    },
    // Crear Repositorio
    createFormData(obj) {
      const data = new FormData()

      for (const prop in obj) {
        data.append(prop, obj[prop])
      }

      console.log(data)
      return data
    },
    async handleSubmitCreate() {
      const hasImage = this.upload.isSelected
      const repoData = hasImage ? this.createFormData(this.create) : this.create

      if (hasImage) {
        const [image] = this.upload.imageFile
        console.log(repoData)
        repoData.append('image', image)
      }

      try {
        console.log(data)

        const {
          data: { data = {} }
        } = await this.$axios.post('/api/repo', repoData)

        data.author = []
        data.resource = []
        data.type = []
        data.topic = []

        this.create = {}
        this.data.push(data)
        const indexTable = Array.from(this.table.data).findIndex(
          ({ id }) => id === idRepository
        )

        if (indexTable === -1) {
          this.table.data.push(data)
        }

        this.showUpdate(null, data)

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
      const {
        data: { id: idRepository }
      } = this.update

      const index = Array.from(this.data).findIndex(
        ({ id }) => id === idRepository
      )

      const repository = this.data[index] || {}

      const item = Object.keys(this.update.data).reduce((acc, prop) => {
        if (
          !Array.isArray(this.update.data[prop]) &&
          this.update.data[prop] !== repository[prop]
        ) {
          acc[prop] = this.update.data[prop]
        }
        return acc
      }, {})

      try {
        const { data } = await this.$axios.put(
          '/api/repo/' + idRepository,
          item
        )
        this.update.index = null
        this.update.data = {
          author: [],
          id: 0
        }
        this.data.splice(this.update.index, 1, data.data)

        if (index !== -1) {
          this.data.splice(index, 1, data.data)
          const indexTable = Array.from(this.table.data).findIndex(
            ({ id }) => id === idRepository
          )
          this.table.data.splice(indexTable, 1, data.data)
        }

        this.selectedTab = 0
        this.$toast.open({
          message: 'Autor de Repositorio Actulizado',
          type: 'is-success'
        })
      } catch (error) {
        console.error(error)
        this.$toast.open({
          message: 'Error al actualizar Autor de Repositorio',
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
    handleShowAddResources(ev) {
      ev.preventDefault()
      this.update.showModalResource = true
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
    addAuthor(author) {
      this.$dialog.confirm({
        message: `<pre>${JSON.stringify(author, undefined, 2)}</pre>`,
        title: 'Borrar Author',
        confirmText: 'Agregar',
        type: 'is-warning',
        hasIcon: true,
        onConfirm: async () => {
          const {
            data: { id: idRepository }
          } = this.update
          const { firstName, lastName, image, idAuthor } = author

          try {
            const index = Array.from(this.table.data).findIndex(
              ({ id }) => id === this.update.data.id
            )

            const {
              data: { data: catalog }
            } = await this.$axios.post(`/api/repo/${idRepository}/author`, {
              idAuthor
            })

            if (index !== -1) {
              this.table.data[index].author.push({
                ...catalog,
                firstName,
                lastName,
                image
              })
            }

            this.update.data.author.push({
              ...catalog,
              firstName,
              lastName,
              image
            })
          } catch (err) {
            console.log(err)
          }
        }
      })
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

<style>
.has-my-1 {
  margin-top: 1rem;
  margin-bottom: 1rem;
}
div.upload-draggable.is-black {
  width: 100%;
}
.is-256x256 {
  height: 256px;
  width: 256px;
}
div.autocomplete.control div.dropdown-menu {
  position: initial;
}
</style>
