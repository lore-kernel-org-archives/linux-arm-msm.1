Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B577E3AB460
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352088; cv=none; b=deJQUQAfBDlYvtyhKlWyE5lzwFHmQxD4ssO8oHsOtB3Nklrm0I7mOo6MRuXRJwPKiPh7DhSKahkVEtXLxU/ZhI50twTmUzNhugn4NB4E7IIQRdNh2l0GsVSFdCV8O9j1dT3WquSwPqbdYvVZFMshpNQYWVXBe+N/Go/Qm8fv058=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352088; c=relaxed/simple;
	bh=+FfxcinivrEyRAaQsyH1c/usA6LwzS+hkhy1s2Xjb+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ixYV1UwNfNebtjA3v9rv+mB4LcQozb54RRx8QbhksD4dQFNtk8BjPkc+CBArl6aMdSxihQ9zR1MiZCLtuHeoa85kswID+WVerDODCFpWW8EjxKsO78pjfKqt3t3xxnVs21DmD0d0Dq6+tL70YvSapojxwolqpkhs2sJqzxwBEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvF8Vdi5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIeFgPAV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvF8Vdi5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIeFgPAV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5Hg9o263840
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYZsbdZHYze32GofhkFkzl9P6q7WCYwGWcyS3oDuak0=; b=TvF8Vdi5jMFI+ePf
	7jAzHWvTvRSKgC3SDysrH59M3ZMFxLzVEVsYSsCNFXXo+MBhKujQ7UDgNqT53NVB
	OdXt7/gDyYYiOTBoSZ/laApsZFH18jkxlyET1+0cfJGTnO1l3VmtjPY6ldSv4xvr
	aWBPdHvtucHjJZADh6ZSRVYOpFvHl8NxgLIMhrzahpZ4Z9DejDpZlxutha4vfRgS
	IypTmtzLzYYecDu2ENAP4vdl8JtvB/5AbJWWgkjV4QJtKRY8GZr+y0cOksEU9U27
	GTh6fZ1zzodq7CfIeI5fsAsO69hKnjeMfHZHmeSH/ugipdG6ULW8S+cO6velmeMD
	dK8lOQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9n2v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso2930548a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 01:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786352085; x=1786956885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYZsbdZHYze32GofhkFkzl9P6q7WCYwGWcyS3oDuak0=;
        b=IIeFgPAVtndYR3vERMz4BWeMycigDfZ9/j7YttM/l+2SGcMfp0DHm28zIVdMueA/u0
         8Uhrjby18APJwvt4XjNmOkHnI7oFM9YXdPob76DVOXYt4HnKEpUJABq1xgGKdUsGBi3b
         8InoOuwpUcxn9A/47AHOse0RTv4x/Ygfrc/JnmJGhUj46bTlPsOIwUSvsWmUyewrRyxk
         pCjxubaJV8b+pf1zUfPdrrvo1g4wxsagr9yWFbBRj80KODVcW0plULgs49wSwSvJ9X3b
         8PLSR+SMweXv3zw4B3j64LOihdKTwd1yeiJCsANFIq4wPeNNUEHl5JudpnW4Nw9RyrUE
         Qdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786352085; x=1786956885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYZsbdZHYze32GofhkFkzl9P6q7WCYwGWcyS3oDuak0=;
        b=KLlCbH2JGcmNk6b1w6aSU9ppGA49o7stT2KRKYhDrlpyeWe9N//ORMpdItrJgXB0pe
         emHndlJ1BGRE3Iz4PogaJjeVxG7zMfOgPYK+cuNSb3DFlnJ1Y2Rue2ism4NAAsx1+RPD
         2uMlPwNBF54MDp5j5TE8BqRU+pB4g/coapLgA7MDcHDoa7Emaq1iB8CLKSJFVLCtHjjj
         u9XKAYmUS9PwXmrVrHrMxKA36/QAn2aF3bvGUXpxpuTgKeWK/Umj7iyIQlFKCrgEpi/1
         mcjQllc7XTdKnyjRYPEeQFy+AVu+0PX/QgafLzJ+MRgPP6PP5xAF7aXl534SKFE/W1s2
         KC5A==
X-Forwarded-Encrypted: i=1; AHgh+RqzFJWWjGr2iD+sS51NpCut38AiRA8GE7U21ZQnFaKqVrDzmkeW/7SO52ArdPvJhyCnNfNp51eUydNR/S8I@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy8OcBOadaDl21VwiuHzXvKsS7uFesa+g4loImqNNxx2EKQHuN
	4MO+0/xyarBegV2JLXd06OOyjvkxPl0cTOlz7fbZ1iGY7/gIJtF5hs/FyY9OmYQsYKb2SExWVxh
	kl1UUqEZHg4ynGO1KHzjTtBENcmieXRzshWa5wtZEhb5IT2j70cCIk1cXUN6DuBJY0aWZ6NELRB
	LsvT8=
X-Gm-Gg: AR+sD12m3AnAvpyDqExFQIElKYpK48pxpi8fTEVA4upJNri65N1dWseDpYBH7kYQrKH
	VSDE1XKUwCtG/mD+/iktbhojhno9byW1jXvY4UfG0mBl0VMbJ01XCNboenbJr2v9yk12byM/Fzj
	doxzwLYt5RlQq+ZCwIZ20g8IXfY+gb6RAbGapTKyQ9ij6ZJ3RbnYybAtOgPel0B8NOw9Dtaz2Mg
	XwcKK8/4Z6sM1y4bgA8ISo2zNa04ezcppeti6Y74CxWU1mr6chihj3h0WoTCIipuSk+HxH/X4y8
	ExWx3qsoLivurcPkRH7/HPBu7aa3SiJEhej9DgeKpq2gbOkQIWaXihFcU5ojD2MYHZH3E+ga0yX
	zXB3bcBQyYWhxCO6eaBYSRkZ0gwyTPYi9YBuz6WNv9xfcqh5Lf4peDEeFxdwh3Bjk
X-Received: by 2002:a17:90b:4a0f:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-392823340e5mr19287029a91.5.1786352085209;
        Mon, 10 Aug 2026 01:54:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0f:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-392823340e5mr19286953a91.5.1786352084336;
        Mon, 10 Aug 2026 01:54:44 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff69eabsm11840085a91.15.2026.08.10.01.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:54:44 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 01:54:34 -0700
Subject: [PATCH v6 3/5] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-b4-kalambo-crd-v6-3-744e8ad1dae9@oss.qualcomm.com>
References: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
In-Reply-To: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786352079; l=2893;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=+FfxcinivrEyRAaQsyH1c/usA6LwzS+hkhy1s2Xjb+A=;
 b=h7YJbRMBnTwmpiCF7tFGvNfGlL6FgAj6vI+/GBV8QYUb8t4hJEZQAd/IuuwrFQXJOoOLrXj/J
 VlaJvags+lBD7uSos2dQzZz/OsAJ+6ogkhFnZn3rKeC9nxyMsJVy+SY
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a7991d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mCez9LKK-YWkVuwSxDUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: To1wk8IHkqQWs1xBZonEgh73n9qSaMnF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfX4F40fB40vVs1
 Mpa+fGRn3hVdWRBrQiBLtazi6+XoF6R1uyGlLJnmo7FgLm9Qz+capk9rvviitrFh7s3b5xc9sIE
 F0eCz5BsVkX/x6blqqxDRLaGpUriPCqNQzktQKOMA2ktLMmuG1ZkI1ujOtMCcVZr4wa/lWLlMj8
 2jeDTHGab3KaDIShxpQQ0cGu+5lYEAWeVHG83ufALvOJ6+XqcR7hoZapk9ZzMWSkxYcfoNTi2Wm
 oXRjiMTXht+yUpvXGisLmcEDUvxGKHEQSt22oiCHvYUpbGOYFry+Ou3Ly7S9CUOT9rW930O4Sj7
 LzOFm2kQS1cxnJg5SJxrxcFMWZfDPViHjfVUo9UqZB7/suEqWz2DaRd2Usk2Wb2BU6ZBs7YPFLi
 30zprkWglTRl9ABf+AzJUB4i1+raeTaf5G7wiU+h5w5qNinU0NCxx7r54+QshGcIBovTVkmvfTv
 jb0u6UnEetI7QuZAArw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfXwVr1Iz/0HQFC
 KQqYXVxZDMKxKPCHTpLxu/U6v98cSZez24DfroGNXG6K9J69xSAWHI0g0bM/wJoe52UApk4n2dW
 6xWOURNJyjGE1uGhkv1xMa7VcxnlZBo=
X-Proofpoint-GUID: To1wk8IHkqQWs1xBZonEgh73n9qSaMnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100076

Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
common CRD board description and drops the PMIC nodes not present on this
design.

Kalambo uses the same QREF topology as Mahua through the qcom,mahua-tcsr
compatible TCSR block. Connect the QREF and refgen supply inputs to the
corresponding CRD LDOs so that the reference clocks for the PCIe and USB
PHYs can operate.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/kalambo-crd.dts | 37 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..4384f72dfa0c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
new file mode 100644
index 000000000000..9149cf6ad94b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
@@ -0,0 +1,37 @@
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
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1

