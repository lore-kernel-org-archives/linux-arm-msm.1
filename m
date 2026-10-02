Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93E749890B
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 19:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970298; cv=none; b=lnqgmfB8EcnVjgERQ4GGacauRpNnXSww0iiy8POHGkVIwbAkOwNR8lInOGmxjPJ1CfePl+eFf/IcS7gEVjPTMCF2nxtuhSSsgRPRcOWiwBFoEiblUd6XOZ2WnZHwixbBgo4mwFQ5609flI7jh/WFouKFOpdfl8cYnmz5+hUXFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970298; c=relaxed/simple;
	bh=m8Wj8IlJfxl/EXgWl7NbfBEc9ZIDALWBiNEWVbi1Ge4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rY7w+xl2kdvhQxykCWdpwdG7dE3GTezRWLDYGw8oJgLu6aEpZtxEhoei4KaN++gfFS0kxQiEImXo89LzvfO56zN7DZtQ5aUSLEsoImT/jOTWCnPOIJajYP+YvUtXnrrTXwE+UVnICLxNXBOwbAi8dH2656iBNBgWGUNFpQf37xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlZZkxyd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/9f4Qag; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlZZkxyd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/9f4Qag"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H63hU2985437
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 19:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fQ52WWB9Hex
	EMSne5zIc3znfc+jm5KTCEGMpm+1JmaA=; b=QlZZkxyduIXjC4S3dqAhHARPYcR
	4CcwwhNxQzyw5ngwky/h0j9BSy5uEjlYb1n0VoPAixqk+OEcEWLRcujtUJVIctYo
	TL6h0WgFsUo8Rh4gxwQFldhqis6xTIUMXuIPr/aQQYlcPrPKTdSMni7B9W//8LK6
	Vphwo5OmeAUFq4Zuw/LwUJINhZVsdP89Zc8LycWrssICC6sP+jFDMOUj5FZTcIPn
	Yo43s6MOOK32s9iwfqMXEWTUnuapL+OMpJPbguTT5euoPcPz2ObX/qg3Oq7cwqPn
	Jdcu/Eje/W4YBZIoPC5lMaEAmOnPVWBUAncEaolTc8+eyf05jBRa/hsc78Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mu6yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 19:44:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90c8da50f4fso4086236d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 12:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970293; x=1791575093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQ52WWB9HexEMSne5zIc3znfc+jm5KTCEGMpm+1JmaA=;
        b=L/9f4QagbETneIY4BkyrtKuK6XD778rXqjHREdiY5LL+YtPuEYJtGm9D+mHXAzYm+I
         D+GM95Fh0G3hw4uu8d2+nvH4hTwtMf/W6128CBoivOkRfJySbx+iSA2yUKEDaujkgqjH
         f/Pw9hUWTYtptQJKqX0+L2Hhn0EZwbuKVDjgsymSYRORvqWKx8cEi6rlZyh+jX7ah8gP
         ImlYA5s3o49yExGL9b0TamjXGBLZKxFHtZfoPPcVfzOqFz/ahZ5pyRhbHmKlMUE3LcCN
         Xoa8Q0bnQkce2vMzNqCtzosp7VPKH4OV5O6SCOQonE4uMXDf+sPaTrmN4YwjGoQYGquO
         WhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970293; x=1791575093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQ52WWB9HexEMSne5zIc3znfc+jm5KTCEGMpm+1JmaA=;
        b=LDpLY7ZLe7SE3rl7MZakBmEdk4Fnd12A66uPKl+hVRN7vZkOfC8xhSm864Os0n3jOG
         tiTQJbrGlCR0k/WW07XtqQ4na35P1ykaJ7I85IAzdm2gLGRHvTuwumqKkMuW3oWAlnWf
         12Bohf6Ub64C7SLH6BeDHybpt5UQFPM9h+KS3//ZrUTJT3qqm7gOy2+XIbdib/zPHTEY
         Yv+4TdqBnmnH6HT+BN1NIf7VNvHLwsQxxFnORBx4U9QU0wAK5FCPdUJUPMI2w/Jl43Cw
         6+I2rxsM7uYXSYWNwCJvQyo0KtYOPQWp4+1Xmpr96ARM+pBWenC+jo1b1qX7LoGYgP8a
         HCUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXZs69yT9EGKcBCrrSOQxffADIH86FvQKn2XN0sUis9rRVWTlsd7kCIuCzYsLR6vvP8RAMQXyr8A6kp9R1@vger.kernel.org
X-Gm-Message-State: AFuF++lAl5wRtAkX4SPX35i/uNXN/LhYczTi/R0Y8C0tvl+5klIL52he
	je1BbmCkG1t8XohV5Y146OW5HUquoiOBCYwa/z+0GmBZ0aj2xQMNRIiFeN/vSXfZW3d5smCQvNk
	6eODgMSNX4cNZZKp/wks+U45iyctMsJsQ3yy99zLS1hQYFK/mhhiftVTiWtGzXqGwI3yY
X-Gm-Gg: AYBFou2ntp1igSLriFcPteELWXshHoJYFvp5fhICYEVxktayiTQfhJDodex4qFB1yPo
	ujuGxuV3Aad6Cqa5h822qnM6CbbM/CNotSHktaiyswuYV74mCLgD+65+X0WYX6N4MfD9afFOcw0
	jJm/dz4bu0vAEYhyAIVcN7eqkMyCqkmcPr+SX6LXQ6ZzqeJcQFPRXZAkmdWZ3nArK8qWi0hx11b
	35e0NIHqbJKZzWcZTWBVBDtwSpIzk/4foH3L8XXs8R0kXBL8eD9nZmvcESY9NByej7Z410N7UiU
	dikDfcPnxSzXLN/yTEvxYACTZQwsqq0IoM1dTe3NhlKV18WHq9TJAjl/G4WdVfW22UmysaikTb+
	KfeUKe1xR818/
X-Received: by 2002:a05:620a:4006:b0:93c:7948:6e84 with SMTP id af79cd13be357-93e5109951emr82359885a.52.1790970289300;
        Fri, 02 Oct 2026 12:44:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4006:b0:93c:7948:6e84 with SMTP id af79cd13be357-93e5109951emr82354385a.52.1790970288805;
        Fri, 02 Oct 2026 12:44:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: Add LPASS AUDIOCC reset controller for Glymur
Date: Fri,  2 Oct 2026 20:44:32 +0100
Message-ID: <20261002194436.1275056-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX426CEUa69uab
 FYN7vTqoWMFKVgtE6ou0ipmmhyZUf+ELIGmSyIsYMKKwavn5zbt9abQeCh7dxMgHiJ2xVU990bs
 YFnEDpjBSrJpoxAIpg3cXo0y7fKnhuE=
X-Proofpoint-ORIG-GUID: q_P4rXUuRbR8Irju7Mwz3c065NCuyWIj
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6ac009b6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=peyyOT9P35Ab0jvJzsIA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: q_P4rXUuRbR8Irju7Mwz3c065NCuyWIj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX+ONk7o2x12dC
 kdz2P4pb3bVHszD1ZFbo/GI3vOkMGs1FFkZWpx6MjO8ZYU4YxCWWIzQakbDleAOPd+QGaIuwkro
 +45hagaHgwoyioDfcQ/dXuyfFNuyCI03z3uvHK5msb1RSEWEdrgyPxrHihu/uwCoA+CdrZsLK0h
 V/WxQNPIWMB5pKTdDvnUEZ4obAembCBpt8bOKlsebRowwn0TPC1f/tBSDxsH+ESBkJfG0waYpzb
 AFBBCvrY5UJG0rdOBeSN0kOoZ58xBydH1aFQjn1pnK6WJf3RcSrd2mb/SAQKOlj1fPyciO3FTGk
 UZmqlMVhwLDkJsKNsXu1GenEZu60E/zqP+2wCDdPUKJTl/BWtWpydsUEVdAj19rYzPXhsDCvQPK
 tY30MQ51Xw/JzD9mAoAvxcVm//0ufW6gml5a+EQjP5hej7O698Wqdy9wA9HAK8J7vqKIThnmz2V
 ZSCpD4AvDZqTh4wx3TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

The LPASS (Low Power Audio Subsystem) Audio clock controller on Glymur
provides reset support for the SoundWire RX and WSA1..4 masters when
LPASS is under the control of Q6DSP.

The programming model is a near-exact match for the existing SC8280XP
LPASS AUDIOCC, so add the qcom,glymur-lpassaudiocc compatible to the
existing qcom,sc8280xp-lpasscc.yaml rather than creating a new file,
and add a Glymur reset-ID header for the clients.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml    |  6 ++++--
 include/dt-bindings/clock/qcom,glymur-lpasscc.h  | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index f235b4e24cc7..a25e043ab894 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -4,22 +4,24 @@
 $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP
+title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP and Glymur
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
   Qualcomm LPASS core and audio clock control module provides the clocks,
-  and reset on SC8280XP.
+  and reset on SC8280XP and Glymur.
 
   See also:
     include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
 
 properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-lpassaudiocc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
new file mode 100644
index 000000000000..3006b12e385e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA1_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+#define LPASS_AUDIO_SWR_WSA3_CGCR			3
+#define LPASS_AUDIO_SWR_WSA4_CGCR			4
+
+#endif
-- 
2.53.0

