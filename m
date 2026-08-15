Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9B041A931
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800357; cv=none; b=o/hcxoS6KvUecvx3XABoHIGiJgIEPp9JEau/AycZzraPNGJIYftV1ML7Sgkt4P307Tml/s3CxH3veoH8SDLiNOWyNNltkUsmQwkqzXkyUBbyRnEQY5aoQLz9yE6eiYKp9dBBXzC4cI3JJAVLjy/vffgw8BNqBoCrJNsico+W0yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800357; c=relaxed/simple;
	bh=QfGSFGB2zUjQpsQr9TXhbDCh5TDz42RLzw1jqZANOg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6oae6l+NDWoANDxXZf31F7UGsRcUosl9I3Ydc9NXJYwCvr3yyWQEK/7HstvzbjhwsUMd40yjg5KrTYNHcffUISRgLEhw2+kihXw9BJjjTDRtQYpQl0VHEjOkk4lZoEIJTixrAZU93pdRwzx2AhVmmduacznUFl+FSyP4VASWPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4wl1OrE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kp6HHZNQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4wl1OrE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kp6HHZNQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDMZrD219370
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nn+nmVjR3Vk
	7Fg6ZHUBKdnc9okFTEAK8UP/Bxa+B2zA=; b=n4wl1OrEpXCV1JNkjJXrepFx87O
	3Qte7hMwYJpMJBhBnBvuqrfl3ZasVCklQro5CStLrxHNh0KJXLHDKk564AQTUGb6
	y45U1TGRH3vIzaAGSQycqT2Jl4wRKVr1he6k0j5GJvLLbpeEjfbjcWWoD+1lVGFj
	iORjk3rUOT4yblKK3CAq4YAk/D2A/hSX/jkDKTNLQptU3rZnnHFhtI+vR7wHgOL4
	LcyPbAOmQqmKWD5Mu0sMNJ97wVU3rabt3ghEdm3bMrRncx8YWUJE+PMPGfRTO/5n
	m7VBo//OrPGZ9TO4FNf5a47asdjWUQLIDbE5kEw0rSmL8adSJo1+TxJ5CsA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7rvqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:25:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfe48ca1efso24978165ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800354; x=1787405154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nn+nmVjR3Vk7Fg6ZHUBKdnc9okFTEAK8UP/Bxa+B2zA=;
        b=kp6HHZNQ/wGLYyaVAKR0IKoyu9GQUb4kOjOFJPz1H2hFXHQq0QYNg6fwHMLGJsAKdv
         qrHvTOSIjJtQBIG0zV4XHainKm9+dgs/B89hIZe+W2tJ2phjkZC0fUNzRZ6YwGoogTtZ
         Eil/LCjurazMUx5QvIHmY0L/+oKl6irFviYhTEqiVNnRt4nRE7J1Ne40iu3IJUXzhWGb
         PRvS8VCTNXOdx0DAUtsk7pmPrc0k01npuaC20kN58CxYt0uY88TlswESMrZ92tx2kxTK
         PICP3+h1koQdXyllx+DULpzlsngujkcm2aWZ0q4dW4+SPx2nXj9DFyj+YmPalNtQbvAV
         S1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800354; x=1787405154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nn+nmVjR3Vk7Fg6ZHUBKdnc9okFTEAK8UP/Bxa+B2zA=;
        b=p9rSuBM1woJjxhzb1LDq57DksDLtnJNohuc276XnCOZjiUeOxCEtzTdQgC2dweG/Ur
         y9s/ZknDl1ejNN/sZwh6ybp4qKRy5QKvkeaBvlAMoMjT0xCLPKl0nnsu4h5tIBpQnwi6
         PBhgqBDJJj2FVkNCJZtKShqFrmAMrjBC2Z0dF8AaB2Ai8Q5r7hw+tY4Keje26YA1KbE1
         x09nO9wFwNmOIv0O74uhmGH7TVW1kaUNsGPHEfvpeMgp96KZWyTDC2yBO/i5T5Rlq2OC
         amPEtjTHUNqsSU3d3mdBTtMZAekoJLQjRnE1dHaC2mkKGOGP9t7CEkViF159Uh9XTghC
         IQXg==
X-Forwarded-Encrypted: i=1; AHgh+Rre0i+y5IoOyJ6burFfY2VHA7pwnHMQB1dbssfuWW+DwxQUo9P2+dv8jKhtoyacsOEgvitvKL1TuNljen75@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2fNF9yLimUUl8tQbzz55z/l0pwTyJJyov4PdEG4OoOG2IYAqr
	GX9vznGVSFZani7jrp6+EESwA+bYnEAy2dOWVTnhE0XkX1oAQjMJcPnR9/YTrgxEU9WsEMWYy4I
	Wy80iSovHdgj3lzF7PHQU/fGDZBqu6e90EMcVge3xLb0zMFLB5wudn2ce3M1BHmQZIuzD
X-Gm-Gg: AR+sD13Ro+smzedZfwe1rcSmb8v36c2QNCnIABCW5t+BBXvueRo6lBjHnLxynUXsE0P
	vXJJ6mC3vYuHD6RiUn2iHFX1+bXzgws2EkiYQDTTHcaI+CSrcvhBKw8fQXTR++7uwtGLUkaXJzi
	0Z6+rd+dTxPsSDy+NQPXXWNKFQt3d0YwbBQsOm8zn8Aju7cWw2zKKrSZihEVvgOC6RfTxM6rpl/
	9+we8qg3mfAUMkpEhZBz8il2A+175n6OZbDPobVn0JdYII468YzUXRhrNWFs60hWLL2aOXmle+d
	AzCSSA153jBGesFqT+v77mC5wiHgXVsVLG4mM6B0WVGzS2B1FIbBE5LAX4PrIuBORzh+f83EjKS
	HA/3Okv59MxnF1FVGExKAvJfG38+ekUYZHYU7sugBbaU0lvII3aufKZA6AK2V
X-Received: by 2002:a05:6a20:d808:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3cc71e3381cmr15339876637.33.1786800354436;
        Sat, 15 Aug 2026 06:25:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:d808:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3cc71e3381cmr15339838637.33.1786800354021;
        Sat, 15 Aug 2026 06:25:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:25:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/8] dt-bindings: remoteproc: qcom,nord-pas: Add qcom,cluster-root property
Date: Sat, 15 Aug 2026 21:25:34 +0800
Message-ID: <20260815132541.1575121-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX0xHmBQQeH+Ii
 DKpog+3RO3SOYny9qIN+NQDHUHGJp73XvamhsB9N5ZBwjPMhHTEywkD5whaUCpq0b9Xo6wfZHun
 sLqZdwcU75FjnozdgD0AaUz9LtyuSkUi3WJ7dpCm+7w4a9ftMIL+ZW1YWVo5w+jDD+ThgEz6/K1
 NbhKExjuP23IUUxVSV9/A6b9hZTpMHRpygFR86GYOD9Sn+QXAjO+pGVpMFpk8aE3orqmHRsaNWC
 ksWZc3RgeigBWs9Am1UiR5xQCQzmge+Akzu2+Ksjkwr+vkbAKa5KACxzHlWvV2TACb+MR7u8BY+
 JoAJP1apcove6NOMTQhIPAZYCb8NTbmP9QhVSfEZGFR+0m/8aPRaEVS1WsUxj/LTourIckMI64H
 xlUofjijauKGamcwpksldJPeM8KF0/hOiVHUmOZMFkZuGzfORnP//wK9xb6ZFyNzc2wph5Xcrdf
 GIYrzfxfTiHoT7UFVkQ==
X-Proofpoint-GUID: JgKyNU56GMgSYI4Z22o4Lv_F7uupZkbG
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a8068e3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JpIEW95_PAHRj95Iza8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: JgKyNU56GMgSYI4Z22o4Lv_F7uupZkbG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX1UBpKHtCR0E7
 k3NM/eMFrlDNMOYRbPoDUpCci05Els8aAiHZmCYSW56FACfB64tKWhNXhjx3/wvDi2rNa0+IXUG
 z9T73okavX/IzpDRc2ThZmNZ92CoJKE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

Document the qcom,cluster-root phandle property used to describe HPASS's
ADSP0/1/2 cluster relationship. Every member of a cluster carries the
property, including the instance owning the shared resources, which
references itself; instances referencing the same node form one cluster
that boots in order and is torn down as a single unit.

The relationship is described with a phandle rather than by containment
in a parent node, as ti,k3-r5f-rproc and xlnx,zynqmp-r5fss do, because
the hardware does not express it by containment either: the three QDSP6SS
blocks are register-independent, with no shared register window for a
container node to describe.

Also add the qcom,nord-adsp1-pas and qcom,nord-adsp2-pas compatible
strings used by the non-root cluster members.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,nord-pas.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
index e90d2953ba69..58d88cb07e52 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     enum:
       - qcom,nord-adsp-pas
+      - qcom,nord-adsp1-pas
+      - qcom,nord-adsp2-pas
       - qcom,nord-cdsp0-pas
       - qcom,nord-cdsp1-pas
       - qcom,nord-cdsp2-pas
@@ -89,6 +91,19 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  qcom,cluster-root:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Reference to the Peripheral Authentication Service instance that owns the
+      resources shared across this DSP's cluster. HPASS shares clock/reset/NoC
+      resources between its ADSP0/1/2 QDSP6 instances, and the owning instance
+      (ADSP0) has to boot first to initialize them before ADSP1/ADSP2 can cold
+      boot. Every member of a cluster carries this property, the owning instance
+      included, which references itself; instances whose property references the
+      same node form one cluster. A cluster is always brought down as a single
+      unit; any member crashing or being stopped forces every other member to
+      crash or stop with it.
+
 required:
   - compatible
   - reg
@@ -101,6 +116,8 @@ allOf:
         compatible:
           enum:
             - qcom,nord-adsp-pas
+            - qcom,nord-adsp1-pas
+            - qcom,nord-adsp2-pas
     then:
       properties:
         power-domains:
-- 
2.43.0

