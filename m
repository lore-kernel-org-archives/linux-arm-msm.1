Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E54F477E4D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326046; cv=none; b=CKcacF+3C+EV+14O9VHmgAMOx5S3EVaOrmieknC0vbbaNgDqonJK4rTB0CJEtUx5d3yahGTy81nl812/WUqxo2l1pbMth46DRHFkvqkJVbAcRGj4fwOGSkCGzZRwGb3w084aPz5ye8bI3a1RF/pvTEyYqJS8GxWwMuf+hBw/1PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326046; c=relaxed/simple;
	bh=IHl96VfDfSLC8aLKVP1o5N9BHbNNzUMjoemjAMwnB/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n5cKAQ33OF8F3ii8VE71rPl32h6F/ngTrldH29v7EzUnHii6JXoAf82rpzsvYDDgtvrWbkIhfpr13HpPxbGtlwBbWWvfptg7vReSj+5bmp+lBFVlMbojzKdn8s8IplMKtq9IN8XYcDDEYwUnP88FtGGUVxeNwS+pe3MInQQ/4Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFHOJl2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDeAik7X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFHOJl2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDeAik7X"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J4wv756780
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eEmsPPYN19I
	2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=; b=PFHOJl2V/odJamvHBpH1T7DAnCR
	njI9P+boHnY4U97nX0M8nvxKn0adteUOFi6vj4/8grFJAK0nuGbV/fPwJ9AJbUBI
	fQ7teuc1H2mFSEaWZEr8Grzy4VlUbJ8fvZWSeMTArv4lJRnFB7hcfpNTxsNrbAQq
	PSCtqxuvpKeNfzdB8p4FHalUsYMdwKzlI20ruUtxEiL7nM17qACakzHJfyl1eXoJ
	Vsk1rvGPWttafIU3ZoTha3/Vrfh8JrloMpkFqHJKmTGqVUP66g8hRdSSUk5stayR
	kw0bt137xQo/HL16SXVDb4KTJvIMpLNBWOheYCEUjl+24faORc/T1U76Tzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq08kr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:46:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0b66ecd9so103669885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326010; x=1790930810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=SDeAik7XQ6aBAGo4w4wldCYpvKPp9u2ALEZ8vBMT2BjnoNfsT055aPvpY5ddRWyfjL
         J9I3J2ZGbY5XaKrQTPieUgr0U7GTvtqgkbGnbRp5+XDeofa81Txfuu0XWgqim4e+p8wE
         lhd7uHQtadsGRjlWz35wwcWRI/+6kPNPMArDbD17kr/2PnuG2FgIcr23c8EnMXhtYeU3
         YOC1E1WXvl0OjkyWVNe/82GyZ/1vO2mZSoo3Yj/EL0p2I5vuawEPWm8933ujTyJcJic6
         SL/5f9yQCVa7/qJNMrNWcWdpjy0IFJHajw/UxkPaHuJJb/R97S6izclrngnAwA2Y1ZDh
         YKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326010; x=1790930810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=Nb/uOdoVQmg4lPZ2DCvafKHjAWEXR7bruKWu1himqBgAlNCbo9V6fETppQZ/AADqVF
         2Djel2u1IcCpEZfmcBVDsngUMkOlLa7/Xaoxi2mahJ6wdjOt4+ZzvM5smxJKL4EyQ8t0
         G/FPDE2ItsI6IlZclVDe/z988d1Xfymi0tp2f55bvE9MxajRtdvZiseYFquV3klSWcLN
         GWZ4vsGs2a+Pevtjb16EJEcA3dz2/A1IbB0HCRV4amDt8joStZmmInV0J+eLNC6cCF9e
         vCOuTvZtI0HMisCu43zxfe0b00/MfghwTZTR4v4SV0tDIJsLp8MrZUiyU1B0c1J1iVT0
         sORw==
X-Forwarded-Encrypted: i=1; AKwUvBwuvHvmdh7Sf+Y6G5lAqz86btFmIfg7PWV5yTB+/WB/la+u7ztaPzYuf/VRPN/BMgeZWqhOHbwv6b4MswNx@vger.kernel.org
X-Gm-Message-State: AFuF++lW52AfKzBW4VAYBtxJL+MMApDHrkbNMfY+6RWfQA+IKD27fveD
	mW5LerhOYIOiDOjlkZ4ptAcCsM1opkabjU58t4UsaoYytMj5l3mUk72kiB87/BKhTZmMF/esN3U
	TijnsCUg0VvpxegSH9iY9Fv93ZAbEYEV/HcDfeHSOzLF16oq84cXwPlUqbZE2qPnf7+DA
X-Gm-Gg: AYBFou2bCV3qmTAIkmXquZ/OcONRCuBDbKs0qFm5/qKc+M70hRpoqxvp7cH3PB8ww4W
	IDXdX1VEBk/5M2tGGMDDu3LjEL7LViKQ9t1ugRP7Wb9peGBSfxTwaPhzQ99qA/EFHxcDcVV+F2T
	YnFvLrQQ8HI61BZJzMJMuGu9SsYPvKJTPygEJrCSX3BGnnlg+TC68yAsSfbUULvOE1c5+Xekd6/
	etDxZDGlpBzP6FUPIoNb7O9zQ4eCZevgOGJ7TEB5i/5V/DVXsge9pJO4evaZAh7UvHdaEFRB/nc
	KfTWfpds3F4K/2vj6uVa6T3hQoAJwVwc6GWxMLiez12hHDIspOVTO+cg0xD8049rQZiTW9zb+7F
	GcwjtrR7RxaSO
X-Received: by 2002:a05:620a:8009:b0:93b:d79a:c465 with SMTP id af79cd13be357-93c43e0fbf8mr320420985a.61.1790326009866;
        Fri, 25 Sep 2026 01:46:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8009:b0:93b:d79a:c465 with SMTP id af79cd13be357-93c43e0fbf8mr320418385a.61.1790326009352;
        Fri, 25 Sep 2026 01:46:49 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/4] dt-bindings: clock: Add LPASSCC and reset controller for Glymur
Date: Fri, 25 Sep 2026 09:46:33 +0100
Message-ID: <20260925084635.112399-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfXwoUNbeK0c2aA
 05H6QbgYeXmpW9Wjy7sCVprEkm+bLZxztsph/dxycge3pSFxfL2EOXeb5ITGdlFa0LIW8d5T8lL
 1zxpUfO72Sg8VWzlpLvklMAtESUl4J8=
X-Proofpoint-GUID: WyS1Mr81urPlvmC2LlgTiEj53c4qvJo6
X-Proofpoint-ORIG-GUID: WyS1Mr81urPlvmC2LlgTiEj53c4qvJo6
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab634fa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-l7Lzzg0JijIaF3KBckA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX8NPQuL5ik+IY
 LixQKfkUU4GwOxMbprb7q+165r/1Od5u5Wr4qaq/Bf+1WrEQxJW9Oz6bJBaFbyW8CDXI184vQ7E
 KRjE2FG75cfjSKKW3O5ni238ZXOkYKmLb5aLRPI7TPkydQTpCrb/lrIJTP9maXKVY/w3i9uk/wf
 usZFqdgnAYj1XfvcnB4tp3tMnv30g8f4mQYHuivITBURJlX9ByvfPgZAqQFAKElCZJx9Ai40/+5
 Q/sZRtlpodC7TnnyEMJEZPU9y9GPMDxR6nqZ/nXegiSqw6nqZres1Nqc6DBwU0d0jxr65wFfKub
 U+2mhKRh8MNHvGiqt7PCEeIe7xLguquqoNpCHTvivLsFnScfqhl+uqmynea3mFQnTkcPf4sRsQT
 3iu1XT+oVkvebOvGYTpiKlLJRgzw6dfkK05e/LoQ9jk9nE0txAqRB+VnJ93g18eDeNwu2A90p42
 ML5/NzBWMB2HOD3fScA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

The LPASS (Low Power Audio Subsystem) clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-lpasscc.yaml | 10 ++++++++++
 include/dt-bindings/clock/qcom,glymur-lpasscc.h        |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
index c047c0174a93..916ab1b3dbee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-lpassaudiocc
+      - qcom,glymur-lpasscc
 
   reg:
     maxItems: 1
@@ -47,4 +48,13 @@ examples:
         #clock-cells = <1>;
         #reset-cells = <1>;
     };
+
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpasscc: clock-controller@33e0000 {
+        compatible = "qcom,glymur-lpasscc";
+        reg = <0x033e0000 0x12000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
 ...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

