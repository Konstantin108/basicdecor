<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = [
            [
                'name' => 'Kirill',
                'email' => 'kirill@mail.ru',
                'email_verified_at' => now(),
                'password' => Hash::make('12345678'), // password
                'remember_token' => Str::random(10),
            ],
            [
                'name' => 'Kostya',
                'email' => 'kostya@mail.ru',
                'email_verified_at' => now(),
                'password' => Hash::make('12345678'), // password
                'remember_token' => Str::random(10),
            ],
            [
                'name' => 'Maxim',
                'email' => 'maxim@mail.ru',
                'email_verified_at' => now(),
                'password' => Hash::make('12345678'), // password
                'remember_token' => Str::random(10),
            ]
        ];
        DB::table('users')->insert($users);
    }
}