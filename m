Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497708;
	b=imcrqcvYdIQgQeAj13u2/ZsqjHeP2iaIDPbqGC+ZlpNptA7DzKGGVPCg6uLZ9ANQIpRC
	 tlBQCQV9heqZ8pZXYeOhIt+Sbj1JHHotO7qI5c+xKkKC3U4CRRC4P9rJLrfUu1XqL5axB
	 pS9R0bYaME7w3jzN96T0Zc2dSphBtnXYknwBsvIs+34g5L3hgH8mWfOlnKaVqNKzb03eV
	 6D4pUWlm7asKdOIJYdLta8uFlPYR6BMN44/We2ZFmCVry0vkrI5Kppco3Y9jpIfOsyFoR
	 tSeh5+3I/sHU3XuXQFqxMgW5efWaprftYHONSo4K5J0nK/UugNFJa1fHb3zu2BwUx2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=;
	b=qyTAnjHFxR0VOJgA4ERrNnf/b7a0KOQIlF8qN3v6OLpoW4cvq6FLvpJw5R2osbzT049n
	 ODIxXIczs0CzgMXh2mtEmxg/KQ5AB9y6/gjIfnKf0bLoxhxfSaK5Gj3wEcuHTBTJikwiS
	 Jkm3BbvogmkNItYWAlW+AzvkDgU1b35roM/qcFzY5rCnaStZfzkL/pMai+Y//eUCIDsKq
	 +Rd8mC2EY1taJz3dDrevW1oMdQ9cfK/nQuVrgXRo7nyuA9MY62rA/BOKQw9zDPs7X0ouB
	 vvmxfEEqoZb2/vkgcfvjhChNh54s4ZmAeVjwQ2fsHnfuCUdbmKEX35m3wjhkhmvAFvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKxBXOIN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9xhNuMh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D623B606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D623B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKxBXOIN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9xhNuMh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx3KV2562778
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=; b=dKxBXOIN03woNdVS
	thwtuYdNCsc4hn3wnVlabqxaHdpgaqK7nE08iVjEja9F7EEAuMrEMiKLOzAo6G9u
	XSi8pdplwkzQQH9nTvfuSPpmdxJTGVX5Lwm6t0rs9hOGaP8eTExB0XFDrbjREgqU
	9D+pBdA/bw6Urk4adotjR78tUp0jbKuGlKxcbg4aNu9UxeH3q0kjhj6UUuB9mjlt
	DMyvtYDKd1EbIBhYr4cdzuvubU9Xb2dMf7/+PLjFMn//VX31oh0ecTLs5uZQSStx
	Y5cVU1VXznvA55Pmesj2GDI0X4HQzNlB9ORilDFEJrXP5RUPPh6vS+9x7566/KfV
	c01KyA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nab2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:01:46 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso71298e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497706; x=1793102506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=;
        b=j9xhNuMh6BIXbgfAF5DCDA+DrgFTexEkXKhGqS8/HpCZQC3Ie2nLHgfAFuzHKSUV8n
         ZbKRWNsF/Fu0Wwy1gkJ7Syhh1bLhxhIpfHYOiIKH0cfhNviIUKuvQGHC9clxn4Ih5Efq
         WmvC035GaEccgYxIu30kHLn36FDjAkjeV4FTLg59vBKWcMV4CC5tu6gfnpft27wn+q+q
         VqlJ0hmU+kcq4i0VhfEGG/ghUYZQM6iPXPjEd/f7iu+y5t4BDhC9qPfPrCGlN06M8dSH
         tAn/w1LDvj1CCK4g2i7L+jshnCjqkWR7rCNj0rF+GRbGtMvE67EQZYAUPLFSrrjZIRZj
         1tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497706; x=1793102506;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=;
        b=Ts5ySWFcxeb4tUovdp/HAJ457YeowWULUFftttDtAgzIMNpq75Z1EHa50SFKDzem3w
         Vj8+I2DSHQQ3qdhGgsLtYTVtetOks+sWyVwgZPwPoTdwTMR7I5J6PVfhEhOoc2DtUmt+
         9MULcIPsNaNiVSN24gg9QFR1hptrIK1xLxl2RCSkHaVUARhvAT+tDXaov+3QqDeiZB2S
         rDVPAvwnAXIrF3giQ3sm6Mz8ZC+dccA+wiYdrTG4NMW9KvLJj5boGXTdlEcM6SB+Imto
         vhUepQ8BjuITLc3wrwcT5umnLMAJjkTfapLR4af4neLa8JFtPnx20QW4uZBMeCA6m/2a
         Dsrg==
X-Forwarded-Encrypted: i=1; AKwUvByzpKV+g/dwl01crL32vYAzijfvXM1ZwWCOFoRvQdrjS76UHqOkzpozFobxbxh/XdLgG/PYMwK0HE4/SgBY@vger.kernel.org
X-Gm-Message-State: AFq9FYIB0k+uDBg5avnI56T94okKgdg9NQHFO0qSb/PXSmaefMuayqeC
	eNOz3lJOsN5fVrwXpFtCONNp2hQuI5wBnbQWugafUIQpkAr+Qz49WOVCLFLlsA8Qb7MbYSNttbP
	VrtBdLgQweQtPSEIQg+7WMR4C55HqhSo0zOCXBbgyac2q2j9jMGBpBVuOVulkYl0yuo3T
X-Gm-Gg: AYBFou0AGdCU1LClHeaAdRdTyqnFV5fvIIrJzXswnEDCS5ZOq7gxfeJJ9/cPQx0r7e3
	NpMIDjqYyZ6LdGRHKih2anE3keVVR+LwN57S6+C9O4ocgCNShHLTfIiBryNXs7vKbviOiphlmkX
	lVdlfSe29AhxFMOiTQmzt/2RGiiIbrGbLpXQBNhzY8m6nzpuj/5SdRDiGao1TADEkhyoGa4q7yT
	ZZr50oj2ARqTAgjXMIs9rAMFNImHwVPzhY7ekGKObT/ARWIssoXvreqjNPVV2jDGGepRDAMc8A1
	oWJPe/dw0xcrt/722+X63tv/0UNneckip3JoRtOfaOWwR4SjkJZT7STlMGxorxED0fFCZAHbkwk
	R/IrKHzEJt6+ePMdWnJ9wmA==
X-Received: by 2002:a05:6122:4989:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5eaaa107d54mr1758155e0c.2.1792497705788;
        Tue, 20 Oct 2026 05:01:45 -0700 (PDT)
X-Received: by 2002:a05:6122:4989:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5eaaa107d54mr1758133e0c.2.1792497705320;
        Tue, 20 Oct 2026 05:01:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32876asm481579566b.10.2026.10.20.05.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:01:44 -0700 (PDT)
Message-ID: <268aff60-c78f-4804-8125-c8a6aa10ed6f@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:01:42 +0200
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
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: Introduce lemans-embedded.dtsi
 as a placeholder
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZgqbWvf6n6OJo7_GPteuQ-SUImEwvmB7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX3IExO7SUtFIH
 W8Dd4PMVne4XJk6Uk6QmxXWYvvfng1JfPpzR9xX19r3x3lOfzqEmfOi9UrXHtt+9FSiuG6mUxNk
 B4z3nkE7b7TIUfYpbsm019uji1hef7LSWZQhteFVAy0VVhCS5XB4bFH4hYwaRc8YLQtI450DqRq
 lsVkbRDUx9yAfX/Do7tPHm4+FtmwpShkRSRuQ9oBz852UR6wtHScNYMJx8Wev08gKh3DHG0tP9C
 0tmLaM/EdDM6mWIuGfgPxgLGdIqQJX7VyhjVshTevoNwJpmQEHUk4XnD8stPWAy/6WFg13hRKzV
 SRHp2NdLL8Qt/Iw/lQEPixEl2+9+boECfRsIj7059lRMfAVeEG3GoPa4Z60yQBZ/N7LRKL7S6kY
 S+Vq1z9FXC6uuXF3QYZDWIdokRcXlwRwNhOGKppT67M6trYqEuehMyB5Zws7DtuvDD1ugZap3yH
 7gGPHoYHtjeqmbHrHjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX7X87xPmHzQuL
 nq3u/tw9AN5/PJBLCX0mfwyyx8B9hu0G6pOsDE45XCsrlbT+/6CU6rt+mjB8R2iv2G63CTa7g4A
 QBUFjLfLBVE1AN5ABnbrFlSWX+HAeNw=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad7582b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uVEy52KOV2DfC4Ai_b8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: ZgqbWvf6n6OJo7_GPteuQ-SUImEwvmB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Lemans is a Qualcomm SoC family that includes not only the Embedded
> variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
> also the GearVM variant (SA8255P) where resources are managed by a VM
> as SCMI server. The current lemans.dtsi covers the former variant only.
> Introduce lemans-embedded.dtsi as a placeholder for now, while later
> changes will move Embedded variant settings in there and introduce
> GearVM variant support.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
