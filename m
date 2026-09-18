Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DF33F5BE3
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724323; cv=none; b=jkBMDn8eNaraP+Fbhme2ssdnGE99TAL/Asz7+tgJBbN6XFhm1pVCEfunACW54AFOiRGHnTYDhJi0HUSbtzkvINXOHJ6NEQxfTBfosQ3gDB3VLyYYSmqEEERC50LDaPkxq2WE4xk0XSfnXMS7ML8yhWfxktwuOZo0mMB3AkMri7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724323; c=relaxed/simple;
	bh=EKwXtsJj3HIzl22R+w1NmBqtdM4TpOCuLFL3lkWRQDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgNz3Y0M+273Ypr8N258LrfWKE+XtAU0NOZ7wKu6BdznFpZTqKqeYNtxVwCtaBF2QYKs1P0uueYLizDMqZnzfraWTo/xBqL8RCk2AiakYydiXQ7tOmxg0C+ey6swntkN0Pmz//+OX2PCK9raWKHO4NFBInOzg5d7AUqyERmNM34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SlfwPao3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FL2BnvG0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SlfwPao3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FL2BnvG0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I605jx3304882
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7hJ13EQC/53rd2uiF8osBuU7DQ6FdTCoqbb9tdnLzY=; b=SlfwPao3KKFomVRp
	Ngdh9/IfPV5aFYHtUdQZk9l9ouTk9E+NFrIJA7cF3nDbuiIW++tsH0bxz1UUhbUl
	7RL2/QqCLqQKocLpicnbcCyG5ZVHtapuGVZiIPtQORMNNgRgvCXZFzTx0EridiFP
	1pqOANdX8T8apHtH5fTfClHRN/T7IyYCvzWsYzg8NG+gsAQ7yK5916z28+XVgoOP
	M0eslYLMfLMyOhev2KcGThSCaISwiVrbn1hpE0YH5SXs/foSQkCrzeC46oyKqdHe
	90PB4xIG+9fj2optPdX+3F+H5JvUuCVOIiwul84KfqK8uCgazd1tJWjSNHi9LGBp
	8isM5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ktw85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:38:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9392788b3f8so13032985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 02:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789724320; x=1790329120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7hJ13EQC/53rd2uiF8osBuU7DQ6FdTCoqbb9tdnLzY=;
        b=FL2BnvG01eE1P6ZKln4U6mtYz1OIgiyzO6wf6rYdYjYUfwII7pQAhBPczYqVt458Yw
         +OBnCierkGe4oZ6hhCfcuqjI16G+QIEQnPX2zn3Y/+7CvDKi0YWYVRFzVYeu1Z3eZNLl
         xItaV3iG9BwBD7louE4jBxCyvCe0z1/Zn1Ub2k7uhHZ0HFBjR9mji8hSlmW9C/mgYzL6
         cOBqStsO8nBCWzC+6QxX2MAuTFcHOO+PafroLzSUcKhHsNcl2h45hjPDoihaksRFdgLK
         UWPM+b0niSQ9o/AgZZBnGVOLuQRtvXAENKDitqMkVLWLdSg1cJ0SULXkp84C9mKkBuDO
         u0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724320; x=1790329120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7hJ13EQC/53rd2uiF8osBuU7DQ6FdTCoqbb9tdnLzY=;
        b=GhCRwNrRZKwjgtAFb3rFq5vfOVLSlgjfRxhTVhzc8ix6iwLFNjbHVhqN8IyXQdofGA
         U1QRQPU5lP2xdvLxtlzY7x/mNuv18XseS3Uk+SL8mpXMEdg1ABOvM6H0XH94H9/BuphS
         46ANKnDWkDrkBkIHHpKjzRrpu3NWHIvfdhWqPUHHXjKnRduUUpPCTfQ7kZ/msd0Sosvt
         b/7zitXSXSSM21Z2DS9oGHPWEjVXeiELn/jxIIpZp6323Qk7S3nOGYyeeCTjrEAm+H0e
         iPSDb8dcHeR7wk4Nfx28W6NNvgLK/5pFoYt/atP7C1mFrB7ziHNaNhsJyJzryQ0ujyZr
         JxBA==
X-Gm-Message-State: AFuF++k5fMSXSabXe1QWxTKBtaM7DLn4Duup+SmSkug6n71+/Rpjsc55
	wtzSCkFoDOKM8rK8M8w0dtPAJAam07ADgFb+Yegm97PAng6dj5HlJqAE5JLBC2e0zXaspdEOkDJ
	LppqG8K1KD5ZaLqaWSoEFIxxPKODn05zus0CKj9rVS4QedhhXo8UP1jes0K8XSoQdFLtl
X-Gm-Gg: AYBFou0XkxdzLBssL23oe7u8+MrgC4IdpgPPW+iYYIyFQUac4Dzj2TITT4OwPXlQGYm
	rPq4MLsbeGyXSz7Oampk55gko3ADLgTVhErCoXyjSnAO4y7nJIbuIavnQiCUH1s3xi7sCcCAWUa
	fUwJ+uvsTLZun9gVs+hLGSGMn2Hn6PvZLxr7hYnx2oB+k3gMt+/Ey8HbH4WS5kRouppb83nMj8r
	+2uH3uc6c/fRX7rLq70J9ltxXnRGPYXJZ2wR5qbo8cX72ybhEnrVnkrAwFVfH1qx5Mz2NmArh9r
	0iYsxgiFt+RUbPDBbBFaLfx76mW1IOgZo9uzjF4Dvm6lP0x84qqttFopg6iNercK0HChI4iu5Az
	RO4cV8MgddaCTL/6E1tJUlQ==
X-Received: by 2002:a05:620a:19a1:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93be01ed0ccmr169689485a.0.1789724319947;
        Fri, 18 Sep 2026 02:38:39 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93be01ed0ccmr169687385a.0.1789724319508;
        Fri, 18 Sep 2026 02:38:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb0712esm38386266b.17.2026.09.18.02.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:38:38 -0700 (PDT)
Message-ID: <1070a7ca-1636-4b6f-af04-f7bb7829dcbb@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:38:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/48] clk: qcom: gcc-sm6375: Use common clock controller
 probe data
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
 <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-27-25a24e50f82a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-27-25a24e50f82a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMiBTYWx0ZWRfX3vlzDedWjhBh
 PI0gLsLXKNPty8u8HafYY+16NwrjNz7lQtyQawyg8zwpQrbJyOM23LgxvUBdcNoSIXqaj7MDgwd
 UYUcy4G+4dEqcAc9VbHCWdjdNj47YQF5IhSdgJRvFWg01eyPtLzjYH/Dn4EzPlKHMQVlt7yI+2J
 T5d7nPI98nq+nHVKP1cxGlnLrcDrIAO9LP6RZFkutocdB9Tf6CICTZSWkKjqIXydTfCcaV7pZoK
 JRCly0709eJaQ2wKah9oO4Gv5xoBZtiysM9Q6MqQyHWaXBExHuF8Z50k2mIuWzQrr1mxPY2XQQr
 aFJr5CBnH1J95PqxAu3EbqhD67L/CPk6dFHxoR2q0tcVTOIXHMSGwTmKxNirKKPeIKIsJumBArC
 AIi58xb/TnkGpoGIZrpMI+sOTFIQOO3eEr+mPCo/HrM/t8uxbMppQmRrhOw8Xxq4HA/mwcHdF9p
 iUGhYtARUXwp1eEHS0A==
X-Proofpoint-GUID: SUI7_MxY0NMzGd8VAc3ecrmP0ARaIsC1
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad06a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bEL-nVXw9uPW1QxN0uEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMiBTYWx0ZWRfXyyF4Ujf0DfNW
 bTSqXUCoIRNUt4RVVf+7TF6Q4kSAQ4HH6ba4qg3bg8LGgrAd2rT/Xpd2Ed+ME8AvH/oBIFOC59P
 BA9TnkdLIMzGk6wlpzqE6ACCPT8EUjg=
X-Proofpoint-ORIG-GUID: SUI7_MxY0NMzGd8VAc3ecrmP0ARaIsC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180132

On 9/16/26 12:28 PM, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array
> and describe the DFS RCGs through qcom_cc_driver_data.
> 
> Move the configuration of GPLL10, GPLL11, GPLL8 and GPLL9 into the
> clk_regs_configure callback. This preserves the existing ordering of
> enabling the always-on branches before configuring these four PLLs.
> Using the alpha_plls array instead would configure the PLLs before the
> CBCR enables in the common probe path.
> 
> Use qcom_cc_probe() to perform the common initialization instead of
> open-coding it in the driver's probe.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm6375.c | 46 ++++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
> index f47dc2808095..d125243ac6cb 100644
> --- a/drivers/clk/qcom/gcc-sm6375.c
> +++ b/drivers/clk/qcom/gcc-sm6375.c
> @@ -3853,7 +3853,30 @@ static const struct regmap_config gcc_sm6375_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +static const u32 gcc_sm6375_critical_cbcrs[] = {
> +	0x17028, /* GCC_CAMERA_XO_CLK */
> +	0x2b004, /* GCC_CPUSS_GNOC_CLK */
> +	0x1702c, /* GCC_DISP_XO_CLK */
> +};
> +
> +static void gcc_sm6375_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	clk_lucid_pll_configure(&gpll10, regmap, &gpll10_config);
> +	clk_lucid_pll_configure(&gpll11, regmap, &gpll11_config);
> +	clk_lucid_pll_configure(&gpll8, regmap, &gpll8_config);
> +	clk_zonda_pll_configure(&gpll9, regmap, &gpll9_config);

This should use the alpha helpers instead

Konrad
