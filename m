Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F91448B83
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321910; cv=none; b=LoEwKiJd/37iMCqed6LmvGuVqR+Clwq0Po9bLfR+XMqEo3rggKhFsF5e8d38l3aKH79apvZjdxwjAllAwTEroweXmEk36JzYp2WyPLUt4HzdMTkIz5qG8bs24yVydp9i8s5v780tE8M/LbdJhjI12bnUGIvSiiWWevUQ6R51lSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321910; c=relaxed/simple;
	bh=YgGrKvroX+B7hQeoh309Spj9uuKXUfSWYGrruJW2UHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHawMAz5FdssqDDNXFbW17DQDUu6ycg8VGE9x658zDgR3HaM55KFNcqSG4MOGIxbwc0o+Dyf6WWmmqDpNkqQ84MH9mlcnvnnor1iFpuQupRzhpSIOqBQ5egrEerwG7hBY9fVSXmd7mGFyYEnftSWiRQA8WQQ5sf7YLIAMB3mVOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNw/dwgX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ayixrtdj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNw/dwgX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ayixrtdj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T8htkA1484359
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X4jMFwNTYibL3lMrso1JdaIe0/qt3DHi2IwzcfYIFWg=; b=BNw/dwgXds6O6Jjp
	+WI4Da/vlEZ/BoUCO/MmRO7SRMOOezhZJm8SpDGU/B7laZ+L/jt/EVYr3uLbcmPw
	z4Tkuln+CfuB23F5vYz4Z0Tim1mhMcbVGh9wrAfQ+Y8e1baM19EErwQEzkItXxlO
	RRkD4XTc4T1ZARKJzoWaBDOxT51FzyLewb1rppuwiTBzpoa5s4s3Ddf/jPagkmsO
	fWJbQCeRQEY345N2nNw8DKLzlJEq0oiZ/J3GxOULWAijovIJg0XZzq799gj5KPcH
	1N7msgr3ea7pTW2et+1Qn6UpHtg5cpoZtQEHQ700/2uK824P9xQ+vJ4tSnMZDX27
	FjCzXg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqe920hsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:45:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso8752771cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785321905; x=1785926705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X4jMFwNTYibL3lMrso1JdaIe0/qt3DHi2IwzcfYIFWg=;
        b=AyixrtdjQLadMxwvUSl8UOnps4yMJJD+vpVh8h7ezhlIlecbBOTuAP+Alg3+p/a0ds
         c2hDkEw2ywmgFiYSor96RJhShOFoHJ8BXmp0WHEtOtbG2b8ylCISrDeuNq3gIyLAS68g
         TSD8Jk/gIZnbtpZazeeQmeUiQ4UomCUEWFxFdVr8iWeH5Wb8pbm3JO81cwRVTMW6kI+r
         DHbqcKt3VLS6B4geBYruvWiDrzYYV0qBbkKECdL5ga0FT7VW6lhsZawfUbFVQiuRegh7
         j566t7nnRtq644LXuulSpZh7Fnt6SdywYt0vogH6KadsIq/j05slvE+RG9ihMBjAKJ7i
         WGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785321905; x=1785926705;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4jMFwNTYibL3lMrso1JdaIe0/qt3DHi2IwzcfYIFWg=;
        b=kv6EDIXJXI/0YAnDSPL21fDsT3Mtx/ozOeyzQmTGXYISgYhcB5H/CtR3UmvfyKUHSI
         g3zpi9B0khMzZZ+1MqcVn2V5BT87hnht9oaK0FKUepn0JXjrXMOXLAVA31HjE30SyEGY
         IcefnbEkAcPzbmVDaKHFD0IQtDEKfAHo1iLcu6XTi+veFs7tIm4QCP3Tk4M1HBaeljmo
         zLV+eufTbRkdP9C2Xp9h/awdzI28w29/gZERm1lk2wbtZaq+PRTDRvsxYFFU7XmkzTrn
         RHXtyiI5MPbQPRDOoqThU56jexvq0S2zgEDUDoQqnjdAVVoLEpjpcbTmnkejiChjz/c3
         THDA==
X-Forwarded-Encrypted: i=1; AHgh+RoVgflk4/F8aOm4IwaFyMPAiogM6woEjrnoPV0PQEXwuQFEP2n6ld+7aLgMn8uQB5Ls3ZH8wbeUNLPRVr1s@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdw5Eek7cayYYnjHyO9T9m7tOzRHywODgj6jZJSdazR/UQyil8
	n7dj6H0apDDj0r7r60oiLjDYh9IDOdY4WXURdle+Au2VsPF+nK/tfZcQHOKUDj/LYFZ0AxySkGB
	G7Q+4buf+M3c5mYZxC8IScLGaLOkljH4Yj5H5fSn5P9cochxfUSO3eIvR7vtVER7BtEApECv5kx
	Ur
X-Gm-Gg: AR+sD13cWkBoGDwVAIv+XHsEDIIE78JFxoaJ4SEdV2707M+xowk9aFfLeBxdn1Nf/PH
	QTah4VI0JS3mVNTALZ9Px4bbjO/GURQd8Kr1ejQv2UKTg097O3l8J5Mr0dDA7h6U4sDqH4nW4G6
	n5WJF8cxbwmLaFEHH0CL63Es2x/eZfEn1QrihHZNwBxP4BtDGMPEsBmmfb3ZMdjCEhfqDxn8MtT
	14pWx8iC2GpFE8jWpRt02CGA4PMtoad1uX9xAhmoJZOhVZn0rjYlnBEKqOMO9CN+l/U789rfBZa
	QfMjZXMXnKAb1hN6oODdTgDI+QckTNs67BNC4U+5dc4XBKTtATr+6T2Tm+LZL8pZQDaQfwLR+Sz
	jhWVreIb72afMwiwDDJloJcJOitKVnQ==
X-Received: by 2002:a05:622a:130f:b0:517:8470:2d2d with SMTP id d75a77b69052e-529d7104e42mr56947611cf.29.1785321904757;
        Wed, 29 Jul 2026 03:45:04 -0700 (PDT)
X-Received: by 2002:a05:622a:130f:b0:517:8470:2d2d with SMTP id d75a77b69052e-529d7104e42mr56947401cf.29.1785321904377;
        Wed, 29 Jul 2026 03:45:04 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496fa42effasm40055445e9.2.2026.07.29.03.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:45:03 -0700 (PDT)
Message-ID: <32b6fb33-0e80-4e7e-86ab-12730744ef32@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 12:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729-qcom-geni-se-armv7-v2-1-dd6dd1e112f4@oss.qualcomm.com>
 <24f7a6f4-e369-4e63-ac2c-055f159c4b7a@oss.qualcomm.com>
 <e861a5b4-38a3-4f39-932e-558188b5438f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e861a5b4-38a3-4f39-932e-558188b5438f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4OCBTYWx0ZWRfX13egKvwMf3bJ
 kI4jTndxcOqhi56CLzysLwAJXfeUqBsK1iuFDDdltvv/eXMJlyAstunB9N2hGRs+bQxafLuWSQf
 gqFqxnIG/yizjrLUdZbYA7krH5DX89o=
X-Proofpoint-GUID: L0ihcH0iwLUNerWgcy21R-PvD3loVunm
X-Proofpoint-ORIG-GUID: L0ihcH0iwLUNerWgcy21R-PvD3loVunm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4OCBTYWx0ZWRfX2l1XAGs4q8Eh
 aXqy2D2Ilr99+xGwGwXCY7GF7kW0jCYQErFCKMeFD2QgvibPmp3nq270QXcDY9/AVEelvAfMpG6
 LspLYe/psR5yEwi3LIyjJQCnaDqozIWgmWC9XFCGv8uKjfZk73ECiPzw4IzHH3H/Zpyk1+G/V+Y
 v69sGTj89zd/OEZLIkjxUO6KWjt2UHaEC8nHFYuTz1Zt9hWHoWWbJRYGLhiJzEr96e7QyVs5OHo
 zGz75PztDh/RV376w9wF5y6MYnZhKH/puBvt0oGRLa0Xp8P0dAsxngykZwr8wL8OcckiNWKUWdR
 bcLjuEPTAVXs24plLLKkeSfCRHM2mXLyTCCrmsCH1j8GoP/sy+OBmpEscC6mbay3Nr6WtOjaV3r
 xTHGCuRFBAo5ouxYwatx4fSi3fTMWfOKgYBweNG+G7FWYnZqJ0Y/S7ckc3T2ztaapG7PQznkdHN
 dWUPvy43leo6ZiWe2+Q==
X-Authority-Analysis: v=2.4 cv=JeiMa0KV c=1 sm=1 tr=0 ts=6a69d9b1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=WF5VElsxcuuD7m2L7hkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290088

On 29/07/2026 12:28, Hardeep Sharma wrote:
> 
> On 7/29/2026 3:30 PM, Krzysztof Kozlowski wrote:
>> This gives me nothing:
>> $ git grep kuno
>>
>> Are you sure you organized your patches correctly?
>>
>> Best regards,
>> Krzysztof
> Hi Krzysztof,
> 
> You're right — the Kuno support series isn't upstream yet.
> 
> I'm planning to upstream the Kuno support series shortly, and this
> Kconfig fix is a prerequisite for it (without it, QCOM_GENI_SE — and
> therefore the debug UART — is unselectable on 32-bit ARM).

It is not a prerequisite if there is no Kuno.

> 
> What would you suggest — should I fold this fix into the Kuno
> series as patch 1, or keep it standalone and let the kuno series
> depend on it?

Organize your work in logical chunks, please read submitting patches. We
also discussed this many times in internal forums/chats. Even discussing
EXACTLY now.

Best regards,
Krzysztof
