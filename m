Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C123DB33C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048860; cv=none; b=d9kVXdXJQ7HPrbY8EpzmrnWv8wdVZ5W9PwdyvEUiBTiO5DcMTJunOAXiViMDgaaGAJjfNIb0gLuEDe39L6UjZuHpt+WdRRCeNHpxjiGn8XzavfofL/KUx2JRHiDvwRxrEc20aaVdSA9j00a76Xk0ulsK+AmOtfxIcbaibjlsdtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048860; c=relaxed/simple;
	bh=qzVduJq5GdVNzfjCOi6IYK/AGsAYiirXHMuWBR5pY6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgm5qfyOkUIHjL3etDzxyG+pCnCmrrLuDnj072hWUu30VQ84vFcgTmaXwohclc3UREX9XfyieNwm/3gBbe/sE1HqFFPST6FXgVnRwMSkDqy/bSnSDuM7Fu+zriytl6GLs9rGV4TQhL0M1JvuABO6aXQXl6d37fVtzLs3R819paM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PchoZbV0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qc6tW0Zd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PchoZbV0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qc6tW0Zd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABRNI995813
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbAw28JEMDtsVhR/iRFJoE82+XonCmoCsrWXqTH4a6I=; b=PchoZbV0KUbr4cVv
	pqYicGS389HO7wkBfrbAxIwrMP5B0dwDc1c7hzD6zE+C6B89rB8Qit96iKeW5O1x
	89PHNnfolz7ua/md1UbTN71YtmKMDux8bs8djS5N+vKqEf/Yr0iZUVQBWdOV4eUD
	R4p25oPtf0XkJJAIGXROex6rU0auIcuLaax1iFxXyu3Lm1O0by5hJHm/J3x36Ww4
	B3ETSZxK0MP0AKL9Y0qDmRbEOdgPW97Z0UeXDi1+gRPuocIap7+c6EvYwWsWjorp
	idnRcaIc81lxN9ZOABVyvfwpAAnIPo11V/yi4BCRG91IP/Z37jhPyp/4sc5uqkSe
	PrqGug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615kwqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:27:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936bd9b045fso4156585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787048856; x=1787653656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbAw28JEMDtsVhR/iRFJoE82+XonCmoCsrWXqTH4a6I=;
        b=Qc6tW0Zd74PJ5qCNOE3hM3KzfYBkAE5Kq4uxNxdB9mj+z7uqlPxz/mXX8OQ0e4b0dp
         +etVnraPtJMhbfPaM+gA6zQlYGbz00YWzMLaSdFF/lMoOHhmQiThkGPFVa+ujnk39NF1
         LCi+P0Ty74LLFBJixF/c9vEQ3HADpw4N2bgbRie5Uf8N3XUozxt2aSmEokR4OtlEyAzL
         IaD5OvezCiNzT/quDsPK1OBg4bsNFVw0w8lXg85oFVg+cxhosWH6fBOzPSLhvWkyEyi0
         gHILbtQemHs0Hd2+lEeueKLNsAb+tlELzSIP8KodzAblOtNbrLiHX55pC9pFuMxbRSap
         niag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048856; x=1787653656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbAw28JEMDtsVhR/iRFJoE82+XonCmoCsrWXqTH4a6I=;
        b=DLldD99KJ5ssYZXY5GcJgOdUxuv8dqJrpRPTTHxpk8q6EK67TNiG+vfUeWP9CI9BeU
         MJmuX7OeoLbWApJk3n+O9uxJVne2M7vTve1IKx19MQT6RIIzrIhKAesMAk4SYfmHi2Ew
         BsxJ2D+Qo7pyrdooCnJhAxwsIgFzdrsjZSEWAYe9PSfLBPKFd1lZaulQki8+2ztWarnv
         ad4EX20MWRS/amqGkozlTPAZZo9c2jVCG1tKDN04v5IGxPZhg01W9Rbf10k3om2Ki4u/
         pxpTDd5yIeaXTgXYUIn+8TIag8qQ6GitStDiVG4pvUsnv/J4wV3wreVRLd9DJQ/H/gmM
         KyrA==
X-Forwarded-Encrypted: i=1; AHgh+Rra8bHExviBH/Sw+Tqqet/hUTgnIBCEGZcLRK9mN+BhEXzDPfgrt4bhJ+CSnK+a9VJ0cSWDopejaYuK5alz@vger.kernel.org
X-Gm-Message-State: AOJu0YydISwDQQhmambM1WKUK4TFYGobnakSLNjBQaLIsl4J0QRt/P9z
	EqSyqY5nM0rdzg1RHo3uAsM4HtbyPst8LDuITNdsmcx70/7FhvIw8OGYGSr1DVM2yO/0kyhySZ6
	msKs6ZSlNHq3Zhj3cZV9Tenj5PWRsr2hIJQ/wyWLAUnvuyZu0EkSSAGTmV695p88VmOII
X-Gm-Gg: AR+sD12uaJA8oKTzRiXVF9rZ67hZUoo9ihis1BBwdlBeodVNWuxskFDM7lCQ0l5oVub
	QdgX1lIgj+QG0iwRZJy7/VxcIaJg7kJZOZovUficPNZgdmkBsJRAwG0X7mzgocC0xUkJR5hNMvP
	2c46/PAwaPxbh95eawE8ZwvizK8jdAlKBvoDqCEuxcrb5tVIK0v2PQGH+XjBI5x/meBMdTxrd1z
	+kHTjGC8i1/VX9GjMODfv/+LGuF8yVBHMLN16tsDDozSWR/66waokWn0XT8V7o5U+M2HbZxM5mJ
	y/eo3/XWIKF/1bYiADb/yQPBLJqXaE7QqT1CG+kY1O2hrr5CmGFkw3hvgOTBouDr/Tgm8Ck4ZV1
	8/VFCjHHYa6V63nJoHLz5R1dJ
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr252266181cf.3.1787048856539;
        Tue, 18 Aug 2026 03:27:36 -0700 (PDT)
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr252265751cf.3.1787048856096;
        Tue, 18 Aug 2026 03:27:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d859b274sm1576957a12.25.2026.08.18.03.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:27:34 -0700 (PDT)
Message-ID: <8c04340d-6d19-4292-a873-7ded67caacca@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:27:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: milos-fairphone-fp6: Add NFC
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        David Heidelberg <david@ixit.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net>
 <20260811220135.472380-7-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811220135.472380-7-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s9eya1_a-4y72UF0ofz0q4xvqLgXdf0l
X-Proofpoint-ORIG-GUID: s9eya1_a-4y72UF0ofz0q4xvqLgXdf0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3NiBTYWx0ZWRfX6EkbXMjHZu8e
 bh3l8yx5WzaQ0avOiNxjWfYCl4AqGOWi5Zcfkizoj8PZ28ZD0E/aYimsGJ1C4c0SS3tfiQsGV6d
 Vmo+NAz670F5TwbCd8ItHFymdIpuTsj6RKWVyRgRfROse7xss/+d/4kwNEhGUHVigkOOw0CrHr4
 rL4w8mmowxRXEQzAdC0PL4KjaEjh15XmDNLIJXeNLQMya5vwGuf0xp/JKnnzMPOSjgYrHYxhW3h
 vmtSF2BHr+d/14Wswl8VDRE/nYVJThdBAaPi/YS9cTO2tzzIj/2tz/ooPrmalCeJWsjGZlnUeJQ
 PVakYECVZFJkukWCATwJx82FtYQsbb6gLC6JT/KVG9ZHE+hcyGBRvmi747zcCACg8/3HPI9DhNM
 QKspOexJT7LE894UelTVQJKAPwVdE/TcmwHW72n6dV7632cpxmV2dYpWNZxFmLYNx8vieQkLW3r
 GpLowJzdcx0d5ppB9Rw==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a843399 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=GYSh3LzNAAAA:8 a=EUspDBNiAAAA:8 a=Dd_GrI0rTSTmvMZCxHUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3NiBTYWx0ZWRfX4zvx3PJhKckT
 QLAhYY3445/6c8g5qaPCNEDfMOohrn1yepYlTOTDV4lo1uUDEgQeaFHektnC7sAWQSpJ72R84Ck
 YBT4PmfTt57rpxogFlHcLnAZRTmeQkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180076

On 8/12/26 12:01 AM, Jorijn van der Graaf wrote:
> Add the Samsung S3NRN4V NCI NFC controller on i2c1. Its XI clock comes
> from the PMK7635 CLK7_LN buffer (RPMH_LN_BB_CLK2), and the reference is
> load-bearing: with no clocks reference at all the chip polls but never
> activates a tag, while a held rpmh clock vote lets it read (verified on
> hardware).

hw generally works better when plugged in!

> PVDD is fed from PM7550 LDO20, the rail the downstream driver switches
> for this chip.
> 
> The enable line is routed to the chip's power-down input. The driver
> drives its "en" descriptor to logical 1 to hold the chip powered down,
> and on this board the chip is off while the pin is physically high, so
> the line is GPIO_ACTIVE_HIGH. The pin is pulled up so the chip stays
> off while the line is not driven.
> 
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
