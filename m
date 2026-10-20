Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479349;
	b=u+XxKvRI7BEB28N74yrlU2Ht9bcRN3KpZytFAk5rm1FONt81QD46Os4T3Ymb6DamYv1H
	 ZMNU61sVacA/Nlh+EYQ+bqcpgqTqBlREJ+2CSU4bvmm+8a2bHvBATj3/a+XfpHsJQsh8a
	 ArTXSgjIn5xV71N0fKxuZD/pfhJI3dUWa/P8JRqwo8COUEyj9oqfPACx/smgFaX/Ep/ym
	 HCo9r/tOybP8Ah/mH7txzgl64v9pEZKhAA5hYqHXy9HtpH8TkFHogM9aqGmxrMDcr3Q7e
	 +WDn5WCCvb3fAmJvBraYja0p1ck16oVJoL7j9/K39KYgsE/VSJIa6wK0XIaw+Fuh6FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
	b=njqWOHhtgrBLKR2mVrlNf6QbrvGoNK3p517/GcLJuLmEuVeTt2b1xUG8YhnK+fWU4Y2j
	 dMh6xEInD/LtsnQwnHUnf/s4Q8A78ILDNOwbWZB4Z9fdkNwUklTRkq3FUJXFm9qxzbEBY
	 dYKFg1vWbY4Js98DLkA79r3L90fk6lHO7nfsbu+3frbi+S0gB2QxbvYyGmJ9KWFL3rnE5
	 8/cwOSiSpuiHblR12y8DLHqVPcEkIStJvMm+dF8n7djI7/heLyexXZvUSkEFA1ZO31ZVQ
	 mQ3bISkqptM1SG08raOm8pqhjYmKHexoAtabAeBxL8VqizyoDq3s1ZMBr/dn4v4ZE8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOXZ77JO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GN94tP+b;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53DE606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C53DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOXZ77JO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GN94tP+b
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tP5Y1211286
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=; b=eOXZ77JOS+5qBwf8
	yoW8ccNz6u9NkcR7Ur48gQYnAw6ikuD/RzudVJG5cw9DQmva1MIcE1ziZzmp3XWq
	uBW+/fy8zDWIE9W7y1oPJMv9RwcUCD6UEmd0bz4cbWAv5gBw6XvgemJNgy17z+y/
	y8hwmsT/nHyt3EydGpXFXzgrjbg58hV9ICuRqW3ifduW/gGaaljN/dOXidJiXNKv
	pyIg68slO3S+tYxc01vAbjRpRmkPZxY5D4oCvU2o3dtTxz6td1bAOH/LF/f/WuAH
	Tp5A/fj3W2Ae5/YLvJK7Gfu6nIx2zbRf59hKDkiW26bKWiXEY94Ce+mRVOen0GzY
	6eV1BA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p18y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53568f05f8bso9157981cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479347; x=1793084147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
        b=GN94tP+bZHBnT3KXoZRkN7W0lt/V33IcJxiDEUjRt4LpIpb+VqBm1bjcyomlAh8wpf
         PtRNEaOuCHWW1r0gdsfOtWAvU9H6oCNetbV3pgHmKOKg1nnB9SGAfb5jA4u4ZsN/TZko
         Rx/l62hmkGXZuF9FDQZOhHnRch5mOxEFHE6sKlAKapXSUf2YuqOneDukIELehFmudWWt
         cGjClQu3bF+CM5+PAiE69q8wcilEGv/Qv9fkuNqJEMz+u8Q8b455sVD/mb2OKLG8YFBF
         VFnwKRp7hTTI0wqzqFKLm++0I76XpvEKwPHYnpgLDNP2/lAN5rFvJvFwXhIsDby6nLoN
         ovZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479347; x=1793084147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
        b=hI3C6KRR5vKixIZZeC9MlAh16Bp8Ty/Upw92kJWoDe+W7CgUTfGV4OfJg+olmmyYw7
         SRoyHj4t1sud/T1/y7v1zZtqcUkUubLVIvZP5lD3VS1z1+2v05kImpncjAYFtVHT68YK
         mPAw6SYr6YVntWruxOlafNfCcXlYFMpWfZWR2QHz4hXo+K7Mz5Hs4OclRj3aZaUBGuqg
         9Y75cXRT2eKPbJa/Yv/ysQwMfBdxM3nguxb2fSbd7HS9CfKGxI2GTuzLy/lbCeudaV7N
         dDH9Q6ESDJG2mWA9epymvcLQU67OSzp4QUXu6PMCpUrYIG0d1jgW5VhcRyN9Oa6suWbp
         1mkQ==
X-Gm-Message-State: AFq9FYLnuj+8Ht7nWu/v/SYHT6GdQQbMzj8hzaFZFJ0FIHDpOJmNE+q6
	3l/wDyaAcWIdxj6TFt4HV+/E945wkBa0h5Zx0mXlYPoHUmKV0qqVagnMuZxzTZ+Ke2XPSlQkpxO
	UXT4m3JPs1vKYLR1jN9Jll/xDc/U9E4Jr/HRVZMk/U0x/a+NDfyiHyx0WFdm0svcAmFoM
X-Gm-Gg: AYBFou3wPoUBbG4twsW49X9YEcRzUrHPWezCZUVeXbQBHucGXcNQ5/PSgxQLRe+O1kQ
	0/ZKxXuIfZqGFZ+pj5og6cSDz2ptFgU/1N605uPnrBAgxGgWMFdkr3/sS5+kx2O0yTVkNOAwggJ
	81oYARhw90CyRExETN87IxGSxiilG8qjbAi3r3ltl5SpBb+reS7tbSENyXXyjFIj9vl7bqd8VI3
	t41rLN9ERCyD+078HkaAZEB2RkcBNzZcStMMl8vk1UPWcxYaMottJcxmENcP0iJoKcrs8Xnm9Hg
	GUyPeK7+RwO2LCZj/7FryTpKU2P2+WN5QX5oK+OsKHnmE6NxREDjT/4vF38m2fP2m2mC9Wp6ht3
	B3kIKVgpvqFHt1qfdHmnRtw==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169672831cf.3.1792479347238;
        Mon, 19 Oct 2026 23:55:47 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169672411cf.3.1792479346744;
        Mon, 19 Oct 2026 23:55:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eae235sm462296566b.67.2026.10.19.23.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:55:45 -0700 (PDT)
Message-ID: <4df039eb-f89d-4a82-9f2a-dc90e31548d8@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:55:42 +0200
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
Subject: Re: [PATCH 10/10] arm64: dts: qcom: msm8996pro: use the MSM8996 Pro
 CPU clock compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-10-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-10-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7LjT6MIy-uJgUNudiegoepJUiGvb4US7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX19Qtc2rlpzQg
 SiUa7tAuY3hk49FAIWnK8GKRjJkj8dwpXri/lonQEuzQJCE7aF78YKz0kl25Caf1O3Q7r0bIFhK
 jKT7fhATTMZW5Zi7pgb1vXWQAkuzvxg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX3ifqU/RLIPV3
 Ge8LzKYhjiMnxTYjWiueL7tAK6AtONq+nkAv1I8e+ntjWyCEECH8PbTKMvd1BsozE4HlwcIClYL
 fB2nEviqCHcmRZhUDxUR1jKWuq0ez4gDBd+9gCV/wfMxJef1dmo6U+RveJz/KEYvrlfF9kGJfb/
 OHBQQk1w4KK1wH521HIB2KOqfyZLD2N2Yl+Lusule4Cbf1xfLtvWSVmOyGB7hKDZZjybnLIHET1
 OjuATdGd5/ZTAxiD8nuLsUvJ1YtFphNiGCC26d0niY8puXzRUh/Af3nnaHfVvqtYKmKySSsnpd0
 14tG67NARnl3P2rl+WPf1YN0hyA8C1/RHF4fCD+Aj7Yp0Wg/3IJ1Kz17UcF6w9bT/c4D1SpZ/pY
 Osd5W4zmFqbw1/CYxUXcAyG/6bn27NvZJemX9GEK6s0el5SSusVNLf8aVxsiiyjufFREtgq4yx/
 PL8sTMhXSw7pRWMtqJQ==
X-Proofpoint-GUID: 7LjT6MIy-uJgUNudiegoepJUiGvb4US7
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad71074 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2OWSJv1YRWKtX4VDGZoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> The CPU clock controller of MSM8996 Pro needs its own setup, which the
> driver can only apply when the DT tells it the SoC is the Pro one.
> 
> Use the MSM8996 Pro compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
