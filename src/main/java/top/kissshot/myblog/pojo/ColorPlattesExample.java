package top.kissshot.myblog.pojo;

import java.util.ArrayList;
import java.util.List;

public class ColorPlattesExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ColorPlattesExample() {
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

        public Criteria andCidIsNull() {
            addCriterion("cid is null");
            return (Criteria) this;
        }

        public Criteria andCidIsNotNull() {
            addCriterion("cid is not null");
            return (Criteria) this;
        }

        public Criteria andCidEqualTo(Integer value) {
            addCriterion("cid =", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotEqualTo(Integer value) {
            addCriterion("cid <>", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidGreaterThan(Integer value) {
            addCriterion("cid >", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidGreaterThanOrEqualTo(Integer value) {
            addCriterion("cid >=", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidLessThan(Integer value) {
            addCriterion("cid <", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidLessThanOrEqualTo(Integer value) {
            addCriterion("cid <=", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidIn(List<Integer> values) {
            addCriterion("cid in", values, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotIn(List<Integer> values) {
            addCriterion("cid not in", values, "cid");
            return (Criteria) this;
        }

        public Criteria andCidBetween(Integer value1, Integer value2) {
            addCriterion("cid between", value1, value2, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotBetween(Integer value1, Integer value2) {
            addCriterion("cid not between", value1, value2, "cid");
            return (Criteria) this;
        }

        public Criteria andColor1IsNull() {
            addCriterion("color1 is null");
            return (Criteria) this;
        }

        public Criteria andColor1IsNotNull() {
            addCriterion("color1 is not null");
            return (Criteria) this;
        }

        public Criteria andColor1EqualTo(String value) {
            addCriterion("color1 =", value, "color1");
            return (Criteria) this;
        }

        public Criteria andColor1NotEqualTo(String value) {
            addCriterion("color1 <>", value, "color1");
            return (Criteria) this;
        }

        public Criteria andColor1GreaterThan(String value) {
            addCriterion("color1 >", value, "color1");
            return (Criteria) this;
        }

        public Criteria andColor1GreaterThanOrEqualTo(String value) {
            addCriterion("color1 >=", value, "color1");
            return (Criteria) this;
        }

        public Criteria andColor1LessThan(String value) {
            addCriterion("color1 <", value, "color1");
            return (Criteria) this;
        }

        public Criteria andColor1LessThanOrEqualTo(String value) {
            addCriterion("color1 <=", value, "color1");
            return (Criteria) this;
        }

        public Criteria andColor1Like(String value) {
            addCriterion("color1 like", value, "color1");
            return (Criteria) this;
        }

        public Criteria andColor1NotLike(String value) {
            addCriterion("color1 not like", value, "color1");
            return (Criteria) this;
        }

        public Criteria andColor1In(List<String> values) {
            addCriterion("color1 in", values, "color1");
            return (Criteria) this;
        }

        public Criteria andColor1NotIn(List<String> values) {
            addCriterion("color1 not in", values, "color1");
            return (Criteria) this;
        }

        public Criteria andColor1Between(String value1, String value2) {
            addCriterion("color1 between", value1, value2, "color1");
            return (Criteria) this;
        }

        public Criteria andColor1NotBetween(String value1, String value2) {
            addCriterion("color1 not between", value1, value2, "color1");
            return (Criteria) this;
        }

        public Criteria andColor2IsNull() {
            addCriterion("color2 is null");
            return (Criteria) this;
        }

        public Criteria andColor2IsNotNull() {
            addCriterion("color2 is not null");
            return (Criteria) this;
        }

        public Criteria andColor2EqualTo(String value) {
            addCriterion("color2 =", value, "color2");
            return (Criteria) this;
        }

        public Criteria andColor2NotEqualTo(String value) {
            addCriterion("color2 <>", value, "color2");
            return (Criteria) this;
        }

        public Criteria andColor2GreaterThan(String value) {
            addCriterion("color2 >", value, "color2");
            return (Criteria) this;
        }

        public Criteria andColor2GreaterThanOrEqualTo(String value) {
            addCriterion("color2 >=", value, "color2");
            return (Criteria) this;
        }

        public Criteria andColor2LessThan(String value) {
            addCriterion("color2 <", value, "color2");
            return (Criteria) this;
        }

        public Criteria andColor2LessThanOrEqualTo(String value) {
            addCriterion("color2 <=", value, "color2");
            return (Criteria) this;
        }

        public Criteria andColor2Like(String value) {
            addCriterion("color2 like", value, "color2");
            return (Criteria) this;
        }

        public Criteria andColor2NotLike(String value) {
            addCriterion("color2 not like", value, "color2");
            return (Criteria) this;
        }

        public Criteria andColor2In(List<String> values) {
            addCriterion("color2 in", values, "color2");
            return (Criteria) this;
        }

        public Criteria andColor2NotIn(List<String> values) {
            addCriterion("color2 not in", values, "color2");
            return (Criteria) this;
        }

        public Criteria andColor2Between(String value1, String value2) {
            addCriterion("color2 between", value1, value2, "color2");
            return (Criteria) this;
        }

        public Criteria andColor2NotBetween(String value1, String value2) {
            addCriterion("color2 not between", value1, value2, "color2");
            return (Criteria) this;
        }

        public Criteria andColor3IsNull() {
            addCriterion("color3 is null");
            return (Criteria) this;
        }

        public Criteria andColor3IsNotNull() {
            addCriterion("color3 is not null");
            return (Criteria) this;
        }

        public Criteria andColor3EqualTo(String value) {
            addCriterion("color3 =", value, "color3");
            return (Criteria) this;
        }

        public Criteria andColor3NotEqualTo(String value) {
            addCriterion("color3 <>", value, "color3");
            return (Criteria) this;
        }

        public Criteria andColor3GreaterThan(String value) {
            addCriterion("color3 >", value, "color3");
            return (Criteria) this;
        }

        public Criteria andColor3GreaterThanOrEqualTo(String value) {
            addCriterion("color3 >=", value, "color3");
            return (Criteria) this;
        }

        public Criteria andColor3LessThan(String value) {
            addCriterion("color3 <", value, "color3");
            return (Criteria) this;
        }

        public Criteria andColor3LessThanOrEqualTo(String value) {
            addCriterion("color3 <=", value, "color3");
            return (Criteria) this;
        }

        public Criteria andColor3Like(String value) {
            addCriterion("color3 like", value, "color3");
            return (Criteria) this;
        }

        public Criteria andColor3NotLike(String value) {
            addCriterion("color3 not like", value, "color3");
            return (Criteria) this;
        }

        public Criteria andColor3In(List<String> values) {
            addCriterion("color3 in", values, "color3");
            return (Criteria) this;
        }

        public Criteria andColor3NotIn(List<String> values) {
            addCriterion("color3 not in", values, "color3");
            return (Criteria) this;
        }

        public Criteria andColor3Between(String value1, String value2) {
            addCriterion("color3 between", value1, value2, "color3");
            return (Criteria) this;
        }

        public Criteria andColor3NotBetween(String value1, String value2) {
            addCriterion("color3 not between", value1, value2, "color3");
            return (Criteria) this;
        }

        public Criteria andColor4IsNull() {
            addCriterion("color4 is null");
            return (Criteria) this;
        }

        public Criteria andColor4IsNotNull() {
            addCriterion("color4 is not null");
            return (Criteria) this;
        }

        public Criteria andColor4EqualTo(String value) {
            addCriterion("color4 =", value, "color4");
            return (Criteria) this;
        }

        public Criteria andColor4NotEqualTo(String value) {
            addCriterion("color4 <>", value, "color4");
            return (Criteria) this;
        }

        public Criteria andColor4GreaterThan(String value) {
            addCriterion("color4 >", value, "color4");
            return (Criteria) this;
        }

        public Criteria andColor4GreaterThanOrEqualTo(String value) {
            addCriterion("color4 >=", value, "color4");
            return (Criteria) this;
        }

        public Criteria andColor4LessThan(String value) {
            addCriterion("color4 <", value, "color4");
            return (Criteria) this;
        }

        public Criteria andColor4LessThanOrEqualTo(String value) {
            addCriterion("color4 <=", value, "color4");
            return (Criteria) this;
        }

        public Criteria andColor4Like(String value) {
            addCriterion("color4 like", value, "color4");
            return (Criteria) this;
        }

        public Criteria andColor4NotLike(String value) {
            addCriterion("color4 not like", value, "color4");
            return (Criteria) this;
        }

        public Criteria andColor4In(List<String> values) {
            addCriterion("color4 in", values, "color4");
            return (Criteria) this;
        }

        public Criteria andColor4NotIn(List<String> values) {
            addCriterion("color4 not in", values, "color4");
            return (Criteria) this;
        }

        public Criteria andColor4Between(String value1, String value2) {
            addCriterion("color4 between", value1, value2, "color4");
            return (Criteria) this;
        }

        public Criteria andColor4NotBetween(String value1, String value2) {
            addCriterion("color4 not between", value1, value2, "color4");
            return (Criteria) this;
        }

        public Criteria andViewcountIsNull() {
            addCriterion("viewCount is null");
            return (Criteria) this;
        }

        public Criteria andViewcountIsNotNull() {
            addCriterion("viewCount is not null");
            return (Criteria) this;
        }

        public Criteria andViewcountEqualTo(Integer value) {
            addCriterion("viewCount =", value, "viewcount");
            return (Criteria) this;
        }

        public Criteria andViewcountNotEqualTo(Integer value) {
            addCriterion("viewCount <>", value, "viewcount");
            return (Criteria) this;
        }

        public Criteria andViewcountGreaterThan(Integer value) {
            addCriterion("viewCount >", value, "viewcount");
            return (Criteria) this;
        }

        public Criteria andViewcountGreaterThanOrEqualTo(Integer value) {
            addCriterion("viewCount >=", value, "viewcount");
            return (Criteria) this;
        }

        public Criteria andViewcountLessThan(Integer value) {
            addCriterion("viewCount <", value, "viewcount");
            return (Criteria) this;
        }

        public Criteria andViewcountLessThanOrEqualTo(Integer value) {
            addCriterion("viewCount <=", value, "viewcount");
            return (Criteria) this;
        }

        public Criteria andViewcountIn(List<Integer> values) {
            addCriterion("viewCount in", values, "viewcount");
            return (Criteria) this;
        }

        public Criteria andViewcountNotIn(List<Integer> values) {
            addCriterion("viewCount not in", values, "viewcount");
            return (Criteria) this;
        }

        public Criteria andViewcountBetween(Integer value1, Integer value2) {
            addCriterion("viewCount between", value1, value2, "viewcount");
            return (Criteria) this;
        }

        public Criteria andViewcountNotBetween(Integer value1, Integer value2) {
            addCriterion("viewCount not between", value1, value2, "viewcount");
            return (Criteria) this;
        }

        public Criteria andLikecountIsNull() {
            addCriterion("likeCount is null");
            return (Criteria) this;
        }

        public Criteria andLikecountIsNotNull() {
            addCriterion("likeCount is not null");
            return (Criteria) this;
        }

        public Criteria andLikecountEqualTo(Integer value) {
            addCriterion("likeCount =", value, "likecount");
            return (Criteria) this;
        }

        public Criteria andLikecountNotEqualTo(Integer value) {
            addCriterion("likeCount <>", value, "likecount");
            return (Criteria) this;
        }

        public Criteria andLikecountGreaterThan(Integer value) {
            addCriterion("likeCount >", value, "likecount");
            return (Criteria) this;
        }

        public Criteria andLikecountGreaterThanOrEqualTo(Integer value) {
            addCriterion("likeCount >=", value, "likecount");
            return (Criteria) this;
        }

        public Criteria andLikecountLessThan(Integer value) {
            addCriterion("likeCount <", value, "likecount");
            return (Criteria) this;
        }

        public Criteria andLikecountLessThanOrEqualTo(Integer value) {
            addCriterion("likeCount <=", value, "likecount");
            return (Criteria) this;
        }

        public Criteria andLikecountIn(List<Integer> values) {
            addCriterion("likeCount in", values, "likecount");
            return (Criteria) this;
        }

        public Criteria andLikecountNotIn(List<Integer> values) {
            addCriterion("likeCount not in", values, "likecount");
            return (Criteria) this;
        }

        public Criteria andLikecountBetween(Integer value1, Integer value2) {
            addCriterion("likeCount between", value1, value2, "likecount");
            return (Criteria) this;
        }

        public Criteria andLikecountNotBetween(Integer value1, Integer value2) {
            addCriterion("likeCount not between", value1, value2, "likecount");
            return (Criteria) this;
        }

        public Criteria andDateIsNull() {
            addCriterion("date is null");
            return (Criteria) this;
        }

        public Criteria andDateIsNotNull() {
            addCriterion("date is not null");
            return (Criteria) this;
        }

        public Criteria andDateEqualTo(String value) {
            addCriterion("date =", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotEqualTo(String value) {
            addCriterion("date <>", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThan(String value) {
            addCriterion("date >", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThanOrEqualTo(String value) {
            addCriterion("date >=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThan(String value) {
            addCriterion("date <", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThanOrEqualTo(String value) {
            addCriterion("date <=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLike(String value) {
            addCriterion("date like", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotLike(String value) {
            addCriterion("date not like", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateIn(List<String> values) {
            addCriterion("date in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotIn(List<String> values) {
            addCriterion("date not in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateBetween(String value1, String value2) {
            addCriterion("date between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotBetween(String value1, String value2) {
            addCriterion("date not between", value1, value2, "date");
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