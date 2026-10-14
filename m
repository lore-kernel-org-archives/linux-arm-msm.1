Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED55B446C19
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960065; cv=none; b=rqXRdzchY9aSNd+y/ka9TKf9ipO3VnIurMnqR7jqNdIruL2LowVPfQQpybdDkGy1oFRVZJivZLOiEo602EWJDLCKL1ooxYgpCtsjYJjqgGju+yx3jW/w9PDWv1RXngFBH3qWZL2vLU0fSMHZCuZbEHsJ9xf6qMsT//zLPJP8JQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960065; c=relaxed/simple;
	bh=xm7zvPq8+0XDPv67l3vkQFdx3XSnuLKHib+qIc65GrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgGJpj0XBbbXNRuzc5yKsFM/0IudOhnYyD3VohIltK6rLZt60L3cLzGA7+2W/S9gBz3AUTqcfVZsSbvlG9HTRwlnY6WUSzlYkJ8gXQqrcgAKHBof9B2QlbcxxU6UBU/PjFkfjkb+ObTyWy+Kxe+IXDHTz+Cu/KKgLXQVo79VFEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOu1FpW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ik1F5285; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOu1FpW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ik1F5285"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2rPxB3000871
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nV9MxcoC5Lj1qPLj06YsZ31VxSHo7HSs11h
	muZnfIw4=; b=kOu1FpW/nwmr1NeVyi1owSVgb5gDCiLrIs8oFVQr3ap1OmJpqSK
	7ehHisrAgA3JMzjANE+7Zz+XJ8CaeUH8zGcw88t8qNgCmJCy3zv7vwrOj+In/5bU
	1upJSmH+ZR6eNQB3spjOBE3MkMHyKy2Q0s1xVRWdohfHI8hcl9LSUUGn4pQzTRvd
	CuVV3zLMv4kbXtMCkNERVHnASQsjMzeJWMJNfhI9E44AdAfnx/eCePkQyFR2h5pf
	EQA4zv4+ZlhVwe8b+9EfoMG3G6fiqEImjvJV/q8qJHh2DLBCU55g8sn5m3/pL8qt
	oJ69itulkIPHmykl0BurD7lzvhiajYx7kuw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbetjxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-886129276ccso1422352b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 23:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960062; x=1792564862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nV9MxcoC5Lj1qPLj06YsZ31VxSHo7HSs11hmuZnfIw4=;
        b=Ik1F5285XQ3SerjbOr2Fdc+/0O79thu7Pt6rtbjZUb/TSeKJfgTBL7DSkGapQdnpUC
         XcPK0RtTIIbFVrLfRlsvtnX8SO9a8bxlOKRJu7h6uyHTHts6QUlLYkK3Pct/jYqu/VoT
         6eFm4UG10b+HBeYACwW0I/sWIBr1+xMmo2XHj/s2C8qWQUciDIkXkd5qYk61kKwpzw7h
         EOYWSMW9sfR6lk0daB6MFgP1xDyLsoFkPUr2FscUnmMTnT+dSyeWbX4QpFY43X81HDAD
         mcRusA507GuZMJQGl3amnQdumKuuYeY3DRQactTrUsdmiL582PuDfJvwYLdcfYewo5Pw
         AWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960062; x=1792564862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nV9MxcoC5Lj1qPLj06YsZ31VxSHo7HSs11hmuZnfIw4=;
        b=RR0OIiCb4Pt642hLu5+DPRUgC25sl+I/nGMXrKSHjZZ5cWJvM2LWMK0ZWonhS5Ta4+
         7MKfEXVAwz4ThXzhQN8e58VTi4ykNJCWKLz3pgkOboUssw28pN84clumxIr5OSeDgsyc
         ZFh0qy0LkxbmgNO+p5hOxtamAjc86whtlQr/FzxYrmxm6EJI6nmlBJ8zq8rGVp0FPLuW
         woM7kJRc9aevCL3WnItF8EireSQwI9JV7UCsnw+pXGTlBIoslT6PiGRInnYCEktotvHP
         LWF9i5cM83l4U7VhOIYubqst40a3a6Q3VLXZ5dRJon1kEOEy6PMeXykH4S8UAdF0zA+8
         eUlw==
X-Forwarded-Encrypted: i=1; AKwUvBy2U9yOkNI2YdnTSh7P38Rrel2bElrdvQFST7wk+txsuS1YX+28XbH8l0LHCTJl5owI/jcFu3JHMlpQLTzt@vger.kernel.org
X-Gm-Message-State: AFq9FYLiOpDWlF6CMDkgqvsP/B/4udPHiaG+ihdBbfU8SO2XQ4zTktvu
	TB6hALq8qEDi+dZZT/K6Wh/6ZhQfKjPZrabm8PfL1XWNz4Y5mgHoggLTmQ4zeFZbzmMzsZLGbOO
	yQPvXNQ7ub4y6Zeqg/vix4BzpTQhmJ7IXFF5QDUvzCaMxhf4pt+EigBN68QA8DJyjOYPr
X-Gm-Gg: AYBFou3BVF/Tip6jmv4j7ftitYLXw+HocAv0enK2gYYOhGYc1n+qzIRzHUQxTxcNvyN
	VmJPkJxu/u2qvWkhysTI/Q1pZqIDOWouZlboDvbc/ulx+97F0u7oCLgfGW0RUsrLAX8gbJR2qdC
	qLalCOwbVcWH8nKO1XhwhlRlFyOrwI10DsO2kDSGMiVzZBMHHNd2vzekKyXlmBz3tAdN1I4DdhK
	679XORIHgTli6MV/7kHqMepNI1QARQmqwfq0CzQLbkAcE2wiP2kar8YzX7E3I02FxgArkZX7xtd
	Dzu31mJB/yLBkrq3V+AwXtrHd0ja84M0U1VUFt+Pwi5JB9yAZl1zZ5SKx4n/xVJZeKinMIRlk8a
	6QhDRhUXBUkck1HzSSKKtEmohZ19viCwl07jx6AQgYpGk3SDzU1k5Sj4Vpis=
X-Received: by 2002:a05:6a00:4197:b0:874:705d:f63d with SMTP id d2e1a72fcca58-897c70104ccmr11910659b3a.31.1791960062275;
        Tue, 13 Oct 2026 23:41:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:4197:b0:874:705d:f63d with SMTP id d2e1a72fcca58-897c70104ccmr11910649b3a.31.1791960061822;
        Tue, 13 Oct 2026 23:41:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
Date: Wed, 14 Oct 2026 14:39:45 +0800
Message-ID: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L-Q2TM4zgifdTX4h-0z-fxvb4Nw0TMiN
X-Proofpoint-GUID: L-Q2TM4zgifdTX4h-0z-fxvb4Nw0TMiN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX4dEPNNvNnPw3
 i5zWmeudQcmew3A/gG2wxYYHT0kYp2rRstnDYyl5dKYwG6qRsMGhuEmnQX3vEIAioC8ZLb9TWCo
 4aIVeoo+3KYUrl6N9+Y2nS8FZZPYCXqg7h3HWckGWsfrx4/19ps9mtGnSP2Lt2iNt7EpuhyRQTw
 ELp3kpHdMdgMPpOvve8MNhE2383wopxMBxPqitmy1q2nNeMUsrutu41bwQS7b6EpFcLN4zOS5/c
 lyT4vDCQgcJ4iLWcg2pGheHVVhcs+R9f1WsESQCa53XhbYxsCUu9vljF00xx3iWzVIt7f/JafRI
 u3aS3fL3sGX0FUw4Zq56eJcKXdKXeVc+HFqJwhHThQD8rqEBgzRQOltNLY5bTgF4ItmNh+ShrAc
 inhDjbREioOuMN5yP4HI37PS+wD2d+QZG2gC16+MW/SxElMgLJUOU2wxDWh8LVoFO0xflC2/6HX
 M7toJE56ONQ/kojEEdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfXxzyfRsNr6CMe
 5SueFif340pw+4c8kc26YQsX7fp+dWurGpXc35UwArkuron92UxIVmG03d4/G9eU64A7uDGJdRf
 Q8OZtmY3IlBi8X3q/sx/wMe11O3RMtQ=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf23ff cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xxUIrTjmZCIhaGii6OoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140026

This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
and the PMIC descriptions for the Qualcomm Nord platform, and adds the
initial device tree for the Nord Ride Embedded board.

It has a dependency on the commit e484a765f543
("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index") from
Ulf's immutable branch below.

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt

Thanks,
Shawn

Changes for v5:
- Add the missing qcom,vmids for ADSP fastrpc node
- Link to v4: https://lore.kernel.org/all/20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Update firmware-name for ADSP/CDSP to align with linux-firmware,
  i.e. adsp_dtbs.elf -> adsp_dtb.mbn, cdsp_dtbs.elf -> cdsp_dtb.mbn
- Use the same firmware for all 4 CDSPs to align with linux-firmware
- Drop "Embedded" from model string for nord-ride-embedded.dts
- Include PMM8654AU RTC binding change into the series
- Link to v3: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Reword commit log of 5/6 as suggested by Krzysztof
- Add memory-region for ADSP fastrpc node
- Link to v2: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
- Drop unneeded regulator-always-on and regulator-boot-on from RPMh
  regulators
- Drop SMPS regulators as the resources are already managed by rpmhpd
- Use pmm8654au compatible with fallback on pmk8350 for pon, pwrkey,
  resin and rtc
- Link to v1: https://lore.kernel.org/all/20260831032103.341633-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/arpTJAyDAAuAzPrv@QCOM-aGQu4IUr3Y/

Bartosz Golaszewski (3):
  arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
  dt-bindings: arm: qcom: Document Nord Ride Embedded board
  arm64: dts: qcom: Add initial support for Nord Ride Embedded board

Dhruvin Rajpura (1):
  arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU PMIC support

Shawn Guo (3):
  dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
  arm64: dts: qcom: nord: Add support for ADSP and CDSPs
  arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/rtc/qcom-pm8xxx-rtc.yaml         |   3 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  63 ++
 arch/arm64/boot/dts/qcom/nord-ipcc.h          | 144 +++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 442 +++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  37 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 910 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   | 543 +++++++++++
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi  |  54 ++
 10 files changed, 2198 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi

-- 
2.43.0

