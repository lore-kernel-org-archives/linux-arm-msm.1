Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF864F68D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738308; cv=none; b=BLb4vlcitkveAdCqon/+AQxqeEeGL9QbOBYFiLDooyWnMEAcCG8DwXbxqFuL+z1KdKtR16/cMqi4Qg+iQZKwo4GgnPcBmuPcA4YfRefhhtGdr6CiSQmEVfMHIFlSfOT/xRA3WYiWsT9ubCs+0N9K4c0FGqtzfJg3jD3rg3ieVyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738308; c=relaxed/simple;
	bh=EcScv/7GHH+PudgDUjdWtnbAFUCvWvP6zT1tLcuF5Jc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mSYqUZtXfsP61+TBl//iij5AZ/vRrkHWhvMuM0yoqM9/jxIcEpbbz6NSKOGjoZru1A+TUVwzV3bopPQDbRLV81hRjwCJsDk1+u2BMmNt9JGMmSQFoQCBgUuWesgNPJB5W0Y3jHvYOsctfD+I3FENLjGdGEaJ0uU+Zj2P8nZ//vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGf1n3f5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMlf2lql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGf1n3f5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMlf2lql"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOmOL045882
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cxnrXJweREiUJN2MSzvDzr
	+es212bwopL66r97AycvE=; b=BGf1n3f5pZrKcCM3Mv5PlBs/OBmUAun0M9zlzm
	FRAjjo/KQi2wGXZ0CIN1k5ZVH2LldE/EBD0HRY7K/vHDBivPXA0Rv0az/apmIgkN
	jsRV8YS/jamDgXsqWCl9CTJW5NUJjc+V6RoZVhAy6wBYKR3fwUxvh5LNqI8cCeLN
	NwWm+yLJ+TRXY+Uvd1D58PdPd/iZCbyudpShBxjNHjs5yd0YoGOCMNMTlpLPDrTo
	WrSPJJZdtDBBtJItGCJprXXNtVeF2FcLvy2Dpigp2rgEwCagLFWgHnzn/uNruI3y
	8soZFym53vL3xarwTKudb8+ZzAYU0zzj8x4lZ4S/WnLMfXOw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5mbyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:31:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8663802b58fso978446b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789738302; x=1790343102; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cxnrXJweREiUJN2MSzvDzr+es212bwopL66r97AycvE=;
        b=RMlf2lqlGhu8MPIm9i+7eK4emhh32JmtIRmOaWn8787GVB9Eb0JVZ5A53d/vlHlZz7
         rm9ZMb1bni85aJVPQgik9QaNdcY1AFjohprwKDmtrTq+y0jY1R5WXV8oKLgk5PHyPe6B
         VuRdpbKbJMehx8PfwkezCCNEkPbsPchM+9mldM/LO8lF3puMwckzPRKPPRsfyUeT60oF
         wsoaRyADFZvgzMBHPk1iQMTwtJnzNyofZJcjv/F3874e8OmIPywuXWKtczrmvqKCq/LR
         EdmBe+Dow2+JVmNaJl3uzCBd8FhBB8aaqY26QXWQjDhLN4vfj2RA9RGHjY5xT15dc2JO
         XQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738302; x=1790343102;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cxnrXJweREiUJN2MSzvDzr+es212bwopL66r97AycvE=;
        b=PjKSMPgs2aThnwdW2tBJpOLqLbQ0mjJ6z6lEWb6sSjK6C0hTa1u7j7hJxFAytP3E+K
         8yB9isi+QOo2EkUQ+fmdSYFMQPplI4k1If5JooYhk4bKFwxGVugRNizQ/epuTR/VrMyv
         FKCKBYWD+kgsLZBN7/uyO+H+fxvwwmzS6odklSgQ4adDb9YuokgtBRsu71uTHQ7TDMlN
         lxLrKENc3FEhT/wRC+qu/Yg8SY0N5eUZo5rJGwta8mgn1VHep9UrFv+Mez9HNety4idM
         P2TAs0jzwyMVyeRwTbqiUAGL8bUhk/JmaQwPHHrN99enKYNM9vk+Bv/4GY5isZBpPtw0
         6q2g==
X-Gm-Message-State: AFuF++lPnYXy2QcG+6hDyNpsjaDZ17FFbffniDucx1E+nOoNtQoHZLzv
	AcYKjgOGQQDmaN4JlCGjmvMoyGWcBQbq8p0I3aJAzD4rb5JadsnDmesPFe/WC8mIJ2JXk98eQ+j
	L1GrKxfhQ1XuoRf/gjFrIgmD8UL03RubLQIP5pS3KUA33yVc37dcrocxGwCUKUGk8CKar
X-Gm-Gg: AYBFou2F+bgKNfL0nnSvgWINEeGw0DO9Ap4e22hmMgOIC8qfBKHTainSDT2Z1z2UQsd
	t63kC2TiNqVpZ8b0HXcp01ywPYL06nScyICscNY1D5J6/GwL7clS0XzfhZA4oHnqBfPsxMEsUhL
	10B8kBfxJXZ0YoSXTf8YRCfqZBKL+iGHRh6tDSl6vLEH8fZagJYEZNCjtWi/uMkIetobiEztChR
	FYNqRzH5Z6LNv0TWPO163VWFRgZl8Kky9sx+bpbwoLVk8ohrpGQhUv2Wk1NOPsSSPxX8WmOIVpR
	Hsd4wzPN7vIlMQ7Qz7e3hbxmGCxeYxUdPifh2XB/+jE8fahmhDxBoAUfFQ4ZizMzsEVGPGPU8dc
	NPrVKp00VKfw9EALGu0XjmIabl37RzpR38Zg=
X-Received: by 2002:a05:6a00:a909:b0:874:705d:f644 with SMTP id d2e1a72fcca58-874de706acfmr4341735b3a.38.1789738302201;
        Fri, 18 Sep 2026 06:31:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:a909:b0:874:705d:f644 with SMTP id d2e1a72fcca58-874de706acfmr4341664b3a.38.1789738301659;
        Fri, 18 Sep 2026 06:31:41 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8f8b00sm834747b3a.20.2026.09.18.06.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:31:41 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH 0/3] ASoC: qcom: Add QAIF AIF MI2S and TDM DAI support
Date: Fri, 18 Sep 2026 19:01:11 +0530
Message-Id: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACA9rWoC/yWMQQrCMBQFr1Le2kBSg7ZeRUqIyY9+F23Mb4tQe
 nejLmdgZoNQYRJcmg2FVhaexgrm0CA8/HgnxbEyWt2edG869fKcXPTsODpZcp7KrHTqz8ba0B3
 Jopa5UOL373rFajD8nSy3J4X5u8O+fwDl4zA4ewAAAA==
X-Change-ID: 20260918-qaif_dai_id_support-0f97144c83e4
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789738297; l=1242;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=EcScv/7GHH+PudgDUjdWtnbAFUCvWvP6zT1tLcuF5Jc=;
 b=GeTw2uERLVv9847hn+WQvTCMfaMomffeXpMKpbai+/1YAzAVM2lalTBL907PQRu4Pp1K3GcrD
 wL6c+w0Y2zyDfohlcm1+LMNdCGZybz5qEw1sOTdUGO/T7+dNDAtLaZz
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfX9lzXNQPh+kR3
 T/WEfdIhxBY914hJ8M0vrqqrWjru/JkHzY7MyMBnZpJkOd96DRHUehiL8F0+CTJpr3VpNjBTcMS
 XIa7OHwkAjC2p2MGV7KJySvsKlyzqZXrboir1sm74npaIEqEggaQEvHHjdCLZYvQqucuzQgS8HY
 8BtiV/BDtRTkjFJDwDTcxU0KIVbGUMPhNceoQP/H8r2bUsOcLUPddZLoogAYUvb+8POtAkMsNOO
 2xpv4CB/kkuoduDs3MYHNXDafFmKpwGSVe5p4Aw3vDn9VRX90eHSxUDB6CxDl5ZaCN8E2o6P5Xi
 H+9HfRSPWpXKpBY3GAJCRsLHhIwnrZoaXxfyjoiC86puPdDbmXwtxnDQqx+GGMZRSo4gituwtF2
 Z84842xztmE9DHnnZ3BKT4u4y8mH9WCddWN2BSrfoAG6mq/eN5dnR9EqhV51wUIYEMB79u5/roF
 Uq+3PmMT5blZU1FfFbQ==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad3d3e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lDHNxqq9c2JpMXR4PYYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: agTxrP4kgBNc0REwTLJxLDGLwW2Y5XKQ
X-Proofpoint-GUID: agTxrP4kgBNc0REwTLJxLDGLwW2Y5XKQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfXyDzRWiIqfdBQ
 QNFRVNa0cpwPZorloZIg62DAYCWlwi61MRzNmORO61rC7BHfyl2hABmAhsqvwSLqn7EOPaxn92J
 oMluDk9QPS2oKImXNJm86Sk73wNscHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180191

Add support for Qualcomm Audio Interface (QAIF) AIF MI2S and TDM DAI
id's across the Qualcomm audio stack.

The new DAI IDs are required for platforms such as Shikra, Hawi, and Nord,
where QAIF audio interfaces are used to connect external audio devices.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

---
Mohammad Rafi Shaik (3):
      ASoC: dt-bindings: qcom: add QAIF AIF MI2S and TDM dai ids
      ASoC: qcom: qdsp6: lpass-ports: add support for QAIF AIF MI2S and TDM dais
      ASoC: qcom: sc8280xp: Handle AIF MI2S and TDM interfaces

 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     | 16 +++++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 52 +++++++++++++++++++++
 sound/soc/qcom/common.h                            |  2 +-
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |  2 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c           | 54 ++++++++++++++++++++++
 sound/soc/qcom/sc8280xp.c                          |  2 +
 6 files changed, 123 insertions(+), 5 deletions(-)
---
base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
change-id: 20260918-qaif_dai_id_support-0f97144c83e4

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

