<div class="" style="margin: 0 auto; max-width: 400px">

    <?php if(!empty($customer_pets)) { ?>

    <h3>Ваши питомцы:</h3>

    <?php foreach($customer_pets as $key => $customer_pet) { ?>

        <div class="b" style="margin-bottom: 10px; display: flex; justify-content: space-between; align-items: center">

            <span><?= $key + 1 . '. ' . $customer_pet['pet'] . ' ' . $customer_pet['breed'] ?></span>

            <button type="button" data-toggle="tooltip" title="Удалить" class="btn btn-danger" onclick=""><i class="fa fa-trash-o"></i></button>

        </div>

    <?php } ?>

    <?php } else { ?>

    <div>No saved pets!</div>

    <?php } ?>

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

    const breed_obj = `<?php echo json_encode($breed_list, true); ?>`;
    const breed_list = JSON.parse(breed_obj);

    const form_pets = document.querySelector('#form_pets');
    const select_pets = document.querySelector('#pet');
    const select_breed = document.querySelector('#breed');
    const gender_block = document.querySelector('#gender_block');


    console.dir(form_pets);




    prepareBreedsSelect(select_pets.value);

    form_pets.addEventListener('submit', function (e) {

        e.preventDefault();

        let gender = '';
        if(form_pets[0].value != 4){
            gender = form_pets[2].value
        }

        const url = "#";

        let form = new FormData();
        form.append('customer_id', customer_id);
        form.append('pet_id', form_pets[0].value);
        form.append('breed_id', form_pets[1].value);
        form.append('gender', gender);
        form.append('age', form_pets[3].value);

        console.dir(form.getAll('gender'));
        console.dir(form.getAll('gender'));
        return false;

        send(url, form).then(json => {
            if (json.data) {
                //console.dir(json.data);
                //location.reload();
            } else {
                console.log('Помилка серверу!');
                return false;
            }
        });

    });

    select_pets.addEventListener('change', function (e) {
        prepareBreedsSelect(e.target.value);
    });

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