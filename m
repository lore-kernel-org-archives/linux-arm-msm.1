Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866437;
	b=de+Q7DG1ZLFc33lEoXylx3gyxQbWu17zswiNZ/VP0Ne41/wB32DFpXExvADqn27Fh9G9
	 +u1eBzc7YJEscuHN4U4IVi/wRruZ91khruvLvs11aF91LJ7TLz73qiPbiWZ8mlvgdihJy
	 Ki4Pak66BHpF51Ho7gsEYgA1UdVHtjZd9kUFqHW4BRk0zfm8jnoWdAXz9oRMlsbp76xFp
	 Prg1JH/Fs5kBe4IIKITKIFycUX6HEjNnSdvdBPX5GXwycyXoNsR8xcQYLWlbceBsHqGcN
	 IzyIT9umrtsgPsjc7C965qQlUPv7/CqsJUppsEITEFNQpU8Kc3f4drSkVVYxSAzMUXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866437;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=92R01FMCRyJRd7lrWUUeliuFDksWX3spjItrLc/CiMU=;
	b=uFljOHxb/qURkuVS2C6MC/zFQILhFGL0KlPolXJGV+jTc7SJhQon/VOOB/3+FATSDvaa
	 L/kjReQaJFMkPKWzjg84/WhMuWbl2LXwzqd1RglxUhPoQfYykkh38fu3BuwYHblpt2HNu
	 eHMbpf++ttylX4vsGg4AVv7HT5N/SWWpKSq+D30W0HvQkGG94Vm5ZUJx/D8u76Gfg4869
	 /kJlZMf8xp7/R8AJZsk1dbLuTfum6sIHlLr3AQmm/fI7ZDo4QalpDs7JBBzsv2vRhMORL
	 KBNuDR01uQrwnZCLHYdkXdWe2wwJJam2YjrBj6WKpdPUY76Y/t+6WcGHNJ53pz0t+jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zsj4yhUx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NCiP47kF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DCF606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29DCF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zsj4yhUx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NCiP47kF
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UGjV4179296
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	92R01FMCRyJRd7lrWUUeliuFDksWX3spjItrLc/CiMU=; b=Zsj4yhUx3fB/7g43
	z5tJ9j1Dzf287bjQpuykmLSzBhhTUd+JO/SkwgbnukQ0jnwK39P5Cal5up5XDRDN
	VDyGL/IW+17MiJvu5RzUND4cEPuMDaXcPjYBhFFz/dx0bpWY3p8rkPFpb7u6WvyE
	Yf0DrV5WcabBL2O783wpDsKfdY1JFhxbjc+4KhHbCg91ihfQlHP6heqbekB9Sewm
	bdWTk6yUAkKDqV2MuX7rbYZPTSFrZH7qBOn3IVjRtu/12/wCzDP05E1rehyogCGt
	7D6N/6Li8wzFjbEcNOnBjQ6+VSgvntwg+UJC5UEy2FTO2H+pmbvBbR3Utv9lCo7E
	d/+qlw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn4kj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:13:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c4d46037eso2341766d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866434; x=1794471234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92R01FMCRyJRd7lrWUUeliuFDksWX3spjItrLc/CiMU=;
        b=NCiP47kFHd2kcmF2wOTQ0+GW5EXh542X7cgv3tKjvJNmfj+tgqdfhlVUq9VOI5pMZH
         j5mTXh6P6nNA6LgOWMht7icM+pp+5A6cXBCBfCQfiAxqikGPI+k/tPK9gN3TxNBZWOwI
         m1s8uEb1bDWiD1LoZIqdOxLS27T9iUVZKrNwMTKg/Gp5hlqe6OkeiVkpojotp9WL5Pfd
         KiEeDpR2t9rn7rj3UwEPhm6evOKE0WRgJWNhA0Fi9DoTywbKUkoVtiUJnD4lCBplpEeq
         o7vKpEX0ZPyPZVNTUKoy5GkPrHgYMu/u5I1Zkr/RaTcYm+Gif+ELC3C03bLof6GeinqU
         W0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866434; x=1794471234;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92R01FMCRyJRd7lrWUUeliuFDksWX3spjItrLc/CiMU=;
        b=cHqPgoPO2KvS2xNZei9hX/P+fPu/vZ0ot7S4/gwbI5AWf9mSwgkbFS39mk4as/nxfE
         qPaP9Ixulwb9555i3ogpW6iIRAsoZcPGN8ExwNT+8MOkMmFUz1QZsqd9x9add8cEFbp9
         qNR8DQaLYq2G5FA9Bb1va2lrrHp9KvdTEFvG9oNppK8gtIwj0Tq7YPnTShNNW2CCBAkh
         B2RLrjryKG7erALhhDXQGktpvlEQLngkb3HAH6PSEbEByAhPqH0GbVriwTbBtlVeEjXG
         l/qBeVBfLZpJEhNcR5I0uU4C3+O/5zO4Ox/ye5VzemMqbLZ8eaRz29DzySBByvD8Kr6M
         sL6w==
X-Forwarded-Encrypted: i=1; AKwUvBxsrCXbxxBF4jUaKRKMwPt3HUBrTpMPeUjIBH/V0e9ARy08JNxrXh8ju79DCr/wFqIxWs/OZ8y2VHswGhSs@vger.kernel.org
X-Gm-Message-State: APuU4Z8F1v6zJtsVq6SDA6vRBHysY4J/rfutHb10PPpLmvLHYkNwB40v
	C+Mh3lnUTp/O0mX73xmnuY8llUqpVijq5o0JLcxI+wBM9BMDaZvg4Me1GK2LjYYNVOFVY8+Iui8
	2CbjVrzykWXSImSyShcq7EHDVMYfH9n+0rixsyQiysXjQTY5DhLm4FowhP+Wq1VYLmFLE
X-Gm-Gg: AYBFou1f45K+0iggthKEFB15iiFulLf4CJFAGH0IN/JSJUhlF1e4vd9V8Jdbt91u1Sp
	ARkV55nPcCj5xAR/kHXDc+rW6OCYDWHRqdepfiwH8ELHV6iGKT0MzIueYrXY6cEFk0lj6i7iT2l
	rHMCV+VpBXes+qlgqrepH/X3zq14mYPRfQBQcrc8t7coZVWvjoQnCUCMGL5OKGKHUhfedR4TRi3
	yz8dg0fVhsPAYpB6If7/ksxXT+xPEfISL0l5vsysprkl0A20sQxpqwFMxq3NxNRvXlAJSvo8w17
	5HCnlhHcAXhEmAcdOJ1crV6pJ1MsSD8iGm+e7Cw/xOvhBEMxcZTH5jMr5CYIiaYBCmI4Y+wV6vP
	0MVyPWp4xiIWTD65WrP+s858K2RdOKaKeV9LfhVWsWF44ZJnqYdrswDW0S9823vKsSClD
X-Received: by 2002:a05:6214:1943:b0:914:4464:41c4 with SMTP id 6a1803df08f44-91ca4b23661mr390679696d6.4.1793866434363;
        Thu, 05 Nov 2026 00:13:54 -0800 (PST)
X-Received: by 2002:a05:6214:1943:b0:914:4464:41c4 with SMTP id 6a1803df08f44-91ca4b23661mr390679386d6.4.1793866433953;
        Thu, 05 Nov 2026 00:13:53 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e42479dsm150842066b.17.2026.11.05.00.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:13:52 -0800 (PST)
Message-ID: <50bb3200-3110-4739-8a15-173bdfb8c220@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:13:50 +0100
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
Subject: Re: [PATCH 4/6] backlight: qcom-wled: Manage teardown via devres and
 remove wled_remove()
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda
 <quic_kgunda@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261104183935.1214630-1-lee@kernel.org>
 <20261104183935.1214630-5-lee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104183935.1214630-5-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX9M7lwK6Kj2xR
 e84uRQ9mfQO4at9BpIZZadCzojVXzmE893FxzL/2WomzW7ZgaFtDKtNjB3ifkBI1dvdfiPPbxF1
 G6bhVGM+mjBfpAAfECRVA8KT5k+WTgRHxhR6L4n6l0tkB4SGEBkpnPqhR6JmpIcfcXhP3GlD0ql
 VVwc8l3/gBgeorDh6GlFGM5rpW9QtxAtySaTcCOkSG0CfJ365N572/+OyU9dbGcnr+o3LbnDA98
 fJ/snWgHuew9VkNjmD1XUHZCGrepC62hRg/jBCP/vNCszlvgKGv7MJaB6Y3XvW6xsE8Vn5KwqU1
 vxeaUc5+qxfLj9cQNxMdeDeh8JiIx4TIsWWAoI0sDC2uWjHwfvmmDleSCdXL8kDo1v/ypvc3qqE
 70Iudco49KyBvTXJ3R3rY7ZmE1XLv4J1UIvYQ1HdorQ4Q2NrZqFuTY7f6H/lVhQFLPAbWtwu6XR
 UBXai/CTGARtwTdTjwQ==
X-Proofpoint-GUID: pJatq-b-1bObHx7Fe1_dLm-1hstTyUZM
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aec3ac3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qHjM3Cc90Y4xjM8bFJQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX0k0ygptzKCWQ
 DB91wQchb9KDjrAClc8f7yemf4UykuH385EMpUmOw2Jit0vbt7cMABgmpYiNQCxSqusFAF8BHlc
 wPVdnl8ZqPxQJv3xXYyUzyMqwcmyweo=
X-Proofpoint-ORIG-GUID: pJatq-b-1bObHx7Fe1_dLm-1hstTyUZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 7:39 PM, Lee Jones wrote:
> wled_remove() currently runs before devres tears down the backlight
> device and threaded interrupts, resulting in two teardown bugs:
> 
> 1. mutex_destroy(&wled->lock) and cancel_delayed_work_sync(&wled->ovp_work)
>    execute while the backlight device registered via
>    devm_backlight_device_register() and the short interrupt requested
>    via devm_request_threaded_irq() are still active.  A concurrent sysfs
>    brightness update or short interrupt during unbind can acquire the
>    destroyed mutex and re-schedule wled->ovp_work before devres frees
>    the wled structure.
> 
> 2. disable_irq(wled->short_irq) and disable_irq(wled->ovp_irq) are
>    called unconditionally even when the optional "short" or "ovp"
>    interrupts are absent from the Device Tree (-ENXIO) or unused (0 on
>    WLED3), passing invalid IRQ numbers to disable_irq(), despite both
>    interrupts already being managed by devm_request_threaded_irq().
> 
> Initialise wled->lock with devm_mutex_init() and remove wled_remove()
> so that devres tears down the backlight device, short interrupt,
> delayed work, OVP interrupt, mutex, and driver data in reverse
> registration order.
> 
> Fixes: feeab87b3072 ("backlight: qcom-wled: Add support for short circuit handling")
> Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> Closes: https://sashiko.dev/#/bug/linux-51cd5e35-3cae-4e4c-986b-7261263507cd
> Closes: https://sashiko.dev/#/bug/linux-44e5ed80-c35c-4786-8bf8-9ee955967d0b
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
