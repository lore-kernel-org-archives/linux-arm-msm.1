Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795359525;
	b=bqbeDw/ASghf+7RZJZSfy3I+LtZFloNNkHjjtw3UcqT92yIfSrsFrh8yYrtPKUPOlZzT
	 YkgDkwItwENG+q2r1cy/bLmcK/H3E55eT24b/FqW/dfeZUWj7lHWLeIiNpZoVO1l5tB9+
	 67d4qmQGLW0sOUYxEj5shfDJbHfzjrDjQdLbTJ7Lv2MRQzsDUZ96IP5tiMeKzyLy8cFQ6
	 aHiavuQ4LdZq34Y0+G4uYeRliqSZ2DEZN1KQAPmBuWj0D+emkDHiVp/7Sp8mdNzdr1lFG
	 Xb8hpi6GzuSx0r4fze/7VqtPUfprjPNnKEHa/CDZgof14MVh7KVYkzAl7GdCuYeF1OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z67TdVpmW7/CTIOiej8+D/av2/y/LIc9vuhXZeHqQIc=;
	b=thNEelVoLcmyvMsxYZENUEVJ4L8k1LkaWfVojou3rhAXZ6dVTJRWIpYYwg9jma3OGIeQ
	 FpDhHagQDwAwBMcknnoXBV2WpFva5twhKYgkzoWqatTI5lYKeBLbR/UgInYHeDXpwf2Ol
	 z0+YMK9/6UUhHf93VBBV507BpTJXwJlL9cAE155tIFmvgDYc7QfkZmJZU9XjCEVCK2two
	 /65u2ANsW8CViNqmOC7rzXFEnTPsJaz2/fJXxdm9q9l+bhb5eaRUvt6zBYEfwLyvRrO+N
	 b2d+Ua3uRpNijYHnZouAY/nP8M9AnTT5PjPipuQuIwKbQVR9Vn0/TzEFvwPEsOg7Q5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCC0cbh2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ipc4n3lB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B13606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 14:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B13606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCC0cbh2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ipc4n3lB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMBkckF3049858
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 14:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z67TdVpmW7/CTIOiej8+D/av2/y/LIc9vuhXZeHqQIc=; b=OCC0cbh2PFrrLGuy
	DbRcfwtXWkvAZhnjxfadZVNvLSvjMdOLdecJMmSh5qQMvMPNV77FYN/o59JIbPAx
	yfXji6AUJGYm9qbgWcYDfyWeu9ICNBlA1BXY9LMR3S0MLXLun+swpsCxMh4IrdXi
	yG15H+K6xz4doi6DQeB9u5d6m3vUxmWjKrSCGX2g3jpZ18r8OJwd02beqofaaBIQ
	ZA0YWoK+rm1GwjNMt6s+9Uqcdr3vlk0ebspxAoo2/v+beV1K76bEOE1YfLVVyqFm
	dk01SPAIm8SQ3Gpf4NfZb1LPf0mbvABu49MSEb5uWzQz4LsyCpFl/OjBcjZKu0Cd
	mFlycQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgbp7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 14:58:43 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6790b1d3bc9so4579087d50.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 06:58:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795359523; cv=none;
        d=google.com; s=arc-20260327;
        b=h7sZwy2+dP0dzDcWUPk1Pn7M8IToOgdgBO5UsBgxBbNdnpBAms1NxBiwXYcqKNdZ1W
         ZRCdLX/POhSdYCzbkP2yWalmBf45G4X7FE86YaGZ9OIp+qt+L2oZO9FenigRb13Z5KsO
         LufQTUajuSWRTxNUJ8S4qKFkUeknqAjThg+X/BI0ZsKrIPvC8qE7nwGxwNokCS7rBpvf
         1VNUmLnHoGZNQRsITBoACzBTtgNpH0Iag2v/+tJVeChNRqQuP+u01m8fSwwX+pGiH2ZS
         qLtGmPS2+7QgOkebecvlLBm6CCWfAfqMFm2Y2WUIUrQthMREvWMaWyUO8s3TqiJYXEyt
         N2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z67TdVpmW7/CTIOiej8+D/av2/y/LIc9vuhXZeHqQIc=;
        fh=cuiMXtHzoqQobiWMDJp5ujo0+u0IMlJvlPBks7qZt30=;
        b=QYb0jFYDm4waWp/w54j53uqsWsqGwzvJ2ka4kfm4U1FxICe4+4exx8qyPfCqjeA1V0
         WNB/8YUZ2SKztrLnPTY4cqjwP11cy0rYK3pyidchKmwk2CftlUfJXY2mEIZBpCIteUT8
         7IuYHkw3MG8appU1L9waYCqNiLiGtP2uE5b4aqK9yGCgKdMwyQ10SiqjJhj2ZYo2V2Ee
         1oEB8MHxXVvZzSIQ8bnAdKXZBXe383lXFyljKRpFm5wnEpwBDuWiMBXT+tBwhmS/YCt/
         Ckxs7uNofU4+FjH+1YxMguIdDLYLi4LZUZPHyc3HpILEfFrmNZrJOx+LmrRNqSldAhAo
         UGCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795359523; x=1795964323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z67TdVpmW7/CTIOiej8+D/av2/y/LIc9vuhXZeHqQIc=;
        b=ipc4n3lBx3naa/mTtGBO7leLdDqhfKVl6K95/hlc9xZH41F0NzkdxcdM+qfmc6TMRm
         ZIcYK9dh/G1VFUmwR8UIoekW1Qg1J3OhDwinyqkVgT73o6uZWsaizjHKCKQ5arGDJPDt
         RdvlAWMscmOS0EbmHSuu9k+dzbBx1bUKpIJaCgyttnmVMe48iNMpJFi4f5RuXkvvg+6K
         Fa4O6UAL6k+lD0qDZVJoDsZfU3nLeNPXCbn5RNBRDhGacYIR7QONisxV/J2XlEGc9eKA
         16Gfu+aQeN8uIZACFrOYO8lBODA6zmyyTeEHRJxbEKbBcR7RaMh1ij/xZlZqZYK3FrBc
         0vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359523; x=1795964323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z67TdVpmW7/CTIOiej8+D/av2/y/LIc9vuhXZeHqQIc=;
        b=feTTvyAhhKKb/aKu/ubJo3PkatRVr9J5tZgtkOK9k7dtnxyqY/oJU28VV7YEEhGzOZ
         UoOOrc3qAlnkgOaNLgw5mT9r7RU9F2htrqBlbIStTK4gG7zRqeWA29QgsfoyzBW2rEJA
         eKRS5g2u5A7LPbxU+tROSmWf2/by0+/j9e5XpowHWDa4RuT7kV80jqJqP93oU0zoWtx7
         +/vDeFCcWdicPVyiaLjwEhb/yJLicoQMJ2Gf+ot4l8Qs4sRW+Kfcu2DdqTh0a3zzBrI8
         anUqbD0ZEujrnp+qNp69zPPgkQU8gCQZcrNkN4+c/u4YJm4vwNTL/ntwfneQ8EU4RJYV
         3oqg==
X-Forwarded-Encrypted: i=1; AL+hErFsnrAoGc4jCB843ugsGOT45IdMRdCgVdZmi1RXYBKVSWQPdK4bocTkovrWu3mTRpVveu/0QWLWKwq1BIbU@vger.kernel.org
X-Gm-Message-State: APuU4Z9/waupk8CIf/+XjroD4hiLqLhqB/1RtvUXgW9vq+1XoYaIUKyG
	SORf1eSbLIun69L3iCe1sIxhWpZQ8BGlH1drpDTUk5sSphpXJEhXqFGj5ip2t/h0SF4AdkqBtCo
	/5kzLu7Z+0z1UCEjR4F35Hy1BLfsmna9CIsyYTsGPgwuld2g7aamHboKOKE/1x+FN5sp0/TM+1w
	k3GElb2cI7Ncvvyui+WV5+lGn494K/qSPR6gZ/aSmyV1zpZgANkZCIxQ==
X-Gm-Gg: AZFdTZchPcTToAsNjs02SWvcjrYSJ4xiVSy/DOdA8pyw3Gs8Vxwu4XmRbTEY7Z4D3w1
	mpHri4CO6pqx7ebgwLtq9cLDfnGOWburOGiyOtkf4MaivjlaZM6yOWVAHWkXSe8iLzzjICbMgBd
	vHPblKyPjWn30RzmAmo4Kuuft1MAknFkDIC5II309PEMlENmIgTuQLKEY=
X-Received: by 2002:a05:690e:d5c:b0:67d:e4c3:d850 with SMTP id 956f58d0204a3-67df447f1afmr3175624d50.80.1795359523337;
        Sun, 22 Nov 2026 06:58:43 -0800 (PST)
X-Received: by 2002:a05:690e:d5c:b0:67d:e4c3:d850 with SMTP id
 956f58d0204a3-67df447f1afmr3175608d50.80.1795359522796; Sun, 22 Nov 2026
 06:58:42 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-imola-sound-link-order-v1-1-71d8bf1129b4@oss.qualcomm.com>
 <655212ed-4812-4747-ba5a-f0093bf05411@oss.qualcomm.com>
In-Reply-To: <655212ed-4812-4747-ba5a-f0093bf05411@oss.qualcomm.com>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 15:58:31 +0100
X-Gm-Features: Aa3M54rP1VIJz82iUaXQdLmIik0LdXXaBl4XGMZlPQ3KhuZT42ZimIVtTb28lGw
Message-ID: <CAPzfCAbOiCiVnpe-738CUpOmD1LyMej6EUOgH3myc9139vcufw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: arduino-imola: probe the sound
 frontends first
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA1OSBTYWx0ZWRfXz6Rj1QeJP0k0
 HncEaOzpttNSFkq7aI0GiOfcf/LF5YNjsM2jD6HCmgge2nzh++bwZP4a2wCBN1/MT85xo2fv2je
 XixOMrcH6vUAN4xVV90hipKJfD8FE5DRpzUxjgkRzxOjXp/pDApxD/fufomipPIIyf83fRVAa+r
 kUdFD3pOQy0tJKt2NTCF5FUUCvbHHFCN9d28FG/u0fiMmKuWIU4WeI7E5bKKu9ljk6WjIOSj4mX
 gUEslbbTZNIoSBUCon5RCtkThwtjz78rNNlKlIg3sVtjUlag5MUJyOQc/N9c1HRtkwHw4ILs0AA
 tLtDXqEJtnZHpNz98McYdbiuwTxFAA2lyitODrEtAAEN0hQWY7gXVz6QWSqANdToxHATTMU1cCB
 tnVQMZDhIbpGIaegzAigUg8IkR3Ac+WETet1m8VwzfiA4xtSN+0ff6SEcSC33sZI+JNMaRbQ7vE
 NCMvmTKmt+LDsEFm1sw==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b030324 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=gUyalHTIZlskWCMACU4A:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA1OSBTYWx0ZWRfX0Ct9NfYKvKrn
 O7xqW6xDaBSTZ2PhxGn+Bx8lbOnP2ZcFKzJsNLdCU0lUz6Z/7GxL4LmwxGgeEySBHjHwpodUUh2
 nB+4PoAoYiuoFdpPWVGAwl3FSIwFPsI=
X-Proofpoint-GUID: YMFNhGnjuqOxGSos75tCxR7OlfpiIyBr
X-Proofpoint-ORIG-GUID: YMFNhGnjuqOxGSos75tCxR7OlfpiIyBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220059

Hi Srini,

On Mon, Nov 16, 2026 at 3:26=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> On 11/14/26 12:57 PM, Igor Opaniuk wrote:
> > The card probes its components in DAI link order. With the codec DMA
> > backends listed first, q6routing is probed before q6asm-dai, so its
> > routes from the MM_DL and MM_UL widgets (created by q6asm-dai) cannot
> > be added, the component probe fails and the card is not registered:
> >
> >   q6routing ...: ASoC: Failed to add route MM_DL1(*) -> [MultiMedia1] -=
> HDMI Mixer
> >   ...
> >   snd-sm8250 sound: ASoC: failed to instantiate card -19
> >
> > List the MultiMedia frontend links first, as the other qcom sound card
> > device trees (RB5, RB2) do.
> >
> > Tested on the Arduino UNO Q: the card registers and a tone plays on
> > the headphone path (all 11 DAPM widgets powered).
> >
> > Fixes: 61a95870e0f3 ("arm64: dts: qcom: arduino-imola: add support for =
sound")
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> > ---
> > The UNO Q sound card from 61a95870e0f3 does not register as merged in
> > arm64-for-7.5 (snd-sm8250 "failed to instantiate card -19"); with the
> > MultiMedia links first it does.
> >
> > The DTB differs from the current one only in the order of the dai-link
> > nodes (and the phandle numbering that follows from it); dtbs_check is
> > clean before and after.
> > ---
>
> Thanks Igor for the patch, but this is just start of the problem, Once
> we apply overlays the nodes will be sorted once again and we are going
> to hit the same issue.
>
> can you please try this patch:

I've tested your patch on the Arduino UNO Q with the UNO Media Carrier and
headphones on the jack, and confirm that it works.

Please feel free to reject/drop my patch.

Thanks,
Igor
>
> ------------------------>cut<-----------------------------
> From f9c336d90f1689c02ecd751c40e3f37379b6a690 Mon Sep 17 00:00:00 2001
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Date: Tue, 22 Sep 2026 22:21:22 +0100
> Subject: [PATCH] ASoC: qcom: common: setup fe dais before be dais
>
> qcom_snd_parse_of() registers DAI links in the devicetree order of
> the sound{} child nodes. q6routing wires static routes such as
>
>     "MM_DL1" -> "MultiMedia1" -> "HDMI Mixer"
>
> which need the frontend (MultiMediaN) widgets to exist before the
> backend widgets that reference them. This is a latent ordering
> bug: any devicetree or overlay that lists a backend node before
> its matching frontend trips it with
>
>   q6routing ...routing: ASoC: Failed to add route MM_DL1(*) ->
> [MultiMedia1] -> HDMI Mixer
>   q6routing ...routing: ASoC: Failed to add route MM_DL2(*) ->
> [MultiMedia2] -> HDMI Mixer
>   ...
>
> and today it is easily triggered just by reordering the sound{}
> children, or by an overlay that appends a backend link.
>
> Iterate the children twice, frontends (no codec child) first and
> backends (codec child) after, so frontend PCM DAIs are always
> registered before the backends. Per-node setup is moved into a
> new qcom_snd_setup_dai_link() helper so both passes are identical;
> cards where every child has a codec child (non-DPCM) hit only the
> second pass and see no change.
>
> Fixes: c25e295cd77b ("ASoC: qcom: Add support to parse common audio
> device nodes")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/common.c | 182 ++++++++++++++++++++++++----------------
>  1 file changed, 109 insertions(+), 73 deletions(-)
>
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index 83b745f617a8..4e0541c3db42 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -178,12 +178,104 @@ int qcom_snd_apply_dai_tdm_slots(struct
> snd_soc_pcm_runtime *rtd)
>  }
>  EXPORT_SYMBOL_GPL(qcom_snd_apply_dai_tdm_slots);
>
> +static int qcom_snd_setup_dai_link(struct snd_soc_card *card,
> +                                  struct snd_soc_dai_link *link,
> +                                  struct device_node *np)
> +{
> +       struct device *dev =3D card->dev;
> +       struct snd_soc_dai_link_component *dlc;
> +       struct of_phandle_args args;
> +       int ret;
> +
> +       dlc =3D devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
> +       if (!dlc)
> +               return -ENOMEM;
> +
> +       link->cpus      =3D &dlc[0];
> +       link->platforms =3D &dlc[1];
> +
> +       link->num_cpus          =3D 1;
> +       link->num_platforms     =3D 1;
> +
> +       ret =3D of_property_read_string(np, "link-name", &link->name);
> +       if (ret) {
> +               dev_err(dev, "error getting codec dai_link name\n");
> +               return ret;
> +       }
> +
> +       struct device_node *cpu __free(device_node) =3D
> +               of_get_child_by_name(np, "cpu");
> +       struct device_node *platform __free(device_node) =3D
> +               of_get_child_by_name(np, "platform");
> +       struct device_node *codec __free(device_node) =3D
> +               of_get_child_by_name(np, "codec");
> +
> +       if (!cpu) {
> +               dev_err(dev, "%s: Can't find cpu DT node\n", link->name);
> +               return -EINVAL;
> +       }
> +
> +       ret =3D snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
> +       if (ret) {
> +               dev_err_probe(dev, ret,
> +                             "%s: error getting cpu dai name\n", link->n=
ame);
> +               return ret;
> +       }
> +
> +       link->id =3D args.args[0];
> +
> +       if (link->id >=3D LPASS_MAX_PORT) {
> +               dev_err(dev, "%s: Invalid cpu dai id %d\n", link->name, l=
ink->id);
> +               return -EINVAL;
> +       }
> +
> +       if (platform) {
> +               link->platforms->of_node =3D of_parse_phandle(platform,
> +                               "sound-dai",
> +                               0);
> +               if (!link->platforms->of_node) {
> +                       dev_err(dev, "%s: platform dai not found\n", link=
->name);
> +                       return -EINVAL;
> +               }
> +       } else {
> +               link->platforms->of_node =3D link->cpus->of_node;
> +       }
> +
> +       if (codec) {
> +               ret =3D snd_soc_of_get_dai_link_codecs(dev, codec, link);
> +               if (ret < 0) {
> +                       dev_err_probe(dev, ret,
> +                                     "%s: codec dai not found\n", link->=
name);
> +                       return ret;
> +               }
> +
> +               if (platform) {
> +                       /* DPCM backend */
> +                       link->no_pcm =3D 1;
> +                       link->ignore_pmdown_time =3D 1;
> +               }
> +       } else {
> +               /* DPCM frontend */
> +               link->codecs     =3D &snd_soc_dummy_dlc;
> +               link->num_codecs =3D 1;
> +               link->dynamic =3D 1;
> +       }
> +
> +       if (platform || !codec) {
> +               /* DPCM */
> +               link->ignore_suspend =3D 1;
> +               link->nonatomic =3D 1;
> +       }
> +
> +       link->stream_name =3D link->name;
> +
> +       return 0;
> +}
> +
>  int qcom_snd_parse_of(struct snd_soc_card *card)
>  {
>         struct device *dev =3D card->dev;
>         struct snd_soc_dai_link *link;
> -       struct of_phandle_args args;
> -       struct snd_soc_dai_link_component *dlc;
>         int ret, num_links;
>
>         ret =3D snd_soc_of_parse_card_name(card, "model");
> @@ -233,88 +325,32 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
>         card->num_links =3D num_links;
>         link =3D card->dai_link;
>
> +       /* Register frontends first so q6routing can resolve BE targets. =
*/
>         for_each_available_child_of_node_scoped(dev->of_node, np) {
> -               dlc =3D devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
> -               if (!dlc)
> -                       return -ENOMEM;
> -
> -               link->cpus      =3D &dlc[0];
> -               link->platforms =3D &dlc[1];
> -
> -               link->num_cpus          =3D 1;
> -               link->num_platforms     =3D 1;
> -
> -               ret =3D of_property_read_string(np, "link-name", &link->n=
ame);
> -               if (ret) {
> -                       dev_err(dev, "error getting codec dai_link name\n=
");
> -                       return ret;
> -               }
> -
> -               struct device_node *cpu __free(device_node) =3D
> -                       of_get_child_by_name(np, "cpu");
> -               struct device_node *platform __free(device_node) =3D
> -                       of_get_child_by_name(np, "platform");
>                 struct device_node *codec __free(device_node) =3D
>                         of_get_child_by_name(np, "codec");
>
> -               if (!cpu) {
> -                       dev_err(dev, "%s: Can't find cpu DT node\n", link=
->name);
> -                       return -EINVAL;
> -               }
> +               if (codec)
> +                       continue;
>
> -               ret =3D snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
> -               if (ret) {
> -                       dev_err_probe(dev, ret,
> -                                     "%s: error getting cpu dai name\n",=
 link->name);
> +               ret =3D qcom_snd_setup_dai_link(card, link, np);
> +               if (ret)
>                         return ret;
> -               }
>
> -               link->id =3D args.args[0];
> -
> -               if (link->id >=3D LPASS_MAX_PORT) {
> -                       dev_err(dev, "%s: Invalid cpu dai id %d\n", link-=
>name, link->id);
> -                       return -EINVAL;
> -               }
> -
> -               if (platform) {
> -                       link->platforms->of_node =3D of_parse_phandle(pla=
tform,
> -                                       "sound-dai",
> -                                       0);
> -                       if (!link->platforms->of_node) {
> -                               dev_err(dev, "%s: platform dai not found\=
n", link->name);
> -                               return -EINVAL;
> -                       }
> -               } else {
> -                       link->platforms->of_node =3D link->cpus->of_node;
> -               }
> +               link++;
> +       }
>
> -               if (codec) {
> -                       ret =3D snd_soc_of_get_dai_link_codecs(dev, codec=
, link);
> -                       if (ret < 0) {
> -                               dev_err_probe(dev, ret,
> -                                             "%s: codec dai not found\n"=
, link->name);
> -                               return ret;
> -                       }
> +       for_each_available_child_of_node_scoped(dev->of_node, np) {
> +               struct device_node *codec __free(device_node) =3D
> +                       of_get_child_by_name(np, "codec");
>
> -                       if (platform) {
> -                               /* DPCM backend */
> -                               link->no_pcm =3D 1;
> -                               link->ignore_pmdown_time =3D 1;
> -                       }
> -               } else {
> -                       /* DPCM frontend */
> -                       link->codecs     =3D &snd_soc_dummy_dlc;
> -                       link->num_codecs =3D 1;
> -                       link->dynamic =3D 1;
> -               }
> +               if (!codec)
> +                       continue;
>
> -               if (platform || !codec) {
> -                       /* DPCM */
> -                       link->ignore_suspend =3D 1;
> -                       link->nonatomic =3D 1;
> -               }
> +               ret =3D qcom_snd_setup_dai_link(card, link, np);
> +               if (ret)
> +                       return ret;
>
> -               link->stream_name =3D link->name;
>                 link++;
>         }
>
> --
> 2.53.0
>
> ------------------------------->cut<--------------------------------
>
>
> >  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 47 +++++++++++---=
--------
> >  1 file changed, 24 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/=
arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > index e99d2a56dc28..3efd80f36c6c 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > @@ -117,6 +117,30 @@ sound {
> >                               "IN2_HPHR", "HPHR_OUT",
> >                               "AMIC2", "MIC BIAS2";
> >
> > +             mm1-dai-link {
> > +                     link-name =3D "MultiMedia1";
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA1>;
> > +                     };
> > +             };
> > +
> > +             mm2-dai-link {
> > +                     link-name =3D "MultiMedia2";
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA2>;
> > +                     };
> > +             };
> > +
> > +             mm3-dai-link {
> > +                     link-name =3D "MultiMedia3";
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA3>;
> > +                     };
> > +             };
> > +
> >               ear-playback-dai-link {
> >                       link-name =3D "Ear Out Playback";
> >
> > @@ -181,29 +205,6 @@ platform {
> >                       };
> >               };
> >
> > -             mm1-dai-link {
> > -                     link-name =3D "MultiMedia1";
> > -
> > -                     cpu {
> > -                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA1>;
> > -                     };
> > -             };
> > -
> > -             mm2-dai-link {
> > -                     link-name =3D "MultiMedia2";
> > -
> > -                     cpu {
> > -                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA2>;
> > -                     };
> > -             };
> > -
> > -             mm3-dai-link {
> > -                     link-name =3D "MultiMedia3";
> > -
> > -                     cpu {
> > -                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA3>;
> > -                     };
> > -             };
> >       };
> >
> >       vreg_anx_30: regulator-anx-30 {
> >
> > ---
> > base-commit: eac8f0411262ea7d156407da4baf260291cbfe32
> > change-id: 20261114-imola-sound-link-order-15de4692e7ef
> >
> > Best regards,
>
