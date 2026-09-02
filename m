Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DF04ACC61
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 20:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381835; cv=none; b=V+kwkBe0dOpg9AMzvP2LeL6P0ZnisvAEnOk0RWOij1+tAZWDGfbj5dufaqplrCp6xjzTQs1A+eHnvMXo9dBeraOrdHfzyopb1lpNDfmI78RDwwIsbJkl+xSvoKmWp/UowfWEw1YM4J4XKg5mYAG58QfMtis5ZvB9mvMBYbQL9XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381835; c=relaxed/simple;
	bh=f6q8FoltjlovTDu1+uHniIV9mJzmkVGNfZOq0t3Zo08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZivc++HdwLdKSwU/xqeJzTR2n02NBVb4GjO4xtgOwHSMotZZdXPbmWgHEU85arANWM9C3b7TfkfOig7To9Jm6fJffPybZZas6pvNTjWzEf/PMynBLSmskJItU5949v2t2ZQc7S3W6I7Uanx1s9essUXH8ooOkegMgnK3jaXqmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Et5DBHyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUcQmWh6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Et5DBHyR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUcQmWh6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHAQh1962701
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 20:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BwimQj+9cTD
	SXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=; b=Et5DBHyRvF/r8A40pKXkCpcvi7n
	pc+ccSgQslut7Y7/Z9dBtUxnzI7V+eraO6a/SrKznn6+5Gr7J8IxWoL+1hIbiSBS
	w+PAStqgrsc28jy0CWzwcqgvVmzfDDA59z4FnHCUBeurhHu/53Ns1JDNj4QTqM8d
	W7K7PRxdbGbdd12/CKoYw2UDxmRwi2/eE6AX90Ttb5YLKudEbuh48xFgOd7e6RuT
	LU/ue2gJBVAvyzp52enSIIwDSFnra3E5x3IeIYcg8cMVP2KKPuwu2o/EqVKQRAxD
	PWCOoxMIB4X+ufB5wmwktevgN8xGjYAeu9Tnd2FD2oiD5/mYNWZFmyh79HA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4su9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 20:43:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6c166bafcso23754495ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788381827; x=1788986627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwimQj+9cTDSXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=;
        b=IUcQmWh6PkZ1fU2o8LiWY7O+8WlNmG2q6NUFEGZjVQwun04eC+hYzOGIWIuGqkwt8q
         4OWOQN/MmO1fsnP7LDKRLrXO0tm4CmYwftCezANz3TwXRgqUPjzc25+1EjUhQHZI+5/P
         406zHDFy5EP65np1wupuHYjX8kZTn9K7Vz5K3V1+L2YWgQ5wYOQFLcor1eAwp5P6Up0B
         urPfYpBNnHPmToSVssMRU6pO7eY2FrfBzFAYwgS0f8Evgf3sCjUzMuc8KftKnum+Wx/m
         yMXwswn/qX6QZMZAH5wWq4HwrMliyp84Wf/HFoQjrYfaxe53yjKO84sjpRyyy+oZj3iY
         uzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381827; x=1788986627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwimQj+9cTDSXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=;
        b=Bv/EuaMrVdZCiznU7Vd4nLL2IBkrhWZ8+bivgsJeLqGwgfz1+v2G0YBU7qG95fY7Og
         GjCtNqAKYwovQLlcUpZ4Vol0zQ0iLOBV9oeGVKxFE3v9hJAI+Rd7llpnxwLVMO3bxn3Z
         t+MPSz7XF5x/iHz2LTYqGLz8/xAB8cg8ZpP1VfNQTiAoEblEkwtbnKap4DyI5tc4nz5C
         cp5NUBlWUmpeoGbrdGYOL3hhxcW6Z1vimr0VW6QoShRFrFbLCYbD2R9mKLWYRCuK4FpP
         u9hzWHwNqyXLPtUnpuaD2nfOfbYNX5xoIT+lSlbM8euRzLYidtUBLwJ1tfO/84/netS7
         Ey5Q==
X-Gm-Message-State: AFuF++lkMqufsczhMw9E7Z4mxXFC7TniCk0SiRQA4om9Di9oxx3rwISD
	PSuqj6YQfncelKLU1+fbJ058dGtaFtRWXYJCtNAtVT4GFtAl1KAsQxtOSm/S3IM/vjrdMHwgnwu
	7/4wHwfUxzAcKvH2YbeSbuln+eIBPwmiOA8xPmTXOAzU7z/DajBol9OYLG+JSDEB+aGij
X-Gm-Gg: AYBFou098TCNdL27wUob0uPilW/WZY/c1SDICZOOxvF8mBHc5XV65QF7QOII1arPygG
	ZX0RWbgIHqQnPfPmMBJ+mqTu+KPpFgarSwygXELWCGErE0ZF54ZffAn2Lj/W2kDCPT8vayG+68T
	FPw9Tll3Rs10Jfb4paWqxOCWZMiIXpEH8WURqUPkgctiqHM9W8zGqgTYybloOAoJAXnSbriBP4C
	B8p1qTMAz9/dE2s0n1wKfbv8nbk0XAOuxBP5xW4oodtMkqPaA6ibryOtb47v105xwLxCuRMYtDR
	ykmKqLZIT79OboUkYz9jX57LzrkN3j5NoXa0QTDNwXwDkWcxk+iIWmxkxzo+VxEsnG5xBcq/sBz
	RrTo5ub/Tfn/2rGHdpfUlYdy7fQo=
X-Received: by 2002:a17:902:da87:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2daec6f6b81mr93347525ad.11.1788381827411;
        Wed, 02 Sep 2026 13:43:47 -0700 (PDT)
X-Received: by 2002:a17:902:da87:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2daec6f6b81mr93347075ad.11.1788381826893;
        Wed, 02 Sep 2026 13:43:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255d39d21sm613338eec.16.2026.09.02.13.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:43:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate dev_pm_genpd_set_performance_state() errors
Date: Thu,  3 Sep 2026 02:13:32 +0530
Message-ID: <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX/3YOOeHIzr8h
 FocaV/U+OTu0WjfoYQxfNAII4qMuGO8wy1Tm+vXRbvRpeWprpoqj5HR8s2GnnNl7TP+Bqt6BTPa
 vkv7Q3lAwt50TL87Wb+cZJymxU69euXBzd1HH09S7WIPMC6W3+KilTH9WWVMZQvY6+3iKuWm3d/
 Ei7jf6KYE+oG0nVrAAPHmpQsbM7SFqufI4/+11gkVUJqkKxnhKkwu70Ofg1eiqd8GSVwnH61oRe
 Y8hAn3Ovmg7rxd3WZtfw6IwF8UYlC8laBm3SpjMPowYlLXT4+KUr3Vj0XYrw0lpbvx1dcSyWvNv
 KZ1QKRqOt2z+uWlmyuB/l4jZngNdFdy+JvVRIeLShBtvy7BLoZ0eYbqqS3QZCoucMASJNGX3AKb
 YUi5zaxgbjCRJU1ChqRqhQqf5PqlZXs+Dnj06fdtNW3okuh4OwqAliymVkvBe/Bz3xLl9DaPVI8
 dSSeULBsLVkmu/OGOUg==
X-Proofpoint-ORIG-GUID: 3FX1KTlZ9Kr1zclkvBZcsKj03LHe4eg_
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988a84 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=l42t8P_hCmqpnny7Gc0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 3FX1KTlZ9Kr1zclkvBZcsKj03LHe4eg_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX3lxok1+M3G2J
 0lb2JojUtcdSt0boRY18mPsIXkfpb3lY8/S+Cnwy3JRKTDfJBb3M5Hf9wpxOsX/8/7PF3DZ2qdB
 SSlnsJAtK79DmuhyjNesYDDWErTB5Z4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020183

The proxy power domain enable path discards the return value of
dev_pm_genpd_set_performance_state(), masking failures silently.
When the call fails the performance state is not applied, yet
firmware load proceeds without any indication of the problem.

Capture the return value and emit a warning on failure. Firmware
load continues regardless a performance state failure is non-fatal
but the warning provides a visible signal for debugging.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..01dc0194e130 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -167,7 +167,11 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
 	int i;
 
 	for (i = 0; i < pd_count; i++) {
-		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		if (ret)
+			dev_warn(pas->dev,
+				 "failed to set proxy PD %d state %u: %d\n",
+				 i, INT_MAX, ret);
 		ret = pm_runtime_get_sync(pds[i]);
 		if (ret < 0) {
 			pm_runtime_put_noidle(pds[i]);
-- 
2.55.0

