Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7D03EF0BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887134; cv=none; b=frKPOAWnh40aZbUv+Xi9cUeWayHsWNVcYv74EWAdn1SZDxJ76glww0pH1cGa74HLkSjpWpjyn96+AyoInuK0JofDuUvZg1zjCeAMmuPYnIqHyM75rAkecvB3POVSi9js5EMRypJ6QvzA+a5b2Eh80vbrChSP1fgzJwj6cMJqmLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887134; c=relaxed/simple;
	bh=k5NT8VTabi42w9dEIcAeruixxoiB9HatrInohRygFUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxiJ8DA+d9nzk9FB0Ys5CxwjT6kY+mIJU37ZM4CJYgPqXhOWoaJQCtXA5FISSxrEpLZ9n3NCoHECtmpaEoMtoCxjc7GHv+hV+DMfCmo50u5F1EdRk66FgPt1UC2KNMBadznUpFjc6Pkl8YfrMvTPOUiLi5XmR/4CmiLjoVvhebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nvKHTKNw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQSQMWL+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvKHTKNw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQSQMWL+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4m5aE2099930
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdEKSdRvv4nn/ABeTarB5knj6Q3wmkNJb/HoAcFj7Ng=; b=nvKHTKNw6Kzzr4t6
	1k+nvOPwrqXEr4NyhW1Bdj1hNKIr8E/x3Rdh0uYD+uNLNgbo4E9/IHLTAxlp/hRY
	1A2FWHYi0wn/vfYvsunc+UoCnV1O/3BHsrkQuX06A/ApzirE1Me0rTEgoQDNKfWN
	OvtvR4fO7+Qsc7mGUkzJ4sXZQLK2Z1GeFxmVsw3pNtHq6toB7+jbA5qjhdcJCRRs
	n9vQVrzEwyWSsqkOyhW3pod2T01eZz+dGBKAPuVdaUaO7WgLX92BhPmfmC1ANWWC
	S7foo+d1BH+Depa/Ukwpii+nPHSfh72tQmvnSEGAYndI7Nzw5xwT+71RwEGGa4/9
	fMuToQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahtdnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:58:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7131849bso324312a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887129; x=1785491929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdEKSdRvv4nn/ABeTarB5knj6Q3wmkNJb/HoAcFj7Ng=;
        b=XQSQMWL+c0k8S5D/XROeBm6w1yoLCuPAS7hqWvUsvmPDQ0z6iH4zOSrZNh4J3ec1xt
         nAhZP5jxMRA2v9ggJIw6b2O4zbQeO2RIh69c55erW0eF+hMkY6692v1F7uvLC8wOVsKR
         40vMD/DaSrZJkarxojY1b79Sj5DbksIjPwQoBYiPVoEOnY5VQMJmSTD+ICGqHuQK2S+7
         TIhe1J4m0FAGcAWd8HyaocDKI3MRYXTxm/20cu1EWEx6KsAk8Y2jGK3Z4GKHMn519IET
         0iPGla44XD0yP2gAs0G71X2xNdC+OLt1Z4CRFaZMKVL2yZ2Bw4VsgNz7f3QJTcsyoZ3U
         WGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887129; x=1785491929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdEKSdRvv4nn/ABeTarB5knj6Q3wmkNJb/HoAcFj7Ng=;
        b=Na0LxEuKdgl9x7j8J2QTUyZf8yy6LP8q62RBd6tA33lFzuKO/fZp5XSFeweem5F77/
         GTitV2H6g2fHg37gBcXjOJhENRtBaSpO8BkO3pTpxz/YLh21fcetoKX4RBIx//XUBmKG
         RvBz7UVgLMqkpepswOvfj0UeYMy6qiu0PClirfO4g77Ofn7407CLkoTFlmhbm9erpBac
         spro7CFvBzXnj3SA34fz/jVrVi99UHxBgvaVyiiGp7/RseDwFOHlzpmrKhauH6rANYNa
         ZTYZ/meZvocA2MUf8P9OXTzoSqx2pIPv8pWm3Iv8GjQqB6TrBBOqdmtcDkli2g3yrb5X
         PQ1A==
X-Gm-Message-State: AOJu0YwCexD5HOdRIU8ydUHhyeXWaRjRhio2YX5KfbgbcB5zOSAntZjE
	HPvHgeqW2yWhZAaxqT8VUGazZJcfrurDTMpqC6ajhqqL6mP/O1VgVdB96Qx1wqWzg3EdPFBV34h
	KRCVvPuiSxaIKGLhJHah370bRcPAObvbIGkB487T2cNScgsBr+NAFMDNY6BLtCjRLDbW0IhzIqP
	zU
X-Gm-Gg: AR+sD11KD1jNeKK2tU93AMH4QJH6gA8OVCzxjbdGx/LG/Hcf8mFU3QLRLIVkD6uTwBv
	8Nt1WpjXAa1zPTFXJG3y7Z1ckN/EfUIDn5HdovdPrGu50soYHYyb9SWMsDa0DdFGawyxxXqbUiQ
	hBJu/56Xo3FhBs4bZH9OG55IBN1Noh0G3AYHjo5UfmIs7ZjruQbMe1mBf3XC9mJ3DVVRQKSKQgj
	6ydlTB6EJklvCJ3BhJS8TyuLzUphWh7TgspmwxRS96OsW6WfXc3rLjSzGyBav9Wj7Ke2Bh75TQg
	2e/vH6buAmPDKtZGqXwMYKWy3qdCpTlZoO11kHWrwmyu4VCNLJiRmPiyvLGUVUnP2ny1/6dUyjo
	g7g7xN3YBTgq1PHTbQx9ys+24Xl1R
X-Received: by 2002:a17:90b:2d10:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-38ec698af76mr6790148a91.15.1784887129242;
        Fri, 24 Jul 2026 02:58:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2d10:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-38ec698af76mr6790103a91.15.1784887128354;
        Fri, 24 Jul 2026 02:58:48 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f08ae3079sm490419a91.3.2026.07.24.02.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 02:58:48 -0700 (PDT)
Message-ID: <f5ea69c2-6900-4a55-884f-4efc5c3dcac8@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:28:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for the camera clock
 controller (CAMCC) on Hawi
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
 <20260723-camcc-hawi-v1-2-7057658c5c47@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260723-camcc-hawi-v1-2-7057658c5c47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MCBTYWx0ZWRfXy71Yr5F2N1Oa
 l7uxHUtA7ZVuql+BhGOXkjcDeu4Vh919TFufmD9aGgj+1Yj+mhqVe34Z9vm9mWarD1UPWeqpbrH
 T4+Lw2uRoZ1XMI7ZrMJdIp7mz/4Mu3g=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a63375a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PCu9RmNGLwuhZzGwmEYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 03C7oOcTgpEXmFTcEwv1jNxyeuUxsR04
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MCBTYWx0ZWRfX46cdHPseXAA4
 VbDrdnKyGNP+Yz/w15xb2+UxKYSfAFjaEKISP7UQrSRQqy9b+ZoaY5eSsV2Hm7JjfTigk/+qOmy
 vOlz+bNy9jR/fNTXqFnnKDW6LAtdFqt/EnbzdvCEs95Rdv62yHQxrpZvZM56NUmSj+i7p4SRh+a
 Nkz7hnXyHlQkREJmuHDGkEt77Swdz5pgDLLRU6l/2UI1jV/cDJUJjHjl/C96fPhdCIzDnLRqEuA
 /Y0PXMZT4Q+GGKESr43sqm5ST5k1lGY14ufYE+t/yK2NS5zVl3mRpAycyDkRsTUiTWDHPoDfZNA
 brIcQVlNwRb7STyKT1gaE1GPv1OkDz4Q5ge2gW1xPPCYw6qMklX/aKIVCMvFuIQtXJbpXSL5jp4
 +3f8aWeum+v+66kjCcSlbqtAHeio2xRUchErwZET+TlvNtC7Tul0ocwiBzE0NDhUOOrCXeLptUB
 H9lLdwcYubseCFngxQw==
X-Proofpoint-ORIG-GUID: 03C7oOcTgpEXmFTcEwv1jNxyeuUxsR04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240090



On 7/24/2026 3:08 AM, Vivek Aknurwar wrote:
> The CAMCC block on the Qualcomm Hawi SoC provides the primary camera
> clocks. The Camera BIST MCLK clock controller is identical to
> Kaanapali's and hence reuses the cambistmclkcc-kaanapali driver to
> provide the functional MCLK required for camera operations.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |   11 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/camcc-hawi.c | 2984 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2996 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 63f271aff177..ff9ab7f3b0b0 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -381,6 +381,17 @@ config QCOM_CLK_RPMH
>  	 Say Y if you want to support the clocks exposed by RPMh on
>  	 platforms such as SDM845.
>  
> +config CLK_HAWI_CAMCC
> +	tristate "Hawi Camera Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_HAWI_GCC
> +	default m if ARCH_QCOM
> +	help
> +	  Support for the camera clock controller on Qualcomm Technologies, Inc
> +	  Hawi devices.
> +	  Say Y if you want to support camera devices and functionality such as
> +	  capturing pictures.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

