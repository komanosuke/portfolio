class StudiesController < ApplicationController
    layout 'studies'

    def index
        @user = current_user
    end

    def kanji
        @kanji_grade = params[:grade]
        if logged_in?
            @study_record = StudyRecord.find_by(user_id: current_user.id)
            correct_data = [@study_record.grade1, @study_record.grade2, @study_record.grade3, @study_record.grade4, @study_record.grade5, @study_record.grade6]

            @correct_to_js = ['','','','','','']

            for i in 0..correct_data.length-1 do
                for j in 0..correct_data[i].length-1 do
                    if correct_data[i][j] == '1'
                        @correct_to_js[i] += j.to_s + ','
                    end
                end
            end
        end
    end

    def collection
        if logged_in?
            @study_record = StudyRecord.find_by(user_id: current_user.id)

            correct_data = [@study_record.grade1, @study_record.grade2, @study_record.grade3, @study_record.grade4, @study_record.grade5, @study_record.grade6]

            @correct_to_js = ['','','','','','']

            for i in 0..correct_data.length-1 do
                for j in 0..correct_data[i].length-1 do
                    if correct_data[i][j] == '1'
                        @correct_to_js[i] += j.to_s + ','
                    end
                end
            end
        else
            redirect_to '/studies'
        end
    end

    def update
        if logged_in?
            study_record = StudyRecord.find_by(user_id: current_user.id)

            #javascriptから問題の正解情報を取得
            grade = params[:grade].to_i
            pass_data = params[:pass_data].to_i

            logger.debug grade
            logger.debug pass_data

            if grade == 0 
                updated = study_record.grade1
                updated[pass_data] = '1'
                study_record.update(grade1: updated)
                redirect_to '/kanji/1'
            elsif grade == 1
                updated = study_record.grade2
                updated[pass_data] = '1'
                study_record.update(grade2: updated)
                redirect_to '/kanji/2'
            elsif grade == 2
                updated = study_record.grade3
                updated[pass_data] = '1'
                study_record.update(grade3: updated)
                redirect_to '/kanji/3'
            elsif grade == 3
                updated = study_record.grade4
                updated[pass_data] = '1'
                study_record.update(grade4: updated)
                redirect_to '/kanji/4'
            elsif grade == 4
                updated = study_record.grade5
                updated[pass_data] = '1'
                study_record.update(grade5: updated)
                redirect_to '/kanji/5'
            elsif grade == 5
                updated = study_record.grade6
                updated[pass_data] = '1'
                study_record.update(grade6: updated)
                redirect_to '/kanji/6'
            end
        end
    end

    def delete
        if params[:confirm] == 'delete'
            study_record = StudyRecord.find_by(user_id: current_user.id)
            study_record.update(grade1:'00000000000000000000000000000000000000000000000000000000000000000000000000000000',grade2:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade3:'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade4:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade5:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade6:'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000')
            redirect_to '/collection'
        end
    end
end
