Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615304;
	b=iVxwUXx366745aUke7djj1OtcIIzAd/IeRpzAZbYFZzFddzr4f4vhWCzryBwhtXcDu4+
	 wyZeEGEZqpu093gINuzb9O2e4NSlXJqHepHgU4X1sZUSkt2ShKeL6+wh2IK6K/FujQn1W
	 N+NdaqBlgvwZkXn23UxF+XqeyYWHid1npOM2SXmgAb8D9go9b9l7SkM7XKF/BghTQAkKz
	 toZJHHDrCXso3G6n9/2wsFjNgXp4Ml32qUROGYtkBWfk8/daEzYMVYpKdsU6u3DXkG6XM
	 P8pCwtTLJqKtsykfSzgF+SRILsAek8eVX2OHgjrw2HNHHN2xB+1f1oylKLnFNsfhl9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615304;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aeUXDPblcIqwhdqPiV3Uo8oWImfFiygj0BnOsQpFNb8=;
	b=I6y7T3qQBuah4jen3lDGB0+xl4DhFOcmcHDcOE/YNkndbXn31v7lnc7oS7dBf66BeBc4
	 wPalKQfGsyw9ATZ50ymtBfUHC8c9aj9K6vY2B6+iacNv0amfv300TyhdXtYYC+HVE+wrX
	 lLZiHpf1cFLFd0TdprfS9QdKm38TCWeVzIj8+Pc6HR+mBTVwptFLQ2ijZPbq1Emw87SUs
	 ggfMZJj3Ylf9L69gNvIYJypqSRDIEzNHJy2zpclZ6+l3+nBJpBbk4SuXJrCDBVsYF8F1v
	 p8MJSszWxUlDRB4s0MtcF7omiyAhFEM7SIn8nUzFyMS2aV92xyiME2lc/yYCiN8VHwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZIo1zEkC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HaCor6Gl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39731606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39731606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZIo1zEkC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HaCor6Gl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMLv1821198
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeUXDPblcIqwhdqPiV3Uo8oWImfFiygj0BnOsQpFNb8=; b=ZIo1zEkCsDGNlgIY
	e1lMX32ec6bSl3Zd6XKcPwGwHS36fI4Zu1NsHdlte7sH6f3BXJ850YLwepje7NZX
	5aNU+NsPEwaZbsbCwrpsruzzi42oQjQsZ/5Ya4f2K4jAxcpegrLkvT3oRSfPHLrP
	/mIp5A1TaLlTLdK1Ozdu1c5txx6oPRBRHq4EsAJu4uqwDPVXrTysAYqyZ//TTi8H
	m1pY4ZuZL42a1ZNlGRgxgK1fAV5Sijo2WkrOJaMdyhzRJFeILd6Hd51g1AJilPyZ
	UpYahcbEu/S4/JVUZ9q6E1ic/mafticeoYNDj6u79isqzEmiKDHyQTNk6RNBofPk
	llbKtA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h79v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:28:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c82e9d68fso8293346d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615297; x=1794220097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeUXDPblcIqwhdqPiV3Uo8oWImfFiygj0BnOsQpFNb8=;
        b=HaCor6GlqwnzxiG4UND7bgA2SoIAEUPJrMq8Xu362lgm8J/MlIReeooHn3AHTCcwyX
         UC2/nyUEfPsHIcjVmNAW559WnFCdN799L41m2oHnZb3P06/lG14OgVDqXr5lEvVaCA7V
         v+xE9opW3md8czQugfRLD6QfT/R1YnuxL80LGgfQV15vXgmm/8raSQkIvMQFkRUnNg2V
         gXXoU1F8ZSPd0Xt8fys3GB2ZtilvAuguFxZY0cJECb8ceVhxdmqA1u4pOC8oR0S8Lw6M
         WH41lL9mf/N54qn4uGmxJRR9jwtLRhXvI1cwaSeR9YCj1AaYPhZ19UFrdddM+BKp6bP5
         Nq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615297; x=1794220097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeUXDPblcIqwhdqPiV3Uo8oWImfFiygj0BnOsQpFNb8=;
        b=2mcaWfvmCExitrbggldZayQDVYka960qwj5FPMUOvSMCWDCMtpUlSk6NgAJOBFqwSc
         W7yZKeYBt5pm2evFmmxwhgFzhVdNk+E8Qg2t9w0GgLNM+akn5ttFQIaW0KdraLcaG6c6
         S/UHDQE4mGzuipGL/v0K3HLcVEyg/qFEt1EKXG1i20WI8auKgR9U3dD3EtCk/Hmqxh6v
         gLWfUnIqOu/20Ky1OKP/HhcpQ+GWKA6liStN33nOQMiaHpxXaraBRoX5TjFnL+RYKmZU
         39xoIlqK1OpCBW6ddnB4hPeyxqdK86IBjJlilOMQhCpfneG/xAdXvqyzypH76MxCKo1P
         EyRA==
X-Forwarded-Encrypted: i=1; AKwUvBwwQ1SK6AK7f/nPcPCoSPiwPN6ZuwUUB/ziiYieZ8qyINrt15BmufjrOPBBhTc8pirLEE6WV3j3paf2moeF@vger.kernel.org
X-Gm-Message-State: AFq9FYJW279AvAfJ8c68dTNJdOVw8DbNdIDi30OkbDpYq7oimSCG4Dux
	oKcmg3HTplHE9JbMCIi+NhoZitZ/1oXJ/yDYNRSmTaD9RQrY2lWUE2iig9wfip1F3nlmVH//ty0
	WAtBBzGYfDZ7LBt7w30eq5Xf88YKP1ZSemUjOBVncyaJU8eKJKp7xGTgF/tij5XrYCuNc
X-Gm-Gg: AYBFou1lyvxHxAIK/XurlSIGajb6IfdGkdSGcXSF0gJqEk2HBIeWuG9lxrUEUDhd+Gz
	tIDpS8nFE984BAkq1tJZI18mR8XCeE+eVBZ3aZYrdWPpIhXNAuaWlJ7MWZka3WSHPaaX926CywZ
	Qs6rZtaB8Mwbe2NxOYjkz3YCjDfC7FBNRX1pexgPwojo6kd/YPqICFWZsK3PmE+Wb40JNv0xXSI
	s+Uw5RUxujN4SUisAGocrrPCJqGgeHehAXu1LFfaf8IDpAQarhjRrJCaLSSm2ifpzEWHrFSM4CL
	XjC2PVF20lNK1WS+01PiK7M80i2YLKA1dCGE9aB/rWo3AiLhQHOCd1x0SVX6LSaMPVEVZonktBf
	B4F66nT8V1HC7+YUjgpI5XLSIvrxq/4lhCQlqBhmLhFz/Wufzv4TlE4fCoO8X2bRYraVBuNI=
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr1545380585a.6.1793615297349;
        Mon, 02 Nov 2026 02:28:17 -0800 (PST)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr1545378385a.6.1793615296942;
        Mon, 02 Nov 2026 02:28:16 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe10055sm368851566b.43.2026.11.02.02.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:28:16 -0800 (PST)
Message-ID: <8f91b302-8cbe-4bf6-9558-041ac10f4696@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:28:13 +0100
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
Subject: Re: [PATCH 1/3] soc: qcom: smp2p: Fix use-after-free of irq domain on
 removal
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oqCnAjicuHWgsalQOjiVApI91xeXPerh
X-Proofpoint-GUID: oqCnAjicuHWgsalQOjiVApI91xeXPerh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX9SUjDiVxuJTe
 RxfRB/tRIPSHtLpHHif/H9yeI8Z1SE8yUM4h0AtYzd/bE9OEEQBy3Tl/C0m1wVPSHDS09l2CXgy
 HPXV1VF2wcWvBE8fJiy8onN49jskVw0=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae865c2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=iPxsRg-7CK3qk8vLE2gA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX3KewV9QZJqWN
 MLyFx7129GfnLwXmaSRqVyydZOutT0GNHQpT0Gw4ISefEPtcxR7wcFJjTUu2EMKlG0qyUQEgB9Y
 J0cmhTXti0+tkYuJ8GwlGTz98oWkkUlsI6a1buaMf6J+VQstK0eVFlbF/SWkhJQzq0JDv6XoA0x
 71crjzD/Y1FDWgwoqKl47syJryQmZPmkp3zt+j5aOiUzh9nhL6BP3zbmXKfK0mC0AV9K+TcsbPR
 NW1IoeQO7b9Q3wezw3cRONVFP9vU7I2VN2zb1BHjDa095WFI9SP4Gus3KudA4cp/3Dso8murJTR
 aLnJs7J+J7PFrf7WceVYSklwwi92yEmw88TZJhitq+2Vq6yJW8tMm/zqbjjsXA/w+XT0IyNv0xH
 g5IGf8waGi8x/T/UlI9p9MrbUey9y4xWJNL1WkQ48pFJGTmazPdtWyIuXXLZuQ0qbAIH74M8jYd
 cnOY/qu0eWeCXGYwepQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

On 11/1/26 9:24 PM, Krzysztof Kozlowski wrote:
> The SMP2P interrupt is requested with devm_request_threaded_irq(), so it
> is freed only after qcom_smp2p_remove() returns or, in the probe error
> path, after probe returns.   Both paths, however, explicitly remove the
> inbound irq domains, unregister outbound SMEM states and free the
> mailbox channel before that.

Sashiko flags an issue with this one

Konrad

