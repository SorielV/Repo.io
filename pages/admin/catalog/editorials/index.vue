<template lang="pug">
  section(style="padding: 1% 2% 2% 2%;")
    b-loading(:is-full-page="true" :active.sync="table.loading" :can-cancel="true")
    section.card
      b-tabs.block(
        position="is-centered"
        v-model="selectedTab"
      )
        b-tab-item(label="Administrar" v-cloak)
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
          b-table(
            v-cloak
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
                sortable
              ) {{ props.row['id'] }}

              b-table-column(
                field="name"
                label="Nombre"
                :visible="true"
                sortable
              ) {{ props.row['name'] }}

              b-table-column(
                field="description"
                label="Descripcion"
                :visible="true"
                sortable
              ) {{ props.row['description'] }}

              b-table-column(
                field="image"
                label="Imagen"
                :visible="true"
                sortable
              ) 
                .field
                  b-checkbox(disabled v-model="props.row['image'] ? true : false")

              b-table-column(
                field="createdAt"
                label="Fecha de Creacion"
                :visible="true"
                sortable
              ) {{ props.row['createdAt'] }}

              b-table-column(
                field="id" 
                label="Acciones"
              )
                .buttons.block
                  button.button.is-info.is-small(@click="showDetail($event, props.row)")
                    i.mdi.mdi-eye 
                  button.button.is-dark.is-small(@click="showUpdate($event, props.row)")
                    i.mdi.mdi-pencil
                  button.button.is-danger.is-small(@click="removeConfirmDialog(props.row)")
                    i.mdi.mdi-delete
            template(slot="detail" slot-scope="props")
              .block
                .container.is-fluid
                  pre {{ props.row }}
            template(slot='bottom-left')
              | {{ (search.page * search.perPage) > table.total ? table.total : (search.page * search.perPage)  }} de {{ table.total }}
            template(slot="empty")
              section.hero.has-text-centered
                .hero-body
                  .container
                    h1.title
                      | Error
                    h2.subtitle
                      | Autores no encontrados
                    h2.subtitle(v-if="data.length !== 0")
                      | Busqueda: {{ search.param }}
                    img(src="https://i.gifer.com/7WOr.gif")

        // Crear
        b-tab-item(label="Crear")
          form.block(v-on:submit.prevent="onCreate")
            b-field(
              label="Nombre"
            )
              b-input(type="Nombre"
                v-model="create.name"
                value=""
                maxlength="60"
                :required="true"
              )

            b-field(
              label="Descripcion"
            )
              b-input(type="text"
                v-model="create.description"
                value=""
                maxlength="60"
                :required="true"
              )

            .field
              label.label Imagen
              .control.is-box
                // Nueva Imagen
                div(v-if="upload.isSelected")
                  figure.image.is-256x256
                    img(:src='upload.src')
                  .is-overlay
                    .buttons
                      button.button.is-danger(v-on:click.stop="cancelImage")
                        i.mdi.mdi-close
                div(v-else)
                  b-upload(
                    v-model='upload.imageFile'
                    type="is-black"
                    single drag-drop
                    style="width: 100%;"
                    @input="handleRenderImage"
                  )
                    section.section
                      center
                        .content.has-text-centered
                          p
                            b-icon(icon='upload', size='is-large')
                          p Suelta La Imagen

            .buttons.is-centered
              button.button.is-danger(@click="cancelCreate") Cancelar
              button.button.is-dark(type="submit") Crear Autor

        // Actualizar
        b-tab-item(:label='`Actualizar (id: ${update.data.id})`' :disabled="update.index === null")
          form.block(v-on:submit.prevent="onUpdate")
            b-field(
              label="Nombre"
            )
              b-input(type="Nombre"
                v-model="update.data.name"
                value=""
                maxlength="60"
                :required="true"
              )

            b-field(
              label="Descripcion"
            )
              b-input(type="text"
                v-model="create.description"
                value=""
                maxlength="60"
                :required="true"
              )

            .field
              label.label Imagen
              .control.is-box(v-show="!upload.isAdding && update.data.image")
                // Original
                figure.image.is-256x256
                  img(:src='update.data.image')
                .is-overlay
                  .buttons
                    button.button.is-danger(v-on:click.stop="handleRemoveImage")
                      i.mdi.mdi-close
              .control.is-box(v-if="upload.isAdding || (!upload.isAdding && !update.data.image)")
                // Nueva Imagen
                div(v-if="upload.isSelected")
                  figure.image.is-256x256
                    img(:src='upload.src')
                  .is-overlay
                    .buttons
                      button.button.is-danger(v-on:click.stop="cancelImage")
                        i.mdi.mdi-close
                div(v-else)
                  b-upload(
                    v-model='upload.imageFile'
                    type="is-black"
                    single drag-drop
                    style="width: 100%;"
                    @input="handleRenderImage"
                  )
                    section.section
                      center
                        .content.has-text-centered
                          p
                            b-icon(icon='upload', size='is-large')
                          p Suelta La Imagen

            pre {{ update }}
            .buttons.is-centered
              button.button.is-danger(@click="cancelUpdate") Cancelar
              button.button.is-dark(type="submit") Actualizar Autor
</template>

<script>
const columns = [
  {
    field: 'id',
    label: 'Id',
    meta: 'Id Usuario',
    sortable: true,
    numeric: true,
    visible: true,
    type: 'number'
  },
  {
    field: 'name',
    label: 'Nombre',
    meta: 'Nombre de Empresa',
    sortable: true,
    visible: true,
    type: 'string'
  },
  {
    field: 'date',
    label: 'Fecha de Creacion',
    meta: 'Fecha de Creacion',
    sortable: true,
    visible: true,
    type: 'date'
  }
]

export default {
  layout: 'admin',
  head: {
    titleTemplate: 'Autores',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Meta description' }
    ]
  },
  async asyncData({ app }) {
    try {
      const {
        data: { data }
      } = await app.$axios.get('/api/catalog/editorial')
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
      data: [],
      selectedTab: 0,
      update: {
        index: null,
        data: {
          id: 0
        }
      },
      create: {},
      search: {
        local: true,
        field: 'id',
        order: 'ASC',
        param: null,
        perPage: 15,
        page: 1
      },
      upload: {
        isAdding: false,
        hasImage: false,
        isSelected: false,
        imageFile: []
      },
      table: {
        loading: true,
        columns,
        defaultOpenedDetails: [],
        checkedRows: [],
        data: [],
        total: 0
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
          this.table.data = Array.apply(null, this.data).filter(author => {
            return author[_field].toUpperCase().includes(param)
          })
        } else if (type === 'number') {
          const param = nparam
          this.table.data = Array.apply(null, this.data).filter(author => {
            return author[_field] == param
          })
        }
      }
    }
  },
  methods: {
    cancelImage(ev) {
      ev.preventDefault()
      this.upload.src = null
      this.upload.isSelected = false
      this.upload.isAdding = false
    },
    async renderImage() {
      const [file] = this.upload.imageFile

      if (file) {
        const reader = new FileReader()
        return await new Promise((resolve, reject) => {
          reader.onerror = e => {
            reader.abort()
            return reject(null)
          }

          reader.onload = e => {
            this.$set(this.upload, 'src', e.target.result)
            return resolve()
          }
          reader.readAsDataURL(file)
        })
      }
      return Promise.resolve(null)
    },
    handleRemoveImage(ev) {
      ev.preventDefault()
      this.upload.isAdding = true
      this.upload.imageFile = []
    },
    async handleRenderImage(files) {
      console.log(this.upload.imageFile)
      this.upload.isSelected = true
      await this.renderImage()
    },
    onPageChange(page) {
      this.search.page = page
    },
    createFormData(obj) {
      const data = new FormData()

      for (const prop in obj) {
        data.append(prop, obj[prop])
      }

      console.log(data)
      return data
    },
    async onCreate() {
      const hasImage = this.upload.isSelected
      const item = hasImage ? this.createFormData(this.create) : this.create

      if (hasImage) {
        const [image] = this.upload.imageFile
        console.log(item)
        item.delete('image')
        item.append('image', image)
      }

      try {
        const {
          data: { data: author }
        } = await this.$axios.post('/api/catalog/editorial', item)

        this.create = {}
        this.data.push(author)

        const index = this.table.data.indexOf(author)
        if (index === -1) {
          this.table.data.push(author)
        }

        this.selectedTab = 0

        this.$toast.open({
          message: 'Autor Creado',
          type: 'is-success'
        })
      } catch (err) {
        console.error(err)
        this.$toast.open({
          message: 'Error al creare Autor',
          type: 'is-danger'
        })
      }
    },
    cancelCreate(ev) {
      ev.preventDefault()
      this.selectedTab = 0
    },
    cancelUpdate(ev) {
      ev.preventDefault()
      this.selectedTab = 0
    },
    async onUpdate(ev) {
      const hasImage = this.upload.isSelected
      const { id: itemId } = this.update.data

      const item = hasImage
        ? this.createFormData(this.update.data)
        : this.update.data

      if (hasImage) {
        const [image] = this.upload.imageFile
        console.log(item)
        item.delete('image')
        item.append('image', image)
      }

      try {
        const {
          data: { data: data }
        } = await this.$axios.put('/api/catalog/editorial/' + itemId, item)

        this.update.index = null
        this.update.data = {}

        this.data.splice(this.update.index, 1, data)

        const index = this.table.data.indexOf(data)
        if (index !== -1) {
          this.table.data.splice(index, 1, data)
        }

        this.selectedTab = 0

        this.$toast.open({
          message: 'Autor Actualizado',
          type: 'is-success'
        })
      } catch (error) {
        console.error(error)
        this.$toast.open({
          message: 'Error al actualizar Autor',
          type: 'is-danger'
        })
      }
    },
    async removeAuthor(row) {
      try {
        const { data } = await this.$axios.delete(
          '/api/catalog/editorial/' + row.id
        )
        this.data.splice(this.data.indexOf(row), 1) // General
        const dataIndex = this.table.data.indexOf(row) // Subbusqueda

        if (dataIndex !== -1) {
          this.table.data.splice(dataIndex, 1)
        }

        this.$toast.open({
          message: 'Autor Borrado',
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
    removeConfirmDialog(row) {
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
      const data = JSON.parse(JSON.stringify(row))
      this.update.index = index
      this.update.data = data
      this.selectedTab = 2
    }
  }
}
</script>

<style scoped>
[v-cloak] > * {
  display: none;
}
[v-cloak]::before {
  content: 'loading…';
}
.is-256x256 {
  height: 256px;
  width: 256px;
}
</style>
