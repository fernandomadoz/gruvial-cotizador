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
      <li class="active">Trabajos</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <?php if ($rol_de_usuario_id <> '') { ?>
        <div class="col-xs-12">

          <!-- INICIO APP vue.js -->
          <div id="app-cotizador">

                <!-- Datos del Encabezado -->
                  <div class="col-xs-12 col-lg-12">    

                    <div class="panel panel-default">
                      <div class="panel-heading panel-heading-Encabezado" data-toggle="collapse" data-parent="#accordion" href="#collapseEncabezado" aria-expanded="true" aria-controls="collapseEncabezado">
                        <h3 class="tit-panel"><strong>Dirigido a:</strong> @{{ razon_social }}</h3>
                      </div>
                      <div id="collapseEncabezado" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingEncabezado">
                        <div class="panel-body">


                        </div>
                      </div>
                    </div>
                  </div>
                <!-- FIN Datos del Encabezado -->


              

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
                      <button type="button" class="btn btn-lg btn-warning btn-accion" v-if="btn_descargar_pdf" v-on:click="EnviarTrabajoViaMail" aria-label="Left Align">
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
          firma_id: <?php echo $Trabajo_encabezado->firma_id ?>,
          cliente_id: <?php echo $Trabajo_encabezado->cliente_id ?>,
          fecha_inicio: '<?php echo $Trabajo_encabezado->fecha_inicio ?>',
          fecha_fin: '<?php echo $Trabajo_encabezado->fecha_fin ?>',
          user_id: <?php echo $Trabajo_encabezado->user_id ?>,
          fecha_de_cancelacion: '<?php echo $Trabajo_encabezado->fecha_de_cancelacion ?>',
          trabajo_encabezado_id: <?php echo $Trabajo_encabezado->id ?>,
          observaciones: '<?php echo $Trabajo_encabezado->observaciones ?>',
          observaciones_de_cancelacion: '<?php echo $Trabajo_encabezado->observaciones_de_cancelacion ?>'


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
                  this.GenerarTrabajo()
                }
            }).catch(() => {
                this.title = this.errors;
            });
          },
          GenerarTrabajo: function(){
              this.btn_descargar_pdf = false          
              var that = this;

              // INICIO GUARDO LA Trabajo
              $.ajax({
                url: '<?php echo env('PATH_PUBLIC')?>guardar-Trabajo',
                type: 'POST',
                dataType: 'html',
                async: true,
                data:{
                  _token: "{{ csrf_token() }}",
                  Trabajo_id: this.trabajo_encabezado_id,
                  razon_social: this.razon_social,
                  nombre_de_la_persona: this.nombre_de_la_persona,
                  email_correo: this.email_correo,
                  celular: this.celular,
                  localidad: this.localidad,
                  domicilio: this.domicilio,
                  maquinas: this.maquinas,
                  condiciones_de_Trabajo: this.condiciones_de_Trabajo
                },
                success: function success(data, status) {    
                  that.Trabajo_id = parseInt(data)

                  // INICIO GENERO EL PDF
                  $.ajax({
                    url: '<?php echo env('PATH_PUBLIC')?>generar-pdf-Trabajo/'+that.Trabajo_id,
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
              // FIN GUARDO LA Trabajo

              
        },


      })

  </script>
<!-- FIN VUE SCRIPT -->



@endsection
