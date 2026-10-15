Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84703AA1BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031880; cv=none; b=o9sFpjky2SmORD0cdiAO8On7egLF7RiHemTHEhfJy+umC1BkV5wTErOCmzjWjeLUKH0wLmXpM9OBj4cKfsk/udDx8/770fLKkOG4170zldvy1lCujvVb8or+UuyE9/H0cG5FFwPdXCcbUYWeFvE5QSTee0QrSv5FrSOp9HJf8LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031880; c=relaxed/simple;
	bh=HF5x4rJslkS5ldbX3PSmiGKP+XEfOEund3ixdEvBtYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RBTAL1VCfYMVsppxjJ0cJeuVMJzXaSk9qf2PweBpOMWv2UHEV0YSXa7gtTj0qeEALr+TfT6809FN0IRwoU/M4UYRLUB7GSnZG8UFJtHc9vatdZTmx6RHWm/EjFvJJH1hz9zX1gjHr8hHdT/KIHkVsje+iSfLs6szt/b8RV3lY3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HR1c0gDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnlI8BDf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HR1c0gDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnlI8BDf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENRKUR586453
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=a+lIi8L5u6cYgFfD+/wiX79z9tYf081N8YU
	cub8/ZAI=; b=HR1c0gDE0KPepD9EONzg1bPHpv48jiQlihUIUqe8XqJ4k7SZ+ym
	dj/vlyeZjqjGj8QqFUI2W3w9zY5pKqOTv6k2rYlBaa8JKtmOtRFC5WPUfVCVY4kO
	UEcCCAezJocl8tlqtvH0624x7xTTzigzLSzj2z2tVmxRhuc+IBycJ95kGSRoJelq
	DPJiQWI8ZV+mJA2VeV5DGQQDsXCl7W9jI3hNc3L5suTQqVYKs7vaQPpwd9KozK1h
	M4LwaS6LwfPkGUOKc3jq/XD0nuZRlS44PDltJwZ/s6NBjOFX8xp/QS76Uc4mON9W
	fxXNsou5J7G8RbfrXCXBN3iIxajhGQcvYbA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakderj3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:37:56 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-17188d538c7so8528170c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 19:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031876; x=1792636676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+lIi8L5u6cYgFfD+/wiX79z9tYf081N8YUcub8/ZAI=;
        b=GnlI8BDfutMn+OH82oKDUwPanfQMqeIAkTWxrR40+uL1ADzise9MZi14dXNdwsVwLM
         F6nLJsywvQCQBjc9caRE08ld9kg/1KTNMZt6Lc0Qq8y44ybH5StzcinPwcDhjip1H/fS
         M/pr2yzEMZlEJ/6H8MQ3Kh473wKUpswnxJ++aP8l4ZvbqBjLpg2p1bqmV730UhQjjzIH
         NYFkSI7I+34f/k/x5YaHdFbzqn/MJ3zFGdtJ5WupvHcgw8/U9JJ/0Cgs3lYNHmzFZfDd
         SdcArGYXgxJEbDY2NgsdsjtP2NhQBQ0GKgsFj1TtyG9yjn9eV+lJNd3iwad1RnzOpTrb
         k3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031876; x=1792636676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+lIi8L5u6cYgFfD+/wiX79z9tYf081N8YUcub8/ZAI=;
        b=SpClMtfUB64X2dvf3I7xTQOgWhKiVhrkcFIty21oG+Be0BEcpPnNBOtJuliCn8yFT6
         rw7drz2Vtj6BDENLR8ocIMRnxElimK/pfuKRbRCbG5RRXnvR9tyvQFuBJNeTcWA/TZMW
         hIxWdLgF3u0/w66n8vXTy7MuQOD6tm24bR6yT9VVHRjzxqzHVpqLXyvsMHRr5zefC5QG
         KjgkFd2moCbZlHPKBD1g3pVx5xWF/Dg+g82bGYSLsSHNuigIyosiIsYWzMkEdCbRWPNx
         UBYJ0t8tcKPmJInD9iMBn8U+OezpnfV/0240LX5j1zII4QQo7QKlgi/7T3V6EWwm9PhC
         exrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaIT0DAsaMkRwlMtO0TZe5PUHx9/H6KvDmyHbpAvKf/pDZo58zTugAk278Sb4KQZr8L5sv9W9N80p9RCql@vger.kernel.org
X-Gm-Message-State: AFq9FYLbVFDtDt0S6QLi6ioVnL7yIfdCGnbzb0WRc9uUEq6n5CBFM7Dm
	9e0xm9ol6ASpBIB4AbvVEynU+2u/vhCxnoPNiqHqHG3sFg4SHjxvf2rGunacEt+TfgEhbIXLDMq
	ZGQpB/owKzm0bVOJ8aSiLjNxf8196MivbA65qCDpJ3tEZPHjEAT7Nytke4PLk5H9SSIvS
X-Gm-Gg: AYBFou1zyW8Iiay8wG78u8civCBfWuDTrVPYjKlGc7Qw2h1Foi6PfVxTSz/ConjSnhE
	nnsMkA5aYSVNAkCyDTiQIyh6GgfVLkTuGqEQ0SUjmLtQYD8jxcR/8y2TzpjZkDM5LRJuMXA9vyj
	y0emrRWt5ldhK+8j50jhC4HJ2zjOVF01ItYFUNESeasYVn4GyfeqsU6WKu47Gz+rwA9V+bYboO5
	Eoa2XlfAT8sZtXI5gpp0BiNsd+qWgPmgBcQOwB8l34vqopfj8oOJlubSfVN2kpQmaBPnFurak+9
	0naEMed++bmNoWtbYXQUD0wuLxYdwXO1fa5KNam4BS7iTpDTT/I6xeWx7KWDs5pdl+/F/lg1Ot/
	R3yBpDJalNq5V7Njy6yRBs1xyJPfZ98TpcrcSB3xAnBZ23T+m05oqjTqP8lo=
X-Received: by 2002:a05:7022:290:b0:151:2e62:fe5b with SMTP id a92af1059eb24-16a5dbfd567mr27218520c88.22.1792031875476;
        Wed, 14 Oct 2026 19:37:55 -0700 (PDT)
X-Received: by 2002:a05:7022:290:b0:151:2e62:fe5b with SMTP id a92af1059eb24-16a5dbfd567mr27218492c88.22.1792031874927;
        Wed, 14 Oct 2026 19:37:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:37:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/7] arm64: dts: qcom: Introduce SA8255P as Lemans family SoC
Date: Thu, 15 Oct 2026 10:37:04 +0800
Message-ID: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad03c84 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KDW8FNEomtbSJeOC770A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 3ttW7MJ1UtT1oSPEi2e8Ar5uORTWNbhI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfXwXX+uIXCu+0e
 JItQoKKma1AjSMKC7pHDrrdAiYD58mr9ELoWqf23fA2IlNRpUlZqRYRvyPlCA/p9OmWHCA/qyR1
 8F9sp3hhgOUmPRIYgHI4at02ycjOx40/Wtn8s2R6+/fRFw2ikaBqXaKeSrjffezxh2ROB6sVNez
 QQ4cFodXwJ0G4XENcMan72p18mmVZqkb6ocvoZUGOmtAxIoR6yk2V7rko0f9nU+R1dgrxNjJjqF
 mGh4s1OgJXqgxoK7HH49U0SqsaMcgrfZj8JL73/H1IPx+l/ksw/EOMEhYpe4c6ZSskOvrBk4fN+
 Cn9BKTj769MQNjatDl+npsuaGfboJU2Y4tCeHlakBb/6jE3m5tuX+q+Cf1MAFiA8MoFvQP69wTa
 i3qNKSaZstZ1KM0NLgXJ+AP7IBywbINU/vM21xI6sVd4viK0F6pG5p6gPrs+fUMx3BDWIZ8X8/1
 UxYue3+dX5na6DMJ1sA==
X-Proofpoint-GUID: 3ttW7MJ1UtT1oSPEi2e8Ar5uORTWNbhI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX0p98/1TEHPdR
 3B2z1mcf4rXFiBdy/K4KO2b0ruzHBMmoUcEwYOKxm3GrKjC0hXPxFs4MuXiv3tPY85AzFzsX5bf
 lXqOEvv+C4n434t4sKGf7KWYT1199lQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150010

While the patchset [1] supports SA8255P as a standalone SoC, this series
offers an alternative by introducing SA8255P as a Lemans family SoC.

Lemans family has two variants: Embedded variant (IQ9/SA8775P) where
platform resources like clocks, regulators, interconnects etc. are
managed by HLOS, and GearVM variant (SA8255P) where they are managed by
a VM acting as SCMI server.  All Lemans family SoCs actually share the
same hardware configurations like memory maps, interrupts, DMAs, etc.

This patchset moves those platform resources out of lemans.dtsi and gets
them accommodated in lemans-embedded.dtsi, so that lemans.dtsi can cover
GearVM variant as well, i.e. lemans-gearvm.dtsi includes lemans.dtsi and
overrides/adds properties as needed.

Changes for v2:
- Rebase on next-20261009
- Drop patch "arm64: dts: qcom: lemans: Move PCIe devices into soc node"
  which has been applied
- Drop patch "arm64: dts: qcom: Rename lemans-auto.dtsi to
  lemans-sa8775p.dtsi", as lemans-auto.dtsi has been removed along with
  sa8775p-ride boards
- Follow Nord naming to rename lemans-iq9.dtsi to lemans-embedded.dtsi,
  lemans-sa8255p.dtsi to lemans-gearvm.dtsi and sa8255p-ride.dts to
  lemans-sa8255p-ride.dts
- Move linux,pci-domain of PCIe RC/EP into lemans-embedded.dtsi, so that
  lemans-gearvm.dtsi no longer needs /delete-property/
- New patch "arm64: dts: qcom: lemans: Add label for firmware and
  reserved-memory", so that lemans-gearvm.dtsi can override them by
  label instead of duplicating the node hierarchy
- Add SCMI power/perf domains for QUP I2C and SPI controllers in
  lemans-gearvm.dtsi
- Link to v1: https://lore.kernel.org/all/20260409091100.474358-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com/

Nikunj Kela (2):
  dt-bindings: arm: qcom: add SA8255p Ride board
  arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support

Shawn Guo (5):
  arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
  arm64: dts: qcom: lemans: Move pinctrl states into
    lemans-embedded.dtsi
  arm64: dts: qcom: lemans: Move platform resources into
    lemans-embedded.dtsi
  arm64: dts: qcom: lemans: Add label for firmware and reserved-memory
  arm64: dts: qcom: Add device tree for Lemans GearVM variant

 .../devicetree/bindings/arm/qcom.yaml         |    5 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 3685 +++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       |    2 +-
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi   | 3232 +++++++++++++++
 .../boot/dts/qcom/lemans-sa8255p-ride.dts     |  222 +
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 3369 +--------------
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  |    2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     |    2 +-
 9 files changed, 7154 insertions(+), 3366 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

-- 
2.43.0

