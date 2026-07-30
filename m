Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8A24119E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785410142; cv=none; b=hJqRLAqpxclnN86UxQUvavyVbicCAJhhj9TwR4NTvBeA77PpbhhVg6zFrGYVyCgsG8TR/bZmIobFry/NB71DW2nENGJG0HqEW+WXxqiZ5NXj+M0jNVX8V3IzESDOcDwGEYkuxrxYWHBFtXej/vuYPjMLIzjLLtNi9cSPGnDmYLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785410142; c=relaxed/simple;
	bh=HxygEP3KyT2jE3JWmEc9bGZAJMJ1SLMYbbZEa4ZA9Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLZm9TFZWxGlk0huJSGIelI1MUzwX8vR4PHg74YF9+YH5DmV6MuhH6N9BHt3wg0IHG0gsMVIQqKHWfjqMihVUD+6/ygp5pOU3da9Ee0pSceUTVcgt28JnmnktOZxhtOhoUwmQbuGMU+TO7kxmdraTBk3rYFgjApxFQW7HDYzalk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5zzTE5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehVZjQaS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5zzTE5I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehVZjQaS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2L1e1663847
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yayerd7KpbuNuMSIUfVtN3koai+QfjdPNE9Mq1gz39k=; b=h5zzTE5I4I2O3mTA
	cbLmYykTp9Ku6e5Fmm8L7Oreu3ps+EkVp0of7zbay/LtewzAuOJeyOTBuK3J/VaH
	4PF/8croEJX0C9JSR9E2ABdtJMpxTnDBdFnSZKtVPgJ0qMZ4z4s62g7VT5dH3GYx
	ydjefX3IspqV7JB5vom+Bii+4Xa0bltRUBWGEMRQLDLrj7BVbx2ZMwbXXgeK2wU+
	Yf7FEFmp429hm+NKst29fg+kv2ZhC0KOJcVqY64ITSZfiNhCP9034EiBAOAb+QIV
	IqyFlu2NQuXAWfyhJGt+CF33sXmv/9VfFyWAo1ap3Z1rlCyAyPDJhWRXagNkqS9l
	6wFUvQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3h1rmn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:15:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b81c13b0so17588685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785410140; x=1786014940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yayerd7KpbuNuMSIUfVtN3koai+QfjdPNE9Mq1gz39k=;
        b=ehVZjQaSsNTFrRP6xqFJey6aPlZUhf4zaHFAcJ0tM8rMP4njisEPI7MVzGnVv+g6sd
         DduvVmXyUfkNfMPf15YVModY+WpCGyXgaWFaFeGQu7H7Qk1YYwWjX6UzZgJOMFokrqjM
         f6z/6Z5Gu8fjAKWd8CvOWoMtWAjVv77LVW51j0JyMhLr91ec5eC9kSgM7IWHe3h9cheL
         oy7GWmcCsTp2X28ssjbwLBnbaHBvp6Z5GOXVfgEUjt9otASHB3Z19KPg+VH081hFXyi7
         LeJ/UdQ11pdPpYus49TPvP4aRdVvzQkzgRe+vbAC/jTw5qWF3LSRU/wnsCkjYqhLzxhc
         sLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785410140; x=1786014940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yayerd7KpbuNuMSIUfVtN3koai+QfjdPNE9Mq1gz39k=;
        b=P1c3UFc8c/HlK3/nPsK6pHmoaISUrJlsV2MN9X3Zt/JtsZMx7e365NBlgJfXkTLiG/
         yCRciHx+cObFJujjtOh21NGVUp2NyRGSjD8ccFXDuDoqWOnh3b6r5UDLm5rbZOZ2IzdK
         +doecNc/pLw2+84PGqw9q/j36XZ+eZbaFO78iIvHRcRgsqFxQDjN1TvapLDtvIbPnTMV
         usEcyL7LvYvXcPgm1/9SrpUzN9BkCV6xhAwH13DhBhzJQoaRjNJ5wF04OaPQ5Fo4oE0I
         DLdoC0K3qKnQoCeN10rEhGK/WuN8ai3dfSm/gq5gNkLl0/Vw7eQO9dAVSvyT+5+BuVFt
         z7iA==
X-Forwarded-Encrypted: i=1; AHgh+RpDJlDlIxnd9aYZLL55JALYGUZH14tmCAqj/YYbNt1oYeUYGGdU8JKg7vxcR6GOjdt81otdwlNy37V0f+gs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27PAwKT789K4t1yyQqEqGRuj3RonTzZPlvkRZWKApXcuUxMUx
	7AOPdkjczXQAdmd/8c8krS4NGla2z4r3GqJ5H0h1fSgwqbY+IQgmJdJ/lCc+L1BeL1BjnYibC28
	gpFyK2IcKaHh1bjcNSACvf4dwqpj0sBk3PwJdQe4cDQesy8ioDjvH7b1sGS8+L/P4C6h5
X-Gm-Gg: AR+sD12NTdTJ3FVvUXaMW2For75Gw9vWK/+Qtkd5VB8G5QNmj8tgjK5bbvX3k8SsZNs
	4U5fZjpv1BhOoSUtJCb37B9JD1hICwgQXcCorVKGCC+JZz6yleupeEzqSAkCS6jOHETJPGrHs6j
	j+UEWC5wWcsEyCGH9+sqYzd3PZvF24JJ9NeMZZSW8vSWAYq41CeT6Y9Krx7PeYxrq8Zw7j4fxAu
	ROPNGVUDmXf/9KsJVqkv0EVsKv6ZdjUQBqR8cTYIsJMnD0aZzEzXTM8zfd7U/jadfLnwH7etx9q
	DTv+Vwh/hERpZPEEuG3EUbodWs8ob2t93n9Oh3mVy6sqHJ4T1YFl3H+Ami5fTJdOKGdRl7ehgLR
	MQ4qGHw/dq4GSTZ7ibYrfGMOO
X-Received: by 2002:a05:6214:248d:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-908348e1e80mr33531366d6.5.1785410139525;
        Thu, 30 Jul 2026 04:15:39 -0700 (PDT)
X-Received: by 2002:a05:6214:248d:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-908348e1e80mr33530766d6.5.1785410138930;
        Thu, 30 Jul 2026 04:15:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa85dbe43sm57334066b.27.2026.07.30.04.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:15:38 -0700 (PDT)
Message-ID: <a5e953b8-89fb-4f65-a299-37352d9f6fa8@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:15:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Remove driver
To: Eric Biggers <ebiggers@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh> <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh> <20260724155144.GA2032@sol>
 <20260728152241.GA4281@quark>
 <15904301-fd03-45e5-b909-dfce52449726@kernel.org> <20260729145520.GA1702@sol>
 <50d9d0e4-28c9-42b6-8b71-e75682b4959c@oss.qualcomm.com>
 <20260729171850.GA4454@quark>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729171850.GA4454@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aAS6Kmh6p8pnqcC7szSO_dyxdfrSicMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MyBTYWx0ZWRfXyd/zexhGTSgJ
 XxhHTSId059wK/B/skGJEgLNiHB0Z6moLKo2DnH+HLLhvvUTFH5StySOYoizGdOuSbMlAzsAe8o
 8Du7uvRafl0Sls6NaMbFSbqwazrSmKm1KYDVXPYFL7il3twjPvkCBTbYJTs/fiKZSHPbxs6uHji
 TjfNfrb7o/6LWN53OKp9WjtfH6ENtVv7s4D01cVUpo/JMzSY0FyA4Y83JskXkjE+hRvetbzNudm
 G/Fy2CW5IH13wTHQgGVPBkhrZONSbUSepYqqUhXyMiPqfj7G/REPxB5y5J++A1OUX/ufzyoejOn
 poOn17nldlXXlWtrrzPfqByuoU+1xn1YsjshIYTlE6qaLuo7Qz5FFtAoTD5tkJAsYNxrjMG2HKG
 o6qw2E48qc7fL+1l7nhpvJxvBOLAUiN3T4b8P/NVDLPVlo6uBuXoytQAKR1mtDd7W5QVNbCjpsV
 EZbnnymXTrfjtK5K/qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MyBTYWx0ZWRfXxbwWYOkRrpPk
 bv/++z5vR5GcpA4oXAmoKPA+EkW7LbyxnxYj32F2cPKSGxFUofHOm5s8o/XDDXaFiBx6+PIzf66
 xBVtGoAjMoEjdzCnVM7mujaVHrxLz4Y=
X-Proofpoint-GUID: aAS6Kmh6p8pnqcC7szSO_dyxdfrSicMT
X-Authority-Analysis: v=2.4 cv=K/QS2SWI c=1 sm=1 tr=0 ts=6a6b325c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=_TOfc9kH6lse8ksE744A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300083

On 7/29/26 7:18 PM, Eric Biggers wrote:
> On Wed, Jul 29, 2026 at 06:55:20PM +0200, Konrad Dybcio wrote:
>>>> Unfortunately removing it drains way more battery, because the buses
>>>> never hit sync_state and are kept at their maximum frequencies:
>>>>
>>>> [   18.021823] qnoc-glymur interconnect-1: sync_state() pending due to 1dfa000.crypto
>>>> [   18.029605] qnoc-glymur 16e0000.interconnect: sync_state() pending due to 1dfa000.crypto
>>>>
>>>> (it transiently also pins DRAM and friends to max-freq which absolutely
>>>> kills battery life)
>>>
>>> Isn't that easily fixable by marking the node as "disabled" in the
>>> device tree, or even just deleting it entirely?
>>
>> Avoided? Yes. Fixed? No. The DT is valid but Linux can't deal with it
>> [since the driver is gone]
> 
> If needed we can keep a stub driver that just disables power and doesn't
> register anything with the crypto API.  I can send a patch that does
> that.

I believe we (are going to) need something like that in the kernel
for similar cases, however I'd rather see this driver kept/reinstated
for the reasons Bartosz is arguing

> This is an interesting twist though, because it means the claim that
> people can just disable this driver in their kconfig to avoid the
> problems in it (which is being used as justification for keeping it) is
> actually false as well.  As well as the claim that adding the node to
> the DT file is "just describing the hardware" and has no impact.
> 
> This would also imply that no driver using this sync_state mechanism can
> ever be completely removed from Linux, ever, which seems odd.

Linux has always worked around various firmware peculiarities, so
I guess we're just continuing the tradition! :P

Konrad
