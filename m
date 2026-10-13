Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C997147ACFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875406; cv=none; b=RTaG3UyLQlO8hk4RSusTOJNAPP7xqetw807TOBgOoDukoXEg4OmCsy7o52pt0TwoMa0/1YMzK+Uq1oD189vxJSF8okMenLHtIdmkattvg+hJ7C0EIJtRciVx33FYJjQL3vtnxwdzd5LizVgSuFgjZnd2W2NkhqrrobJILWLyMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875406; c=relaxed/simple;
	bh=YXk1F50qxeCCVcBtXcFIz7gVKLmlgDjcOyk/TvM7adQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TE0OjYkF/Hn1ro/mJZtapC3jkxRv422nWpSyuHnKPawEYTkeU9CTRIdJLk4DsnoyddN+MMi5HCeDC0LKqlsN4ub+NHkT+0STJwzQXjW1BTvXCThb+JC1WiXDRG/hGykgTNS8o3gBxi4WHD01izctuYjIQxydXMrNONHsCMO6vBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+yFJz80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxQehHeo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+yFJz80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxQehHeo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21DX43054914
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	er7IVFqOrQhE4gOGxRyz0iJFSCkVtseB/xDovrLGub4=; b=F+yFJz80pyWXdWD3
	jDhFvRiVOUyGZHNlHl1xQNyiIwiFbSyo6acUvRl7BqEm7yVSjOC58/UHa6F2kQBK
	kQRNg+02EkoVvU3pCW70Twc0KSxETEYvG6YieHOKEKGqzFAHRB/GS0RTjflVv7OT
	Tl5FyUK7FjHIT3rabBxGZEFuD8j0zw7wUBueWSkTQgwhJR8QF2AyddAskRbNfbnf
	ypnQmbyzr4YDnF6carzBYKxXmGMKjt5em2iWRCmU6BeJVObty5rCkBBYl/Xki6xy
	abAfTBv2z4Bnig7OVsKF545zaZYvWM1BlBZ5LDG04TAsh4CNk1ejLzy6s28LE+eM
	mritSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aetxuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:10:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5410421eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 00:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791875402; x=1792480202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=er7IVFqOrQhE4gOGxRyz0iJFSCkVtseB/xDovrLGub4=;
        b=HxQehHeoSWvUDtTilbFZvfTLvniDkUYASwU3JZCh8OnEtz3hBjVF5SdYG0aBtHqLy2
         okw+7GmVj9npXzTbSc0A9W+XqrBVJXU+HYIgIZXwW6WJ2kGgScGDu1mroFsAr3ipEVkH
         Q29aizHxZqkS88C8ynor5eVupKUPNcCojBbTPFrcm7OhcWfnB/6XfdSPhNKfMzYx6yUZ
         y7uNCMjjhBKpYbOrherAih3CcTdIZf6dfnX7VOkI+FfPS5C5J+dzXq4aWAWxOdq2aeTB
         kcru0/8PvDA/0CkzL+09AMjvG8X+Y8KQy/pv4Z2TY+XPOv3MbmG4WW+jQicqn8862tpE
         DSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875402; x=1792480202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er7IVFqOrQhE4gOGxRyz0iJFSCkVtseB/xDovrLGub4=;
        b=Wp0V1G7eIOD4Wf5Sp5C9Eb/vgqJGiDMtdQaRN6FGHRcLXT61niFEKP8o2iqZEd8qba
         QflcFIMwmIABZYfYR1ZHrr2d7vk2v4AaDB6IuuxqnRvOxoqay8KKYKs6+fG8cexJQaY2
         QP4jGBgeHiwwX/zImViAYaTjzxGhamo+DmFxhkA6KH5+EpBBuyZllwq6l0wXTMe5AMRg
         ZFhv+MSeFfzV0NE4zJG1v1scgs0Oayce6HqWUDLGug+OkCc5Dytxi5CEPeFqrRl60J1p
         2iUsr/QPiTB9CdzjVNoEt18znbKpZFSizbtWH6LGwvWBh0Jd9YpcaTKVyhptga+k43hU
         4rrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJUdIrUp2B75A/PDwdTJ1Ygf1z/InjoZe72lhb6LgqDC/fwYfihxGwfbcQNjUd6HGeQik8ETy6Kky08dz5@vger.kernel.org
X-Gm-Message-State: AFq9FYJGrwqG4I/kNt1FiuRBP4anfeyVfcK6ouNViPYhvfeX0qqCLB2C
	c6Nqt4e7aoDyAtyZujDTT6yrZ072+t7dkVFAa+Tva/ROoTiO8wZqLGdmNTM8pgCJOoFlGeckhYc
	hGkXl+jZoSvsoD60AFvVVCm8k7dANWeeqhiKyG1hsU8112CV4ridjB1TM3DTZRgnYR9kF
X-Gm-Gg: AYBFou3bvm26EOdr6XzXS7AVnJf8YdalBovWlzRUsDB9Y1uo8G73315xig92hiW/891
	3OySCbmgoAY2Mh1qCP1cKnY1JB7ghzkiYSxL7B89MLjJnXd0h30H2tcNzqW+n0Rc/cIG4pBII9A
	O4+bBJlfNJo2krchm2tPgPcD8/vMZfX6j/SOiGvINv56V0bGCAS4DsKG46Oslq3jR4tWNGoxSlr
	0n0nIZKa2bvpNrACsDsoWVGfqEIOsccg3U5swPivqgLMTXOGkHnyvYbngavpCeT+ToaQ8T070mq
	b2uV2+XKj9jZPUMtdHyZjqvawXV0lZeMB00KCEBPxbmDjBAGeVBccajaV3xdRbzZctG+WWL5Sqe
	fiN9tfKWm/aj0s6OvppwdL3gda4alx3xzfpMhUVOM9ihnJwm9goHz4Mw4FnHPpiKARDQgQ4vxj8
	Iv5dlheYKY81nKJR12q8oY1/EWgByOPg==
X-Received: by 2002:a05:7300:e5c4:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-3537e088be4mr16581449eec.18.1791875401572;
        Tue, 13 Oct 2026 00:10:01 -0700 (PDT)
X-Received: by 2002:a05:7300:e5c4:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-3537e088be4mr16581415eec.18.1791875400974;
        Tue, 13 Oct 2026 00:10:00 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm46081248eec.17.2026.10.13.00.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:10:00 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:39:43 +0530
Subject: [PATCH v2 1/3] dt-bindings: interconnect: Add Qualcomm ipq5210
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-icc-v2-1-196b219e25c1@oss.qualcomm.com>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
In-Reply-To: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: xGcRv7z62RwmesqmqaXoNqKVZfh2ijbB
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdd94a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LXs94aH5GLyjx-_FEpEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX88KrCVS8DjCm
 yCes2J2y0Wxlt2mkZTqE8kLFJadmMlypHN4IoqOFOjbZFKhkAyvWjsumEULAK0zcg/FD526BV88
 SJ5PhKFtkObJrLrlcAIq6yDFGFgavnk=
X-Proofpoint-ORIG-GUID: xGcRv7z62RwmesqmqaXoNqKVZfh2ijbB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX2A4Jmoq09KHF
 NDbfwSeACwpvF8q2Omygjxsab8l0JAs0vf+3KiZ2HtCRvaVBZRS+wzcgU8VTnWYPRfudsYtauOY
 Lh/6B+fBbedcxo6ICvOjkvy9sBtkwebhJJRioMpOAxP2V2aB73mTFKcnkbKTZ2ZuslAFbVW7e+p
 dM91f25A4+auVcObwxgj844ClT4OUVkPTdTnotC4EIlb7V4sRpSTiU5wV2AdbIaTrSMneqcbkzM
 Siy9kT4jXlxCbcbUz5QmaqEwXraFzUD/71ynOtwARSdx/S75+B0GaVlELAJr2tj/cyHsHvqU5Mh
 96nViBUdoLsYSFRg2cv5p4M6yGSJCPJmM5Z0FDQzxWVUSY40pIMhGNcCHaq6Z92ZQD8p9zL6lnc
 xN4g+rsE9b6f7CAQVc7Hx6Xqo9sSwJ+BdTw5kWhS1P5IPcpUlIbyp7qEfMQ5xefVqbAp51jZ/dU
 u97XAusITrh7RJvqkvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130028

Add master/slave ids for Qualcomm ipq5210 Network-On-Chip
interfaces. This will be used by the gcc-ipq5210 driver
for providing interconnect services using the icc-clk framework.

Acked-by: Georgi Djakov <djakov@kernel.org>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 include/dt-bindings/interconnect/qcom,ipq5210.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,ipq5210.h b/include/dt-bindings/interconnect/qcom,ipq5210.h
new file mode 100644
index 000000000000..90c0395e4596
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,ipq5210.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef INTERCONNECT_QCOM_IPQ5210_H
+#define INTERCONNECT_QCOM_IPQ5210_H
+
+#define MASTER_CNOC_PCIE0	0
+#define SLAVE_CNOC_PCIE0	1
+#define MASTER_CNOC_PCIE1	2
+#define SLAVE_CNOC_PCIE1	3
+#define MASTER_SNOC_PCIE0	4
+#define SLAVE_SNOC_PCIE0	5
+#define MASTER_SNOC_PCIE1	6
+#define SLAVE_SNOC_PCIE1	7
+#define MASTER_USB		8
+#define SLAVE_USB		9
+
+#endif /* INTERCONNECT_QCOM_IPQ5210_H */

-- 
2.34.1

