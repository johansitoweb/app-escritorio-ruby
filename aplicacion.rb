require 'tk'

class TodoApp
  def initialize
    @tasks = []

    @root = TkRoot.new { title "Lista de Tareas" }

    @frame = TkFrame.new(@root) do
      pack { padx 15; pady 15 }
    end

    @task_entry = TkEntry.new(@frame) do
      pack { padx 10; pady 5 }
      width 30
    end

    @add_button = TkButton.new(@frame) do
      text "Agregar Tarea"
      command { add_task }
      pack { padx 10; pady 5 }
    end

    @task_listbox = TkListbox.new(@frame) do
      pack { padx 10; pady 5 }
      height 10
      width 50
    end

    @remove_button = TkButton.new(@frame) do
      text "Eliminar Tarea"
      command { remove_task }
      pack { padx 10; pady 5 }
    end

    Tk.mainloop
  end

  def add_task
    task = @task_entry.get
    if !task.empty?
      @tasks << task
      @task_listbox.insert('end', task)
      @task_entry.delete(0, 'end')
    else
      Tk.messageBox('message' => "Por favor, introduce una tarea.")
    end
  end

  def remove_task
    selected_task_index = @task_listbox.curselection.first
    if selected_task_index
      @tasks.delete_at(selected_task_index)
      @task_listbox.delete(selected_task_index)
    else
      Tk.messageBox('message' => "Por favor, selecciona una tarea para eliminar.")
    end
  end
end

TodoApp.new
