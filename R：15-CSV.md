# R：15-CSV

## 一、核心前置知识

1. **工作目录**：R默认读取/保存文件的文件夹，可通过 `getwd()` 查看，`setwd("路径")` 设置
2. **数据类型**：`read.csv()` 读取后返回**数据框（data.frame）**，是R处理表格数据的核心格式。

## 二、读取CSV文件

### 1. 准备测试文件（1.csv）

```csv
id,name,url,likes
1,Google,www.google.com,111
2,Runoob,www.runoob.com,222
3,Taobao,www.taobao.com,333

```

### 2. 两种读取方式

```r
# 方式1：直接读取工作目录下的文件（推荐）
data <- read.csv("1.csv")

# 方式2：手动弹窗选择文件（适合不确定路径时）
data <- read.csv(file.choose())

# 打印数据
print(data)
```

### 3. 读取结果

```
  id   name            url likes
1  1 Google www.google.com   111
2  2 Runoob www.runoob.com   222
3  3 Taobao www.taobao.com   333
```

### 4. 基础数据查看

```r
data <- read.csv("1.csv")

# 判断是否为数据框
print(is.data.frame(data))  # TRUE
# 统计列数
print(ncol(data))           # 4
# 统计行数
print(nrow(data))           # 3
```

## 三、CSV数据筛选与分析

### 1. 单字段统计（最大值/最小值等）

```r
data <- read.csv("1.csv")

# 求likes列的最大值
print(max(data$likes))  # 333
# 求likes列的最小值
print(min(data$likes))  # 111
```

### 2. 条件筛选（subset()函数）

`subset(数据框, 筛选条件)` 是R中最常用的筛选函数

- 等于用 `==`
- 大于/小于用 `>` / `<`
- 多条件用 `&`（且）、`|`（或）

```r
data <- read.csv("1.csv")

# 1. 单条件：筛选likes=222的数据
subset(data, likes == 222)

# 2. 多条件：筛选likes>100 且 name=Runoob的数据
subset(data, likes > 100 & name == "Runoob")

# 3. 或条件：筛选likes=111 或 likes=333的数据
subset(data, likes == 111 | likes == 333)
```

## 四、保存为CSV文件

使用 `write.csv(数据, 文件名)` 保存，**推荐添加参数 `row.names=FALSE` 去掉多余行号**

### 1. 基础保存

```r
data <- read.csv("1.csv")
# 筛选数据
result <- subset(data, likes == 222)
# 保存为新CSV
write.csv(result, "runoob.csv")
```

### 2. 验证保存结果

```r
# 读取新生成的文件
new_data <- read.csv("runoob.csv")
print(new_data)
```

**规范输出结果**：
```
  id   name            url likes
1  2 Runoob www.runoob.com   222
```