Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C99434E2F
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578427; cv=none; b=bfEq/VySSJaXw8+BoE6BsQczak0OABh0snrliYfElwWXQ/kfWjv3JAp9N3aPECU6TWe5a/GM6zPFhveMuRma9je684ntOeayqCBTXw3C5eFwmHAxDV4t2KISoyHsyra/Fh3s1gVMttwy2Gb8nZwGJ9zgK0s/BwjBqF03mWI52b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578427; c=relaxed/simple;
	bh=tr1/rrPuToYOiHp20eKjGiOpkdJxsv+d81Zrhl1QRVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQQ2FXhTUaRKC85pH/Hvuq2BZyFNH6EnAq3aL+E0GOsr9gicteVHOQDN7CfMDvzWlDkJmxchKFRgCOPMDOOkmEMGAlg53sk9tyFfUF82lPFU44HL+xm87IN4QNwDf9DD10T7nuI4B3ro95MQ/fRTFALUSE9RpZF5n9xmKfYkBcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVY/Sj0K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZp9UiOy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVY/Sj0K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZp9UiOy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713C3Mk2944345
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 10:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cj4SukU+GaTCl3tOuDXM73gHhX0/PDOwEF8tpva10fY=; b=ZVY/Sj0Ky6gaD8JX
	/t0aYrB0q+Xy6qrqWaIIfwL0jd7bE/fL4D6/YHt2ZH6jcN6iJoKX2Wsj5lk1Hq9g
	X7H0Dn5ukBYHSryiY3TdcgaibJoi4ssu6hQN61A246py102ZmCRdzBgzNOEuC6HK
	s1u0Njgkyc2pzVYtJuN32wBUx87EkoLQOOBAb5198i22s8b/SFg7V7/oORWqb3wW
	Bd9QSf5sKnsYyY7kIaWbJbqj1uk8jW6+IqlyuVsaE3BWUXzrOd3DEPr6biYPwXMc
	iu1xltr923nwVp78yUn/iP+gg4yCKHvX3AOkj0Cm+BDtAfX8YMQiqnfk42GIQAtm
	EWCe0A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8pg0nsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 10:00:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso2213674a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785578423; x=1786183223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cj4SukU+GaTCl3tOuDXM73gHhX0/PDOwEF8tpva10fY=;
        b=iZp9UiOyMm8L3wDfa9m9R00tRkZ0HkTNlSb+ynvksGwQ98zmTLMwx/pLcbI+jegcnl
         fjmjrhiJjZCQUvU2se2mSpQbOA7WHTrEL0+QCwh3aprA8T4m1kbJPj5oFr+8dyGg+w/N
         uiLL1GsH62Y2YEolCfyCHxBo9ofSLqzTgH1mTt+sKDlWRpuGaSrfJfk9Xp3zchU8kUG7
         7BKMxQKwHTBss5mDn2QjiFsNRcliChZunGmAvz6IpKJr1T9JH7fb1GoD1O/fOl96khK/
         oMITRtFzGWg1R7ROa/7uVWT67akoZgzWonBjOMaVbUXfzFWSJwlrbd+BTuNQWjQMQMiJ
         Hs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785578423; x=1786183223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj4SukU+GaTCl3tOuDXM73gHhX0/PDOwEF8tpva10fY=;
        b=r2vQdFW6zODYAsZR3LuQTb7vtOa1sSWvEhJT2UR7O96xdFo1RkvP617+uC673FJLPD
         peh0dDuQavOcZfc5y/hID1UiCA/8dZAW119tMP2fOE26mwscfSjNLg74Srr5vpJMjlUi
         sU/g5dkhXF/STzGEfF4KWngzle5iVecBsZoHDxziDX+xg8XScUyYhE71jEe0+/sOIX9y
         QC2Rs1Bvnoci2yRAM/g1CPahzCKiJx2HNvRLLEtzpJJ3qN08Uz7v3okfvXKAGHeZsIUP
         Cv7wZ/mGqSRsFdfWtvjrPYC8swXEAOSmFvYI7dIA4Wp+iWIo48qCuGrIySOsBxwlmEXC
         qZow==
X-Forwarded-Encrypted: i=1; AHgh+Rr/S/XnI2+v8u/1HjvQoTVJAfULkTdDzmZryEmHGsCviC0M2nBsBAoUALV6QmEeeacgwlHPvS/wLH6xUMrz@vger.kernel.org
X-Gm-Message-State: AOJu0YyyM7IMPLaeA/3OZG1Y4KGd0kr7gRz/+YYsZb3HTz3cu6fNIPwE
	oJg3Vn8b8RTdbL1q2UZqsBFr99zCe7bkKPq/GrXv+s8pTdHRLPeBDxsv9aMaFyDyoaxjbkxNZwq
	tdEJCzlW2qSd5nZ/4CGS4xr5pouLpYxs14ZJWB/b/QnnRaUonHyFhMynUGc2kZ28ufwWX
X-Gm-Gg: AR+sD13epkzwp7iP5tPVwrOEyf7qiJ4HYqQxNohXpof88Wmj7ybfPWb2+DVOj7TlXgE
	H2GuIbyn6bzoTYhLQmsUQwHcXw8+Xl8cANRBke2CoVGqo8eZQX7Vw290KwUbTgwdOL+Mfaw9G9A
	EfTQKPmgEKCj9wBB8Vom1FdFRnFtceSXWtIu+2ZMHBpPjAadanCWXmH+8LUbecJjvsVUYtYlkD7
	FqkRmm6/C48hAMGaQM4FSrPJkCdMmF009YgEGuBabmK2T126lsmfeb5DJknBV0yoO5v7DytsZbq
	/YyVmNCqGcLp9In/8RwsXQQOKijsc9YWOhJQa8HRVqwNYtjfPyXIfiMuL/Nq3Tn1C+g0Yf2mKaK
	9V5MWGAHzlnD697r6WqFw0KhUfM4H1EDfjt5U06VKhGVBDMZGNHlLaTdMcVffSede
X-Received: by 2002:a05:6a21:2c15:b0:3bf:bfd0:2a11 with SMTP id adf61e73a8af0-3c92a8a5adcmr3086467637.43.1785578423442;
        Sat, 01 Aug 2026 03:00:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:2c15:b0:3bf:bfd0:2a11 with SMTP id adf61e73a8af0-3c92a8a5adcmr3086393637.43.1785578422962;
        Sat, 01 Aug 2026 03:00:22 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm16290600eec.17.2026.08.01.03.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:00:22 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 03:00:18 -0700
Subject: [PATCH v5 3/5] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-kalambo-crd-v5-3-22160abacf3d@oss.qualcomm.com>
References: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785578419; l=2027;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=tr1/rrPuToYOiHp20eKjGiOpkdJxsv+d81Zrhl1QRVc=;
 b=3OMNedAmwur6SyqAypAZusqUyWte/0wXfmZdNjUL2Dn9dftRqzX+d/kUcu4fEG88bg1EdhRAu
 nOY39THowcjDY8Jm0J2YO6CiDOKCsTpdcPFyWyHe2r8vL2fDuciZ2Vm
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: _e_TuDBCOJYTLp9VLTO58x2caKI9-dJX
X-Proofpoint-ORIG-GUID: _e_TuDBCOJYTLp9VLTO58x2caKI9-dJX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX8vqXmjKi5Tfn
 KUgNhonG7T9oJft1fRBhH8vi9sUldgKVupOUh34keU3ZUM9bKuMHOIEprOILw2tcqdmBm/XHGKv
 bennEXP2542bKZsshCpycJ6yuF8MurA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX/0VXBENbX/jt
 vt//iQ+EZzsngzSuxmcccxYCdxSySlmW2fnbZS5p3+Ocr4q5IVBC2vVyjMo9xB0x+/YQ6oyZnBq
 jWBJgs2FoABJcHAMtko0/YPluZbPrGVOUWH0zzKfOAbSpiU5hNEmNC5uGfDyilkkYeHwYTTaGn9
 XkMgyg7NZTcS/1HVzDvyUy3Lmp+qaNwrTcvWDIsLZLHve85U9uIHz3og20VmabpCWvI9JaczEWl
 vvG79hkldIOjIOcUYEAkswaPz68HuZFkT1WNE4YitPhPLM49jPf4M/kxsq65C1WzwgeKJ/YvRwl
 N0q795Au7F2DBgkPLdumt/eCkl1gmbIWy90EZkG7//DZHY0Wn5OPA4sJYpC1DOA7uHzDacgyDjL
 kswl4U9OLiCQeRaA4tLggV9WiZarmBc25/sbgd/9FVC8xaNdaLx9ypz5TuVNZCm9ZP4pJ3cqOcT
 wN1c80MC6y1mumtjw2g==
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a6dc3b8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GrrsNloRtQgQSSuI728A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010075

Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
common CRD board description and drops the PMIC nodes not present on this
design.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/kalambo-crd.dts | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..0ea4d6696aee 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
new file mode 100644
index 000000000000..b4441807f460
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "kalambo.dtsi"
+#include "glymur-crd.dtsi"
+
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kalambo CRD";
+	compatible = "qcom,kalambo-crd", "qcom,kalambo";
+};

-- 
2.34.1

