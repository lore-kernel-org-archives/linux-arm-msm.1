Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC233E49F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659230; cv=none; b=XSvS0BZ9Fk0Mtp9c2zgLt86dpxCcSOX2XWn5mEuBuFhenRjpGva1NHXq2q8GanxRjOsNckMoiIBUevRo69fAV5m+xUJMxK+owNQhcDT3xlT+NDcTyawmPij4/j9GBfrkSyO0IlcJLfl1gFJ2BZZLeL6IUt+USXmM4iNJBxPkBBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659230; c=relaxed/simple;
	bh=Kvyo/4ruf1z6NlxKSqTLceU1JkOluZU/fxnJoG0alZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YK9dl5CWada4R9SMNNhwQrPP1c7s/lk0K+KcYdlFzKvayRDAe2AFAvZvP4p7mgwKvaxnAEh6JTYQM8dy+EBwzvYq9I1e3BeluXVz6TC68TaT9kM+77fIRYU8NGcGXrM9GGyVEeDkxvpiiZONzKdJ4eEHkoRwLkwmErvOcO8KqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/pijcCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D0hbnmsk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/pijcCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D0hbnmsk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH324x2161272
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J1E9XgqDLWxtZv8FcbIWlNPK
	dkn0kvALTOZvp+gJNuo=; b=H/pijcCRc7FErFAE+ghFC+kugdImVvMf+EvaVBuh
	kaJud9n5zlkqN9O4zHod7PvU15Jb9qOxOP3BP6/GAevlFzUA2aMA9GYZX66fjGs2
	RqWKACLHBhU8vqwltXAY/arA2u53QBZQpTw/Fa+yDokoWBn8y5rv9PVFzgY79FnI
	FB617hXmrC0IZwKTq0hNrOtdzz7vjNjiy9rnl72ixXGkPZa4Z2XI7zf025goBFqO
	lBVUeqsK5GaexAmo7DW68ej6L1a1xebzlZbQ1/4/Jswm/L+6zrUvpGexlRac1rIH
	dIJcmtmhIr85iDLqfdvHDGrMZ2UEyiRaZVaJP2D3bNmr5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c41m5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:40:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso123539971cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784659227; x=1785264027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1E9XgqDLWxtZv8FcbIWlNPKdkn0kvALTOZvp+gJNuo=;
        b=D0hbnmskGNu1NL87gAS68fk/MRrsDqWiQWan0EyZbUbbixvbBuwkxCSBBh+jaCnpRj
         uW9eqjdXw697krQDG6hHs3grG5zSJ1NjiaklllGkpdKFj/gAKGB6vn5vycpZIQzYYtt4
         UTO4MYCahvveLFi5i94+74plgxNsqWGGKyaqYCIDH/0VpyLO8shgBRN1Gcj2JIAC8xNz
         wRjzBvpGYUibBXgjsF+0AVtu+Aw5k8k7tVkeA50fQl5EzHDD2nj4mlNC0eqjfkZ+2YS0
         qkuoM2UWTKxo4uMWdg4TR2RITUUcMvTVeVe7sPH7UcCkzybuqC5siT9y6Pz52fyh4NWl
         q2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784659227; x=1785264027;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1E9XgqDLWxtZv8FcbIWlNPKdkn0kvALTOZvp+gJNuo=;
        b=pjnN3bpC5yZi2thhKEo1QU1dXIVUnIUcvdnH5TjFjMRg7ZI0kVqmyT71i1CLAT+HSb
         UeD68IUptBpll7msyd/cF5KjbSv1sEV/LlgAf64Z7TQEfjb8eTCfET3Tf+YujclUqrbw
         QAwgAeYAMB2FPQJQ0D2qZFl++WwDMQBrkWJzcjgAUYfYxXs52WYgVhHjL9r7lS2xW4qc
         IxTt5gLYOJBcPbZFYSSO4dMHJmVFxVhGVYBhhF8x0vCR0vBuWOiOlV/X0olqiA3hbBzq
         cK7vk+wdewvPTZ4Ukt815mkO2qagbwo1qYfjUYM0XUBvuric+/FVp+THcN6Eh5wMbKrE
         Cu4A==
X-Forwarded-Encrypted: i=1; AHgh+RpAObMmQb+rKcALNmwC8irWJJ6TXGfH6oUH0OmGc+QaxH5ftTcJ2wdFXDHU71zLpDAU48jAgqHm0wNbi/yf@vger.kernel.org
X-Gm-Message-State: AOJu0YyYVwGsxgLmYs2uv+/fwTL9e9g5OKDAuv5Rcet0s29WlRU3hhkA
	5W8Yor73a+ofi9Y42DBNsZuzpABMMa+YistGmO1NfE0f7wwljvlOMaTyjqbgkwct0KMSmtVFdjO
	yumLpKJzhMyUv1tgWVn/x0x8i4RSG649Y7Qj+RxSzxfVAztDH7supbN8J0GeQYAG4x0ar
X-Gm-Gg: AfdE7ckPAAMnCgJnBPZFti1FG6dEkW8WsLxUBTneZ/Tw2GdypoWLQdZmAY5S6Sp1VlV
	KWG7GQzu4pRvbe1aQ8xP4UjfQYs5lenyhAauKF/a/p+mL4Nxrc32vGE6Al77xfSmsaovcKcCZEb
	pvUfVDWy1sGz5yigsJErvmJQgCZZCb3ArtYvOg5/FDfEQ4WiGZ84K/goIxXIdfZT0LcGbPh8Zh0
	2XRBSJ0asHW7Q+KFzPVDuTR70nP/2Qlplaq+AVKL2RC1DL1Pep9znDx1LiicSbNE6ClZcJo1DiP
	qFiK763DApae7xseNW8HSgFRp1gn5MpElKYMFcJW5FpJU/2sT0rcQM1kWsfzk8uoqF7J8JzmDXJ
	5+g992BFRNUiBueREVE/pHMBZgJ0lJcRpNUb2F1VL+bdWc4O7l7VlAS3/PjAxGitHCjqBN0NM8T
	T972gBbzf13jbxJw==
X-Received: by 2002:a05:622a:1cc4:b0:51a:8c86:bd3e with SMTP id d75a77b69052e-5213cdcae0cmr189114431cf.59.1784659227603;
        Tue, 21 Jul 2026 11:40:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc4:b0:51a:8c86:bd3e with SMTP id d75a77b69052e-5213cdcae0cmr189113991cf.59.1784659227184;
        Tue, 21 Jul 2026 11:40:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bad3besm73925e87.31.2026.07.21.11.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:40:25 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:40:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/mdss: Enable INT2_GDSC alongside CORE_GDSC
Message-ID: <nwz6ail4qwkmsejow6757nxkutojc2q76tw7lt6oj3h4pncp5f@w6xkgj3bnlmh>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-2-4687866d6cb0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-msm_gdsc2-v1-2-4687866d6cb0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fbd1c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=XCLxqskMeitJ3Y5ba8EA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 3JoO7fXhkIlFecCnMmQDl2gnYQtGJjVK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NiBTYWx0ZWRfX70KA3X4/ZcmD
 pDqUW7WBrzZPGsejD1nJeJtKhjdg+xvv56vkM0HUZsW18OpFnJoVH3U5+Z85rHDlzu3E74xn93h
 pxelJIR9NbqojXQyfOH8M5Z3tdoHL4HsYTXNTGr0hoTNUZ+wBaJP06hPwDI/siz4HBdQR8V1QJ8
 ZpLzIRiK0Pb6fNWG8neMf0Lbp8NeCpJz7P3C3vScFVvqSbQtOiEibRki+yQ0plZLLlSu9Z4WMFq
 RtHSdvDFseNwuCPNEnhJUJtt+cqg8Cdt8GBVX32Lcd5Ba6BApR+Sf2sael+duIMCN4xgDaMweNZ
 V5mIswNc0yeuPhEhKXLIxO8YiWENMbz9qy8TDNJbsH/Uo0o3lAd1Ncc8jRakG94mrFiYUOFo/W0
 AnCKU/Vmvh7fW11XR+nhrQypMIdG/lJn1uKlA3MMcirYhMDBygxVaNPIwjVLfoeECVIopENL2a6
 Zx436b9q03t2UA38b/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NiBTYWx0ZWRfX3Q+++0EpzOsg
 vx/GyTy3sXWU3KLe0kodRLqWjkKgFeA4mXCtotzSyg9R0fQV6EqvsDYcsS+mAG7cs7E/6SD7kgg
 3QB9ug6RwesWmpHFYVM5CdEbYJYKmb4=
X-Proofpoint-GUID: 3JoO7fXhkIlFecCnMmQDl2gnYQtGJjVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210196

On Mon, Jul 20, 2026 at 04:43:54PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8750) and Glymur use two display power domains.
> CORE_GDSC powers the main display hardware while INT2_GDSC powers
> a subset of SSPP blocks (VIG2/VIG3/DMA5/DMA6).
> 
> The MDSS driver currently relies on the default runtime PM handling
> and does not enable the secondary INT2_GDSC. As a result, display
> pipes backed by INT2_GDSC remain inaccessible.
> 
> Attach and manage both power domains explicitly and enable them
> during MDSS runtime PM activation.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 53 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)

Why is it being handled in the MDSS rather than DPU?

> @@ -421,6 +451,27 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
>  	irq_set_chained_handler_and_data(irq, msm_mdss_irq,
>  					 msm_mdss);
>  
> +	/*
> +	 * When two power domains are listed in DT, the core framework does not
> +	 * auto-attach either of them.  Attach and manage both explicitly so
> +	 * that INT2_GDSC (needed for VIG2/VIG3) is enabled alongside the main
> +	 * CORE_GDSC.  Single-domain platforms are unaffected.
> +	 */
> +	if (of_count_phandle_with_args(pdev->dev.of_node, "power-domains",
> +				       "#power-domain-cells") > 1) {
> +		static const char * const mdss_pd_names[] = { "core", "int2" };
> +		static const struct dev_pm_domain_attach_data pd_data = {
> +			.pd_names = mdss_pd_names,
> +			.num_pd_names = ARRAY_SIZE(mdss_pd_names),
> +			.pd_flags = PD_FLAG_NO_DEV_LINK,

Can't you use DL_FLAG_PM_RUNTIME here?

> +		};
> +
> +		ret = devm_pm_domain_attach_list(&pdev->dev, &pd_data,
> +						 &msm_mdss->pd_list);
> +		if (ret < 0)
> +			return ERR_PTR(ret);
> +	}
> +
>  	pm_runtime_enable(&pdev->dev);
>  
>  	return msm_mdss;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
