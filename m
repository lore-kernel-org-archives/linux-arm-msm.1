Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82062414DE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455423; cv=none; b=Oktc8cOIzIBKe5cBrsiBBAlZX4ReXwd/yTY4ZjUYZVkS44o7mvT1lvt6ZQIXEidMwMl4i/BXH556+jbt5gAL3rnXdnFDyR7H2PYKAt22GUk76re7Fdo7PxEwx8hFLRkjvHrFk04ZWrGozL8Qbpjz0D1UEf9Vfa1mBq0yC4TFI9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455423; c=relaxed/simple;
	bh=N3m1XL0qPMrLpj2KyTA3YfQe/8CjzIGFh9rILUSGz/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTHErwCLqEaOfowfXNlyKO8dINScHtoESKoMWa9CBrZ2dtvmQ9lML/wLb8Fn1G8BUzC7Wal3FtPMcludTAUFfl2+Q/AgFMR93v920h/QGBHzHHqEPybMar1ZxTpdg8dXaLv6uEHagPLArdiL846xg06KtLBmF5TKBewCEC/qW6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pp5HpowA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsjVs4VT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pp5HpowA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsjVs4VT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDXjrU767729
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=; b=pp5HpowAMbgw8XdN
	eTRCiktsKj+M4AUVnmlr4Ynh4R2fkZal+MF4jaJh75PD+rku+wMTVXiAcCBBIQp/
	4qb4z1JUHmrzKUah7TT+dF78K1p883uQMyMPCVduVb3AhdwT1/Cs4PfkA1JYXQsy
	YlKt/HJXuFMycAn1XybF/aZpcmdmGGKnOrEIl1Db8SEnbR7N0CI7Yi/4ALld637f
	fO8oM5J1dq3KBqhUr3ZBfI1k7X90u7J2kQX29RMaXsRikf6bLtEf1snyY1MTEtwQ
	290K+amicVP0mfBsoRX9tV1e8LWkay5p+QWg18z0VfI/MjLyNwCq5E9URUpoCAJk
	Lp8IgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc0r1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:36:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so40375145ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455392; x=1787060192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=;
        b=BsjVs4VTrzg9f9+tGkyd5igPCiGQasoycvCVTw6bfUzoXSO2irpplM+uyIu3FJBXnJ
         WLdPy8FiCoW9hTWv92D3EcNOpEP99HF52nUqhlPfDt9eEGI3tyFpFLomGzHOloII+NDn
         MGN7BBlSxaLC5XMAvTQYUPKM+WtpmXYLDn8OByaWz3hF9ZadD+LGr+Ujrw5gs7IwhHW0
         C7x+sYLZT5wRsmjIrErK5eALPFI8ex3SV1+VvAhcrXi4RsGEkuF1mq11Ej7C+Y+dZTgT
         egy6jPD5946Ivq5tP19GKAOA8xG2O88xL90JWU3LR+M8UgU9mxj/Zj7TiaB2wonBlznG
         +o+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455392; x=1787060192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=;
        b=mfw7t89nH0TQcOsnUasXs5sNLgpd2b5dcGbq6WPK+3ipR1HLPNfGsmRW7wWJj5oM7f
         21fWwjvjjyWfQ8U4mWkj85xtoUiwESSvp+RZOxR2Qtvi/+cy240HqV0SH7uhh2LdhKBt
         FjA0PMoXo5Y/p0Wf1pNeZR/0x5DhMt2MAtCBE3vIbA5epJQbxJltHqf/gpeCcyQ3fQVG
         eW/jiwuofqbeIPmkOcP1a7LhM+M5Qmw3Q/dX5MhjWFgP5l/SCRgPc0qrufQuQC34pHr/
         ebKN7CdcK+wfI+jvlUNWABHSc85i2uwIif9sZrTbF1/8pCT+DSFPARGySXg9NuVBo7os
         pFSw==
X-Gm-Message-State: AOJu0Ywk2x7VLDKuvxuOoeodBAfk7ECrzAkHa+DlICSd2+1UkJgeVcji
	ISzUBxSD4XtRgQwZ7tC2F+jkEemyVbZQXa/B1AKsOBeIqfJTL6NKiQGkE0rQ/CkAaJcZEVsQBcl
	w7LkRJ0wXivHh/7EBBBAMIAlQoEJKKLRoqs2EELQx1We+vGYsRi9jhPjoFFa/okfnulLQAkrN9w
	wJ
X-Gm-Gg: AR+sD13HtP/n67/nVJY3XR2VGFxs9JePLYJFAlSMyaESvfmmWKE8IhWnuWHw9SUFXRM
	g5oxF1RdJZVW9+2rgSga+uV7/VS+zcH7GafcTSiyEJ0AB5rbxBCdD/Rw8ArFFz+xFW+GS9TnncP
	5kK+CZGSoD6mJrlHKAw8cgoH3nhcyCTiu2Z1/+ZGn8wArdI49XMv9T02lwnlXpJ9FV1r9griU2P
	sxmRxNavrhURbkKhJwJSf2Rr2keRf/ORyuqfJTk0rPmmUZOsY6oUxaG1Hw804htRLtT9trn1XOQ
	AwmfOU7SmJEW3jdJ2Fz9ynVlM7f0T/r1TZNAuL6hiud/uGHWeKqL8TP38qzh1eXDVrwzftJ0jdy
	BleBR1ybIKF+lC8y3kDbyhUE9o3MwPm5n2cvfbcAanLY+OE+6uc7T7DOQ
X-Received: by 2002:a17:903:3806:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2d317980936mr42837055ad.21.1786455392009;
        Tue, 11 Aug 2026 06:36:32 -0700 (PDT)
X-Received: by 2002:a17:903:3806:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2d317980936mr42836205ad.21.1786455391438;
        Tue, 11 Aug 2026 06:36:31 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:36:31 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:31 +0800
Subject: [PATCH RFC 02/15] cacheinfo: Expose the code to generate a
 cache-id from a device_node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-2-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455318; l=2592;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=MXjxI8aXZOve7L6eY3Z0pfsNkIuJWimjX2RUSvdJo0s=;
 b=tFvguMHAOvkvqMWbftI7gnFeyKM08znnE0fHHSS1YnhpWLICqjPJfxeyU9haSU0Ald7wq36s/
 iaEcEDz8J/TA41xAWG0xgBTzt24tbfixOhDF892Zf1EP6Wq2tJuCwpY
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXwRP36hK+44ZG
 SKLMubTodLmU9Mmm2S1I01WFYepEJdFczvAHgfzGsZjBU37INO4Sgs3+w2LgV1iOlrtx2M8uiU+
 m8UuX5meXj4fm7or3krjQHp2MeiWxM8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXzNAIHSgdHbTa
 x5P94KkqnAiXcZ5t2of2qA07Di+TJbLQ9SxzE8cZKHL0D/BaTebQxPmf8QPxjrQovRjW2dJyJaY
 0sn/YMISulaGNlMFNFI2dRZ9SBuIWUjP9J5C0qG+6AmKDXvrE1cRNuwGkYhP7jmgYMoiaRTfZ2R
 vOJAHLnPliZrx9N2W9Jk1qZm3BRBCLv2NkSd9CIV7vcVCobOsCNMMZhxSIaeEhSU9xOe1mn3cZX
 GoJRcINPHPhicAiAreH7jgnrPkcA6ZvaF0n+J+Tn3P9j/bqOQHsk36XUF36rP9KA2uMDyCzkmdu
 R5XVDGA8eW+8Kyy9cCbEkpPG1DsUJBDx1JUrk/F/AY48L1AAViJZTu3hzcegeZlviFQMXCxHfHk
 E4qVRao8zi5V5xsosiJ5zwpWqSDXtRzQ4DQGng35v/KPwpIXfadWEdQ5BMzzfGev8c66zMSYuiQ
 LxuoGeeKDrEfxbb8ZnA==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b2561 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YGyWITW8jF7qUHxv7J4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: FpIEQB6FflIvNrDGQqwdli4dhAxYcfd_
X-Proofpoint-GUID: FpIEQB6FflIvNrDGQqwdli4dhAxYcfd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110114

From: James Morse <james.morse@arm.com>

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall(). Even after device_initcall(),
the cache-id is only available if at least one CPU associated with
the cache is online.

Instead of making the driver wait, expose the code that generates the
cache-id. The parts of the MPAM driver that run early can use this to
set up the resctrl structures before cacheinfo is ready in
device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context conflicts in cacheinfo.c and cacheinfo.h; guard the
  cache_of_calculate_id() declaration with CONFIG_OF to prevent build
  errors when CONFIG_OF is not set ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  3 +++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 9f9c72727a05..f75e7f64038b 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -226,8 +226,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	u32 id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index fc879ac4cc4f..c33bb3c8bd63 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -113,6 +113,9 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+#ifdef CONFIG_OF
+u32 cache_of_calculate_id(struct device_node *np);
+#endif
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1

