Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009087;
	b=XPToOhvsR/i39zUO/7rpR6eJPSaH6ESpmrCmHYhn0FFsNgSaJbQM7gD2TP1xr/Ibfe2A
	 34eLF5oRq6qaluP6gsEwboU1EQZJWVwzGoIHy4u+voKGrcIz3pA6fD4I5fgMpLPznuVP1
	 GWJnRdQCw9i69fEz6I2kpA2V9E4C/W5VevIMca7KBR+IFG2KzK/gAyayVi1ELRQiES94C
	 hl8sLBSo+CYbUlII/JgVpm8s88NtnfgxD9US3YtlGZuCpVcgDmfe/Vf4ZVIn1G2rG3fiV
	 tpvtWeNZaWgp0ZBueLYomoElqAYis2bBZNTgGCANNcLB0ROwOn6eQ8sJg7ZdP0hD+ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=;
	b=FYTZdIwkqI6SRiltuYh5VC9Q83sVH8oUbDCr1wb/8H6yI0T1i/78Zx/Koj7+pBnhzET0
	 WXU/BoWmaVX0AboHDezbX5xuqNvS3GAJuClPYMe24RC0+vIC7Ojb//YOJXk3QMaiZq2o3
	 t1qJhVuIyWvBy+IranuPH2wguvoVuATdCuPMLyBtnxb1N/1MjfNgjArO5vMaKEqlJ0nD8
	 8bL57GMmQUNx2sZdsAUczf246aqluDtubzE25jIclC0pHcuPhvXyH2TNyqk6znpp1Lgy8
	 KbBa0ruTDGXNQkVdGhdr7Y2g5wMFdrxDXhIZ3XWfHsKjxUQCLmAwGVH4R6zlkWQ8KIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iqZ6TJKC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HnMhp/bj";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698460A2600
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6698460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iqZ6TJKC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HnMhp/bj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDUbGk3455958
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=; b=iqZ6TJKCTh/qnM18
	RwwQDjB6rYObtNJUCtw9348pqp/uqSsR0nkkGv6w8sFgRks2fbvBYcQnOtsTGRC+
	je0Nk7LJvGKH/xOxI5faov/jsvUAeEbT3j8vKjDeWczQpqpgUYeGLvjd79+jsLsj
	El3zmIlfOQq5MPhAshKYi8wxanyvv+HDeskrfB9mGC5ZMew4PQRnjaEvt1o0ZINb
	TQIpg6HFXU9J7ayZzU4dQxoX03TGTyNtrOQQuEttmDnu2gEPds+KND6i3+l5ZoMY
	lpIYxVuIh/Hfb+S/hkAgh2F9Ww0iAxEt0qf16EIIBEvpGqG5ofALL3+6zsQzHy7e
	NurNIQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8k7v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:38:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2d60a8bf5so173649137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 05:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795009084; x=1795613884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=;
        b=HnMhp/bj9cI/N4CzPfB3jHwnwII9o7YZGAT7hb1Oik8Rmqeqi4CDmJBf7whFmsza8z
         odKincnWYjp4zUwl5oyCYMvwnpXIRzqtWiuh6x2oE88MBN+rhKjYu2Z/DcQaS45pDHt3
         78rCee2vt3bctmo/OA1fj2Huf9b3KG3PZVfRl+wKRGPM9rdYT24R3Gw3wg3bB0jwgiAC
         pgnUCYxlERhH/Z2NLeq+3LPj2UCj8rIpAw+Zfki4f3ekWPf/MY1ahOJTwVB0uRUrL+Se
         JJn/rnQkmkSz5MAE3EjQpMcXcCl6+jIZIul1aV5ngCMut9J70JfnbANi+9BmIAivgK7o
         DtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009084; x=1795613884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=;
        b=YwY12ELFUVZbZqBcO4Y8bBF5jMgl+RLOoYvXFc+F3tP6THJWAHLfUohPkVurBSjTYt
         CuvQHILzBDA0GqrYNRHCq1rmrJDFijx61SUWhZSiboCjddz4RwNjlwQCy1IbJ2eI04p2
         1m5mmRtedY2Up5Whf46piVW4QrIHAtG1oLXC+kMUfFqIiV6imctDXe7WQm8+R4A9QQYj
         LiVw5T2n5jiS5GNVK42uBpuUGKgBuQUaABiklYKIO2BmhboOSMb/VTVt6JqsGnGtZSbo
         6/gCkN5ie0RoXOAnTHdt8jvvc4OL9319YR+usMh/kpXbO/GUmFVTchiAhXthu2Wg5UoV
         rkBA==
X-Forwarded-Encrypted: i=1; AL+hErHU2C0BL9MKC/GIzlRInL5QufHhvF/+tEf6dOd2BU+/7DtfSvAE2C41Z8UDVxSdbE+RiTtRVDj3rqvKHiS8@vger.kernel.org
X-Gm-Message-State: APuU4Z9v4FLzlfgcQUuNqMKIh9PGPE0yJQc3WxiHPlklhF24bUB9Se3W
	JUDnjt3SA1jjINZwrt0M6JRsfqtTQQ4oOsjdL9GZv/Zc5i0PxwULsz0b4Y9ZaQy1ajn1UY794fS
	NGGIKkyJZ+GbLRC6A/s6vMFXWB6PIwNA0mUxgLSt3YdUn5x0vIp7QS7SRMCdH11U2hEjk
X-Gm-Gg: AYBFou2zbWHXQ1N4fiR+J2XdiFsBFF/RhaptbiBbqyN74KnJrRAAGH8dt6C7aMhpKY9
	25k03OP/2Z2oSY1oVFMs7ZeaMzmHS6hbmikU3laRDn0KEExB7TFdYkijfx5VLxBavsSjfOKe/Kg
	+Wle7sA3hJP9J+o4ZMgJ2FYFHBrn3vdxvulwjw0EGeN6oyY4suOHo5YLclCp4BFmqQdHwvBzoIn
	X/xWHP9KLsluknnPqixvofDS0rFi9a83t155XAuVUIyNWEsFBO4ahrU8rhEedAWwgQyncPh0h8J
	GjsEv9CiCyiuA1cG955/AgdTVXuTw5G4sZJe313VWYN4frymjC9Ew4Tf8LHbwxLsvHgyhCYgjYm
	avsNs5rAFYKWSIR/JUFwYUop3fUr4ufd+2by8AlY/u1Mze4pYlkkxgX1wdoKPDe/cjmT7MiMsED
	R+N2I=
X-Received: by 2002:a67:e7c6:0:b0:7b3:6079:1900 with SMTP id ada2fe7eead31-7d6ba4af66fmr748734137.37.1795009084293;
        Wed, 18 Nov 2026 05:38:04 -0800 (PST)
X-Received: by 2002:a67:e7c6:0:b0:7b3:6079:1900 with SMTP id ada2fe7eead31-7d6ba4af66fmr748716137.37.1795009083820;
        Wed, 18 Nov 2026 05:38:03 -0800 (PST)
Received: from hyd-e160-a52-3.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a1b61eesm1809090241.3.2026.11.18.05.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:38:03 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:07:31 +0530
Subject: [PATCH v2 2/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on
 system sleep
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-lpass-lpi-system-sleep-v2-2-a6ec7f2ba424@oss.qualcomm.com>
References: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
In-Reply-To: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795009070; l=1591;
 i=gopi.kanala@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=lDn5poKt3ysTuETVGTT4YGl451c5NuKPmmjtEKR/+IM=;
 b=Q0JHIHwGWcVQxFXb8JpOXQ+BpXkPF4Sz0hk3T73DkXD3wVl9a/QtNd6Zo7xdsaxshoA9zq9Az
 sKRiZbvYzBADA5EomgMLnr4M4SRyhJXB6+cTM8ValrtU5GSYxP7m1AY
X-Developer-Key: i=gopi.kanala@oss.qualcomm.com; a=ed25519;
 pk=4bCmbkbT6dfZt13k29qAL6yx8zUQ6p+yOdkRBH8lzXQ=
X-Proofpoint-GUID: UBz4j10qXVArNpgC-noasmAluwfJna6v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfX8UGlp7fI9P1f
 WKJYOmHamlqWdFVzF4UfIpLsCpRMzT+hm7neXlL8O6Hqu9lKCrNXfTJW5i1vBZFzx6FoXWTvXyz
 IWlSbyVJI7RgVsFRCERDBL8MxmgPniU=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afdaa3d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JB7U5Tp15nFzE9-rj4MA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfXw8EgMR/RawY8
 zj0tcWNjD6VQkyhO8IgmNoQhC+2zUpXJw6eByZklJ/V2cCxLFjqBOpQF4SGpJ6TlRMenm6fXIR4
 w33y+IXetskP4F+PrE4+icM08CeZvedI8RvYQCuAtt/NMmYzX8X2ASrJwizkWB7eWczaoVQecgi
 eTh8Szgu90s7jWx0xOEaoZ8e3Y85NI0MCDtFbqQsQrqLF9f3uxr9pHRO5f/LvnyAIFjXZaMFy3U
 aO4qPqA0NExX3Cbb7xlt3f6vqBWG5WgKBfF7ORZUEmcIQwrjGW6BxBfzXCF2h8u1ylyGvGNRwKH
 Kzc1nznui9vAZr+a4J28pvcyjdFjfJ7A4mbGlLzZk31fPAP5m/PncR0Rb2QR7A5ppRVcrO584/b
 59lhKFJAV7O9cjXKzuhpKOkn2VSsy6Zy6xPUbh0Xktct0vnpCl3Q6jY9pO7pt8CDxNdWuEOBXf7
 T8/a5WTrWHWLe8bu04A==
X-Proofpoint-ORIG-GUID: UBz4j10qXVArNpgC-noasmAluwfJna6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180054

The LPASS LPI pin controllers vote for their LPASS clocks through pm_clk
and only implement runtime PM callbacks. Their consumers, such as the
SoundWire controllers, keep them runtime active through their device
links. If a consumer is active when system suspend starts, or is resumed
during it, the runtime PM usage count the PM core holds from the prepare
phase keeps the pin controller from runtime suspending, and its clock
votes are held for the whole suspend. On Glymur CRD this keeps CX and
DDR from collapsing in s2idle.

Use pm_runtime_force_suspend() and pm_runtime_force_resume() as the
system sleep callbacks in the common dev_pm_ops, so the clocks are
always released at system suspend for all the SoC-specific drivers.
Consumers are suspended before their suppliers, so the pin controller
goes down after them and comes back before them.

Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 1f1635ec53d7..f693e5101a7b 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -612,6 +612,7 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
 EXPORT_SYMBOL_GPL(lpi_pinctrl_remove);
 
 EXPORT_GPL_DEV_PM_OPS(lpi_pinctrl_pm_ops) = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
 };
 

-- 
2.43.0

