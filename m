Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95E33BB671
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 22:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326497; cv=none; b=o8rrl9N6BHd+M3cQPz5f8T4Dx/Oy/oXvpr+6nc647SNfar0ZRp1W8Ip0kv37qBCG4/HqGAkzAPqgrXp30NGPX/2teWU21CWiWRo3MdQSQBfWD3vWe63pAMQP9426JnpIVBl/kAKB/ApftrSKE3JiFQT8LTWk39o2Oen31XLxwv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326497; c=relaxed/simple;
	bh=h9cIQpDQR8sTSXsjgaFZKV5k/jQzbKW0bv418SSMqs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UdCPgO6p3oM8WcviQRRSreYNaEd8lf1CQI0art3mVSPeymU9j934kLGVceGQV8xkqagROD+k0GTGpnDEXGZfBfCxPiB8oPEK+MFnTYzOdoQ34FPdEcTWe89H/lLzR7qgadhIZHY1LbmhYsYLtENWKxuqIEo+ZZ/tsv+5gGfrhiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeckJdQ/ reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeckJdQ/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeH7T1029163
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IAfjCgeCXAk
	mlGqd7rTMwbdlm62OIWjNlAWHC1Rsbgw=; b=XeckJdQ/zV0KGroe7Jf/YuW1aa6
	JGK2/LPcKbfavW+Vjy2tyi7/snfGjl64G5MtqmofX9KHb95XxMbJtbSNS/5jkU0S
	Is1+nEn8dTBBThbb46coubohov6H9IOreMEjMuovltdH7bru9CGKStxbI4JRNllB
	fP5276NO+1OTT7FYmlQRllhSw8dc2K1DzlRaImIEtDtrFgdiYoPw4U/YeddQORQR
	h/ygQX9hf1uSOTR/Zt5Qmwu/SqzS5PzhG+iQMJn0vVVK3huD+cedMusQ07DWSB1N
	xxnBywrGbMOCjSFmoIky8zHLkXiy9qqJN63p0W+tNMmxGdE6PeqGziNFQVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ashu2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:41:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so602677585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326463; x=1791931263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAfjCgeCXAkmlGqd7rTMwbdlm62OIWjNlAWHC1Rsbgw=;
        b=tuE6Z6c8hBcHQKPXK4LAApMfZacaN4eil9+5+s9trp8s85roXQc9OJiOIJ3HPWl4LK
         CEQWHW/rmL8Xbu5exKIPwdV2Vel49KY7GSERHH/XqLxXqftLcaOm3MIw1UsIUQCtU8r0
         0DVIk8p7cADXb3dTGWdk0sRSbr974fSBeUBnk6GPyrXycdsGxaBd9ilYdT/yXerIImB2
         Ztx9vjw62R9T2VYU4jftORSdMhdBWB6NtY6KbdaUVBFmlCAWN9Hu6uQ4pF/aIjP6DM4j
         sD4zSkdaB6+ifGvxGoObKEE+VYzXsdGD6u6/XVYYdlRFzgGbF1XWFTs/4vcUbd08NQaT
         IFlg==
X-Forwarded-Encrypted: i=1; AKwUvBz4HhDsMJHw6bZidw1f2wfWd6jcS40sjAReBWrYVxhviApBAh/NFEJ5JF0KjtmC4wgO3fUnmIDPw6dHodFH@vger.kernel.org
X-Gm-Message-State: AFuF++lthv92K6Dwr4CZPvY0NgbG6eawPGQuONMBZaI+MggapJB+skca
	vIAKuTXcaglOTcDsIXvhRS3ci2IBGxZ2RoQKxVdfoeWQb9BjfQZGeUmnezD5c/NsGjfKXqfxkOb
	pQfvjyt4iszargkghxM4SoA/2T5bcPTxZTPKipK7hZFZjVrl2tOmx4kQbv/BjKzbcKTXZ
X-Gm-Gg: AYBFou1QFcTlxfVM8q6mRP4FzvYSJOfGRN87INqVru4O5ZAWR2U268FVX5Dxjhmkddv
	YRZ55xtbGm288mpoWt0v1b735MJVq02Gg29j1FnBIJ+1IyopUbX9bPqaiBf9oI2uepon4Y48G9J
	ern/jo2wLzDc8zrsH59ftsdqtewOqDElSxCQQUPvCmSwFZ6SSMXmxp0JVwk7goRXyspkPVuR5Pn
	fPGkY6t5e5ufVH0PQyYbvWkReNly9FaTPD2mNk3FMv5gC8uWVc2l7l2EgT9ckhLPWZIfN1y1Xo+
	OGdb5etKVZMbW7WrtF3Ju3L3K4/92ZVTfzdTwcVHzua6VezBmOl/T3Hk/QM=
X-Received: by 2002:a05:620a:4587:b0:93c:ba2a:6c1a with SMTP id af79cd13be357-93e9b7eae65mr78027785a.61.1791326462811;
        Tue, 06 Oct 2026 15:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4587:b0:93c:ba2a:6c1a with SMTP id af79cd13be357-93e9b7eae65mr78021285a.61.1791326462278;
        Tue, 06 Oct 2026 15:41:02 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:01 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 20/45] media: uapi: add Qualcomm IFE statistics
Date: Wed,  7 Oct 2026 01:39:28 +0300
Message-Id: <20261006223953.3382273-21-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y1SwrzZtRsWYPUrdGSMHS8wfZFZqCH0u
X-Proofpoint-GUID: y1SwrzZtRsWYPUrdGSMHS8wfZFZqCH0u
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac578ff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=WOjdieuOH5yenQkIkwsA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX+gjl9f6QdpiH
 bQnegH5hXSt0UrJbTgv91CwQqqsOOnamWNUoAO2DTVGo789VsoAQ+w0tYYaUcOJs1DzZcnqZfDe
 OMTJEJ8xD6HWiU8g9iop5WrGDI+5dlNz5qWG8jf/aKsl0TvTuyvqePLoi57S2B024oh9KTlKznO
 dvxNYmD5/wX10HoLMJieuiforQh+VN1CYVRVyBcupsyu6AGX8TPVc4M24HbEirj5zfwIox7ilW6
 JJozLdYiL2E+G0hBX/Ndgh6O4LtlFfu8NiyJsAoa8CQuzsMy15aMI6zK2+c8FQ2JK7kdcJXnPLz
 W/H+n0PmzqQshWn2HL5BP0LPmPkG/JzvdwjGisBS7XagqJfZvyiW2a+O/m/u/WImDl3pS8df97r
 tuoUrhmn+1UJwVFMNRlVg2uTHQ+L1f0hy4+o+xDES96Km0235P6Ry08/9vi5pxSm6ARBbSkjSB/
 5SzuAA3c+sMRJv2AHCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX/xdK5rDSilai
 77Chu/R6cCe/aq309PHLrKbJr2I9kPmcOCjHRFSdps/cHpr6JTDJHtCmABYCgkJub8AegWjDIf/
 FJS3Z0SLI65N2Fz8YH2dRzhh0MoQ0vg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

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

