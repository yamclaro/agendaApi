class Agenda < ApplicationRecord
  belongs_to :empresa
  belongs_to :cliente
  belongs_to :prestador
  belongs_to :servico
  validates :data, :hora, presence: true
  validate :validar_horario_prestador

  private

  def validar_horario_prestador
    # Verifica se o prestador está em horário de descanso
    if prestador_em_descanso?
      errors.add(:base, "O prestador está em horário de descanso neste período.")
      return
    end

    # Verifica se o horário está dentro do itinerário do prestador
    unless horario_incluso_no_itinerario?
      errors.add(:base, "O horário não está incluído no itinerário do prestador.")
      return
    end

    # Verifica se já existe um agendamento para o prestador neste horário
    if prestador_com_agenda_no_horario?
      errors.add(:base, "O prestador já possui um agendamento neste horário.")
    end
  end

  def prestador_em_descanso?
    prestador.descansos.where("data = ? AND ? BETWEEN horaInicio AND horaFim", data, hora).exists?
  end

  def horario_incluso_no_itinerario?
    prestador.itinerarios.where("data = ? AND ? BETWEEN horaInicio AND horaFim", data, hora).exists?
  end

  def prestador_com_agenda_no_horario?
    prestador.agendas.where("data = ? AND ? BETWEEN hora AND (hora + INTERVAL '1 hour')", data, hora).exists?
  end
end
