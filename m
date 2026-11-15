Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794738397;
	b=gYNmts49YWTjSXUqQSYcMGgmP8R9CjQes0wD0sShr2133u2fAXqz9rHUH2pPLpk6UB+P
	 1KSA8RFNUwOI5nJ+dxRoM5G+WIqytWBC53bddSOCemMx4J3IyyFQ1gJ9LGSwlvrnc//xt
	 w3cUohwDHIIOg97OiZ6TbRvDqwcpjHTxQQuD11pne2sSUQVDIXgD669KA/hykvelRQqhA
	 ueC/Xc9bn54lgF2wi2GSMeDyXO/WUD8sdvRsE9P5G6fuBoWDm343PS9sGVNzSF674io3h
	 rbTwcoZx+U1ja6jGnCEqEOgZyI7ULBAY+7h0cxEh5JsPh8wNxmDDqePgKDIUsy+W3IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794738397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=;
	b=kHC5DMtZ9QQ2SN7rlp1QTXkoEP9J938lpjcMlm3xe6xyJ05XDH8VlnN7cl9fUYNSxYzQ
	 +gDWPs49BZsSTx2eAL84RAs/hzJH9R9a7/admqSJByX6Qi++0QEyZfgYyWhxa5EFSuZBQ
	 ZDa4+6ahJfXqXlVfZGzyzVlWLJxwC1jLT0W70gz6qx9ObhyvlP/CmKpbhti0YXXIytAzE
	 1M2SmICfuFjdi0ny8E5ecCFMSPy8/ZyPOMXEDNVDuYYBvtpDTOVgMNMHj7Ybz7Jp9cnit
	 UNRCdsNYKiE2kOkDoAnHVODJfhUGP3aksRg3ZtDPlm/hkj8mkVv0f7v/PDAu8d4tfQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IqoDqfmE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PURHWbpH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DA6606A31F
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18DA6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IqoDqfmE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PURHWbpH
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7w4Yv2205456
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=; b=IqoDqfmEfPlYsN+B
	QEw2OGiWzGO6Uo75ZYhHyuJ5NL11ec4jlA7Qe001Urb1gDLHLezi9dHFICd1qd3L
	ZyIBv/Wb2zJq5wvzTwZJszEeHuQwnP0YF82pwn+42eTIbpiVwMBmqzNePE6kw9va
	IVK2dM5DttPCPOrCJOiZqJ0mSu8NWC03tx2i1IrVhiQEEkZPUWJ4i63OSCZMfez4
	kcV3rjTlkthPsgP/7fOuFHE/My4nC9XAI5QB348KfzFEKKP8v0OeVKhUpZDITPjl
	KDEVJGGh9aN0ngz7aPnP3vtIRNg/hwkF7oRaH7weEYXIAAauGAvTwCN7uLi6ZAnV
	TpEw/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk22rwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:26:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so151884585a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 02:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794738395; x=1795343195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=;
        b=PURHWbpHKaBvXQW4MqaEOmHAHPg5gQlLrp+tgRZ6U7JKl0vjTIbGvTHpeyiIsgUDkg
         ofyQTrVSPAXRjsVtticUqSlyfCkJEBHR6FtbCYXzOjk1/kknlco5kSBqirh+Dp+dmMkN
         5XTk84nWzZ1DjYSsT6AR4giaYj+qY0IvngZJI1aXar85gjwCn8B+2IDO757gLeIuOOt3
         qT1mxIBu/UQhHLDyn1XFHTdRnaA/zD4jkk87OBIdmhR3alpJk4EPIXWvKV4h6rhvwv/1
         sd/ZIBPakNcbsHFgJZcGJAJoh/9/+gEXqR5jbWBsEiburK/6rSfbxFE06RwhNVxt7rns
         wtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794738395; x=1795343195;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eINZJa71ijerBimwz6SbeBZSdnFm6CFYkuBmWpPCuNM=;
        b=HJyxlLWs0HDzjjltu0Sp9+qkjGRZDKnrADH+8iOeaEi5aOXbMEM4ahhbVktEy+jVA1
         JJXprMn7jpOK05eD31ugkc1IoTGeuxd5kaWQRsRSmfFDcOTz2b7GQW3bqMembrTVkKK6
         FV3zqKs9ygEhcNBug1VFkBNcxLP4Y/dPf9cjhAW88WXmBghjMXpQ+hLE2LBGZGap9hmC
         az8ePi4CebbPRSR+/CzZK7UmpEmtivOvKLGIS3XUR4gzjXz3y/m9GBuwkKC9mVczmKVM
         +kCqgqGKmNVwbikSVkGPxgXpRjzjwniz9O10NZM/SLqwV2zCxuffsHUNwfGdEmOLphX5
         RJ7w==
X-Forwarded-Encrypted: i=1; AL+hErHHsRsbrgVPJ9mI6Z5WCOFTtySW18hxPcOiw4Ctg3WZxkbznz6LBfqWQ8wE0JsUDlteCbiAhfswnmEdUlTA@vger.kernel.org
X-Gm-Message-State: APuU4Z9sdpsNJfojeyNMT4QUBKcaELZzmunTcsfPjju1k1V/+2ZgIAO7
	peOdkYPaeJxDMKT3L7iihdG1Z4UtoETeI0enkqMlYT0eC+/OVY8bVxEHA2LHboa7EArST2ec4A3
	WatR3PrYDgIsXAIZMsXE1apVVfZEds9JhOztf2qrL2mOizrM3FITovdwRHUasNdtUjm7S
X-Gm-Gg: AYBFou1xB74oKSKOsrnTdyQOhhzTJmDpQW+M10r2hKPgW6+bR7TzWqRhWh6/Kzk0zo4
	6tOEsmO9srmRxBDL0Uj2elTLT6zex9SRQBzVyDD5NEHtv+gU47YRGjWCStEDlvZoTyKL0GTelXu
	3kRDHp2SMcVHrcrdzO8JM+OgYrzetCXwkxzt391fpi8x62JAgg3KnzANRaQSjYMqwD5DJ3eBaAw
	oFi5ylfgZ/pnSBlLSUce8zFtaAObQta8yBeRpVixEO5gfHSx7uiY+zYUzZLsxGxs6A4bljWBPyi
	V/KVIZ7Fg7qDfuYIrl8JPikIa0GoW+9R9r1M2zFU9hhldalgZOOv+KnZ89I6U4iPlzDGNX8AhyC
	cdWh47tPyjy5xugorNh6nULonG0CeJvZwZCyz4EjV0WNzAsMHBE+uHTB9KxC9m9CMXJgeuaaEvl
	aVZYj6ICGw3OW2gExJ5w==
X-Received: by 2002:a05:620a:6910:b0:947:b201:fafc with SMTP id af79cd13be357-9494bb572b9mr1257649985a.39.1794738395340;
        Sun, 15 Nov 2026 02:26:35 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:947:b201:fafc with SMTP id af79cd13be357-9494bb572b9mr1257647385a.39.1794738394911;
        Sun, 15 Nov 2026 02:26:34 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c5095b236e0sm297753666b.20.2026.11.15.02.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:26:33 -0800 (PST)
Message-ID: <c97bfa2a-4f38-4a59-905f-a590dd018594@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:26:05 +0000
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
Subject: Re: [PATCH] ASoC: qcom: common: report line-out plugs on the
 Headphone Jack pin
To: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F6DYMBYB-qUL3u3jbc5eqY3bdTqU8qYc
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af988db cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KsNVwHy3fz-HUrcVWHQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MSBTYWx0ZWRfX+NQYcmiUjZ85
 njwbK7xvuzhgrHxn2GGlnNYsoqgu6Hq1T5d/it+kAH6Nem+2G7Ad8fbCXcdljrI8KqKx/ZmGaH0
 ZhnNsg/DT+S0HL9uMvAJnxJeiCCHqfBY33XXdmBLpMalTGWeRnP0O9mrumQyJT2Aqno5okkTTGg
 GhlkSvQ0GQHEoelxy5FHkL44ioy0WR8urVPdFdlxTzlophHESGF1754V0udfrnj4s48Yj3mLhsg
 o9MRCL7NdbcXc4fUoavMhzNijO4XH0/VX7SgToWjSgJPbnzayV7HdpcuVbiff8KllOalEvNWfXx
 bvsPen5qZI8xrAB4t9A06SP3eOF3x+JWcZ4EI0IR18FOKswp1GgnZ14GehVITDWIdmObaB1+Osi
 EJRZLtXcy5NLvxJUXx/s3nh///17V8hs9oZyRCiHfN5LkTZrofrn/psShmdLtaw3Y399cMPn8ar
 hQcF0byzBWXzHQAuchw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MSBTYWx0ZWRfX6GGwTjS988Af
 RxlFrApvImdCSPCFxSzanK3NR8e0P3RWHtecPxNt0wLzdLv0A7GzuNdkrwYBTXqAJub3zCoMxr0
 nn7f5VYTr7wZyfzGqcIxXH1+vq4v+RA=
X-Proofpoint-GUID: F6DYMBYB-qUL3u3jbc5eqY3bdTqU8qYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150041

On 11/13/26 9:45 PM, Ingo A. Kubbilun wrote:
> The WCD MBHC classifies high-impedance loads (above linein_th, 5 kOhm
> on wcd938x) such as active speakers as SND_JACK_LINEOUT. The
> "Headphone Jack" pin only matched SND_JACK_HEADPHONE, so the jack
> control stayed off and userspace (UCM JackControl) never switched to
> the headphone output for those loads.
> 
> Seen on ASUS Vivobook S16 S3607QA (X1P42100, WCD9385): active
> speakers measured at ~20 kOhm per channel were reported as LINEOUT only.
> 
> Developed with the help of an AI coding assistant (Anthropic Claude),
> which drafted the changes from the Windows ACPI tables, existing device
> trees and test logs; reviewed, built and tested on the device by the
> submitter.
> 
> Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
> ---
Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
>  sound/soc/qcom/common.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index 5dc954dc1cb2..af5cacddf67d 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -335,7 +335,11 @@ static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
>  	},
>  	{
>  		.pin = "Headphone Jack",
> -		.mask = SND_JACK_HEADPHONE,
> +		/*
> +		 * WCD MBHC reports loads above linein_th (5 kOhm) as LINEOUT,
> +		 * e.g. active speakers; treat them like headphones for routing.
> +		 */
> +		.mask = SND_JACK_HEADPHONE | SND_JACK_LINEOUT,
>  	},
>  };
>  

