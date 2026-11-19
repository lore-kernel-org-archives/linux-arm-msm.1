Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067908;
	b=GRHXF4msS4qCvOH3G/+eZfSYDvmHEm00ENrSzMWUp0lT72+QV27nXL38QbmeiMaiAHmg
	 NbJCJKBQobTMa1qGrZ0ht0qv8KPnHEQ+2moIVuWN5SnE4mNw/t4+6hSTyZKVhdumXSp2T
	 wJIPT8AufewYhJXWxByIEOzmL2UVUUMbqjUT+owb2N5NE49NEDAXmajYte9CqGQmmypRY
	 dvmJnH/KwX2gvS6YeZi3GvO1eMiLmq9bN5FWf1dOD4VCNCdE9Gw31It1s2qSMAyxEEnCr
	 vhxl8Ah67Tkf9Kn82OJbUX+H4zxHdaL8IgGLkzmNskNIsRMgMcwD4IT/uFG6GbDSnBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Dx7L7Oj/CKYlLYUPcXTj9ZuiLNGSZ8V+l/nQ0y2aXGw=;
	b=saSl81DEW5nRJ4VVpDI4DvA82fOBgMaZac0KwguMkEx6vxtlWXOau/SDG8iDtSmvm47X
	 AiklAVTAYj2xxiRbJ7jkc9fT1s0/W5j9u7q/LY/K9cEUNXiLwN0hAGYSG4tWyj83hfvho
	 LMsRBPFiwc28sB9JZyWzQrokNk+Mtxvi4ktqlpq3V2UjlEVQtlUD5+xPohE7lalLgl+JS
	 L+hmCqNbJ4IE/lL/XgP1pbPoY22gW56YAWdjYJMWFSuNgCi4CUsdVUll/NpCaSHen2Uhl
	 CObN7o3FxZn5AmD4mNEdDAqHwxyUiSWMJlmIRm0ssumqXwni+LhFPXtqcEM8DGxfaEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Py2PM+zp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BFyfg5zh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26445606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26445606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Py2PM+zp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BFyfg5zh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1AtJp3780132
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dx7L7Oj/CKYlLYUPcXTj9ZuiLNGSZ8V+l/nQ0y2aXGw=; b=Py2PM+zp/Hjft41p
	U79BvfEk1++LCNzaJ102mKt1Bs3Z7ygKWAmXPkeW4x5lsGKKV4q4QPJf/w+UhEEV
	w3LkXSgjzlADZDpcMCv3zgRBMGXfPTVhPCPZB53KfWcmBNmxVeG0/j4e2coATCGI
	ufFpnYItdLXIKO9BYV0xhpv/Ifv7x5KthkD8oVl/xSia8KW+UHmM3Ida3UyDbkBr
	xmki1MU1MPVjJ7GvS2D8qVVmGeSMurXu21NjBQm98xzvR47/SY9wcX/bs/MoStJ+
	eJFdvHxBcx9jzlMZkxwWdP4qupWPYqO6wO5paz9SDqZAvAxxl8GtXDySisBs9B4f
	YaSMGQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnjv93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:58:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so1362763b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 21:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795067907; x=1795672707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dx7L7Oj/CKYlLYUPcXTj9ZuiLNGSZ8V+l/nQ0y2aXGw=;
        b=BFyfg5zh3x31IiWltRPPtM0oxACS1PSxHHsaaekK7tb1+khdHBz8I1lXZ8M/O5lakm
         yeA3prH5GukhSUGelssuJ36eM6xets+LSPDwEOE0gtyvwIcqZgFydEeTKA8+ck4DvwX/
         8OcRXcnyK7QJlT22A4YBaggcRziM41JaKNfzP3L729hpJSL3TagdQvccav44ICa6Fw+7
         li51T8pK3mSDMcCFtDHoBjGQXQcC3g5N0uYp+aEry2qxpeLzr/GecJcT2Sst3dkEm9dw
         Vegt7hob9cUa1rHyFumeevVEkCfq8VWyh7whUxyafPL+iy0pTntAM13m228DSv2hxbVH
         8Kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067907; x=1795672707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dx7L7Oj/CKYlLYUPcXTj9ZuiLNGSZ8V+l/nQ0y2aXGw=;
        b=rc/oBA2irw9A+8WlsFnaYZ0ogFsIM1hDgp4w/0qKycAKJ8hKuOjjgVkDvRfWU9Kz0j
         9exch2+jfTmx0sDAVFDl94FAnYz5B8UF69Dr8W+ZG23beoaqYoWy5FvgIcP9JMEiDPSs
         nCEIbCW5VUP/avw/LKVKnbZO48PYg7kQ5Ki0cagwgpYeGFFezRoApjgo/tdPCMvfFdv+
         XV0EJ602bnnKWvwHdSDsk7tzheML9/JVvkVzG49BqHkb1dqTzhISH9vYYOMp719JwkFg
         VUrWwLAT0TdSZmtPbn0y/ZoTQvchqOXOVLIqiPKKyTj4A5Pb/Qdcnt02d7nAZMTF4OdO
         rujw==
X-Gm-Message-State: APuU4Z/QPP7wcLH3PTh2+qNCU94r7Xf1c1mTpkK44vQCZRms6nEYx3Mk
	NOFF36tfgP+7XDUo7gvD7zoxDFXIZPqXMAb53TWr3hlEAhbmU0811iL7/9HiBNSfiKgCm86uUS0
	OsxEk+RotKz5Dvh3wTurvkTqUP1GDrcUdxVZnTx23sSn1DPKmHMZ0J75MyLjdMd2UOkvB91Da7c
	xV
X-Gm-Gg: AYBFou0+cDLAHTG/PYtG0wjhU1b//C24suS9pgKusXkX1PmRFtcz8LTxq4rcdtAtnTN
	Eh1msbBwsE8PG3cnlnjxVUY31Ep3EQcH4fjbcRrNLu1KdpAFw0umEQSALrjEBDL0DJDCYCkHUbj
	mIpMERvcOtgv6u1npNlF7Kyaw5McuG9QNwEjBJriKYk76UiDuMWw8Xo6pWLqWums9bWUGO7zuBB
	N0PnDKDqkazlcer2cyt9BN90Tv4Rmd5UEdzNdmB7+zLDhG9YMBE6pnQ5/d0Kwd3NZVaTRO9XiFo
	gsk/+Q47/ymfLoTOSAYORI+6b+jT6xmhU+AeVhEl/vWDDM2/AtSskiwFDOeirqnFcwZULV4FDW/
	AU//UChdI67QiAhSGGdc/R4XTGWzE+q4GnVCaZ9noFQkfvqONVMiePNDJhPF1fov1Q6RyNZR9Fu
	BOmBc07+3Ugu4WSdl2LMNyqizg3NQ3JSvpGw+MhhQh
X-Received: by 2002:a05:6a00:2d8f:b0:8a0:5d6f:8a5b with SMTP id d2e1a72fcca58-8c5d52a468dmr4737015b3a.50.1795067906677;
        Wed, 18 Nov 2026 21:58:26 -0800 (PST)
X-Received: by 2002:a05:6a00:2d8f:b0:8a0:5d6f:8a5b with SMTP id d2e1a72fcca58-8c5d52a468dmr4736993b3a.50.1795067906222;
        Wed, 18 Nov 2026 21:58:26 -0800 (PST)
Received: from [10.133.33.7] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7e9fb00sm2239320b3a.8.2026.11.18.21.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 21:58:25 -0800 (PST)
Message-ID: <4ed1d809-9b9f-4946-ad8b-50de1740c08f@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:58:21 +0800
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
 <20261118-wlan-bt-v1-1-18bb1b059a17@oss.qualcomm.com>
 <93bbc219-5706-4e3f-87c1-ddeeb8f11df4@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <93bbc219-5706-4e3f-87c1-ddeeb8f11df4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Cb6XIs8jDDRgX-wEJJE8grrO9tB19gA3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMyBTYWx0ZWRfX7Qy02riiBJhJ
 32AvF/kOS3t/3bMMZ/n2RFCA6vOD+s1X4wq4W2jJXoHa38UEPwoaVDIg+1chsOb4EhHDKhJCdCC
 RYb2rmhNZEfb9vntfk1pmjZhqT0KonKyUwtCEprqWKlvvORFAPij8WVNfao82P+MHBysGIwEhps
 bGDu2smBC6VOPj9OPTa6CYy/2hBWxYvfRyBHySuYpTPOYhla5wQRxt86Ol6Ng8LfzQByfw3bFkA
 73Qa2s4K5/SyXsW5NDTc8yMY7qLvDFH3WGMzNMgwW8npQKOOs/5uNZ78B1u9BcLY/uEvBt3tHBH
 wZIZDKRED+gl8FRcom0HXozAsZFzuIaxPipNi9GRIbFQ8ZEPGGm6JzixLzSwqKloTrTJlOZbkkv
 CDEy2ixZqolSEld04h4D3xg+HPEyUSd69dc5xspKVK7Zqfo5otDgt2nELOpq8zquAq5E0v5VvX1
 li7KFD3Sn3lufQRw+jQ==
X-Proofpoint-ORIG-GUID: Cb6XIs8jDDRgX-wEJJE8grrO9tB19gA3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMyBTYWx0ZWRfX8LPbBqfvY9ur
 76n3j5nobc3umj5pdsV9BpC/vsHhG3yNNEe/z8ScWQW2VmX8jdIdxKQuRXOMJcHiGWOLnroFwd3
 TdbPQmG3j4jrMp+fr9gU4cE2GLngWWk=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afe9003 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VmCct7uuAjPhuAz9gQwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190023



On 11/19/2026 1:42 PM, Jingyi Wang wrote:
> 
> 
> On 11/18/2026 11:33 AM, Yijie Yang wrote:
>> Enable WCN785x Wi-Fi on Maili MTP board.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/maili-mtp.dts | 88 ++++++++++++++++++++++++ 
>> ++++++++++
>>   1 file changed, 88 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/ 
>> dts/qcom/maili-mtp.dts
>> index 5409d0a7ec2e0..a3c2016eb9053 100644
>> --- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> @@ -142,6 +142,63 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
>>           vin-supply = <&vreg_bob1>;
>>       };
>> +
>> +    wcn7850-pmu {
>> +        compatible = "qcom,wcn7850-pmu";
>> +
>> +        pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
>> +        pinctrl-names = "default";
>> +
>> +        wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
>> +
>> +        vdd-supply = <&vreg_s1j_0p8>;
>> +        vddio-supply = <&vreg_l2d_1p8>;
>> +        vddio1p2-supply = <&vreg_l4g_1p2>;
>> +        vddaon-supply = <&vreg_s9d_1p0>;
>> +        vdddig-supply = <&vreg_s3c_1p2>;
>> +        vddrfa1p2-supply = <&vreg_s9d_1p0>;
>> +        vddrfa1p8-supply = <&vreg_s7g_1p2>;
>> +
>> +        clocks = <&rpmhcc RPMH_RF_CLK1>;
>> +
>> +        regulators {
>> +            vreg_pmu_rfa_cmn: ldo0 {
>> +                regulator-name = "vreg_pmu_rfa_cmn";
>> +            };
>> +
>> +            vreg_pmu_aon_0p59: ldo1 {
>> +                regulator-name = "vreg_pmu_aon_0p59";
>> +            };
>> +
>> +            vreg_pmu_wlcx_0p8: ldo2 {
>> +                regulator-name = "vreg_pmu_wlcx_0p8";
>> +            };
>> +
>> +            vreg_pmu_wlmx_0p85: ldo3 {
>> +                regulator-name = "vreg_pmu_wlmx_0p85";
>> +            };
>> +
>> +            vreg_pmu_rfa_0p8: ldo5 {
>> +                regulator-name = "vreg_pmu_rfa_0p8";
>> +            };
>> +
>> +            vreg_pmu_rfa_1p2: ldo6 {
>> +                regulator-name = "vreg_pmu_rfa_1p2";
>> +            };
>> +
>> +            vreg_pmu_rfa_1p8: ldo7 {
>> +                regulator-name = "vreg_pmu_rfa_1p8";
>> +            };
>> +
>> +            vreg_pmu_pcie_0p9: ldo8 {
>> +                regulator-name = "vreg_pmu_pcie_0p9";
>> +            };
>> +
>> +            vreg_pmu_pcie_1p8: ldo9 {
>> +                regulator-name = "vreg_pmu_pcie_1p8";
>> +            };
>> +        };
>> +    };
>>   };
>>   &apps_rsc {
>> @@ -757,6 +814,21 @@ &pcie0_phy {
>>   &pcie_port0 {
>>       wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
>>       reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
>> +
>> +    wifi@0 {
>> +        compatible = "pci17cb,1107";
>> +        reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +
>> +        vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +        vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +        vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +        vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +        vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +        vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +        vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>> +        vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> +        vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> +    };
>>   };
>>   &pcie1 {
>> @@ -800,6 +872,16 @@ led-1 {
>>   };
>>   &pmh0104_c_e0_gpios {
>> +    wlan_en: wlan-en-state {
>> +        pins = "gpio7";
>> +        function = "normal";
>> +        input-disable;
>> +        output-enable;
>> +        output-low;
>> +        bias-disable;
>> +        power-source = <1>;
>> +    };
>> +
> 
> s < w

Will reorder.

> 
> Thanks,
> Jingyi
> 
>>       sd_card_eldo_en: sd-card-eldo-en-state {
>>           pins = "gpio5";
>>           function = "normal";
>> @@ -906,6 +988,12 @@ &tlmm {
>>                      <119 2>,    /* SoCCP */
>>                      <144 2>,    /* CXM UART */
>>                      <211 1>; /* NFC Secure IO */
>> +
>> +    sw_ctrl_default: sw-ctrl-default-state {
>> +        pins = "gpio18";
>> +        function = "gpio";
>> +        bias-pull-down;
>> +    };
>>   };
>>   &uart7 {
>>
> 

-- 
Best Regards,
Yijie

