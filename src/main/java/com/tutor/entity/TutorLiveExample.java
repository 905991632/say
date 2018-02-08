package com.tutor.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TutorLiveExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TutorLiveExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andTeacheridIsNull() {
            addCriterion("teacherid is null");
            return (Criteria) this;
        }

        public Criteria andTeacheridIsNotNull() {
            addCriterion("teacherid is not null");
            return (Criteria) this;
        }

        public Criteria andTeacheridEqualTo(Integer value) {
            addCriterion("teacherid =", value, "teacherid");
            return (Criteria) this;
        }

        public Criteria andTeacheridNotEqualTo(Integer value) {
            addCriterion("teacherid <>", value, "teacherid");
            return (Criteria) this;
        }

        public Criteria andTeacheridGreaterThan(Integer value) {
            addCriterion("teacherid >", value, "teacherid");
            return (Criteria) this;
        }

        public Criteria andTeacheridGreaterThanOrEqualTo(Integer value) {
            addCriterion("teacherid >=", value, "teacherid");
            return (Criteria) this;
        }

        public Criteria andTeacheridLessThan(Integer value) {
            addCriterion("teacherid <", value, "teacherid");
            return (Criteria) this;
        }

        public Criteria andTeacheridLessThanOrEqualTo(Integer value) {
            addCriterion("teacherid <=", value, "teacherid");
            return (Criteria) this;
        }

        public Criteria andTeacheridIn(List<Integer> values) {
            addCriterion("teacherid in", values, "teacherid");
            return (Criteria) this;
        }

        public Criteria andTeacheridNotIn(List<Integer> values) {
            addCriterion("teacherid not in", values, "teacherid");
            return (Criteria) this;
        }

        public Criteria andTeacheridBetween(Integer value1, Integer value2) {
            addCriterion("teacherid between", value1, value2, "teacherid");
            return (Criteria) this;
        }

        public Criteria andTeacheridNotBetween(Integer value1, Integer value2) {
            addCriterion("teacherid not between", value1, value2, "teacherid");
            return (Criteria) this;
        }

        public Criteria andPermissionIsNull() {
            addCriterion("permission is null");
            return (Criteria) this;
        }

        public Criteria andPermissionIsNotNull() {
            addCriterion("permission is not null");
            return (Criteria) this;
        }

        public Criteria andPermissionEqualTo(Integer value) {
            addCriterion("permission =", value, "permission");
            return (Criteria) this;
        }

        public Criteria andPermissionNotEqualTo(Integer value) {
            addCriterion("permission <>", value, "permission");
            return (Criteria) this;
        }

        public Criteria andPermissionGreaterThan(Integer value) {
            addCriterion("permission >", value, "permission");
            return (Criteria) this;
        }

        public Criteria andPermissionGreaterThanOrEqualTo(Integer value) {
            addCriterion("permission >=", value, "permission");
            return (Criteria) this;
        }

        public Criteria andPermissionLessThan(Integer value) {
            addCriterion("permission <", value, "permission");
            return (Criteria) this;
        }

        public Criteria andPermissionLessThanOrEqualTo(Integer value) {
            addCriterion("permission <=", value, "permission");
            return (Criteria) this;
        }

        public Criteria andPermissionIn(List<Integer> values) {
            addCriterion("permission in", values, "permission");
            return (Criteria) this;
        }

        public Criteria andPermissionNotIn(List<Integer> values) {
            addCriterion("permission not in", values, "permission");
            return (Criteria) this;
        }

        public Criteria andPermissionBetween(Integer value1, Integer value2) {
            addCriterion("permission between", value1, value2, "permission");
            return (Criteria) this;
        }

        public Criteria andPermissionNotBetween(Integer value1, Integer value2) {
            addCriterion("permission not between", value1, value2, "permission");
            return (Criteria) this;
        }

        public Criteria andRtmpurlIsNull() {
            addCriterion("rtmpurl is null");
            return (Criteria) this;
        }

        public Criteria andRtmpurlIsNotNull() {
            addCriterion("rtmpurl is not null");
            return (Criteria) this;
        }

        public Criteria andRtmpurlEqualTo(String value) {
            addCriterion("rtmpurl =", value, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpurlNotEqualTo(String value) {
            addCriterion("rtmpurl <>", value, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpurlGreaterThan(String value) {
            addCriterion("rtmpurl >", value, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpurlGreaterThanOrEqualTo(String value) {
            addCriterion("rtmpurl >=", value, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpurlLessThan(String value) {
            addCriterion("rtmpurl <", value, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpurlLessThanOrEqualTo(String value) {
            addCriterion("rtmpurl <=", value, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpurlLike(String value) {
            addCriterion("rtmpurl like", value, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpurlNotLike(String value) {
            addCriterion("rtmpurl not like", value, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpurlIn(List<String> values) {
            addCriterion("rtmpurl in", values, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpurlNotIn(List<String> values) {
            addCriterion("rtmpurl not in", values, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpurlBetween(String value1, String value2) {
            addCriterion("rtmpurl between", value1, value2, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpurlNotBetween(String value1, String value2) {
            addCriterion("rtmpurl not between", value1, value2, "rtmpurl");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyIsNull() {
            addCriterion("rtmpkey is null");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyIsNotNull() {
            addCriterion("rtmpkey is not null");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyEqualTo(String value) {
            addCriterion("rtmpkey =", value, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyNotEqualTo(String value) {
            addCriterion("rtmpkey <>", value, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyGreaterThan(String value) {
            addCriterion("rtmpkey >", value, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyGreaterThanOrEqualTo(String value) {
            addCriterion("rtmpkey >=", value, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyLessThan(String value) {
            addCriterion("rtmpkey <", value, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyLessThanOrEqualTo(String value) {
            addCriterion("rtmpkey <=", value, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyLike(String value) {
            addCriterion("rtmpkey like", value, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyNotLike(String value) {
            addCriterion("rtmpkey not like", value, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyIn(List<String> values) {
            addCriterion("rtmpkey in", values, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyNotIn(List<String> values) {
            addCriterion("rtmpkey not in", values, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyBetween(String value1, String value2) {
            addCriterion("rtmpkey between", value1, value2, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andRtmpkeyNotBetween(String value1, String value2) {
            addCriterion("rtmpkey not between", value1, value2, "rtmpkey");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNull() {
            addCriterion("createtime is null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNotNull() {
            addCriterion("createtime is not null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeEqualTo(Date value) {
            addCriterion("createtime =", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotEqualTo(Date value) {
            addCriterion("createtime <>", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThan(Date value) {
            addCriterion("createtime >", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("createtime >=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThan(Date value) {
            addCriterion("createtime <", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThanOrEqualTo(Date value) {
            addCriterion("createtime <=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIn(List<Date> values) {
            addCriterion("createtime in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotIn(List<Date> values) {
            addCriterion("createtime not in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeBetween(Date value1, Date value2) {
            addCriterion("createtime between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotBetween(Date value1, Date value2) {
            addCriterion("createtime not between", value1, value2, "createtime");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}