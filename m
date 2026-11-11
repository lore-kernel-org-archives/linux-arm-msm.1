Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403080;
	b=ngDl0OQoG7tZ2uFqzI1QmHqSlj9m3nsOHdR3H9Sqgk3yMSy+O5YLzsYYqjTDsD3X44dK
	 UNfizf9FDF7jvFvTCaD4R+zuYXDw2F3AFDrKQJnOvndsxv4VUAc18wU6WcCb2B5FNakZO
	 3vo4zijgiBtKtxjaH4baMFli75NTYbEhbbEPCxz/hTaN3gx+7qBIktDiZfMNRVpYuPpb+
	 ReTB33b4JAtW9qnclVSMsvshibfAzhF+zRvB41Yk85P4cAWXb6c5MhMNX36CraVpYj+9J
	 ruxGngGc9jYOh1D/2mJHROmebNh018kfiRgil6KZ7hNv5cqSpqd26XbXL2ZfECmKbnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
	b=bUHsIIh4taC+YidagGnCSV42apss+d9CQlOLLgrRX8uDE0UgolVeUucg5hT7ph3VwkAG
	 B+jWkHz9hjx1N9MsmXvUdMzRmaiOpCWtElKtJ5mEJC0sE0atFieVDcXoAfYvChAeVHFUv
	 4A0rLGlFQJ/9WxEIhj7r8SZUHFUst1tCcuopxwP2jNC9uC2yjXmp90KqfT66lPI2T9LaJ
	 Xkrpd9Tw2MuooaFvpMmX5IzNKYWYXDMyyX/nAYU/JVxTETvf6K3oXg7uGYoVMbJ3sQoj9
	 18TCpAEIujdArJFN3Fzt2RpWnc7Hupq1mnXcynISEfQRhyJ1uoYeA54qP4kcX3v4D1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LG7PUXik;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aURViFfN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F7606A33B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7F7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LG7PUXik;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aURViFfN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZGRg2975634
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rJPCHE8Tetc6T6Zx5wds0tJA
	NIOD/gQ8/VVy3tOE6x0=; b=LG7PUXikLDPaAgezLLNNCNrPtW9zK3iCE1T8LagM
	7/oWUez+nMSLKYJmTZQ3FdCiE3ePS+DmXvuiGd3u6r0P8YbBRo4arqZJNZTEsBGl
	UUl5Fe5A4QAztxLviTgE4KNPdqI5sEi7uIo4uuw8hG0cI/Ohmtq6QGUl3H9wCGLx
	fF57U2cBuYVm2Mh2neOr7SChJFOYWZXVBx+eVkxplTHMvPei1FeLbYuoV9PT4Pma
	9xJdO3jmhhgKvevKQvDYoSwvz8KCl0kYk2zHzRgOEQybZ3uUX33VeLIOtJxlJWZ5
	TqQv2hwKv+TEm+zhmTPtsZgM7YypuzmwWyIGzC5wkRucQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cbxnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:17:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso579732185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403078; x=1795007878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
        b=aURViFfNAZtsojK4Qbwlbj9yjKG+uxQ1/mEDFfHrWjD1x30roFfnbCeH6p8lQXRT+V
         2OTYV76EPkLjrOiLt5F/uIs0biUy5ZHNzH4RPZOayvgzDKB9Nbb4SBRXtFxNUJyD61Y6
         rxRzdlONfFwFqGweDas4bR9SbkUmRRrNU9n4733FlYu09mig1H1d6yEmrlRiGUglrKJX
         vszvUg66TexC/rEegClhxYwSi/kjj7OaS9zStlPax3chbq78R7XYL5r3dxE31NgWILuZ
         GIduPZd3HXIMs7Du1UIcp0LwrYPxsK0wNKvMjAHnlt3XFOxvSCYqwKuTlN5tMpxQd3Sy
         C7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403078; x=1795007878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
        b=syPjkRAv8cjYlCf5WyymBbuBHkut52MuPlzHhdbPN8KWxzxP/Ff6/CYCnxnFwvf4PF
         HSjEj+XhIo/TB4CenV6AWEYTIkHgYbfwc7CMXPjP1xj9AzM7kubs9GbL9TqxfLUAcOR1
         SnnUEaKRnroWr981chSIu408HZe33E72ByM6/oN7IIdiu8iTpt2Zr4TzobXFYgToG8pV
         f/HsqEWHSbEgrBCx46aPnoV4H+RUff/qbDbj157p48R5WIuX3/JOFiv65xmaJs/3w6+u
         3U2veg4VylbXuh5PPciFx0vuU357joHDv0uEv27VqrYcC8KSZSpOJLUnErUARrjRHmq0
         RkTA==
X-Forwarded-Encrypted: i=1; AL+hErH9nyF2BmyxPwLGdRSIobLgc3NT6aCw38j94HVACcYsd1etjTnwd+nkHAkXljBV60FiBfuqR1W8kTV1qFFd@vger.kernel.org
X-Gm-Message-State: APuU4Z9sCL14M0GlA4lYVKehsfe5T7UpFGguWP84GDe6DmnSkpeDMFDZ
	YKTnJvmigQb3GhkCcCwS+Z6XEFO27YfJjYFjRd76CEX+jQqCw0Rn1J3qQjhHYeTTN5QQCtphMZu
	p4iUozJzfxNI3mqE0etyUMHm1HnmWnieItHDof6ylj85aQHBRKAJ8NhwiS/g8sRa1ZoGM
X-Gm-Gg: AYBFou38Xx5DebzkqX6fP1WMzuyC6n9qql3W8ze0KpiVDSPaNg1vqOhFn/2jDubzI+y
	pJ7MX3KJflmmktDq4Lq6wKxi2euPseCpEim5RrZke6Pk+ocHHWYZ++B/8D0AM2U25CH1u9zrbOp
	2tOeTreS5R3rP8g3dlsJBvCbImUC67HlZg+V3sN4Vhf3eWS3eBmRODDAWGbIpUZGk7WK8WqYH0o
	XKR46X4wwPolW1hzmV0X1TJbqtue24YxzqjaZ2gAgKRcOBAithJ4erzL/L429G2T7Pd56jTJdSj
	kleSC1RmCIR5JrqsjdviD1SFkLorybk8d7MXJ6DtgdWFHzL3ds2FL69rZdDR+XVxYQi7eB7qfIZ
	/weZnkl2BMnxwFuSHr0eGcjOqn1uJajI5IK3NIIhOtYyP2LPZY+Ea/iXnea0V+nXf6lfgdiBIZU
	wDv3JVocSAelDOSmHEUlSJ36is5bT8/Pczh+SK98qtWOXdMOZTPBOcIil2/aDXpg==
X-Received: by 2002:a05:620a:198d:b0:93f:231:9ff with SMTP id af79cd13be357-947ae87a080mr421670685a.27.1794403077877;
        Wed, 11 Nov 2026 05:17:57 -0800 (PST)
X-Received: by 2002:a05:620a:198d:b0:93f:231:9ff with SMTP id af79cd13be357-947ae87a080mr421664885a.27.1794403077349;
        Wed, 11 Nov 2026 05:17:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15b8890bfsm563193e87.15.2026.11.11.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:17:56 -0800 (PST)
Date: Wed, 11 Nov 2026 15:17:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Message-ID: <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com>
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
In-Reply-To: <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX9WiMPgwEDrgW
 OBCrRIPXaUxz73xZDmF+9ZpTwWKfRTBHWsEZYFYzSZ+Fno80Rj4ew4gH91cmWnOmrxjE83ERnqY
 FbVlUKpMxMwdRpoqxBFj9TIMavOGPZmlPT6QWS0FqOoHfEjDv/Sxe3IzgEZSIGQWYeuP3gHzROh
 rniSkrrpIfSM9ogzfrH2UXgxVXkgOsxZVls5c/7kgKTSGmGCZmPrk/vaEQu6QK2AdynZ4YzvLCm
 yJmO4qRDXKYDuI6HmCrQp+Zh/SpYmJpT5PyoNpRU2UvSDD4EJ+Xku0KjoZSX2rwgt8CPkam0nLd
 l1TNPGmB6fF5NUdYvPoySRfjyxaszSb5i0fRdJJKQAcflIjM/O9sh33G53PAYLMCXaYZp9gi/8o
 1sjL+s1YLEmzMKbOM0vrfhzs3qWMoErThiqU5M+Np9UNlq2EEGz+Ti84Vn4W5LzEZJilcNSsj++
 0h164BjxCe0VAw2vJfg==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af46b06 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iS208GUargVqoEZNhgwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gJ5-3V9vaJCKf31op8yVj5Br6qlH8PlL
X-Proofpoint-ORIG-GUID: gJ5-3V9vaJCKf31op8yVj5Br6qlH8PlL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXxKpSbQubCMWp
 JONoUfda6DJ58KJ5LoQii4co66XfUIJ7ubJKxE4lNQ4tBmn0vWpqHSWu9GX3GGiQ43YVMzDkdly
 C46vBEIeF70OeJJnsHHmMZMuzv2Ff30=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

On Tue, Nov 10, 2026 at 06:39:08PM +0200, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SC7280 (Kodiak) device tree
> so the qcom-jpeg V4L2 encoder driver can bind and operate on this
> platform. The node is disabled by default.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 67 ++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 8c7523602d271..b46fbf5ebbeed 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5164,6 +5164,73 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		jpeg_enc: jpeg-encoder@ac4e000 {
> +			compatible = "qcom,sc7280-jpeg-enc";
> +			status = "disabled";

Same comment. Enable it by default.

> +
> +			reg = <0x0 0x0ac4e000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd SC7280_CX>;
> +			power-domain-names = "titan_top", "cx";

The same, drop cx. Also the PLLs on Kodiak are clocked by MX domain, so
MX should be listed here (and used to cast required votes on the MX
rail).

-- 
With best wishes
Dmitry
