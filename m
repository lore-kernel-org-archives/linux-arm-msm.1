Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027086;
	b=EFz4AnhPBZk8QOCzYQ8QDFp1n/BDeF1zyJH5qw8dzCN1aSOauADelxOzKpK9cLmSLx+E
	 YI8Q1ymi/Ik5WA4XVsfXsOeu4YAdfaccvbBlLLvgqSWrzOAXsXqcAk+pz1YKF1tU8kZHS
	 RFtwi6DTANxWMKbV2Tz6NmHvTdJKF23huTEQGItVJMmaSEIoxZ3UOhqhuuNvmDCxziPav
	 EOJlZ2ICPDutHi5VqW02CjvbJxwRUitN9LotMQf+fRGtYQZ2mvc9cNtrSXgH7lDb1+9mT
	 zdWkjeFJjytxlRpgDVV9GF3+NsMWlEVZfE9XGtLPjnIg0BIu0UADT4E9YRxzWEUDacw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
	b=tdZHNxANa9oMqScc9fj/tANYUEwDgMdP4CHaMmwe8v3FtK77Bxhn2IMBqFC5EmK4C+nz
	 l0PlGM+g9TmWfIq+UEEXJzFWnPRVxHlPqmxNEMDauKXnOylhDMz/7ebwRHVPY228bZ6UO
	 /vx6Oy3FO0IrKWE4nb4k1XMPsBJRngQiUrMOvBGws/8igX++ubsMFmz9ASIDM6SfWefcI
	 GZlINGqRpB3p0dlvFERTl1bpeor8eaeiYNpceT8JP8xNn0JdajSgHqn1RhhXaj22tXGPt
	 2++N1u008DvnomFn2+RzIIRO83wgiDZPHY3xo5WYS11NiuqfOZMlGwFJb3ETfLuRTEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQCM+Rmp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cC/sEK+V";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB36606A336
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB36606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQCM+Rmp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cC/sEK+V
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvd1W3618600
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=; b=MQCM+Rmp+OZKHlj/
	ciKNByeD1VCOEeHm/cod6l/pyvN2YTQHAFlhorvZqwiKHrUqvJkCMMcy5+8NzsJe
	dMMeh21KUtXzbdhwyWnjSTWfoqDqaz+ua+npTwqYYVPbVaR4wcuIPmXxaV+Z0Soj
	7bvziDtshD6feN3rD3xS4cQSlN466v/4zq9C1aaPSG7sL5YezH66fQWFD4B1SgW2
	ANjibawOqc4WYIMXjujy6A1t0z72lzPVBkAtQJQnbGl+/fMMAOcyHF6r9cpgBhJE
	oDxNwtLwXz3Hw58HMTyQswM9SIaYHH9TunVE28H5F6B9VDmUJRw/Q2bHUg0ZM1dv
	zrVBdQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xrgy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:04:45 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5190bd05881so552072b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027084; x=1793631884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
        b=cC/sEK+V425Ob/s+9l1tZQ18dIwK0N6PTBST1+7S7gdgVRbxD+gwcRp0RwvyYUeaJP
         nt6+Hoxxi/L/Mh98UTGG6hZKbnHFmsOm3ok+Pmy2oybBohvyUhsRsoqMjeZ5FTx5/q2u
         ibigU3jm34JNy8Yo8unejlCyLYD65vtvsk0iDawc3EHjM0QzX6TfpGhrP7AReEZaF46q
         H7ffuDeaIORFftqBhDvEqfZsZQnK1fv1qEiQmUFS4RiS9jjCExAQ0d+JEXaHt3u8X6hP
         B/xPpqG2wnUF4kqODuAeGwD50wIENPZkcPO2ibAnzTzbeon4Hmz9IXV4zCubw7zJjTv1
         yq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027084; x=1793631884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
        b=nyBeZ6mXvI8PFXOkxAoEVsm0l/zAkBOyyY9aZ7L/UEDhWuQOXojbuPJ5YoWnx/wgX6
         V03giZaTzu0/ks+LPmKkyccq8d8mhOBaXz71A3s6d7LFCSn7OcDKnbTs3wFsVJiPQ3vm
         YVivKohwJ4V4FVprUGgIBGRhVclYkff2/1wjgOla/SClqVSrW3Ksu8mDMOaSK2BDxExT
         jVNFpa59gVy9mi6PKOzKrdpWF0soObiqAMMLyr/XGX/HihHFws+uGmsa+8Stn3ElB15m
         0olvRudNt+5A+xQPkN0wdI8SQTD9MqJLbqbnYTa9ULrBDqNwoVKwW4Cy6cvwXWe61lNe
         /cFA==
X-Forwarded-Encrypted: i=1; AKwUvByikrHzsBkgIteRjJgdqidxnM5OxbwBMu5vRNwcxfYGWPJCDZ3ugVUC9ZBXIsO3ZAN3JYYghDAJrflHppiG@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7jUuEn8yqW9Uzdn6VfxIDh0GNp0VxuuI+nryByQNRvsEZvyUA
	yCcApBqDVQXJnAXm0k/uBotwqZyb2jThmCqAU+rgIyCBrpF8pJQ4cEopSJlTjpiUzgiNzRCdTu/
	l72V58vEPy5qI5y5mozYdvBax7bozhqQsfHWu5zVd0WiUWY5Il0N8D6XWUMDtIL+j7FUL
X-Gm-Gg: AYBFou3Bbxksy7r6YmoIfapYxDnK7Wng0YxVysnvkqBh9LB9O/tPA0sLjEWGrqvLmXu
	lNdQVl/lP6+DU95AC0PEOiuMhLVVXH6iAYDTg0ATugeN4pJGLjryYLeoTVZkUOFD0aCZk+qTY5I
	WbYh50ZRBWBzUUmP5qgAxkbUlhpPnrSEW5WKZFMZoOY6KDUPrauV2YN9FyCA8OEN2SdfWz3oGcc
	kLYPPXfbbZKolaMJ/IpZaM/0WCtFApcMrt9iefsK4Z+77ST56DRYZ/IGKmMvbHhymc8JicA4mcW
	BRC5bR+4EghGgqMIrAmPx74xI3/LnliE0k/X6OZlKkttAhz4DTqiC/qyLwicfnQ=
X-Received: by 2002:a05:6808:30a6:b0:549:e9e3:9460 with SMTP id 5614622812f47-55bffd26cf3mr6808485b6e.0.1793027084573;
        Mon, 26 Oct 2026 08:04:44 -0700 (PDT)
X-Received: by 2002:a05:6808:30a6:b0:549:e9e3:9460 with SMTP id 5614622812f47-55bffd26cf3mr6808389b6e.0.1793027083999;
        Mon, 26 Oct 2026 08:04:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595e70asm3844350a12.9.2026.10.26.08.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:04:42 -0700 (PDT)
Message-ID: <2d4e66f6-7187-4642-9371-4385a46bbfed@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:04:38 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org
References: <20261011-msm8952-initial-support-v5-0-1857074992ec@mainlining.org>
 <20261011-msm8952-initial-support-v5-7-1857074992ec@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-msm8952-initial-support-v5-7-1857074992ec@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZHxI7ziSNfywTP0xQpjMU01pnOKmNdap
X-Proofpoint-GUID: ZHxI7ziSNfywTP0xQpjMU01pnOKmNdap
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf6c0d cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NCdQflJRAAAA:20 a=OuZLqq7tAAAA:8 a=CrGEZSrvnsKXYSFoqd0A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX76IrC4aRgwri
 FB6Fq3kv2x5HluDopeEkIeZOjzzzVllMkjPtJkrnqxG/8lt6DfdKaPcqy3Mak040frjXfJ/HlRt
 +lhec1v80iS7Lrvj6dckNkjZr4QNc/TCTysZLahbF+S5HL2gOTaNkiagw/o/vmQyYd1+KLN3zUH
 XMvvT6agbwfeHQuFOCugUwLKsgAEFAAUE6xto9P9UvKWpote4iLy7XYHIYDvlh+wb6yYN0wqSQI
 W3ZvPgd3KCgfJ1tS+AnKp2QFjI6cmX3S12sJ/LMS36R2XDhk0TGIJh5CVw/qIIELVpDvC4cpRAO
 lIkG8srmC4na/FWPOqZbqzAnxHlTrzcgY5dU79ix0p2cp+K8M46D0YmKL1dQmnTMztODJmjCxzm
 IgdOFn08XSAX1XpDw5yx72xkFqRKWn+2M9qYG/G4+P3wvrI9ZG5lVWSXym0ScuB2AmvYDv+FGbF
 UDBvdArHigYr6WSCkIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX0x0rBSiF4fU1
 tu7jCe5wij0hdTuAQmtZck+9Z7QvQx1peMLSqMlfRAbAMSPP1tE9ycYNWDLUWrroKC6qo5QRBqM
 nYsW/FwvLzzJ2EdSJmp48pY9nc9fcws=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 10/11/26 6:51 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add General Mobile Shamrock (GM 5 Plus). Shamrock is designed
> similar to L9300. Downstream reference is [1].
> 
> [1] https://github.com/Asderdd/android_kernel_generalmobile_shamrock/blob/cm-14.1/arch/arm/boot/dts/qcom/msm8952-l9300.dtsi
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

[...]

> +/ {
> +	model = "General Mobile GM 5 Plus";
> +	compatible = "generalmobile,shamrock", "qcom,msm8952";
> +	chassis-type = "handset";
> +	qcom,msm-id = <QCOM_ID_MSM8952 0x0>;
> +	qcom,board-id = <QCOM_BOARD_ID_QRD 1>;
> +
> +	aliases {
> +		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
> +		mmc1 = &sdhc_2; /* SDC2 SD card slot */
> +		serial0 = &blsp1_uart2;

You need to enable this console if you want to use it (stdout-path
also points to it)

Konrad
