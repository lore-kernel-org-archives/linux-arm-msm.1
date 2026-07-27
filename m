Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF7437F8CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161872; cv=none; b=j8ykDCHlEOodVOLDQyS1hTenAG89gXr6orSsLCh6FB2lgo7ChNL+uBlks7RocT9eK3IbonZpclR9Ghn33/rAj7C2l/dTFE7x4b2pjUCfwS2q1g7f8KttJVdbKe0MTtWIX1BoIegFptMDqtYEDwm+8p7m4StN83r9uxmoAY8Gx5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161872; c=relaxed/simple;
	bh=EL/4eWTwjkm8xplDGr8AoG/Scm4IGdWMzXfh0yWIKn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZB0xxcqsRZYfjwobPkXerfrCf+rYtwaGp7PoFW4SnWjHFzrk3PDrdHjIiEaR5FKzzkDUS+jwdAHkQv3ris4luaIXL2B47q+dLjzcDSzDrzkwOCYX2WbmByyioTV52gb/hPphpCu7dcO38ir7suW3AiKZigRECqGa5B5qbKSbJTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOGaJTWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iolVIKOP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOGaJTWd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iolVIKOP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDldVF3895621
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gClqkjqiHqFhBZFkbkinkb
	63YZ30NvsyngCcWK6ljJg=; b=EOGaJTWd0x1+umy2B63VE37WqhQ8Z/V8CFZ6C2
	0uougy7tc8OHmpEMp74EPB3/+yTmEs2qb+O6h8qoMIJRBKo+vvwPuOjPMv0r/D4h
	P2Gv//2Cr1zmW8R9qhbL/gadiWqAY1FSKwZgY4vNxqr1KFowh3V2TtDtD4Vi62TT
	ABUf030y3Z8IVR4Yzz+UqSthrjDtGvFNnCAarXNzAfdJXqSRYOcjBN/bdl8sIV3V
	SIqYdaQ5nD+RdfccZvMDEpT/RwPQoLIiEwQmdvO5/jYY+/QDpSnwcvmvvAZg8D1d
	gN8Ms1tCfBtFYp3PDdARt9o35ONhCxEpQ3n/tQtygA+xn2jA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs2yf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:17:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so35948275ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161869; x=1785766669; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gClqkjqiHqFhBZFkbkinkb63YZ30NvsyngCcWK6ljJg=;
        b=iolVIKOPhg85NT9bVB2AGeNA9UKGmBumVud7VyfW1h7pYwI6CHIeQXfD7/pJlBMTaT
         vtgk4h9VnkdUQrFjT7fp0vVAlp7ehQpniVtqouCsnfrNEWd22duZOD0fWcDZI9mwRXWW
         0evceTT9uhgoFHATVlV+BWcChOcj0l7T0ZAsTIIOLSEUzjdbt47T73/UXbW7ETqS2qnG
         hhP0hkMv1ij3QFbxt8D+26Rj5hlUENXgP7vr/VEHFacidD1AhPDOFfNBG+51pFxxELyx
         V5+lnLaEu34iqxNzKnBPRMILkiTHDdGaGW2r7xRA6sVeoi21/aYm06CaA/PoACRkBS6m
         8njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161869; x=1785766669;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gClqkjqiHqFhBZFkbkinkb63YZ30NvsyngCcWK6ljJg=;
        b=jLHzb0MHLNaK5lSoETrUkDSTrd5M/XdM5EtDWY2JGrKjWws/hv5F0ifcMjuYlSJAcc
         7uFfes4mn0WIXLHTdocGyiJ1+LEM8SdOoQv3gwnGbWnXeWK4ltb8JYU4QrhiMNvioSbk
         GXVEDYD2MEc8MypfwVzQ4eCyHT/MoJw4SuGNGftqK59JQreLc0Zz2JeDaz0x4/sWjXs9
         DEXtkiW1pJBHZSbfOa21Lggv7R2r7fKAgcGw0ZhPGbYHI/8lZcwkTuwoH4xzWRh+Rhr4
         XpDZfrpYiPjfbTZVlIJG9fSZW3abZEU9ACd8Kh3fL7j4HHVaQCjGLAhIcJezjPL8NbFt
         4ttg==
X-Gm-Message-State: AOJu0YzdbgBnVZG9rqOs8UtzYEhCrRx9HqaazWTqWiju6UfSKQGoVHxJ
	g8ZJ7enfDxRV8eRev37AOJHtGqt/1rAed1QLvdl4N0728N9MiF0MVYrIcxKepyffXlBRlv0CO11
	9X7owGfKQqrUwDwDuNpuUpc0pqZaELBenFzPi2uzNsq4CsZUroYR3OYZsXn3sRDi52IcA
X-Gm-Gg: AR+sD1037MWztNnAfa3g/BwzNMOqwbAuBQNJK8ZwayLzUPK00iOYBixsgstx7te2RMR
	qXAzwT0LPEjuyGsrQRGJUK42Zc1tj/BFlr6O3U1jPHYM0kYvSelOObp8adDGuFciq8mG0B2cxrk
	9+m4P3b7k9weGbey6ryndb38urFZllOP2e9QntB2XEk9HguhqVe/h8M63wHc/geAiel5pPRYqGt
	GgLsHWo4wA44a/IFr2yM+e5rfWa/6YQj9KN5Aer0iXWVfhhgHgLPRHWzenxHUzZnFq9VJUudC2a
	bX3SIqw9Mrjcb4qw3r6ybPdqkNvXZ4ad0EBd/G5rnSq8yXKKA6lyW+zkSPbd22me0NLTUkiW8Y3
	jAInIGCzl1jAMQYuIY6tJhUYJQwM9iStUzRhA
X-Received: by 2002:a17:902:e54c:b0:2c6:9f6a:9f6f with SMTP id d9443c01a7336-2cfde84e327mr84013525ad.28.1785161868589;
        Mon, 27 Jul 2026 07:17:48 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2c6:9f6a:9f6f with SMTP id d9443c01a7336-2cfde84e327mr84013195ad.28.1785161868164;
        Mon, 27 Jul 2026 07:17:48 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e86ccsm35996175ad.33.2026.07.27.07.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:17:47 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:47:33 +0530
Subject: [PATCH] dt-bindings: remoteproc: qcom,shikra-pas: Allow bam-dmux
 subnode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH1oZ2oC/x3MwQpAQBAA0F/RnE2xxeJX5DBrB5Ms7URK/t3m+
 C7vAeUorNBlD0S+RGUPCWWewbhQmBnFJ4MpTF1YY1EXWSPhQYqONvTbeaOT4CXMaBqq3dTaprI
 jpOGIPMn97/3wvh+YqrHrbQAAAA==
X-Change-ID: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, kernel@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        deepak.singh@oss.qualcomm.com,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785161863; l=1646;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=EL/4eWTwjkm8xplDGr8AoG/Scm4IGdWMzXfh0yWIKn4=;
 b=eEfDdsANMjLiupiV0PDNgc7x2h8W2i0cXnwNxin981/QC0rkaUhbwihNGPas7jjg+OrRJtRR2
 Vx+hHnh7KufC1F6hbv13QBRG+Q2/LPZ5VODHs7p2XHwhe8yN7OVV5Fs
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX/VdXrWyqYL3c
 dpFSmb4EuAOz82ls+lqFxgw9dFX3R8jogChUgfeF9oIF9Bm5liZhJtvmz5tpVOndogtr8SmBSs7
 YHIbITPR4++fooCnT076HztOYk/AfT7VQK4tkITk/NID4WZwwvbr8PhNcAukWXX1CgfBzie0N1t
 wYn492WiXMF17y3+ijda2gTbqZCLl+YLwi/zBuHoUg+NlLEarUPzJeQWPs9uXvb40MNS7VaxprG
 2/qMIbbjcA6RooQxSaAz1cTYIaFyB0Of18x39/SgbLA16tnBeGi5Bh6e/JNlqVWOra5XGTy7SOj
 ApM9IpcuUMR0PI2C4p+U8QGpOX2PVdC0aJA0ya/IU9CNqFDqu0GkxvI55ZyCK89thWtYslcwavL
 rcAE0Dn+5cQssSORy5iHjXiMFAlPjQuPvcI811gdbSv5Vujzc5hdkEncPZJd4dkEmqoDEynn1KO
 10ti07DMGsYK/D6wnkA==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a67688d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_1r_K6HTJPIHNRSKaTsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: gVI7QGayIY9N6iliZowHA_9zLhcUZohm
X-Proofpoint-GUID: gVI7QGayIY9N6iliZowHA_9zLhcUZohm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX4KIMMMon0r1u
 CT8miSSZo8CofplftAwS/CntgjWBzAJeUdD2SotkWPvuYijv+A5TrNixBDiVoG2XiQFzsQb+c1K
 o7zYwqp0cJCWN6ZsdBZ+4dM4r8ss5/s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270135

The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
does not list bam-dmux, so any DT adding this subnode fails schema
validation.

Add an optional bam-dmux property referencing qcom,bam-dmux.yaml,
mirroring qcom,msm8916-mss-pil.yaml.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 253b14eb2b598f0ca91854c8ff4d0b785090e621..17461d92165b26eb669809ed7dcdf029530c9223 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -44,6 +44,11 @@ properties:
       - description: Firmware name of the Hexagon core
       - description: Firmware name of the Hexagon Devicetree
 
+  bam-dmux:
+    $ref: /schemas/net/qcom,bam-dmux.yaml#
+    description:
+      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

