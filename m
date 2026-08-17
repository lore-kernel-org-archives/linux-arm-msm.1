Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD0D417D80
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970794; cv=none; b=havyLfg/i2zXjMseUb0A6Zf+CA6rYIvAmfMQ5B1gyBHH8He6pMcdGPk1e7+YHyGE7st48xUvZw2swhOOKGE2CU0wspHHaATlKtjnzzHtCwxpjMpSeYcHlGznl9Oqm14CA6DbOY84pgKwaz5lLOfLWzRu4CMwMDW/wgs/NNbf+YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970794; c=relaxed/simple;
	bh=1c9f+VqH0nw9ME5bIl67Zj/jEKbBAkk3qZ+fADuMEtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZulPqRkhUcCBqpA36yb5JpSCVb8/EnhsuabOPNirxjJzgx8d+kjbvKLzuMsHVZI2ekGzyp9uBjiRny17+h7Zf+/uFsKyTVbJDxdDIJAlHwyQOSsUnXAak2AnCsL7swWlJ291u2EoOdt/VZTQqs8R0zIGjdcTO8w6eUTHV3gevD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iy//Lzdp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cx04MqnD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iy//Lzdp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cx04MqnD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HCA6hw1871371
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	diGAonKb85g2RDrW/NhvsBAvvxhWy56aBSZJ7uiUE/A=; b=Iy//LzdpZZjh1jVi
	RCocu4rguZhLlgs/JAYuN9OpS31sTtAiIuoIB4m839vcck+mB8HDEdZcgkcNenhj
	HE/Gb5i1Yp50Iqo1RH4Lbrh/p3sXkpwJ66OKWTNPpnBRMTiJxEbu6sniEY785oTP
	IKt2o8SaqfIsO0R7taEir0M1q/lGq82OmJpl2HZThD5p12uckvmJYXqP0XQL8bw8
	PYtCB2K3wa46WrIWrt+SW/ryoJnputxkMrHTdwG9L40MRxzgEPCjGGia42fB1/Nk
	+qeAPv/G00CxIKRLy79k1fOCcWALEfG4dMuT+LGozcnM3QICCs1XU9CVclxZb38E
	QoBZTg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1h1r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:46:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738be9df36fso71099137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786970791; x=1787575591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diGAonKb85g2RDrW/NhvsBAvvxhWy56aBSZJ7uiUE/A=;
        b=cx04MqnD/3DfPOAxUczBgAughw3C6RuJuciheIU3U9JvJwRMWc43/L0YFD6xUPJQpN
         Yg9aBN4zytJmQifIu39WNAkTImxFehEbN3JSZXL9y1u5dGm1fSPSHIcFbhOwDudfwc1I
         TTlmnqJGZlPKXg4EZscywVt9WwrW/lVJzFTLoaXW9AQ72RgmdoRnR9CDJt8wAPY9IZb6
         sIRdqna1WQZsC/ilaeAUH2zZfEHgxrIlpB0ZEeS/J2VmEoFw3Ug4rKg53elTlkagViUp
         +cCcdp+5eSHkNKjbBCsRzd1qL3hieAZR1FOWd1pdOV+hXiXsI5E5S2T9o3htSJHpShqM
         1FPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970791; x=1787575591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=diGAonKb85g2RDrW/NhvsBAvvxhWy56aBSZJ7uiUE/A=;
        b=Osopka8+q/UOtk/ayxxHydqgTuUynbbsrS+Z12x8gvyuyL4KAsNfRVYSY0Lpmz32CJ
         rITV238/QMQBFO1zLPHPtc4dkD0W+Il89KEOxYfapQRwmZWdJ5yDS6pTDY4/DL+Ka3Jm
         4qqysK91ZX3jrJN3rlFPNdaj1Un6TJogaBXY33NAYenZcSqTB0PC5DrEqvAQIAhQ4yEu
         I4qkqsHPN7KY9l4fwxZH3QPD+8dVA4Sw8Bg6szdyit+vNtBWhw02/8Y+KnzqVT3+mf5k
         1CyUIV8PTfyTE9Lhqj103EDudYBjGQML+YYN4q2NY5KM2oqO3o7yOM4s2eaJBG89jUC6
         cG1g==
X-Gm-Message-State: AOJu0YyVCJuNOLPrjjRB+w3hrFDtMd/a7/6aKmfntDX5iBqdoVjX/H39
	BamhOBpB3/NePeWU94OImwZG2LJRhNTZ2nWNdVkp/PGanXG/CZ0Vh8A3YQs+O0qj0s8DP1FyS93
	xewePIrAk7H3GEGGtnN+Me4IwqRyfJCXZ5E6AmW+L1doKqwOcV3b7RGwZl1oXkmv/lIO8+2nhaF
	/q
X-Gm-Gg: AR+sD11zpL+DtjbvKdGTcZbpONlfdc1EWq539+/uqgUAsQ+0ht+VxPUNVd0XITd6WH2
	JBBAuqJI5lhIvkWo6yoEs5ef7pwICLCHojN1fy9TiKkmI4sY57G57XNI7/5mUNBzRE5aYN0i/Fo
	Yoo8VjmjR3+EcZJ91aLkwFxf+ENFSVDtWMSf1HDPmoevQDQrB7uThzQ7gkSTDJKMibaVJ6tpvLz
	+mGS2hNnaLKnbnETCy458k+hUK/euBRsE+cddFDLCZWCLGFqy90dd6yFN+dP7kqXq/n9byN99F/
	9CHKHreDP84OA15MyR9KnIrpyPARihBsDxUW6QmykhThwCx21icNLBTewWenEbMFhHenHmLMLDY
	pb75xT8Y9n/VeZ/nOkYPP912Q
X-Received: by 2002:a05:6102:3748:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-76f2cf64f8bmr1337540137.3.1786970790991;
        Mon, 17 Aug 2026 05:46:30 -0700 (PDT)
X-Received: by 2002:a05:6102:3748:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-76f2cf64f8bmr1337531137.3.1786970790483;
        Mon, 17 Aug 2026 05:46:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffe844sm384814e87.38.2026.08.17.05.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:46:29 -0700 (PDT)
Message-ID: <8f212969-697b-4f1e-a124-a4821f7b6c0d@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:46:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: ubwc: Add configuration for Maili
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260812-ubwc_for_hawi_maili-v1-0-c29edecb3bd8@oss.qualcomm.com>
 <20260812-ubwc_for_hawi_maili-v1-2-c29edecb3bd8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ubwc_for_hawi_maili-v1-2-c29edecb3bd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a8302a8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=q7Ol_87W_NWhHMkiLfQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: NPK_BkREkEYuo3ZID8w3RG5eFH-bXhCY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NyBTYWx0ZWRfX7QkQ5OGwkepl
 YO/F5qnZabAm/LEMzYbEPUepFEkrD8GuV4h8oIoYhluZszYNctSyFjFPY8bJz2ADujVrVplyUk1
 kadcDYAJbNMVqncFYIskxfwObcEwekagg1pghe1AnxDApfOUK+lSqRyvePthgK5LRnWQNYcYlzG
 tNSuolWppE+fz3/adxw+i5d1gDdhjR1Vo4DsJp7XyG0+RMfGBsGBds+AePv/FRFwPWymo35HzZH
 2R0rJJUq/4sxifBrpv9iyYE8dy8GgZjx9TvjbovGSpqGTfV0AwSZsrCdk29ijIQPKe0mJd2WZdP
 0hVyMpKwTfRM8PtsjoaG/TQsxw3oHIn42pmeyGhb1WzwpVbqbFr77p38RYXxF6ts8Jlq3Mn3Oew
 MnJUuwKTQovJfnx2D907Zol3W/ebki8dhCKEVGjRrLsHaPBoyCCMZDX0ps1URqsVKq5uHjPjs3B
 ReR+P51UiAwQ0k6Xamg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NyBTYWx0ZWRfX0xGDP+pPQSrf
 0jPaXZ6AViW0nGBUf1743f0Ax9i+TU+u7XlOgCQgq+65Da+Xq3LRDxnVCcW5TajIfs/3Ntw5aFo
 lHIPIbHxC8GI5UG1OFyw44Wtc2VWkmA=
X-Proofpoint-ORIG-GUID: NPK_BkREkEYuo3ZID8w3RG5eFH-bXhCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170097

On 8/12/26 8:29 AM, Wangao Wang wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the Maili platform. Maili reuses the hawi UBWC configuration.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
