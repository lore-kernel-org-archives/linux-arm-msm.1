Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692AD3AD50F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734441; cv=none; b=W8P3NGrp5nmKE3nmk5CSgnp214Puap7oNJOgdA833IHkY8J0pZXLR9oKjt5mrJfa87K+f/i7WgnJ2252cqjjBb91luOyb2/zxnv9rNQ6QB+Ndq+vIY3b7RYgYnv5TlrmLjZKBCKZTnpoIXJqchzMRTq+mqH02OM14xFphItaDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734441; c=relaxed/simple;
	bh=Cjo3b1ABP7zrifgwNg/VCukO2mM4fCZjoET0N4dKyB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nOoWt6AQLmE7UP8cP8RjN32xs1N3GtFyeS4VmLE10iZp+guEUba823Zf1VJNtArcgyviBppe+GCax/waQc356eN/v0jKEL/c/7lF/2a7KMee2H1Nv1GgdRdJyaR7PQ84KfbLtYgVzOMIBX+jgGOXSRFRaSPvaTTVedFlsEn1vmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDODQNNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EcsbcpQm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDODQNNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EcsbcpQm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6S69Y4097186
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5uS0/faMQ3MvU0X+b4yCA4xc8M+/0GLQE7v
	v+ceiR8g=; b=JDODQNNXPuPenA9iZ6BCf6eKeCJvV2AuK9TRAKANxfPH/5dGH3J
	VmrP7ixmWnjz2WaSyHiK0qoXqn+/3eN6QGD7VpQI3wDZziDmFC23UtZZA1IeY4/9
	L50TE9mLK6NIFs614eZDYApic0cNxpn9pu3z1Bv0vXUbfKcO9f4T47K54N90iJn7
	869ZqkAt1f/0LAYYpZWnmMzTBN4bNrqPbdbkk/5sCjJQPhk8NdBLFhr11TNRQCve
	VHKcrkCq6dt0lABZKDRkt6Ct2UD67IH2lpPqoauWlGJ3up5qQZxf+n12cO8Nikv7
	8owHcR9ig+bmI0eu/Yu5BHh/GfcRGMNEgoQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceu22h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:53:56 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f3cc4f6604so1243813a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787734436; x=1788339236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uS0/faMQ3MvU0X+b4yCA4xc8M+/0GLQE7vv+ceiR8g=;
        b=EcsbcpQm/UwLES6IJQA/oKyxSKAuF/Io948vJzmHSLF57DJyHd/JiQhkhUfBKquXMm
         ZUki2a1/bpDCJCf5B7e7ShNL/JeRSfLZWC4gIZ1juwtBvyI5SxZRzcYLF8xify5Cq9tl
         gF0k/qo8VUmmc1gltR9d2dsIMY6mMXMQZgyRQFrFbFnYvwN9Lu2pEif3KUQI6sXzOQOv
         tQ0Dj2GYTf6scAqZ1o792l1lkWRuAmVdy7Yajp1OuKjNFtcyxwvBohW7XiWQawCIjDMr
         Y3TyWwyxnjogOCwsqcobUTkOz/Ckt7Ff3294Bu0LvC6ba7av0AlETpDG/8riGf1qDqyo
         N5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734436; x=1788339236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uS0/faMQ3MvU0X+b4yCA4xc8M+/0GLQE7vv+ceiR8g=;
        b=Zk5+thH7mNIKWsoMKSNLZ/O96Bt/vykDLaUnJeP8sWz4hyuZLAS3SeMSNKqNDY3FF7
         iQLyl+6vet3uL5NG578Z91xPmYnRZM4XhHOp6oNXJqah/R7F3mOXYvc3U1QH452huECd
         aR8J4E88bZyZbNL6biduvZq6JuB2pFowEWyzFpOZMewerK5MxtuB6cCFVVLqJe5XxMxs
         4C8DR9IKIhHZ4Jh2pdSeWvCC1q7KzW+AGMcJs8ZzTFlj2Z/SXWI7JyfbUjcfkXc3a85i
         8nQVQedZKYwviTDVSoQ2/yyiQm6pox2NaXL4Cj2JNPert8ClTJvz5cpC877BGyiE0B3h
         elHw==
X-Forwarded-Encrypted: i=1; AHgh+RrE1cdeRE3bnW2WNvxA4DL3sqAtxb3LmUchBc6mcaJWUF60VSi4J0Bh5DbZEHjRn6UbTFAahw5xSX7hjD5h@vger.kernel.org
X-Gm-Message-State: AFuF++nRJGSDd6dF1kKWZlI7pcA9bc14OD/hf0nKqqVwQgE5VunOm4TH
	LVqzW979U4yp54r+Qu8cuiT/nEV3KP5oL50J9ZOMTnJo0BEHBG9J6Ww1U9MRzfi6+0nTIkkm7Ux
	5hMEtz723qNedF2SOSPtNn2lzIqplzDteNVeT2Ri8oJTV5ydZALUH5ZM3FVyHhSSm45W9
X-Gm-Gg: AR+sD12hxy1xYT4LYzS00u/JA3fV0qV4W57zVJKQhzH9EWkjDofHU7m05kx9VAyDUb7
	rNZ/ADiHwS9CYKkQt1/YS09ClAwsx5g0PmT4UY2v06WaorrX4NEuOzgWTShrBEHgEnwWnQYTgLw
	qUIvKjzsOplpX4KUEJY3pYmsPqYLqOA/5xCqgvTqPa7HX8VIcBskedL26ly0MogCnwPmgAok15a
	oCD/5CAXmRWKKOK9a1apTmOpTmdMjLKOxbj7+FhgvxDHyoGICY2yQ04gCNaGbwmb4z3J3dCYas2
	UaBWDM6mxqfe8P9mfxSRcT8rC/8chAjmUmmzT2fUT5ObJMoQSIOdGN5ywL+c5kh1vNGpo6+kzxJ
	InSR+32KpllSy/hApk5+mYxXliqonzy0BiKMZ5p56qnn9c9HmZVAikm/h4mpi
X-Received: by 2002:a05:6820:82b:b0:6ac:a45e:ff84 with SMTP id 006d021491bc7-6b1a03fbc5fmr4569151eaf.13.1787734435797;
        Wed, 26 Aug 2026 01:53:55 -0700 (PDT)
X-Received: by 2002:a05:6820:82b:b0:6ac:a45e:ff84 with SMTP id 006d021491bc7-6b1a03fbc5fmr4569140eaf.13.1787734435403;
        Wed, 26 Aug 2026 01:53:55 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a250f5b0sm1223020eaf.6.2026.08.26.01.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:53:55 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Drop redundant qcom-rpmpd.h includes
Date: Wed, 26 Aug 2026 16:53:23 +0800
Message-ID: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8ea9a4 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=maVgyc_Z7UK29R2IGXMA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX+vrItvQ7M6JQ
 cB+DwUJJZBZ3HG/uhVogeP04rlSBT81x3g6/CR5QnRGS0VxE+qvXZ1pkIIj09f19t4Eh9QOPoS9
 aOC3z0XnXZQ0GgLpyqM3WngmUCoLW2E=
X-Proofpoint-ORIG-GUID: e3taMe9c8nxzuI-5rzJVXthIfKDzK0yq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX67FZOisjzxC8
 G0ZPjJ70Ymt92imiWsSuW3x0KeXmwcDJ2Hjm2kxWHaswhoGLTdo8TH4oB/f6J9Hx9/tklVBeKm+
 Fbiz8yytlUklQLbur4BNTpjJbMsA6nY24nw0uwiJEukDG00qG48tL4Uy4blqfcS+1r7kjkSar6y
 /u676oi1n1z9KIKdy8yMtGEBCbdrelHSQBBvbfHYSIacrI+djcpft9Q6pS63nh9OOQK03GmuGVe
 i+mhBPwRzyJWi+S6r4k+ptn8hJG+S1HFQBBfQeOjtgoZeAOacvo5QkUpTn3rrOkB3a8uGe2xCY6
 Nbwz2eIwgZafX+Bz+Y59xyiTcuZA5Yd9Doi5OTcrL4LhbeMO11Lo2c7PcdA1CXkrKHRGcTiqLQT
 Xc5WSnoRMqAhGQKUI4xtUv2vHA3Xxp/DSn9MKt+4rf7/TGDBK1b1vY22KaldiXz7/ewfM3QVHkP
 Jmj3gEUm4/DmDcbihKg==
X-Proofpoint-GUID: e3taMe9c8nxzuI-5rzJVXthIfKDzK0yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260073

qcom-rpmpd.h already includes qcom,rpmhpd.h via its own #include
directive, so any DTS file including both headers carries a redundant
include.  All affected files only reference RPMH_* constants (defined
in qcom,rpmhpd.h) and none use RPMPD_* constants, so drop the
superfluous qcom-rpmpd.h includes.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/hamoa.dtsi    | 1 -
 arch/arm64/boot/dts/qcom/milos.dtsi    | 1 -
 arch/arm64/boot/dts/qcom/monaco.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 1 -
 arch/arm64/boot/dts/qcom/sdx75.dtsi    | 1 -
 arch/arm64/boot/dts/qcom/sm4450.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8250.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8350.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8550.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8650.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sm8750.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/talos.dtsi    | 1 -
 14 files changed, 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..d24a538651ab 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -21,7 +21,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 8a96ea1bdb9c..0a95a91d426b 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -19,7 +19,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index aad8bf678916..99af314d7de4 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -18,7 +18,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..395d32d36844 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -18,7 +18,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index a2d93fd68299..2ecead79806c 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -15,7 +15,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 85cc9c6e6f83..0fa4cd81bb86 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -15,7 +15,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index b7dc40f3778c..bc9c788b92b1 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -11,7 +11,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..8483a1bc56f4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -16,7 +16,6 @@
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6..100faea925a3 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -18,7 +18,6 @@
 #include <dt-bindings/interconnect/qcom,sm8350.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,apr.h>
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..484ec8ec8c10 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -17,7 +17,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8450.h>
 #include <dt-bindings/reset/qcom,sm8450-gpucc.h>
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..57d36e1086dd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -19,7 +19,6 @@
 #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..7e397a09b6ff 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -21,7 +21,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,sm8650-gpucc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8e..c5240a08c04e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -20,7 +20,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..531cf41b94dc 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -17,7 +17,6 @@
 #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
-- 
2.43.0

