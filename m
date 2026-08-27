Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9248987C
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846918; cv=none; b=SFirFzCz0MMUqfto1Y5YgyCcVP6QKptoWI90oxHUCaE6MFanldpQ2f7gyIVZtd2yyN8tc9LT8hGmm4W8pjLfOReLKrefCY+XExtZluC7LF05Wr2cFVb0/bTvUNd20eLrnn0BviVvHbzBR+rTCMVKn0efS3aDNKUPlip5mJIXK7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846918; c=relaxed/simple;
	bh=Ro1Tw7bimijLX+zSbVZzcIcnTuF4NWioN9yBfIv7fvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrhZKDxwkMLTryxbDPdnPe7mnaNHCAAej5FXJdPT8Jzg9Zdd/R1vqBe9HhmS+GX3dMH964z7QFXiPyVj+BYO/kINwwiVzRZ+Dj7Qr+lRdaELSdh64BeowmG5hm62SuynYO6O5KAro9RXKHdBpDm7BPRgp52OLnJx1liBkkovBMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2BXcxZ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjCATQHE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2BXcxZ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjCATQHE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbsfu163961
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=szEkNwgY771
	Xv6m8T3J/mh1f/ayBeeTB35yTWk5lZdE=; b=c2BXcxZ5dH6V7p/j2Ymmx/kbwuk
	5ypm5J+Gy/Xe/Rzmh16ripn5C4xaaNvcWhKVxilUrwSyL8ZaX1EONIWOJxKjHI6C
	9r8+zMkdIft7vyYF67XPAqAb/fze38RxCGxangfO7+n4KFZc/us+ZyuwC1j8Pr3q
	nXuWhE9t3ykQ9oKvWijc/LsP+z+xEZF0jnxEn6d6IoUsbP/bqvHFOuCzr7iOGEzf
	VCs/kF+aS58KXOsQVJPfBiAwXVM6ag2XRg296GLNCNw+hk8XAYYcFSzNfjV+8JVZ
	KwOz7DPYZ1w7iq4y7PTnCS311Urm9TKF4Q9jj4hYpivdxTMopVBqWIF3hQQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjft3d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso106800a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787846913; x=1788451713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szEkNwgY771Xv6m8T3J/mh1f/ayBeeTB35yTWk5lZdE=;
        b=LjCATQHEOE+D9QJUdFlpEOXKfhBoJHGw2oxoncRikxPXQX5KMNhe2tRqrit69EjHUS
         7Ln2vAer69wf97WczDgOBln0pQTq1hSsGiZOr3cbFk6cL3err7Gz3bp4EoBRGYv0jeXT
         zuYHBM20pVxG0De/1ypb+4fCIYWuORjXARWYo8t/4gTmQ1JMhH8LPSyNdVrE4a3I5i8u
         ex8HV+XFuFX6R1H/PNieyeYJA7eqHgNE9oOngkffSDkLvNYcq3Ryv2GQgpT9WILtC/sR
         MxliyURkpY+PUKebUKGSYzTP3ksClIGgqNbkx05y9m4AXSu4/6UdW5o+VAUySQPhPrIo
         ZYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846913; x=1788451713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szEkNwgY771Xv6m8T3J/mh1f/ayBeeTB35yTWk5lZdE=;
        b=C2lPLebRptVWoths2A1JYvnrxM2naFY4sknMglsfReLVlIHTtNA9v8MDjZ7sosrApe
         3YYHXq2qHP17uuSZIoTILqt1x20i+NoNL7pteFVbXIS61osl+zR6sn79B3uDoTn+9oq9
         t2rIKWXUv0U0w3ROmQb7EjramAcPGWIupm9i/HzZHcfuyEabm4/D9ZawOFIDynXnZKQR
         MDVl7Z2qZQ2xGHIJsBZS/LCTcEeq7xSgu1EyoaUrDKCcDvOLMHsX6ToFrsHnfi+56f8l
         G+1p1h4/AJfKtjvPbJc7s/h5/K0r2lrfDMX0MmqMRjvg2TcoXXdFZTPdX1dCojXVlv5f
         sQMA==
X-Forwarded-Encrypted: i=1; AHgh+Rql6mSQbijBpA6r6tB2XgJOVXgNTqnV2/r6F1pmWb3o+nsSvngxv+3swQ4Jrix1ufHOu8S0TmK7WxY9vYps@vger.kernel.org
X-Gm-Message-State: AFuF++lBEnNPddD12UoKG+AfIwmN2YpHC0TzdWrSoLCly/2jZMcwzOtU
	ezx1159mNbecwJJenG5GjXLPKSTepS22IuIVXtDY3LgoVKunutyNJFk19PzUbGAPK0kMq7IgPPM
	LUvCRL3oDGSe0ddCvQTD24TL96ErOi7EhZAoLe4sEmkEKrHHjxFHmzqSfUzW1m5zCRtXl
X-Gm-Gg: AR+sD120JTUdv81qjg2v/zbLMXHB12hUAQ6v+cMvhjQkFZLNEwP3X5sL7YaSajS37W7
	xAGEhTY5hE4TAmkxgTgXtNtvymOnPeca7M6TVsiiz3sMn4fCwyFkQWgb55FrkAv3FCAYuSJ+bI8
	otqLj5XzoLfCHTozhtfu8sby10raaryBtRzK5zqfiNPwQGy+X+L6vSrTSv+YutB5ijCtb0FU5+t
	2shubYwvfImCygFRLCWRRZSimErBylF86C91BsJzMiLU88Uey3SifIp9izltriFdgOevdUOf+Ah
	eJiJEklnxl0Ina2w3RAzp7TgJyu2ilZtCwoFNDsQ36A4tdHwDK05IcnWixmIUXA7Z6Ua+dt7508
	i/dOKYPizZ79z0q1peFLiqiUVjC8ic2u0Eg/xuYiWaUPVEfZzKsxcOM0PZpQ=
X-Received: by 2002:a17:90b:3c47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-396d0e27e11mr634889a91.1.1787846910312;
        Thu, 27 Aug 2026 09:08:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3c47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-396d0e27e11mr634645a91.1.1787846909524;
        Thu, 27 Aug 2026 09:08:29 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm3245892a91.12.2026.08.27.09.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:08:29 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/11] dt-bindings: soc: qcom: add binding for qcom,crypto-virt
Date: Thu, 27 Aug 2026 09:07:13 -0700
Message-ID: <20260827160806.1295313-5-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WMD4TnILRj8Rn5IWDftHQqaliW1qskpo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX5q/LtMx/sM1U
 KEMMLEbbvTT7mQ3qactOZpqyZEjsaCT+lZbhl2NUZWBLJdDiaazlkQDPaQrjFGWoAXyg5GLUNHQ
 dn8z3ZllvUD4Cju4SLP7Zkkrmk5pSZYg7Rui7XYy5lTDVE9jsELrTQ1MHmvFMsmHGZFQaJcdHOL
 XMeuJ2wbsD3Rt2nvuPyyA5zkyvCTIfR/J9MsAiErI8Mk3/Gq0Gs08wECNP8yIgKuu8/Tv5y30zZ
 WxWSMIY/07TpNZN6y1mRQcbHgOil8czvb9iEsEiGkY42jVB4zGUR8JK55r33BCpYHVebsZ5uV0y
 6dfDFK/4n7PIq8/jlPur/qC8gfrwdCEmYdujsEXrVyYim3qo3LqOZEbXhM+a3eaYkzE0EqVR9PL
 RHqVG2Kebtecj6Quzy3OAH2t7ZH7GUaIPBrGvXse4YlmlFmjDZSRB+F0yg3kLcGtwl1F65nIwbT
 y0AkaedLuU/R3L54XAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfXwFXbhxF38l6t
 HzD5npEIIIsOyc2dOeORZ5zTaiQC4zmmlMd/JbIvorbEEX7TaojjikXRR3TwXChT2LFuKjJPvZ0
 Tp461PNol2J9I3yp0UWT2Wyg9EiDJIc=
X-Proofpoint-GUID: WMD4TnILRj8Rn5IWDftHQqaliW1qskpo
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a906101 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=S71HXAmslS2k5ljwlz8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270136

From: linlzhan <linlin.zhang@oss.qualcomm.com>

Document the device tree binding for the Qualcomm GVM crypto-virt node,
which provides the wrapped-key buffer size needed by the QCOM_CRYPTO_VIRT
driver to perform hardware-wrapped-key SCM operations backing virtio_blk's
inline crypto layer.

The host does not report this size over virtio, so it is supplied via DT
through the optional qcom,wrapped-key-size property.

Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,crypto-virt.yaml   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml
new file mode 100644
index 000000000000..5eb204f29762
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,crypto-virt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QCOM GVM Crypto Virt driver
+
+description: |
+  GVM-side hardware-wrapped-key SCM operations backing virtio_blk's inline
+  crypto layer. The host does not report a wrapped key size over virtio, so
+  it is provided here instead.
+
+maintainers:
+  - Linlin Zhang <linlin.zhang@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,crypto-virt
+
+  qcom,wrapped-key-size:
+    description: |
+      Size, in bytes, of the hardware-wrapped key generated/prepared/imported
+      via SCM calls.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 64
+    maximum: 128
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    crypto_virt {
+        compatible = "qcom,crypto-virt";
+        qcom,wrapped-key-size = <100>;
+    };
-- 
2.34.1

