### Rails CRUD

* ORM(Object Relational Mapper)

  * rails에서는 [ActiveRecord](https://guides.rorlab.org/active_record_basics.html)를 활용한다.

* Controller 생성

  ```console
  $rails g controller 컨트롤러명 액션명1 액션명2 액션명3 ...
  ~ $ rails g controller posts index new create ...
  ```

*  Model 생성

  ```console
  $ rails g model post 
  ```

  * `app/model/post.rb`
  * `db/migrate/20180619_create_posts.rb`

* `migration 파일` 변경

  ```ruby
  # db/migrate/20180619_create_posts.rb
  class CreatePosts < ActiveRecord::Migration
    def change
      create_table :posts do |t|
        t.string :title # string type의 title
        t.text :body # text type의 body
        t.timestamps null: false
      end
    end
  end
  ```

  ```console
  $ rake db:migrate
  #~
  == 20180619040901 CreatePosts: migrating ======================================
  -- create_table(:posts)
     -> 0.0124s
  == 20180619040901 CreatePosts: migrated (0.0140s) =============================
  
  ```

  * `db/schema.rb`에 반영이 되었는지 확인하기.

* CRUD

  * Create : `new`, `create`
  * Read : `show`
  * Update : `edit`, `update`
  * Destroy : `destroy`

* Create

  ```console
  $ rails c
  ```

  ```console
  irb(main):001:0 > Post.create(title: "제목", body: "내용")
  ```

* Read

  ```console
  irb(main):001:0 > Post.find(id)
  ```

* Update

  ```console
  irb(main):001:0 > post = Post.find(id)
  irb(main):002:0 > post.updatet(title: "변경", body: "변경")
  ```

* Destroy

  ```console
  irb(main):001:0 > Post.find(id).destroy
  ```



### [Rails Flash Message](https://guides.rorlab.org/action_controller_overview.html#flash)

```ruby
def destroy
    flash[:alert] = "삭제되었습니다."
end
```

```erb
<%= flash[:alert] %>
```



### [Rails Partial](https://guides.rorlab.org/layouts_and_rendering.html#파셜-partial-사용하기)

* layout이 너무 복잡해지는 것을 방지하기 위에 `layouts` 폴더에  _파일을 만들어 나누어 저장한 뒤 body에서 render를 이용하여 불러올 수 있다.

`app/views/layouts/_flash.html.erb`

```erb
<%= render 'layout/flash' %>
```

 <!--파일명에는 _를 붙여서 만들어야 하나 render로 불러올 때는 _를 붙이지 않는것이 약속이다.-->