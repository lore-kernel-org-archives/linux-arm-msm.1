Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5718220297C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726539; cv=none; b=RYYqjWBIPtsIsPnBzDOxEIX1TVCDCv6/AmDX4FbdWHmj87l3JG3N1SgTcSgJR5WsIkY3Q0REv2nLvpVv2TBUsuBDmCjpXdZm3M+6E8cjXACBaWVoCMcB7eoSUPkGIUgeLgnR6kz9hiMWenBGGJZ6rY1jekohAilCuD1JTfQ/Kj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726539; c=relaxed/simple;
	bh=3FVlVEA2rbZg38t5BnfDFvC9YUAId5io7btGly1WS6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbAV98LlslnWxu6eq1pKIbsZJO8jDA+7srRaHjthqjl8gPbrHcX4huuU6xgilzBv4fmOzVkWrZ1pLu2DqQgYsvt9c1XFPeAGhKt3KOrOi3P2q3lS1t0opLrv04DO5Lxa1GYogaJVtobIg/H50I9Ylcgp8Z9wyaHNv9VXOsRiD54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdIgH6uB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=So348kps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdIgH6uB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="So348kps"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD21FI959090
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TOW1KjSIRoG1wS1X2Bm+3FjL
	0CgYhaf3Z+auuhuDAnY=; b=OdIgH6uBqTYx9sTwZ7fQPOnKR1EtPnJtC6UOcVdR
	TcPfB9fY3EKe0DiCV0fvB6X9aG4/Hq+1lSnT0ScuuQuwQuPXUSR+QsYvWHqtZBbD
	Pr9ctxdCPPInu4Jpg2jqiqqme2CPplfXI7SEpOSPgiMkKmtU9fSWZVEmFtghtoCy
	aMQCrC2dSr0UIOns1Peyai6q6zh3RXsL9eJkJWB6iWqX+yjneg3SrVvulSLxDAan
	dknXLJ/f5EYtiJDhV+doEzBEasD3nNVgBDdBlI8uHRdUSsGMZDEG6RYtDDcjHI8t
	va6c9Fi177jCg6RG8dt5DG7B+AaV3bwk5+8M1t7GvsWJqw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt79963v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:22:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9694e84752eso7650155241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726536; x=1785331336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TOW1KjSIRoG1wS1X2Bm+3FjL0CgYhaf3Z+auuhuDAnY=;
        b=So348kpsCid7v8rYL8ushklHvf9J6q9w3Vr2zSAJUAV40t1QwuxUTaund6xB1wfcqU
         wrZXbGG9T/nWcxZB0+O7f5t76lGnHCQSd0FKKzPh14kAmyBOOv1Eq4OYKSlu7m0BYC72
         xiE/tz36QStmzlAKLapRpsY7aKpKmL2arBxuSV0rAN2RlLTtwY6TKZvek/F7RYpYgX9c
         tYKw6P0n1ycqD/suFRXCIC49k1EuPcvqX9b7wJ9068OJU7cWj15xn2B3rzwNSnARgtFr
         6p6qCEHkBRGVGxCoT196dkOrIvCoDcuFsYj8iAwtBeG00XQPungXHuwp0EI3EVQC0jXb
         3O6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726536; x=1785331336;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOW1KjSIRoG1wS1X2Bm+3FjL0CgYhaf3Z+auuhuDAnY=;
        b=N9U6Q5ieN8dMOd8DyC6VaBknSZJlx2ly4Wbzs+B0xHN+eBEEY+U4mJP//7ifoRr7A2
         21IymBd+ZG9B1taa4z96SRq5W27ZbXTzAEY9aWryuifjVOHz0UF4u+he3KnFy14p3R1P
         5dLgfBfAvZMpJu1mAX+jzMVUgJKcttlAEXlizKqEAONcIXV+wX92SOSHo3UTJJG9XD7d
         Des1qxgpMDYFFLgJBQvhxwu1IKaIjUoitSUUxypN1UnYhOSCnG9LPv0XkszI+ha0WrOh
         hGTk28jtM3IisVWWE9UCyn8L0VKpkkVnxhhhlcoDDUBLBDttLe/6PJ/Si4s+DUYnI+5Z
         WAfg==
X-Forwarded-Encrypted: i=1; AHgh+RrpSd7T6Tl5nVv+jsj2D56yvkVNDUtY0sczf7y/SeG3aCMHrCTzBMf68QOtLey0/WDhsrBr4dsGsuyAic3F@vger.kernel.org
X-Gm-Message-State: AOJu0YxDcjf2QA2Hcjn45d8QpueQQY9VZK7/ByM/jNFbuYmbIWeaGjW6
	UgtxP+zMPQsRLyIjlE4Zeq5D3lY0I26m0WavjLRMRGvYbDOlPvp2esRWVeSDgfoSa3kN4Gcvjao
	JMv3CAunLbu7vxKDKqW34zE7SyFpdpkYbfcjunCivYcDppXigZZ9iSPoiBgM15nLV6+g4
X-Gm-Gg: AR+sD12nCgKBOASBtDEsrDKmgJ9wjuRXH/INVoRmXGqYXa7Cc0+qH8/J5VWvmsuyHoE
	qTNMn/mTVldPK/xvYYQSMpNq7KDRBYn+Z+JvGo3ouWgAQcmezo3xwKA+PW7Ta1/otv8Pm3NGdB4
	jGN4gxqXMD9+yKLw6rYf0mepAbFu0/uAI6OhtCrneCA9Z4GTAqIDytdxEXEoxe7qBa/qLHZCcjf
	wZMCStMiX6n2zEJyT7R0nLxNk3ib6wlHBafxgCuLp+X058ikBhI2SlDagyYuW8oaczKaQQw/sgI
	VJajv49Yz0G/SFRxxiZM8EPQ/vo8JOipwkq7T2veo8CSiVvCbrTPCPE9QXejWXZdpCg8pAlJ3EE
	FLk9n7jCtpnsNmg+NwAbYGLvCwS/44bU8HcRtkMFYNeOzw/wc2Y5Y9IG/vJJuABDnfCinqapLhv
	9z0uQ2ZNqKADOz3Q==
X-Received: by 2002:a05:6102:3e11:b0:74c:dec5:86c9 with SMTP id ada2fe7eead31-74cdec59e10mr187721137.28.1784726536484;
        Wed, 22 Jul 2026 06:22:16 -0700 (PDT)
X-Received: by 2002:a05:6102:3e11:b0:74c:dec5:86c9 with SMTP id ada2fe7eead31-74cdec59e10mr187630137.28.1784726534646;
        Wed, 22 Jul 2026 06:22:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c4274bsm4347521fa.24.2026.07.22.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:22:13 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:22:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hans Ulli Kroll <linux@ulli-kroll.de>
Cc: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin
 function
Message-ID: <vanode7yce542zevzmmev6rigry73u75u72nsl4sw3balpali5@y2mr5f6mbinl>
References: <20260719134548.8830-1-linux@ulli-kroll.de>
 <20260719134548.8830-3-linux@ulli-kroll.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719134548.8830-3-linux@ulli-kroll.de>
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60c409 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kdAUHIhQg7ma7BpS0jwA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: _1dQvLaEepk60No3oa3lHGcgtxMPDLyr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX2+vohPpUGmqY
 LMqmE4jf/AO23uJzz5/my/P9b585Y6VamqqIrLm2vzkX2xRDOC6nAz5d1+u2+nMxPNOKrO0TLYA
 oUVyoWvgL7vPXtunClnT01YvMgyPzOqMHaW14T0/0mSNcGMl+ROEhR7CDHSmDKh43LLoJG2SI4u
 JkuQEgHZgkIBOySusfi5rwpZgtYSVP/PXJYFgxBs6C+qbxMPmWQunvzxSv4NsSLvC98LA6EGIVv
 MUqPsQyMc7GbzY5lYi4r+qf8K9tpeltXx7ZoaLO+b497dIIRZUON5E/VYEaDO5fRGw3l6iAwvq0
 6fBsi5RIoK6sPgT7gKrjUpWgfMe/hEhsKw05zJVKCH+z2OaMm8H6KnC/yY0lEwpMoQyobk/dFm8
 38XR/VrEuZU2dNoRnBd/8/aTZgVt9OfsST50U93Gk2roTDhrf3/wUXuOYh0MJQSDhMvk4wgPH8c
 8PnS40te3nXehYvi2bw==
X-Proofpoint-GUID: _1dQvLaEepk60No3oa3lHGcgtxMPDLyr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX2JNPTJfhq2hW
 +DQfwOIP1tNoJlo/guUDrzocX/kWt0lBdTx/JoaqZnVAQjaaRpDRZJdJToTYJ7V9Nd6yM+tyORA
 3qfcFm/g10hmJV2+9DcVvKK+dP0AHyQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Sun, Jul 19, 2026 at 03:36:00PM +0200, Hans Ulli Kroll wrote:
> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
> 
> Mark PCIe reset as GPIO pin function
> 
> This allows ipq806x to keep the PCIe-reset related configuration in DTS
> without tripping over strict pinmux ownership checks.
> 
> Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
> Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>
> ---
>  drivers/pinctrl/qcom/pinctrl-ipq8064.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
