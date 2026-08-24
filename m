Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413AD405C35
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576145; cv=none; b=c6vxt2E4YfXGLK1r8RRZXybItA/+DdLbcHTZTVEF6czFZ5eOY/P9NZ9cE6Z7CaaUVRfzWx4v9sMnp7BMkpxhbrEUpdIncuZnwLedZv/92Yhp9AN2CH4EC7nWgNqI7/HofIOZ/Ja30vYkHWp8Aq1alL4jIZzIsbDkyWzMDZuQWtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576145; c=relaxed/simple;
	bh=pKILCIAN+R1XJIexmr3duPunuNDAf8Haawwh/AnvhFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5+Xz+muq3mR5PWqkMsFOGNqW6gK/9NcG9k/il57bm4G/34xHLaAcfi4PR0ANSf1uu6iujMTNhyb3hGL6oVFLMzjsJsEcUyg5AmDORgteULSzpyRaeOLZ6vAfNYp3V7zq8QOarFnrNNq1etdKzDLJbXGTXqN2b/FpilD5VWerfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcRW/Bzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3VCcbHO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcRW/Bzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3VCcbHO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMRxp3406411
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 12:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOaylOn1lOxDzyU+vOEzZ5eDL2e1rhW0wfVT+oTC0xc=; b=DcRW/BzsWc8h5CCJ
	tNBRIVKUkj+vKHD6u8gZL3my4n8CVj055G5DarI4DxefZXR2pKYWIW7puazkXQ3K
	WSjwEJzgPv9/e3i0we7yu6Y6bfcIaubu2e7i5nBP2SXt+9BTewdQfS7KNr62qySQ
	RU0rtyLRu3i8fX24nogft28/zl8QnThy5iBrKiCdm2A+8pTusVxD8buJlIDE8vg+
	m3oLsMOUC7KrLvblK5Tk3ZNpPHfoO2I/1Cfab6bPQ+VmRJyFFWBkud0cauDwwj7V
	C5YeKhDfj4Vv4orUYbVpXKhjaj3ZnYpREJ6giwUqOzYK6EKjRcPac9OvNQsTNSWh
	z92obg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk12nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 12:55:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73a1cf1638fso60683137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787576142; x=1788180942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOaylOn1lOxDzyU+vOEzZ5eDL2e1rhW0wfVT+oTC0xc=;
        b=A3VCcbHOB03Ut+BJD6ri0oDCoK/Z4XTe+6kMUFAjL2T4p2dqMsUwoIabj2f8vJLVnF
         Lk/Wk4+V2yS8SZ55vUipdXvjGHiX0s4fyb3U8Mai+dYF/XxdTuJgts3xCBtQnYS3nRxT
         gBqiQ65K6WFHTrMaFiffrPCCaTfQOoEn5uMiY20ySBWUUcfUrKLQpRGfdVepurSeylSP
         i4MxI4PSAs/Rck7UAE7uPmHcJi6Mr1kYinxtvczTrJibYKwucEUSM1CGgPLCZGY9B+rF
         j7Bsp8OgAa8GG8QIkvYUc4d+BAFZc77W7YOZfnZVuel6+37fYg3qf1V+wvuKLDV4+W8j
         DgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576142; x=1788180942;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOaylOn1lOxDzyU+vOEzZ5eDL2e1rhW0wfVT+oTC0xc=;
        b=NcnrW3SqxJGmD3MBwGFfnmt0ddqBUPbNapfpZ0TKJ/cgZjjj5XrRiqJb5SVjeZ+SgM
         cte5oqN2jhOPWhje4hsvN2r/GooyHEIhIqm/Q7sMt8UEE4pCV7GYaCS8QmG6o64cDcMw
         13VZQtG24uQ0QvK0od2oSrTooU/y7Kq2F1tYElhEaVRc8Efd+CCD9aF2vBj5Spx6zGws
         sn7x01zGncPsneV1+bDdo3cE2NU0XXRb+xr6Y1xMdI9RhsbTl/K5NYh7Razvup6DVcTM
         bQtfRVqChf6aaWyIP65Upn7qy2w8ptfHaJrz3moss6mMJ9FgCr+P7fWxxL5ghL7B28vR
         uQ3g==
X-Gm-Message-State: AFuF++kQTPDHUuDsd0sSS13mm3FRgPOtPvvnEqDxH6/q4zmhPR+p4aiK
	nAAYEhLOIjL0p2tfpnVfhWxdKc1ZrXBL4LhqjqkHOgzXXjPwxaVLG+FuyKas7ATYod0oaagdbUF
	XGsSGlEJHucs5VuEUoFiKCLWwgXsmfgHXxc6yMcP/hqI2X8iohk3l2VVWVTXKGOQreRcI
X-Gm-Gg: AR+sD13W+stJ9MnZogo52sHHO+GfBOkL5ceOkf7h4sfoTAW6oXJQozXfOAbtTBUvrfO
	5M3B4gHNquAax80orh9zajNPc7Z1JBf/TCP53IReRNdj4f05cftLVnP7R7cifzOLKfIfv/6/oI2
	Rnl1xYlQMVi0DhkRT7qHxLURFYjstxPJi8FilirN1r3mpDbFhMiMc1pYh+NDxZAfGH3THW/y9Lx
	YXgOcBnOI60LNNhJ8sb85aFII5JpxzZRikB8eg1VLF+Ke+HFQ7nlY9ylc/M2ILNt8qRkMfjDHl7
	ihNHEXtTh1c/Hs5flejNXe2UJrFXKD2qOzAhraHJvTWxXIbTLPfFv2ZTqMvRnqxqVfzUoDOeYGq
	loXx8N21pw7DFF+2h2ohUMVF3
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3839435137.0.1787576142276;
        Mon, 24 Aug 2026 05:55:42 -0700 (PDT)
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3839432137.0.1787576141876;
        Mon, 24 Aug 2026 05:55:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59dd550bcsm9324844a12.0.2026.08.24.05.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:55:41 -0700 (PDT)
Message-ID: <9f51f316-1303-479d-932a-a688799796bf@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:55:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: qcom-geni: rename setup_fifo_params() to
 setup_spi_params() and make it void
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260824-spi-qcom-geni-cleanup-setup-fifo-params-v1-1-bdf98ae62953@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-spi-qcom-geni-cleanup-setup-fifo-params-v1-1-bdf98ae62953@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q6lOD-zQniFhH4s3ytRRZHzwztFhNENr
X-Proofpoint-GUID: Q6lOD-zQniFhH4s3ytRRZHzwztFhNENr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwOCBTYWx0ZWRfX5/0au46t2RDR
 L5P0gZ3nxtkikfhXW4etOsuY2Vo/C3QF+EFho4kXYzLha/mlOOAIsCdj+wB4EtewyBh18D3Xcqz
 GFUFYZbYNc2g9j7B5StP9uI8rcWnGqI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwOCBTYWx0ZWRfXzXCpZieX1iOH
 SAC4I6OkrFP3fznTq/T9HOAamrtkuS26ME3NTRUVroOStN6Lx1izWNLlQGI7ShBMHRNVVpVcTT9
 JsiwYv5o+V33GWXXP3y0aCVeDFtf1HxheBHQJnz8WBbb/C5CKsq0gg7sbsVM912Bdx924HgkKAr
 xfX7+1/19WBJteyKFrngYbFQuSVaZauQaWVLD3S1f1t+ACRP6CuQBtPqvF4VpT9f4pW141BcWvk
 A5yR6tqddSpo993d3Y0GYgfF1Xi+gdTT8FWE9Np6+sAmx1o3M6CVjEgKYdipCI++IFwgZ9WzGqo
 xEFpANtgl/NxTkmkaITs/tF0FOD1UutZ51I797eN1d9qlyuUmUD4gei0UxZ/+CTHSAHH+Uo8H7E
 SOTJbQ3bTxVgs/DNkgKHh7A/A3frxGRVfJOudL/6fVYx7JTDFsRBLSj/Vyh/IGmi/XmabOg4ORe
 Q8uYhN+m/R7iI7B4kUg==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c3f4f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pkmFLQsO-xIKxrFyL9MA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240108

On 8/24/26 12:13 PM, Viken Dadhaniya wrote:
> The function always returned 0 and had no error paths, so change its
> return type to void. Drop the now-dead ret variable and error check
> in spi_geni_prepare_message().
> 
> setup_fifo_params() is called for both GENI_SE_FIFO and GENI_SE_DMA
> modes, so the "fifo" in the name is misleading. Rename it to
> setup_spi_params() to better reflect its purpose of configuring SPI
> mode parameters (CS, CPHA, CPOL, loopback, LSB-first).
> 
> No functional change.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
