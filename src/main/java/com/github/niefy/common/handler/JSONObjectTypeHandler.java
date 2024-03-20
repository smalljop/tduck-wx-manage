package com.github.niefy.common.handler;

import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedJdbcTypes(JdbcType.VARCHAR)
public class JSONObjectTypeHandler extends BaseTypeHandler<JSONObject> {
    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, JSONObject array, JdbcType jdbcType) throws SQLException {
        ps.setString(i, array.toJSONString());
    }

    @Override
    public JSONObject getNullableResult(ResultSet resultSet, String columnName) throws SQLException {
        if (resultSet.getString(columnName) == null) {
            return new JSONObject();
        }
        return JSONUtil.parse(resultSet.getString(columnName)).toBean(JSONObject.class);
    }

    @Override
    public JSONObject getNullableResult(ResultSet resultSet, int columnIndex) throws SQLException {
        return JSONUtil.parse(resultSet.getString(columnIndex)).toBean(JSONObject.class);
    }

    @Override
    public JSONObject getNullableResult(CallableStatement callableStatement, int columnIndex) throws SQLException {
        return JSONUtil.parse(callableStatement.getString(columnIndex)).toBean(JSONObject.class);
    }
}
