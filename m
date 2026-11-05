Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866305;
	b=KP/AmGYztczlLzqNb+FTXBxnMuCtA3NWgKZJ8oaHRcd0WR2g0sRHA+T61p8DCbGhGyAX
	 0GzJp4Hwy4Sfw2Ux9467Lh3LzdkLT9Ql87RxNP1PdgDSG3CuAOzxcsEEnjrQBd3rU80UF
	 62Y7mI+Nr0MfBvS3saL5ImBoRaVHdURRRFyGaMaz5Y7gNe7QAzY5n9lvpvcXySg7t3tNH
	 xgYKtd4d/cpRNxwbm534FAWTvy7AMSmKjcICAvJ4zI8GFUjjgluxMJN3K9AEvhzM2xXag
	 D/+jgXkPyM00pt6OerRHEc81NdFUZsNoWMla6mc3QruPW584yspoQC8xM2VPlY6fmDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866305;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mIPALp95eM3AkXFlvFAPjNiT6Aysu1euG/w9XR+z1kc=;
	b=Dm7m2iEyaOac/V1ZVy1YfNwrGI77lUC+PiV+qn2F9VPPv57erWXXUfGUc+xw8ItJ9PmB
	 /1Aoe9oGqZ1EzfXapdD2WLnwWwU+yD2k6xM3C0BzjtoXJzgsWRgZULTQ5uIAAF0zWT0lQ
	 MFK+hIPgDxpZTJYCd2lx0Wo9cUAgWeXRmiYmS+NxX22z4e757cSaDtQNE/y+yzXU04/u3
	 ZsYhSjssSlgiZwwmv5g3X4mz9CeRtEYBHbbLTmwH5pA02VM66M13cWYl97wdj4fp18WF0
	 uPbwkmJhHyQ/rS2ukb05PdrMBSJzZlaxsPBhDcJHBWEAWdltpD9bckMI31K2Id6eGHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8LwHb4Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJfYmTmE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5121606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5121606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8LwHb4Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJfYmTmE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UbVh3624943
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIPALp95eM3AkXFlvFAPjNiT6Aysu1euG/w9XR+z1kc=; b=a8LwHb4ZHdGn4MsJ
	20ov9kOlvbDvIQg0LABhso9DtRcQp9puWNQq18Ru1K6N0sJEiArvwPTGJaFrRozj
	khU8WPF049wZiIAsEJj/hAIT39GPXKalNdUrp1/EeOsaj9peDHIVkEVprYWY9drA
	l3z+XTvUcKqSsq3x8upVQPSQtbooBJta092cmY47+kBicyWl1KAOMtAxSAiW7Bl5
	PwoWNjVqm4tUPYx4yPpBf4Wlkwe6J5dEOFBf8Yy6BfF3T5W5sYlNcFvm7P6Ke2Sr
	5DvkxPkb2gVR1XA1seH38HhLXvDcReeBJq0r/hRYFWt1iTHaz/3Idcf8mNomwj8U
	SoYuZw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br3x1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:11:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e7c9ca738so3601476d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866303; x=1794471103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIPALp95eM3AkXFlvFAPjNiT6Aysu1euG/w9XR+z1kc=;
        b=cJfYmTmEF0pCxy+r41jz/0v/qRBS587sP+w9/rlgJlfc6L3MwP5XdKeRFbZvUO/LDE
         ThdRVHeFJeaC2TkDd9r+Ws0abl6ivqFMD6vrCxvx64/YWGmXez/THI6YtUL2YXmdP3kt
         BpmVbWnYafyMWlsWuDcgxBWn2xjCehowwNEuNnQUMcuTAzXtEQTTgO5z8uNqdTj8cYko
         eIed/SYJFHHE+WParcaxxwVNUCOEXJZ7PybxOvdhwCgaQNr1SKXVJoIhgYOIPePRO++h
         tRNwmQb7dZkeAhnKqEV5dN8Xo37nxsHTkLaQwjg0M1w5yQb37lA1M8+a/hTHYKAdTb/7
         riIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866303; x=1794471103;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIPALp95eM3AkXFlvFAPjNiT6Aysu1euG/w9XR+z1kc=;
        b=Mi4fyqnp6S1SWFGeoJlWbPn4WAvprqkxs6OJR/MgfZx1Rk6y2AVAVADpssGn5n2lCZ
         4p/YrvOzDbKhndYsClVE3yViSbfbn6+0RkMuirv2zBgpycgtlZ8YT8NNu2nVbJmFKYIt
         jm3OseZrd7W+9sKkND+QGqkzGkPUw/199dU1GnUoCceGAoUKhJ29S4uqjZimxC1HxQ6D
         kOPxnYWiyWi5GFoTwx83zeHbQrrvVpjEZq0w6vvGd8z05qe1hAeENkbL3rvy9Y/iQIiS
         Eqk+jV9/sa7+1q4rHPuWHs8NAth+EwgPEaNrfXBYgjPcWX2VfWLxcryE7l3zc+d8GL7I
         9BQA==
X-Forwarded-Encrypted: i=1; AKwUvByAHvgAujHSaYi5XNEynDuroLibebOhzMx2Yn9hQ6l4by7kP+SFCii3SpEvZb5yAEtYIXeNiqvqqqAyU3Pd@vger.kernel.org
X-Gm-Message-State: APuU4Z+JOrBZPE5ihANdpvzcGWewQajv8g8vKd/Hq8KpCrNKxDM2aL2T
	zgrABdS7LeZg6g7fpIvNsoy53QQdE1bntq1wsfdiRm42SfimS8Ii5tax6PgtHJXoF4FRB7sZmBY
	PZg2mkVWh7b/uJWAMIcZRXyZP+G4qH9UmSy0B0cnhgD4UUCvS9M9YCOIR/ljEvW7e9AOR
X-Gm-Gg: AYBFou3OZ57Pi0QTUlo5OPaWeZJ5r834gMTfotlI9VRFlDm6lrWeSz4TZBM1N2pxaIW
	sYHwNTrTy38NnRiphIcN2fUBVUL8ThKjd4kDWdWpuFgAu2Jv4R7qDP95VvSxdttswhS1+bBA0rC
	THiG3GmnOFVIA/un6tBZiqeRHlxRudgZbvbzgHuA6Wpy+XPmHbH0pqNxHO64D+YkDaRm18JXg/I
	s/W7o444Dzbp5chzFr6W4Iq1YuBjv8PYZ1WmPHpzl0NmfM2r+OOkpmMBYBx3Mr0R3G6niOFnhoc
	TygdUUjwMCypT/JemYl5OxScGOX895xV+u3KoXM8GtOh3xCcuUP3thZNqWTBMu9waOMjB44672k
	9HyjPMJrkDxDjeatzw6Lw66ANLvIg51Y/0M7sH0sAOibjTsYK5UgAwCwNjvpFu9eatEYC
X-Received: by 2002:a05:6214:20ac:b0:91c:7831:f4af with SMTP id 6a1803df08f44-91ca4b63f0dmr405782926d6.4.1793866303127;
        Thu, 05 Nov 2026 00:11:43 -0800 (PST)
X-Received: by 2002:a05:6214:20ac:b0:91c:7831:f4af with SMTP id 6a1803df08f44-91ca4b63f0dmr405782466d6.4.1793866302702;
        Thu, 05 Nov 2026 00:11:42 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4a49fasm146003566b.82.2026.11.05.00.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:11:41 -0800 (PST)
Message-ID: <cd587c31-9e78-4957-aa41-53d568547654@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:11:39 +0100
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
Subject: Re: [PATCH 3/6] backlight: qcom-wled: Cancel delayed work on probe
 failure
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261104183935.1214630-1-lee@kernel.org>
 <20261104183935.1214630-4-lee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104183935.1214630-4-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX/Q3zyQ9QdcVj
 6ZSII8hJOO8wd7OdlVklPNxPZTtc64wL0ZybzqyqKHCLDP4HKVr6S3T0Nqu0/dsuaFBiJAdHm4L
 gMyaw5e2SAH0K9Lh+HriyvW9/Qk5sxCe7p8vdjAe57e5irEyXmj+yvtmNy7nt6dCL765zVLHlD6
 5FOmsXTMq384FbdZdfRXt8V2iFa6vtePeOJbFoBXlHzi/fKWrobbO+Yh1pFV4M97Q2QcE0FRCsM
 UUka6iEtl9EERwG4ug/4oJLJx+fWgDgKnH/QZh6JRa7hghcyNzmNypBnCCpAwxvb+VWPc/dr0Fx
 wOzEpjEjuogc3SCTDWSOWt1YHKXsdvxn2pksv3cekU7z9oT1i+5EbA4pExleE4GsEGW0ZZ6GwL0
 xNm+VUk9B8y2Zua7WjvUYwbydVnxWlE0SYlkqncw9fbWYy/qZWHJHGuZZOywl7ohehQJJFz4gAO
 jbsiPuSvDZkbubfy+qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfXwQWR7SWklV9Q
 xtRaHqsfnRF0K4M518uWVEU/U/w99uhWdssP0fxzso53o69T5am0qcH4Yi42R4BCpCIJ9iyBy6D
 nxVHP7MV+Cc64bp3IQm1REBZB3wWtG0=
X-Proofpoint-GUID: TD42sA4qvBs1UOljiEoyoRg1CWpdD-kc
X-Proofpoint-ORIG-GUID: TD42sA4qvBs1UOljiEoyoRg1CWpdD-kc
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aec3a40 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bK3wT2hOXHs123jOQ6gA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 7:39 PM, Lee Jones wrote:
> If a short interrupt fires after wled_configure_short_irq() has
> registered the interrupt handler, wled_short_irq_handler() calls
> wled_module_enable(), which schedules wled->ovp_work.
> 
> If wled_probe() subsequently fails during
> devm_backlight_device_register(), devres frees the wled structure while
> wled->ovp_work remains pending, leading to a use-after-free when
> wled_ovp_work() executes.
> 
> Configure the OVP interrupt first, then initialise wled->ovp_work via
> devm_delayed_work_autocancel() before requesting the short interrupt.
> This ensures that on teardown devres frees the short interrupt first,
> cancels any pending wled->ovp_work while wled->ovp_irq is still valid,
> and finally frees the OVP interrupt and wled structure.
> 
> Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> Closes: https://sashiko.dev/#/bug/linux-ca2e48a2-f511-44b8-a7d4-866f360bf107
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
