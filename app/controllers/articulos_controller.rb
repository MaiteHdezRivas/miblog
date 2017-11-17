class ArticulosController < ApplicationController
  before_action :set_articulo, only: [:show, :edit, :update, :destroy]  
  
  def index
    @articulos = Articulo.all
  end
  
  def show
  end

  def new
    #Lo guardamos en memoria
   #@articulo= Articulo.new
   @boton = "Crear"
   @articulo= current_autor.articulos.build
    
  end

  def create
    #volvemos a crear la variable de instancia y recogemos los parametros
    #params en rails es un hash que almacena todos los parametros,
    #tanto get como post. En realizad la variable es asi: params:articulo
    #pero esto es peligroso ya que permite pasar cualquier tipo, esto hace
    #vulnerable nuestra base de datos. De esta otra, lo hacemos con strong params + seguro
    @articulo= current_autor.articulos.build(articulo_params)
    #si guarda bien, le redirigimos
    if @articulo.save
      redirect_to @articulo
    else
      render 'new'#viuelve a mostrar la vista del formulario
    end
    
  end

  def edit
  end


  def update
    @articulo.update(articulo_params)
    @articulo.save!
    redirect_to @articulo
  end

  def destroy
    @articulo.destroy
    respond_to do |format|
      format.html { redirect_to articulos_url, notice: 'articulo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_articulo
    @articulo = Articulo.find(params[:id])
  end

  def articulo_params
    params.require(:articulo).permit(:titulo, :contenido)
  end    
end
