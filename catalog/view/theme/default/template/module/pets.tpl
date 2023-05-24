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

            <div class="form-group">
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

    const form_pets = document.querySelector('#form_pets');
    const select_pets = document.querySelector('#pet');
    const select_breed = document.querySelector('#breed');



    //console.dir(select_breed);

    select_pets.addEventListener('change', function (e) {
        //console.dir(select_pets);
        console.log(e.target.value);
    });

</script>