Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B0E2D77F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049398; cv=none; b=UBEfOngrWTcG5vcjrSiohXVghLveAomZZuRmz+wb5L/jxRo0/1ViMgsGeocoRNEkwr2gX1lZhJzeBC+fvQpsuHe2SJ6YLJtrBf7xVQCIsWQ5umO7MjqdTgHRD+2XdZ9NmOdjOD+uId4mP6X3te/sC7WOj3zizyCiosot6UV2g7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049398; c=relaxed/simple;
	bh=QpijhyMAv3Q3+zdOyqAiqYmyHOt2KQQJ8C3wNVbmY2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJk5Qv9P2P/irDPBJ4hMJwnpD9sGuz0IJfu114pH1p5d7tyfIgmMsiMDc9OuMJUczFoMZ4Br03jKGodmslmifBAti43z+ykcwVZV5UEFvf8BOCl1rbP5GOnzYtZAHKwKy7mh7+OjioZMJCFGB41OfkUdZjp0JPV9MfgRLK2niDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNdd7neI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkdqheB3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNdd7neI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkdqheB3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABWRZ1021660
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsiLbORmMBDg2q+JZLV1vEms5S+OIScEWzmE5hr8nRQ=; b=lNdd7neIo0X7MKcI
	wUwkrXo8AeadX3mVXD5D6Y6NRHoxRM5IL0c6sZc61mgrqWnjlfjNroRQTHZEANT3
	5i1ha4edRzNzCB88j7dZwE+RDyrw53lizpvVbqFeriiX5bAbqGAdMH/8wVEVMyiI
	eCW/OZqQ8D8w+5ch1nE0N2hQNT82CLYNBetTHOq9nlz6MCHif1oELpmaXpGF7ePN
	8igCrwyeQY11IEMvnT0MYBioW9FOUweFjHkEIOuldqEtt5euPDWypYof3az22+zE
	H+e2KU+BK+Gg54E0WL0uB9LL5kGPHzxKG+pqAwlv90GwWAhBWsYAy5zAFjbihMpO
	dWhZJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0u7sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:36:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93495488976so118151785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787049395; x=1787654195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsiLbORmMBDg2q+JZLV1vEms5S+OIScEWzmE5hr8nRQ=;
        b=EkdqheB3wZKQBbZl5OEX7S9uJoWWi9vnXLM/rgTnt4D64gQiLgoTZrNLD2+MEFkM8L
         cIPNSNzivLZnbb/wc8uMzYgVkDENy3psXeyq/4CrEFWc+n+YyKA4CNRfHGfTjnO8yv2f
         fnZ0Nv0SrUK28qjzi2Wctgg7ozT42FSnRwibVVGw72oxU+SGNL8PSw5kqP/dxBL+cbNV
         AYJLVGlvkWWa8+s9xhGWZt9fvyJXd5Zs+oGWb6+XwZAOrF2HHw7IsF6FIL4RrUG+it3C
         lKPVkHYwU0koLPRpFaWuTIOK4vOxMY8RFPv07VWMbJD0YobEFR7t+WKbW+ev/EYp6T4X
         j2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049395; x=1787654195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsiLbORmMBDg2q+JZLV1vEms5S+OIScEWzmE5hr8nRQ=;
        b=l1dyXu48Gqf9q5f8Xf0h8W8sngHdlw3U22NsNSCnHWpa4ffJfH3Bo42v/GWQpOApo+
         DMCvgBsLA1s8T9qUZ9BactBsibLj3JxlP4OXO6AlEYgd/w5q/h5vZfbyqAm0pu6GsrZX
         0m/L/z7yENmV+jKXVJ0P/ccP3QCiiU7/Vt2F7RWro2ZBtcIHFnZ8tafEQ7yKGyNS509Q
         yJMcsWfu0EtveNGLqgDT7I1euSe9YUVg0aSt8mZklOssUkznYKwciwT5OUH42aAvkdu3
         LHznIGj7QWzvYW7Tp2mi2az+SjBgrGYeb4ixP+buY1pjl6cZtuiImniZxx+Qfpu/yg2n
         Ep/w==
X-Forwarded-Encrypted: i=1; AHgh+Rq/MaS23DBXMF2Am/iQzJFF7paVCFT8SxtG2hwRuA+N5dNid6ZL4yS0Imx2Htyr1cmNMIt5tDEUTyFnB5Ax@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx7FhhnQxRe7w9CBp9aK9xvxrYUoPDEcT3giscSWAew6h+7huy
	ycYpo+/WZkGFijfOdaBtq8y6qFhSTPyORbUCeqwwokPzs76EwZmnXklD0yrjgqMxKDGxWSY1jRV
	qE8TwSxNmRFXOKKJolYrrsnOIaZfwTVOaezmBHs1Zg1a11QAKkosS9+Q+QMUxag4AIkb7S3GzhW
	nA
X-Gm-Gg: AR+sD11WK/QvZn7Ck5WAvHsXqpkaLaFTRvlnewOnljRYTOoIegiaKZedCyiro2RvB4d
	PQiQFPnVY5U/cgMYuv3sZKq897hd0Nx7aMUsXwDafSBVnqS9+Kugtk+a7wAc+V46yi8DzmRVa0A
	/PjN+dufjXJ75oDMbW+0WXd0wG4sEJL5xiSOcyj/9RiMb2vhbI0KWGcflYDmzr4NcIKNdZfqpUO
	Ku43eOkjPc3zV1jVc76ONXcXQfqeZ6cCKxxGpISywoBZ4AVaXbClQIByGHRmis5frJ4VyQhl6HM
	w7wYZk9RoN99GGYB7VX9HH0/r7mY23HDJV2K5zFBv+1JiMCGqGWIoVz3BjG9SZPIEtO7l5ZYLJZ
	XHSfOPRX/6TjF8/kyNS8n0+AR
X-Received: by 2002:a05:620a:7083:b0:930:a08c:cf9c with SMTP id af79cd13be357-936d239560dmr2269219585a.2.1787049394889;
        Tue, 18 Aug 2026 03:36:34 -0700 (PDT)
X-Received: by 2002:a05:620a:7083:b0:930:a08c:cf9c with SMTP id af79cd13be357-936d239560dmr2269215585a.2.1787049394416;
        Tue, 18 Aug 2026 03:36:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b9f47bsm130185766b.52.2026.08.18.03.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:36:33 -0700 (PDT)
Message-ID: <1e070cab-ad61-4ac4-be94-1ea40f5b6575@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:36:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] usb: chipidea: msm: support the HSIC asynchronous
 wakeup interrupt
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-5-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-5-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfX1022qCVhNGrA
 +Ig5njsnKij378Lunu4yH7NJXaHXWIP5/V1FmSX/IEbEna+FOZH6xVsh6LzGIbnf4Kqi0wyrS78
 cEwShuDLvgoGhCseum9tcV+GNmncivI=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a8435b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=85NeIpzETsoQluUi9CYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rDTTVUKwWEaCBEuoYL8Xl7nsWJ-1Jbfk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfX3iaBX7Nh/3Xa
 LfOGV5t0HOFJM7Vc45/F9pFJ8ksbnIos9abeZ+e66b2rF1w1oZNalvgZxTCqeHsrKsspZFjabEG
 Q3iggqceJ5y8NQmdWUSaJiYBXyCrqi4upSnxVHkes0435b2W0/dEnfYzaymwzboC7nyHhpfDPzA
 G5goybwbnXvoAJirfbKxi/ZwGJIJZZptJ00g3zzvKO2PaLpMH1/s8l5RPErujRP2yKmko9yXXE+
 4MjZR0apdOl6XRIaEOAyc3dmwRgU70fXKD9Vp31STdHVoQsItqHn57V5GAmBzh5mFsN38/+LNUv
 /90iLKlyTmQDYvPQk61dfuy8d4qzFcFsm989CIsxRM8rfNLnoVaSNhKj5iS5K6vXkpR3KKl8jX0
 Xo48gBYAXxJFjJw+xQzwStRkdeyyMwWCQCHIdLmf7h8JU9gvLTD51e1PUOqB3ZKMg+nQZA3tDEY
 Tcn4YhRd87masxXmFwQ==
X-Proofpoint-ORIG-GUID: rDTTVUKwWEaCBEuoYL8Xl7nsWJ-1Jbfk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180078

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The HSIC instances of the chipidea controller runtime-suspend with
> their clocks gated whenever the bus is empty. HSIC has no VBUS-style
> connect detection: a device (such as an onboard hub coming out of
> reset) signals a single connect event, and if the controller is
> suspended at that moment the connect is never noticed and the device
> never enumerates.

[...]

> +	/*
> +	 * The optional second interrupt is the asynchronous wakeup interrupt
> +	 * of the HSIC instances: without it a bus connect arriving while the
> +	 * runtime-suspended controller has its clocks gated is never seen.
> +	 */
> +	wake_irq = platform_get_irq_optional(pdev, 1);
> +	if (wake_irq > 0) {
> +		device_init_wakeup(&plat_ci->dev, true);
> +		ret = dev_pm_set_dedicated_wake_irq(&plat_ci->dev, wake_irq);

devm_pm_set_wake_irq()?

Konrad
