Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAF5431E7A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559619; cv=none; b=NmJMuMItjzavXBMdokR6xsevopl2+S29zrj1B8DAxpMH4OiU1naRbUDsikPuFvCv9TXIe9oFVFJd+T8UAi+brYqCxZcS/q1aE+ce65GFdH/Po5dA64MryjVKLp8y+/d1SCBl1I58uLMv/+DsJIW2u4zT+zZmc18kY4A9hHTu6ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559619; c=relaxed/simple;
	bh=EVYrPKkGXvUwdIEUFtq4wH5pabs+KuX5q7msTfB26Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHb/f8NR0vgrfZQRPWtLhGFIPGrpHQujbVpta6jvNpTM/Wab/55LF+T+uOAjhMcROja9533cEs7nukg7WuQC954gMkZkrLHpGRT48oyjw8sZqTzhFpdVSjx7xLruG4Jc5aW37h2YiwUdazWJiYgjTSbXmp9W3kW6kqPA8lcJJeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovEdLrq3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbpOXLwe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovEdLrq3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbpOXLwe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqeWn2702006
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AAans1b5mK/eA1hGqY2nPGLW
	poCtMEiP9l/HzJL2d0c=; b=ovEdLrq3Pdr4qOMFIuXCZ+MymEvLDESK02HVM1Bv
	kB6NmUi0FDAeddbCQMSnUL+sGEGNQghCJBoSeTHb0EVq8gNGCSGRJ9StwfdE82Gm
	BZnXnAVLCT0EdD7MiOajOBEggBV2vqkO4W80ysERVBtF4UuG05ncC/kLga1RCESu
	S4hosCCxBDWV8hqDjHAkwiwmxbObAEmJvEPMUJxYsUZxy7guj11kD38e3ew8aPvx
	2x29G9iBFGKj1HQoK77Erc5A2rxfPkZtuAct1/ilsxirTaOcMWcNchGnrlPga3zZ
	Z903bu9DjPkSJ69AoDByTolJDj7CikqYWzpxU1qXmHxFxA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c223d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:00:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so244709961cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784559616; x=1785164416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AAans1b5mK/eA1hGqY2nPGLWpoCtMEiP9l/HzJL2d0c=;
        b=IbpOXLwe173ZF5eSyEbdXI6OrDgVEpUFDe4eSErt1jqSfmi4nDut8x49KxSnJd24lT
         +zlItupRqwhd76+klLJHjDlUmts9EWXoREiayYI/zW8xkaaf4I13KYD6KJ84jxP5dLEC
         /1R5/j6vfIOxRMxDBHQAVhCfzSG7Hs6H1KFog8jUJnHE/+1sUJtejLvR+gytoj3ZlejZ
         rJxRupdQ3AijfyBKeDzsd31VN4X9MlbWEOHbDiq3GsSYM6LeD/vOIk6JZ1Qz4fAPFAIp
         OlHVrmMEan9Pts6Q5qvgRUqe73P2YfjUKY3Xvv1JhRynzC8w3FXhGUcz91GwF0qByFzd
         ceCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559616; x=1785164416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAans1b5mK/eA1hGqY2nPGLWpoCtMEiP9l/HzJL2d0c=;
        b=n1dOwiLfp1odqbPpY54d+eyeI7oUJwIyXeNPpVamcPgYnB0BON0AZ1hDgnY23T21gU
         BpOsvsRlLS+sKDqVO0nWFTlKVFG1HetnA8/IUxZPaAVEc92ByRamTzy26oXOdhC0ifDa
         ESdkyOstP/apFMQ63m7psGgzpcp76/USfJ9pt4/Vzhw1ikrtBUOlkamV0/I9Rao0lQRX
         /Vk7i4oLBsNAI5LWikTqwkFcWb1p+4HkCkz9oL6KkodKCfAo//YVKxejMb6bqH4Rhx7V
         J/qtB/l9Vi17Em+MCJh/77GnD/XSxdP4sS1kvMfvG67uXuY+/9pMrIuMKyiC+9UsRjAz
         iB+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqP9Z8/NqVlW5tYXF4tEbzI9lXSXK7J8KhL6GtcD6JRzxQG1bSqvFgd7dQ++GJrpZM+5VEJzLYDdIxOxgWk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/gOcI1WkFtTgXeMp6/iQ3XUQOlo8axJiUSilsSY1h4MZ88jZO
	W3XYfb7I81ZiNYQmHTkAjAeyajF8YSJ+H4QfGUKfd2mFKBHGbcHnuIF5Qt/u5Q5x7/+4j2O4f7e
	PHuDBNpqugik5e6xZ6Ut/w/gIDqUEYFhb6D3B8jP5G3GrmZNjhaUuSeNiEnVzTaK8ECZ6
X-Gm-Gg: AfdE7clB8r9nOAUxPFlVT5i0TuSceizo7Jfz7ywZESS7oXmQljwVE6JKC2OBnj8bGQD
	3IV9a+NZECUVrUxCjS/DJqQwzAsO4Hl5BsX+o41HpFLeHJHE94NQs89B4kWfQwhxLrU4S1lRnAU
	ADikbGQPNPSZ/WsyNHvJQr1/m6xqnIMcN8ujwXzNVYrvH2eyRehMYTD1elzioh2SiaoXsbt1PAb
	CvXKXvSbmWJQ9tGuuWKiPbLEzENMnswMa2eAqP8Vvx5DPf2gqaK/24xJqfi4bkFLUG2sxks1D3x
	qEcmEfcuAuuMXsDP4NGk8lRv3AM4vYyu7+D+PFnWbtP/bO9Fe7ap2xuD4/HXCgEDj2RO21Roew0
	lMj7YbWBuvZ9qwYHCfECMUjXknqFoNhtufn9EFS/qOAtsxm7W3UyqaHvSzit7TdWS6NMehoHE1r
	x/cLqzeKOMb2Af0Q==
X-Received: by 2002:ac8:7d56:0:b0:51c:bc76:dae0 with SMTP id d75a77b69052e-5213e886d34mr137635221cf.57.1784559616003;
        Mon, 20 Jul 2026 08:00:16 -0700 (PDT)
X-Received: by 2002:ac8:7d56:0:b0:51c:bc76:dae0 with SMTP id d75a77b69052e-5213e886d34mr137629191cf.57.1784559610729;
        Mon, 20 Jul 2026 08:00:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e18811sm2376560e87.60.2026.07.20.08.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:00:08 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:00:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Val Packett <val@packett.cool>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
Message-ID: <bjgad2qs6pt2cn5pr353qaelxa3gtpaqfoxjnrwfhwbty4g75f@ngu4ddk5jeyf>
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5e3800 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=KKAkSRfTAAAA:8 a=aTNQOr_AIDaXwWVaGe4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6fXMpXZvWDPLalbNz3CZCLUGKtqPxYzS
X-Proofpoint-ORIG-GUID: 6fXMpXZvWDPLalbNz3CZCLUGKtqPxYzS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfX1jzCRE9HU01j
 mOuojMlOFWsUR/u1eGloTTqZNydwFQHZTWmL99DdSsz65KMm4i4vArLqLldZARlE1n+kPVg7OP3
 VN1apCEooUlfVi77oefSGbNVPj8fz5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfX3FN5GZemS2Ip
 RtA5mFO/2lW1R75GOsvrGRO2/3kaNXVUnHC9uwcKms/HhSSwuRRTivFURFLa2Ie2wnc7JvEG9Nh
 1abNA+oqTtZAW51iCAfJyRz6wXKiqVtAiae6Vyt8wM9nCY12lYkHbLkUOWqsNU3qcIwOkCfRGt+
 fMIIFVD4CS87P3/hJ1xDne0wx5HR8GQLfzNEe3EwqLtU9IhA/t6ZicTxCQ4I1HIulXWvMkPdvJZ
 QAct0fn8t4H4wvmLiOi/v2/xflj77fd3T42R5jZkJeot7KooLvsD7yvCVpU3Q8X6CJZEnOC7NmD
 CAwKIh911wVeQIuYJbdtZX9zwNhrBi0fmbqfGaepIvGnVH9tnl0hsEKVfyKw7TZxTnmWrkqOl2Z
 Deo4XATKhg5YdWtPkd3xVOW+nTZwQDpgLkMS0a13pYPI0B/nHiG6JOksDmCJP5Rwlr+eC9jGgti
 8+g4pw76smmjQh7nN+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200165

On Wed, Jul 01, 2026 at 03:11:47AM +0300, Vladimir Zapolskiy wrote:
> This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.
> 
> The commit causes quite severe problems in runtime due to the introduced
> cyclic clock dependency:
> 
> * dsi@ae9400 platform device and its probe depends on dispcc clocks,
> * the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
> * at this stage DSI PHY PLL cannot be locked to complete driver initialization,
>   the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.
> 
> On RB5 board with no connected display panel on boot I get this error report:
> 
>   DSI PLL(0) lock failed, status=0x00000000
>   PLL(0) lock failed

Why can't it be locked at this stage? Is it underpowered? Or is the code
trying to lock it on some random, unsupported value?

>   dsi0_phy_pll_out_dsiclk already disabled
>   WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
>   ...
>   dsi0_phy_pll_out_dsiclk already unprepared
>   WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
>   ...
>   Tainted: [W]=WARN
> 
> The problem has been already reported and discussed before [1], the original
> commit was done for "preventing potential stability issues" reason, and this
> time fixing a potential issue introduced the actual one unfortunately.
> 
> [1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
