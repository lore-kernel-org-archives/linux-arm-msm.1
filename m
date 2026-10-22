Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657016;
	b=bLcJjIYTM1RF26VvEBYTuYY/qBUTPwH8FsD53D2Rbk2cQlk40gdujj8EQGR9j6KSYRRG
	 hSCzDfLLGsB5GH2iSIuHDZ8gKYKkeQYItdOesHf9h/vK6nUpGNK5oVRn8VtZwM7S6Uv7B
	 m46krxu/15Q555/FLo5rv83geDMeMORgc98MaUMvCFom83J5g9Mwzu3JX7pdGTp+/2Tlx
	 P9qqZiOI2VTgYnJq5SY+46u535Sgj9su1NRCeo8tcIRjxe4nUGybfBYtTEn8h1L1yDJ+m
	 ANNzGOEqUXdFmBdxrogArWynpBsMf+5ynj3qPEfQwcVSEaKGdgkAPg9/2SFuL6xnviQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IIB9DdNMzIlxt2KlD4zdFNfyJp3fuiqzqesEMrpwmaA=;
	b=cAj+pBBrRrq6e3esm3NTFphWOdnAqIXlRNeH6YlP+mqa4r+TW0TTeG9sOh8IDqbALI8V
	 P01fI7ee3r4JuaAumyf51IVVeQWojJuIKk7r+4ggin6o5jarO6Epy2l3b6M6zCEG8+YRW
	 4gLQKaxQrSsrPW2o7ajtVZ4EPcFeUrBlFtmmohbLawoT6ywdEeaKJhDfdoMuupbv6Kfm1
	 ghYPAwl1rv8hG8UWop14Qx+XwDvArEAphbhyIpM7kt598WwP97V9fSFlRmBmG/uQrttJ6
	 S7utOYUysevEZpwelQE6vFmMxDKNuzl32/dff8kogTVWdTc8szBE3VK2aqu/gOjVLIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RBey3x0P;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiDZEZto;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E4A606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E4A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RBey3x0P;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiDZEZto
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7096a1996053
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IIB9DdNMzIlxt2KlD4zdFNfyJp3fuiqzqesEMrpwmaA=; b=RBey3x0PAA8qv+8B
	ZSN+JHUdmKml2vThXWx2k1gQkNSVW/CZF+WUV6rubihP5ztGxgZD7LWL9Cn6bxYG
	XhRlbkW7uQdh4ma0E6nRO1VoY4Pw0uOcAq4wsOZtW8mOOclc2C2odB5/oh0WK9P1
	cQNuU0+URTZdW8oj/U7jwqsiE4T8WzDSKZlzoxrIE6mohZc7+33IIQzd1QpsP1eZ
	8Nek0f3FmkoOWAYjPdjuSK8SeKExeWKdIawMQaizmJZY30KGV4gq0rq599NFNlkO
	YkqfEZTLX5YyUvMMz8NbHIXJ3NxE6ULK0P/37jxcBU0o8Bi627rlSks6tgjB8H9Y
	xCoI5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bscjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:16:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso28173085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792657008; x=1793261808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIB9DdNMzIlxt2KlD4zdFNfyJp3fuiqzqesEMrpwmaA=;
        b=JiDZEZtohmW5xAXxwhfKKD/TjXNDPhPNuSnC7UZbAi1mQo5s7oNAV2O5AXP6h+OYDx
         F+hgsjIx/ZebBDu4dkuxye0GCii5B/W5/NVv2fbDh4leSS+ZcQcLgJpG5V+l8a9EiqTR
         XWl8nGIQpFPF4/PH1sgwm5YSYIwaDtKc1z+8PKY7tK6aMz/Z8fVuaI0SFEVZpkq74jWF
         gsEOYh+3horXHMw8v1q5k5I2MNb6n0t2jsMfq7gxfp1mYMznl7KEilAx+YBQs+eJ9hZ1
         QwkvqUDFXnU4r7+5516dUcUXQJtnvMiR4SgLne9+EzY6dBK/5AN7CG4TStLJVNqMgPoY
         g0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657008; x=1793261808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IIB9DdNMzIlxt2KlD4zdFNfyJp3fuiqzqesEMrpwmaA=;
        b=dcfjK4cIDyvPfjWZH28VQz3Wj1vPYzSd6itZrlBYSN7zlGOEV8VowznqiYlCnQY0t1
         aqxHzJwEm9Fr2LdCjGbuQd8dHPwjNDlCT2VWDaAmGL7dnZ4R21Zg6PUyGSshj0mciODX
         l4HNdA930tdm6fj2HPh/Ole9kD1AsxGzzbOvJF3UhJjESOXEEwlOsdXQ1HId7ZqxRQVh
         cS6rOFPTV78suF7F3ONQyyiD09AGDZedFnUpUKK2/gvdirfrhNnslTr2bca35rNl+i0g
         ASIQHBcAqYYPxtG/AIH0f39lFUXsO/s8WLNsD4H3KjQPLXGka5ifJ13OniSrVkrzEww4
         BKeA==
X-Forwarded-Encrypted: i=1; AKwUvBx8mz4L0ERD0jZOWkwJQmhMqQJ5mFFV7CBwEgc90xVqe1YYNZzdktQnq3Z2KEKG7xi/kgN/egK8qy8Wheiz@vger.kernel.org
X-Gm-Message-State: AFq9FYJqG83GBOR5vYTlvzf5RPa1kbwGDYW1Hu91z0lCyEkgdHQV4hD+
	T/0KSndqAe3uwEsY9RTEFlf73Wv9yVZ7tvoVARtvqXtrjNr1qwuc++iJMkLq355tZ2rldHv4XlN
	g2dXuTWG1Xcduq+EgaHvYCYAuci4uabvM94LoYV0EBLpWsErP1ekRVwZsG9mqqww2HM9UQFyrat
	F0
X-Gm-Gg: AYBFou2jPqMA1FJjP8Oh+wqKoKPlBMLayiqUgxhJyYjt31d7afgUQBj4XriqbvZdWg8
	sIc4ghx+SbNH8hpLoDMCrFYCBjqiSOgd4DZxMZZ+LURmPfEe1YRN7M58phlMvyDVocmfwY7JrPc
	1rjSoTKPMtjkNrFKY+hvFdg1/424nRMEy1A/5qS2pIDNrcr40JvRwpHvBeGXdAG3eTMOd52hYOG
	bNPen98JgW8P2F8aANTYN6dhc9ZyX/2PFfGoiIo1xWTwbAfprr/imvx7GWknC8qyTG2SVY+nqK8
	BGD5YI5qQ3+XiPHP85uRjM5214Qx5lyOgRk2dRNkzstSIoeeN/NLQaS34pQDZNNZMqZbq7uiLuB
	u5QF4qyZST6vRxY1Mr82glw==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr953574785a.2.1792657007663;
        Thu, 22 Oct 2026 01:16:47 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr953570985a.2.1792657007017;
        Thu, 22 Oct 2026 01:16:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a594fcdsm79332866b.50.2026.10.22.01.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:16:46 -0700 (PDT)
Message-ID: <52fc4222-508d-4acf-b38a-7b4e5aeff3cb@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:16:44 +0200
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
Subject: Re: [PATCH] power: supply: qcom_battmgr: do not report power_now on
 SM8750
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-pm@vger.kernel.org
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
 <5bf3636d-be7a-4800-9914-808d2fc5ebd9@oss.qualcomm.com>
 <179259054168.209323.8102186130128474174@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179259054168.209323.8102186130128474174@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ho9kd0_e6tEgqdng5_WXGxypn7SIxewD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX0n8PooImoKbX
 Afkr8536jL10/WlUQyDPD5Cp+Gp+pHoK1OrBwWQQHn1KYLIZmsF3M5/WOfk1nZAdXKSaxBWS9VZ
 IwtfZ4L6rpWmQnV3t8MnTukrwzU3oGo=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9c670 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=BJ5YTGBQpeWqlfnRveYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Ho9kd0_e6tEgqdng5_WXGxypn7SIxewD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX50wDTZjjSweV
 ZuB2d7NOpqN4Y0U3+cG1yaabI5bEUXk2ihuIQWCWvUOp04G3rBYNigNSxPg5C4wMSvu4WIxTs6X
 G/BqiGdyNm34gn7tU6jfDtKLwEWjx4/wUvvHns4fF+kcRDPVDqyA1+N2+OrvkpFlf+I/ZKm37Qi
 LttVABLo4MHkqRhMUmTTUJNMI9blv9jzXxvqGaOkYpSsS5dZo8tR3agz+lIIc7yH+p39d/PG+iI
 2n2oeruAce2TvdWMRNBpuRBrXS50e5kF8nLsZbX2PTAME1Q1B8k4jfVd//gM7ohdIzGmoFSwjr4
 kquEiLF5VJnBxkVYqcXwwXVHiyuGjRHRUU8SKtmPjf7EV8d+98Jj6p+LRMyg6sU7Qy0fBa5TDSF
 vhAHqIPNYOJkhfWXMWEcebZY37VsOTBEWLwprUmF+aeaM96oNknt3jwQxLb+yXUr3fTRQgiJAdd
 VBCfOeP97szMXrJHoSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 3:49 PM, Qianhui Xu wrote:
> Hi Konrad,
> 
> You are right, and thanks for stopping on that sentence.  "Maximum-load
> updater" is a phrase I invented; it is not a QBG or battmgr term from any
> document, so I should not have used it in a commit message.  Let me
> restate what I actually observed and what I am and am not claiming.
> 
> What the driver does (no bug here)
> 
> qcom_battmgr_bat_get_property() does not sample anything.  For a given
> power_supply property N it reads the 32-bit slot that the QBG
> notification buffer reserves for that property (in the SM8750 variant the
> battery property array starts at context + 0x6a8 and is indexed by
> property id, so BATT_POWER_NOW, id 22, is context + 0x6a8 + 4 * 22).
> The driver faithfully returns whatever firmware left there.
> 
> What I observed on the unit
> 
>   - charging, actual input well under 1 W: power_now reported ~89 W
>   - discharging, actual draw ~4 W:           power_now reported >100 W
>   - current_now * voltage_now in the same samples stays in the expected
>     magnitude range, i.e. the other battery properties are consistent
> 
> So on this platform the BATT_POWER_NOW slot does not hold a measurement of
> present power; it holds something closer to a configured/estimated ceiling.
> That is a statement about the value, and it is reproducible on my unit.

So it indeed seems like the OEM modifications are the culprit here. Do
you have downstream kernel sources for this device? Are the properties
remapped? Is power_now disabled there too? If not, can you read it on
a downstream kernel and see if it also returns garbage?

Konrad
