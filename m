Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780246;
	b=VusgkLYCDnkLRhYDkkhmizl+EF2Gxz9XjhPCZWvGxjWkMxqQ5hMkulIRGpq5DPEB/jbu
	 7gZL4eyCmdZaAexPCjZP9bPtOb1RR8vnbTsVESCDYJ5EU2D/90gLkj0IJj1oFGZJBnzhJ
	 Tz7Ys0UxTkCIyzlTHERM88i7cNYXth8JB/t6Z4cRoYMd4h6tepczXydUvARXKClgIKMm1
	 vnh9g0KSlStP6Ag4i8r6lpGP6GwS1WEU3pyTCh16nLre0wrLJs86eCrzwePcdXQ22p+TT
	 opZdKHQL1N+/0KhNWi+ulgCnKA2mdqx7PhuLAQv81XQjfYfu9w4V+kN6/ozB/REZz0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=;
	b=4blZQURS6ssqSqb3XNIE9bRAb4eJ9+ZMTfPW8RWz8HwQv6qt38IJ3ANQSBz8pBpIs1uj
	 XPe7x1ekpTL0nKlXYPHvSge+q85h7i4dOsd4W3snAoCXWO3ZBG4ptcq8+a3bdPSdLfrex
	 zh+o4a34QMGH0ohsdzEbxBab5LdqbSZd6Lk1mZ6O8hq/mkjzVYkNovuz7rokmcHM96DJe
	 /6ceCNWuMOswF4yj5r1eY8omKIj0Vj5Xnz3VVg2o6lfilqLehnpQrw9ykA8xYHQCK2bO4
	 qGxctM132OQe0cs//BaItBVqdzRhUMa7FW0X9ClqJAVCTz5HdEXy7VtYsZQbYpPxlLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZjPaLixx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHOhW9S4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EF4606A32F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 08:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EF4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZjPaLixx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHOhW9S4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A478Hd7230672
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 08:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=; b=ZjPaLixxKZWZPP8X
	8kyd36Uu3KY4HkNGJOalvoY7Wd/omIKyQidf087yBX4mMa1VZOaiIPLvExnzuSjS
	PXXPtcT2X2dT6G9cFwxXu3v/XOwFG7XOynrzXK+rZZppVOgu3BiBpmydeBZYXTwJ
	GlkB+EK15D0NYv1ICHAS25DmSvlxAXSBxxTUri1R9CRJgFHPggEsNa/Ya9K244jo
	OIOIPofyMccH422nQNVG0I8D4Gl/l5ugO2ol4psuscX2vLL4jCqfKp+4KnmnmCWl
	3LAj73E7jlrtUXKs5rozQX9aryLev4wWMxvC5V66KaCxt2CpEM5c3RKT2JWRSuv9
	T3aLxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypky82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:17:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943fffbc5dbso11724685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 00:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793780244; x=1794385044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=;
        b=eHOhW9S41ZMX9fUeIteXJknWzjZu+1QPCVKNzhwlk/z8qHtrKsPYPllGJi5ePzhxP6
         jytsgofXy02/Ng0dIibw74mqjYpvH0siWcUAp+WEWWL7e+2Uqk5ZA0flwfCwd4HuExvC
         3WyN7WBlnYTHrgP3l/IvF0TveyItsxcBPvai2ESYjYjnPTwEDN4wOAWlb1MobPqpI3FP
         v2y8K3Og1w7wVyHzmmkPbpSbAFHYZbO86gOuO/Qg3G5H8bFScn2DXTmr/AqdPC4Q7H1H
         XDlcWqF+ymL+U+yYih4T9Ul3W1gZjkg8jJHVZiPoM4FXHZtr0UWGkvnR1G/GH4sfcECm
         uxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780244; x=1794385044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=;
        b=opms1y7Z16ckOH8OltJjxAMySQAK2ep9zMPMm+v67VZyLa9F8Y3zbcfjYRgufso6tt
         Hp8nf8YLZPk47PT6XSjtHFWNzoK8zjcwwbkY1/aaCWWUh2HGVCQay8oY3EU0rAS7U0by
         vZvTHjiUXlrdt9VNV0oUGFQbsS1PnHXjGWcYbsGmb4wd2LH2JTSD9ml69/50pMbyRQrW
         pqhQek2AStlHMshrYIKm5rb5IxxACFUKsH1n1Fox4WDYVfpw5766MFxKztqdhNI4jKyv
         IcUOYU5Q739KTNrlyo094g+Wp+MK89uGIvNrntnGgQPhFmRKARR06Cw9YHxpofthi1Bs
         51MQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSS9pno1SP4nknD+iyfbrl9Ql9G8XeUcLosbhVDxCNoTI+6bTxdwoJplDhhHVNRqIMM1vU020WhIcxWaDq@vger.kernel.org
X-Gm-Message-State: APuU4Z/yRRFqIeCpYCA2JJ1V4PKAkLtXkKm21D+eqjqyxIQ3Y8/NeC/Y
	p+RdWBkP1k896+vBrH+HYJoC+UWRgsSf6lK39uj/dpthOxUflUd1wCbmJ28wo4NB35es9g97ppJ
	RPM5GO+optdJGsKq8S/Ffe9j8HxQxZyaPJmkRA8Zds3AShsealrATaTPHD01gCdSA6z9n
X-Gm-Gg: AYBFou2wvKzQwFbUOzfTqEDS/4zU8ctoBMdsAEO7ajA54UGrWbXRN1u0/TErbBjEuIR
	2cfwErVDFnwa4dTwxb69HI1wWLYOCa9m/ehZt/+5n6Arig3y3NcVARpnof419xqx5LcfSJxM+sj
	irTbNrhja1RMm4Xd0Wy89J5k/HG06QytBI6uhUzuPcl2VAKtxVcXu/Fn5SdIeJpEYwGb1Iyg+cy
	kFAIcZ1g7Uba1zf7G/BwFjf4aq866IPF8yOeE1S/r0L6I5nSbR3OsL+DMRt6UsUPUNkQXMVy0j0
	lA4PTNp2DlEEsxrtzjy6dRCjIltVAQ9TcQRb8wf1HSfX1llOhBu+DcNukp3K2zJBFiMmA1q+zEd
	NlBX9wFvA0nhzGf98/Jsd95gpZ06oVEUvHSraAvuWLaNOPnLnwMEPFULJkZ3PqQg3Ckbv
X-Received: by 2002:a05:620a:414b:b0:945:dc04:c4b6 with SMTP id af79cd13be357-945dc04c858mr23611885a.6.1793780244316;
        Wed, 04 Nov 2026 00:17:24 -0800 (PST)
X-Received: by 2002:a05:620a:414b:b0:945:dc04:c4b6 with SMTP id af79cd13be357-945dc04c858mr23607485a.6.1793780243794;
        Wed, 04 Nov 2026 00:17:23 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0ddcfa78sm46641766b.0.2026.11.04.00.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:17:23 -0800 (PST)
Message-ID: <8eac300e-ef21-4dd1-88c0-63e798afae2b@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:17:21 +0100
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
Subject: Re: [PATCH 10/10] pinctrl: qcom: Check qcom_scm_io_readl() return
 value in msm_gpio_irq_set_type()
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261103213002.1673560-1-lee@kernel.org>
 <20261103213002.1673560-11-lee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103213002.1673560-11-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX6j5BAvV0OZ6A
 Vt9/wmaI9yrBwVGrIu0pys6KAiww7+5Dsj6W/fVjkxmcKy2MhfMzCj55bke2Fbp0vBi089Wbp27
 OTmFiusqzUTo6R6gBdRdQWOKfwzpNXQ=
X-Proofpoint-ORIG-GUID: wA6ckc8kkmhsI610gmNeGW2Lgf5dia9j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfXyzYc7S1/9noj
 1WaVqvF9ULUJKQuv4YU2vuXecOLEEt9aRivgwR0OtTPgIDF8+qsoisD2zjfHps6P0g7YPs2dPup
 jBj6xe0hd7Oramy9EZitclolcMftZi6hXpJLZzAVTj3yBRjxUD7r/S+77AN/cLn/9P0VxoVCQsy
 0rlQBSuSjdlruF1DuJOYo6NUuIM88wSzn/g0p2NjnvHAlovaqM2yHO6qEqWaZeteN8G3AfHhq+L
 5bp443mkuoLbofGb6WOIQ3drnZmnZ6LX7jUp95Pzj8Z5dnFWeXkBjWEOv/UPIzfDbYJoAyPKPrj
 wBp+vr2W2dlH8tUkuOxCroXUPr3NfO9UmQpAU4w8E62XaxmIurkM+Ydsa/4iZBQqE5BcIVRzZsF
 g/4CSohD9KktOZ2ZCqcHcIdH5/hluP7WendfZga4FmlloRYmwYbxdv3Zi4OXqUgsJt4zkqwNM/Q
 ruc20txUji16GhU623Q==
X-Proofpoint-GUID: wA6ckc8kkmhsI610gmNeGW2Lgf5dia9j
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeaea15 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-MbjPq3b4U0PC_0A3OAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040032

On 11/3/26 10:29 PM, Lee Jones wrote:
> In msm_gpio_irq_set_type(), when pctrl->intr_target_use_scm is set, the
> return value of qcom_scm_io_readl(addr, &val) is ignored.  If the SCM read
> fails, val remains uninitialised and its stack contents are modified and
> written back to the hardware register via qcom_scm_io_writel().
> 
> Check the return value of qcom_scm_io_readl() before modifying and writing
> back val.
> 
> Fixes: 13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")
> Closes: https://sashiko.dev/#/bug/linux-a5545ffd-48cc-4856-94cc-4b2dd7968f50
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 27f06bbc113c..1b46735fc4bc 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1105,11 +1105,13 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  		u32 addr = pctrl->phys_base[0] + reg;
>  		int ret;
>  
> -		qcom_scm_io_readl(addr, &val);
> -		val &= ~(intr_target_mask << g->intr_target_bit);
> -		val |= g->intr_target_kpss_val << g->intr_target_bit;
> +		ret = qcom_scm_io_readl(addr, &val);
> +		if (!ret) {
> +			val &= ~(intr_target_mask << g->intr_target_bit);
> +			val |= g->intr_target_kpss_val << g->intr_target_bit;
>  
> -		ret = qcom_scm_io_writel(addr, val);
> +			ret = qcom_scm_io_writel(addr, val);
> +		}
>  		if (ret)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
