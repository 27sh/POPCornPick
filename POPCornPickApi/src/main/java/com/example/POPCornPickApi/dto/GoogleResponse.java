//package com.example.POPCornPickApi.dto;
//
//import java.util.List;
//import java.util.Map;
//
//import org.hibernate.internal.build.AllowSysOut;
//
//public class GoogleResponse implements OAuth2Response{
//	
//	private final Map<String, Object> attribute;
//	
//	public GoogleResponse(Map<String, Object> attribute) {
//		this.attribute = attribute;
//	}
//	
//	@Override
//	public String getProvider() {
//		return "google";
//	}
//
//	@Override
//	public String getProviderId() {
//		return attribute.get("sub").toString();
//	}
//
//	@Override
//	public String getEmail() {
//		return attribute.get("email").toString();
//	}
//
//	@Override
//	public String getName() {
//		return attribute.get("name").toString();
//	}
//
//	@Override
//	public Map<String, Object> getCheck() {
//		return attribute;
//	}
//
//	
//
////	@Override
////	public String getPhoneNumber() {
////		return attribute.get("phonenumbers").toString();
////	}
////
////	@Override
////	public String getGender() {
////		return attribute.get("genders").toString();
////	}
//	
////	@Override
////	public String getPhoneNumber() {
////	    // attribute 맵에서 "phoneNumbers" 키에 해당하는 값을 추출합니다.
////	    List<Map<String, Object>> phoneNumbersList = (List<Map<String, Object>>) attribute.get("phoneNumbers");
////
////	    // phoneNumbersList가 비어있지 않다면 첫 번째 요소에서 "value" 키에 해당하는 값을 전화번호로 반환합니다.
////	    if (!phoneNumbersList.isEmpty()) {
////	        Map<String, Object> phoneNumberMap = phoneNumbersList.get(0);
////	        return phoneNumberMap.get("value").toString();
////	    }
////
////	    // 전화번호가 없는 경우 null을 반환합니다.
////	    return null;
////	}
////
////	@Override
////	public String getGender() {
////	    // attribute 맵에서 "genders" 키에 해당하는 값을 추출합니다.
////	    List<Map<String, Object>> gendersList = (List<Map<String, Object>>) attribute.get("genders");
////
////	    // gendersList가 비어있지 않다면 첫 번째 요소에서 "value" 키에 해당하는 값을 성별로 반환합니다.
////	    if (!gendersList.isEmpty()) {
////	        Map<String, Object> genderMap = gendersList.get(0);
////	        return genderMap.get("value").toString();
////	    }
////
////	    // 성별 정보가 없는 경우 null을 반환합니다.
////	    return null;
////	}
//	
//	
//}
