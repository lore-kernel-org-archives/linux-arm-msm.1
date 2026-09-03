Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01D14AA015
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440815; cv=none; b=MoaTmJmr7ihtf6WNBPve/nSAzHu6fmihoiq7X1ITbWWQkumq6eV+GC40B7dn2jCej7z3BEOC0XazjDBuMLDWHFVe85N7EyHxojVxKz7W5HtbSYJ/Ytgjjpssee84zwSjXN/NIBXan7WMi81zu+2JfQbFmIeelDviPHBnkytM1Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440815; c=relaxed/simple;
	bh=uC5pdAlea6LMnedwQM0PGV+JAkluCoB5iEpR2eQXpZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smcSkFUDdPN+Zryd0luAp9Y9b1TH8kF1nGBpgFiDH3k7PM3DFBVdylcs09KF8J4KydPD/acde/A1Jg1dphb4FyUrAkPJLUPUvk67L2j/gisEFC2pzvQUrVXK2smbqceuP1zIu4Xw/JliKsu4S6W011KsDYXVGbngEH6qRLmVeHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRUwjl2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQh3slqi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRUwjl2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQh3slqi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHFGd327180
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 13:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7FTCZ/aByMpjCgQDlXO7TQNA6LL4vCUqNXUxyjwvow=; b=oRUwjl2SEK+mHr3E
	1TXajAMLofOfaDwYYs/WYpX/pLre2StPysibiKYKi7DxlCYronRzN3jPKd7tIjkq
	2BBAGVOh+PF5It0dtHIaIlBqfkXNbM3UDYTPfj1PVbAU5ZkAex/5BRSLPJDhpAu6
	numPAlvY2qkVXW36geDJRex6X5SDRV/czdbAJrYosgEGm5dSt8IOPE/hhlXnHdQ+
	HrrsGqzycw8vC9tgA2v8l9egk1mlh8T4VoeIQjKOjyDoP79n/2HhtJJwrodk4SR2
	34c7lOiDTdvAIWKdrP+pRTf+2xIUHQnVVusJ59rFDupIu5arDfeb4l24EYSPLymR
	ktm+zw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekhbtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 13:06:38 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97ccaa613bcso18378241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440798; x=1789045598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7FTCZ/aByMpjCgQDlXO7TQNA6LL4vCUqNXUxyjwvow=;
        b=jQh3slqiCNnGXYE+D0K5mzkcsJ+VIGsY69fwZKJqf3bFrUAdNRQEUbUckH4Juglqs+
         1GmVCCbHRie67oE4bVn2VGteZLtOFwU7Cf+wS3juNTCfZV/m3sMaZ6H31vZUUZn7JI1t
         VvW/oA+0WbDv7dtyFH8qa4tof2M5icTa6tbHj46ADmfyhbIEksrgC0CkpiIfGw/ZS9kW
         UVQvBR2v/NNjPoVMcOLjJ0Ennyti2D3nc998P2J8jiV3I7YMq/GvIPZGAokPg1MPVumB
         clJ7uQ/z7zBIO93S3oNDchJNHW+4MYU1/b0x6gQgGpF9kt9yUOF73t216QMlWloi0GlT
         WJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440798; x=1789045598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7FTCZ/aByMpjCgQDlXO7TQNA6LL4vCUqNXUxyjwvow=;
        b=XQM1uaAi/9Y4IVLPaUvnwlcr7giTaUYHnZzjsoCWtSROSlfvub3dvsDAo7PDXvTPvI
         XROq8sxtpUCv4Lcjiy3FFiDcMFq1ExSjfomLe9APLZ356UhQSfiCsGhmy4sIhWJnAQvu
         UZMO1NfXmejZmHzHL8PPKWb+861ZKtGjpizuTqydxWLZphLd9OyRZWaHH3X9+8NqsUQq
         iGNx7giBwLLTp/lB5Wd40w8/bk5hI70nxs096TwasOzf2xuDEmVjNUA1TKCOi8/kwyz6
         Xj0Igcmx8xhNuqVN1wR+WVLFZnLHOpRZaSvj+rHnPfL6AhXPrrOkYefYbDIgDMyno8BN
         J0jw==
X-Gm-Message-State: AFuF++lonTkRKj4OHuHyIF4GOKNY+sC+iTdMutT8VP6aaEtXcRiYSjz6
	R9b1MLOMjfDF5NdMNE50N2kD4Goz45kfkaQ1YCxKMtsi9MDVDaZAA09DSyYy3QQk5YClEbqToep
	x4sWQGbZmBcyifUbvt52rICZb4DgmgJdbFh2sTn3k0f16t6yVs3BSxfk0AiQ0fZ0Wuk3C
X-Gm-Gg: AYBFou1IS+ZXAvDyEvyHI+lLdLCccNCt1YWZlrJLjAnf0zDaNet4KPi03iCHdRZ+MXI
	WDp3H6fRzE9e4bOnWNyfwd9aoSJnxWZa6kK8Ssa8VTght063gc+NTz5I3vGcMnNMLqfFVjfiUF8
	/LHfCJWowrbRW92YDNweI6qGTOHQHG9Njn41OQDLKRVzP2h5Atw+RMy6HhpxHxpjcxc+UdmbCu2
	iLstgJniPPy8mHM/ziEvnvrtEcQqw1Ith3UCSkykgJpFp8kLMRUIa7i8pDBuu5kGNs8kne0Xolu
	guKVM4izH5cPVwL8tSYr768Iy4wRjfdTIEOnQ9e1byyL4TOBowjPf0IzLoN6HzfGPg/WL4xOy1j
	Ukq/I5nCtcGh09vn0ppvSZg==
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr1904417137.1.1788440797710;
        Thu, 03 Sep 2026 06:06:37 -0700 (PDT)
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr1904386137.1.1788440797263;
        Thu, 03 Sep 2026 06:06:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8b53edsm2193707a12.10.2026.09.03.06.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:06:36 -0700 (PDT)
Message-ID: <bac552e0-8d21-490c-b628-8da860cb9371@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:06:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: monaco-evk: Add LVDS display
 overlay
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
 <20260813-lvds-support-v2-2-6b11035e8ab0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260813-lvds-support-v2-2-6b11035e8ab0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: clQxJ1zhslQYc5T4BXiQpSdUd61z4qjb
X-Proofpoint-GUID: clQxJ1zhslQYc5T4BXiQpSdUd61z4qjb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXyQXnTMsDojk6
 +fiVlwtA4kLYvC5RJcCFoI/x44RJY2y4o4GZg8jBksFUuTVOIWIFuHfV0Nzk1nVG6WhnjSdzXYB
 TLiiyoIWzWR9S4ABqYRrF9u/dbOp8R5rswmGcW/6Xrw0UFsrIJWoCGqKsUKn6gUiPrmM/EeSMQX
 MUObbDXoLgBQYbGbHcLY+xmMnm63X0FDDlPdg3vzDb8wN56iNVwBdRvlnlkwh546Y6IVVGv49b/
 vuttfAiA/w6ddqItY/xGHp17/xHJo9L4jWEt+G9Ksfkvs79jlbWQLEeqUSQ4ivjKPzich2iSWNp
 Am2Sunf3g6TC1Xf9OboGuaWQIZaT+0cf7vOojlKPb+pR7JKvZCJ78QDbrTrBQeDm/rHhR4VwnlW
 o/ek7lBYoWs71eY7nWap7HNTp7dGXzhV9m9ol7u4YqRmHAeSq8Pyulr02M4tgASsZdFptG2p/ki
 vkWGfR5hVZnVN/4WEtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXwUFIjEfiYIp2
 DWcD8h8yJHqa5mIZnusheSQ97qo2nxCCTyLz2TZVfZ56ecHUpPDGcb49Y2taUMnJbSFRwCfLDwl
 lWWd+wdQziMxMhC6qLRfCY7cb1wkn78=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9970de cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DIbA0zq13t_FKQmREx0A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 8/13/26 7:33 PM, Vishnu Saini wrote:
> The Monaco-EVK mezzanine supports LVDS display output using the
> Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> VESA-24 mapping.
> 
> Add a DTBO overlay, monaco-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> up the LT9211C bridge on I2C8 (address 0x2d) with reset on GPIO66,
> a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
> panel-simple-lvds-dual-ports binding, which supplies the panel's size
> and timing internally), and an LCD display bias regulator supplied
> through the GPIO expander. DSI power is provided by vreg_l5a.
> 
> The overlay is built as a composite DTB combining the base
> monaco-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---

Same comments as patch 1 for patches 2 and 3

Konrad
