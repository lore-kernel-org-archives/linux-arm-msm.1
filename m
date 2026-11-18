Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009077;
	b=gTUhxi7dXAsxVqCv9Jj/zETvusicfx1nnjCQgm/r53c8moZLuPK/nBK1byGmWs2C1ytN
	 bRDdXJDn8VdhQzCTgXl1fHTCgOh5FwKgfupnJ4WDSM5abOL1T56DtaVkDdDibSRAg814u
	 vF/fePKz47xJN7ctbjXNyUBNJNOd1ZqMgcnbWk2XMOIzDJHSbASbNH/H2ksxAInzFaFAH
	 pYI6kZLmQDzeUtE4h6ShxJ9ZNon2I62RNpx5jtOhd9hPUa5rEQgJ2ae94OvtJoNXxQzhg
	 RSOoEayrt14D4RQlwLLyVGGiSSYW7BVLdM8ylsn+aSoG0/lIk5sZ9A0boGop02cW7cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fFhEs41KSZ4dfzyxb5QjYDd6/8oZJNiaCStnwzmcs3Y=;
	b=H5Fl748s9fjphuVIPJZeZRJG2GI6mTpMmx/g7UDohOghxocyr9TGSnpNe1LpNNi72/Jv
	 glOaym2RaTxpWBrGH6QYLOA8m65QUnm4+sJRHp4lI7rEuT8srVvhOLHnKlb4IgIqYqAvh
	 /H+RpmgmLgIEjrM5vNn+pGS71B5mbaSU7q9SF0KSbsdUVdhbf/UD3eDtv+tbZnxvaMTgg
	 qdoqodUlAnkcVLg41UNboZcBoAoH8Q8Z+RidmL3ImR56CbybA9dYS7IF95LW+xQh828Jm
	 3uHJj2VcqXz/mVhJvEFS/PZUcz1OKjY8XzG3U5ZehmqxATi6we6JPb9nOQVrVv30PuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QK703xtB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QinXnpXl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A33606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A33606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QK703xtB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QinXnpXl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQ3wd632693
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fFhEs41KSZ4dfzyxb5QjYD
	d6/8oZJNiaCStnwzmcs3Y=; b=QK703xtBzVmLuyertRufPhXhiZHv3M+NOwMMnC
	H3F683rz9NoD+rlOxQ2G92Ld4lioiTHFXCkLH1RCYthLSL0spIjGM4tNC90rR7D/
	uycQNn0e8vN5C2mhOyN3DEXxkD3YeMR/2XZPfhv4NPJfDAjjzX5Miu7gCHKkZeDc
	BRQusAb/SGu0Zy6pLsctAdokr0eSRis4b8OOfm6HwzajYuB7Sy2v1RKP+NLCx+mW
	xjMX1frRUsEwhprXWirllqSsDMBhqZVJy8TcsKZctn5s3RJdUNO+NOnrcN8iTczQ
	z5qla7DIsKqniO/0EdnhycLibZMNEVM80YqE0DlAz81pFvNw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8u5vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:37:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2cb77c7abso232517137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 05:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795009075; x=1795613875; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fFhEs41KSZ4dfzyxb5QjYDd6/8oZJNiaCStnwzmcs3Y=;
        b=QinXnpXljJc1jmJ3I39SgimlorHUvftNVcsFappnDVvWjeTAUTul5BHKHtzQpYdDFc
         3IjdwJre30wUj1zx5ZD+50U8vzgX3/opCmCpxkCrd7Ps5wzQ1vpiUNbPA8T95I1GWINq
         Pe0YZOxqrbT8snME6pdU6sp8I8eIC1U5lKsn6oqb81izwPeBKDAHfs63gexYLQa3uDcQ
         iRoFpelKNKMaSPtslg35E8agoOnqQesnFQsQQfq0+sp8NHnOTQZxx61SMM2kMJtgc/Is
         LiOSowdKRbBCdV+ZNML67QxuB99FSLiFra4VcvFCoSHnZyK/oXRCnrgnL8XEXIc1mQf2
         COzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009075; x=1795613875;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fFhEs41KSZ4dfzyxb5QjYDd6/8oZJNiaCStnwzmcs3Y=;
        b=hhAU1J3gV2KfebrSq+62XgOr7kD8gfTBYQdui/0sz8WuhAfaXSPpdpLjf6gWyAALqj
         W1doO0udiWvX8sQtTWS2gVfyTHGiOqnHEkX+458aBriiB06xkJg8VHyekLGwGKtb4IDk
         b0+A8zI1U3hGQJrIE+x5BpRSEjlbiylGxD+CmwGlwjmDLYsBf0EhrpRq4oSHAV9Wq1k3
         3qej7xumk7F8WbOuLaOq8aXuAsl5OWW6XI6b+tUwjB/RDOSaackSTaw8JhjTsbj8CO+U
         W0BLhZlotPV3sfvHnGLlWzPPnUWBb88zeoj/zGoOvS0KKdHGb6XaFun60lDSsNXJntC1
         pLPQ==
X-Forwarded-Encrypted: i=1; AL+hErHJIkPv9oWphJzFLo95rDT1fh8bpEWkcdzdT7Af9YwPmk7oJFmr1GPOrhLxRpmcZ2WngVHvLCpewldz7SBv@vger.kernel.org
X-Gm-Message-State: APuU4Z9NNndF+ncVBTtRq5jyQ8X95EqsgIoaC5BEz6RXwa4k0KtEDYqb
	iIZPAc1G5k5eHfoV8DN5Dv81n9yzQxL4fHXdJngzPIMlOJA8HeV4aK3X1llaEtpLbukMUd3A2wm
	G+w3zCNi4ojYYG78fERwR4O8dx/G0hMnk+jXQaeen/6fC7b59r84VY1yoVJcg16nlgHP1
X-Gm-Gg: AYBFou3ANDcMULYB0MHw9edqtsATUxq3Y4XQOifKKMkQMGx+Vctns+6RvtG/C/J21hb
	eIdql8lnyuYL0LobykJyE6DMQ5qxHFdX9szwvXFZKsDFfPZVyAK1g1g57P6L1FOzU1uKH7iiEDn
	D7+7liG+Oq+xKVEk4tFIz7elmorCP8xzlXZe8GVLp4m3AtRelloZntjpbQTNhdXN6YhdEhrYQSu
	rdrWe7ibbm7TJrKv+zkuH8Ir/O7XeLxW+mEtX6GRQj3DSDOldRcLLZZ7tRLTAzjfVv/7BY2jc1p
	62HKPxdObR2WbuWuVSz8QSeUffw/tJ5UAKt0DcH9+GrJjbOnEi7QezaHMov9F20e5GEYgIhZuM8
	SVlLXLZ0jy5PtrqAioIAzUgQPGay0ckBVVf3fU+K6jPXwV5ilSK+KA9J4Hpa2J7Ww45gJjJOoeR
	Ww6y0=
X-Received: by 2002:a05:6102:4189:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d6ba423a02mr642693137.19.1795009075371;
        Wed, 18 Nov 2026 05:37:55 -0800 (PST)
X-Received: by 2002:a05:6102:4189:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d6ba423a02mr642676137.19.1795009074724;
        Wed, 18 Nov 2026 05:37:54 -0800 (PST)
Received: from hyd-e160-a52-3.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a1b61eesm1809090241.3.2026.11.18.05.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:37:54 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on
 system sleep
Date: Wed, 18 Nov 2026 19:07:29 +0530
Message-Id: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABmq/WoC/4WNQQ6CMBBFr0Jm7RBaiFhX3sOwKGWUSYBiB4mE9
 O5WLuDmJ+8n//0dhAKTwDXbIdDKwn5KoE8ZuN5OT0LuEoMu9FkppXGYrUhKRtlkoRFlIJqxLlz
 VaV0a2xKk8RzowZ9DfG8S9yyLD9vxs6pf+1e5KlRYlRfXGlNTQebmRfLX2w7Oj2OeApoY4xdmS
 8JgwwAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795009070; l=2451;
 i=gopi.kanala@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=2lmXizyvul/e/Sma3pDMRM3BD6BbkGljnmal79jyzLM=;
 b=sBUfTNcOB7p5tkML481ltXLjh2wlew0tpP0oosaXXdXBszz01eysgOcy5TrSvqhXUiiTDUlJN
 BI2eHfV5XssBr66/mQg+7GotzPIXDql6byfjaPI6RXTQffVzZ9XIAyH
X-Developer-Key: i=gopi.kanala@oss.qualcomm.com; a=ed25519;
 pk=4bCmbkbT6dfZt13k29qAL6yx8zUQ6p+yOdkRBH8lzXQ=
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afdaa34 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D0rfVSSvHAGRCStx8_UA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: qWY8-fGakcgv4A1H1AiSpLAHuqSaFwir
X-Proofpoint-ORIG-GUID: qWY8-fGakcgv4A1H1AiSpLAHuqSaFwir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfX8A9mDbO7n7NM
 hEM9pZvDPBZi8zEWWRc5cGkfoMMjJ4zPwYyDgvk06xq0/C+e4pi4yUoFJIvfnO3px0Tzs7JwYww
 QeqShSHSOa50kfHZoB8eKdaqsKu5i2AAU063c4HZ8e9/b0rSTHAN/eQgRVwtQn10jTKHktbbt88
 hH8/Wldc8b7NATI+mTekvO2fZzy8gloVWFNGmkLIKQumPEJhJdLBsqybyQCkUbmxkW8jjdAfXMw
 J7gRGLtuD8wmmgOi4fCMtVMd+XIC1jTR+7xlra2ajV3QbQIr82LtKXJTEuUbXcwVhVIXv0Odwu8
 vq2ourJP7bcv/KO+9wSQjToHptU7JFfc+hhLVAJcq4+Oo+sxVAv548Tgz0uZsPca1jvVWhcvJ8u
 TUw7KibUJS9nerMaycTn1Y+YdY1AAe+Ypn5RcFJb5rP+U673nX7PQ9aDqYipdFvr46Ow8hDNamE
 rnKtu+ryO3caWa19/tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfX38kzqFz4+E16
 UfuEsGPtoHJd03ZiZHcZ0HfCWe0wPvTv1S2qAiGrE7rnBRNuBtXbx1ZTJ6Y5wzo4d/JJSFVS5rf
 9ZhNnalu7ewpIi70QeIVMbz1sE48vJU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180054

The LPASS LPI pin controllers only have runtime PM callbacks, so their
clock votes stay held across system suspend when a consumer, such as a
SoundWire controller, is active when suspend starts. On Glymur CRD this
keeps CX and DDR from collapsing in s2idle.

Patch 1 moves the dev_pm_ops, which are the same in every SoC-specific
driver, into the common driver. Patch 2 adds pm_runtime_force_suspend()
and pm_runtime_force_resume() as the system sleep callbacks there, so
the fix covers all the SoC-specific drivers.

Tested on Glymur CRD (pinctrl-sm8650-lpass-lpi) with next-20261113.
When s2idle is entered right after playback, the LPI clock votes are
now released during suspend and restored on resume. Playback works
after resume. The other SoC-specific drivers are compile-tested only.

---
Changes in v2:
- Move the dev_pm_ops into the common driver and apply the fix to all
  LPASS LPI drivers, not only sm8650 (Konrad, Bartosz)
- Link to v1: https://lore.kernel.org/r/20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com

---
Gopi Chandra Sekhar Reddy Kanala (2):
      pinctrl: qcom: lpass-lpi: Move dev_pm_ops to the common driver
      pinctrl: qcom: lpass-lpi: Force runtime suspend on system sleep

 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c     | 6 ------
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c          | 5 +++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h          | 3 +++
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 6 ------
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 6 ------
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 6 ------
 15 files changed, 8 insertions(+), 78 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261112-lpass-lpi-system-sleep-70c4d2239abe

Best regards,
-- 
Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>

