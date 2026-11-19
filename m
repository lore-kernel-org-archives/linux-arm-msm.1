Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067010;
	b=TM/e4LT3x3lKtWvJ6wCj2azI8t+6lQRb66cI+vTr+U0wva7Rzx0aX1aCqVF3KT9gYHbm
	 eZuuvBOuYNKc0OnWMJJJPqXjjslS96xKxm26VxYUdg32RlTFf0CnIqT45jtNNryxqzUDi
	 kqRh5wwJX2KGraCm7NVvd4dKGwIbCMwL4QWtX7RcF7dmDhn47sVQM7GgvqEa+3qebjn+P
	 qWeqe71NYWs2y0CD2YRYLgmbwmGm37lZ8SGvvtppGZdSEFSprh/qpkZfYtFQDGATtIFYq
	 VBPVkdLxdCgfqPLSTue02HDTWIcInIjbMmXY3n4uYa+ci9g+2LVCaMHERITuE+YFRdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9ZgfSyHaB36piesAdmGG0WUOo06mxWQMWE35oHKOsDo=;
	b=oidtzOzh04xKIzBGiNFS3BvkpfZ6YB224sru4uP7Ux9dJi+dNegGUEhFhDie+5GyKPei
	 oXVv3wP7Qi5Jn6npsfDm5rgZQMcWjCqt8CcGdzOkv0pZP79+cGW+YmilIezFXvGfeSqM/
	 vI1tk7uiFe8sFpEjLvx02gd/FBEQMxd0lvomUIx3NgjTBL+J55TF4b2voWRunebiy9H4Z
	 m/UithgR7YoTzwBPjCe+h5FgLVY7aEQrMqXHPntoQHRZfwn3tfuCNAzPr8h7bGwAYFe9v
	 d+ZxtK2NOQKXxrbC3MFV3qBoYc4E8845DpkrVG4gJdzKU6/zVd8XFQ8icWaame+xDZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AE0W6r2+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DdAU9vwF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F11C606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F11C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AE0W6r2+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DdAU9vwF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1AuRs1927761
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZgfSyHaB36piesAdmGG0WUOo06mxWQMWE35oHKOsDo=; b=AE0W6r2+ELs8FiQL
	ZgE41vGtWzAT9iFkFlY/MI0sT33f8JFKpmq+kP0j/UapL+bLUcjNtaYVb1hhbiIu
	GA2/bGqHsIctN2OnEGaheJSoor6W1a1wfJbfyyKx4342Iqd77JxdIQLtzxcNOydN
	giACQPCfMHThDQYfYQ+8GuztP6QlDItv+BBGDLu75tCIb1uPELVj3kFNhu6SXt7b
	MhFNWOqXIWPhGieHm3F69Kmc/Fk/3+jr8EVoRO8/wgwq0FYRLbRxrxN4TF6+rlPD
	PhrPp8ZALYmEE/UM+EwVBXp7z4x3YGsoZzPbJOWiXtM8yUMbV56lURzVtxTX3y/r
	hmDCRQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p2sv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:43:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so2458701a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 21:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795067008; x=1795671808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZgfSyHaB36piesAdmGG0WUOo06mxWQMWE35oHKOsDo=;
        b=DdAU9vwFwEXYhq1TngwK3lEQ0cmHMGBu6+u7WI9NwAjItb8TymxjHCLGlJ/0LbvrdB
         OpMjIVbpflf3Fj9GuzIgXo5lL9Iob5HOYLI+o02Zmgs8gOvTYEuSB6xrpFx8FNG0kdRz
         Weke3Icy+P3J8IYLNjrFO6dQuilB8uP91oqvDVK73106G0RKord9J5WJy0Urj7o1FgU8
         /5bq36e9wev2j9x0lhesO34sDbbzk6EUbd+mReQGu3/4eIMmDuVgnT+3d7PMiqAv49Ii
         Beq2w7yObjIWcYX0d7WYwd4yzYmBspfY3r2AWDHoQ7p51CQd3ZlTSdmTfNmqGUsSIt2g
         36NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067008; x=1795671808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZgfSyHaB36piesAdmGG0WUOo06mxWQMWE35oHKOsDo=;
        b=h2j7l77wBP5F/0HyJkHdB7ae00cWM3uSKCTKc7a6f2RC0S7Cv4hI2KQM2Zbch9VLAz
         ZsBXXLl6SGVPwAR5u7oibwlxSY3mbtIyhlYKx29Hn79diKqVpT/zW7ezyTYwyx9mlkf0
         zHNgHLdkwS4jDUCM9Oe1XaBAan/hTqCLVH4ZAjzV+IgahDowVoz6+kHm88L2URPnSz7m
         5EuxmQeIhW4HWHrh+ID1rVzyCJNhSocntm7Xsh4FPdbruGuWMUf51uAv6Cb9R4sT6bQJ
         TENjdvggpPA71v35RpxhjdVmPzJyoxoy0BeB7qkUM7/Qrg0S1qKZK/4sbGukGpkHwq5q
         I0RQ==
X-Gm-Message-State: APuU4Z8VwlQqcyMnUybMKusRqHJZlE9fpkcgB7cnxR/NztFs0bCtKmRJ
	uPy8Z3CR5bTCoaGMe5/mzErpwposeYdLSeOEA1Bg9UzvHgwwnFCjXayWn92TWqxOtBBPLgxztNQ
	lx4Je40gVGYrhABe78Pa7bAzvkYsiWm6L81RmgRnDUchqmehCrAPyLC4yu9MjmsAOJHXr
X-Gm-Gg: AZFdTZdJNdis2q4+XfhL/jE3J2DHyGrLP5wixbTKW+Ml+Byrd/wFwlv+YVNeiHdBEKC
	o32VJ8Ow9KYgcC27Dhu0D2s8DSg8QyfMyN1EqX4vRv6jedW9E5ZU3KPEMVjkTFGfogmAYckrgxV
	X5AE44ifQwyFvXJZB9r1eWw00SF/31GVJaEYiIeqPJkjQIciyjwmSbE+ODWZjLDlGcN9vPYJeui
	Cl4NIXN2F3y6A6R6kc7NQIFFDmc2gBYPOCdAJxeSdrNAQ0cBpuzCd2I9823preCNThrIqzKEkGM
	79AHVfmIyRtv4LWc03h73WS2yRBB4opPPsGBpnonxZ3VTGHzliKvyk499VN7MBENJ/ZsV8DT53Y
	ElBsTf/FDiR/KA3RMKZk3lkugpX2shmxliKOMH6lBojfgRq3mfnCURE4IhvxKpMR3Cr/AixqcYm
	WL3b7dnyU5D9bipp9KsQTPrak6Fp/d48D8Cz6rY4uxyQ==
X-Received: by 2002:a17:90b:4fc5:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3b3d06417c7mr4902395a91.2.1795067007472;
        Wed, 18 Nov 2026 21:43:27 -0800 (PST)
X-Received: by 2002:a17:90b:4fc5:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3b3d06417c7mr4902369a91.2.1795067006951;
        Wed, 18 Nov 2026 21:43:26 -0800 (PST)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62a9d47sm24455345ad.69.2026.11.18.21.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 21:43:26 -0800 (PST)
Message-ID: <9d2bdf05-cfa8-4493-aff3-2d424aaebe77@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:43:23 +0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: maili-mtp: Add WCN7850 Bluetooth
 support
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
 <20261118-wlan-bt-v1-2-18bb1b059a17@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20261118-wlan-bt-v1-2-18bb1b059a17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kQwTcUKW5y0qzLw7X9_3h7M5zzZhu5JK
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afe8c80 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4Dt020n5HOJ40EmIzQMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfXxBJvA4dhQvxN
 D1wnVfDDZ2HINfhoT9CRAtKbzGYi+l1txgwi+NFnMYYUW/4ggNUFE0anSbHGJrGt27NatDskeJo
 +ULMurH57XSAJWa0O8W/BM7GZ6a9NDN1bznyYEjwX6eSTrWvlzWp5xtQdnTmrk1tkOBsF0LN7TR
 kUyQ8zEbIDpYuIpE4uy5LigJXEIUf8PUjt9HKAcCf1uyRA7vkHeWABXVfYObglcwPXHVAFCdCkR
 QXp7ueI/xoxrOESvFYnM3BxZFHiwIGs6uEBEczj+sgEvbOrQsbbTacpfpRhyYA+U8N75FnJxDNn
 zLoQGchhjw59T/2RRLiROvWtQJh/vL0AqfJ7y64YKuUmJ6HuH3/XwbdTkRFlBkY5KeloAuZ7UVe
 VdHX5JdBpwHY6E0REECIleisouGBzXTHaD5o4gDRPhXIToMXJYDju+Ie7EXjJBMGWU1LCT2vpgv
 XmJqG6OHJaXrcWm2ojg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfX9Pf260WuLKdM
 NlNPM8R09W7b+pig25yN8D03MqNDHCCt/JAv7u4TUXB/iBmjrrQsC1oV96RvXncOVKM1SkxDMa8
 uv6xbg9S7mKYm9cVVrpvW/l7yAxfr6c=
X-Proofpoint-GUID: kQwTcUKW5y0qzLw7X9_3h7M5zzZhu5JK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190022



On 11/18/2026 11:33 AM, Yijie Yang wrote:
> Enable WCN785x Bluetooth on Maili MTP board.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/maili-mtp.dts | 35 +++++++++++++++++++++++++++++++++-
>   1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
> index a3c2016eb9053..49fccc43c9828 100644
> --- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
> @@ -146,9 +146,10 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
>   	wcn7850-pmu {
>   		compatible = "qcom,wcn7850-pmu";
>   
> -		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
> +		pinctrl-0 = <&bt_default>, <&wlan_en>, <&sw_ctrl_default>;
>   		pinctrl-names = "default";
>   
> +		bt-enable-gpios = <&pmh0104_c_e0_gpios 6 GPIO_ACTIVE_HIGH>;
>   		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
>   
>   		vdd-supply = <&vreg_s1j_0p8>;
> @@ -178,6 +179,10 @@ vreg_pmu_wlmx_0p85: ldo3 {
>   				regulator-name = "vreg_pmu_wlmx_0p85";
>   			};
>   
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
>   			vreg_pmu_rfa_0p8: ldo5 {
>   				regulator-name = "vreg_pmu_rfa_0p8";
>   			};
> @@ -872,6 +877,16 @@ led-1 {
>   };
>   
>   &pmh0104_c_e0_gpios {
> +	bt_default: bt-default-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		input-disable;
> +		output-enable;
> +		output-low;
> +		bias-disable;
> +		power-source = <1>;
> +	};
> +
>   	wlan_en: wlan-en-state {
>   		pins = "gpio7";
>   		function = "normal";
> @@ -996,6 +1011,24 @@ sw_ctrl_default: sw-ctrl-default-state {
>   	};
>   };
>   
> +&uart18 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +
> +		max-speed = <3200000>;
> +	};
> +};
> +

uart7 < uart18

Thanks,
Jingyi

>   &uart7 {
>   	status = "okay";
>   };
> 

