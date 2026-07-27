Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6610F42D75B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173615; cv=none; b=O+x2x1zOOtsory1IBWB84wxayrcu6MYkXmtxUqwDKFt0sQWl14ukBNnIxgXqQxp8aN++IPUQaRFUBkBNDRKCERi8WYInDSiCfDyjPKnwZYZB33+Vk3JEGeK1JB0DtOg0Dw1/O6gtd1JfsPKR5t1OgF3e9EweTZoFijXT5h6iDNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173615; c=relaxed/simple;
	bh=FH9Bg96v4OlNNMxbPigWYpLqruS6b2i0WqU3WY6RQT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRznOx6f504gxY+0l3A9HWOLvm/R0u8vZTjdii2I0VG88e0EucUMEnJlKm5eVg7HCb+HtEw27piT9Wie8uirgM2mi9GNAjZnurQ9nq+RcLCmnhQ1M0CsB70bfUMIsAmcwqL8cTJ00QKH0xTvrngl9yRwwZk79Fd6Hnx5R87Vsn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQ9WT2WN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKlAYyuM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQ9WT2WN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKlAYyuM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlr1Y3787448
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pykGkpBHLHe
	z0gxAx6a95OD7i3/0FrTbzAT7IRtx0Tk=; b=KQ9WT2WNjLiLWwz6oJxi0OVWI6I
	66gYQ/s2pszSC/EYVJc1V6eee3499VNomRpvOjnl/4BSWq5jXC536histT0EGLjO
	seitOSEM5wLKGPWudlRsjjZYxFXERo74dRg+vKBuPgu6RBDFIgMw0KNireTaHrMc
	PbSkRHfDbZ5bqIP6xVBFUlo+3Np8dAUIWRXRXr6QPq4gaHrv2EKjnSWNU0uLs568
	UjZvkFCyZqbhlw7HHO9y1+YrItDWTC7KdMaSTY4dub0MwNU/GojFdLsZdb+u9nh4
	P+KXqQ03H9TSJcS4qaAIfU+fh5Y7x3NuNhrK2fK2wH+CES/RY0iK+Ksib8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2j9c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-520a00c7a03so53132281cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 10:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785173613; x=1785778413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pykGkpBHLHez0gxAx6a95OD7i3/0FrTbzAT7IRtx0Tk=;
        b=QKlAYyuMxzkHnVuJw8hSKoWPmJGkYTmquRYgTDW9SiWNejlrGtQCg0pPryPsUcFzwD
         8e6dpBCTXhuzvzpnsrYZm/dpf48vjtrdIIKpF/cDOzOdJOptv/CrJDK5fcXYkxXiNAAB
         zFLrETo6z9sQlOyZ7Got6WA5EPOxCScTGNTsJEyFqRGSae12tqAsr0H/MyZokE2fZAtp
         icK7MnsS16ONx+g9D5eNCfhbdDs3gZstxZXrUBi1KemRGqVjztAr0NhcC4hmjYwLWLjJ
         JLobzoZAUY7QldbsJ/j2CADCXX8eCtQD6KVfhcC2mR13x54Hlmm8wuk/GXJXfsMd/a/C
         9e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785173613; x=1785778413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pykGkpBHLHez0gxAx6a95OD7i3/0FrTbzAT7IRtx0Tk=;
        b=X7vnEuGhk0VtOUGv5acdiy1AbURRKRgni/ps2yPqeKdnSTy5PUVc6uPTTxrMcYLZtS
         7WHljVLVnvU13PgMD228IlQQO3wtTYkhysDDu7LHUr5m3V4QMP1gQAfkEQKdol9fHjrg
         JGzcA0HOJwdU82j8RVTexRie3np9Q5ncW6C8M1DGGT0mycI8tqUkwKNcg4P+uUdMtLyJ
         BqiWHTnjKALUGT+/eyQ2mHqoBE3pbK1Ue1RzjilABOw0cFDeJ/rZUFK72NJQ2R7q9JB9
         S4QZTXGXc6gGC8op+YMpNfoHyOodJ6wU73fzIBPoBFjsEn0K/g4EkEw6v5E3P8FQxqMV
         wdQw==
X-Forwarded-Encrypted: i=1; AHgh+RqCeHxE0qdqBLAif9WZyHiAncwpJvU2ph2vzUNWAcDaqEE8tZxz9shnbJSx/5RPzbBwOb9Jefb389VClvPM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1YwXOAgc0t4lPROCJiuJkjNhy6N6S6LuE+bX0eei4O0q7lkQk
	AiIvc7GKUzrFmr4j8gEqspRV3E41OmP8aGBp6KVnflBlhF1o7/5/Ak/5HgJU0Uc6lwurEP08NvO
	p4do9snLLXRxrvxss1KiboUvJWQzpF1ltBhsVFYgG1QFYXqTxKYxyBchsrOZLm99wL3Ds
X-Gm-Gg: AR+sD11Nvl7NyiWFAxDvVnbWlbohwinzUokDITnVxS2li8AoJy3p+697F9rjOw+eqex
	JfB9Qjb0mSc42pH73pOcQ46tJhPicuqUKZWdvrGGSWugf6khGkHnWQdPU3uwa5g4zL7eSQKOwUu
	mi2gGjM8CXyvQ2DwZUc399yRpYoDENmpW5i/hezC/8vIjd+VOJPnc0iyzWkS0L+2+5327hvHyuc
	XK+OER6o+ksrtlKRhDNsJxtldY90Is45mBjr5Qkl1eKIO2If9gtnWi8WMeACSfD6uprQ9Y90YU0
	UKIuS34raNZ/zxFryr8dLAR9AhsXz2kR4Tojw3vTU/PKf/y9+b4Y54Fpq/BMBJ7Tmr32BOQqfMb
	vd7u+AZB38RhIIaoL5VzavUueIfSJMq2P9aHPQ8Uk
X-Received: by 2002:ac8:5f8d:0:b0:51a:8eca:78e3 with SMTP id d75a77b69052e-529a836b9c7mr90956731cf.5.1785173612530;
        Mon, 27 Jul 2026 10:33:32 -0700 (PDT)
X-Received: by 2002:ac8:5f8d:0:b0:51a:8eca:78e3 with SMTP id d75a77b69052e-529a836b9c7mr90956371cf.5.1785173612061;
        Mon, 27 Jul 2026 10:33:32 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm2945391a12.15.2026.07.27.10.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:33:30 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] accel/qaic: Add missing <linux/device-id/mhi.h> to sahara and timesync
Date: Mon, 27 Jul 2026 19:33:22 +0200
Message-ID: <20260727173326.2219191-2-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
References: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MiBTYWx0ZWRfX+9NN+uDWDlXo
 TJnUE1ynWpVaujyxhzXzF6mtBSZFsSDvrgGcG/7kwCZ56pW+uisEbNJaEA5k7uSgfCJgjqr8thv
 WNn6AdwsoT53a9eS5GGbimS6eEuRJUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MiBTYWx0ZWRfXzuQVL55P4R3i
 PBwu1kg0fDsow4QIhIXydZsmkaTjeJ/6QGSEvuu+jebYPMKeOGk7hpCB+a2JHAQSYU4+roD+UWQ
 o2GHYcO9dIcUM7pmpUFu+OGp7vG/K4jIjroIcIjEhwgkJ6c5YfNZmGEtIYjPWNapnqarbqHtAkW
 iBGDvHDiZ0MsBIO0+XVpPjE7ScgBK+8JOtJEISw++mk4yZRfYuFjksureQdVIczfeDDitun5NbF
 4ysq9QCqo01KR3WntIRGiAoyV5Fgw6gK8Lp+gi7LnnY1l+joXULgLdEquEs/KxCdT5lfWd0psik
 U3Hd/tmNXx0K1wfV4vQq4CrEtqCzsb6FTs3O17lktYbRY/vHFFy+wWrTwg1Nj/VWnYLT86xy42s
 ptVcZTN7s60mZTE438kuN+NUSueuL6JQ9i9jD0LzcCQGPBtkmO80+ajsQ/qufkfojIdYqsGj12+
 cEWHoL0Y8yzlniSUkNg==
X-Proofpoint-GUID: xt0ju1nPCYStayi16Ub2-0JH6s1Djbwm
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a67966d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ReSfefp3vd-I0XYAfNQA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: xt0ju1nPCYStayi16Ub2-0JH6s1Djbwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270162

qaic_timesync.c and sahara.c use struct mhi_device_id implicitly since
commit 995832b2cebe ("Replace <linux/mod_devicetable.h> by more specific
<linux/device-id/*.h> (c files)") removed <linux/mod_devicetable.h>.

Explicitly include <linux/device-id/mhi.h> in qaic_timesync.c and sahara.c.

Fixes: 995832b2cebe ("Replace <linux/mod_devicetable.h> by more specific <linux/device-id/*.h> (c files)")
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_timesync.c | 1 +
 drivers/accel/qaic/sahara.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
index 45e5f0728ebe..b5162677ccc4 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -2,6 +2,7 @@
 
 /* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
+#include <linux/device-id/mhi.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/math64.h>
diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index c7c0b3eb4b65..8476be9b9148 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -3,6 +3,7 @@
 /* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/devcoredump.h>
+#include <linux/device-id/mhi.h>
 #include <linux/firmware.h>
 #include <linux/limits.h>
 #include <linux/mhi.h>
-- 
2.43.0

