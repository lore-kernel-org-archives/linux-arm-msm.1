Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAA03769F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111290; cv=none; b=XwbIJmFGnrkN7myRUBlZvG9a4GGgCQGxfkZ8P4QTGQi4esgq6qfyrqOz8rWXw+5ziU3iwdcZ8wuI3or6IRHNDPgdfTxQODcMTlwJwzM26mirDX3nydeJZOW7XZ9zN0CijWB99bWaY2YMG2srWfYWQbS6AwmKMBUTuuW510wfVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111290; c=relaxed/simple;
	bh=dXzV6b6BESbGgozO2SxU6GpVY+niOn+Q29JsXUSyPI8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lophCwj/NVx4Ab8F3LGas+ThBkhy07wOvJMAOYogqdZuAE7dMe30IXf9zB3rZe3YdEEwcg5W50RMlmAo7c4Nr4jEjg6aBaT3iOE2gqjfbr88vKtKzsQuXRko6KJAkqqYsOd1KJXgRA+Yrfzr343cmWveCwiopBau260maldgDd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbmpwfj2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JT+3iAOU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbmpwfj2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JT+3iAOU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI77Ul1348925
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TkHh+GdI5LWkBXpjuzLOKY
	b1HlQlWwmI1h+0aXFSiDY=; b=bbmpwfj23yTJ2r/xsLwqZmnZob7VokE8dXgr5u
	Bz+vdUZrOCNXUieEQk8nKr8ic6TxN0LbeYNShCvHX5JYF03GiZ3Kukv68To3Blnx
	sEPGELVZGcbJmk28/VnRFKY/A9Vwp103EKd+O/IyP2YGYgOIa/vukiihFsjL467D
	/pFZsWN65GWeVA0Qi2eS0ZFXHP5xJZ1GUsXohEfV3olno+q+L3dBcuQowiQHcTEO
	O9X7yxiJfHzWfcJLWFPeYz90JQTr+8LcrRONkTaAX+LcG1+tVMQlrZPm11SaKixH
	p7ed5Ws3eZ8GtMmas1ZYMOnXq1527BGof9J4+VH5iqy9LPTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8612j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:07:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c14fa512aso140834eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790111260; x=1790716060; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TkHh+GdI5LWkBXpjuzLOKYb1HlQlWwmI1h+0aXFSiDY=;
        b=JT+3iAOUK0TwmlOqR6/Gyi3Od3KvKp5qLxzcDCJCuVLhsvNc+soVsWaNy35IBrBZ4w
         g8IdpH7ksj+Esyuwnnq0DGhzMx45KfXFiLv6C/Ae1/wHWrZrWdmN1/u8JOwv8FAWNssk
         DXca7IlE46cDjzuzmiBcJVtkrViF8zbyBbUztUAKKgYeuhIkIWE/yoqLRyxeHnG376yI
         EJErK6a0mzw8iTrAy+fDmk6DHt0eppJxUKCK81mZ7jpghtmQDIRUkzjGLP7LTiuR2VYb
         tyjoZGP275E210Ku2aALaVUAeJU8ybillEQF6UeqjNB17z7VU9Y/92g2Gm7baRaj2cP9
         wr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111260; x=1790716060;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TkHh+GdI5LWkBXpjuzLOKYb1HlQlWwmI1h+0aXFSiDY=;
        b=ddJylROKzgKlyqZu95ef+jZVEg7dAjcpJrHMKDCqq9+zo52AhhAqeQXW2nDCVVDyeF
         zIw1+6IsNB03peue3TOYiBZXcMjYNBx9mz6GvAcKarWgjuRglYOPX+XJxPQaAdg9PJ2e
         0YaRuhEYRdYVOZ5MrqXSMf7y+b/n5or56+ETyYy556lqmhetM7wwCEIjO7hqt0wGUWx1
         EfbFZbZxUplqSXTWM6mQhw0JIwTn8w22TRP0Dy2d/r7sSa5Rdkwu3YX64nu3eD9BNaCj
         ccqf41T7mzW34v0h9hxIm3NwxFuIbAeJ+d6Bo6nieeS97nJ0mn5tFTTAUmnN7sEHt2jq
         s2Bg==
X-Gm-Message-State: AFuF++mr1U4fqoF8P9HCU1IQrJlGiWJMj17YYRu32Jn4aBHz2lCBwWEm
	rG6PmTkK3uJfCe/ORD4x+PgbgtnXVXItCVmy7iK2weJmOn18wxXINlydFxTdNmlZ+PgVRjisAmt
	gk/hQxVtMP9M678ZLG76PXT54H1PifaYU/Tz+OkwCzijHyzek1oQ2W8gxWb/7IQ7PblTUs2rzlG
	P4
X-Gm-Gg: AYBFou19ME7/sz+FoUbk1Uh1GB5SkPFrhBzlX/FrBzVkW0oPuyLaaW/z2f/whK3BZ/n
	q5emVWzoXOQdPBJGpK8ycklUv/FKcvTr9yK7oXsD3eBLdH8yCfrDZiLZ8QpBfwvytOW3gTB353W
	dTAPkReV6eueCta5M+W/atRgs8KKyVJVCgBhFj510fuJTjX2lE5DuoPBnsEWLxhwCmFxM3LlLbS
	hZKFzHWNSQB7G027qRHzJQDHNYJmdQ6l7cYj1JD5/4V32DFmG1hsBE46yaC9XmiVaJOAK+ztFax
	m171Fv8QkMclGq48Fp8H+KE3TXBqIaeTXz2C88pfPW06eFB3AmrIuHFANxtupRrIvRkIPDhHU2a
	jDaZyInoOxbMrJ8osHGFoHK1G5Q==
X-Received: by 2002:a05:7022:b88d:b0:143:37b8:5007 with SMTP id a92af1059eb24-144f8d4c260mr682189c88.2.1790111260121;
        Tue, 22 Sep 2026 14:07:40 -0700 (PDT)
X-Received: by 2002:a05:7022:b88d:b0:143:37b8:5007 with SMTP id a92af1059eb24-144f8d4c260mr682158c88.2.1790111259424;
        Tue, 22 Sep 2026 14:07:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm1157207c88.13.2026.09.22.14.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:07:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/2] Add Qualcomm SM8975 (Hawi) socinfo
Date: Wed, 23 Sep 2026 02:37:31 +0530
Message-Id: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABPusmoC/1WNwQ6CMBBEf4Xs2ZK2oqGe/A/DoZRF1gjFLqCG8
 O8WjAcvk7xk5s0MjIGQ4ZTMEHAiJt9FULsEXGO7KwqqIoOW+iiN1qKxTxLsHXW1F5WVpVJG5jJ
 zECd9wJpem+5SfJnH8oZuWB1royEefHhvf5Naez/1/l89KSGFyzNjcjzEUGfPnD5Ge3e+bdMYU
 CzL8gEAh3GJwQAAAA==
X-Change-ID: 20260922-hawi-socinfo-da0b1190804c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790111254; l=658;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=dXzV6b6BESbGgozO2SxU6GpVY+niOn+Q29JsXUSyPI8=;
 b=kGIsAcjS2chECMRFbVe8eWfkA5sorwSqV8A/u8nefHDsv9xsF7g3i4bCXIafbGPXfAHb69lXO
 ycNtlBrLGSrAB2LsVNAObN/+73UPavq3f8SIPCbuiz9mH/LjHqIX8dV
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: w-tHexh3ucgRcJi8BssRu4yjOP_48p7r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX6X2K0ebLc5XC
 SBwRGNYglGaBu/gXL1/ECl2WNvfgG8EmVnK7C7IbG3dB72Vx0tUMWv6Z0khs6C8XjXSBn3Y8Jk9
 Q0NViwLu6k/hQwjfUaPGCTr3buF8jfQ=
X-Proofpoint-ORIG-GUID: w-tHexh3ucgRcJi8BssRu4yjOP_48p7r
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab2ee22 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zdbvyGFJoTjybTRLRfYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfXwifK07tmV+BP
 ycatwMf/3OFjkKoj9YjMsTzEapApu74iKDYmbF+QWHvMRuYukDuiZt+8rNf8rjAexmRZyw+RNSF
 nh6rasgssYWVeJwuJuZQWA8dfjEJMgLBsDy0mgdSWuDkpgkMB2m+Z9mgqkS3/3raig/YTTsrrvS
 84mNywHNoxmUhYeY/nCFEVEcnaKqof1lifU+h4u6OLkeDmF1ZhHYZNpzccYCsKuRqFqVUzRZYEb
 4NPseuuQSAPVbJ1PejMbHo9orio61WT2GlLz2O+n5Y6SVGhZSsnFd3qX9cVvWc51LsID/tXKt+E
 TdtfjgkfNYkJiGjwaVZR9PWBnSg4Td7/edD7o1BwbKHZG2ZhOrFdLHAL0oLiStDQ7HfglZvdA6J
 UQqo9C+sVa+vaxeehTGck/OSsOGaKwUMJBLBnABMpH0ffKVgFfFaaQWPeZnefwwMxWHstxC0O4Q
 SGf0HG+xzt9/6QLQV9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220297

Add socinfo for recently announced Snapdragon SoC SM8975[1] which
represents the Hawi platform.

https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-extreme-gen-6-mobile-platform

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Mukesh Ojha (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8975
      soc: qcom: socinfo: Add SM8975 SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-hawi-socinfo-da0b1190804c

Best regards,
--  
-Mukesh Ojha

