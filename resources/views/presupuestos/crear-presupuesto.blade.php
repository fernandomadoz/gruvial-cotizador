<?php
$rol_de_usuario_id = Auth::user()->rol_de_usuario_id;
?>


@extends('layouts.backend')



@section('contenido')

  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<?php echo env('PATH_PUBLIC')?>bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo env('PATH_PUBLIC')?>bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?php echo env('PATH_PUBLIC')?>bower_components/Ionicons/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="<?php echo env('PATH_PUBLIC')?>bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo env('PATH_PUBLIC')?>dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<?php echo env('PATH_PUBLIC')?>dist/css/skins/_all-skins.min.css">
  

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

  <script src="<?php echo env('PATH_PUBLIC')?>js/vue/vue.js"></script>
  <script src="<?php echo env('PATH_PUBLIC')?>js/vee-validate/dist/vee-validate.js"></script>
  <script src="<?php echo env('PATH_PUBLIC')?>js/vee-validate/dist/locale/es.js"></script>
  
  <script src="<?php echo env('PATH_PUBLIC')?>node_modules/@ckeditor/ckeditor5-build-classic/build/ckeditor.js"></script>
  <script src="<?php echo env('PATH_PUBLIC')?>node_modules/@ckeditor/ckeditor5-vue/dist/ckeditor.js"></script>
  
  

  <!-- Typeahead -->
  <link rel="stylesheet" href="<?php echo env('PATH_PUBLIC')?>js/typeahead/style_typeahead.css">
  <script src="<?php echo env('PATH_PUBLIC')?>js/typeahead/typeahead.bundle.js"></script>


  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <?php echo $titulo ?>
      <small></small>
    </h1>
    <ol class="breadcrumb">
      <li class="active">Cotizaciones</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <?php if ($rol_de_usuario_id <> '') { ?>
        <div class="col-xs-12">

          <!-- INICIO APP vue.js -->
          <div id="app-cotizador">

                <!-- Datos del Cliente -->
                  <div class="col-xs-12 col-lg-12">    

                    <div class="panel panel-default">
                      <div class="panel-heading panel-heading-cliente" data-toggle="collapse" data-parent="#accordion" href="#collapseCliente" aria-expanded="true" aria-controls="collapseCliente">
                        <h3 class="tit-panel"><strong>Dirigido a:</strong> @{{ razon_social }}</h3>
                      </div>
                      <div id="collapseCliente" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingCliente">
                        <div class="panel-body">

                          <div class="col-xs-12 col-lg-6"> 
                            <div class="form-group">
                              <label for="razon_social">Razon Social *</label>
                              <input v-validate="'required'" type="text" class="form-control typeahead" id="razon_social" name="Razon Social" v-model="razon_social" placeholder="Razon Social" required="required">
                              <span v-show="errors.has('Razon Social')" class="text-danger">@{{ errors.first('Razon Social') }}</span>
                            </div>
                            <div class="form-group">
                              <label for="celular">Tel&eacute;fono Celular * (ej: 3462602230)</label>
                              <input v-validate="'regex:^([0-9]+)$|required'" type="number" class="form-control" id="celular" name="celular" v-model="celular" placeholder="Tel&eacute;fono Celular" required="required" min="0">
                              <span v-show="errors.has('Celular')" class="text-danger">@{{ errors.first('Celular') }}</span>
                            </div>
                            <div class="form-group">
                              <label for="Email">Email *</label>
                                <input v-validate="'required|email'"  name="email_correo" type="text" class="form-control" placeholder="email_correo" v-model="email_correo">
                                <span v-show="errors.has('email_correo')" class="text-danger">@{{ errors.first('email_correo') }}</span>
                            </div>
                          </div>

                          <div class="col-xs-12 col-lg-6">                         
                            <div class="form-group">
                              <label for="nombre_de_la_persona">Dirigido a *</label>                          
                              <input v-validate="'required'" type="text" class="form-control" id="nombre_de_la_persona" name="nombre_de_la_persona" v-model="nombre_de_la_persona" placeholder="Nombre de la Persona" required="required">   
                              <span v-show="errors.has('nombre_de_la_persona')" class="text-danger">@{{ errors.first('nombre_de_la_persona') }}</span>                       
                            </div>                             
                            <div class="form-group">
                              <label for="domicilio">Domicilio *</label>                          
                              <input v-validate="'required'" type="text" class="form-control" id="domicilio" name="domicilio" v-model="domicilio" placeholder="Domicilio" required="required">   
                              <span v-show="errors.has('Domicilio')" class="text-danger">@{{ errors.first('Domicilio') }}</span>                       
                            </div>                        
                            <div class="form-group">
                              <label for="localidad">Localidad *</label>                          
                              <input v-validate="'required'" type="text" class="form-control" id="localidad" name="localidad" v-model="localidad" placeholder="Localidad" required="required">  
                              <span v-show="errors.has('Localidad')" class="text-danger">@{{ errors.first('Localidad') }}</span>                        
                            </div>
                          </div>

                        </div>
                      </div>
                    </div>
                  </div>
                <!-- FIN Datos del Cliente -->



                <!-- INICIO MAQUINAS -->
                  <div class="col-xs-12 col-lg-12">    
                    <div class="panel panel-default">
                      <div class="panel-heading panel-heading-erp" >
                        <!-- INICIO ENCABEZADO -->
                        <div data-toggle="collapse" data-parent="#accordion" href="#collapseMaquinas" aria-expanded="true" aria-controls="collapseMaquinas">
                          <i class="fa fa-truck"></i> Maquinas
                        </div>  
                        <!-- FIN ENCABEZADO -->
                      </div>
                      <div id="collapseMaquinas" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingMaquinas">
                        <div class="panel-body">
                          <div v-for="(maquina, key, index) in maquinas">
                            <div class="col-lg-4 fila-maquina">
                              <div class="col-maquina">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" v-model="maquina.chequeado" v-bind:name="'maquina_'+maquina.id"  v-bind:id="'maquina_'+maquina.id"> @{{ maquina.nombre_de_maquina }}
                                  </label>
                                </div>
                              </div>
                            </div>
                          </div>  
                        </div>
                      </div>  
                    </div>
                  </div>
                <!-- FIN MAQUINAS -->

                <!-- INICIO TEXTO -->
                  <div v-for="(maquina, key, index) in maquinas">
                    <div class="col-xs-12 col-lg-12" v-show="maquina.chequeado">
                      <div class="box box-default box-solid" data-widget="collapse">
                        <div class="box-header with-border" style="background-color: #f5f5f5">
                          <!-- INICIO ENCABEZADO -->
                          <div>
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" style="float: right;"><i class="fa fa-plus"></i></button>
                             <strong>REF.: PRESUPUESTO N&deg; @{{ numeroDeLinea(maquina.id) }}: </strong>
                            <input type="text" v-model="maquina.titulo" class="form-control">
                            <strong><u>@{{ maquina.nombre_de_maquina }}</u></strong>
                          </div>  
                          <!-- FIN ENCABEZADO -->
                        </div>
                        <div class="box-body" style="">
                          <ckeditor :editor="editor" v-model="maquina.texto" :config="editorConfig"></ckeditor></textarea> 
                        </div>  
                      </div>
                    </div>
                  </div>
                <!-- FIN TEXTO -->


                <!-- INICIO CONDICIONES DE COTIZACION -->
                  <div class="col-xs-12 col-lg-12">
                    <div class="box box-default box-solid" data-widget="collapse">
                      <div class="box-header with-border" data-widget="collapse" style="background-color: #f5f5f5">
                        <h3 class="box-title">Condiciones de Cotización</h3>
                      </div>
                      <!-- /.box-header -->
                      <div class="box-body" style=""> 
                        <ckeditor :editor="editor" v-model="condiciones_de_cotizacion" :config="editorConfig"></ckeditor>
                      </div>
                      <!-- /.box-body -->
                    </div>
                  </div>
                <!-- FIN CONDICIONES DE COTIZACION -->


               

                <!-- INICIO BOTONERA FINAL -->

                  <div class="col-xs-12 col-lg-12">
                    
                    <button type="button" class="btn btn-lg btn-default btn-accion" aria-label="Left Align">
                      <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true" v-on:click="validar_errores"> Generar Cotizaci&oacute;n</span>
                    </button>
                    
                    <a v-bind:href="url_pdf" target="_blank">
                      <transition name="fade">
                        <button type="button" class="btn btn-lg btn-primary btn-accion" v-if="btn_descargar_pdf" aria-label="Left Align">
                          <span class="glyphicon glyphicon-save" aria-hidden="true"> Descargar PDF</span>
                        </button>
                      </transition>
                    </a>

                    <a v-bind:href="armarUrlWhatsapp()" target="_blank">
                      <transition name="fade">
                        <button type="button" class="btn btn-lg btn-success btn-accion" v-if="btn_descargar_pdf" aria-label="Left Align">
                          <i class="fa fa-fw fa-whatsapp"> </i>Enviar via Whatsapp
                        </button>
                      </transition>
                    </a>
                    
                    <transition name="fade">
                      <button type="button" class="btn btn-lg btn-warning btn-accion" v-if="btn_descargar_pdf" v-on:click="EnviarCotizacionViaMail" aria-label="Left Align">
                        <span class="glyphicon glyphicon-envelope" aria-hidden="true"> Enviar via Mail</span>
                      </button>
                    </transition>

                    <br> <br>

                    <transition name="fade">
                      <div v-show="mostrar_mensaje" class="alert alert-success" role="alert">                    
                        @{{ mensaje }}
                      </div>         
                    </transition>
                  
                    <transition name="fade">
                      <div v-show="mostrar_mensaje_error" class="alert alert-danger" role="alert">
                        @{{ mensaje_error }}
                      </div>              
                    </transition>

                  </div>

                <!-- FIN BOTONERA FINAL -->

          <!-- FIN APP vue.js -->

          <!--div class="col-lg-12">            
            <pre>@{{ $data }}</pre>
          </div-->

          </div>

        <?php } 
        else { ?>

            <div class="alert alert-warning alert-dismissible">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <h4><i class="icon fa fa-warning"></i> Alerta!</h4>
              <p><strong>Su usuario a&uacute;n no ha sido autorizado. Debe solicitarlo a su supervisor.</strong></p>
            </div>

        <?php } ?>

      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->

  <!-- DataTables -->
  <script src="<?php echo env('PATH_PUBLIC')?>bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
  <script src="<?php echo env('PATH_PUBLIC')?>bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<!-- INICIO VUE SCRIPT -->
  <script type="text/javascript">

    const config = {
      locale: 'es', 
    };


    Vue.use(VeeValidate, config);
    Vue.use( CKEditor );
    /*
    const validator = new Validator({
      email: 'required|email',
      name: 'required|alpha|min:3'
    });
    */

      //Vue.use(VeeValidate);

      Vue.mixin({
        created: function () {
          //var subtotal_mrp = this.$options.subtotal_mrp
        }
      })


      var app = new Vue({
        el: '#app-cotizador',
        data: {
          editor: ClassicEditor,
          editorData: '<p>Content of the editor.</p>',
          editorConfig: {
              // The configuration of the editor.
          },
          modo_adquisicion: 'v',
          razon_social: '<?php echo $Cotizacion_encabezado->razon_social ?>',
          nombre_de_la_persona: '<?php echo $Cotizacion_encabezado->razon_social ?>',
          email_correo: '<?php echo $Cotizacion_encabezado->email_correo ?>',
          celular: '<?php echo $Cotizacion_encabezado->celular ?>',
          localidad: '<?php echo $Cotizacion_encabezado->localidad ?>',
          domicilio: '<?php echo $Cotizacion_encabezado->domicilio ?>',
          cotizacion_id: <?php echo $Cotizacion_encabezado->id ?>,
          url_pdf: '<?php echo $Cotizacion_encabezado->url_pdf ?>',
          mostrar_mensaje: false,
          mensaje: '',
          mensaje_whastapp: '',
          btn_descargar_pdf: <?php echo $btn_descargar_pdf ?>,
          mostrar_mensaje_error: false,
          mensaje_error: '',
          guardar: false,
          mensaje_envio_mail: '',
          condiciones_de_cotizacion: <?php echo json_encode($condiciones_de_cotizacion) ?>,
          maquinas: [

            <?php 
            $i=0;
            foreach ($Maquinas as $Maquina) {
              $titulo = '';
              $rtf_texto = $Maquina->rtf_caracteristicas.'Valor por '.$Maquina->unidad_de_trabajo->unidad_de_trabajo.'............................................................................'.number_format($Maquina->importe_por_unidad_de_trabajo, 2, ',', '.').' +IVA'.$Maquina->rtf_servicio_minimo;
              $chequeado = 'false';

              if (isset($Cotizacion_lineas)) {
                foreach ($Cotizacion_lineas as $Cotizacion_linea) {
                  if ($Cotizacion_linea->maquina_id == $Maquina->id) {
                    $chequeado = 'true';
                    $titulo = $Cotizacion_linea->titulo;
                    $rtf_texto = $Cotizacion_linea->rtf_texto;
                  }
                }
              }
              $i++;
            ?>
            {
              chequeado: <?php echo $chequeado ?>,
              id: <?php echo $Maquina->id; ?>,
              nombre_de_maquina: '<?php echo $Maquina->nombre_de_maquina ?>',
              img_imagen: '<?php echo $Maquina->img_imagen ?>',
              titulo: '<?php echo $titulo ?>',
              texto: <?php echo json_encode($rtf_texto) ?>,

            }, 
            <?php } ?> 

            {
              chequeado: false,
              id: -1,
              nombre_de_maquina: 'Otro 1',
              img_imagen: null,
              titulo: null,
              texto: null
            }, 
            {
              chequeado: false,
              id: -2,
              nombre_de_maquina: 'Otro 2',
              img_imagen: null,
              titulo: null,
              texto: null
            }, 
            {
              chequeado: false,
              id: -3,
              nombre_de_maquina: 'Otro 3',
              img_imagen: null,
              titulo: null,
              texto: null
            }
          ]


        },
        methods: {
          numeroDeLinea: function (id) {
            //Filtro la tabla segun el valor del select de arriba
            var numero = 0;
            var nro_de_orden = 0;
            for (i = 0; i < this.maquinas.length; i++) { 
              if (this.maquinas[i].chequeado) {
                numero = numero + 1
              }
              if (id == this.maquinas[i].id) {
                nro_de_orden = numero
              }
            }

            return nro_de_orden
            
          },          
          validar_errores: function(){
            // VALIDO SI HAY ERRORES
            this.$validator.validateAll().then(() => {
                if (this.errors.any()) {
                  // SI HAY ERRORES
                  this.guardar = false
                  this.mostrar_mensaje_error = true
                  this.mensaje_error = 'Hay campos que corrergir'
                }
                else {
                  // SI NO HAY ERRORES
                  this.mostrar_mensaje_error = false
                  this.guardar = true
                  this.GenerarCotizacion()
                }
            }).catch(() => {
                this.title = this.errors;
            });
          },
          GenerarCotizacion: function(){
              this.btn_descargar_pdf = false          
              var that = this;

              // INICIO GUARDO LA COTIZACION
              $.ajax({
                url: '<?php echo env('PATH_PUBLIC')?>guardar-cotizacion',
                type: 'POST',
                dataType: 'html',
                async: true,
                data:{
                  _token: "{{ csrf_token() }}",
                  cotizacion_id: this.cotizacion_id,
                  razon_social: this.razon_social,
                  nombre_de_la_persona: this.nombre_de_la_persona,
                  email_correo: this.email_correo,
                  celular: this.celular,
                  localidad: this.localidad,
                  domicilio: this.domicilio,
                  maquinas: this.maquinas,
                  condiciones_de_cotizacion: this.condiciones_de_cotizacion
                },
                success: function success(data, status) {    
                  that.cotizacion_id = parseInt(data)

                  // INICIO GENERO EL PDF
                  $.ajax({
                    url: '<?php echo env('PATH_PUBLIC')?>generar-pdf-cotizacion/'+that.cotizacion_id,
                    type: 'GET',
                    dataType: 'html',
                    async: true,
                    success: function success(data, status) {    
                      // GENERO EL PDF
                      nombre_del_pdf = data;
                      console.log(nombre_del_pdf)
                      if (nombre_del_pdf != 'error') {
                        that.url_pdf = nombre_del_pdf                   
                        that.btn_descargar_pdf = true
                      }                  
                    },
                    error: function error(xhr, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                  });
                  // FIN GENERO EL PDF




                },
                error: function error(xhr, textStatus, errorThrown) {
                    alert(errorThrown);
                }
              });
              // FIN GUARDO LA COTIZACION

              
          },      
          EnviarCotizacionViaMail: function(){
            var that = this;
            // INICIO GENERO EL PDF
            $.ajax({
              url: '<?php echo env('PATH_PUBLIC')?>enviar-cotizacion-via-email/'+that.cotizacion_id,
              type: 'GET',
              dataType: 'html',
              async: true,
              success: function success(data, status) {    
                that.mensaje_envio_mail = data
                that.mensaje = that.mensaje_envio_mail
                that.mostrar_mensaje = true           
              },
              error: function error(xhr, textStatus, errorThrown) {
                  alert(errorThrown);
              }
            });
            // FIN GENERO EL PDF

          } ,      
          armarUrlWhatsapp: function(){
              url_whatsapp = 'https://api.whatsapp.com/send?phone=549'+this.celular+'&text=Estimado '+this.nombre_de_la_persona+'. Gruvial le envia la cotizacion solicitada para '+this.razon_social+'. Para poder verla haga click en el siguiente enlace: '+this.url_pdf
              return url_whatsapp
          } 
        },

        filters: {
          formatoMoneda: function (value) {
            let val = (value/1).toFixed(0).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
          }
        }


      })

  </script>
<!-- FIN VUE SCRIPT -->

 
<script language="JavaScript">
$( document ).ready(function() {

var destinatarios = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('razon_social'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  // url points to a json file that contains an array of country names, see
  // https://github.com/twitter/typeahead.js/blob/gh-pages/data/countries.json
  prefetch: {
    url: '<?php echo env("PATH_PUBLIC")?>data/destnatarios-cotizaciones',
    cache: false
  },
  highlight: true
});

// passing in `null` for the `options` arguments will result in the default
// options being used
$('.typeahead').typeahead({
  highlight: true
  },
  {
  name: 'razon_social',
  display: 'razon_social',
  source: destinatarios,
  limit: 30,
  templates: {
    empty: [
      '<div class="mensaje-vacio">',
        'No existe ningun destinatario con ese nombre',
      '</div>'
    ].join('\n'),
    suggestion: function(data) {
    return '<p><strong>' + data.razon_social + ' (' + data.nombre_de_la_persona + ') </strong>'+data.email_correo + ' - ' +data.localidad +'</p>';

}
  }
});
$('.typeahead').on('typeahead:selected', function(evt, item) {

    app.razon_social = item['razon_social']
    app.nombre_de_la_persona = item['nombre_de_la_persona']
    app.celular = item['celular']
    app.domicilio = item['domicilio']
    app.email_correo = item['email_correo']
    app.localidad = item['localidad']
})

});
</script>


@endsection
