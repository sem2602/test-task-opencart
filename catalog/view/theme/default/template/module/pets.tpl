<div class="" style="margin: 0 auto; max-width: 400px">

    <div id="pets_list"></div>

    <div style="margin-top: 10px;">

        <form id="form_pets" action="#" method="post">

            <div class="form-group">
                <label for="pet">Питомец:</label>
                <select id="pet" class="form-control">

                    <?php foreach($pets_list as $key => $item) { ?>

                        <option value="<?= $key ?>"><?= $item ?></option>

                    <?php } ?>

                </select>
            </div>

            <div class="form-group">
                <label for="breed">Порода питомца:</label>
                <select id="breed" class="form-control" required>

                </select>
            </div>

            <div id="gender_block" class="form-group">
                <label for="gender">Пол питомца:</label>
                <select id="gender" class="form-control">
                    <option value="male">Мужской</option>
                    <option value="female">Женский</option>
                </select>
            </div>

            <div class="form-group">
                <label for="age">Возраст питомца (месяцев):</label>
                <input id="age" class="form-control" type="number" min="1" name="age" required>
            </div>

            <button class="btn btn-success" type="submit">Добавить питомца</button>

        </form>

    </div>

</div>

<script>

    const customer_id = `<?= $customer_id ?>`;
    const pets_list = JSON.parse(`<?php echo json_encode($customer_pets) ?>`);
    const pets_list_block = document.querySelector('#pets_list');

    const breed_obj = `<?php echo json_encode($breed_list, true); ?>`;
    const breed_list = JSON.parse(breed_obj);

    const form_pets = document.querySelector('#form_pets');
    const select_pets = document.querySelector('#pet');
    const select_breed = document.querySelector('#breed');
    const gender_block = document.querySelector('#gender_block');

    preparePetsList(pets_list);

    prepareBreedsSelect(select_pets.value);

    form_pets.addEventListener('submit', function (e) {

        e.preventDefault();

        let gender = '';
        if(form_pets[0].value != 4){
            gender = form_pets[2].value
        }

        const url = "index.php?route=module/pets/add";

        let form = new FormData();
        form.append('customer_id', customer_id);
        form.append('pet_id', form_pets[0].value);
        form.append('breed_id', form_pets[1].value);
        form.append('gender', gender);
        form.append('age', form_pets[3].value);

        send(url, form).then(json => {
            if (json.data) {
                preparePetsList(json.data.customer_pets);
                //location.reload();
            } else {
                console.log('Помилка серверу!');
                return false;
            }
        });

    });

    function delPet(id){

        const url = "index.php?route=module/pets/delete";

        let form = new FormData();
        form.append('id', id);
        form.append('customer_id', customer_id);

        send(url, form).then(json => {
            if (json.data) {
                preparePetsList(json.data.customer_pets);
                //location.reload();
            } else {
                console.log('Помилка серверу!');
                return false;
            }
        });

    }

    select_pets.addEventListener('change', function (e) {
        prepareBreedsSelect(e.target.value);
    });

    function preparePetsList(data){

        let html = '';
        if(data.length > 0){

            html += `<h3>Ваши питомцы:</h3>`;

            data.forEach((item, index) => {
                html += `<div style="margin-bottom: 10px; display: flex; justify-content: space-between; align-items: center">`;
                html += `<span>${index + 1}. ${item.pet} ${item.breed}</span>`;
                html += `<button type="button" data-toggle="tooltip" title="Удалить" class="btn btn-danger" onclick="delPet(${item.id});">
                    <i class="fa fa-trash-o"></i></button></div>`;
            });

            pets_list_block.innerHTML = html;

        } else {
            html += `<h4>Добавьте своего питомца!</h4>`;
            pets_list_block.innerHTML = html;
        }

    }

    function prepareBreedsSelect(pet_id){
        let str = '';
        breed_list[pet_id].forEach(item => {
            str += `<option value="${item.id}">${item.breed}</option>`;
        });
        select_breed.innerHTML = str;
        if(pet_id == 4){
            gender_block.style.display = 'none';
        } else {
            gender_block.style.display = 'block';
        }
    }

    async function send(url, body = null) {

        if (body) {
            let response = await fetch(url, {
                method: 'POST',
                body: body,
                headers: {
                    //"Content-type": "application/json",
                    //"Authorization": "Bearer " + token
                }
            });
            return await response.json();
        } else {
            let response = await fetch(url, {method: 'GET'});
            return await response.json();
        }
    }

</script>