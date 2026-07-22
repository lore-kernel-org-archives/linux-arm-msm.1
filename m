Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44353B4E8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712431; cv=none; b=c9rqJb5RIFLkAenlQ1uurCEaqp+dxRvv+1Q3VKgcNKeIwYJ1Prhl9uNaZqSbf897diDFuZqM3cbKYOBhRPCzYTwEO0fZDVEA+QSOhHkoCY4K3pOLzq/J89l6SiH+hRRXECS3wokpjMQirC+IeA22i8+KLJw0PSf5yOUDi7jI3yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712431; c=relaxed/simple;
	bh=uW/Vj5fuJng1LvdLmMQs506xzm1+TVv9B57jQPoSfxg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GaUT0SPHwMT6VxFT+iHdtyY6PWAr/7rm0m7xw4Us062mqUE+LpGcTf29FXYd1j75Sl9TATaUV7wPLI718c0zqxewV7QP/j0eXjzGSgLHUOJPYiOPnF6HqSrYKwbdLB09aRRrCRNnS+xK8571oenR76UR/Qyre1/EjK2jhUAwhfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkooD7Zq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDMqjN8O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkooD7Zq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDMqjN8O"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x5tj1400181
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n0OFJwQjx85fwwK+gVcoig
	tUxSx5yPqwqgEn2qCbrtA=; b=bkooD7ZqL1qTUQtGyvlWyI0in4ekJagrO6CLyC
	ZR64B0fVD6Cx/UlzlCUxscxm/RoqeNzQEEk4rYVJ9TM8jXwWzvC7otyEwajgCRpH
	JVBOKy49kHrbpBziQnGl4QwIUjml0pCssuiO+ITjQCEmnTMkz7/nnKCOtQQd83aF
	9UYqMOfgTuFeWAeq2W592ePFAroUULM/rp7vrjHDQCUXOghOQFXdDWLew0N4e12z
	hMWWKvgF7euxSYqWHte+i1OjL1XAJQKKmIsYzyA1vWoBoN/smfxJhuCqD85/3VvA
	nkUb80MHKmo9GRdLlcUymrt4XSrsvDZ9+iJxoIKy46+MlDTQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr838uby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:27:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso4391291a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784712428; x=1785317228; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n0OFJwQjx85fwwK+gVcoigtUxSx5yPqwqgEn2qCbrtA=;
        b=bDMqjN8OFOzF83QMPCgSdYN3dc1i0RWZ40vv33yIJhYkMHA6BnOJpCGZA3TNipw5po
         fUXEl0XLnX2f+XDyo1MrH6+RlZ0bgF2dIYPOuKnSshALbbT3vt478yJYbFppVZLSWLlX
         xmgzorDyLvpuhJjE/SJw2lrQJhuloTrkq8RHrvx202Kkk+aBpu9QmhrwnvSJ72CB5EMJ
         c4MO+QfnqQf+9ZsvXtpvgCXf0MTIgILxoVIGBWaGmvSxu9jO2/hkIZMnyGbcbrNJVXVV
         HCxA5zEZgk5qFNeDooVK1MI2mv8pOOkRmCO6utGMAjLP94IzPaeio1ajjuCopbflvfSY
         DPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712428; x=1785317228;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n0OFJwQjx85fwwK+gVcoigtUxSx5yPqwqgEn2qCbrtA=;
        b=Uj63dbAAZWlTXDItObTtXJocR9wospPq0i3QLgv9w/UrAMt5MufgQ3XJDKMK6bA44d
         044j6TXQ8/RWDQKz5SIIk748/kRJ+11/uSloaQfMSewj0XvRVLjS6Osplj9MSTAmm3jt
         eYWRJ056lwEIoa3arSQwJ8/3rsfhdo7EylpWaBdedtZyG6BlAwWbrYq7sFDUCv3uZ7qI
         J5aNPHePwZKh0C8OAMSxK28JdsJsTP1P+fWzTsBzbr4q3pwi/t5EXAdxT5F5G27YNFEX
         qU2ci+oVC9MelWThNTYhNnkdIucCMaVL9kDhpvlgP82RbOi+eNf461FlOTH2aaIVLTc1
         0YrQ==
X-Gm-Message-State: AOJu0YzmbFZFCpvks35uEfRywIAHDB3+gUtnopWDHg3IqfO+G0Z5Wbof
	H9ZEKg28uTbPFz1JNXcZwekVNxAS/JWIW0AmByPikKNfuI4foowCHX1dE/2bNS2wgipyKj0ewi5
	xtWDMcqTNZGqHYQXGIkKhW3KMv82sb4ZFCiGTC2P+Kxsakv22cwICwoJs5TdfPxKO3r6G
X-Gm-Gg: AR+sD13aRlvrJUrm69i3hNULSqe2gQAS5af1LOG+UaaT7foIG6DypiwckJPc7A6iIou
	1zx+VQYiRvXMOkfmb0R+G9U5pYMitKZho8JcmhkTWzCeEsEJpd2EByXybjxNJeXyGeetUobaarc
	rvqeqptpfdwJtth0EP1bty2IMuhP3fr9nuAHnDiPv721ypnmBOJ2N2sXu0vocHffehOF7VUYrmy
	71RDB42ZEKaiuOCWVg5WcCCBLVwrKNxsDXoiHyVeIwf7MrejUI+itdiGihSzKRdpkKttzi++Kc9
	6wjcOBBgl56NooTMS9tIw4lrLR6Fjgtrxj9TWWOokkcW0sYlm4zAn67kA1FkrLKcEg/vVbA/6NA
	eCyKxhwhjebw6wA8zqJ2JzNkBDAFKyJMR9yZMs7DGW63Do7VPl0FygyMIcQ86e+/EU0tpARJ+Dg
	==
X-Received: by 2002:a05:6a20:c78e:b0:39c:4e62:b843 with SMTP id adf61e73a8af0-3c4292dfacamr3611015637.10.1784712428214;
        Wed, 22 Jul 2026 02:27:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:c78e:b0:39c:4e62:b843 with SMTP id adf61e73a8af0-3c4292dfacamr3610985637.10.1784712427768;
        Wed, 22 Jul 2026 02:27:07 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f18f08asm850677a12.21.2026.07.22.02.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:27:07 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable ICE for UFS on Hamoa IoT EVK
Date: Wed, 22 Jul 2026 17:26:27 +0800
Message-Id: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMaMYGoC/0WP3YrCMBSEX6XkeiP5a2J75XssIic/3YZVo0kMK
 9J3N03BvTkww/CdmRdKLnqX0Ni9UHTFJx+uVbCvDpkZrj8Oe1s1YoRJoqjA1pUcwhn3ZOADIWB
 6Cqimb9FN/q+Rvo+bju7+qMC8mf+8im80QrEWOM3+N8LJxOcth1MLJYcnZqXt9USE7sci1g8aq
 m/C5eLz2ImBS8YHYcEqO0lpmBJmLxUwRattKDHAtN6jtcvsUw7x2UYW2spsDRj97CkUEwzWSc7
 BGC3oIaS0uz/gvL7c1YOOy7K8ASPSYY4xAQAA
X-Change-ID: 20260714-devtool-5093900ac51a
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>, kernel@quicinc.com
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: _OwPRo-IIsWvP1SPwd_iQWFOLGYSlBt_
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a608cec cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M4l5zgTsi59Zh--6b5wA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: _OwPRo-IIsWvP1SPwd_iQWFOLGYSlBt_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX6JUruF3v9qeq
 4AxV9D7pjYwRHWfOwpjuIFVARPSlixf5VNGiB9IWombBLjY7YpbjD+iB8SUDOXg35o2O7gC3enl
 e/9pk2Yz+z2uSdlq+nFiShkFVR5Lqj7Wq83mplYaqwlPBq9SmMqkdFBIZ4hi+Le+eiguS4MgCOn
 +jbnYpd6CGYLQPVdVYrAwYlQmntOd5wjb2gFswIsuMfL8X3BLSZG4K5+dlROfJ8hBvDSSg9LBsM
 ON71UCJz9yYVDxA21WQzNmW11zRMeLiyOM4S5Zu2FDL87TNMwGnkfZhwsJK2WLBOqBi5xmhlpuR
 CP5YaMBaW0bPMc5Sxgkv91MhfUuo+hkHnUfUiL+q4kOakLeU8Anf0fJuC7oHxnj2OmyrZj8E/ok
 XkIY1A2ME7nwJr5egiJ+orRFY3hTREYVBy+M++KB2BwzE7jtn0Zko418kb/nIOBMyNGRks5rSU3
 Lqx+zh4gOCLzJ8uJkfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX7Hvmc5gQDykF
 41XcwljAShATdBvUhRfsYpz2LNZHrBCl7OYWc59nOhYtAskakIMORKaK5+2WLv9u0WJcHMzmXdc
 ejdPu8cuu2DJqqaaAzB1D5HwCi30pNs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220088

This series enables the Inline Crypto Engine (ICE) hardware for UFS
storage on the Qualcomm X1E80100 (Hamoa IoT EVK) platform.

The ICE hardware provides AES-256-XTS inline encryption/decryption for
UFS storage, offloading cryptographic operations from the CPU. The
hardware version on this platform is ICE v4.0.1 with HWKM v2 support.

Validation:
- Probe successfully
- Standard key work well

Patch 1 adds the new compatible string to the DT binding documentation.
Patch 2 adds the ICE device node to the Hamoa DTSI.

Note: The allOf conditional block enforcement for power-domains and
clock-names is handled by the prerequisite series.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
Changes in v2:
- Improve commit messages for both patches.
- Link to v1: https://lore.kernel.org/r/20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com

---
Wenjia Zhang (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Add x1e80100 support
      arm64: dts: qcom: hamoa: Add ICE node for UFS inline encryption

 .../bindings/crypto/qcom,inline-crypto-engine.yaml          |  1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                         | 13 +++++++++++++
 2 files changed, 14 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-devtool-5093900ac51a
prerequisite-change-id: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5:v4
prerequisite-patch-id: d5bc84db11dfa16371755109d32bafa6325a7706
prerequisite-patch-id: f653bca04deb0f4fe7d51b3064644c8e6b0d9c99
prerequisite-patch-id: 615f80abf57c155bbc190c1a70fe615a783755cf
prerequisite-patch-id: 59d8102674ce98be1a0e9b4d7939ffd8a7289ab1
prerequisite-patch-id: 691ec3b8a386d2c5b991a4311236f7f06adfc5b1
prerequisite-patch-id: 5b949e801e9bf4b5593a1f7cb8f02709eb3e869a

Best regards,
-- 
Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

