Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3DF470EB1
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056743; cv=none; b=LGU2496/WMXfMz0Af+Lx8m6eWLw+GYbrgRMYE4lEG66LRtUTYcEcA+HPVA11wPlpyu5v/Bilem4lkMZFy/v0X5rK5HglEG4dZE/tR/Fr+dRXJEwi4l0Gi4P+QkxmeZn9OeBI8I8M+d79+SPRFpQM4tGaeCjzO3g9AcnjTSSOhWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056743; c=relaxed/simple;
	bh=JVqqgVO28aOmPNQFjfEieBCzpBdmr1OcYzrDUvDwpXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbg5MGJ6+f6GW+Ke683b6+gBaUNnKQEXhBIonmaOYeu19uvoDuKovuUhlocOar2UZ+4qyQcw0wYcKJz1ckSDAjN8VFBACoaZ1szdARyi2mGUgfGEUOMdtp7kC/qqjodwX+jfJAmGwILwqd4/JInQptnQPwZKrtY4XWVfZnPuAfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3+R9c3p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqJ45ws6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3+R9c3p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqJ45ws6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABlok068846
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6i3uJtqtqkxWQopaYM06xFCbfQzXPOkukAmrYq7gRM=; b=m3+R9c3p8mKNQ2Fm
	TnHVYQc6bq5sU5ClRHH4jmdZZSIG/xJG4f10mNF7pzmVtmWM+4p5n4peOSfNgiMi
	swXmToRF25mh7miP/zG0unML7w4nXRQLxoA027/eguBq3Ph8IBqD/9i7mgDbuUt1
	O5BuIhFj7GYejMD1OavhKepJs180610OnzmoS8WWrMPpE8RIO2R9H32rwo+XprSH
	1rZS6Ll7REscxbvaV/jYyXy/Fb+ZAbyNQi8UI+nYs9jRUaQuWmuCiQR0T6WJahBe
	qfwQhGqZmIyHCnd6GrcwDhj+YWLgPolhP7JsVTLtoBbvVb2MH7tT3K8m4lz0iDq+
	Jgb//g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5pt6s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:38:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f3951a6d76so9129386d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056734; x=1787661534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6i3uJtqtqkxWQopaYM06xFCbfQzXPOkukAmrYq7gRM=;
        b=bqJ45ws60yMinPTvRt3R57N75UC1n94j2Vm70llnx4Vi1wo9f9KrmiqSI7Y1kIKo9G
         CfC6OI4wZVMTbEimFhz7VSV4m4AMRcDduT5M9fvFDsn1Uefu1IssS5JVENSACnXSPOr7
         NBl06mIM9Y5wt+7nXRHUHhBuZI2yRjxQhWSnhQYE09XoZz9hDLwujfdCt0fdI39QxDCS
         P3kt7bi8w71nCHgwRrI6+0z+f0f6HQSh0iAqt8x0f52bdschBgf1/ehdQybzirwOtGjH
         CdBJ3nWsqHHMX/BJ0X/GdfyDqhW/lV+0z/jwqh8JTJT5dVNZFVZOLIwgTEXpJNdrJ+Zx
         xHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056734; x=1787661534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6i3uJtqtqkxWQopaYM06xFCbfQzXPOkukAmrYq7gRM=;
        b=XidcR+/LjyZ2rp4ybmkA/bcvxHG0FVVd3DKS5P2HTRwiWMCXp6ADEP2Sm7Or5/aJ/I
         xdBVHdJV1Hww0iDN7JJb7ogR3zYdbuSERDz9fElx6JRzlEsRqGTk5k0niBuWiHwkf999
         vNIUp4p4SnL7iO6yuyybdnWn6EnBFkNL3bw3E3QcskwZgrYh/z9qfinKrfXQbid6C1Ro
         b10eIlloy6pCbyTqhANGyxPQMQbF19nIhi5qub+AsGlQguclqaQ+ExFbzXSDEiK2X5P4
         qv0cAxHw+MFO9kAZgTfZFzF8EcvJg9alrLJQ1l0PKRGpWb3EC9wLs2xZcAoVq2nf8N3d
         4D3g==
X-Forwarded-Encrypted: i=1; AHgh+RoTBkCpClEhWfymbXa9wS+Dgx9+/28FTJWc7NMrxbAuTIsnTsBHXCqjyrKodUA6SEhcpMVdt3AtH5Q3MoWY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1+mDdArqksi2UTQR5P4ht0GvYwRv7pw+X/v3A2vmyf42YNM8O
	4TqXgEr33r0H+hq+ZOOL3p8zJ7MA0TGJ4eqN0HGRk5ZfmGw/bvs/1a5nKyPKV70u4WEEdt6Ou8I
	vzm7lZIbOn3QeHhWdhynan5x8exxiCsxujfn5Uc1rH7C82DMCsoNyMNExQUV7opqZc+HU
X-Gm-Gg: AR+sD13wEamiNPiP0Hl9u56zx//0m3hw0uYTjYW+tjhAIkXTKdfHRp3hjQHjKt7Fk3/
	8qYNkipYy23azQD/2by/WaEic/jToorA0Me6I0u6wdpiStyW1M72ZGKMrTQxYwKElUxeXmMbbJZ
	ZU2KBWABAv5oXpwR/jiYs7Xf9ry9rTbjv8I3MZ1awY+u3+NUb32t8OXbme7rz6EKdkhU2OOLIIk
	yRjmQVUr3td0/LbqCB7UxpRCiDGsPeGUsenGAC15GtvYTYemguOJOJWXaEbx552Tqhi8+gMBqg0
	bAE+RSST306+67dpJap5OgTUmglS0NbtA9e7DY5rzusVxSnJFx9rA2Av+sICWVdjOnGutdiX7Hb
	hnhgEOjIwJTJvwp3zwXF6vw3Z
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr242361451cf.1.1787056733746;
        Tue, 18 Aug 2026 05:38:53 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr242361131cf.1.1787056733290;
        Tue, 18 Aug 2026 05:38:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d859b274sm1687339a12.25.2026.08.18.05.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:38:52 -0700 (PDT)
Message-ID: <d6c0ac1a-11d0-4179-be33-7a6a4da7ef22@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:38:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Add front
 camera support
To: Danila Tikhonov <danila@mainlining.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>, Vasiliy Doylov <neko@altlinux.org>,
        Achill Gilgenast <achill@achill.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
 <20260805-imx471-v1-4-7be79f539ed8@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260805-imx471-v1-4-7be79f539ed8@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a84525e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=OuZLqq7tAAAA:8 a=3plRurMU6km3PuHKtsYA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=D0XLA9XvdZm18NrgonBM:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: bjiPR-2tYJL1yJI9t25MjHqRiK9bzpI4
X-Proofpoint-ORIG-GUID: bjiPR-2tYJL1yJI9t25MjHqRiK9bzpI4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX/FS+k2SCkC+l
 LLawVXc8XV6+iyKwi0qqiukm+WOT9kqStV3GtW7kou9JiW+n55GspRhnQMo/jdaw4R8wScWwULI
 HnDe6H3hXzQIRqkVe9bWzIUZBfEXqt/Oat39V8IucZS6NzOysX1DNBIqMfEYrNpB0TVb0Lcd/WT
 CcBw+05cMj//blkSw/WADuw6lz7m4rigMW7H5A54J1RsCPXrGwHgfGizJvKGmI8RILHKO60/vp7
 y9Qfz+utXk6GSGb1pa118mIUZHU81cR1e0d5LADl4G36GeeYHCqrQuacU6g6MsisdLxBo875Idx
 XuEbVZSQZBvhCX4VbozjiQfeIWDRVFKYSe1SCxH/TnTz9n7BFfqizx0CIlcaskkaWHq03m44l/R
 ysR+WZiOCnz+qviw0/3HGzS35PNIsdxCI3URgJYl4gUIV2GrcNBdzAX9hk6teTaoLp3eUDzhh/+
 CglNMZb9K1g3iY/91HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXwAyx2a2gMb3J
 MYQ4yQ7Y61xXFH0RLqTWs29iilmxupa+EJ77/ESlGTYZySUkIsB4fyptQkcRlsyy/ker+Zz3KoA
 nKiudUD1J5MXcZl4QRIMvGjtnZEikxk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180093

On 8/5/26 9:54 PM, Danila Tikhonov wrote:
> Add and configure the necessary nodes to enable the front camera
> (Sony IMX471), connected to CSIPHY 0.
> 
> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
> ---

[...]

>  &cci0_i2c0 {
> -	/* D-PHY sony,imx471 (Front) @ 0x1a */
> +	camf_imx471: camera@1a {
> +		compatible = "sony,imx471";
> +		reg = <0x1a>;
> +
> +		vana-supply = <&vreg_camf_vana_2p8>;
> +		vdig-supply = <&vreg_camf_vdig_1p1>;
> +		vif-supply = <&vreg_cam_vio_1p8>;
> +
> +		clocks = <&camcc CAM_CC_MCLK0_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK0_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk0_default>;
> +		pinctrl-names = "default";

Don't you want to also configure the reset pinmux/cfg?

> +
> +		orientation = <0>; /* Front facing */

Please incorporate

https://lore.kernel.org/lkml/20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com/

Konrad
