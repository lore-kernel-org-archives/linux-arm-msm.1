Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4091840F723
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717760; cv=none; b=kMCGX+dgy0h3twP0iJc0FHUF0LUMVndypSbrYDM9JQXkRExqKauoZpr7eyxDTO4qrqMBWKPhLFxpNKfFm2bfZrSMeiFaTuO8SFYrmgmYVY54COk0YfD/jcnALlS2zQu/9riIIeGRWWbz7tLw/wLRQiSOgKyczGSzzMjoH9jH0ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717760; c=relaxed/simple;
	bh=ngdTxAvXfG6ndCG3TfQS0CmbH+Nqn8eIjLuojkwWHGI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=st8f0ICVqF6zuqUoFLezqGGvrPv1QBozCwH28VJ5lUzsu+ogB4sQuQ+rP2nb5XvSGlvZowFsLFdpfFKJCCB03/orjfVGN56QgWKEiYD4fwTRrFJiC9XpboxdaFDS+KIFfMwcW2AVSs2VnAh7TAa2ZirUKvyZwZ4mMmbHdev7ohE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl79R6ft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLJv9lbG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl79R6ft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLJv9lbG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x72m383770
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yc5dIbEuM+PGY2hwvnsliH
	cBpFlRH+vWpInuyqh/tSw=; b=Zl79R6ftBfX0Q1m8/Z/4Bkw4R/sEm/Z1I8E831
	7huue2kc3agQDxFKkGzbuxzzmeV7xUIJcqQ3WJ85cZQ4gvUjJ1in53+AbZeIHyKT
	wc5nFLbHW1dJuReLkdazTn2tjuj+o/fUzu/1gRbbcALArOYUzRRARd1Q28K+xOEX
	y+ugUSUwJKokvrUB6y98hVZBmQxR+g/Fp5hSIyunXDzQgNm7BYKZWzf4sYLxFpB2
	xEaB6tQFhw4IQPHm9MtM9k0ilQ5E10nck+AsJtMsW3twgKkP2uD73hw9SgXxpCxo
	JyJ4LFKGFYiVVkfYUXh8b9KgiCnyKMRPCXUMkGXSDfm2gsBg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs928wqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:55:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so8336632a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717758; x=1785322558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yc5dIbEuM+PGY2hwvnsliHcBpFlRH+vWpInuyqh/tSw=;
        b=YLJv9lbGRg6prqRrQsC+4VO0NK/o/hY66KxEEJn5TY853V8l2SvPagaYw6tZoiQxsl
         Ewf0xT7P13x9nOnZiDpt5hMjOh9ALoCOY/K/3WIEu4u2JQWRAkELtWNwwnvBjhKkbz1u
         F2lOnf5jzSD/I1OwnTn4dOt22DlRSFOljiQ6e1Q0DbQeGsi/skjrnaBiFAY5mNa8YKpb
         KXzA0aApjqaaeVr4MZBsduDT9dGqjb8lpWGy3Lq/gRPwXF2loq2nhsmU/e3fKILSBcPf
         nL2yj811xmBgjpFIrdNNxRG4Rj9jF451QmscIx+kuf5la3TwySKvez2dJDgt3w01E/hk
         1l5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717758; x=1785322558;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yc5dIbEuM+PGY2hwvnsliHcBpFlRH+vWpInuyqh/tSw=;
        b=EDMe6wTAg4XAZAaslkQIQjMaGQZLKiI98shkt78iEoyOIIgrL+4x4+WYHOfq/U5KEQ
         FXTylXKJ86X4X6rxidI5KN22TxRsOuVQji4yB7A7iY/0HmNkBf9Q76/hwySP70rF66Qn
         wjKa19IwKODc+USEzRjJ5bfgYNhDCu7EQnr8F7nYH0Zp985NmxxJg4oPqZeh70BXYjFh
         kL4f1O/qWWcZLzwUl7diEIhMEeVmDfJEDc93JIF777KxXSpD7qwD4VY6koKl/pX7e3Qx
         +EtmCluRvvngHGJnWbgKccar+8L4m0Qz/UpwnFu9B3bXSeMwod1dV8wa5Kule85TBMky
         AwLg==
X-Forwarded-Encrypted: i=1; AHgh+Rqxk1trKnEjqOx4BzFweJhAzykfLIkLvNwxCfKJnu5Mx1DUVNQ/reBZRgnbjxwaYOeYwC7hnvoiHULfQHyL@vger.kernel.org
X-Gm-Message-State: AOJu0YwcK+QYzY7bU3nDmMdAZz+IySFutWaGxZM5xfRjLhRy1WsrrCv8
	k1ugokJQjpT2VE4/DJrmSs1PCM8YE5wX58gi4VNDGurDagEqafEJFupvVASIng66UzNKnD81Spn
	bWbPmuZSwzZrseJoMexOkFFYOc6+Tobf8jV5E8zosBiZoE5QoZG23RgustxBrCCKxmWwf
X-Gm-Gg: AR+sD13hqN5f8NJ+OsjPDgDFfBY+s9a9XXLac2zGOs0aETogipHpbLH5QjCUkjdSjYz
	mTdtgcbzoujIccH/5CbpC3OsT3DWm7c3HGacZp1INrfZcKQFJGW5+JROTOzpKIgM/ysKV4r+V6H
	scFsd1juFRdWBTPL/t2cXvxydVXYDXNb5ZuFPsANfTxtQpa5Vf5cMDPHoGA++Z22aK70evnPyto
	w5DOiiLjuBy3BCbDdfYIUE8lK87Z+I8T4cU3xnPsyGrbvQlfa5WEMzrjVntHbjfcGw0lq71+leq
	8E6JC/ZtEv2YFtiwHCCDi3ejK+xNX+0oVq56oHuvyPD/9noLeJ/rdWjJvLqAMcmD2w+TndhS/n6
	AQmE76pea2ZkwhWUUIRSXAXMw9LJq/CVZvOtxo2s9/KyzCKyDZSltaAa4kiLgEmgc
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr23935698637.65.1784717757681;
        Wed, 22 Jul 2026 03:55:57 -0700 (PDT)
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr23935665637.65.1784717757221;
        Wed, 22 Jul 2026 03:55:57 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm5809160c88.8.2026.07.22.03.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:55:56 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Wed, 22 Jul 2026 03:55:31 -0700
Message-Id: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKShYGoC/13MTQ7CIBCG4as0s3YaQOnfynuYLgaKlliKghJN0
 7uLTdy4meSd5HsWiCZYE6ErFggm2Wj9nEPsCtAjzReDdsgNgomK1VyiOuCVJnLKow4DNlXLBbG
 9UoOAPLoFc7avDTz1uUcbHz68Nz/x7/dHNf9U4siQOKtaJUnUsj76GMv7kybtnSvzgX5d1w/Ke
 dhRswAAAA==
X-Change-ID: 20260715-b4-kalambo-crd-86912a03bbd2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784717756; l=1647;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=ngdTxAvXfG6ndCG3TfQS0CmbH+Nqn8eIjLuojkwWHGI=;
 b=uO+TOiA+n/EQfucHWnqlmjsdHsKD3qPsDuVauLRwAi/Pfqk4Liz6xzqVGy/NGiClpkL4O5DAV
 Tht6XsG3vQiBHLXmDyhtTjmYr3VfXyHM8X3ntnllLBOl0Hgz0fA3DLa
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfXyhnRyZEGZmUZ
 vFSXIRWC2xGk4xUeDT7jEqlBTWANIz0cdWpEOrZaTUa8Foq+q3asFi/gsujJzcUxHGn0vmd+Qew
 j6nBV/SbdCOEKWJYTNJN5Y9X+Pa+h5M=
X-Proofpoint-ORIG-GUID: cuifFu7daegMEBUUJing0W3wKYcOH9AZ
X-Proofpoint-GUID: cuifFu7daegMEBUUJing0W3wKYcOH9AZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX+WTQnwizRGUh
 jMqKzKHU8tXPfTjOtxZdw0nLknXslo6CwHCk3FornNalmSpK3sblld874vetbRAJJJuALr9DjuM
 wwvZ/F+xDtzUdULL6xP8Durv7a9A17HhwAArH11e8hJgSua3iBvSrTYOgB6GsOKCB5ZfOmVkGEo
 UnL2jwXD6rExj3TDkwmD+6qzNtsKxnb85vZaxfEYNGrp1f/WgRPMyyHPfMh+AJS3wYycwh0j3vL
 4afq5jkD1i3u3wGIztM/vwvPAkysmA0BX4yXkacgsVkVumaGVd2/z+xws2+qtSmVdYGb/VW3Ff+
 vkQjUuPzhJoRCtY0UE3oDiMEtEm/B6XjHbt0a2qpa3K52iA/dEYinLr4ytW5ubsDU23twgn6O9f
 kjVR3+DEcMfb4TipaHnJiJ9E+hEO0vr0BFGEfyqlUqYWzpF414leRt686nKAWnVZ6giNLE0eH+/
 ZWb1Rj+uqzSuqJKbhSg==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60a1be cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=C5uekO2B6f1wSzXi7RYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220105

Qualcomm Kalambo is a Mahua derivative with CPU cluster 0 absent,
leaving it with just cluster 1. Everything else should work as-is.

This series documents the board compatibles and adds the SoC and
Compute Reference Device (CRD) device trees. It also adds the Kalambo
compatible to the UBWC configuration table and allowlists the Kalambo
CRD for QSEECOM to enable access to efivars.

---
Changes in v2:
- Fix the cpu-map and SCMI perf domain for the single cluster.
- Give the SCP shared-memory window its own IMEM section.
- Rebased on next-20260721.
- Picked up R-b tags.
- Link to v1: https://patch.msgid.link/20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com

---
Gopikrishna Garmidi (5):
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

 Documentation/devicetree/bindings/arm/qcom.yaml |  5 ++
 arch/arm64/boot/dts/qcom/Makefile               |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            |  6 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts        | 21 ++++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi           | 95 +++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |  1 +
 drivers/soc/qcom/ubwc_config.c                  |  1 +
 7 files changed, 127 insertions(+), 3 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260715-b4-kalambo-crd-86912a03bbd2

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

