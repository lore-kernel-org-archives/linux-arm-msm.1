Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9187C34D38B
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556978; cv=none; b=IDxqJnXoiWj6rqrSx2U6epogvTv+cOR8YmEH2ff/4JL2zf1hyq+pXjsVSTNGmolLctBrmG3phsyT+1VpllLW+fc7nyoHfrLRMpKlprLGJaQUv46YV0ji6CkLQRcrq1duQWpXp4jHZmbGRCC2jdh1v+Td0N4ldp3o6y4mjdkVTHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556978; c=relaxed/simple;
	bh=EhoK13uA39G3ZuIb06rgLWCH3a/KsBMSOLhqyqFMQLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRUQUxyw/JbC58C8TH5RS4GhRrLqTNoXqAp6MF0wtT9KewmPK6Za8jnSKqEfn9xaww4etklIvObOHAKgDpOMhhdAMASmc/ht64MsZZ/86OaVSR3luH1WhkW82nPTzdSq44fPECgZ/I6wYxpbG3z3gQau7sCpy494YJrrkT2Ny3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpN4F/4b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9/3FU2R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpN4F/4b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9/3FU2R"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7Bgqr1815876
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/HFgwOqoZ7o1jkI9QMG7q1TX+N05gvQwsyKdJjOXAo=; b=DpN4F/4byQsRuk1Q
	hrDd2DF8hwNoqirBamPvKZSY5K8NMKtSq63sflI8h7kMMYE8gxGamPeTD9576Whq
	UYtsvHO9klOiZZTBTjZqN3/ABhyE+jPTrQ4j7Qh3LC5WmoNAzNtg0AtrSm8z/w8O
	IOmLgkAZ6S7gdtR9UMWQVOMTPECkLtaKIfd4BaOWCNcuXJxbwN0npVJw05LCjhiF
	fss9kaUdL3piT9etvAFRIviF0i+NHRx9kK+o/64QbUmG5PKSwZ4Ke8DvArgqMvdV
	Hdbtzsco+pZ0s/BvCemjqWkCnT/kp/Zs2Zn/XsD2fgEPtmo5mySClTNWyqDYGdOI
	wdwNyg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtg2te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:36:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848d21bbb55so4946180b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787556971; x=1788161771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/HFgwOqoZ7o1jkI9QMG7q1TX+N05gvQwsyKdJjOXAo=;
        b=W9/3FU2RQUN/KrgqkUCQFoAQH1dU+PabmzsdT9j9xUto90SIeiPg+np9sVdWLL2Odl
         uT8biySvw1s+FuZG4EkLrDyiGuHa3JIxi6xBjPJE9wdlyQiAfQwGxJFOpD6hNicDxlkt
         mJDtjkcjUf7aPoqTaMZatGYYmw80V/dxT79gkXMIvnJWXkTOY7Jg6X2gC1knVsMiP8rh
         MjqS8sl/Yu4p1FOQVYCwGGC+q7HMn+pH1vvRvd5vcortj4I7zYoersg0Jr9+3Y7rUAy6
         mYNYWVUv2/1fMuJNfH3pt1aaaX3SA5JR8eoHkVguTHB9SgYvcIHg/NFhXK0zrcbdaQsE
         XBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556971; x=1788161771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/HFgwOqoZ7o1jkI9QMG7q1TX+N05gvQwsyKdJjOXAo=;
        b=piACpA2Jqm6Ir4SLkhLgEodrZQImfoA1LknggJrGUFetixM7tBU3iGTpm4RLYDAqm0
         WNZYISNu1W0bS+VsGfUdr1FHni164KpfkDPhsN5xyKjuEdAmZfIr1hVRaL36f7AxH39p
         +BOGIInHaTKYftryqYvsWoLGSiq0lAVqnifbNBuM6RKIHrpT3cz7X+GchMCISsTLnv50
         Y5nCQu4BT2XFudTWMdYv3Az3Dhk92rf9j20q6G4dIEoTCrCuJx5Ru+rVcD6xEra5g8Y6
         QA1fTdbbNkaczrnUhQBi8FJSVtqAzV2kmQLIgvUq9TngpdKUuJ/ADj8d2jeTPZqFJA2Y
         RH4w==
X-Gm-Message-State: AFuF++n3e+s8BWVyBohtrD6ddMtYuERVAQXip2IQgoFbEJja0uHGH+5E
	F+lRjnM/xdG/JO8f/qJ+7YG24vHnB/+9g2cu0CjrC5lwzRuBbm0yv8EgsGaq0vCHew/HcTkDKQa
	J6TAP6nnHrh0LBZbU3IZ4waRLLaewmo5NBHvBkqeD+C/sn42h8sBAX6TONr071+0Y4SOi
X-Gm-Gg: AR+sD10cSxp0OxYwanQu3okSHLRCQNdcbeXxcdEESf00Yq7NevvAwFAvWuntjrfc3J5
	GMafQlxhgFY4hOui5pRgyw6PtexbF4t6wo5tKjq+xv6uC8xl/RRsSpANaPORzJDyarNVUCShGsn
	6+FT1LNHSlI3j4G7dCLQdiueu6liX2kC405RuGlT0RyVRZ5R69dHN8B/sl5Yl/pu7mhktBlqlzx
	4VReMAwLO33RXFAzVZzlkxbG3W/s90tlRivALciKIeDpKFS3cGe1ctb9+eYBaF1hlAqPjFon/50
	EhkIWzrMEOygVnFj7ryXEPgK4Z7IZbzmnaG/DpkMTMT2PxlOqztZQrdZVC7Cpj6BjVDD/C/qGh4
	vz+KYKp3DNd0DXGWTpUa4wbgUsYs=
X-Received: by 2002:a05:6a00:ab86:b0:851:8baf:5b26 with SMTP id d2e1a72fcca58-851fa040526mr44114341b3a.14.1787556970934;
        Mon, 24 Aug 2026 00:36:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab86:b0:851:8baf:5b26 with SMTP id d2e1a72fcca58-851fa040526mr44114284b3a.14.1787556970590;
        Mon, 24 Aug 2026 00:36:10 -0700 (PDT)
Received: from [10.218.46.60] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f149ef3sm1670216b3a.41.2026.08.24.00.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:36:10 -0700 (PDT)
Message-ID: <a6915b60-07ad-49c1-9c44-ab0e07b8926b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 13:06:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: pm8005: Add pmic cooling maps
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gaurav.kohli@oss.qualcomm.com
References: <20260810-shikra-pmic-die-v1-1-b4ba21f254a0@oss.qualcomm.com>
 <f5333c12-7f4e-4a4d-98a1-74d216f6febb@oss.qualcomm.com>
Content-Language: en-US
From: "Dipa Ramesh Mantre (Temp)" <dipa.mantre@oss.qualcomm.com>
In-Reply-To: <f5333c12-7f4e-4a4d-98a1-74d216f6febb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfXz9Vkrf8NDTtx
 zZySP41fNxqgnYlT6+hHV18QIvHjypUYU1/DGjiXJltFgafARYr1uCll49aCjp2coUAKpl+DbQx
 LRoUJuUH/G/yI5t5lnL9ENNzb+MTr1qxeO1H3P0OYT5K4u1DXI2VnOW5kJiFawYkCY5xX6Pm7Gz
 f741YgzrucmETh2aZtcuchC1rplLpMBW2mvgRwhdMcfURqeUntO/vU/ZmXwX8V8MfqGMDmqKexE
 aBSX7FqTsL0klAzG5JWTSnX4T5caluOqV0wtjPOSD5o0QGDAeECiQYNTj2zd30gYDXh94aVyZ7P
 DZmo8PL1cmj4PkD721MOJeCjpPvi9Si2nkLg4DX2en+Tcen5s/3wdRRkBMMdnxwx2Vaxsuyaded
 w7V7P7R/XYZdg3DBjs4oS/HbDVP6iqqI4bPXaiaSYsumFom/S7EImq+rXLxMcoQVSm2U0q1IxJI
 nexamea6ricYTH8R44g==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8bf470 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sarD9kAI3zSQ9mHdOswA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfX6wMifQ0yIOPz
 OKfQX5y2DJs5y9gu640x801mX3DohGx1TXnwetjrB+AX2ehkY14hG6o2SRKMoow31UAEqEhbQgj
 amx1p2a0u4Dd3s5AksB6KfW7YfzCBWU=
X-Proofpoint-GUID: I2591rolvGrPSYZL0xzbF0auOr6LdsjZ
X-Proofpoint-ORIG-GUID: I2591rolvGrPSYZL0xzbF0auOr6LdsjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240065



On 8/18/2026 2:49 PM, Konrad Dybcio wrote:
> On 8/10/26 7:13 AM, Dipa Ramesh Mantre wrote:
>> Add CPU mitigation cooling maps for pm8005 PMIC die temperature.
>> Throttle LITTLE (cpu0) and big (cpu3) clusters at 105°C and 125°C
>> trip points.
>>
>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>> ---
> 
> You're making changes to a shared file with the intent of altering the
> behavior of a specific platform. Furthermore, you don't explain how
> the CPU frequency correlates to the temperature of the PMIC die, leaving
> that to the imagination of the reader.

Thanks for the comment, will fix this and update the reasoning in the 
commit.

> 
> 
> FYI:
> 
> $ rg pm8005.dtsi arch -l | sort
> arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
> arch/arm64/boot/dts/qcom/msm8998-mtp.dts
> arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> 
> Konrad

-- 
Thanks & Regards
Dipa Mantre

