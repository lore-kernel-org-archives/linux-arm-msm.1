Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477608;
	b=X/6tZ0Db5LpsI3w6nmWA3XQg+AZ3wA3FeBHPzeTJrT/SpsICAuO3v8Zp6zbvTpDhdqom
	 OaLt0xLHVC3OtRIjZBhagvkSNF6T/PSG42HNW8pQau7e4j9xilPIBzCPKQGOG4Jbu5Onv
	 fgQFKC1nC56T7KUAnoKMs0noxObpyCHWCneuZMxk7tLJpw5MX72IVPu9o22qxryVUlB3O
	 dJeJQzGaH+KcHZq+2h3EjBE2AjCXUxLdqFk2NKQbIhmoLyKdPgV2xqjtTC4kC58u8CsHh
	 RsJ//IGZ61Mv97FulZaZTmHwXy0zl7IjFb9vlbP+BFjeW5V2R8iVP62I5IiT1ibM7rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=;
	b=a4lFwjKgLMioqGTJSxWLiDzT1I8lmo/nbF68f2+yEoynfrJZ5Lj9/02usVQyrq3SgFLT
	 UWSawXQwurYt0e5S9GBNR3Js97ffrfihP5BiIAUZmq5+tAqr0Pkh7NVW9Q/Z5xQJU34e+
	 iomm5G/T44Oegbeq18O8m7opE290A3lipkaHJ2gxbigcdg4cXah6okDjAbIbKV8rhSyZo
	 HWAJUV1CWZ/yGU4OHNNhP6iNtikRCDoFG0sWxV1+a1rMl+fSNRIOT1k0wHeCOGXqcKgqM
	 chKWw3wVuTEOLJALEMPKHXnRP1TzTQtpeWHwZyQhWJRGU7cU5irtbnc/m6XYz7dL87w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jRnqObHs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PChaR9UT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC14F606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC14F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jRnqObHs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PChaR9UT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tV373306691
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=; b=jRnqObHsoEjKRncU
	IdotiXEOHxdM+OdqLnkMtzgi2MdhXJSopjGkmj/MlJXTGHYhWJYmHx5w+BNE6dTD
	Too967m1zhsmFEUWOQhaqjlgThDQoY6kKMsYi1O8E23Qe6qfhRAf09XaHVv29+yr
	pKIqZM1xFpZotkqbSdisfNm/39W1ojTkBCsxFnLEDdSovwDeMPSX9NrI+2tKw4Sp
	Oe51u2gqqHgSsNhaPDtLvz4mWGLwCzi0E5yAARplUOyNT/2M2oz5odbKKIxzVggG
	O6YEDJetjv3UV/bm0I5QgFSjad75IGablrqIplth7prNx3nhMvKD0iS82dJDNl9x
	gd2J0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ss4r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:26:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so657819585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477606; x=1793082406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=;
        b=PChaR9UT+V2tZ1ls4JuVB9mpTcvehTrRq5VqzA+Ojd9evOEIl5Hw/IJGaSVmHUUaIy
         9IaSihmVvsjAFmatGa+uirrMX0c3k42LIEQJx6h0oBjRsioznEiAgpP9T/hH9JaEgOsh
         QEwi6f4MC/Wc8bmfDb9tU6j8looEdexT8JyK69sBWbMT5HA/sDEdrah36GE0xQGwQAmy
         Hs5ld8yRgm6WHn0TYuaiKER7WdPD+/dSOSI7zv339feDxTE0+ADXs2h3+buNYm2oplsS
         o0vkHnHufdoxReKtnhhjwFC/+DUi+esrbwDRzaQBPf+gHezzxAddXoMRMH+2lLcdgJRM
         +8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477606; x=1793082406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGVkzcZ+M1GQJ/JyVpfuMOLzWiS8Ll/ZhIMxedWXdTc=;
        b=veE8sXVTHI5FqbtboEg8hJ8S0cOQ6ev/QT5ZsaxE399acwodgYGO6/c/EVb9xWp9Xy
         7azOTfPrYpN/ep2JC33yXpJm8sc06Y6Nij2KaZYM/e+NIkVhQApIjXMQzRY7AAYaD0I1
         65jRpZu5mMumHS9mC/LmZvS1SYWaY26BVPLmeKPqAsXpnotQdr/MU/2qRAVnOiaFGUw6
         LBN8Q5TfhB2zKLvgHSAsWMr+iONFhYxnHH9e4LYn9/XijebLAVsc4Z5HXj1v9DcY/B28
         uOnDj0RqsYfcjIoKVxdkAab6hMJQJVTPJIEKeYRS8sEgG9N74bOZsSxJBxk6S+hoCGUJ
         ocDA==
X-Forwarded-Encrypted: i=1; AKwUvByiLmYagd78AdIyJBwDajmEs5OOpsVwsz1up5kStJJ3Pzx5/aAyYGtEEkIjjah2qIdtVE75gei3ryoFR/X1@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2ZJBwGeAYJ6WYJArnqWVCPlPUcwGHCcN7QV789RGUG7PYKsTk
	+f0zwpHTKcaDZ8UFjyAXVJvI3GIKGQeYrHl0fl+dSxF0wNSsvVaWWu3Y1DaDNKV0giY5dr/4dRX
	HpPqUXPAJUCWorjYe3uEDnC37tAZapPUKnBgXEUL9mF9BkbMur+0UvKAErHtqIG1w1h0s
X-Gm-Gg: AYBFou0XoTPwpYaEZP0aWPGdI+NNpKLORlymDF1lWn+HVQnmTwM2xnxVBSZbxCHhGZW
	jmTr8+Cj04dpjuKMLlZmfeaP0NsWnlqzECKDHNagOd1pipFNOl56Nr0mYMUXDgbKBCnYGOh7dJE
	kWu3iakxcKLN5dknij34T+3X+cGKYsrHO/iFFJ/vaKHBk2OpLjpv/TtN2FZJetTfrFEcseI5jjW
	XRryuuvWBUaT/3CfzgP/0sS4uSHhzSgrDuHNjXz85/blCyJ7tWDeGSwZ06JNHZn2yHrcj66jkJi
	D3JZcwRCteauR8tmMQpND0CCSsQImPQLR0ARufO3di63s+CS+a78b2alSCd2GWHxKOK70Gav/b9
	Gxu86oDyVHlPbVHpjMsSPtdV99A==
X-Received: by 2002:a05:620a:1991:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f3e39f10fmr881920085a.23.1792477605825;
        Mon, 19 Oct 2026 23:26:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1991:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f3e39f10fmr881918285a.23.1792477605265;
        Mon, 19 Oct 2026 23:26:45 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d6dd2a2sm4074666f8f.7.2026.10.19.23.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:26:44 -0700 (PDT)
Message-ID: <56af7a4c-2212-4397-bb96-d5ba524ae9da@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:26:43 +0100
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
Subject: Re: [PATCH 0/3] ASoC: qcom: q6apm: Fix shared memory unmap
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX2sJXCspxN68W
 VV0vhwDnBuXf8s0GZGZd77d5fNP2NeQtF3lOI8UzZHQnSvYdsShnMoIIf8/ZNzINnxKZXcAJJ2i
 zDsCL0taEctICTuhYf7JtNnhR+BubXncmCh82O0NEgaRc+7ILJiOfTmmDOaZL4QRQ4mr39g+XK4
 2vqigdiCU7XzBO0K8Zg+pKwQAqGYrcihmLQ34uBhfVVYs2fDbIIwgzHzWI84dakb7KndGx6sV95
 +C6e7+qv9lGPIXAd7bfnSHgmDKgaBtSV0eXtmrIGBCWfvtYd+FAXH18pRZgNf1dAbBSrWeZ08e1
 oSCOrTLipU12zhNM8qvR70LDGcQsaErAVpr8WCYS6WOXQfjGa+1gj6ikjmEZojMNe2o0epQFWki
 c8RYZ9lXGZVnfSZss7tARrlcgL0VN8MxamAzAvyPk0KWdJRFEGgg1M8oFml1LkaAEbBYeAeNwnq
 eXhqOoSVF6HVHIEuvIw==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad709a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2d4p9qffbK6MGnQiVHYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GeBEdoBkVHYrYzRQ8tFgFjnVSQOxMzJA
X-Proofpoint-ORIG-GUID: GeBEdoBkVHYrYzRQ8tFgFjnVSQOxMzJA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX2fywVZaApQeE
 N3789Nr+QFV6m2OHa9O58ydAQNjvlZjDYJfyJ61XiwAUeybd9jDi/aC8SLtsxLwMcouzrSjhKsO
 qU7joPvpQI8TCKiUC4ISvlE8fCwQlF4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/16/26 3:11 PM, Shawn Guo wrote:
> Since the early buffer mapping, q6apm maps a front-end's DSP buffers
> once in pcm_new() and unmaps them in pcm_free(). The unmap side has a
> few problems, which show up when the sound card is unbound and bound
> again, e.g. by unbinding and binding any codec on the card:
> 
> - The card core removes the components before it frees the PCMs, so
>   the topology and its graph info are gone by the time pcm_free()
>   tries to unmap. The unmap is silently skipped, the DSP keeps the old
>   mapping, and the next bind fails to create the PCM:
> 
>     qcom-apm gprsvc:service:2:1: Error (1) Processing 0x0100100c cmd
>     snd-sc8280xp sound: ASoC: can't create pcm MultiMedia1 Playback :-22
> 
> - Once unmap is actually sent, every command stalls for five seconds,
>   because the response handler matches on the wrong opcode:
> 
>     qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode
> 
> - Unmapping the position buffer clears the circular buffer's handle
>   instead of its own.
> 
> Patch 1 fixes the unmap response handling, patch 2 makes the position
> buffer unmap clear its own handle, and patch 3 moves the unmap to the
> APM component's remove callback, before the topology is unloaded.
> Patches 1 and 2 go first so that patch 3 does not introduce the five
> second stalls.
> 
> Tested on Qualcomm Ride board by unbinding and binding the PCM1681
> codec.
> 
>   echo 0-004c > /sys/bus/i2c/drivers/pcm1681/unbind
>   echo 0-004c > /sys/bus/i2c/drivers/pcm1681/bind

Thanks for trying this case and fixing some of the issues.

Can you pl add Stable tag for these.

Other than than they look good to me.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> 
> Shawn Guo (3):
>   ASoC: qcom: q6apm: Fix unmap regions response handling
>   ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
>   ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology
> 
>  sound/soc/qcom/qdsp6/q6apm.c | 49 ++++++++++++++++++++++++++----------
>  1 file changed, 36 insertions(+), 13 deletions(-)
> 

