Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E23442399
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345431; cv=none; b=BGX6OmB6xWsLlFDb7kB+f2hk+36laP4HRKovvxCSGNc5SGhQ9VnTg8ANsGbVF0OqsTGFBwjVKzeNuoJqQ1RaV5i2X6rfMfe/PZ4tHY2sdCOkPXTFc89u9w7NdEKlsSpeA1Ei1/NMCwkJX+a9gGlGcpY+eXO1BP+4fqTA4VuTCa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345431; c=relaxed/simple;
	bh=d4/NsPaTI3caLZnCww4br3Gt5hf40dmy9YvA9NdaCvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oy84rmciiMpgiQ4i8F8glPRkxwN7FEhs4I3oYuSaNJ9RmEVpiGOEiUxeQKPeAMBPxgzA5ZW7eLeFCDZ35efyPVyy1MJAf9qqKsAf/lnJkI96JLA23Z/GMsZtU8o7ZuyBZy8ddzdEHBRLSbQsMeLqJTaKTztMOnQoqHzmahAELmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRdDjXmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+yZ51SE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRdDjXmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+yZ51SE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NHYK1239435
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=; b=XRdDjXmxNs72I6N0
	XJhJDOdqRdyQ5Zcb/MVLlzU0hLpM9BNBZgH0cJE5iuMMZ5EXOhvjnl2uGlFiMDfy
	RtKLfqWrURQhDDvSkUt4qhWA1EBUON+zPZoEPGMVYRyXSFrN8VP4588wOGApEMlU
	VNqvBOCnNBHUVaRiTW91HVqU/qSCXJqP6Bt82r1P67lG+obJr7extaPLN2emOpBa
	aJkM5CdpMqy9ECu1xBobCOOqdnMYr8Ghx77/l/dAGneAnpzWYdGRxPNPfC+rn2Gx
	/LM5dt0E8WW/Ztfeq6rC3U83MHwmdmKBnbdfdXuoxOhAKE7S3WFk1v+c5ohyymNR
	02z5IA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge38w3dh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:37:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso20610985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345428; x=1788950228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=;
        b=I+yZ51SENHgMqUkuBNs2++zAiT+AiLhvL4LGR/v9HYGWHxraCoDaaWl5wDNbZBPyTI
         3ulZCyTX9MActTfJFXZF2gnb3mGzKaRYRZ7CW3/jN84NmVx+j5tbjiNBiYz3mfz/wpw1
         tWpwVeW8CTSJQlqdI2M1RU70aPJJ+8UndsLoYr2HfFBVrK4nPOniHN554PK0+iz6N6KJ
         cH426qe5Ph+G+4ijw4vCYlQjC+h83WlmKTxcA8JNeLadRr2cWAPD+HfK1YkuRUF6iDQw
         NNIAvfZu0P0zlTQ+f9ECd5WxDdbMTK/A8dMMcaD5sGzpzZtdGDVRKvS43Xt3ZjBhCDVZ
         zijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345428; x=1788950228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uyQqoBoas0/92LGGm3nVSusdAnQvyayTIQGFu4GaPY=;
        b=V+k/GmIK5DETRMQzea91X6VXTARMg/PkCmZi0CG8QMBmGMt04Rmld/vOxLMoJl6m2X
         A62o2sQqBZ5iwrLaIY2q/VYHZaDcnGiPyDEr5fUro/Y837M/8rM1j+eaJZbH0QNgtP/U
         aRY7aAvljLWhIaSHp8CPZHsESVUjG5XYfp73cNyo049aIP3048ekomLLI8JlNZz/wQOd
         Up6GM8ePrqsN/nMWNYi653BCa5PdmG10BudQesirFVEb+tb6s/hcFrPfOMaywlvugxIn
         307/16OlGM1QXGz6fdMr1J+ItQQSG5YFgq6yOYyZ6O4x5DMEgTkd2W3fYCzdnDPHcr/j
         izhw==
X-Gm-Message-State: AFuF++kUvXRy2rSOy7eO3mh4ohqH3Uz1mmcOVgeRpRdJTZFxSVIywnS5
	6ETwUPUniIuX0ekPBLAhXJBJZZS9QNYH5D3Nn1Y/gOYFAgXHMzang+v9dWjjiVf9yVp2dMyIDun
	Dhm0MohCDkBCN//c62u7xXDVVlbgvg27Z20z3uDZtwZgZzB5WhrZDdg+e1+wHiAwG9Wj8
X-Gm-Gg: AR+sD107mpNtlxFlAd1DtrQRNquM/SjFNOYGxzqMCeygrZ/O8YHv78AQKXFSNTEUROg
	7il3RA78rlMWjcv3YWYKPVr6giw46ZV/LFyCkj2acbAf+X7w11RYNsKU7XkYEuo/A5t/I+JzsxG
	27pz0EPaHaK8dt1MK/uVcXug5s1aL5AOA2SPGdXaeVyrh6NJEfJ1M1nQSBGwtMMVn7/bts82D8t
	qRvhFVp+ITn6DHMOUej5sHRzjzPfZ3dH7NmNvTN8VtcIGn6S8snl5KTagsA21Eebd9MX1UPbrAz
	+0dSK+D++7PAcJ4MkedqaDIK+zcI5k4kgLW03AGRkD6ZuyKaezMKGmlpoibMAxY+FoBkYjOukVT
	CNSf7PyIQf2nzJqGlIIgolA==
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr236835785a.4.1788345427701;
        Wed, 02 Sep 2026 03:37:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr236832785a.4.1788345427214;
        Wed, 02 Sep 2026 03:37:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc5d85sm109338866b.1.2026.09.02.03.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:37:06 -0700 (PDT)
Message-ID: <f80683a2-40fc-4c1c-b66e-bcdf90869dfe@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:37:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sdm845/670: Raise CSIPHY timer clock
 limit
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BbKXrmqMgihMUgV3VhAUNytOBLVKjGNk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfXyOcmkhxzYGdt
 9ea70j6yGIxjrO9ngFGYZ1Q4oTQGNGKePXAFzTkiHkC4xwCUb0MwXQb0Ppa/JfiSRWGpYhwlBj8
 KaE+9wAuy0NiF/u8niIRRzZhxU/wypY=
X-Authority-Analysis: v=2.4 cv=LOpWhpW9 c=1 sm=1 tr=0 ts=6a97fc54 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=9zb2tplEqV-KQ8uyg_IA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BbKXrmqMgihMUgV3VhAUNytOBLVKjGNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfX6KbaO5X6qPuB
 bPAWRYCVycHxrF18Homa/fpSPfGr1qVFIeCOg2NLU2LM2kyntSCRxXmeveHSd/syV0rTsl46jmw
 fJhEby/uJZQIlQZe+EFfT+7PoqRVuBijsmz8BXudi/C8LrQAcwQSRzMInon6FI323959K+isPPm
 pNwa2Ur58OcVfh+32NCKf7g6wGO6vv3QwalIGcmF9pK1CbuzOnAgRDuSuXVx9RO8Gv/pWRE2JsH
 WpwGJffHk0UoqtE+rV6Q+IWdZE/a8/x7bfYgVBGUTgnltMKIaTY9izJxbwO1WlhgjFflGORCoKj
 5eUzAKqI4CSDynQRLGfD0uIgJlFE7T3M0g7F61iWrPX5IDN1z15+PMZFWeKfzJczUUkeLxAMu7Q
 pP5pDZ2AWx3XejnnYOEHu5n8kC6Olm8M7IjYhUdddUnJWowXrjur6unX4YccNff50OOmmAKYL0D
 SacUXnOhzy1mxF4fNfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020093

On 8/22/26 4:25 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The sdm845 CSIPHY timer clock only listed up to 269.33 MHz, capping the
> supported CSI link frequency at roughly 1.07 GHz
> (CSIPHY timer = link_freq / 4). The Samsung S5K2X7SP camera runs at a
> 1.15 GHz link frequency, so camss rejected powering up the
> pipeline with 'Pixel clock is too high for CSIPHY'.
> 
> Add a 288 MHz entry to the shared camcc CSIPHY timer frequency table
> (PLL1 VCO 1152 MHz, well within range) and add a 400 MHz entry to the
> sdm845 CSIPHY timer clock_rate tables. The camss min_rate check now
> passes and the timer clock rounds to 288 MHz, matching the ~287.5 MHz
> required by the 1.15 GHz link.
> 
> Assisted-by: tencent:hy3
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Tested on SHIFT 6MQ with next-20260820.

Is that what happens on downstream for this device too? Is there a
chance the sensor link frequency can be lowered?

Generally the latest clock plan for SDM845 says that 269.333 MHz is
a maximum, with the RPMHPD running at TURBO.. I would assume that
while the PLL rate stays the same, the downstream branches and RCGs
may not have been validated to properly function at these freqs

Konrad
