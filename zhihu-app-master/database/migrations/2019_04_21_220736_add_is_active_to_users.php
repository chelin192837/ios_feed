<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddIsActiveToUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            //
            $table->smallInteger('is_active')->default(0);
//            $table->integer('questions_count')->default(0);
//            $table->integer('answers_count')->default(0);
//            $table->integer('comments_count')->default(0);
//            $table->integer('favorites_count')->default(0);
//            $table->integer('likes_count')->default(0);
//            $table->integer('followers_count')->default(0);
//            $table->integer('followings_count')->default(0);
//            $table->integer('experience_count')->default(0);
//            $table->json('setting')->nullable();
//            $table->rememberToken();
//            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            //
            $table->dropColumn('is_active');//删除字段以便于后期修改错误一定要写

            });
    }
}
