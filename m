Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483274;
	b=M8l5Og67vNlrPoszDP87nTNQ6MsUbmhR4iHhPNpzzc0H/nGZCSGTGvn3+Waj2WjeLJJS
	 Bfl0cIgsR0Mwwp6Cl4oQwKtT7L/skBr6JvuXFOgp13zez+tvnQrHQDm/JjY+YlFFVjq3y
	 KxWZiXOp27IAleloIeDqbA7Alj2JGFYL20MUhGHdfRVmpjrT96HIEgPTvzvDo7m+IlrM7
	 n6hhI2naLe5sGKTGJ8/CIE4wpiR3bXbWfUfrH1JEKu8VA4paqIuQQw/HEn30F8V0jBGtF
	 Kbb2Xa/wVCT7p20X+MrrEshf7rfmqsLvr3qlQEQbc3Zmu0I3Lc3+x59Tt9DhaTOb8MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UqYmn+dWGZ+bizn6nanBskc0M3ILH51untQXz8qg9Lw=;
	b=lrpDMS7G6qpanCAP9X1kdqv9VDAYV6jtQHnnMKgtbEpv0ulc9jhwMFr7PIh32NSuB4Ut
	 gw9UScuefu4hOm5pth5z0f1G5cTpa7+bQco4Qv6W9pSzjF6W1BH37RspMDgVwMSKp7Zab
	 36rUecpu8VjfZ+zAlDiEpypOTk1Dl3oIFGtRD2enwiWlGN7usRezw1N7wX/F4r+TVeYQX
	 gG3w8azl2yR5wRpDrkK4kFx3DYvprucfH30GWAJyU88nsbSjuXs00ch15EjRcAU78gxlw
	 WTB8vBD08ohLdyZODGXJYfRMjNbbY83VkRUGZt5sGTQy27IptLYd8Iv23IpfX0qexhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2SSwTqG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjBrbGBJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E833606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E833606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2SSwTqG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjBrbGBJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFxXD2000772
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UqYmn+dWGZ+bizn6nanBskc0
	M3ILH51untQXz8qg9Lw=; b=M2SSwTqGeuA0H/yPvVtef+Mp8xkHwwFekiHn0kBD
	IXkY8io9I7OOYrQNJc9veFLHQb/MO5gVqbJ5k0W/pdOnBUfT/j1tjPj2FdmaR+X6
	VvCxH97ZunhjVXdQFnvieF2sLRVVX/hTfOBcMkH3nuOVxn4QgzIJt1xrERdxXyOs
	03MMKpdvcPhhoWPCgvmJS4h8+xe0kGrSxOJ+Dix7JzCr/EMKLx78H0/zKj8ugeEb
	yCzE9/SlZ2sSogLTZlqalPlDO1WmzEuIcurm/8MOhU4MpCXTNVh6WJtR81AWSksU
	PBQuRM6eem+E2fV3GqzAYiYK4JgrlP9tWYQs3mYgU2zMVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m99x2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:47:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so307008785a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483272; x=1794088072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UqYmn+dWGZ+bizn6nanBskc0M3ILH51untQXz8qg9Lw=;
        b=LjBrbGBJE+MS6r5K3/JcH4yrxJaBRxVBEF0oxUcYe8GCIkxb45rQ6JHlhkFKjZDL5o
         ytEuLWQ/ZHGpcQr/j7ymTfjwMM4pIwSnoTFTpfQW/76wPKTUC0OpByUpG9NPNfUPF1u0
         5fLQXFlBpDTrzi6azjEJxe84rtkOq6Vq1KttsoMzvCueRizoHxV9F6sASUJK9aTFgmlI
         sO6/WsOO1Al7I0qpkDfD0bExraem0jyUJdZITNaN/AHgCfz065F9gTab/U3T7hYVA2RE
         NqtY2gxowlCDfOPVHKZhqSo6WyCrZqVByrQN4Fkbo1ROqenHPwMUlwbeh7LMmDITGgVu
         /qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483272; x=1794088072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqYmn+dWGZ+bizn6nanBskc0M3ILH51untQXz8qg9Lw=;
        b=b0xqPPQ2yCnTgnC9APSWRoaMEyrkzHbkpX7IAhMeottxkm7vv6us7mizPSoAF7gROz
         t7FV9jgKKls8ks46QGe9PuQDfF9UTQ/uLUClyot5+FjHBfoIHjvez978QtNaAfinGEs9
         RwDyRwahEOFCsHkDIVTnBIRzBlj1WDOnR8D/skLDkcO2vhvZWuZGHTtGmSq6r5xyBeTG
         f8UrbAJgl5wpq0LqxyNfg1OOYk1H4NSj+EIKv+oCWTGxEyo5rzLxur0KCj5Hp76LZHDm
         VSO1eLPGo1XUSv+zUsb+xMYvd4vX+I77RLp2r0w5agOOSU44p4T6PVjhNhHvnt8FO1w2
         6FmQ==
X-Gm-Message-State: AFq9FYLMWkQiBDNPAXq+tNOLHJbQjIalQ1aOlZELW4k/ux2yKyqS3SOq
	ieWz3TN4wIH4MaImqwI2orP4k+Wnj9sabJgKZ3LIpz0C9pdrlZ5lIfmNT/pfp68h41M6oZ403K2
	Ou5H6svzq8mWcpAEjmX1X+GtolFTOI/oIAf/jDRvdrMqft2CR/Xy/b3HS5K8QqXy235q7
X-Gm-Gg: AYBFou2OPrqOL01wXlaqBd5r1VtxS8bu9+GeM15mkTi4N4cornosbttHD5U11qvQ9sP
	fgYHc4oMu5LS66kctA/ET07LOwClf0HiWXB5W2+UZ3Xoqg8ZWjaxAHjJ/srL1gkRBpNvNtuhD3w
	r/sz2LGn4tdTBk4yI7S/xqm3DtdDvcYBNZpdTUpdyjx9Eg0Wy57rmvOv98mXBbYV2O7MfRwEQcD
	TUTbUKMWycNFe08EwFOKosf32MhVa7QQAQMyFeYF1txl0dgw6bw6NMaNz2hUPWSSrgy82MjXL4b
	RQxq7t71GpXwDYPBHryX0qw00xUTCWk2z5U7wmYb8XPTzwUbmwxZUKdPrpJvbcriIBJS1boQQhb
	87iUemEmiIA8LOhHPdrXobYuwLCoTZ/ZzEm7qmcPBCtFiW9kson80F1gKsc4qZdnvhNVcuVQ7Ro
	8b2p4+xgm/CAXB29gkEdPWeMjmGGfLYShLJKcQx81cUQmVznKRYN8XA7apm9K7hQ==
X-Received: by 2002:a05:620a:28c7:b0:93b:d7a3:45cc with SMTP id af79cd13be357-9442178def2mr985862885a.53.1793483271679;
        Sat, 31 Oct 2026 14:47:51 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:93b:d7a3:45cc with SMTP id af79cd13be357-9442178def2mr985860485a.53.1793483271221;
        Sat, 31 Oct 2026 14:47:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd72sm758554e87.1.2026.10.31.14.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:47:48 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:47:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/msm/mdss: reset all block resets described in
 DT
Message-ID: <odog4t5j3y7j4tatqsiywfj27iufeazkzp3vtfvzce2knct25n@ephs3ngmt2i6>
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029123238.29877-3-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-ORIG-GUID: Idbnfz7VIpJSBzas3dhLB2Z0jmYPUWsK
X-Proofpoint-GUID: Idbnfz7VIpJSBzas3dhLB2Z0jmYPUWsK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfXyf4m8x3fVJ0u
 7rGPChVr27HC2D6v0OwrXgj6DoQfAkAn+3e72UI3ksGcAAd1FcLfCsiowfTrPGh9LQHTkYvsqJE
 Ck5HXPpfPgl+2OGhSMLWxgmGVk+msRioACd/3cvA6dEOLCxY1FKxoNf+pBmV6rIhRjTqNfGeD85
 009W41NydBPKC91gPvCDoy0V0mjkeXm+mQbN24jC5VnwDbD9vs0j2bm/G0AViy6Hr1VbBtIl2r1
 SYLmZKRtPN/A1EE+LSlnVyW74/MXDNsG51Eq5aYrLNLSr7dhzQlmIiey5PZuyxDQsfEOncYEWtK
 PeAQw/R68hbCJ6Z80oQt4pvQtffgEsCaJ2HURnU84lioxwhTLdln8dwHhgUy1S6RBWIUjzv4lSy
 O3Bdo5HSgwhN5KTecdR0tur4H8enMbUik3AFg+ipX25smnIgcpiNojzfY6ZK/giTIUA9qiWfZ0x
 ba8iOj+QsEP2jlhSFvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfXy67dADS3ySkA
 1Dtz5kgvsi2i+K+tDZL314dJGi7oYnpVnAAZsxFEQNFNvqwHWACNU+F1UA4oh0BUL66new+22mH
 5l/WO65wuTIO9cD2q4oxJ9fvJJ+7leQ=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae66208 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=XGdKMLjMlLx_IEht72YA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310086

On Thu, Oct 29, 2026 at 08:32:37PM +0800, Qianhui Xu wrote:
> msm_mdss_reset() acquires only the first reset listed in the MDSS
> device node.  Platforms can describe additional MDSS block resets: the
> SM8750 display clock controller provides resets for the MDSS core INT2
> interrupt controller and for the MDSS RSC, which can be left out of
> reset together with the MDSS core when the bootloader hands over with
> the display block still running.
> 
> Switch to the reset control array API so that every reset listed in the
> device node is asserted and released as one group.  Devices without a
> reset in DT are unaffected, and for devices describing a single reset
> the assert/deassert sequence is unchanged.
> 
> The resets are driven from the display driver rather than from the
> display clock controller: the clock controller supplies the MDSS clocks
> and power domain, so it probes first and has already programmed its
> PLLs when MDSS probes.  The block resets do not touch the PLL registers
> and no display pipeline is running yet, so the PLL configuration
> survives the reset.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 9087c4b290..59343987bc 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -306,11 +306,22 @@ static void msm_mdss_destroy(struct msm_mdss *msm_mdss)
>  	irq_set_chained_handler_and_data(irq, NULL, NULL);
>  }
>  
> +/*
> + * The MDSS block resets are driven from the display driver, not from the
> + * display clock controller: the clock controller supplies the MDSS clocks
> + * and power domain, so it probes first and has already programmed its PLLs
> + * when MDSS probes.  The block resets do not touch the PLL registers and no
> + * display pipeline is running yet, so the PLL configuration survives the
> + * reset and nothing visible can glitch.  Bootloaders that hand over with
> + * the display block still running (PLLs locked, blocks out of reset) are
> + * returned to a known-zero state before any display hardware is programmed.
> + */

The comment should go away. AI agents like to insert lengthy comments.
they are useless.

>  static int msm_mdss_reset(struct device *dev)
>  {
>  	struct reset_control *reset;
>  
> -	reset = reset_control_get_optional_exclusive(dev, NULL);
> +	reset = devm_reset_control_array_get(dev,
> +					     RESET_CONTROL_OPTIONAL_EXCLUSIVE);
>  	if (!reset) {
>  		/* Optional reset not specified */
>  		return 0;
> @@ -327,8 +338,6 @@ static int msm_mdss_reset(struct device *dev)
>  	msleep(20);
>  	reset_control_deassert(reset);
>  
> -	reset_control_put(reset);
> -
>  	return 0;
>  }
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
