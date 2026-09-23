Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8DE56C64E
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192620; cv=none; b=vBPBinwB3jSSSKfWFrRjRaLounYSDz3KxTEHme+QwzKyPKjwkxUa0E6F8dm7Dt8XmbiPU+FJ+Xf7iXmA/rR/wSo1D5gCVMmsHo8ZICQh6IPJiGdbdVPkAqRm0CVYt9MYARU4LcCsczRL53Dp96Gc1xXOeP45q9TFUT7YSJty+y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192620; c=relaxed/simple;
	bh=wWKQuvyubDHU/IrhFMArkBmNX23h+O7QmsVELBq/Zqo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FD2k40UlFiOWuZfiZ2Hy8ev35TK9jKTQTI/y5TubI9vgy3fINI1UyBTTw0LEBjWAd8YEI5xENBpRWfpLsMiR1uL99VATXNN3fDqnTE+ES8vpew8dYFNxxHDe+8X7q07ViposTP4SyYKxOyPK3sorYoIREpvS/gU6/1ti0AjYTiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpynfH6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sj2l065k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpynfH6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sj2l065k"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTuQN064025
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 19:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tcK25AN87gEvJkSzvkoezzruWqFJIqdKKxQJr08+SQ=; b=kpynfH6YJ06P3Zj9
	8te25+csNfOqZozEPdNX3QqGDI21WuQjsukQ2nGWBIbw9KF5JkJwgN9UWNKDf+2Y
	bMx3bYF9ww/SW6xGsfbjgMC4fNN2RtCT6PQ3liPmwwGqZzDqG9W/5IBmUFSl3lSE
	SB/KbRMUuYnpLUrUcqn4gUUvBr8XZfxK8iFSFITSISfGiNxKIFSngAlhFJnZMdD7
	7cBOckrFe5wAjKw1fAMfHi5shKrdW53r4i8yFLGrdup17D73BD7x1ZPPUuDyL6na
	RZsgo0BSaiMUacNmLFLYc8CkAsUDBwBusSOB1g2gpNuC2jtluUI5QvXjc6okHgBA
	3foE5Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbhmr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 19:43:37 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so179471241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790192617; x=1790797417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tcK25AN87gEvJkSzvkoezzruWqFJIqdKKxQJr08+SQ=;
        b=Sj2l065kYce+z+z0hYnMj4pG4L6iomeeHpIeyFF4f0VVTfQ8HXcbWKLWr1lFGw7HJP
         LfiPzfxuqrYhHTSnjLnzr+6ujTrV3X0J+Z5u1We/JlW7shl80F+D42fbNq/eDoH6K4VK
         uwCCHXVr4WdUbph7fLhp325WUlRrTWJRnZD71njCqYDv7jeCXmVDdgfVbFEMV9EU+J/V
         YpB6PfpYsCmPyGbLgK4T/5VeEUiCuttxBzwLh8rsq1Z5ypbTIpDwnIHGcikL1lMy3bmN
         5cHWRcKvGr/jHDmiwsEzxhg8QJmCfmxwVZJ2pivwGf87HAW83Dx3ePQifkhQhvmwCjZi
         M3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790192617; x=1790797417;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tcK25AN87gEvJkSzvkoezzruWqFJIqdKKxQJr08+SQ=;
        b=ypUxCwd5eVg1v0LLNH6blevGwWm1Aq8GnUWdFqRbyBEdaoFxVIddZQwNkqeCQLSJZz
         2XbfSJZyVWvUfNwfXdiKhUldXtzeZACLnwIHYMbmPFbWPruvTXGxOCajqfxVP0TsILTF
         GHBQ59mnPn1F2xa8L8xWpRaYTN1pkM84r7ZxUa+crokasd1BUSoEbOD/dZo4OI6hBKM6
         YNs3tZdZ7dgMAZWsGfSEG+gMoYuPIsh24YXuozCTPALxZ2BgWwaE3HUyXqsy8/2tjc/j
         zlE4t3sYqrQz4JHT/NZfAwZ39LJdf0u3+E0PoigeQSfEyNr9pgnc9wJmyUHl/cLZcsDn
         OIOA==
X-Forwarded-Encrypted: i=1; AKwUvBw2feu98R+3mkoIGtQVe7uRh6DzPXsnKomAZhEYzAr+fE9hHBDoRwN3IIxmZUVjY/Y+VNxoWAB041pUtAmr@vger.kernel.org
X-Gm-Message-State: AFuF++n2N6YQx+XM9kZofjbsYLyBrnzrRAaxkPOTF7Qfc2lK63YMqCEV
	zC3SxMN54aKNcDkN6RLowONvLrT4dKdEzMI1oZVwzc8YRkR/6keQiz2iWcQ/hhED6CCWCTufa2O
	38vZQWXlD35hjh5blDFqOI7+X4zgVssALEaTeyyWuhLCZ9+VjXVhj0eKV92iWSFsXjT+z
X-Gm-Gg: AYBFou3dKGOoO6cSA+qmOrcADeRPnHRXwu3hBEJwXimrBIWRVi8c49/oI5G179ikYvX
	1DxC2UGiXx200BVhVGfN+x2qYP8KfLGhHG3AcwVjPMzkoj5vTP/5uPLXq4DHQYfISb9BIRKw5o3
	fg4/dJI5r+YqazNxAgJsq4n8jOwlHllt0xu8e+5MKo3WAohpBCBVm5mj2mYrnFHHDgPBj6hh2Vm
	8u+sKQEO4Vp7DlOM9EFl5tlHOFN8AIffk8mgEQ9aASM2BrOiCISJfi1eC8T8E/jjn3KARsoDvP3
	rNzzI4FN5L5/wyuNU2iMhLY2O0j+DKx4rQlIiv+jlkN7oAfqrXFMyc/urWaFx4RrbFpeAdUQPRh
	+E7pwwXM5rfvvxlaVUafApQj6Z0NKyhmWtGxAwQWgEWrXoPS6BprYKuH1DhpvDRxCeP3Wk+NwDw
	VkYk+RZrMy2GoRp5IW7I5Zopx7W8gM3bjvnHQ2R7n3H5LH/69UuZh1mMl5qKuuMxwwlSI=
X-Received: by 2002:a05:6102:83ce:10b0:7a1:f2b5:6465 with SMTP id ada2fe7eead31-7af1f40bbddmr147637137.34.1790192616870;
        Wed, 23 Sep 2026 12:43:36 -0700 (PDT)
X-Received: by 2002:a05:6102:83ce:10b0:7a1:f2b5:6465 with SMTP id ada2fe7eead31-7af1f40bbddmr147521137.34.1790192612673;
        Wed, 23 Sep 2026 12:43:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a8fadsm2311498a12.24.2026.09.23.12.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 12:43:30 -0700 (PDT)
Message-ID: <067c2405-575d-44bb-8301-9c8dbd00febe@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 21:43:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
 <339deca4-8b35-4fb2-bc1d-adf471f94d06@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <339deca4-8b35-4fb2-bc1d-adf471f94d06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3OCBTYWx0ZWRfX2MYn+LYFQy5p
 837drhL4/0ec7rt9bSeuUidXBjD407qEZD2SiIkjrcRzkzJkHQaRlqg/Hr4BnPzPXOyIKE7LOfH
 02/droGyYXanBPDXxqMV4Axsuv+lnhU=
X-Proofpoint-GUID: FdmYS6idaT49sH4DtR5B9xrfSPTZFoz_
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab42be9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3JiuneIwTK63PGPfPcMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3OCBTYWx0ZWRfX74IeaC3iHt7D
 0BvpJq26u4VxBH6Gc/T6d5KvnpmqitsPKBsHSozLhb1l6jNv3+WlQ0HJLRvOoWo4lHsSRVJ2L4+
 cv4Cx5U31vvSFV+vPMUDiX1T6Y5Qa2BgbHbWTPNHUHJvvgpOTauKkQjvbXrXYMolTYv64E8J60v
 HYE6OCv0naGXYln0t9IHck7l+g5xOJXQ1iLdlJIwHRYjHmjBEiPGi2S+B3O+uicUDGOpWCnwH/U
 791HNFLW64gt+/0s6tj+2+vPDiIjBbaOAlyf2pcYVH9bKykPkeU1cxz3LOeqd+/JghsakphB4cE
 2H6JO2mBdx2al5lX5dUiSnI/5pLmTA5IAq1G/tib8x4M6DUtUs6heJ3zq8pXoQN2K/jDHIo6pM8
 4wKpD6wSNCb8mqUXjLBOnqCgxGZOQP2lZSY49Y5nnk3ea2snJf80ttYCSG7QjRT6+/SKJ114Q0t
 G0zXsyVrHp/mxc7BHwQ==
X-Proofpoint-ORIG-GUID: FdmYS6idaT49sH4DtR5B9xrfSPTZFoz_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230078

Hi all,

On 23-Sep-26 21:07, johannes.goede@oss.qualcomm.com wrote:
> Hi all,
> 
> On 22-Sep-26 20:18, Daniel Lezcano wrote:
>> Add the thermal zones for the ThinkPad T14s and describe the board
>> temperature sensors exposed through the PMK8550 VADC.
>>
>> The keyboard area is the main thermal constraint under sustained CPU
>> load. Add a passive thermal zone for it and progressively throttle the
>> three CPU groups as the temperature approaches the 53°C limit. The
>> groups are activated at 49°C, 51°C and 53°C respectively, with a
>> 1000 m°C hysteresis and a 500 ms passive polling interval.
>>
>> The cooling maps limit each CPU cooling device to state 6, which
>> corresponds to approximately 1.9 GHz. Testing showed that the system can
>> sustain the workload with all three CPU clusters capped at this
>> frequency while maintaining the expected performance, making it a
>> suitable upper cooling state for thermal regulation.
>>
>> Several configurations were evaluated while tuning the keyboard zone.
>> Using a single 53°C trip for all CPUs allowed the temperature to rise
>> quickly but resulted in a stable operating point around 54.3°C, about
>> 1.3°C above the intended limit. Introducing staged cooling before the
>> target significantly reduced the thermal overshoot. A 49/51/53°C
>> configuration kept the steady-state temperature close to 53°C, while a
>> later 49.5/51.5/53°C configuration improved the heating response but
>> shifted the equilibrium slightly above the target. Based on these
>> results, keep the earlier 49/51/53°C staging.
>>
>> Also add a passive back-cover thermal zone which uses the GPU as a
>> cooling device at 64°C, together with a 73°C critical shutdown trip.
>>
>> Describe the remaining SMB, SDX, east and west board temperature
>> sensors as monitoring-only thermal zones, and enable ADC thermal
>> monitoring on the corresponding PMK8550 VADC channels.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 142 ++++++++++++++++++
>>  1 file changed, 142 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> index 5cc6a63d1ef6..9407868864ad 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> 
> I just noticed that you're adding the thermal-zones here.
> 
> This should go to x1e78100-lenovo-thinkpad-t14s.dtsi note
> the extra 'i' at the end, so that the thermal-zones will
> also be used on the oled model.

And when building with this patch I get a bunch of DTC warnings
that the pmk8550_vadc node is missing a:

	#thermal-sensor-cells = <1>;

line.

Interestingly enough this line is there in pmk8550.dtsi and
parts of hamoa-pmics.dtsi seems to just be duplication of
pmk8550.dtsi, which we really should fix.

Regards,
 
Hans




>> @@ -10,6 +10,117 @@ / {
>>  	compatible = "lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
>>  		     "qcom,x1e78100", "qcom,x1e80100";
>>  
>> +	thermal-zones {
>> +		soc-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
>> +		};
>> +
>> +		keyboard-thermal {
>> +			critical-action = "shutdown";
>> +			polling-delay-passive = <500>;
>> +
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
>> +
>> +			trips {
>> +
>> +				keyboard_alert0: trip-point0 {
>> +					temperature = <49000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				keyboard_alert1: trip-point1 {
>> +					temperature = <51000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				keyboard_alert2: trip-point2 {
>> +					temperature = <53000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				keyboard-critical {
>> +					temperature = <73000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
>> +			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&keyboard_alert0>;
>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu1 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu2 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu3 THERMAL_NO_LIMIT 6>;
>> +				};
>> +
>> +				map1 {
>> +					trip = <&keyboard_alert1>;
>> +					cooling-device = <&cpu4 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu5 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu6 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu7 THERMAL_NO_LIMIT 6>;
>> +				};
>> +
>> +				map2 {
>> +					trip = <&keyboard_alert2>;
>> +					cooling-device = <&cpu8 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu9 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu10 THERMAL_NO_LIMIT 6>,
>> +							 <&cpu11 THERMAL_NO_LIMIT 6>;
>> +
>> +				};
>> +			};
>> +		};
>> +
>> +		backcover-thermal {
>> +			critical-action = "shutdown";
>> +			polling-delay-passive = <400>;
>> +
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
>> +
>> +			trips {
>> +				backcover_alert0: trip-point0 {
>> +					temperature = <64000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				backcover-critical {
>> +					temperature = <73000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
>> +			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&backcover_alert0>;
>> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>> +		};
>> +
>> +		smb-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
>> +		};
>> +
>> +		sdx-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
>> +		};
>> +
>> +		east-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
>> +		};
>> +
>> +		west-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
>> +		};
>> +	};
>> +
>>  	backlight: backlight {
>>  		compatible = "pwm-backlight";
>>  		pwms = <&pmk8550_pwm 0 4266537>;
>> @@ -35,6 +146,7 @@ vreg_edp_bl: regulator-edp-bl {
>>  
>>  		regulator-boot-on;
>>  	};
>> +
>>  };
>>  
>>  &panel {
>> @@ -58,3 +170,33 @@ edp_bl_pwm: edp-bl-pwm-state {
>>  &pmk8550_pwm {
>>  	status = "okay";
>>  };
>> +
>> +&pmk8550_vadc {
>> +	channel@144 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@145 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@146 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@147 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@148 {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@14a {
>> +		qcom,adc-tm;
>> +	};
>> +
>> +	channel@14b {
>> +		qcom,adc-tm;
>> +	};
>> +};
> 

