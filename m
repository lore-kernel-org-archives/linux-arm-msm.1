Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952017;
	b=1toy8EqYx1DtqYILkD11kcgzMx4TxrNjJQK92WnKiyLeifdXCtvcLaLbgByNwSiQ9Jp3
	 NJV6k+/eQoFamhXDX2lhjU6EAPhhKqGAqSiAAIWtU/BRqOPs9Pklmh/4B1o4uo9zUFGz3
	 BJazU0nhAhoU6P6Cpwg7CnMC7bpfDakHv68ntNJ7a5b/vldQdv+x9hy940p/m6tzlmCG+
	 Rd68oRb/l5tSjXJad84uhQwgHj4ghOJDTlcBNDH8zk3wqFafIAjCiAqpnHRJmnJRXD/PG
	 9nI0LeLVo2IWINdS2Kp7r2vwEd5XuF9q74cWvt0jOR9nDB6DbthVmxB3BWv2dxk+KPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
	b=HsThJuuO1HF0p1Jv7wdpxMyEjtsAxWF/zGkHd23sEEvD/5mEmtDnuK+4JzlGm//TyEP/
	 su46g8w+JBQKIlOhCMnx7aJX3A6j3J3xoN+TrfccmaPyE/2n1XJlxwHm/Crv/qP+sn0a/
	 p5qp7euAn7NsIMNePq3vFtHv71Pk5HNSXbsP9fyJ7zTQjsNue/1nmSIyM4bPaiuRMtW+X
	 n42ShOhtc7zfAXLOp4GggNeBL1WVN8FTDBJ1pwBRBnZns6VDYFvllOek4BsQ56v1TH2MT
	 WgOckDlkcrGmh9QAuGIIIFnFUbRxTTcXRJA7v0aVJ3gU4dNEq25JTh5XEh3iJJpySjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gC4ka6wv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+hXPl6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698816082BD5
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 698816082BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gC4ka6wv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+hXPl6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RkFA3883394
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=; b=gC4ka6wvvexq3Eu0
	A8JxHpN5jaGWmirVAolVsqLvMcdmwIap1vspNRy0s+jHuDvekHoidn72sFdwBx16
	bJO07CJq4C9vGt/GBELk79ytBriG8pfUljeYFbl6K1e75qDIJloPdKEDd60yRo8t
	Y//fkfZvDNafbU+f7UAjIk+Gd1tq3MFETLNJ+OloDV8kZNwfUietf4EogX1BhJwk
	yCOVyvg6RBsZawfhg34uTjT3ubDT9kAFNyVBqgJeSH+PA/5epwO3yK4fmNVEdSBE
	4pOHytjyfXVjy3qK+koWV2s0F4nbGJa6tFwCDrHGDuJbBOFndqDwbe/9DbkO7DGB
	ff2tgA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb1r05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:00:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89e05d31e54so297578b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952010; x=1794556810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
        b=ib+hXPl6S7u31rGkVQebZyJV2wnIcYQLMP3qX4z5T5gbZcbBA2SlTALlOld2aWwqft
         aXKWARs6vRunH6/qolzrMFvrkib+yoZn6g8cAi9ex/iJ+KpLUQCkiHY5JRSw30eB1+CB
         +fIGIFbEoc01FiWX5QWOarC5Pidsaz7st0AoQle9c3KimFmsr2eNpamM/79Z//OPXNpG
         mlkFxF199g4MH8MRroLCEw8lQfBqdyOtWOfcMDtBv+VJnM7/NDji2PB6ILg4EHIMTT6c
         2YlERtted8zqeIXsJpTMa3h3qwLLR7oY4Btt67J6jiFZkJzcvXts6EmBOFteGhEKV4X3
         dEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952010; x=1794556810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
        b=ghIa3r4RbaZo34mRRqb9iY2lTP3b/rHI18mFCk2UjZgprPwvjhxbvu6/P2bUz0goWe
         9Ei4sLHZv3x5ZJhJ1wMtg9OH8PRSzjd1bPhsmevwvY5Mq8sAmXkzQKBqQvTavJuqKs2M
         fb0K6OeEtozWs6tkDKMTWvx6x5bCqWQldAUPT6wMx0YTa4dqqoSVRcAsE744lV53AXZq
         si4yDKaETutzyuZE8B78uETdd331aAOcOIbprKjbcbEgHBFQjRJLOcpLTscmA+ouhHPN
         S3NVHK79da05NSJsq3OTOiDUfuhMyq/h2rLSdzCRMoWumSK2bi0F1Fvjlyf3NoHjwckv
         dKoA==
X-Gm-Message-State: APuU4Z8ytlfV+aYMWKcWIzCVOytbJNwHaqN4J1Mrzv3+eaHZZ/wT/Wsq
	5RKDNRGGXpLml3UW5c17sfuYYRPZO2CvsCfBzvghsn6n8gfUpo4zXFgUb/DlP4Hdq/lyCVOfXLU
	3/gtmjERwbrcsBI1lrW91i2byE9UlCb5dmXTKukQlJ7cLnRfgHwvbXu0KGgjFdRHeWJHA
X-Gm-Gg: AYBFou2kzTBhh9QGWi1yLVrzObOiF2XfyzRdUm18Q6u3fb22opylzIlUfvL/e1b/gzX
	CO+PItC8nybTzJadkSF73oi1irG3Xh6QK+rt0gK7aJpf0chMWrsoMdH96MSlnZj/JeW1czLj0XO
	voPpEQ53llvkXcwpM1g4AFpJ6rHKFBM5eUnzptaDZgdldUNNjoB0FsujypsHT/9zS51sINICVhj
	iWYmvmcd5heARm7ugi5SAJfgrXwmej6hji2WDMVYobBG6thShYfNMNgdcRxE1BOcRzWPe0mEXfi
	ht4tbWpx5Pp/k4QLeOO4w12XFJwxoTN4qsaj+qb0d+XgMixJSRectZtmOjnRYsZk3z9Xni5FDlM
	fyGdxDuCvXpddKfaGcbQDKRDJwpEmLIv07zaihEVYJD3i1jnpJu2A93/M3a+x4WxUlYVaSYhe3w
	OBaTjb+BJC6ehKuX2TQesIT33JwPn/TOnicV8VxcBsraHa5pWVjKA6RmkIbv7bQZkEN7nd
X-Received: by 2002:a05:6a21:4983:b0:3de:b0cc:b0ed with SMTP id adf61e73a8af0-3ebb298a8bcmr1772185637.18.1793952009809;
        Fri, 06 Nov 2026 00:00:09 -0800 (PST)
X-Received: by 2002:a05:6a21:4983:b0:3de:b0cc:b0ed with SMTP id adf61e73a8af0-3ebb298a8bcmr1772159637.18.1793952009345;
        Fri, 06 Nov 2026 00:00:09 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359dd36d3sm354529b3a.37.2026.11.06.00.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:08 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:29:41 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
In-Reply-To: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793952000; l=1463;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=v1VwzLIVBJen4A0nAYBoJxmCuCj+Ao+KApsK3wQ2L8c=;
 b=3MRGkfYYbz1vuQJwnIQLL672bkTkOf5vmz40JpS3zxg8k4EEjIuNsZEYz0lalZTfJbetjMGr4
 87pSXFms3NeAwtmca8YzIgsmXdJPY5fLe+mBtDylQlwmUPGfKh6+tLO
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-GUID: 9YemnzAr6FN6w9ePqOCUu0NFIYPm0BB_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX6x9NkwJPXLIs
 hw6uYkd0h8thnGdWq1II/vweBqnZrqPIpGTiuBVC+/Ra8wZ0suFafjtyqjA+Npc1OOnBO0FEBED
 BtF0EZ0DaDz3jRJTSa+jftoq6eanVDc=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed890a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FfQU36pP55OiWfDkhZYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 9YemnzAr6FN6w9ePqOCUu0NFIYPm0BB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX+fRFRHDb1/XJ
 fgtT77GM7gbVI0N+tVxJPD3Gx8GrKiDlpUeKdf0T/kh10NXCgeZGMFR9PONh+03ntzMWQUm5Qvr
 kNzXdeZ8tUrgx5ycuTGK76J0ecHrejgzAOthdkx+q60Q7U8dKU226yEq3FAz2cgenpcnu3a7Le9
 PENXCIeuTaIdItCDsDwOVfnbfMWfpYulqZ5sgQp+Z8hRLVUZC+T4/TN1KITQ+JAC1K2KP84ysYP
 3b6iEp8qOXTDbNUhMzWL8tFa+cUvjI602xMuR9hRgd4PpPvWCBC3TulBd5QHsIcfxc+XOQWPJGx
 RISjYIsMwsg/EBO+IhRMeLe3MMj1Nh1TuMGd2rQI1xzAztTelJbBULV7dSMvbpqU9VNR7hImR9P
 7F+G7N5m2hKoVC5aGdgCR8T2HZWqacXrsfrBYQKpAgXJWhz7Cv5G4rUJN5evuxAJWrHagaynGIM
 /aEgJGBj8xnwullDymw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060031

Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
be owned by remote island io independently of the selected mux function
even if function is non-egpio.

Presently egpio is treated as a mux function level decision where as
hardware programming guide(hpg) specifies it as pin conf level decision
i.e setting egpio bit is independent of selected mux function, the
driver/apps claims the ownership of the pin if it's egpio capable in
case of mux function being specified as anything other than egpio.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aec72e8c0621..d7ea3eb4e124 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -87,6 +87,13 @@ $defs:
       output-high: true
       output-low: true
 
+      qcom,remote-owned:
+        type: boolean
+        description:
+          Hand the specified pins over to their remote eGPIO owner. Only
+          valid for eGPIO capable pins, and leaves the mux function
+          untouched.
+
     allOf:
       - $ref: pincfg-node.yaml#
       - $ref: pinmux-node.yaml#

-- 
2.34.1

