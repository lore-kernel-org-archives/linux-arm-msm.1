Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9054138DC71
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940812; cv=none; b=lsxG3+LJflOq6HRLP/+NBoRld5vUwSFqgHTRhnlHBvrH5mQ4TvmFm8i+K455KZpn8IPcMSGjTwfy1BcgT6cFAYY0jqObNBHItqCVbi4tBPM0o+6+KitINGH/ozZWuwwC9q5ihf1Yy4jbtLRFo7MXuZ65NatBYOrRO4NWHG0osbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940812; c=relaxed/simple;
	bh=vtcYHy2m1MJJoXht1OpyQ+fLPocDu3s2AQvO5UcaALY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiM8dQ+AquaxWwM2pvvjhhbmX1wCXohFHjFSf1h4VXc8j7qKTbRghkfYxWPug6g81h46wWQ5Ac9rw51e3dur72PxtvwZi89w/vRpzaBKLbLHs8Jhd45rgKCkJdRNcGtog47kzmQNhRSAAmwsDO2Qx5LiCFaf9y+li3Gc/a6DaaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgWBun9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aq+hQ5+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgWBun9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aq+hQ5+Y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SGKmu43419938
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 18:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0UzAoBfsq6o
	gZO7Uv+cRArAo7OR3AbLv7IJO/MUHyAI=; b=jgWBun9dg6nFeb+Vx3IXWrZ/TLV
	lajwsqx1YLyWQMxansxfzuDYNzvSBAS6xRlFoo+vN86E7Cd7/b+W9ao35hW+eq0G
	ulqUEqNeiasqZpWDBfJhfm0eihtU2DhrM9z7OeVnz1Duv91lPO/PuXkN/OX4EDOo
	1N37vvOzTCSy6iOTWdV2AYkvEgwBR0pZ/odzNNAY6JF2ZbKxD+WZ47nRUGMq8n/W
	ASYRUXImrC41mpzoHWbNrR4P0TVameE4agFiNxG1zKizzqi7850TiSbQ1ajN7SJd
	O7PnVM+jf9HS+9oRAAJ0ESV15WPRHCphO9sEn3o9Gqtq75X+mT/UydLw8Bw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v3bgv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 18:13:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso2073485a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787940809; x=1788545609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UzAoBfsq6ogZO7Uv+cRArAo7OR3AbLv7IJO/MUHyAI=;
        b=Aq+hQ5+YXzaB0HPGeA8ANMXKNq+DoOd8g1Sj3QHfenhJHr9jYMqMCl0MKznHyiYYJ9
         3UPJUIRdKZxh3u8Ei7dIn0zFx+Q/RRibVp1wWGLcvstUjHKbJq/jaQ3/HoqPzKGskCiI
         xky2E/Sp0rtoI7B9u/+lMiKJ26P/P8GKXz/nnFdrEOxORFAyQdJgTeproGy/il4Ko57y
         T398+MpXssTvf03mls6tHGQdE7Ni87e3v57PkVcGA7OkJns3/IZbHYcePUHyFJMYXPOF
         PF0HKaHXPthVwoZ0OV82tB8ksrvV2bSKdgfPyREgT+7MtBChj5C3V2A8Dqnr8Xlw8hGc
         bpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787940809; x=1788545609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0UzAoBfsq6ogZO7Uv+cRArAo7OR3AbLv7IJO/MUHyAI=;
        b=XTvTHOeeJ0W/fePqt1yme4NhGd8vJsvV9RO9XilDdONlkLaVMFFMpaYfEeEUeuEdSE
         RGaKkCZsAJE4jLdlBUGllJqI/P7MoarogCdaUfXz4c0VBdJuuJJKOGQVR0E5BGqlVk26
         hODx1gvPD5bzaClwKUvO7EQeVqMsumRGqN7KDNmNByWnuJmvJ12SyeqUA/AjIVfWJt3Z
         w3eE7upukYRngnd9NwOFqzTBBWWUPjrW/YXc/G1K76n4+5LgQFerXyrA2sPtMvQjqsbR
         18vSyzfvc+s097oVNXWrKAcnnYrxhyiRObjF7ioHjQrQm3LVFkK+3+mvSlE8TudBX1Cb
         Gs9Q==
X-Gm-Message-State: AFuF++kSVNqRHk+eKHZyi4GmubVXpivySj+z6jiThz5E3tcYC0OSdxCB
	vL6V1H7g+iAnR4D0Zy5T2utwbdVcNVxsPCVC/QLuomOnt5y/FIGqKIt24odzoPYFvyBeHE7F792
	vkId2SjWg2A2cuKYAJc+kj9mPot+va9fxnzOHwCfc/j1x0ezKiER7+IFO4qYoK6I3ZirS
X-Gm-Gg: AR+sD11OD3+NabkpRj4hYM6TaRYxT2m7y8rqNFaYdESSzUV4Z5RMZVMXxlVMr9IOx6N
	rdJsmQpu7z0anNkNCETaHSZtImH5KND8LRRUwB92qulvr3M312fhlQ9Hj+A0zsEJxYqbsu/gi80
	rzQV3rxy+IKcWoAM9pbVYx6WmFp05qX/EC+wWSJ0NuJMpoZ+A47Kc4RQ8Ba0hrMtxl0D1GFDcP0
	FS+9Am4lPAe1TPqBurwkkTza0SrfJCRXeXDCKhVdfaQXJEuuSH3d8zOqt9HRK0muy6J0dYx3VZe
	VDVX2a6Lng0M4WiwSGNvZWTVduxfWEihlj4+ZoN/TGEu9icIFr5mDkdGrlae9QwgpIUux1O8tha
	KxGNUO8e6WiV8Ky5z+1TycOnSbJw=
X-Received: by 2002:a05:6a20:c784:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3d268cf77bemr17891563637.9.1787940809351;
        Fri, 28 Aug 2026 11:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:c784:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3d268cf77bemr17891508637.9.1787940808861;
        Fri, 28 Aug 2026 11:13:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784845sm8575600eec.2.2026.08.28.11.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:13:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/3] remoteproc: qcom_q6v5: Skip handover callback if already issued
Date: Fri, 28 Aug 2026 23:43:10 +0530
Message-ID: <20260828181311.4038346-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfX9xnvTQy+zdY0
 GYv9vIyiO5o7GO/5YENPb5DECh53ZhwYPAw2yZPVEaJQkruQmq0/8lCgFZlTwSEbe4BvxZujNgu
 hnLXu8p1AJCmKudq2lFW5CSHODzMALlO6fhtCVijneCEG/SlK9crv0CiB67yrxc8SHKR72ME8GB
 RbY3fmJXqKwCuxAPDNU15CCZuBiHh24Lrrj/G+gakkioMmvZvN1FuH4JVj2PuGXxu7aBuqli4Dr
 ZkctPnjsV3X7iC7Vrwk2ICfmVkgTo/e8grknzIAlGFb1oRZ3PZ/gQ3Xr2lWZ5xOm52tfrYCK9YX
 +8tzA6NvzaSXCF3q5MAjCM1HLEAa9AAyqlTgtomE6o5hJLFPIsqeCdShQyFjt9wYswIQ40mWTXH
 6prsjfOSb7odmpIAvFoZ3kBq6VtAIq+0AtwwYaz7ZISiqAlUP3gwzDTbhlh9PhqmvD/1Gnl7hg3
 uGYrabjnISIDFLnfuQA==
X-Proofpoint-ORIG-GUID: T8j6YwNQqNVcAWUjPAx3FAYjwcddhP-I
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfX+2v8v2ab+EM9
 F+uKqY6VgdfEieuurcbHyAx3Yd0yLsAEppOy09MLNtAWbCtIXq5Em6sY/G8Vn6Xo/a3ZOxUieNO
 lYGSPIrlK7ZJvsb3Q8EclSQvLG2j1EA=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a91cfca cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=GHr-1HkMQwPlg4gqiLcA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: T8j6YwNQqNVcAWUjPAx3FAYjwcddhP-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280159

When qcom_pas_attach() is called (subsystem already running at kernel
probe time), it sets handover_issued = true before enabling the handover
IRQ. The handover line may be high already (from bootloader boot), causing
the IRQ to fire immediately. Since proxy resources were never acquired via
qcom_pas_pds_enable() in the attach path, the resulting handover callback
calls pm_runtime_put() on proxy power domains with usage count = 0:

  genpd genpd:0:d00000.remoteproc: Runtime PM usage count underflow!
  genpd genpd:1:d00000.remoteproc: Runtime PM usage count underflow!

Also, because the old code left handover_irq_enabled = false after attach
(fixed separately), the handover IRQ was never disabled inside the handler,
allowing it to fire repeatedly and generating multiple underflows.

Fix by recording whether handover_issued was already set before the IRQ
fires and skipping the handover callback in that case. The callback
releases proxy resources that are only held when the normal start path
ran qcom_pas_pds_enable(); if handover was already marked as issued,
those resources were never acquired and must not be released.

Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index fe148b4b3775..12ba0b80ad3e 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -198,12 +198,18 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_wait_for_start);
 static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 {
 	struct qcom_q6v5 *q6v5 = data;
+	bool previously_issued;
 
+	previously_issued = q6v5->handover_issued;
 	q6v5->handover_issued = true;
 
 	q6v5_handover_irq_disable(q6v5, false);
 
-	if (q6v5->handover)
+	/*
+	 * Skip the handover callback if it was already issued (e.g. attach
+	 * path), as the proxy resources were never acquired in that case.
+	 */
+	if (!previously_issued && q6v5->handover)
 		q6v5->handover(q6v5);
 
 	icc_set_bw(q6v5->path, 0, 0);
-- 
2.55.0

