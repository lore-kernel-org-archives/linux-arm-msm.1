Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ADD4CC265
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788367; cv=none; b=hEJNuKf2drjSbg6S+nWRxXN5l7au2kJxMPHpX/nwe5LLUrGVUip3ZBaglWJX44Dra/mOPASBJrHka8UKipPZfPgZeOoD9RMgC2+Md7FVw5g8sdU8pIcor9VtwJy/VZq9zk4z05eF8evMbMxn6gPA5/j8KGMSqN/P4vfomyEj7dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788367; c=relaxed/simple;
	bh=qcXZbw/SBgWJ8tuEFHn1c2KHIgyPgHN90XFCGbGMSVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuiRCko1IE6HyrSm0lfFNCvRchuqWYJhvSJbUli4ggnq2eW0msQ6rNL17K72uwbhgAqWKXcWgIejgoplpe7dsL/eUWWp4iYQpNa1/XIIZbCuOjh+pY2I67qk386gK6hrsMUyfs6YUksQw/wZdnBEcVoI+VfUMFxoTNacrV7aTOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZSevcBU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9ejHUUq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZSevcBU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9ejHUUq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdNR33025861
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntco9bweaKZBuDTST+ZNAj9vIcsX68lueXT/HJ12Y0A=; b=QZSevcBU/qj5bbnJ
	yaYnRatnPwKcLpPEoAafEI+FsPo2228CIayN6v3AO69ZfmhL2f7XkbVmsDldEMG7
	VFsFV7IEyFRhXXni56/+/c/gZvIzrfWIHPiViIgzX4/G8JzAWO2LFv7im9WdEDiH
	3pWxQvDpnFABcxKwP77EJwMBtMKd/B6YVHVCoULTmpTt/VkNHBA/zkgH/Y989sSW
	hAkizotQqG8g+pcBKUL6u5lvD+GzqN31QkjBW481vCaBAM04PKkHwOmyC3WATZ0M
	KFyqXeGyjEiVGaJiFpDEmH4guNpTHrm8N96NJS+BnhFBmLlVGXw5tDhNnaVQkCXj
	xmdaqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0v5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:39:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ea38b1e7eso8123171cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788363; x=1789393163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntco9bweaKZBuDTST+ZNAj9vIcsX68lueXT/HJ12Y0A=;
        b=C9ejHUUqE/tIgZR7xuQuipURfHX9SNtxMHx9NGh41swJZ7UHjowOeyqhVBdcJuGLgl
         TWrNZ71F87B7B7M5Y3LORY3wenfsps9dZC7zU4aAv8MvuOcLngPDsHEckM3h5ADJNmmY
         ORTF3+Zqh4o3CoRD78p7G8944+0gXu85/UW2JjiLSdXQ7sX6Rqd80ZTo4eCk7ErDEEvS
         KDJDMsRwUcWivJYWgooiD5QdOegcsc8ZwvoZ3RFPMZTs8AgbSEzDVZr656GUnVeay/pp
         RKUvGB0hg+547z78iwUpUPC1NaBlhNbOuy+Ks0IXwhlHw0tLgPapkmpo+4+VjJ2EhJ3u
         uFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788363; x=1789393163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntco9bweaKZBuDTST+ZNAj9vIcsX68lueXT/HJ12Y0A=;
        b=pSV9lmhZd9cs6cEGlH26cZyuOuKn2rzPhQZ/tBFVXjKxuGTdAe3gwa6vdQbrppcFhl
         myziVFGWR0lWxZ1rV59/XF7cWobVDybEoHrGXbpKnybwjqWKDEb0r7zoFK3bsD1MExDN
         egu68M7czt+0B0czLHYRM13Basy5NIpbfye1zfRLYBFfKOWGxG8foVLHbw9zqPk7xfrE
         g+uk/ZlxLjoqmNM8GJfJ1H0Bn32wzyEitjZFPZ6vPbWp7TdTr3U8YJ+MjCG3C0DZ8l5V
         D0w1/nKalc+KvnhhIZAgx2RGCWDzIalSq52FdSg87zazJdxauVVBbPiqoiOZF9b+ITko
         xU7g==
X-Forwarded-Encrypted: i=1; AKwUvBys7R82aEdVL88A53EWwoYY6+12W6WF2A90Q8Rd+6K29wsUM+hobjiNevaKoj4Rz1xjdEmRHULDbBLq/9u8@vger.kernel.org
X-Gm-Message-State: AFuF++lVb5wuSPOkRqxQ2gOqf6IGSNEmjBsk51geX1wmkz/oaVYYtUbk
	MGfy4X4pBHpRRC7juutUVturn65mVR+86BUWgDUtQsGltrkN+J3Sx/GjFMtpWovXLdZI0VIMCQB
	TPgj7qgAFIWbytewdI1qjaRzCXmJvKqR3J/OqcMs9MTGyeayr/gzypn5NMPdsxmV1qVis
X-Gm-Gg: AYBFou1X8FAQ7IMXoBLwsS7qynx8sQiXIBdGrbMW55So/Adxgym+O9UuOwUwQ7YQp5U
	RInsTkHaMFXOaN4Mm0hTxuMGVfbt1bazxFPJGgdI8mB7XYt071aN4protb1TSNJeM6M1JxGmj99
	V07YmjIIdTNIhCULTlcrET2eW6EvTSysBNYlprk60CEW7+k4h4pFReG4Wq48UVvQGZFYs2wI6Aj
	1VTdgWzSWkGgRfRW0UhtahNIXB9z/0N6cogM0kmZk3cxoZKpAAlSKXhcYMiYR+m69fPKLxkDTx1
	urDFOgpYpuPW53q3exAYmjLMTVPPIa7VntKePpXS7kx0oceEzHrsk/YcImL6KRhUz39dih8umfG
	kYj7tHy6mp4tPOzTJc7ph9g==
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr1131540285a.2.1788788362839;
        Mon, 07 Sep 2026 06:39:22 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr1131534885a.2.1788788362361;
        Mon, 07 Sep 2026 06:39:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6db6sm4080601a12.5.2026.09.07.06.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:39:21 -0700 (PDT)
Message-ID: <d1ec9149-7034-4002-beaf-d389f0603fc3@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:39:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
 <ef41a092-cd83-4e65-a16a-7a8b838bcb63@oss.qualcomm.com>
 <f27df150-f21f-4721-9fbc-1bea7dd0f05e@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f27df150-f21f-4721-9fbc-1bea7dd0f05e@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ebe8b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UOxVzSRVUou7as5_x64A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: fKN1blyl7NkTlKTm34sQ9juOo4NVr1ED
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MSBTYWx0ZWRfXxT3g9SEYKD6X
 fY4cdqVVAG0f5zqCyOdR9CmuO3GmVi6rSd//xrNsp2JsiN5mGIhjgR7aeZJ+BQlN4F2AS25Y81P
 6Nkv4iSWCnTc6+tm2xdrQijAKSIDFMY=
X-Proofpoint-GUID: fKN1blyl7NkTlKTm34sQ9juOo4NVr1ED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MSBTYWx0ZWRfX9Z9DYC1aABXM
 RK0eNyQjzZBIF/fI+D/C400Iu54gSdMIh9B8kCTrqxksB4GLoKT+MQJ98Z1twVPPws5hx1YEOa2
 6PQF/pjXB49rDVDHjBbnjuHVMrhwptYcubrbFzOa+HfuDSMP4VuPgGQAPfXuvaSsYNVhGxxrEWK
 jAB31Kdd7TjozhKknm/lyEMYYRvWjMFlMX8UcVkb4UcQupHCpasVmD45je9miQh3kS/w2A+oQZf
 OOmp/QO+E3qD05U5uxdp4Gr24HtWrzRnIT02yKxlM1KYc3RqepSQSZt+nQnj9WUUci6tmiNfnJ3
 BJIS3nnoGIJDjWRQ7Z+X2/qE7BBXWoSXJFZsqYYSU7TlcyEZYu0apnKf6SgLZVg+XmJGttZmZ95
 Ro82677xGFA+zYVdc9+mj+KqhMylk7W9RBLA+cMMSJdXJJ1Y8NvJ/d+ed88/0zwro1OU1mblWGe
 oE+GZiqN5J3PuJKKZQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070151

On 9/7/26 3:32 PM, Muzaffer Kadir wrote:
> Hi Konrad,
> 
> On Mon, 7 Sep 2026 14:04:59 +0200, Konrad Dybcio wrote:
>> On 04-Sep-26 14:55, Muzaffer Kadir via B4 Relay wrote:
>> I told the robot to take a look again (and again and again
>> a couple more times until it stopped complaining)..
>>
>> The following feedback is meaningful:
>>
>> Hi Muzaffer,
>>
>>   `qdss_tracedata_b_groups` advertises GPIOs that cannot actually select
>>   the function. Please populate the corresponding PINGROUP slots:
>>
>>     GPIO8:  mux 11
>>     GPIO9:  mux 12
>>     GPIO12: mux 12
>>     GPIO13: mux 12
> 
> I will add these to their pins by sending v5.
> 
> But also I want to ask,
> does atest_combodac_to_gpio_native
> have any mux on gpio12/13/20/21/29/30 ?Or are they wrongly set ?

Yes they do, the robot pointed that out too but I figured it pulled it
from the internal data and not from the existing driver. They don't
really have much of a use outside validation testing I believe, but
since they're there already:

pin	func_idx
12	14
13	14
20	11
21	11
29	10
30	11

Konrad
