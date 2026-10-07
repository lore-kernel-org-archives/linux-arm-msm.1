Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED24483825
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363741; cv=none; b=uiu1Dxcg8JMpCLQ+9a+ghJfqbVB0k/cBfp9Q38fJWvS7fmr3/8I39fbCbjzQdZch9dFi9qUe+d/tAe8Pevqi5/b6BtQ0SNQzfqCJK5Kr9VJz+/YgHbFZfi/f/5IwNwCnKq5ipFx2SMrmUlGzCny4P1NTT6rcyqgS//gPCJWDgfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363741; c=relaxed/simple;
	bh=h9cIQpDQR8sTSXsjgaFZKV5k/jQzbKW0bv418SSMqs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DTG16eNqWuCPcampnDStjJuBrqs2e7s6/vR2fXD1FAl97vdrdZoPArtFCXLDKrYFMZlIYMw8zMVtpLPwaPAzIV7lGeVtqbuPYqSqs6mPmjeQMAPbY7TWbXgCL68n2xvflxraR5/ZKgTiMdb944GtapT5yl2Aj0OqbQMHt8R3jHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aP7EWRkr reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aP7EWRkr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jeUM3334690
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IAfjCgeCXAk
	mlGqd7rTMwbdlm62OIWjNlAWHC1Rsbgw=; b=aP7EWRkreg/oiYgwPHx1Lwq8f5B
	2qDDzCOXk+fRUgiMwY9RijPkLwdaq2eEs6xmtU5TOw+xCP16BbQNvYZEDlkwwVnR
	xftI5hh3i3nWUhcELyTsBIppuXktE90ecpl2nDYuO00ReQkSaV8aZyxKvPUeqB6Z
	jXaXBxH57r80ZKalZ5xttxV0cyZlMRFo3+tj9n5id37jiWxclKi32icCsT8FUuFM
	o1SWuMTtksiDJW6bzmJds8+JAunRLqGq3AZG+bVl+6rA3RPXl2A4Ykx9zb5OLkoJ
	djq6AeKBkBR/Dr9BFPXYJP8Eo/GMdylTUmlO1XgfIYUI8cuBaesN244apHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623asg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:01:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso464682185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363711; x=1791968511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAfjCgeCXAkmlGqd7rTMwbdlm62OIWjNlAWHC1Rsbgw=;
        b=zoTCEYlmoMlmjVckyAhkMuUiIQzgEP6/itYcBESVUXqWBaVrs+qJuy8aeOQgwTXNav
         JgzC19BLz16soU54roeeJyJAIlIyfgZi8bcRqZxqzXsWn/z1233O25uaAxT8kqWrD/bv
         Uycp+0N0Fg2ymB/txlEp87BdaM+I64/lZzDQt8GscPApdvUu2ClPZH5X3lhZ4xedAG+z
         vetjzjf9CAfilJqX79A+mB94Lf0YkKt5ODisadOCTL23XMxkFc2ADFZuLIK+TWHcFCF2
         vwIM0pxfftcT6bHxTlFxuQQrIbiAjjsNDYT4bsjbBnwGS8ShIOOKEGSVAp/635P5q3a0
         3SHQ==
X-Forwarded-Encrypted: i=1; AKwUvBybOTeU5cjtn96fMFWBySs7R8PUmIyGuJTFtnVaqJ7OP9wLHFVx8wDA0lq8hjc3yUToB/cs6I7QxoDovOUD@vger.kernel.org
X-Gm-Message-State: AFuF++mlV9J1X2yuOxAH0bPSMgYodzaGEFJXw+dK4dLcVdpxe/TgjfAS
	SABPp6OomeRCEnRe6PNjpDtyLyFOKOo5cfnLNExaJCbgQwx3w/IVYMw2r6Qgi6gmuyRJWkTODAb
	aoYp+JwYLnkns6nLVyCsxHlyzp/EQLWhkXumAbqJ/OprgAhau2LCU0RuSsRAEvz5P18O0
X-Gm-Gg: AYBFou1RDYPYsShvyDVlag7m/jeDWuv1O+0xXIRUzC246FHfnT7yMPPfeXxPqFlPV4u
	12VqLi7rrLGwg+v6jpa95ZhQWZwUxCRIYb460h5VZaNk0W7w8NftSePSqq/rbP272rbjpaSjvxE
	L8chJcDan4kHMyFiEhw5LXQ39XllMRZYWKiOabW17iieAOeIUQn0NReAwOnEQoQulc0ZHNhFjFx
	NdjWir27l5SL8uVz76dwZBDJ8iPN3+nwwjzsIx45UemMsxRlH89kCRJVJpaqhsjdlzre9Oa+A5P
	6TafG7tdn3HD51RyRMSCRcIc7V1kRJcCOEgZit6Mbih3Lh0h1h5SRCUMzD4=
X-Received: by 2002:a05:620a:4609:b0:93c:746d:7c72 with SMTP id af79cd13be357-93e9b8150fbmr302044785a.64.1791363710688;
        Wed, 07 Oct 2026 02:01:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:93c:746d:7c72 with SMTP id af79cd13be357-93e9b8150fbmr302035485a.64.1791363710038;
        Wed, 07 Oct 2026 02:01:50 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:49 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 18/45] media: uapi: add Qualcomm IFE statistics
Date: Wed,  7 Oct 2026 12:00:14 +0300
Message-Id: <20261007090041.3732717-19-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xv4Fs0ReNHp948b-m2cFDwrAV1je76nm
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60a7f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=WOjdieuOH5yenQkIkwsA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7AnUExgMRVVb
 DAXnIK/TUQFK4o2fM51vkGB4DigQM4o/fABunR5hajocIwI6cGUuKmpjQbZ6yglqOEeo85RSj2V
 Xeb4S6P4bw2+A+YR5+Rrz8UvJdmpxnc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX2y8k8yv9LPyo
 yJ9cid5sq+DiWmHcWX1hvDnH9iXHAaj9VphNFmQeCzNDiJwCpmNrAQEcqEQvD1uIVl+HV5ngTfF
 6auv9E1nYmw5upAz5J2Bg4pHceQRj8Jr5heiPS0iI2ft7/siC0/LV3glBQzi2KXE+TZ9v0ie+0b
 1ln2hPyJoiPG8yI7E99Kj0fM9t6fCbTjeW/uSoxTHj3uuUmLMZyVpShCycK+Vs8yysiljeP6dn/
 s3kbh9PntxvLcaFqHF9XHQ93SrVMsikkHsURSXfM8CY3itntzVgnKPKCmIdWIx0kNHp8+SCiewY
 T74me57AzfC1OuPTkuIqmi3h2ZTorppdJ1lVBX2OCl/8f0ogsFrMbdeUr4iGAoQFs5axE7XzLU/
 4rmeNMpOQturuu6x5LScTUFoDZ/vhbJcd4Ovm0SGWH0gFR47bae5sOSbm8wooWwKpALJIgxl8JD
 OQNsqV06vqBd/oPRYbw==
X-Proofpoint-ORIG-GUID: xv4Fs0ReNHp948b-m2cFDwrAV1je76nm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Define the Bayer grid statistics buffer produced by Qualcomm IFE
hardware.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 include/uapi/linux/qcom-camss-stats.h | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 include/uapi/linux/qcom-camss-stats.h

diff --git a/include/uapi/linux/qcom-camss-stats.h b/include/uapi/linux/qcom-camss-stats.h
new file mode 100644
index 000000000000..52a9d3e8171f
--- /dev/null
+++ b/include/uapi/linux/qcom-camss-stats.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Copyright (C) 2023 Qualcomm Technologies, Inc. */
+
+#ifndef _UAPI_LINUX_QCOM_CAMSS_STATS_H
+#define _UAPI_LINUX_QCOM_CAMSS_STATS_H
+
+#include <linux/types.h>
+
+/* Max number of bayer grid regions available in statistics */
+#define CAMSS_IFE_MAX_BAYER_GRID_REGIONS (64 * 48)
+
+/**
+ * struct camss_ife_bg_region_stats - IFE bayer grid statistics region.
+ *
+ * The IFE bayer grid statistic region contain sum of pixels and saturated
+ * counters within the region. The region configuration should be available
+ * in the IFE params bayer grid configuration structure.
+ *
+ * @r_sum: Sum of the red pixels.
+ * @b_sum: Sum of the blue pixels.
+ * @gr_sum: Sum of the green red pixels.
+ * @gb_sum: Sum of the green blue pixels.
+ * @r_cnt: Red pixels count.
+ * @b_cnt: Blue pixels count.
+ * @gr_cnt: Green red pixels count.
+ * @gb_cnt: Green blue pixels count.
+ * @sat_r_sum: Saturated sum of the red pixels.
+ * @sat_b_sum: Saturated sum of the blue pixels.
+ * @sat_gr_sum: Saturated sum of the green red pixels.
+ * @sat_gb_sum: Saturated sum of the green blue pixels.
+ * @sat_r_cnt: Saturated red pixels count.
+ * @sat_b_cnt: Saturated blue pixels count.
+ * @sat_gr_cnt: Saturated green red pixels count.
+ * @sat_gb_cnt: Saturated green blue pixels count.
+ */
+struct camss_ife_bg_region_stats {
+	__u32 r_sum;
+	__u32 b_sum;
+	__u32 gr_sum;
+	__u32 gb_sum;
+
+	__u16 r_cnt;
+	__u16 b_cnt;
+	__u16 gr_cnt;
+	__u16 gb_cnt;
+
+	__u32 sat_r_sum;
+	__u32 sat_b_sum;
+	__u32 sat_gr_sum;
+	__u32 sat_gb_sum;
+
+	__u16 sat_r_cnt;
+	__u16 sat_b_cnt;
+	__u16 sat_gr_cnt;
+	__u16 sat_gb_cnt;
+} __attribute__((packed));
+
+struct camss_ife_stats {
+	struct camss_ife_bg_region_stats regions[CAMSS_IFE_MAX_BAYER_GRID_REGIONS];
+} __attribute__((packed));
+
+#endif /* _UAPI_LINUX_QCOM_CAMSS_STATS_H */
-- 
2.34.1

