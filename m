Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5654C37F742
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989481; cv=none; b=G0kEWO8VpIiUMoUKIFv8iw6FKgzfJ1iFgTPAB8bNdqktP+B5T+IBJk+0sF7YQqunEjHemUCeNTYnVG1NQBq96irHobb60rz1o0z82QF5sI9r1P78ZYPPj+2flPOdUa+wJ55c6I4IZb77TpwpmKPQqQixP+UF/yX/uRRUHo9F05Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989481; c=relaxed/simple;
	bh=r7EI2AFQ34jkhyTMFRLVSSUi6/MbKTiuSV0l5tRZJvw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TqF5ctVmv04+6Gbof+4vJxujfhYN+GsVt27f/81UA0fdvG5oSHgxB1Bn87e9/rO/tQqFKLDqRJCOxGIA7t8TBprU6lao0qXCq0ToDK7LUq7PylHAueQ/kIddnmulLhTqvt5wOOjq4TZfoGx88OTZDmuPRGSJjhK/j66gtHYQt5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUenlRIe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcqgE3Lv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUenlRIe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kcqgE3Lv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb8Qj1013328
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hVVSzhTW9kumvXgJOiyqLMgcROQBkpfkvWgSjEtJ+pI=; b=cUenlRIeEQLSQbyj
	HEKF+03vpc6tbtmn4xZhMHrLhT3rEI2/2G4/TW3n58F0FlI5/fSH2B4ClvNB7l0/
	gTE7SgxB/PKUPSq3RAoTG+yafwWJNdzuUHDRYopCxTkMsKakSYD7ecVeXJG6Tu48
	WRUZl/2UAXW4BFuquJkRF9GBEt4BOK5P4zlRIjTFgg1TkBhTV0j1Mzsux5LAdgAq
	kO4P2w9G0cpwja9iLSrcaQDsQXr4GuscOpPelm6GJI7dS0mV6gfb9MqcvyU2rVnL
	ozmHmk9D9fWZC1ppRfaOly/Tb40wfg/B2uu6cq+iCTcEHONKwnxleV8vu94bhBQ/
	FbNpsQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cs118-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:51:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbacbb996so682977985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791989479; x=1792594279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVVSzhTW9kumvXgJOiyqLMgcROQBkpfkvWgSjEtJ+pI=;
        b=kcqgE3Lvy8RUBkqfTInXzigHPkyrHYrcSCF18uL9gdmbhhU+TP4P7qnmfmWt+pFfy3
         ps/yPa0BKtAp2PCbej2su4A/+dOIT0nmAZEYvR4Qe1yQtg7EsXVlm2ou9zIvi9+zfS19
         ChBFo2pg7XxfH02RcaytFQFsDKQnSGAF6ZVjY+m+kse4Ma3Lu79e/EZCUupnwxGov9zs
         Aun5y1JreTszQjrNgfAQDtZ/Rg4L8OI2yx0FZPIJurfq+QJcZx/9K+CQVkpSLQUKTqoN
         CPqh1e97d/0YTH1tvNADzWKAB2OLth8VG0455J/gKh7q8PxOz1OKQcm+f6m74RgazUxv
         3JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989479; x=1792594279;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVVSzhTW9kumvXgJOiyqLMgcROQBkpfkvWgSjEtJ+pI=;
        b=WHWBEktIS2pkQ9fbl1N0GTJYW73OUXyKGad3CV/C0j+aMizpZdZBYBEBDoNDzMShze
         70+4oaZc2ELATMcj0VECTiM0IfFdy9KQ5eZKewx4/XH6Sz41osrAChtBGYQJ3CTrlaKq
         d/gOjWQPnda9M56zX1iex06l1tLfwMVRTpTYRNhayyNKhrXzQqSxfQACCNjIe+IQjNXH
         HqwfgJ6MMdu4V/pJM6s6YXSJlU6G8SG5UW2BNrg9/5twZOgQ1/fehedDeHwdWHrGRaM1
         488XVjHM/WfgrpdwWsnRe+BLLdyThkNpZbhqSbQemezhPV3ydaxJdv+iGYEqKJ6awcFv
         hFqg==
X-Forwarded-Encrypted: i=1; AKwUvBw2IIDNnR8wxtFoRx8OBrieJNZjhxgg+cDZ/DogoJDGttSPamYj32QqiNM01mlOwvvfOGbrW57zwxQXSVWM@vger.kernel.org
X-Gm-Message-State: AFq9FYIlJQVmrT8tTb56ZdJSbiCCFT2xT5so/uzIt9YsdpaTogvuMGQI
	IPDg5YR2RbzIJ0yA0imirTl1ZAh9xjTr9gKpr+lRjvVLRqhvyE3r0XQm2Ct6LM9OtuzXCn0VaPq
	PV4mtqXTTek6NuNytB4VEvlbkvGET6b/v77rV7ORHla7vTRUTJpYJzvbkjKmQ1+dtCuKp
X-Gm-Gg: AYBFou0GtK4/d1538oPkoANx8Ct89ESqTXctPc3I2uqbfG0VpwCWLO+yLu/LLi/H1xg
	jttKJf4yBhVWKSdNTWpjfFfjqyd3OBvOH1CMLufudnHiRfu8VRW/vnudavrrJTlGwD/PXRmV/3S
	DSuHjpNebNiGjwqAb4fc3vyBFD9u7QhVTMurrGZ5ZlA+wt2yR4kKemA/AJqZWJBJAsszO+hl9/s
	LM7du7euGf6mRq8QZ0Whsy/f/CECAgecHqiF4NuVcDn8V7Ab4oESZMdr3yfppPSwUCL9UeuUTie
	Rtq74A/Re36t7yxv6G1Jvhukk5XfD4z9n2MVkvwjuEWFNfQyDcYflrjIyzvkAK6uK7l0V+hfWbc
	nr72DpzWBACYvVldsnrAK8UbCzLWtfwaZsJKMcba34oo/iGBRPgDif3K1vQlPwAL/sTH91PGuXW
	MEbvLkCZGZuDGrY0WM1nX0ypx1lQbx1OmTnj0phke+vEDJNurTTAjyg/R7sPbTw4o1ibs=
X-Received: by 2002:a05:620a:3720:b0:93e:5dcb:eb9b with SMTP id af79cd13be357-93ebd24ecabmr2820956485a.42.1791989478616;
        Wed, 14 Oct 2026 07:51:18 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93e:5dcb:eb9b with SMTP id af79cd13be357-93ebd24ecabmr2820951685a.42.1791989478135;
        Wed, 14 Oct 2026 07:51:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae6fb7sm705759566b.84.2026.10.14.07.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:51:17 -0700 (PDT)
Message-ID: <11b3e38d-a9be-46f6-972f-e07bae9f2be7@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:51:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan.gerhold@linaro.org
References: <20261001181055.9149-1-daniel.lezcano@oss.qualcomm.com>
 <46ba46c8-c84e-44d9-8729-9298867b19fd@oss.qualcomm.com>
 <f8f161d1-be35-4fb7-8dee-8bda3a231438@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <f8f161d1-be35-4fb7-8dee-8bda3a231438@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OSBTYWx0ZWRfX3HQO/mNK+M83
 a6FqJHofJDdcywXhn0MazF7EzzJIJIA3otviKSpuf8FZgkFvwazjpkmANudGOD05t2vivNrVNoc
 p/wbwtzgM0eWhR8Jb7rR/L7hd0+cIrE=
X-Proofpoint-GUID: AVd48KQhnRiDOsy2bUKmZaHTyRt1Ggw5
X-Proofpoint-ORIG-GUID: AVd48KQhnRiDOsy2bUKmZaHTyRt1Ggw5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OSBTYWx0ZWRfX1YD7/sQ9NTlT
 jFIegYB4zDugxH5lnCD8I/p9mHunvgHuOAzgvOOa+tV9gbm+MhCuUDv3oPLAol5m1jIkzzC8BHR
 Rhpp46mNWMzEuKegvwwlW+hAveUyqz8UKew5YxrCCBpgMPVBgeCJVRQgx+Qj9mpldqmeowTJSpO
 ObtsyHcZjp300G2QrxJFzF44DxRLRqqpX7ui+Hg0EawldNUmxDrAhATxtz4G7YN85vziqorBf/A
 GfLIRhbui1LyCRuaOK8g6M9MGWkRHxG4+KYd0+hxyq851FhFrmFaRIkXgFNu9mA2ec6nIwxwqHc
 c+WMMm/o2kULBVgEa2+Z2gxi+Dgjpzu7WinVmNcryv/Fq9kN41z4iHo6Hh0Ym5PS3zG+GWZTraT
 PBco4LfvRsUMyOBnxd94pEjhjcnizK6fj+L7gD4QeLKtejmsjVrErCz62/4XlRbup3SMGlVAS09
 45YBKmX+AGn8orWt4pQ==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf96e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=kZM-igeZ-aZi2Humd7QA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140059

Hi,

On 14-Oct-26 16:31, Konrad Dybcio wrote:
> On 10/14/26 4:16 PM, Hans de Goede wrote:
>> Hi,
> 
> [...]
> 
>>> +	thermal-zones {
>>
>> I believe all nodes should be shorted by label, then name which is why
>> the first node before this was "wcd938x: audio-codec" since "audio-codec"
>> starts with an a.
>>
>> So this should be at the end of the global nodes.
> 
> By the node name
> 
> FWIW:
> 
> label: node-name@unit-address {
> 	property = value
> };

Ah right I swapped the label and node-name, thank you for
clarifying.

Regards,

Hans


