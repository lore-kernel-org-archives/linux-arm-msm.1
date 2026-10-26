Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015119;
	b=vKDa0hCUL26itYMbAifcETVmVTOWdn6eMBlBn7KjmOmIFNNDmM2edOX7tQAoPT09Fzlh
	 QwIpBkB6BZJ3h6NyXYTk7ZpoFfvPelwL48MWl0A13J4ogbTX5Yisb8P9YnGa2auKRbDqv
	 GfIertSijroskNwyWWsmDTAzWWfCa2Xnlm4DaMTTQ19dAlffvmn6xW/jBcJOH2husRDnB
	 oX1AGjCX+inqla0pzrgeYjR3FIry0/yH6UZ11zYSq9QeD/BqYBa2qYG5QYCN3bDXKJNq1
	 7G4smZzSH0ksESWxBFtVjHLRjOHc26czSR7Sa3yD4kesU/mwYKtnUE+EMrUQ9vqN/gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=;
	b=I5Sq4qkcRVm4AHyKo4ovgWZGOvFiCiWBwa+j/KHFK3k/KILTMdKOVk2Nv5Sf83ep53BL
	 Zqxh+z+jep4+BjIrlRJsHhNk2TfLAKd3YBmXwl6dyh8wAXEZFoziUaJJSpfVAdgIwlOFc
	 9Pb5qycuUFquLbtg7l87CF799OREEXbCBJpPDwF+JH0Km2uHYBLQrcLEVwr0ncJITJt4X
	 Y9tBJhnUmuGI09GfP4SHZOExwa/fdWfwLmIbL9aWmf+6dneTMdsY4rwQnlNz5gu920JnW
	 hHkbDHMCnpXreNkD80dI+4nA+m0MGb/4QS2fo5uaTxhRVFAvkAFrxtAJRHd1txuRMJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJzksRHG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8QmASv8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36FE606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJzksRHG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8QmASv8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtAMb3633294
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=; b=UJzksRHGl6NY9G+v
	URmNM5BrAMaivYBmNHNrUGNHDJr/Zhpo/nI8pnS5X/Ba1sdTWQZftUmB31MtL/lN
	49BVZ+M5UyAYYKjf48WbO0nouWJQYVaNU5hBTYEMhnbM9z/Ed9DcjwwLSsa4hXmS
	09/NNFVhO7JPiAkZW2V08V3FBYXhKYu5TWwmtSJbJByZ+kioieJOYo+IUUxJZI0G
	e6CX9v9GBiMHP/PMr71bSrQqNNg55T1DyZwTMwHyMrUtGKFMBbc6boiXfW0hhb8O
	N1uua5V4ukWvaJI1JtAMGGCtXFEcLY9sdzPP9RGAEsQgqfbg09Q+OdRfOi+rsDOw
	4ap89g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0bdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:45:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad98380ccfso4469028a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015117; x=1793619917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=;
        b=W8QmASv8/nIat6830N356sKMRo/dvufMJnSffYuBFHSaprmHLDifgYb7AfHF6cmlEJ
         cJq7lhtsc7YDna16dnXBJg+J4dEHLyn4k6V53f+e6JX2RsD/Mr9oIPXplw2w/A+ITPTY
         B8xUSYMVloA8Rt8ZOXPkQxj90SkyBxwY5GwNY5/MSoXt1zH+NACtJJhKqmW7w4TP8U6f
         uw8lzMiMFrvyisDonXtHy5MwB/T9+sM5K5/uk4UOoAUgoqh2NmwV5dvVoyCI0ZH1LUJD
         5T3foB0lR6N9imqPXR9cH16MsEmGU8+dmiTmuQybsRVbOfU3AI6YyH21w1wZSgM+9p6A
         XUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015117; x=1793619917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=;
        b=IbZCrEox4oZuo4AfT8GBGPiuubq9bvaQZ1DiXKYMsISZI/L0GPEoz/MUNeBRMTAw8X
         7kOnKrWIjRzbBuC2VywxiMfMNKzv0o9DnI7IS9AvCUdVG1TvuzSSldwhTBK5Eg7UxVvH
         fBpGP9JhyNLWoPFBO7vqIb3fpoVtumFd+YrqouIvdUB+HV6tgCjpSLpPPXQSR0WYJyxR
         xNSXK9HPfxBVEbQT7XbfXQldOMmbC9UgI8BlyEp685lGJ6Z8BxYU53skJ7niIWEBtA1v
         3sRN0luy5rhAKz2C5NbCR4Ornd7rA9UwRr3UiTkMzP4Ponp/M08jrWCyZttg3SEWJv6T
         0qeg==
X-Forwarded-Encrypted: i=1; AKwUvBzFUquILQaSclXtD6v0CWvwOn9jDwjlEvK8v7+vEOedmm8x7Iwt41DEj91yoTKIHGnkt6JjjSHocLW4Tf/K@vger.kernel.org
X-Gm-Message-State: AFq9FYLxcamYd3H9U3BLDquyYq+bXeEvQGIMjkMthxmWShQbqNSAQDpH
	o7XAvvcAteCt6i3UTZwKed2TF1X5odp1A4ejuRyWVN24vpeney46SRVC7tCAoo7xaet6MjWFzyg
	pY9XqjhjrRAh/SYOyI3HINslMSY1WBAVYbd0RSlA6E6SnFc3K+Nd5eowA5op+jvWUhcpp
X-Gm-Gg: AYBFou0DHTGywsI5g6o9gJ/oRXPCE+GBPp2/nvozvhnnfam+4T25Gt0m00VxanJRJwS
	6y/CiEsdlW2zY/0nAJM/Bev1HmVbGgDM0ECyLJDACq1ycOqt6W9ojqMyTxGvZxaOfg9gkRsWYkF
	5f0wGJVv9733QtJVZaBILtrmUGTBHvX65CKfMeR6ONqQtGzYzbo9vl43fmizjnS7LQpO+ah0z8P
	YuvVfkqccbRtCd+miLDaB9A98LmRiBJfCekM5bsGkJvfVK4ES2lMMTotdYEMv6AcONi5Cq33z32
	P2hCTxyrH3unaDY2yjJyLMgQerhpGi4CJWEecwmHSIzhHuOHguDITx6ilYGvZR8+7Y44Jk1wBem
	M5FOkUALj2lUZJLQURXqtchiOVmiDqPf5uBk=
X-Received: by 2002:a17:90b:52:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3adeae77a59mr5872037a91.49.1793015116654;
        Mon, 26 Oct 2026 04:45:16 -0700 (PDT)
X-Received: by 2002:a17:90b:52:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3adeae77a59mr5872010a91.49.1793015116248;
        Mon, 26 Oct 2026 04:45:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:45:15 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:35 +0530
Subject: [PATCH v4 v4 7/7] arm64: defconfig: Enable Qualcomm PM4125 and
 WSA885X drivers
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
Message-Id: <20261026-shikra_audio_dts-v4-v4-7-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=1168;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=nqBPRLNLSFYAEVxGi8/hLOLK/FfEgToPKt2RuBr7j1Y=;
 b=JtWPV30Kq7PmGOnW271CMvvGjpyCitOMLbtO9aPeEI8GOgYHypOnVKpsXNtDV7INB1Ne3el0w
 oQf86+0WcpMDKxWv4DvZms3H6/qgwaF0tTrbiP4zo4Cm0B92V1zt2r2
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfXy2cJjkbvd3uL
 cvaqKefpTXVbwCFSp9Eyt1KesnGhAqOdDIEGLd7ae2WHvPUYC6uDMWkZJDtLaDM3HnfqxXWCWye
 upX1yc2Mh94aXqHNo944HJKYf6zDsKI=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf3d4d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: VYinmS9L4V5XFv17rnB_ulkjVn9YfmpW
X-Proofpoint-ORIG-GUID: VYinmS9L4V5XFv17rnB_ulkjVn9YfmpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX8oUl7BcThLav
 HlXctK2YdmD6ZandPwKa8OhGw6bjczITil8GY4bJwvFX8LSmH4m7iRfVJeJgqecWRiefSdgc0ff
 6WA0iAJ7RUZ0qToedADxYvGrAABXPiVXNIDu9QzVEzk5mUDaKdRg17pQhvbrcYU9oMxu/ksT3Ve
 LulnL08nTjxRuzFCcF2hsR4+WsPgRVMRcn6gklELmAugf6YEjaK06xgJUEnLp+PMSSbGH7AWLBg
 8BzkT6g6XmbDNWxcrqBjxZ4mcv4VpH4cfJdcDYZIkJhXK4gmF6YTW96mb96H/HiK74cGPUtTWYA
 6GnJcxvXq750qcKs12FQc1jwgXgw58KQbUXp/oxj2uLYSNsRkQ2/IOwms/6KpELje75A/z4yb+W
 8qtVMD7Z9Qkss/7MvRrVvjVvoV8da/6MdP7pmDX0Ix2/fZ2nCZOOONsJ6CStJDirgNPqJAQfiu3
 thLxnCAYvfV+RC5zSUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260046

Qualcomm Shikra CQM and CQS EVK boards use the PM4125 audio codec for
headphone playback and capture, and the WSA8855 amplifier for speaker
playback. Enable both drivers as modules in arm64_defconfig so that
audio functionality is available on these boards with the default arm64
configuration.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..bfc3ec713ecd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1175,6 +1175,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1197,6 +1198,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_WSA885X=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m

-- 
2.34.1

