Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994279;
	b=yVcbvrBTMsB+wl4cw/BIZyDHp/Kwrf2L0MHJbPuBVRn5juCUUIye0Y45+oLba0Xu6mju
	 98WHnHAujFb7YPMJkicZe42tlQ7XThiovkI+yKtqPuh0dFLluzYs7Rg1RkV7SANlIRwVw
	 +CHMXiSgHQPmTGHxaOavAy83jzrOAmUoPs43mELDrP4lKymbRgPfY2aBHJqjS6KaStO/y
	 /fLOWO1PHirMsEmLSD2a9uCw3XVyKt4t9dUT4c3svWavznnQAlmuiJKSjIjGlfyM48oJS
	 WCcvQlxTvY3VrYJa4UMO5ARod4XVFfk4lfFDa4l5z+ks0wJ588Suh4XTHQhusSFJBFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qNABjluLPthmtzcypGb8y8qVQN2dUgrl8U9g5Yy0WKM=;
	b=3V3ExX3IlrJ+by0pWwHUYY9ek92HlkXo3LCpRNrs9FJI5x+tP/eXLOsjP5npROK+kAeS
	 2qFDavQiBZWwWYINpfYTEVhefxbnE84AVnbOnipPEovAAwojjPuag0h9D06fSeztc0rE8
	 /j05Xx535x6/lt5lrPTDvyGpKn9FVqotLb1a5j3IqyPz/nav3eZaiajkRWmX8p1gqSaPP
	 cHNbvinJmvTqp6E43dTbYEjgkNo58nI6aehh0uqdA04ftfm3LqN4m5Re9F928jBStRwIw
	 Q13koyeZn9AJJ00Bjw7ezh4uW6hMPhG+z3Cxf/6FcecWyvG8VnxHTPpyu4TsTFMJSqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5EUH+5A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mc++bFLk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC5D606A332
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 19:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC5D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5EUH+5A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mc++bFLk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JL5Yq3254052
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 19:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qNABjluLPthmtzcypGb8y8qVQN2dUgrl8U9
	g5Yy0WKM=; b=M5EUH+5ALBu9wLCUWTAe64qDasOIq0JsubA/84y9FjuzFenBDls
	f3Ww50BuihEhchjwRCOxHk77N3ZQa3hpKRZn579L9bu6WMqDjm/i7126wmw1NWCN
	m+ZQGBovcmRy+B+D1siAasWWBuC/zuTbDwd16sLp2uSKJlb8zuefOwPgCy14eGht
	KnMsy+80i6DGgS1xsodKr1Gty3tTsrm5h9o8absrT0X1glmw0PuVLRY7kdaW9AJR
	7e8L5Txz8xUIf6wHo2hYmfsnR3ALvzMFJZ8r60mqPElTFeZl334fiW36AkX+cXrt
	ltdz/OU7VRRbih4ty07Zu3XOSce/xFnAMnw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyqr2xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 19:44:37 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf45382794so925334137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 11:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793994277; x=1794599077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNABjluLPthmtzcypGb8y8qVQN2dUgrl8U9g5Yy0WKM=;
        b=Mc++bFLkNzkXAcoYc9XszhAWa2/ey50kCPZE5cefW4LNtsAJxdEiKtRwfVh8QSznkW
         yOq7BN/y4/m438Ws1qSPeWLOedO47xMK22W2n5qK9wAyqMUBLZodjkH8t+3s13amGEJ1
         t3DUC9uhSY3x0pSoseyg5ZHAZ+97sdbM32rav6QOv1GPQm8OvWVeKhvoq7dN8nYzfv0d
         q7qgckiHlYzeutsu2tJ0O/sDptDT2MjzU0eOcoum5mSIUPo2Rvg5PWaJ6aKxcSbLhNYh
         bXxCvIcueYpYPBTG4kDMqEza+sIl837mzURVkJKDR6F6ezgGt0kKsiGzA9QzQUh01QnJ
         1wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994277; x=1794599077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNABjluLPthmtzcypGb8y8qVQN2dUgrl8U9g5Yy0WKM=;
        b=J70iSzx3mM9Cg44pf3agbCSJVyzRnCb0qKjSLxi3qDOyB/dPqv8Ic/5Y1aHeyC3LYM
         3Y4QQcat7R3I8KvIMOsgsZVQxIoFEbcEcvsBchfThEQGvL2ApSLlBq82kpYKZo8f48Cp
         iqw0nZo14Qg4YBr2Te+nQ2eag9g5EKdYnm1OqoIj9+HFWmQPqQNPXE4zwu2ST53bAnQ1
         lu7Xl6FfT/xEUz6q4pix4vAiJYI6jySQ/IKK/c5xJ2oHMrcXYZucZL+MzMordTJ9HITv
         K0CdMkB6BWpo7AGL9qfpUMyCHMvGK8VaM3bG4VxiBp1HBhKQRF3tojyF0fkPBPPaOwc4
         Jx+g==
X-Forwarded-Encrypted: i=1; AL+hErE5fDdR/BLcWAUG0Un/pfYszvlQrwYBjt5j3Bedh6miga3vfD1G1TtysbdYcAM5J09fkvC6HGw+0j+UGQLs@vger.kernel.org
X-Gm-Message-State: APuU4Z8/hvSLepbkMvNhizkeXOkFUEL69rWuBPHMKg615XV+jhRioc1/
	QmYXErorOgemItF0/nC2Ohpc9m9rrG6jmFZ2CKLm2n9Obd9gQEH0DNjbaZECYEy40RChXTLDhEG
	hS9X13s89YZC83ixza9oESrLJiARi1tjZ9qVykcOFZLDL4zyI+tr/s1JyVTHfOWQd2kqC
X-Gm-Gg: AYBFou3Sb61Q0mMHuENDOrDUu0G6XF+78Kr7vwDFDbFWt29qXImfyUjR/KX9cE/UyZn
	UmJZtjY0H/AWUQhA3mHssgewTY3RQTfYbBiKSqW5GGKlh16r2FeHHw4huoePl+3I82KMVAfMtHJ
	p1DkQndUAGyL6vUd+7xCPkCJVX3y1egd0ADxuLP0ej9nOX93PdttuUiB/P/h9FLF2evJ4fVVWTf
	SjJlk7M3rH5LX4gmlm7SVZ9Ki7LvngVUMoaVbBB5Wl/kVBcCM72HHrUPhIhrGKW9xsQuwvUuBKo
	Adzy3tGd4OcCwlhML1PeR4GKwqf+JoBNMY2fwhrrtbNtVUhsOkuKvPK5he/jW142mYZ3YaIf+cr
	CoPMza5BssnSVewO/jxFv1WUkfyvjQ6m8UguYb3tPVTWNBXj5O5HmeYvWthnIDKiWu3OK006UXA
	Ac+ExbUZxScmvLRA==
X-Received: by 2002:a05:6102:3346:b0:7cf:61e8:c508 with SMTP id ada2fe7eead31-7d2a15c6fafmr1978060137.21.1793994276845;
        Fri, 06 Nov 2026 11:44:36 -0800 (PST)
X-Received: by 2002:a05:6102:3346:b0:7cf:61e8:c508 with SMTP id ada2fe7eead31-7d2a15c6fafmr1978049137.21.1793994276224;
        Fri, 06 Nov 2026 11:44:36 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4930a5a91dbsm4090686f8f.35.2026.11.06.11.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:44:35 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Harden checks in BO execute and wait IOCTLs
Date: Fri,  6 Nov 2026 20:44:34 +0100
Message-ID: <20261106194434.4062205-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9ekz8YVdzlpg2JPbUg_NrR46Vq4Rtr77
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6aee2e25 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=i3Tp0zCUGlA69Xfs4B8A:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3OCBTYWx0ZWRfX/AsfLROrvSgJ
 7JYwFVRUReCG8aVOjeG9NuWAalOqd26tRoQdE+vcc2HCbHtD63IpeCKg3v1Gahf6qB3nqv9DLI3
 aHppy1b+C9djYgIZny5NH6h4ludlByw=
X-Proofpoint-GUID: 9ekz8YVdzlpg2JPbUg_NrR46Vq4Rtr77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3OCBTYWx0ZWRfX0ldoACd1Nryh
 UwZcxou997fURrfJ0ZznCyHImQVDUi1gG0cMbQ70BRfyqIlcaONdxRpv7q3fIxiZtZqFeSP3Rby
 PA7D0xTp0sn4LYdo9idBr5R/bn0hq8rcytdjaPNT52Vi7U4QNnyXidnG54TGkOnUjzShbAqHOSU
 3HTHBehRBzTQFX9DcZjq5Ce8SdHOa4HK6GnpYwzy5bdgIgVMeDX+WVKBMn0V1qrlgS3QP5N4gWp
 2PA9bJN9/h2Ji+2xN3Nv14PVq5IYbBQ+I9zGM5IodamBOiHTV8YlwtouaWgSdtPi3PrcSnmYMq7
 ULsAy1MrteoVtqJs9u9bEz0M7bEvqUDUes90IFDl7DLXhdVbQPdIYpSTtslOADXw6N/kPL4x8rP
 yhJoY3cuhwj6zIa6W9bl9b98+1JeFK3tieKux5l1KC0NrNn8nzv3GJf/aW7vplB756HJnB2t3ue
 LN7YSkbqKuTZNrXW67Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060078

send_bo_list_to_device() does not validate if the BOs the user passes
through DRM_QAIC_EXECUTE_BO and DRM_QAIC_PARTIAL_EXECUTE_BO IOCTLs are
attached to the DBC provided. This allows the user to slice and attach
BOs to one DBC, and execute them over another DBC.

The same case applies for qaic_wait_bo_ioctl() as well as it neither
checks if the BO is sliced, nor if it attached to the passed DBC.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index ee35e13091b3..be3ceb8c51a0 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1256,6 +1256,11 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 			goto unlock_bo;
 		}
 
+		if (bo->dbc->id != dbc->id) {
+			ret = -EINVAL;
+			goto unlock_bo;
+		}
+
 		if (is_partial && pexec[i].resize > bo->base.size) {
 			ret = -EINVAL;
 			goto unlock_bo;
@@ -1769,6 +1774,17 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 	}
 
 	bo = to_qaic_bo(obj);
+
+	if (!bo->sliced) {
+		ret = -EINVAL;
+		goto put_obj;
+	}
+
+	if (bo->dbc->id != dbc->id) {
+		ret = -EINVAL;
+		goto put_obj;
+	}
+
 	timeout = args->timeout ? args->timeout : wait_exec_default_timeout_ms;
 	timeout = msecs_to_jiffies(timeout);
 	ret = wait_for_completion_interruptible_timeout(&bo->xfer_done, timeout);
-- 
2.43.0

