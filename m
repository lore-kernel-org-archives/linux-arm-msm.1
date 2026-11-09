Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230601;
	b=AyxUDTrUlWavEnocf52QbdJfDV6cx+XI6N06M6yUCjjzt/DuUebaGDXmrKIOZvBepJa9
	 anJEIIUN+pnw1daah7ZTSJdJc83kAlf49DDc8wi3YXcGCHrQNgoFKxBy0d0Cy/jvNb+dc
	 9SLmUaX2umiE8+miLZTuZ+8/p323sbl31YZHYW+2ClmsFc1nfc7j9/stnwQBNvFtOCz/t
	 pYDFfVLgJMvwGN0/TCcmsPXTH2qbAlLy06PzUkAx6MeHu1PmBshkOOD3SeDa218W8rUve
	 UL+SIAYhtuZwvG3p9JWrPUMBrPGyonvp01ihk9MPI76aeTz5Omql6hpyyoAeVPiXPsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=;
	b=OnNfOtDO9gGL73LhCcN0ZTRGRHVwZJN/b3kPcv3HsaRSw9G05VMPbJqHfJezM5l4SeGH
	 AekbeoQyZZccLHQjNn9q5Q5XeLgxGvxeXvu9PfEHDwDfIYDGIF8SPUeuYOuOOzbreqZCz
	 fkkHvwUKWzVqaGjznQpBBH39BC3+OjTlVgzKiK1Y0IwEYNwPASNBsJy9QsoZbHK2RteJ5
	 vQbLcacBVAZ85jd9J5w7GLQjT8Hgf9s2DXvP7BG1xVMB/rtOoOEGkxtPinRfD9qbn85PF
	 BM8W/lzDKd3tIy0SslLJpnWbXFEYilwUd2axiWNiE/D76Cz0rgMnkK+C/UyoaXIlwRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="M/BIXBsg";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZmAcvBx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801AB606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 13:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 801AB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M/BIXBsg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZmAcvBx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF3s12928718
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 13:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=; b=M/BIXBsg82eDIWDu
	Gtjk8+TSKT+Brp662poczEHYVOPsSTrobjMTy5g9eNMJqw4WUOrZ95XdSOamrBLf
	pjVfaaI7YtwzV0cMkBuWshkZiJKyoTO03T+LGzXGunjapX7bStCWZSMyevAMzh7/
	m9wuAEgpxH0Eo47hRcbLDi8bXdcqV2UvdqhACdo+KHYFjnY+1kIXWPKCD8t4+B5Z
	Dsuf3lkO/mkUcpfDeqCPRJHxjPKDSwAZrpspFw9Qm4vqTBkWrQ8YuXDAaObeRJ7K
	0PDxhkF18LuJQfooaE3KEj4kNFRgz1PAxOv3Z+kf1jrs6/AnhswMCakqyDX6OiVo
	q6+YNA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8rqu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 13:23:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2d1f86515so21584137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 05:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794230600; x=1794835400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=;
        b=hZmAcvBxaqluH1Np1+5BLk8BnE01+KIJyLulyErXoha47DA3nLZreZi0QJ0D7TUUs2
         motAuNtRxB727rfhVtn2Jtbh2FJO2FTlsZlp+0yv1dtczNgYXT1Hu45zQ+qLtRaf1MkK
         aV3mToIOXi8Fl9UE1bN4R3AURZS9VBTOUoRSEc2RNBKcpf0ohOQk7aBdasZYUjmKXy1F
         8I/RcBz3gY6pKZqADStYP+50V4cgWyT5tXCYd47Sm3CtfH+Cvf2bFwpUNPJOkU0DNC4k
         iOwOVoDis4m8KQdDt4x7hxTTvT8SPiULA1Kb/ajsdIzwHXNmR3Lesop9pjVf7mclsotQ
         xvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230600; x=1794835400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=;
        b=mllnE2JKkpz0icZkL9e1D+shZ32+Vi+9Cx+RgybptLfUo1+YJiNgTGGOQoFJGmivXA
         vWOsWbSdkVbObBQsnwrw2GlAVm69vG7lXAfBx4yIPw2KcLO4vJTb5hJla+KEiz2nbfvN
         QkVVid/btBKL96JZmc1wrYIddrjK6QMgakfLaRCVp4xczxBZ6+2qk4r93Yo8WEtUt2a/
         bDSNJ9ZOt+CM6TIRV6hq/veM7Re+/oayBENENewgMmuld9mhNAb8sQgjCWh7AhOyR8FM
         AEeCfvO7ePuZDGUChgU4Y6c/TXLkQbykOyMloe2MS9Oj+YX9Hwu3Mc9twbZb3USBc8eF
         LqAA==
X-Forwarded-Encrypted: i=1; AL+hErFjk3/gqwubkWBmWJSsqstXRZ6asgQp6n1PtaHU9FMkCaHf3XEWx3wz1t9ERVhnEY8/klpnwjoLC8nvUySX@vger.kernel.org
X-Gm-Message-State: APuU4Z+kbdFc0fm0F72XqSFsmscRnG/3YiIrReE8mOLeF5wjXo550RR9
	nPgS+DCpLK9374Qji4Lucl5vfRP6e6oz9aJ4meYWCWviHlNSexC9MhhmNTJpnxaIISUzC+JQS4+
	R/e/cTpdrmuKr44kGZdD7RRnuvI4UdjMCqPDULVTvPRl9lH19corlDrgTxJjteLlyO/Yv
X-Gm-Gg: AYBFou1Pi33g54KgPXRXm9n5sz+XuOOXWLgLgPLEfMIfwpmQ3yFm3Ep6UWlOXPy160+
	uP+r7GwHS3UWqP+l2LIUs4tT17798CXJiLeTVeCH2C1r+zHZBzjvcjmhtkg0L8+9OM8aPQ60rg+
	+drbeN73hpfw1TbLPSQ/l/hv0shjgTx+LePDCj0hCPSAyXoyvYS83XdXVJOysmi38NQqueTuQfr
	1QTncADC2v51YglrtNXXnvsWye6NizQRbLaJmFyN4/XmtYVfOY0UWq+qF/lRCawzJfPoIdkefvK
	dlQDKiq97SGqYu1E0n4iPGkixcFH1PrHFL5x7dG46Xfx14owh3QrOyeu90TGJ6d0LCL3DjFWQCb
	NAHZbS1tHCSSE+/H443sFvw7O1qwlgkXwXyOlnP4ZJCavgUL/SKnIjd5ERZuX6sxsbWlbrA==
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr841108e0c.1.1794230599677;
        Mon, 09 Nov 2026 05:23:19 -0800 (PST)
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr841100e0c.1.1794230599135;
        Mon, 09 Nov 2026 05:23:19 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4acc0esm165261366b.49.2026.11.09.05.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:23:18 -0800 (PST)
Message-ID: <18dee813-d4db-49c5-9ffa-7a150747a4b5@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:23:15 +0100
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
Subject: Re: [PATCH v3 0/9] ADSP for SDM670 and sound on Google Pixel 3a
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20261107022453.159341-1-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfXwIsJwe7fagYL
 nGlM6KVpvPRCju+WXqf6U09INzIJ2PCQLXF91gOW4XU4rsbn4tpYEZY/Bg7MkgkivvXs9cPLZ/K
 sLvwsULR6O0EZIalV0hITYlu4PKj8aCxuoHS7T7B5uIhWwZktQftffxBrInYFA3Q+bxDjqB/wHl
 m31dqs5s+NwcTWuSmSEFGSAxfCGcrerrZHZJfzf+i30eRbIP/CjJ5Tr/fRp2s2EPzfxb8n0mo+l
 YXwcRWqeutESKQ8fIJxrtVstA2wjg8f839HK09fXl/JTb01Mjm/f1RSzx8Gp7Huew6irDrFCuBB
 l4f1JYcxC85Xb5pk3S2dx7VY0w2QfekMdNRqZeXmbrpq4GKxuo7PdRFo0qSL2axGHOQfkSqnMoZ
 5oR9ocHxFphi1AnJtaWOasK6AuQDuuiXhuEObwYyS4Gf5I9v/8e9HeIIH0Hw9lTq+t/DdEwd9uG
 Lv/UfzP28iFjdtAy3WQ==
X-Proofpoint-GUID: ws5vS8rVjWYnpsqFHgE9U6M3J4rqmAM6
X-Proofpoint-ORIG-GUID: ws5vS8rVjWYnpsqFHgE9U6M3J4rqmAM6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX5cHg9qPT5RRZ
 HcMz12BwNlEhgODxObZlvzcpTL1X7F5TldZlqx8l4zlOCIxrOwLtOa3GlvpplCUtaKjub/KvyAt
 ROeI7mErOOYoME7c6O4GJYCBdcQN1es=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af1c948 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=d1-rQg67RIlivpgk:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Fgcgf8ka6cmR_l9moMMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090053

On 11/7/26 3:24 AM, Richard Acayan wrote:
> This series adds a user for the SDM660 sound support code [1]. It also
> adds the ADSP remoteproc for SDM670.
> 
> [1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com
> 
> Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
> - stop using fallback compatible and add lcx power domain (3-5/9)

Can you share the output of `cat /sys/kernel/debug/cmd-db`?
The SoC also has a LMX domain, which downstream seems not to wire
up to the DSP for some reason.

Konrad
