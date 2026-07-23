Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0E4459ACD
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804560; cv=none; b=jHoFR1j2Kr7vlW+vYWOLr1auvERPkSHICJDkTvVDIkCtaNeghPpAXpKMka0q9MUeP4rAsHFyx9CBvTPy2+bUOBGcLfYHXGMzvm8xAo10pg53ANObY9cmGzY7qKn0LDbmH9QX166e6F/ZpWs3RyksrYceCken4stQwuvXTLvJtxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804560; c=relaxed/simple;
	bh=gVQBnEi6KfpZxNVfJW+f4MjonEtxu8zuPVunuzdXreA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F2omVVI8WUJYC6ygvuVfEU6b0czzzdKsOYQV0c+lbwUwjJLRJPz74nGKIGqJvJ7KTlIH+HUHetKO1Df37Mh6RiSENjmni5vwwa/pwiYktq3vozpbAOODsFFJid8RnOGpv2vonxHn0di5eWd2DHuAgn06dF6JT32/Rw6DkpoNbt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hs9vDMyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYsesYWW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hs9vDMyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYsesYWW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qW8h3648549
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xMGxsZrM8YF
	EKIw+mBat0Z0b9cENMeFop/qw+Rc0aSg=; b=Hs9vDMyNMX3/QuR+0SBWZ2N3D8j
	jdgTZdpj8r1Z01JzPWqZfIQz+YvTfMW0cPpUxH5PitfpqcUI0+Sfb+DY4yuYXxvj
	tlkoPQTgMOcDXNHWEie+qvf6bk4HdyzNYH1td2eJ1PLX5imoHkx7NrijAZXrhMpn
	VCw/fnsL1Tnwn9xDxsJ3a1Z0CsrWTbkcNUiWjD2VVg/oGz3HPBJb3+uHE0XrGUmd
	HVotmik4mGyu691k5YBhZv1N3TFsGTpWtMTpu/sdl+L0wZB7Eo89tgF1Tz9xRmgo
	65IxuXp94jGUKeA5xsCrreUrfEJkcZPaX5oOX8R1kJYCcbEXU75zLCMECIQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jn6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:02:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7131849bso670265a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804558; x=1785409358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMGxsZrM8YFEKIw+mBat0Z0b9cENMeFop/qw+Rc0aSg=;
        b=NYsesYWWmaLjZeGA1Ab/84v2A6HRuQxTMhzsiw8LLZ82TYxEzTotlOGOC3eKPsH26e
         XkgxGqAbGf3NpjmxvcZVAvEikXgGKIVbfgjIyuh75bS5FiAfx5d4CRPBglAVDBn4G6l7
         hmlknBPhfDT735lWqhVDShHpiBmS+NGxJcVPBoMlv4wmzhyDP92V60yarghPVsu65WON
         8yieDdkqqzOtX4QWX4QVM7MijmOD/a4zNDKSo7mmaa0+gSV49EOhq4Zae3OJOm1st+iD
         m2ccQRY2J1IxNjucdOWt61NlnhUyyx7yBbEIMF2RYAmrC0UhcY0dBgnZVzbmiPmRmsGS
         Tljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804558; x=1785409358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMGxsZrM8YFEKIw+mBat0Z0b9cENMeFop/qw+Rc0aSg=;
        b=ooFqaOnVRGdxP/LLGBNJWWV31g9MD4pjH4LBzM2D1t1yASQXa1GoopA2hm/mXPl+6w
         PhI/6hM7JwyVG9cX1NHvw1N618/uqfcQ+p+xtuYzVXd4f3ckLd6XVrl9WVcJejDnw1rf
         op17xUfywmvEqEmflhSXXq0l7uDTHfbZQJa2Xx9MZX+pD1FKrNZgD/AxJanLEyF+CODH
         DmfqF6hOSfvs0oWX9c6RDukMB00XfslimDq8eHi0pTMYNFAsAhkHmuC1Nci5ZTsETEhw
         iXhNoT+SAAdNCbBzh6Rb0POZP3rl0y64IxFN6lZH0MjOmDmA1wbYlajEVP6mYEbSLhrE
         ZL2A==
X-Gm-Message-State: AOJu0YzfiTZLqhC756lnZ2+lP5bt/Y0zCEzX0YIFrDk12VMfvq/qVHez
	J8AIFxRVxNhvqGWmWxpAlYap5W8Ff6xggMCSkmnVzJih3LCTVB1z02tbv2A54zqrvgckmjL347R
	NItec4YVzzsqnFTlVELMppboTbqAcuPK8ebi2fxGLjswFd/hpYxyb9Uo5D7R1GBOp8+Fu
X-Gm-Gg: AR+sD13PzTxrL5vWtckXcelrqUKJ9KF/Q9e7/HqMZa0gW735lBgAI0N2YDVQPLienkZ
	12++QYgsx8vMh+2C5F3CvUcmR6F0sDqdOYDVnVXrLbgqJeyhvxX4RoXCQjPzGkV+S96tfX5ZUkQ
	SM59Xv2lTqI/d+kDSqThEj3nBXSm63QDHm1pCsSbWbxNua5/T3VfivLMCYw0zPdaqMy4aCd7TcX
	c6QOrLB7myjushZsY/5XJBgSWp5wvuSuFPSZ4/UoW0t/EuxZwtt/x//IrabUtkNBIoTdFy6f/Ne
	XpdmFHsP+VTCYDd4JWDi4v9tcx9QD9YA56thc4JVQRLKpPR7+q88uG9Zg572gr2mpLQmcgeHb/O
	VMG9tGZTEiTqJ/QmUoQ==
X-Received: by 2002:a17:90b:1802:b0:38d:c50a:714 with SMTP id 98e67ed59e1d1-38ec6a51c6cmr2618603a91.27.1784804558015;
        Thu, 23 Jul 2026 04:02:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1802:b0:38d:c50a:714 with SMTP id 98e67ed59e1d1-38ec6a51c6cmr2618532a91.27.1784804557545;
        Thu, 23 Jul 2026 04:02:37 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081985sm19639783eec.23.2026.07.23.04.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:02:37 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
Date: Thu, 23 Jul 2026 16:32:30 +0530
Message-Id: <20260723110231.1586417-2-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723110231.1586417-1-sarath.ganapathiraju@oss.qualcomm.com>
References: <20260723110231.1586417-1-sarath.ganapathiraju@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wDKfxONjaJdlOBkH5doJGADa9T5D5Veq
X-Proofpoint-ORIG-GUID: wDKfxONjaJdlOBkH5doJGADa9T5D5Veq
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61f4ce cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=_iO14NNoP_ubr7RZT9UA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX1csZoR4zWmog
 QBqd+HX7r2lHvMyTP23fV1n/W9e1Q8TgVmv3igqU2zUtnlFd8wmXJ8NilyVfbl2nxBMQPTZEH9U
 CuG9jtS5rSxZN3t6+J9KnmC7pcMrD+M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX2O/Q9yXv1iFY
 Q2Z84gC0FMCc1nleSqjJoVhkGJLn8/0Pd0FcdnfJLy2hYriGjD8tPJWPSn0J6o1NHjzV9KhylAo
 Pv/wIaqg66joTgfsYpwKNGKxYPnUhpyC2oKBSw5Asm76DTo9S2FFlelGTjvxd/c+CDEWVFpoNBN
 j/bDTI16G5QoJJaykuqe0UGsdEnhDbR+j4NtkdLBjsIErFKcOFklKqRmqNQWpKHbgrErqKDW7mG
 z+qmWqZbrBtDnTesW0lxULblCtkHhd7x05k9egfDPHpNX+fOiyKoVWVYnRh7EgALfcquzd05/24
 Z93P8JJ3kfyNk/7eY9aghDuqZhUTv9/ycr4wEfEukoMXm+SH1+1HtBq4dXiC6EaRZH1MGcItl8m
 5btgOG2AetNFggfrftRsdLae/Silu+0hd+67OmF216EQFeEjS6Z2da7B5ct7o38F8ZEoOOKjEhr
 925LMfiAvoYT9ZLCj3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108

Add a binding for the Qualcomm LPASS VA CSR rate generator node that
exposes the lpass_heartbeat_pulse clock on hawi.

The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
start of the DMAs and Codec Interfaces for the audio usecase and can
serve as a periodic wakeup source for the DSP.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 .../bindings/clock/qcom,lpass-va-csr.yaml     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml b/Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml
new file mode 100644
index 000000000000..b4bc33a86640
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,lpass-va-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS VA CSR heartbeat pulse clock provider
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+  - Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
+
+description:
+  The LPASS (Low Power Audio Subsystem) VA CSR block contains a rate
+  generator that produces a periodic HeartBeat Pulse, also known as
+  the RateGen Pulse. This pulse synchronizes the start of DMAs and
+  Codec Interfaces for audio usecases and can serve as a periodic
+  wakeup source for the DSP.
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-lpass-va-csr
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@7ee0000 {
+        compatible = "qcom,hawi-lpass-va-csr";
+        reg = <0x0 0x07ee0000 0x0 0xe000>;
+        #clock-cells = <0>;
+      };
+    };
-- 
2.34.1

