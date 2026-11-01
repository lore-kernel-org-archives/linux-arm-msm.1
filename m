Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793502920;
	b=bpTuIdyS8C3PRKCmZQAr7XP5wOIpHglRMzdkeItUQs3dNd0/1h6sEk6Lw+5inwlYvy3B
	 4Z9fivHmQdsMUCYUYXBOb0VrG6ccMwbINDfZBeH7gmpiV0iBqDIuA+kYjbrrp6E1YIKfr
	 EtskQfPZsOCl3LL5bAWhm5rPqejYk/OiGzPIGbESAj8/ub8ixjDBlDSm8v7UNxkIU4KEm
	 mURgmVNshPI1OtJQsF6HW0FPKz91mt/rm+kDGwZfp9Ftx7viTuFxhINpXI+ZvJrFX+hu7
	 T3bJU85sZRq3MjcOkOxSz5e2jeS0SH7CVVk/UkLr4al7HxWajvnTWhkm3QKzNEiV7yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793502920;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s3S2uYM8/USFcnTV7atLvovkptZrXT0Iz5U3uf62RuE=;
	b=GJT7S7/sjst7Q4K7YgGp+6itFB2Uaowp3n4A1WIBNxVAembGzkAktBNA9ma6MWFLwVc/
	 zmH6vN/HrEZn+g6M9Zbp+wzfN0SYfbKCtqMaJMEs4H3xw3rbS+WUBiuDZpSvLTcCaXbsn
	 vpn1RG0KUvW5P5jvA4KHtT4SmvNbqc6MXOUnq4ssh1arYzfySofxQEj9TkOFwdx1rgYi9
	 HUt4HyUFDTv33DGtmzV8ISd1dEJTJKltxl0nTib39S8Vyajr1qGAMEkXzRChar2mMYwHI
	 H+0FHXJCOkKOf+yofuXrwjDqLBEyiIIHu6szX3/mdzmh/ZuYu3qT7ViXGbSMOkuOF/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOmd7CVG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fqGTlen5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E4606A335
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 03:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8E4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOmd7CVG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fqGTlen5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1201kx3779863
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 03:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s3S2uYM8/USFcnTV7atLvovk
	ptZrXT0Iz5U3uf62RuE=; b=OOmd7CVGBLeCB57Sp/8LeC+QukumjuXIMW6CxhyP
	k62nAyIiB1avXyDa/diLV8cPxscWiA0YPSmf3gdqWUASBcYLjrC8PfI3HvRuNCT8
	NuSiYBD7mljiSEfx67mErG8vCNQK4Zt2gfgnJK1WA8J911MLZbpUxPojXsHGn1WF
	00LmBeRjDcNcWbsnQ4amtLQsljh1Yce0LaKkBIidyxyuGalsRvUzhmxAYhyKj8+D
	a21QeDjwZhCxKr5FdlOfervxsMdut/MqdsxNNYOoXwmaqW5bcDcm73B610z8fVAu
	uvzQtxpaTmoVQYG0YkNg115Ul2sk+4L3s0AC8SCIKPb3Zg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkjy46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 03:15:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so2761091eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793502918; x=1794107718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3S2uYM8/USFcnTV7atLvovkptZrXT0Iz5U3uf62RuE=;
        b=fqGTlen5VdN2K27lwug1gGT3F/wbiR2ysoYEVC5aXApzv6WFy1QUTqowY87B57XEGb
         P1d1ocp4OKZiUmMz52/K9K5zwDIskqxYA1fsnVnYBqLedp8wQJNCKgqp2Ezhce0gNBh3
         kRDBRhCEn+CihLCF4PJVJQl7sZPcf8CGKjyzNBZ25Ftr7GwRuQ9OaxxW+pV+OTMhZllq
         17G1e1pvNaC3dvxZBXUYdo/kmz3zf71YrDME+3cv7xyMHecJpZBeZ8bLcai9PTHD52jq
         8zHw0QXwGLbErpdYbIJ5QUajWH/q9wYi2S/NExmf5U24R++XGmdurDtPrEiYVoZ3lBSp
         TKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793502918; x=1794107718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3S2uYM8/USFcnTV7atLvovkptZrXT0Iz5U3uf62RuE=;
        b=GP1cw6Mg+5WMxM09XBUxeVRvX00wr1rCMy6uueGb8gDu/F2qEFKbjlixGLKF0vneTy
         aRHl/WsC5puobwCWdf36DBfWYDI5lYVkpX2FCIpquNDrTQC0Oj3YyYmBbDBFnHcXuZCC
         VQVQayQCuW6LEvQko8SiMuySAreF8uWC59aNuvN8YP/GnAsdVvvES4xtYd2YFvVAvmgw
         8ipUeRSuFtazvE6cgCf4akJshSmp6ktyPWZKshmV7d/dOtr3gTnCcWlZzS98O5pfE31E
         lSSBSvTH85Y43JD0YvSnNnpy2Ph8H8TP1CeBZ22TddJxUxsmebPfpLnRx1LM1BLIy6FT
         XbHA==
X-Forwarded-Encrypted: i=1; AKwUvByA3p+5JsCzXR8x5vE+4ekaQpNX+XQUEeCmyfC/yT+M0XGzmsYDODykFqH/A/XhicJXe1rV3HZrTSRf6NOw@vger.kernel.org
X-Gm-Message-State: APuU4Z+ly+YN2+gCyVVStxtTkqX1W2XJf1NT1560rj3ZXpDdCYYCUgGO
	mbU11Mpx5KjYVFmBxrIbTLdapLMzf7Ax89+CDbI48n/w48XIBYKs9JPHiJkswCM14HKA705amPR
	9lhlbnxN6jLJnbfI9jk8KPmjMkFkHoxld7u4046UiSLnNPYgASzspTLhDjVWvum0oWw+CvK4l18
	83z94=
X-Gm-Gg: AYBFou2RQ00TEwZbTCLNadMDYlzE+i3DSw1hlB6VfU3/+DnfBPIW6oiwvRed0WaJ/p1
	7duegoV7UpGQKObwA1Oy5o4q2rMmJboYI4hqVhD4trq/huz2OC8zdhc61JoX/rP8ZlKIRW4vuyE
	+iWkhVgBLaagrcbkUJJLS+fR7iBzkwPOa62V7rrNbN/ANcdqBREKmMU7J+Kk6Bp10iOXoKH/p9T
	jidyQQnhSibHFpJZQ5D6xo/w4YNXzZtBGFIJC8bHJPTJuHUUP3PEeIvk73Hl79aSlfS0d3HlcDS
	T5T3IWwWzPImeq3f0MoECREcPI6NqhTUwk5fkNsgnFwnZwWFcvLQ8eIuNCtjGyPA4hlzDeb90Q1
	AaNBq3XRVP/8NuSyPV2BLZybTkC8KTTHTTwA4W0l67QoPx9gbz6EyMjHhkdNexX0MABtHiaz2iy
	ps81o2iH9X0qpZSg==
X-Received: by 2002:a05:7301:618b:20b0:35f:2858:aa4b with SMTP id 5a478bee46e88-36a4241b070mr8860827eec.30.1793502917693;
        Sat, 31 Oct 2026 20:15:17 -0700 (PDT)
X-Received: by 2002:a05:7301:618b:20b0:35f:2858:aa4b with SMTP id 5a478bee46e88-36a4241b070mr8860761eec.30.1793502916226;
        Sat, 31 Oct 2026 20:15:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm21725563eec.6.2026.10.31.20.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 20:15:15 -0700 (PDT)
Date: Sun, 1 Nov 2026 11:15:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Reuse IIO device ID for
 ADC_TM auxiliary device
Message-ID: <auauv3zAKPpYVxXl@QCOM-aGQu4IUr3Y>
References: <20261028-fix-adc5-tm-v1-1-0018aabc06c5@oss.qualcomm.com>
 <20261101020047.66034613@jic23-hlaptop>
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
In-Reply-To: <20261101020047.66034613@jic23-hlaptop>
X-Proofpoint-GUID: wquDwpNxflwc55otarWcgVUrAOPwydrA
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae6aec6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=icylPTNulc19Rdkzs_gA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAxMiBTYWx0ZWRfXxMnbjlGcHN1Q
 7hH6jwJ/0Q4UZdatrl30/502lkYuQpEH71z2DbHZ92mTux+ZZVK81W6TWiQ2GSk8gv94BDdwzjS
 smGsHlgVK9QIahG6ngaOAe1gV09z5d0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAxMiBTYWx0ZWRfX5yjVHOYc5RjE
 y5CilQ7j59WiZMaOYyOgexPSiMHPxM1lR5nrfypeeuqNUZqPSknLKxp4rSiZQY1mbspMGSO5gG0
 pBBxu6Fi1/7YILtSL/7KoMyWguos/3nosDp0bB5xP0wtJbOGzY5FpkqhErMSPS7Bl0f1OAW0LB9
 pAmZsa9ZcJzO7bb3tkRLtViuTStGT1u00P55CaTCYyViGb6IM4r3ndihiQSb5DlUAjRnBh+1Kn8
 ZrNIsSRKdL5tObNFF+aXUYcXOfbJXuWQOBp7+n6B8yxg8+V7aQQwc/DaDxZjFUZniF/5K/rF2Qb
 7uuOTBzPoXV0zRIlmfd3s7lJ3cMBeHStHL2eFifV1fyzwQPRwqmrkSdNq2hvE1gZKjqzVV9i0N3
 Xo4GH3KINXQkkUcezdBnPTyd1aHTpyCWg63whcW/3Pu3u39kVgOVe30dQCOzUuXIHpeTN/JiVqa
 6cPy/IvGx0gOrCyQTlw==
X-Proofpoint-ORIG-GUID: wquDwpNxflwc55otarWcgVUrAOPwydrA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611010012

On Sun, Nov 01, 2026 at 02:00:47AM +0000, Jonathan Cameron wrote:
> On Wed, 28 Oct 2026 15:09:47 +0100
> Loic Poulain <loic.poulain@oss.qualcomm.com> wrote:
> 
> Hi Loic,
> 
> > A recent fix in ADC5 Gen3 driver allocates a dedicated auxiliary-device
> > ID through an IDA to ensure that ADC_TM auxiliary devices receive unique
> > names on the auxiliary bus.
> When talking about another patch I'd refer to it by name and ideally
> also add a Link tag to the lore.kernel.org for it to the tags block.
> I think you mean:
> 
> iio: adc: qcom-spmi-adc5-gen3: Allocate unique ADC_TM aux device IDs
> Link: https://lore.kernel.org/all/20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com/
> 
> > 
> > However, each ADC instance is already assigned a unique IIO device ID.
> > Reuse that existing identifier when registering the ADC_TM auxiliary
> > device instead of maintaining a separate IDA solely for auxiliary device
> > naming.
> > 
> > This removes the custom ID allocation and release handling while
> > preserving unique auxiliary device names across multiple ADC instances.
> 
> > 
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> 
> The fix hasn't gone upstream yet (assuming it is the patch I think
> it is!).  Would it be better to just squash this onto that patch
> and avoid having to care about a version of the intermediate code?
> 
> +CC Shawn. 

Thanks for looping me, Jonathan!

I agree with you on the squashing. I just sent you the squashed version
(with Loic being author) [1], so that you can just replace the one in
your queue.

Shawn

[1] https://lore.kernel.org/all/20261101030902.1387122-1-shengchao.guo@oss.qualcomm.com/
