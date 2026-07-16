Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66213191D3
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226734; cv=none; b=PxyzgAzzfne1TTFS9ANVZw9iLz1cpwyfsjYNCOxo/nxafWEqw0bAwrucMxbZyXWiwmLiSm/xSp7nVhFm5jERAB4SJyUG82VWD19Vkzl3P25rzaUsbv2udpIFeyq2lPJwHpx3BK1CwgMU8WTy7wuD4bVKOPtUp44BxdhDbXorfRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226734; c=relaxed/simple;
	bh=/3bsUgW4JIhWwwr4l3m1rNpjICiTpzV83j1/DCQUvxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jw1D+co/dxviurHq+JgWKP6ealoGVJTRZvtAymxug5sXNvSNIs1XBNkcpvQtg8Vy2k1e3G9EGrjpEITyZq/C39xQmJfoTAGum3yG8yGETfGbt0PnV3jrK7vPlY02t98V4NeZXnEwrYmSImC7+j58ffw4hXXLcFxQRzdpVVJZywQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADrAHbvo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kE3b0GD/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADrAHbvo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kE3b0GD/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHZlH73281322
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 18:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iW2mkF4EyoOKElGESddOwINgN5E2BvggXwdyVkgiaWI=; b=ADrAHbvoEHAnawAZ
	lZeTMm8mREvOvHREmo+IIcGcQz+f+xDxiRa1bY9Pg+jTyVLi1scRMO8VWyRQpneo
	oQBAzvOwakxjSOsbRnRn498FMccwz7QaKqHzQIMp9LsuDi2QVFsK90qszsG9q8ml
	WcqxdOz8Cz/X3GSYYd4cFZ6DtNLcgGVRaEHthKKk5Xkx0YWTXAx/tB+7QSJZYopx
	S6jh0NUl4QdK2LN/Ji13SKZBN0mK9lq+kzvWuARpdA9ZgMbSW3ydsO3V+lqfaqV5
	GlhjWcm4i8kVjrh8+1sj+ULxI8ZRBUKUJXRxkRNYob1M/nLQ5qt6RNVwT74m9uiS
	PHqqZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8g728-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 18:32:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e9d892f0dso3741621cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784226730; x=1784831530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iW2mkF4EyoOKElGESddOwINgN5E2BvggXwdyVkgiaWI=;
        b=kE3b0GD/bXShVc4E9xNcV9ki6+UTnJMvFhGWZKrx7gfwOFYuxsXZxxpnkjmOw5skcH
         xHiIYAV6D+Hu1qTftrs1LUM/1ChpGAUUTcLtItCI7YfjKRFKHCnZ6m9f3tKqxUmVxj04
         Z4zG+juHNvg5xvk3IWFrUo54kzHFN9pgzUEmBMb8sIRM/86f8Cnmmcl6i6RgXZRYN9uJ
         E5KaYF0KHJFUKDf/OOlFJKXxRvOCbgKxgCvEa2E2JjKu0ruV42ptM5hUualDWJYYIBDH
         lYjMFwny+KXcghRakaQO0fcbZat/6KQYRUT5ARuf4GoAchVEj0xCqfD0mg5QA3grcnx0
         OsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226730; x=1784831530;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iW2mkF4EyoOKElGESddOwINgN5E2BvggXwdyVkgiaWI=;
        b=WIiVo5TtwCOOPm5fHtNxlxvxiRrbTmrTX+MUTOpjHUDNiegWUB86c1O5d/zsBaQzl+
         cWMjsV+6BpwsUqF8iwCv0tkw+pByvhHBIsy8eWeSlioaATi9FztaNCbYtqr5vc+v38Pl
         nbPmR2w9iYbN8PuRviuyOa8mcT6j69/ZwHkLZYEZnTy70AmE0HFA2DRd/xP/AlxwITJK
         tjx4qh4jESO5Y2KbdDW1jF0aWBb43TdstJa6vQTCnxscQLP1PvbSSLWQ130Wr4HdwJcR
         E4JgBU31G9b6VmYnEUQF0Wo2p6U1evBF4KJO0mjB5vorZEZs1fSCkSNYFLwEjdvWqmFS
         q/1Q==
X-Gm-Message-State: AOJu0YzhCaINvZdm8AmKK6aB4q61KS83OV2BNEZxbGv1Xxkkounbsx0T
	iNzyg2cgFwNQLh4fF5AIIso5MpMUzfnEWtGkE6nUxoYyptAz6NnAjhXRDkcSsYv6UGyUYipqCII
	CaXW+GDpKz9WLlc+Iapl/n6zsu++LHK3JEl7toLyCTEv1lKa0Z3JjJTL+ofGup1EOFgJ5
X-Gm-Gg: AfdE7cni6m2Tid02gGwJMYdooreUbamodHPr4SpY6JcY1108bCj6qEXjIouGKSTpvmG
	r1yLu4N36jAc2BQIJ3miHSvd7P0NRGedRl5dgm0ccLFCWiwiFduq++3CO5dubOCQGYI+ItD5axs
	YCxYFq69puUPnpBEec6rrNtvzsmufA3bmJXkkAu4QlUVfX9xCr9dRKcW/VyCg+1l3EPoyRz1rgV
	q+aoPtqTWGcbBlxC5iJXJdRpUexY4PK5dZ6lHiJYVDrzwirWzLnTF9GKraQJ0B4vrJJWlkU5dlh
	9WEDMPYOOa9vVx4n0joNITPI8pYFS3siO/PMf75NBYyLp9H/D1QCBDYo25rMTv9DEwlQBHhamwC
	/VTJ83IyqNcC1Lz+ytRlQtv+E
X-Received: by 2002:a05:622a:55:b0:517:6162:daf5 with SMTP id d75a77b69052e-51cbf0e6270mr190678421cf.3.1784226730080;
        Thu, 16 Jul 2026 11:32:10 -0700 (PDT)
X-Received: by 2002:a05:622a:55:b0:517:6162:daf5 with SMTP id d75a77b69052e-51cbf0e6270mr190678071cf.3.1784226729657;
        Thu, 16 Jul 2026 11:32:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687171464sm258484566b.19.2026.07.16.11.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 11:32:08 -0700 (PDT)
Message-ID: <b169de67-585a-44f2-a7b0-7a923274849a@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 20:32:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/11] arm64: dts: qcom: shikra: Enable WiFi/BT on SoMs
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
 <20260714-shikra-dt-m1-v6-10-bee265d3499b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-10-bee265d3499b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2mRaxhW2vAek0t7AuojZyzZpjuXaePzn
X-Proofpoint-ORIG-GUID: 2mRaxhW2vAek0t7AuojZyzZpjuXaePzn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4OSBTYWx0ZWRfX0uhtCR1lw11b
 zq2WLI1691HNTE52clq2sPDE/EYa0HyUlHTSrdT2xHELg3lQalSaX/Kfh5We1J9Pcfecjd2jo+Y
 2kJlCOfWQwqzP016aboFxQ6swKcsnTU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4OSBTYWx0ZWRfX1/wc1u9X6UiI
 2Li/04n39SN8Fncg11SIOtHF3abOSrgTzvbG7Ir+Zco2ZpZqVEpg+vJUlHN770edWIwy1ReD6Q7
 0Nig6+43BSSw1sdwmRjWrQ4LLPGTWF4zXlT08FBf54bet6fpcPs/KxL2XVrziwGs9BhIaOd5D9+
 FWjbJsh85XpwtpTzee69Mh3/sH/h0/2rc394KnKIcw4t48qUwf1Q9KsQO9n/vUyDqHHLduCf90t
 3PYsJPjL2dBVaMALsvSnYJdQ5NkYYcrgrarUEm+s/Pjm1idkUpShRs2AB596poZlpp737gZ1IBJ
 zZcq5aaeLQHubDUNi3uSQMtO9EPNWK7RDm4FDfib3Q7Cmfy8tDMMSp7aZtwB1E9g3b6nYatjAs9
 fx7X49XfIWhipNtaUn6UMG3DP/Fi6xDoITNgBpKLnrHAq0yV15k5sbLeG4YmPZ3o2YTvMP+bTJQ
 7xPqmIUuQZVa3UzoZ5Q==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5923ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=X6UgWjF2pf8hxxav09cA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160189

On 7/13/26 9:36 PM, Komal Bajaj wrote:
> Shikra SoM cards include WCN3988 WiFi/Bluetooth chip, with supplies
> provided by on-card PMICs. Enable both interfaces and provide the
> required supply and calibration data.
> 
> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

[...]

> +&tlmm {
> +	sw_ctrl_default: sw-ctrl-default-state {
> +	pins = "gpio88";
> +	function = "gpio";
> +	bias-pull-down;

Missing a \t

[...]

> +&tlmm {
> +	sw_ctrl_default: sw-ctrl-default-state {
> +	pins = "gpio88";
> +	function = "gpio";
> +	bias-pull-down;

In the other file, too

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
