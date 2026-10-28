Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190929;
	b=TT+hQBFMJ1YpjDS241Fj9cHFHsC9Q+zIX8ZcL/PIbWPVF/NK0BkgNLLd8wWZkCtta+sK
	 fpsKwO9Dfpm/As7wJMlED0kHp3AA2YbheCPfzI26181AjsQfWCsOD0YuXDTf/T253BoAo
	 cpf0Emrw/8s49+rRzhed5UqteuYaW2VX4h64nOkzw9K1Ce7Av0NxS6FHvMc6JgkmSXr7l
	 xmeTSH3d8tK6G34oAI2baNvaJYAykD8RGR0WW6pdw/Bm4uvY3O8O7+XWaQcVSKGm6m7FV
	 PYpQmnT0W3S31UGTa5Nc5m6F5QT4euT+5T2ezLbrDBjyRH1Cu9gLOqUKTHEyD4D+wxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8dZBtwoDTbdVakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=;
	b=gXOk1yNGZZ04EZKOFy48EKSMq9Lzv0ywHKaLfSvfYtNBH35yuP5RoC+yY17vgapHbWSJ
	 SerZM8lcqN5jXz8ERVGy9zNfZL2ZIcUahmPpRPgaF/p1O/XYdf8XedjcXrz415g4WLNtT
	 K6YG8DO2fIBFERrhinsuuy8tFFuTuZMaULc1LcVYsXU4hcOn7PK2PEy3waa7y+8pi6Dd9
	 GmPCYMkJmlW0fg9rd4S3S/36jcbaR7/Ge/ZzOyrDCOOvJVunuFCrywBzY0yoNM/r8h/lw
	 +744AQEgdt3JDF4reA2zjaNsHNnpkQ8BJvUH/oU+9agjqbSjoHzREtSGj8gsey2xr2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/fwmexY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FMfzDT3S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28213606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28213606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/fwmexY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FMfzDT3S
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAks505515
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8dZBtwoDTbd
	VakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=; b=N/fwmexYAOajBjAkEkq/HeTf2tS
	wGfIct+N/AhRJ7bO1rNXIHGKx0xHm2ON4K597rGlmhAOJHvRcfatyhdB/U1tL5ab
	r2zkx2tnbCECd5xcR/1e9v3XK003peuZ/KamPED2cZ1cPnNTL+pcwXMIN/JKLqH7
	UVhUrvrB3YPo1dlOHYJHduOWY3tjM/lYaipCLEma5l4KaN/OtCtpYwQbkSYzZH46
	Rp6jBJyhk18+8P8jt0DKSD0onpMP16M72Y5Rjg5RIOUusYXidEiakVBqCrfjBiH7
	GJMLagFjQdlVm1iS2JgCajfnLOfE/yn4U+GrQywc4vz48FvWe1H+1u0iVBA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g4369-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3698bd5392cso717226eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190928; x=1793795728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dZBtwoDTbdVakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=;
        b=FMfzDT3SmbT660gnhD+pIZkahKlw4QYjtgc6H3a/y8H22xDqyLk4q8shWASbg69XSe
         DToJZBnve6+lEtFPBegmQpzxokYfphPQY+P9z8f9YTwMwTZKsTVthQItczicnX88nXef
         aC5Jq+DfrynzyJ66XvT4zceNUiFsMMvmlbb+mhZ8uy7kJ53Q/g2pi2CZ1uufaRRHfMJE
         4xXYgkdU5SO8fvOo4PQTnlKprT2qEZ7gXlOpcqVEoigNq/D+i2e9pff1OI90VMOVZPR7
         TCX7FXYBvG1W6hojyzw2rrNBjq96wMwuCxHQpN/cGyHgsDkE9DyoNaiimvygijbKwqKK
         UDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190928; x=1793795728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8dZBtwoDTbdVakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=;
        b=0EOpnVU4YZUCj0H5c5oliXyUpWPYQfytiHqoARU/bOxGoKVy8FcTsYN+dvVWnJoqEx
         iy8Tlh07Ce643Xhgf0kE4eiT3Nfn+4qFpf8M6wdkkiWkFHSSRpVRfmxHTMCzOv96Gskb
         QonG4BoqOCaNt4f77E0ijqpzwRkBJiaCD7WKA7Zpy398q7RDIG9B5+2SLCfCsKo/otBJ
         Q9kpSwvyO/DmZYfcFLbgN0f9eEwNXgYtpPvD5GzIjJ49n98y3KJOQQ6gg1Fq3e4keE+7
         BUo5ZwUWhlPfJbl7ZvVL/ClgtyDPp+NYX6IHfdBPy+WcWvIsxJpA8hXh5G2fY80h4eQp
         WFHg==
X-Forwarded-Encrypted: i=1; AKwUvBwrpcTSeVyHixvWZc3WuL+FwhXHj5Sc6amM3o7rYKxSL91IFdzTzzTRCFwnQWpPExT0Mebc8OKMrf0N4AbG@vger.kernel.org
X-Gm-Message-State: AFq9FYLrjGxaa5KZSY9eiSU2lAXxLavtIBAYMm4LWqcBkxcz4R4u7KDN
	blzEJsfPLGBzF4NwTxvJObXyfUD+9LIfLTh0AFLYCLeKs9U9J3dPyzOSB95qLrKfd+AllRPeYw1
	9tIEgG1TyEK9lcfq6/4dGVyUpY+5Nn0e/PCIMJkAcMMSsrimUqzDekshzetyzA51qxfA5
X-Gm-Gg: AYBFou0MvkIuODy2ur46Yt+Sgs62jxmTjzxDkBtFnoVadZiDwMfOk1rM1sFogM0kqhn
	IqPF1BdOJEYXtZTuawjKfQlO3yGCXQYYDi+DoMjheVrMAlE4jL5ZnkE0HZ1/8SymrVK0vJimqz/
	FcIubIWVVPRJud2DrasxjXIBS/7+CgCjf8H6mucdcEPUdkvLJYbxROqYmIMBG2MlvFZDblQ1JjW
	p7dH0U7O/CpY75IoiC98nsOK9fbwxHep6VLy+ipRtgAICgxQWVHruIHzs70UIbIwHWLpJaYug4V
	IrNNqh8yB0tKFXbBUhElKqdJxwQ/1uVSGY6tYmY4Yy3nPJUa5QP09o+j1ifIGOBz+ERFgNCW/5b
	bHFBHPQu/nHD4V+dljq8QlDq0nXtUTd9Vmci2UgFHznkArbJf1PyVFG0qgHddjODUdnVoxN+gVt
	JxrRAN65glRND8oL0nPSsN/jvof28XXHd1
X-Received: by 2002:a05:7300:f40c:b0:341:c383:9afb with SMTP id 5a478bee46e88-36a0f8a9ea6mr6840619eec.20.1793190927629;
        Wed, 28 Oct 2026 05:35:27 -0700 (PDT)
X-Received: by 2002:a05:7300:f40c:b0:341:c383:9afb with SMTP id 5a478bee46e88-36a0f8a9ea6mr6840593eec.20.1793190927094;
        Wed, 28 Oct 2026 05:35:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 4/4] gpio: shared-proxy: Drop the vote when switching to input
Date: Wed, 28 Oct 2026 20:34:48 +0800
Message-ID: <20261028123448.510401-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX6DeQKs8FduxO
 iiNXcw6eOvW6ECBCTp4D988iyjqaRU2GaxvdKWF5mLxnTYyX7FRTAuYJrHsAIsXHV5BrzON1fdP
 miuwchbT3xHLZIFrBwrCnWsN7AvS6y6GAHTwWSK3lCFxHQQI6Yxis8xWAs4YOxPSj1plkuhfqRX
 s/7utF8j4/cV14uw23duO0GKy/Fj2N54PSkWH3Zb/dlaff6A75hrHPFL0Lx/H3tQBRpUl0uSMjA
 Ndzud/zJ7HSDiIg4CcfeGdbRDcB/8/JQICoCSxshs2/OXi23HXP6OLyZaoVHaiWrZjGNhtzrI77
 /Jz2ejC5hCZTMkPYbx6YSU6UvVSTkpieLqLWSR0WmGyl/x/o1cGT7WenbZx0YPxNAPPjoYtUQlj
 x8su2oeSTod13zo1HdrdNFDeV0hb6INfb4sIcETMpaVmlcrplBcH4MqCZierLiu14GCZV96lvMm
 E3NMLcmWVJkjDT6OBlQ==
X-Proofpoint-GUID: c3CO7BBa6_3LuAM2Bs8ctkOBAZ6QTy5p
X-Proofpoint-ORIG-GUID: c3CO7BBa6_3LuAM2Bs8ctkOBAZ6QTy5p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX3GioSfLDVHE8
 Z3sGhq4BC7O1h5NvV4LIgV16TzIjrw5vnlBNswNMDH1srPkoYpuspiTZdGuhXDtjnjqAI4fPbZ6
 6E9FLsG1XqVpj+BFzpRG0Q/L9NjTt1g=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae1ec10 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ZGWLMo5Seu997gzVtjEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

A proxy that is the only one to have configured a shared line may
reinitialize it. When it sets the direction to output, the proxy
resets the vote tally, but when it sets the direction to input, it
leaves any vote it cast in place, although an input line carries no
value.

That vote outlives its meaning. When the consumer releases the line,
gpio_shared_proxy_free() tries to withdraw it by writing the default
value, which gpiolib refuses on an input line:

  Failed to unset the shared GPIO value on release: -1

This happens, for instance, when a consumer votes for a change with
gpiod_set_value() after setting the line to output and then switches
it to input.

Clear the vote when the proxy reinitializes the line as input, as
the output path already does. No other proxy can hold a vote at that
point: voting marks a proxy configured, and a proxy that frees the
line drops its vote.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 75d0d617941f..b2f2301e9e64 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -211,6 +211,9 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 		if (ret)
 			return ret;
 
+		/* An input carries no value, drop any vote this proxy cast */
+		shared_desc->votecnt = 0;
+		proxy->voted_change = false;
 		gpio_shared_proxy_mark_configured(proxy);
 
 		return 0;
-- 
2.43.0

