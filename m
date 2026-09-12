Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07B133B6E8
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789225170; cv=none; b=iNBuk5VYlQhOmXMdtQwJk/OwYvBR3zfl+23eOttTRul1hecy4GbsdjDyfPl+e9yEpRvo0ILsUp0V/767T5Uz7KNuvyCvOSTMkM9+z1XaSaTK5LOWJNtsHRHGqkM1BMF9fn55iONlvyayBQJvPtTCB6Ezph+tCEfV8yue/gxQVnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789225170; c=relaxed/simple;
	bh=s+J+DB3T2OYS4cexx/6gamGsabNdYDCNqoTXrneeivY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YbsmKDaJAxJ/zw/ZMlr3lAv+SicjopCtAmBsQcnOeW6BMHGFsGS0prUS70dt0/IGhJKm627h/ke7OIuBDN4MBtPz6HDKkW8mjKm1fFy9vFaxmmnyyi/ncy+WnLpHPZY6DkUCAd3jtXZQDRy0R/shiGDE5hHmQGOdrED7mF6/GBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8l3qoA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJvKbJ2U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8l3qoA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJvKbJ2U"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdlf24129055
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 14:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3o6Eb4jJTSo
	LrrYSQ6/wTkfaq0oEFAS72SV9H1raKQo=; b=S8l3qoA+GRBPBBxSSdwuMtvF0cg
	8Wt7j+7nu7b4J44GoppgA5hRKV4FU8vmzmQjRViCjhPhS0P1EmAdtOpprzvxJJxB
	63qZX3Jchpk1Fz2+cIzznEn/+SQ6vQc8zUaLsea+tQus5T0CS28TB/NhA8UONckd
	vF7eWfilYjJ5EQBlvTpqHzqoQvAoUvDt5O4TnWSTWA9BpanSCz1tlLmc1EZiApAC
	Dx7dQgocdBrKZwDi+GUa7zJMe4MD3pE3l7TL8ayZCVEuV9/8TOy5LBBhpMxYFKOR
	RFw8fxu8hJTJU2oIt6Z3cN3xAnzb+MpPHge2uND7ZHTU3Aa+EpDn3vexF2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c97dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 14:59:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso1863607a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789225167; x=1789829967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3o6Eb4jJTSoLrrYSQ6/wTkfaq0oEFAS72SV9H1raKQo=;
        b=gJvKbJ2UZgFCxz2t28eAiciMeTEoaYSSQPazz8Aqx7LuUz0WDMIiu21MO0ZEcU0wFy
         p30BXV4QcU2ePmHypMdKJ58pPYSy4T4zK+Dr3xpLJ45rqoH7ZRh9gUWBH16lEMDlgnR5
         SpPkx2zlOO4rOrr74SapNBT/dodfLdKz0b4bTiEpYQidtEplq6QB/aOmFsEbPiX9DTjd
         3FFk7Jd8q235C1oEwflG49LNfvmgJ4em/NqmCSZUogBkiyiBcv9nYPPQWD2KnPOp2fCV
         M8KhiPPUVDp+IKu/U9VTgQU3NzknicWXru1fdI3wF815Lydur7a405SaJjls9J4sRflB
         p+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789225167; x=1789829967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3o6Eb4jJTSoLrrYSQ6/wTkfaq0oEFAS72SV9H1raKQo=;
        b=ev+pc5nPWFVQbQsiq0r0r6KuUU02Md/Oj6bb7Rx+coU6ofOCSRu+UW+hwUdhTKIh8t
         +5oqLdSDECBeOLXmn1qxko+eRf+6TXinTpf/1GGtZy/78e6v/Mmjb/kGQd0wDLl4sKhH
         NA0+yq+a6WqszhAVFnY5NfC6WUTTFRYEK/RuE5JvNeCYtXa+087b/j4h5lwawgyx1h1P
         5aQvVi+UGP+wtmxzLKtaXINR05trSzwbnVsbQkUtoDg7s8X11QQCJPkJoEIRM4L2mpzy
         jQkILzbfKLubFDMxhzbn7qjpscsjBl6t3JNauHA1bqIfm0TG04pPap4oQYJDCnC6b3nr
         s6Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwWixdy1LgxT8b85GRx4swsRzOR7eeDDaBqSAkXq0T3T/X1sJYsm0KyJa3aSvff+xhX6GbctmwWjN4IMpi+@vger.kernel.org
X-Gm-Message-State: AFuF++kgOksZKAeU0d85Ucur81n/c39DIUsrwufXR/4wFXuuWgC/XukR
	eqqao4k2OfI4QUyB3oJ6pDNifEDGdo4k2ZuF5H0K5KMKkpMtt5AyUuYfNIzDnoUcLjD1xW3RWXx
	3KQYhcCz/cW+mHfN9iKzUIfedA0juT/ZoaUEqDZh4eX2Whq5kLDuHKs9zlkhCuBBM8j7n
X-Gm-Gg: AYBFou3wuV1vKlZ3o2uh2tKvWU7QzglTGbg/mw87t3gbDzHaeiUtc88QsqrtEuga3z2
	kGtT8fwBVtWbiN+DwChlUlVJm07uPgVUfnQJbR4glOtKO4vtph2gvLiPpPuUTfR5ZSCqwHKcHPl
	OTtCjZ46qA8fhLD9PIIEeb0ei4n08dxs1ddra1YDFc/cuqoJq1kAej+gXFScHx249yN2pCQlyUj
	7cd4eP1Ty4Wxd8ZhnJeHhS7LuvYKzte678zCrsb5kaPgEOQLH0jUyvFvCLXz54hMEcJpq/LOCY/
	0c3GPUjAMVBzodjWX0yx1RRDkxxdRAtUGEcBa0/dEU8H7Nkvsgv7XjFXYyolhW4TLxUtbPmUjlG
	9IytIIIrGockwI4hMo+vqlSDW2N9X50SvfSrtfbynpNIu2rU=
X-Received: by 2002:a17:90b:384c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39d9b99384dmr14378700a91.0.1789225166897;
        Sat, 12 Sep 2026 07:59:26 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39d9b99384dmr14378658a91.0.1789225166443;
        Sat, 12 Sep 2026 07:59:26 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm12533511a91.2.2026.09.12.07.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:59:26 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/msm/gem: Add modparam to disable shrinker blocking
Date: Sat, 12 Sep 2026 07:59:22 -0700
Message-ID: <20260912145922.24115-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912145922.24115-1-robin.clark@oss.qualcomm.com>
References: <20260912145922.24115-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxNyBTYWx0ZWRfX3IAHJrrEArkK
 PKgjyb9bpiXGkuw13jbZdIxqah1lb5yxWqwxPu3CBXvMKJECxSC3zVF3yZQix80CAPMNTbkyqd2
 ioZ0yXnrGa4SA4jgPm29uRa9+YWWfKE=
X-Proofpoint-GUID: woY7XmL5xMW-1IrTKLcd5yQRpC1KaVbQ
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa568cf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RQ8Jhd0wILkaI2gFI60A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: woY7XmL5xMW-1IrTKLcd5yQRpC1KaVbQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxNyBTYWx0ZWRfXz36ktL1vVoSI
 ogxi9XedtNaSjHvcQlxsTAcwjSp9Lrbtv/jEAlimZNAQVqLeLdwrM7KAFK7MFoO2QHLA1E+LuK9
 hd55ueyw2MhCRcF/BCxsLn9uPstpogtflnRrgBpr6G1rMvUmjvSiMjEw4lHChm9NUJiMWJgZkAF
 fiJNKv4+IwYFC9TyEWUUx32FVTMWs1dmNzwB35GNPNhLkkFTEpgg2clOJeHufcFIQ5C2veRd99W
 iekQLT4aBiW/VbmbmSqX2jca94rl1zSHvP0j2DnNEDdhI1nBSM+JmLf17L8YqCpwqmFPonYPN4O
 VEwzeMas/U1RY4iahW4RnIMze0MWpOxvQIVguyyi2BPATwTB7rvIdYirptIUL74uXJhmXvy8Pxa
 rTz6Mnzin1oB5A3cFPyxlMfepInW+juoQHb2Bltead/RNL20K6E2NYsZiQWYnmMH4Dr6tQFhood
 ABVPxU9uHRgWchaRXlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120217

Normally if we are under enough memory pressure, the shrinker will
eventually start waiting for BOs to become idle.  In some very latency
sensitive use-cases this is undesirable.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 3514d5c84989..83ee032cb21d 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -19,6 +19,10 @@ static bool enable_eviction = true;
 MODULE_PARM_DESC(enable_eviction, "Enable swappable GEM buffers");
 module_param(enable_eviction, bool, 0600);
 
+static bool eviction_can_block = true;
+MODULE_PARM_DESC(eviction_can_block, "Enable blocking for GEM buffer to become idle for eviction");
+module_param(eviction_can_block, bool, 0600);
+
 static bool can_swap(void)
 {
 	return enable_eviction && get_nr_swap_pages() > 0;
@@ -26,6 +30,8 @@ static bool can_swap(void)
 
 static bool can_block(struct shrink_control *sc)
 {
+	if (!eviction_can_block)
+		return false;
 	return (sc->gfp_mask & __GFP_DIRECT_RECLAIM) ||
 	       (current_is_kswapd() && (sc->gfp_mask & __GFP_KSWAPD_RECLAIM));
 }
-- 
2.55.0

