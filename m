Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26D73A9D8D
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160101; cv=none; b=bdAE3Uv4cfVIE3foHAUOSQVEARFWwzimc0TdXp4rYvpXKX5cbOBjKGJU+fPropMQxGV8Srggi6+s7Y0HVuhjpAjnrwrAUmTbv3Tr/w8vmRmu/URJyc2GYxxVUlLjOQBm9sXNLEyfV8/1uBcM+Yahf5zygSqDqMxQ/wfKQrDrC+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160101; c=relaxed/simple;
	bh=OtDf5kcTqEA1PEC3v0u0wM/mWSz9h5KHwFsQnufun3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmxL+vLLXrsjOt7nVYAkc/aQewzjLX1ewo0rnRXs1Kimy7O8fLBkF3uoj/Hg/iKAdJSaICRU7f4YpA5H/LG5KruOBddTc9Fm64vDtT8sDe3eoHAqufWuNlRtQ8XuT+vEp7+TIsSPxE7KtTc4XY6Jcci6phIDm9u9t73nuyH/rn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WW6EBvTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIau3zYA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WW6EBvTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fIau3zYA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52qiC2522826
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5+jtKls3jVZt1Vk8tCZgUdFuEyXJOu1YclDw7gKN9w=; b=WW6EBvTthhXbs/IQ
	QKblKD9+s8LJJUVw81dIUv2Yv9CxXVAxNFroXU1TMH/OCnOfzGfZmiTe3//aew25
	nloGvaRIljsbOELbTRFcewDIR4aCW+nBzX4b59eSZORL7i387oWq2BfkmreOg9wk
	cwVlretRiHb+33uCW03OxZH1TXGtLZNS9pwp8+q+cjqe1PNQcH/wxEWmYrQD+uVs
	S+cRxRN6HOd9BEsa2ha8YfD88YPWGQ/dLkU8KFWQjHktapOYaju/Q/d5DsyT65CB
	OJh+wSfv6xKK48YN3crcC3G7+2VP9jyKagRW2olSyMccQCtZsw5neJAD5K96ZnXc
	zZU3bw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w9cgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:08:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fa40fed05so6295121cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160098; x=1788764898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5+jtKls3jVZt1Vk8tCZgUdFuEyXJOu1YclDw7gKN9w=;
        b=fIau3zYALqBXVxnyZuWM2ztooE0hOL3PTGhsD5Kbd6URdw5Hl87QnQIi2ITlaIlcBz
         BjrmIXxYVhA9lhTSyD4ep00EwpSOJkAI4jS98Q7bYSJErMGj6paY/nBu2ZjyHsr+g3vK
         wZ67z0DY1q+tIDzzXkPt0ifRf1hOf0deJE+FTy10NY47C1RVObO6zcv76ImohIwsxF0A
         X2git/OEHD5N7/lHOhNbyp6ec6m/Qj7Pw1CX4T9FogU+DiVKkb5g70DP4krylL7+47/d
         +0Zx0hHspiVxv8teDknh6WG5qi3nHohLATI95mDujBRW6fFumQ60Lw7ETwOY7BYoposz
         v7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160098; x=1788764898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5+jtKls3jVZt1Vk8tCZgUdFuEyXJOu1YclDw7gKN9w=;
        b=WoX6bHoH8H39CHa2OHkr2bOuzEDSKh+E320NH44WAWqz8AEBgXogHg98igylouYIIc
         CUZgrlrSvVv6nSq8qJMEpdb2+HPp/2oPQxdH9Ig78irzYbdp+TtHYz8wgSHgCgDhL1h2
         DwvMJURw2eStZzPO/2uKnW7FDQQQ07Y4BaRYxIKOpWfVanfu1az93OmJTONC9ZOwbXAC
         yHcb3IBdjBi6pkhPVbw//eaCOTreA4pKn/TCenIAdybRpjYCsab5x8P1rMmf0flbQdhe
         ln6VhZ7Tn1mnHZRq1fdr/2bbHjz2g1+nVrtc1lgSBTe5Nzr0SwvjqxosYgl6dQw5z87L
         ZauA==
X-Gm-Message-State: AFuF++l4gZ31innfeb/qYynnfsS/9YU7y5yoMjTcuAvLLflTF5e3B0Gz
	TjCATLRPMDkGlSYJzfID9lY+mrprP1w3tbeHxvNys9psnp7zuQVKg14bTV3H8ZCk28mHA05LsEL
	ejus/R7L2jiONOPn7eUKtHTBOYsskviHAsjRpz0CTpl78xOU4bTf35k0GqY/CHWCa+cbh
X-Gm-Gg: AR+sD139ulRtWBX8eT9MzSKS4WR8Uiszemn3u65BRVKprNoHFZTLBWA7vUascDjDQBH
	IawwAiZEhCxJf3TSyCpzxkZmrdORi0TxkErXQB1j1pRXe75ZtLNBbXcKy7LU6cdsUam+FK5PqpC
	iacapqr6DrBHSG5ooE/YV7l5H/zSqTw8vgJ0Or+OLubfCQO0QjlybRhhff7M8E5xDx612fdUeAf
	0SHXGHyaRUByHfofkEnumb4YzmJg7oUqzcbUAV/EqrI+AnJ3qFELU03ljeYtFO/pwYRZ88+ZC+6
	pgArbVw6jSIpf3G2QowJqBgJsOwLdjg5t4ePxvRdUAkqNL0KOYlcLBsIeqVWbVlQSy85rCbnLDU
	zE/cW0cupko5Y1tKDrnxRDw==
X-Received: by 2002:a05:620a:1b9a:b0:92b:7420:bd58 with SMTP id af79cd13be357-939285432f8mr768780585a.0.1788160098285;
        Mon, 31 Aug 2026 00:08:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:92b:7420:bd58 with SMTP id af79cd13be357-939285432f8mr768779785a.0.1788160097890;
        Mon, 31 Aug 2026 00:08:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f249434sm389101766b.55.2026.08.31.00.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:08:17 -0700 (PDT)
Message-ID: <1ad7deb5-5544-40aa-baab-865a4612af70@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:08:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Add per-PD proxy
 performance states for Hawi CDSP
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a952862 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LiietuZ_TH7RrXzX-7sA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1OSBTYWx0ZWRfX+nAFO3FBCxVU
 J7FPdWKkW+J8CoL25lXiHR5vpAbMDaE7WR5sTv0NvnCMulXBPRHVpYeQFsYtAqnqyBA/u3V2Lwd
 NKW/KRm35snvKIQrW+jb0ZHFLzJfpco=
X-Proofpoint-ORIG-GUID: jUA1yAyXTrLya8P4OmrZE2C3xZRibg0W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1OSBTYWx0ZWRfX4o1z/8pkAdlR
 XWTykUVVu/ZrefDcVwzQXiE5LDxPHLh59j7Z9zWsX+JYKLuVlJbX6i7kIigWerESZh6gnFceb9p
 JiRvKjVK2r6OMyZ7+7oBRbJUSlHO3kpZ9x01puAmBgMxxFo7Dp3IHlLEkIu2xSx9wKZ+dZgNvDd
 W/hmozk/4S069SYND7c+0bLzBNI6UC7G9vRqdy+ik/qaFUJ9gO14cp+qiRiGd7MWcH7YaStuAjh
 CtRfkpM98Y9CJP9GQtKPDV7xB2oZuR5Vyt/RIxlKHnmzQHNxM6d+fU5yKHRwWrRPKswPN6JdvYi
 EV0IfeDwVcTm21eLSNTTqRFQffnfVFOYexvF35k4e0ISa/CRShH1vGBDjBZL/fD+mZRsEwAkGnu
 ZF4Jnon4oTvKEN/uHPsCsOo2TpUeeOO+IWBKoq/nKpfIIoKvvLFbAqvC9yaHiOnPG0iG3IFDLKs
 g3vKgk2UjVs0Y+QYScQ==
X-Proofpoint-GUID: jUA1yAyXTrLya8P4OmrZE2C3xZRibg0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310059

On 8/28/26 8:13 PM, Mukesh Ojha wrote:
> The proxy power domain enable path currently requests INT_MAX performance
> state for every proxy PD.  While this serves as a "take highest available"
> hint, some SoCs require specific per-domain RPMH levels for correct
> operation during firmware load rather than a blanket maximum.

I would have assumed having a surplus of power shouldn't be an issue..

Is this specific to Hawi? Is that a firmware bug essentially?

Konrad
