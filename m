Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899304CDDD2
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405690; cv=none; b=KzIM/xNYoAb0NZyzK9TGX/0gjUJGedcPYzklv+VxDdpqp1jufXPgJX6XeJ9GkMmT6O3LVuKFp2/PF9EpE/5S/4EjYC9nuQsuHvu/ihTNuFMt2q7+5/GbcGoUscBY9NWeBmnCCOgyWIb77rvxcc9kFQleQMRrthtqJaDo0Xw1j+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405690; c=relaxed/simple;
	bh=4uCD8zymZ8QSw7IPGWfLWxd+ItY5Mq5Iy0n06TS8Gkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgD3R9LxqU8MB8gOH8HU/Pb+twOqfhQ5QMG3DQcqu1hcKDFDoGxxTuLZzbNQkTqrVCinxqX8iiFedq7U3s5PcIFiuVf235TYRyJscuXglrGjAYjA4vbWVE9Y25Ed6i5Elf5M9gnkJsRHur6uXtpEbECgKoU4Qk2hSs8u4PrTht0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbRjSpo9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFrPrRLb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbRjSpo9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFrPrRLb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Or5s3305537
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOjwLbg28Q+vFumDBFYnqqpMwdfyKRYsjAEc/lxHoxU=; b=YbRjSpo9DTliSwuX
	oZ1J6zIA311pzAf0G5cLmRh/ERT1J840Tz6hqf8uXOtRtwFXQCdhFOX27fG32D5L
	lIDe2fW0bialbLz7n60LSSz7PfAONSbX2N7qOk9nR629jNCsASF2DC80wuphNtew
	0MNH6L02w+Z5NzxGFjhS33f00NfrMZFpVzddgTls+pbdOG/2k82nQwdqm+nXVdxt
	VLi+RSI4zPyswVd39VrV41C9qlJV3eUXTpr3KRKjoqp9PqG+82jq3MzV3MJJ4uvk
	3if6Uu8/Aibq+rvHm2WF4sll+VkhHKpTis0TaycKpE+QKQQoqoKlxlEx7DioczMI
	ja2qQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47gm5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:28:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso30777305ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405687; x=1793010487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOjwLbg28Q+vFumDBFYnqqpMwdfyKRYsjAEc/lxHoxU=;
        b=QFrPrRLbkvMjfqHhjIpB9VSfoea7/r4LbgJRhzGDlC6k/sO5VpN2PAhvE54qID/Qlh
         MlC9ddD9qYinokUXMi8JJBAdSogDwzTMPPMXq5BgShIGPdOG7CxY6s/ZIH3Wp70nZCTw
         A45la+LZ2NpQMMEGuSttTcsMJWDM0Qt9kk1dVUw53yvAPcJBHmj8fxnpLr6twBVekNlR
         UCBmPmAZsHq6YM7DYopYPVCPk4q8YkhUc8VbZ+12D4Rn0sdXdjjjep2246mJS9XM72lF
         hRH1gD8RWeyboX9wX8UFx9c7FAIPYVVg19VLCJhvIN9D+gxaR7X5s3Bt7ZyTGLKxlqc+
         z/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405687; x=1793010487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOjwLbg28Q+vFumDBFYnqqpMwdfyKRYsjAEc/lxHoxU=;
        b=FodJDgyTFRsosAdrrC7WPjVdtY9t6drBtTHj1kPDLlLTFaN9Fo05L1ERv1hWTUJa0e
         DbdZqNgc3rQ76+lrlNLOHjx1wkobfstCve6BZZOPUw61iPD468AwdKQlRcTXL3Ni9Lcu
         zQldCpw+HjCX2Dogrp9XYhqTLgY+xyx3ye6wCuy+gIPe6L26Isxer1zzdmJbBtUkIdBm
         EW4pGR/unR9Wr82SCmEtFkzu/aeGpeXoD9llqX1YhBLBg44E5arqBFccs7tHqPUfTt9P
         wzCsBiwhl8O8eEfY7/C9jEzhNHWZDWTpd1Nca0XrgdlYc1/BYq6ZWr1altcwHDWnXdzJ
         BuPw==
X-Gm-Message-State: AFq9FYKC2AS8W/4M/bPa8ChTWceASKjONMTAreyDiX27C2E+CZ/f/kl7
	2DBiPBRw3UEA2JoHwSzVuh+jIrxS6OndubeOGndc51pEzsk5IkDmbupLpLJrhORehGt5aUx0gbh
	68N4Xd99jpF7azqzBET9sMQACS5NJtIFi1YdqY2XACS0gv7qiv+gFswDMc05MnpkaHW9n
X-Gm-Gg: AYBFou2AAj7adHUnVA5ULVNvt6V+u7SInl/peO8D85YrIw+AWBQRlURWpgdpcatAWwI
	vvI0CZNE8jaaSSe9rtyk7Rrf/6jmwQFDByTSSaSDSsdraXHHepZd/lUfIz+VAWscTb6J3UQWm/K
	T/sB5hO5Xsg+6hfzFxt7vgfl8kXV9sTaHnBKaXz8eIwD8mJCSXEWV0Ovfjx3jcQIWEz/WZMPmPf
	ouDpm+7FD1Xt4kg/5KGNA8qxlAWx+9O2o/dsxcKPQOaglXPPcympo571/+LTt8xKIK7iiKBPynC
	MHWQeAcOGCVr5IF7d4K6gbAywpS5UH4R/TvseupCCIlpPUm9ETt/lx1ImqThhvBz8lr7xR7IiiZ
	aym5plwCR2K82/anqV9HXFonKnkY3W8WAMKw0UA==
X-Received: by 2002:a17:902:ccc8:b0:2e2:dc50:16a8 with SMTP id d9443c01a7336-2e9a6a06d58mr60633355ad.27.1792405687044;
        Mon, 19 Oct 2026 03:28:07 -0700 (PDT)
X-Received: by 2002:a17:902:ccc8:b0:2e2:dc50:16a8 with SMTP id d9443c01a7336-2e9a6a06d58mr60632625ad.27.1792405684608;
        Mon, 19 Oct 2026 03:28:04 -0700 (PDT)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d7ef1sm36359785ad.3.2026.10.19.03.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:28:04 -0700 (PDT)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:57:33 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: lemans: Add Draco EVK SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-lemans-draco-final-changes-bringup-v1-2-dcabe94f1074@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
In-Reply-To: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Kishor Buchi <kbuchi@qti.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405669; l=11297;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=4uCD8zymZ8QSw7IPGWfLWxd+ItY5Mq5Iy0n06TS8Gkg=;
 b=+rgkG4yzCdZziVc2RPwLYsOtXbEfD8qzJmMIBD1fGMVmAhmkRSZE+fB6Kn4STpCyqhuzwcIDO
 9BUFyIsdVbKDhroYI+PeyIQ6E2x0RmJg6Q9B6apzb04/rsTEr3Au+Fs
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-ORIG-GUID: QEUqA344EEvdO1OdKqWZNW5imXd6iwF3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX7uglZ2ggrJO9
 kjRcsCMiWsYrAQctJuX0FNbVGALRgaViSkfZNnm/jXNIG9kYx1UBbWMHnlZIIOkBYjKzchwj4RQ
 Muf6N3/0dbGU42HvMY7y91Ydz0QfOUt+sOip5U1V6V/k6sSz9/c/wBNKnQiTG7vQ54Y8KL0cMPX
 u/DYVzHF7Sq6qqyXOGjrFf+zUa6LxkWiI3DW8Jjfacy+ELCTGtmPmFQAjcZRp2qlz01F0AWean6
 xcVplgoBFXST2Rt7svGixlc1a6Q7uMW0YPDqVF2w4B4/g3VSAwMpd8PyE/+DLu3YDp/Miun3zv3
 BeWGJcBQHkkCL+kUJGnwQ8xEMCBGyJYPE3Hyav1Db1eOKXSlblU75CBukL4grhmOZgv1Z3v+BC/
 lbpFIOWvWfN1Ob+3CCW8GUQ/A0isixKc9HO8DR2Wfb8TWle4PZsGgpYe+wO88Eq11+WHA1aD8fz
 /ZlkYm0duuj+zm5cqbA==
X-Proofpoint-GUID: QEUqA344EEvdO1OdKqWZNW5imXd6iwF3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX+kSDVNbNX5wW
 OTv6/GycAHmvU3BxMOMNoubCfFfwKm01FdXiQ8hfEFX+SW6vKZGKIF0tfN2m2yKS+1CzQZ8WMlw
 5edK79FynGeGASEq9SOHF2V8fhOacWA=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad5f0b7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uYN2XYQzZ670T4YDsrIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

Introduce the device tree for the SA8775P/QCS9100-based LeMans Draco
EVK SoM. The LeMans Draco SoM is a compact compute module integrating
the SA8775P SoC, three PMM8654AU PMICs, and essential connectivity,
designed to mount on carrier boards.

The initial SoM device tree includes basic support for:

- RPMH regulators for three PMM8654AU PMICs
- QUP firmware paths (qupv3_id_0/1/2)
- Remoteproc instances (ADSP, CDSP0/1, GPDSP0/1) with firmware paths
- Debug UART (uart10) and board clocks
- UFS storage
- USB 0, USB 1 (host mode) and USB 2 with HSPHY and QMP PHY supplies
- GPU (Adreno 663) with ZAP shader firmware
- Video processing unit (iris)

Co-developed-by: Kishor Buchi <kbuchi@qti.qualcomm.com>
Signed-off-by: Kishor Buchi <kbuchi@qti.qualcomm.com>
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi | 401 +++++++++++++++++++++
 1 file changed, 401 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi b/arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi
new file mode 100644
index 000000000000..6b7971bcdc93
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "lemans.dtsi"
+#include "lemans-pmics.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart10;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1816000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a: smps5 {
+			regulator-name = "vreg_s5a";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1996000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9a: smps9 {
+			regulator-name = "vreg_s9a";
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c: ldo3 {
+			regulator-name = "vreg_l3c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c: ldo5 {
+			regulator-name = "vreg_l5c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c: ldo6 {
+			regulator-name = "vreg_l6c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vreg_s4e: smps4 {
+			regulator-name = "vreg_s4e";
+			regulator-min-microvolt = <970000>;
+			regulator-max-microvolt = <1520000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7e: smps7 {
+			regulator-name = "vreg_s7e";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9e: smps9 {
+			regulator-name = "vreg_s9e";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6e: ldo6 {
+			regulator-name = "vreg_l6e";
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <1450000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8e: ldo8 {
+			regulator-name = "vreg_l8e";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6_16mb.mbn";
+
+	status = "okay";
+};
+
+&pmm8654au_0_pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_2 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32768>;
+};
+
+&uart10 {
+	compatible = "qcom,geni-debug-uart";
+	pinctrl-0 = <&qup_uart10_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};

-- 
2.43.0

