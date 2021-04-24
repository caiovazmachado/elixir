defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExpirationAlert

  # Cliente do GenServer
  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # tudo daqui pra baixo é o Server do GenServer

  @impl true
  # o \\ é para definir o valor default do state \\ = valor default
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  # async
  # put é o rotulo para a "mensagem" poderia ser banana
  # aqui eu modifico o estado (state), lembre-se funcional, não altera estado, isso é um recurso.
  # cast é no_reply, não retona nada. Faz de forma assincrona a operação que quer fazer
  # esse handle é para chamada GenServer.cast()

  # def handle_cast({:put, key, value}, state) do
  #   {:noreply, Map.put(state, key, value)}
  # end

  # sincrono
  # o from é insignificante, ai usa o _
  # não altera estado, retorna o proprio state do genServer

  # def handle_call({:get, key}, _from, state) do
  #   {:reply, Map.get(state, key), state}
  # end

  # Handler especial que recebe qq tipo de msg
  # qq processo pode enviar msg para o GenServer
  # handle_info trata isso
  # @impl true diz que está implementando um behavior do GenServer
  @impl true
  def handle_info(:generate, state) do
    ExpirationAlert.send()

    schedule_notification()

    {:noreply, state}
  end

  # Process.send_after( ) cria processo especial que envia mensagem para o proprio
  # gen server (self da PID do genserver), depois de 10 segundos, 3o arg tempo em milissegundos
  defp schedule_notification do
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
