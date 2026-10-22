Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665115;
	b=f1iTsVrgXbtlqcgvMcFRhIyFsXhKPMBpNSmDAmZna+hcNhEkPpXoMg1WPxbJbTKFg4KR
	 GgQtd/sQlI/iREVqJ3hpq82kUBzZYxRh8EhJkrQTEL3pKMwhiJLVt9+0vjLCQALjbNDa/
	 N+4FLswcfTBl2r40VYccx4bmLuW840I53xtD9OQXPECE4fxs5DkX+YUGaOOG/v04P6PEo
	 L13Ihwo5wvW8rWAZz8g4tj0EOYCEr35iGt52Hf2GKiIMJNCBs8CQIEjq8GYcnO+6oWBLx
	 ch3ILng3f8N42cii5A1OeFs2Zh7YmChNrOeh/aPFU0V/PsyMnphAweIUZlg00VixRoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
	b=O7g/HXoY1QSrTCIS+wzs35Zzq0W9pCfSJiMvoPleo88wOn8c4/3EqgZG6ZEFQM8siCA5
	 hXhhuWGB5d6hAjevhrx2bx6ukxBScXU82k6DB7AzaBjJ9v1/V1RxfvzT+CZy8tBvKCcBC
	 7Up7/SsOaKsnHFhfvnHPUXeeXM2cgOmWW+RTXfjaNAf01lY3iZr8EEKZq9HBxuK/qPX9H
	 gRZoVMb2Bv7SpOgPje0+QTINmFC2Xr3e5w6Lmv84USqq0ID1sdLHkrRxjoyR1OKyoOnF7
	 mkdc1ymYRf1Czzyj9PyrSYVbZtJc148JeURePOLuAyQDrzk4EqiI57EPFf8xHVwoCYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JeJvgDE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiDl1M54;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3A2606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3A2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JeJvgDE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiDl1M54
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xpZG346108
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Awbc1OwBDawvw0PsKGiEj8XS
	YNQmg3T/IWA4GpaDj7U=; b=JeJvgDE9s6U4rKR/pH5cLI7hD/uIVCindZ8qA5xc
	jJOiT7VOPN0GQ+VWDhCj6e/88WnNFR1Rl92DvrBAgWlFQBpl73FJNCh0M+okDzpQ
	K1ClcvpDqpIVNTlccpcoiv88nOIS49DEtk/UofgNIhSuFLq1zgZ4E03v7zvaRmg8
	sVm/zSxqR0uJb6kMsB6j3pqekdqR5HxjzO0M4Gz9vRswjJPpdG4vxHLMdG/mc4hf
	5TDfxikWgcmlasdqmZBmAcz74xh89SZyaeyz9qwFbEwwwgCNFhYubFhMJGZAIFQO
	v2z30xxK402n5rp0cITnqovRdUUrET0BsilUcyUC7Qap2g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93da307-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:31:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so223845085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665113; x=1793269913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
        b=JiDl1M54vOyZMyIyAKuImMW56nmaJ9WPKvtjZ4nk4ZpPGpargDu8nJsXHgE0yPIebC
         BP5uti5dX0C7bjI04CUVXGVP+JNrXCmlzQSK8qfNndOeReymFyhtipLmVlfEVcoYc/a+
         gGt3XOkIsYO6LUCJg2gvdFkLjvc5O8acMxCPxiVACTlPr1vg5k/EPktDiPM125LHF9N9
         A+tS1DOJj+YVYmA1TBbMKxiIPK8rNLHVE/6r2jUBGByO2U0ml/zOaKWCkBDoLmaVnWHj
         Df40dgsb3fIWPcqrDvvSC4VI9dguraRrX+9Suu6ARGTPhSnIqFjhT+qNJfxJix0eQ/iT
         o7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665113; x=1793269913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
        b=SUmddvcgWdcMqnB9VllFjn0jt+YuqelDnR7icgS2xE082ka2s31pK83RgawN1zE9PL
         KcS9DnD1bH1U/6o35h0CJe7eD4wIHhFjV1zBCr/krDnu9PFzkjCChqo2p9KjFmVpTAzq
         EebDjxKm1CyH8V7kclsodBSItnnKhsVQ0CB+t1YtN48w6fEwnnDAKK7+c1qa1X8BlSZV
         34K8tYNlcD2Bm61Si8Vx90QTIRrzkoVz16bql+UVYWYjUNLZd1vT9mplkgPFDzroTMAi
         cfm/unGB54T+Br5nbfdb8Tgsg4QX1PjyvBql9gGi9nMpq+mpJ2KMCRJ60zZem9U7kjEv
         7HVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7oxN0uTBxshbgPn4nweBZplJz2WggYNPE0o49Y4zXC8BJnS+yZjjeSrNDtuYUoLtzqfl3Rjy4+s7nj/Za@vger.kernel.org
X-Gm-Message-State: AFq9FYL6izUXqPijeBN31OXrsRcY2M22iqs/E3uf7+GSVkriBQaQO6sG
	6sJf7853PiW8TG/9bP/wJMc9gNcUrMtxCmQjJvvhfZf49mbDmKvIwgj+oahWC2bm3CyzslrB94z
	kxi1hmnv2dlemUcaWBqOcoeypCTfER6ZKvqFKQ2waMRvVds2MDZiPrdojyfEsSr5vIEvU
X-Gm-Gg: AYBFou165kPcn/ClWU0I2W5p8F4QBQWt5yLpc99Wrc5HI2YeKEFE1S0D/NLuzckKwc3
	GjkElWdX3fiwu4sOnkEtuuaaZ7Tyf8snR0HsrNh1D+Nnp/wOLxmX5KU3Sue8WlDTEVukHJkhM+C
	Mg+Gq2VUq+hn9/KJXkA74W/IbrNm1hAjLkUGZtjNzIUHoO7UjRKoVY/zVM5+pgQJfzfWuVvQYeV
	s1+6RPuf+iSlXfxvkdK77iKHGxwyhxzp4ZS/O2cKkDZpO5zHXDfKdqreOwR9XejPzlJ/+WdsLLM
	Rwpdt2yUvl3B6yaVaTycy4M8ErtFyqVD5Ssoer7d52daZjLgi7+Q6AJwLXFOwpo1qm/LwV4rSxn
	nuuvzsrWpEnnwkN7JXUEwFLciLnOhSuY4rByucSXEdcxhK60pSUlNGKUw6+zjfT7z7BsmzAv06y
	VHWTh5sWcQC04y
X-Received: by 2002:a05:620a:f04:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f57f93a2amr866626785a.50.1792665112680;
        Thu, 22 Oct 2026 03:31:52 -0700 (PDT)
X-Received: by 2002:a05:620a:f04:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f57f93a2amr866623985a.50.1792665112215;
        Thu, 22 Oct 2026 03:31:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f55402csm6899281fa.13.2026.10.22.03.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:31:50 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:31:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Karthik S <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/5] arm64: dts: qcom: shikra-iqs: Add LT9611UXD HDMI
 audio overlay
Message-ID: <b7kzeykjxoiuf2m4klkga7rnvtri5vs6z7qexe2uskrcpsh65s@dpkzcc4ykkiu>
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
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
In-Reply-To: <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX10x5kWPjQD3d
 B3k+eq9o7uiXWuWzJird2USQgXdHzz9mAdIKKmyOeikJRSt68WU0z+zEuo+8hiXeqr2cVwIi1ZG
 7QPVdFfZhI3MYAMKTCq3e23WkDaJ2jU=
X-Proofpoint-ORIG-GUID: QkTzC2Of65SkRpl7_7EF79WRMUHz_y7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX5dpbLVRNU3TH
 eLjrKo4mFgP7uUMJvFsVxOa1aPSmTFMgLH/g1XqIy3GQZSy+RnuVX0UX4oPJX8XV+WMSWnogTQd
 ItCrvl1ZPjQN5xRvVC2rCPGVoj3oWuEUCWTqP1QF8Xc20fbCVdyEeakCRFnauCIOP/nIFrFXMRA
 UzAJky4OGtdEEXQsDYc5/O2ibKROx6PpgzHMam1GlBLKMVAXM0qq0dnGAd6NEN/gY+MRT+M4j5E
 9ufrewT1lbbQnLk7ZwnuXakXcwYUjcwt5bHuigO0YL75GALhgAQ2ruWAxtQ3PV7m8VgxCVYzs/r
 DrVugKEFCXNTtZ9PLovbKF91SjLt/BznuKFjq8u7sNVXW1UXDUJnspzaeVnhZsenWbhj8OnuvSi
 pfMol1KPqwIOOpM60zQZwYdn/43LqDhfdvgpwWvfSwrgjD8yCf6BDh9h5Hkx5V+p0NAZn0k92p2
 MN/vSjOMHZUCAvmLHlw==
X-Proofpoint-GUID: QkTzC2Of65SkRpl7_7EF79WRMUHz_y7i
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9e619 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=hDuEe94TteisESDp3jcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

On Thu, Oct 22, 2026 at 03:13:10PM +0530, Karthik S wrote:
> Add a device tree overlay for Shikra IQS EVK boards that use the
> LT9611UXD HDMI bridge as an I2S audio codec instead of the MAX98091.
> 
> The overlay reconfigures the sound card compatible to
> qcom,shikra-iqs-lt9611uxd-sndcard, overrides the primary I2S playback
> codec to LT9611UXD, disables the capture DAI link, and disables the
> MAX98091 codec node.
> 
> Add a node label to the sound node in shikra-iqs-evk.dts to allow the
> overlay to reference it, and wire up the new composite DTB in the
> Makefile.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 +++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   |  2 +-
>  .../dts/qcom/shikra-iqs-lt9611uxd-evk.dtso    | 36 +++++++++++++++++++
>  3 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..127c5c345eff 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,6 +339,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +
> +shikra-iqs-lt9611uxd-evk-dtbs		:= shikra-iqs-evk.dtb shikra-iqs-lt9611uxd-evk.dtbo
> +

What does this overlay mean from the hardware point of view? Is it some
hardware variant that requires reconfiguration by soldering? By changing
the jumper? Can one use max98091 and HDMI audio in parallel?

> +
> +/* Board subtype 0: LT9611UXD as I2S audio codec, no MAX98091 */
> +
> +&lt9611uxd {
> +	#sound-dai-cells = <1>;
> +};

This should be a part of the base DT.

> +
> +&sound {
> +	compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
> +	model = "shikra-iqs-lt9611uxd-evk";
> +	audio-routing = "VA DMIC0", "vdd-micb",
> +			"VA DMIC1", "vdd-micb",
> +			"VA DMIC2", "vdd-micb",
> +			"VA DMIC3", "vdd-micb";
> +
> +	pri-i2s-playback-dai-link {
> +		codec {
> +			sound-dai = <&lt9611uxd 0>;
> +		};
> +	};
> +
> +	pri-i2s-capture-dai-link {
> +		status = "disabled";
> +	};
> +};
> +
> +&max98091 {
> +	status = "disabled";
> +};

Keep the nodes sorted.

-- 
With best wishes
Dmitry
