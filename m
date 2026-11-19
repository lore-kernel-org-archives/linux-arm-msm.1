Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068082;
	b=2//+teKqxHmxqtKMdFBmBfP1DatHInUZVHBMSmWq1XA0SBvWkoI+naXZ4zaVMbAKgcS2
	 L+xxAxb3OL7pS++KlQnrohhT7NRgucJ0guSFdQIcUAA4jJGkAokxP217IVxP5fZOCXqM7
	 o81cnvEwiLTdSFHv9krvqiGj5EaK8sfOzy1K9tPdtOGOLeW9oXCGVhNZ8hTgglHQ7bRqw
	 2dnbTICrZzucObD36XxWrVqE0h2IkoEOaVMMQZU9o/wVKDZZqynWG4gXnHgUM066YqQAB
	 odtHIDB1LQinprBrzgnaVrYHsAuH0HiaD061G07ivjoMgly+QDV7MX4V0UH0W+V4f+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b9mdqELT8bp82DtRWB4zY8YxriAXXRD64qNezeQDtBo=;
	b=zId8fYQRYUwOf/xGlryp/W/07WCQf5ryv6j/RA/1/eyxswXGXflcN2mrdP9+/yGnhiqz
	 F9Ko86smi1wb8+dkFDWo3F6qm1buS+PQInUR81c6y8WkE+TGtp2S5aeJ1Qg2vrBRSUuwp
	 vBvj8WB+dXI81MulSEAzdopApH8KAjcFk7y/5bwp3YR0uYnQpWD5Bqe/X7lvwOYNfWfvB
	 KBRsfk+mpGFxLIDdBdWmVj8n9cRgEBd4MwOLbztXVlmw1H0jpXbalGqrLtmOFUACBo6mg
	 YuPmIUEQuSyzwS3g8sjuVNid/kT4gNS0lPS+/kKoFPYDqKFZMmRUykK8BrxKCHjE0dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItsvAUcb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JcGs5qSv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2963E606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 06:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2963E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItsvAUcb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JcGs5qSv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B8cO786430
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 06:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9mdqELT8bp82DtRWB4zY8YxriAXXRD64qNezeQDtBo=; b=ItsvAUcbehLOueLx
	NtDMkFGbr/KYQmliLkfvFRLaLtBhrkU/FvjIXJ8ohurN2X+7W1w+GwLh9ATf4TL5
	T2zXtbHJA6iYE1WKRi58TJP7/oDvwrXJfcXRyZDJ2R90QEiXS8fzUd/fwxtzJ27q
	DcvKtlkQL3845fJIEsSH0gzTrxn3MoOwQC1cCBk2zSmkeCYZbktQ0kpf2Xi4lWZ1
	/4tZB3PjbBIs7t3gtdum6Ixu37ZyRY/E0rWpksPplcn6tSKOMnmIQI5QJ6du7dut
	uuoHoeBH1kkgpBlPh+r3yWi8YAYZxskK0yYv3T+4RCHvP6m4N2MkC2r4haWUHI9G
	8bi8Rg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcbje2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 06:01:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9501034c4so22791355ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 22:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795068080; x=1795672880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b9mdqELT8bp82DtRWB4zY8YxriAXXRD64qNezeQDtBo=;
        b=JcGs5qSvhUwu3CAU3LTgN5yWy5KAeO7xHNJiZTVQR8zQIPF2McQMoOpOnTIV8uHVtq
         JD3HCaN8PFlwF10LQuB7szZIJGGdB+Cz45QVWMaDWuYjSsFuYMZ2mFK47m1TNLJmd4gP
         Pk2z6Gmq66+8QzXpwE5IsrE9izyaLNfo0eWXhkbjPgAb5bL6ZdLmyAyzywAF0yZs9px+
         WiyEi2Krx7Vc64IzUAzg+IBPFUfh18maR/WATkjToeAMejunQT3sJuUaIwIGDZEzxoue
         EpR21AwQn3n26uH0tDoGxZRzoNAOrQYUI3sTMsQooleccyCv0pSLc71P4GsK8+asmoa2
         g9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795068080; x=1795672880;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9mdqELT8bp82DtRWB4zY8YxriAXXRD64qNezeQDtBo=;
        b=ENY3fFZ43KFXYbDXZHbY4YceRAaaHugWR4S4nxJAxUABKYl3L9UIRgi5gcWFtM3RzR
         1dZ6EGcvrHlpnOzV5rA0hnfjTagvA8n3LE7pX2RliEWuVYEkFk/REkUvmvwte2O6H4rR
         I5s1n5ImKgCX1Ni+Vweibv0wcKsmlxqZcDQ1aMMyi99cgoP7l2QTTZN8gnbroe9H7FRx
         F8Ds7GVW2vt98M5vR0pjMD2pL0eRIqMtxr7+S66le1DG72NqT3n/QqyoFTk8Dedm4QpM
         82evPhS42PKvdcIaJPVzUQ64RAgpXGSDOHwQYSvawoYutEtCSNWxh+YXam74KlIVmJAW
         HXMw==
X-Gm-Message-State: APuU4Z9/aYkt85yi+OLbe6fbae0Qd/EICZ0SE0gwMqDljP/YJ/Gd7FfE
	Vd2Gn78tBhqKlXT9PLyeI4Rx6yXXUx4bYKIiIPZPyYuSER5qmJkjwgYFEhazuftiEWD4TOFC7wi
	SyBrHSIP76/Xb6HfGsMx3qLLTHQuU1sJFi9Gg8c52z/ckgsrM746mo4rNKoV4t62nZOCa
X-Gm-Gg: AZFdTZcJBEpjuRFbiSg5+JKCSF9fsM7lj1pzOr6UqR1tAl2AchUpd7hqHJxRnWG0dZX
	U6arXTXkXUVkb1A5rqRmgaLPtX4g8KVztqgfqQKBeI2OzukwfeP+ZUnBQCiRY2WOKFoVZtMQocV
	FbZ33eXTHMovGgrUdFFH/NMB6ApSWeVqgj8XYsqiikN8Z/slsfms/CeUey81zwuY7/n6aDxSipj
	p0A+2/RApbklr8WYMPPqgLAXwF0m/h+jWmylxcHS4Z0eRmMMgCKEpz1+tSwzd20WdFluc2Diip5
	PmWHzF3gBnpaSAwXOHsd9c7ykNIc/1PKfcOJ7YOGQlUbX5jxqXSx/++VNe0a+0/hWd+K4zb1M0E
	sNPpmxHINvX4B3IddHnVOndgQm6UKwvoucTh0atm38P+hhdNJx1F/J386JKu4nXd/15u2HsbqRy
	dwlHG6qGPeVotIF66GTh9CPwlTzvVVrrjskhCo3IY=
X-Received: by 2002:a17:903:18b:b0:2ef:ee74:792 with SMTP id d9443c01a7336-2eff75395fcmr47398915ad.41.1795068080571;
        Wed, 18 Nov 2026 22:01:20 -0800 (PST)
X-Received: by 2002:a17:903:18b:b0:2ef:ee74:792 with SMTP id d9443c01a7336-2eff75395fcmr47398415ad.41.1795068079912;
        Wed, 18 Nov 2026 22:01:19 -0800 (PST)
Received: from [10.133.33.7] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62db225sm24829555ad.72.2026.11.18.22.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 22:01:19 -0800 (PST)
Message-ID: <e55aef9f-daad-4ca8-adea-27edb4d2f991@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 14:01:15 +0800
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
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
 <20261118-wlan-bt-v1-2-18bb1b059a17@oss.qualcomm.com>
 <9d2bdf05-cfa8-4493-aff3-2d424aaebe77@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <9d2bdf05-cfa8-4493-aff3-2d424aaebe77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afe90b1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tdOc5_MkPlBmSZ2az6cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMyBTYWx0ZWRfX/f0AAkWGl1Gt
 oXEYaXAvJcR1rsRL81yzWvsAAtK6lUT+2HvH5ufrjBwigV/xIwP6zTnooptgf812BxUp4in9+cP
 gtQ3rRYzEsh/CyrOFgiDU47QeZr0vOTGz4+JzbfkS2jo/u3vSof3/Vdw48MRLCEdGu88+jc5YAJ
 eW2OmEPHPa5VzCv1giAMmgZfBDWb6FVXWMU2psV9hn1/NLC8zyXVyQ4Em6DBxnS+Rk6pzTpxNvl
 vNBWjQLG+w4lYjq/uzKSifm7B2ZiTKcZVX3OXSyTBBez4QPDJQyWbk2/tcRRawUlBStb2Lc9USn
 NuQT2I+ojxpXwH2tGsGC+fkxDsau2SBSHQ/kyPcvWelcU8u8/YrTgLTQf79Ur/kBt1dBe7BxVa7
 8ada18PjKdsChtjEVaxybu7MAreCNmXLa2hf1uXdrnD2nZ8zb6nowUc/eI/N4XMLwuOjz79Clh/
 hVVGY3r/LGluJ8qpRXw==
X-Proofpoint-ORIG-GUID: -0GW1-Vxp1pYqdcDUu5hU_qoFCe8BjBs
X-Proofpoint-GUID: -0GW1-Vxp1pYqdcDUu5hU_qoFCe8BjBs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMyBTYWx0ZWRfX9aNezpY3/2uw
 zDzYUi7IAzMXwu+Gtb4YvnouMwY8mIUh5KevrKxW/BbrGkVuk+QFi+xk5SNdggXoJt6RSR41LDF
 NoNH3tmSM5+zTQP0LZqLyvC/KKq9Cmc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190023



On 11/19/2026 1:43 PM, Jingyi Wang wrote:
> 
> 
> On 11/18/2026 11:33 AM, Yijie Yang wrote:
>> Enable WCN785x Bluetooth on Maili MTP board.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/maili-mtp.dts | 35 ++++++++++++++++++++++++ 
>> +++++++++-
>>   1 file changed, 34 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/ 
>> dts/qcom/maili-mtp.dts
>> index a3c2016eb9053..49fccc43c9828 100644
>> --- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> @@ -146,9 +146,10 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
>>       wcn7850-pmu {
>>           compatible = "qcom,wcn7850-pmu";
>> -        pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
>> +        pinctrl-0 = <&bt_default>, <&wlan_en>, <&sw_ctrl_default>;
>>           pinctrl-names = "default";
>> +        bt-enable-gpios = <&pmh0104_c_e0_gpios 6 GPIO_ACTIVE_HIGH>;
>>           wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
>>           vdd-supply = <&vreg_s1j_0p8>;
>> @@ -178,6 +179,10 @@ vreg_pmu_wlmx_0p85: ldo3 {
>>                   regulator-name = "vreg_pmu_wlmx_0p85";
>>               };
>> +            vreg_pmu_btcmx_0p85: ldo4 {
>> +                regulator-name = "vreg_pmu_btcmx_0p85";
>> +            };
>> +
>>               vreg_pmu_rfa_0p8: ldo5 {
>>                   regulator-name = "vreg_pmu_rfa_0p8";
>>               };
>> @@ -872,6 +877,16 @@ led-1 {
>>   };
>>   &pmh0104_c_e0_gpios {
>> +    bt_default: bt-default-state {
>> +        pins = "gpio6";
>> +        function = "normal";
>> +        input-disable;
>> +        output-enable;
>> +        output-low;
>> +        bias-disable;
>> +        power-source = <1>;
>> +    };
>> +
>>       wlan_en: wlan-en-state {
>>           pins = "gpio7";
>>           function = "normal";
>> @@ -996,6 +1011,24 @@ sw_ctrl_default: sw-ctrl-default-state {
>>       };
>>   };
>> +&uart18 {
>> +    status = "okay";
>> +
>> +    bluetooth {
>> +        compatible = "qcom,wcn7850-bt";
>> +
>> +        vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +        vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +        vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +        vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +        vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +        vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +        vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>> +
>> +        max-speed = <3200000>;
>> +    };
>> +};
>> +
> 
> uart7 < uart18

In strict alphabetical order, uart18 should come before uart7.

> 
> Thanks,
> Jingyi
> 
>>   &uart7 {
>>       status = "okay";
>>   };
>>
> 

-- 
Best Regards,
Yijie

