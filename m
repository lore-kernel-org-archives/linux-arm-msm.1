Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E1241D129
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237004; cv=none; b=CJSobioUmLGSvjubS19WdOcFEpaX9Fz/8iLuYBpAGHKbW78FwIr5Ng0V8pJrWdRayp8eV6TU+guPlw9cYYjWtfJybdN9/AvJcqJjAlwc5px1TvVM8hjpVzKmDkq3OkOEOzyeICq9hr0GmAE0ajnzyvAaZosoGUQeAsl5rRONIvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237004; c=relaxed/simple;
	bh=sM4HBAS/FBe+IYWLomoYiBdGUEcf9thU2gMTBPh+k2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXQyxDiaBHBLjIZ3TCDq2yR2wc6PSgs+93xKuylZ0DcRdH0HBuqegbPcKSQEjUGDPNsfegsxJ4xC5oQXbQ8RQnKu5v7gpPGvr/CRwG+lwoUNfcolMXLYFyXd9JDEB1BTy0/Ss08h7X5muig07RLoYklJqtcx7OnPczKVNPFTToY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4ZbG/1R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFKovgbf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4ZbG/1R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFKovgbf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgQG52699267
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Xm8oefJ2aOQq++XmyBNq+isCGh7+eMvMlTi84Tnu1Q=; b=k4ZbG/1Rzpsu/W/M
	Pnh04jQeVYUAYXZAYjbw06S/TXZE/OpCM3g0J2r9k5NB4mhLsHULw+bUI1b1lASF
	mHt6K7mSJdzlqnvm4OKepV3dSr86UqEFQn2xu41/LUJlB3KPCJmYr6WF8LA0Us1G
	8QYQm+K/XW5J21SBqDCl2975l4fZBqu/ibpUTP/YLasU47gtvJwieu+sY2uE9Mar
	HKekX4MWM//20VwVHeogRNUnVHzIIxKuON+HcJ84w+5Kq/S1Pes6jRtEFxJdE8Yh
	+gi6EvKxmEr0SlT888V6DKyq7nZg9a6k6bJM2hcfP3UHLzsK4qGXKp2qy5lnO2hv
	Xc/80Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptatg89v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:10:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so6834261cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 04:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785237001; x=1785841801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Xm8oefJ2aOQq++XmyBNq+isCGh7+eMvMlTi84Tnu1Q=;
        b=hFKovgbffHq0tKulg1U2Zsl7fQwinFm4XW07SarXH3qTbW5k9RQ1GsmYyU50xuXiCA
         plO970aFYBcYf0gUU8bJqoWNR+GM82vfCuF5ZNQBEcAKA6WQFTp+fcgf4un+WJ4RupmE
         bL0/1atLuQ5d0RniJOyqXmwmBzux3HDhSsWJYIOyxSHaQAeTxJnY1zqujt73n7Ybpupb
         ln+ZLsZi4cfeZ3BetaHRwN8EQ1LrVXEsbGv0x9E91tupMpccJgbShLWfuL5RTxthsEbl
         k0M1wxg4XHkIxDaCK4B8xbOOJKHoo9dhtsAgTyLzQC3sPU5oxEUFCw8EygO2bJjoY2+v
         TtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785237001; x=1785841801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Xm8oefJ2aOQq++XmyBNq+isCGh7+eMvMlTi84Tnu1Q=;
        b=PNcomd0t4mg6SQPc1BTGFlnrUotMGlrdn/dt7eWkqE7/h2xU4yMJPe644hhDVneLoP
         JGw44oWGudvIbTqjVhNHwvqBn2TgsOIvu1S5//X/xP8/teE2V4tIcupprdBX5OUEHXVl
         ElQ7jAkGPSmFhpTaWKOu6hVb76xt8UUwXw1c2+XxBTkkR/5KwpD0pzyC8V6nlyPSP3uq
         W2+Jg9UAtcUFizhDCcGG9JSOnfvZPgaQVeoEQ1Ni6Xv8fwANoGBUyofISrrv5++JTn2L
         CYe1CN/ALD+l0ebWQapDO5mbz+4yLQvPV165Q6tpH9McRQtHKOCCMSj5x8/lgLq/xc9b
         0VyA==
X-Gm-Message-State: AOJu0YyTPx5zXXolvAD6MZBVdhzvkL+U4J8q3WlMwv3hgDSaWNIFd0n5
	Y+1KP5oLuI6NG2RqbQXhuS1pxspOl1OYaZS499YTlIrPrgDA0lKKjnRtRc74vPBPjl1cjcalOn/
	RJi9oqkot071HZHi6On5wGXUYbPcZC4xnX2wvGUft1TOlofIaPlnRmel+PwQnBunNFPH9MBEvOq
	F4
X-Gm-Gg: AR+sD11Qu2Z+ShV8yGk5Vvor0+sWN39svOvwhOlHDtXCJH+9uuYj7Uaequ/La/4nR7X
	GY5ob3avBbE08yUDxSvi8E7omHcgq5mh/NyCum5wHeiSsac1CevYLq3jJehCHhlPATsQYiMWQax
	6cIrXZcYIcoE2ERNMJPUAUs4DcwH17q71pSzpOS4LDk+Onu+nvhH3rsW/y0BxyUuIvBlcbYq8jX
	QgReQqYTxbZ8RZ8wOYw12WvaTzUpVcUzCSetLkDl2XvDQ0xp8sy1B27yCWYNK3J443p5m5IF2Cw
	qte7dZA3g4RcqFK8LRsuArUcl1uz8HHwRVLEshYxH2RlcFDbdwVOKGnDh63VLzkfwtovWZgwpBM
	x5NFld5fo2IWZ9CATF13JeMNj
X-Received: by 2002:a05:622a:4892:b0:50b:3489:5495 with SMTP id d75a77b69052e-529d7112afdmr13349241cf.8.1785237000971;
        Tue, 28 Jul 2026 04:10:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4892:b0:50b:3489:5495 with SMTP id d75a77b69052e-529d7112afdmr13348971cf.8.1785237000516;
        Tue, 28 Jul 2026 04:10:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c4196ed98sm678079166b.30.2026.07.28.04.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 04:09:59 -0700 (PDT)
Message-ID: <4ac04a13-c2e8-43f6-a7cd-8f113803de41@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 13:09:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: shikra: Fix intr_target_width for summary
 interrupt routing
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260728-shikra-pinctrl-intr-width-v1-1-46583734d808@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-shikra-pinctrl-intr-width-v1-1-46583734d808@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5OCBTYWx0ZWRfX8/c07gXtMXnF
 CftKLvzkAiU7nPQuJkxXqlaWSGkts6z8vpuEs1LY1Zp/XjULlNWLpErKaFt3g7ZhjsBqxaHnZFy
 v11rnCP4dSJxDKjeZ9uqP1muU0JyR6E=
X-Proofpoint-ORIG-GUID: LO6E1IuR0gN0zYW0aBPn_QchKC4QG0FB
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a688e09 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=z-2MmutFRShFpDa9hlsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: LO6E1IuR0gN0zYW0aBPn_QchKC4QG0FB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5OCBTYWx0ZWRfX+vo1rqsSSSi6
 wXMHP/6ex5KwZZOabI6Fk2QgIjPriOa6UkEB7+6B0mGoc1WD9w1KxeZXfS/7w+h5vHKznMOlan5
 adn/smF2/6d1jE/F2P8r/CuDSFHQvVmtnX3RL41WNsrVj5+W3iZ2LleXDAcrsGgieUzqfKFxgEM
 DmEo4VKTR4Defx+6Wfw3+EaNUkXm9tXeoyFWSLwheJk/V8MVOaySVgN8SrBoYXs54YGFxvLDuwm
 Pny1kKha6cqvUYzav3dsam0bP6igaDrufhPURGdFAKJGW3WuZa0s4dCqM4616RS5ssVCZ55x287
 GQg8Z9syIT6HJeYEU3sdyRkvALxjOV8l01eDZyTJ3NvC+FupWBJYDUxZKi1Uhk4C1yzUWEWPJ70
 P63s/gvIuSjSrI6omojwxerto3ZAF3Ug+VexbR08fe1efp+MUf0b/h+MIUMTYzxmmn05jMGUmmm
 3cjyzGPfBzFVdFovzpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280098

On 7/28/26 1:03 PM, Komal Bajaj wrote:
> The intr_target_width field sets the mask width used when writing
> target processor into interrupt config register and deciding which
> processor receives summary interrupt for a given GPIO.
> 
> Without it, pinctrl driver defaults to a 3-bit mask. On Shikra, this
> field is 4 bits wide, which could corrupt adjacent bits and mis-route
> interrupts. Set intr_target_width = 4 to match the hardware.
> 
> Fixes: 9db68ec534c5 ("pinctrl: qcom: Add Shikra pinctrl driver")
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
