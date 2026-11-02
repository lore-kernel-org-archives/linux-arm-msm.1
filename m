Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635812;
	b=swTxMiKvnF3WNcsyO8zyypktKEPbkgigfj7fmatsjH3p766h4aouMaAvzLq7HfwaD08n
	 NDp0150LqPJxc3ZIZBZceXVPBN8KvHyTM1hUOLB6LR2uciVrAHL9KE6kxpYw1TNj+hS9Z
	 sYd6BNkU1ACt+Aanw68hr1VV4BG1DWR9Jtbnlc5GZZ/zfUSy1boEu89A1XeC+Q7gx5uN/
	 U6F3Howbv+FbMKl1BPDBkRhcVJm5zoNynkD61PJaXkIen59hH8/FVuLpSAktOjZ8RBYqJ
	 TfbC/doZVzHCXdWa1+cxXkbmWQLml+ozBQk2ftBv02U4K5PrIknj1NOlZwtoE16AmCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
	b=UsLmDvhUjUoT1noap8LxViCk/0XYwE83zJjVhYps2NvU34yF9IEP21gvS1C6klBHEqgg
	 w3mG5bsCpIgsItHTAuoexigxRxtzC/pWhtHph8LsvOndN+0XqZtwWyt38BEVfF9A+o5Ga
	 9WM5Mpt4OxyyKbK8z7Ynk0SDrm9/8vC9VpRWpcOtdLMlEgI3Emsxlbg4Sgh+5ocn4APCq
	 DjdWL+2huZlrwuo+1fdbNhZ5cnGQY9t8meItqWYdryowVKKjiZO3OJn8ht88i8mqXN0/8
	 +7AIQ8okYsOKokE7Oarj1HlIDFKAFN0QC1YtwsA0Nk8xba47ANGlohhEuWWu7TPWq6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IhXxMwHp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EELs0oDo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3183A6070C8E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 16:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3183A6070C8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IhXxMwHp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EELs0oDo
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpnQt453261
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 16:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e1U31KgLCeK
	QL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=; b=IhXxMwHp5nk3o/6wKy5aRu+1kLw
	Lxo2k5dQh+5ZEm/hm9jptMBaWQZxWhqX2q2Dhnl8cOVQcz7PE6mpFG24OYGEbM52
	F56wQJJtoxaDpiusSTsUG0k7t242oOQe7Czrz8Qy3NsBU6H4BknMZ4SyxTx4UHbg
	XoVxqAF+ZdTu0YiTFo9IzuiVa9TG40qzS0S7eodbg+yl7+9Cz8qxvJuffBxLJkvq
	76vAvScJkFQORQrv4RMXHaVJgCfjYdP1k9fld86B6gfYgQ2vuFKCeWd3cl5q5kzU
	VEbHXU4IPV4MZrzFbMGL/pnaa+QdEnXMpnQ7wryt4vGE5LpM5JLP3kX3DKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6s96a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 16:10:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea785a4decso37674515ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793635810; x=1794240610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
        b=EELs0oDopTOklzH/eU8Uk5jAedzFaQfNsJGufIbluQRzvhSRKE4alqh7A24Q1nGCFk
         ekgKdtscKadw7k9LsgCmqND0222PJ+jPXZD2h12ow1WOmv42tQw1eXhSp4LEjvTTGRzN
         4Iwl3eHX5t3hD2dpZo2n8a8WqG7se3x2YBa6pKQTfuFXxFdYaF3jHaw9yc85swUA5b2g
         OBtdCRaW4WCRFo7GgghBWmdkFABsfJgt3jbhRsALuNvz4XoHrCbOONtzFjAQHnSLrfp/
         4GHT4gs+57L43Wxsko7zs5Q8VFJK4HVzg5WE03jS5aBcvhUfPxFMaGpB2XgSw5hwHR27
         khug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635810; x=1794240610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
        b=yUnqu4gEXzxfk3EFkk/lzEIOiQGbjx/p/toTPs3JIIYpP+OF9clmgDB+qdR67ceNRe
         nnHGcyo/PYwEudlxUlEg8IsFeWpkDkHkHp4ImdTgU9zqB6RRKGBSdsWKAGblyYnhW1yA
         qaX8F+PDoJP5TmdNvi0Ym7ZNqBfC4QhUtF12gXit1ZoHW5sZ+slUNWU/bBks6tj2SxTO
         D56KkE+ii2sBncrHdoielKQQpofIUsfekpApHDb6jsRmDqIVU9mapwGHn0UEhg5P6BZq
         z3AjpigEAtOxBlssF19W6hQhJBJPWB48kjTqBUaN/DUTmXNggtQQNObsVkf9A2atgWxs
         F/uw==
X-Gm-Message-State: APuU4Z92wHGFqYccqkMxYWlVpJzzww3GHVp6yCiCDfQspV8XVVl9dxlF
	u1oS3ZaKuC4tiZBm5YiHX9Mz7fsGfZJRmauN0ouNroLjuMngzL0Alzw9GFvWN9nzvCOYPwCt6BZ
	olshW2M/XWoMBUvZPDH2et97q/QWew8QBlAuEYWDEQsNAZp7rebMAga9kNDNpe/HEKIoe
X-Gm-Gg: AYBFou1RKh/z+ZH0qB/kT4AsdEhliRKU5c3NZIz7IwYU4y5DJJsfIysX6ZFokKiMmpu
	2sevoN0z5g2Ch6CV1rzwiWeZDPuh8jNTXcEc7hFtprMd5Ft9gFu8rXHe8E/zRB/c87x8K3h534B
	Z8cd0oL8fKytYMia1rbgppPojAyDYZ+GqjQeNEjKvA+s61D0iu/c7dTJzk0ipRAb07JdX3iyjnK
	SZgnljXCkuLMm+IG05cxBtI6ilxsXe8PgBCQTEpyhESGVG4/b5SPjJMV976Xu0r+0ZEVSPv1krN
	l18nvWkkiVgbXg7xnSlFEeuQYRmK3PddAzwGUVeVi/MaW93QPkLWdyt9Tv+DjIVnbEYXkIfV11s
	3fOwKWb9bqeAbvYfnJ5rvw0KlS4bcGG96GAtQ62t1tVZqyCUrtzLpgZvz2bkIixeMT9dncQiA7b
	1EYgTNY9RKw2DiYhp9sQ6ysh0=
X-Received: by 2002:a17:903:3885:b0:2e4:ade3:7290 with SMTP id d9443c01a7336-2eb1ac6fad6mr94302445ad.30.1793635809860;
        Mon, 02 Nov 2026 08:10:09 -0800 (PST)
X-Received: by 2002:a17:903:3885:b0:2e4:ade3:7290 with SMTP id d9443c01a7336-2eb1ac6fad6mr94302195ad.30.1793635809241;
        Mon, 02 Nov 2026 08:10:09 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39247e32sm30294415ad.27.2026.11.02.08.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:10:08 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm/gem: Disallow nr_bos for VM_BIND contexts
Date: Mon,  2 Nov 2026 08:10:00 -0800
Message-ID: <20261102161002.497152-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
References: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX6omOppt26zZ1
 gaL0bku87tkdS8PA/LK/iI4VtQCLCeU/B876NgvdtlzWaHGzv8Dn0atY2HSTDwwfsX8TkFynLn/
 g+rK03NXMqbQcPEgbli8n4/friuPa+wW+GkjPqEO3xR+KY8//c6MuliUoqbOv+/qOSYfDl0ylgr
 zyoxG0iqcbREqYXUJCP2pIaJqL4ZIIbwb5PsLkxIyGiE112eCyrJwv2UX/z7czkS1NIgIEd5JYw
 bQfb4IXnFDH+2I0wdiF/olRGMwllgyS0ZInMZfSRfbNpwlgXCkSda2R8apcTd8ZWDpEiwSPTrMB
 pm6CmRMYhpivjZv+c9J7nZnbqpYnv9wYCzocgxfMkwDU1Y7CWa3gKmHdH5Oee1w2IWqmn4hURKS
 jbNtkwikoqK2JDsOxqyv6apLIkv4071PSNb8iiKNsxX2nU2PSdj4bg/Kd2XQzXvXEQ0eXy9DMIS
 ndBb7LJKiU0Is+002WA==
X-Proofpoint-GUID: Drmz4Zfzge2Jjd9EBw15operu4v8AF2U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX9sL6UqBcGt9b
 TE7lu1RWXZd7dpnJIRWoGDoRTbnwBISoHRkn/kDJEqec9l9Yq9S73kn6QYHBsntdBIgb0+9aFNV
 txfRf5UiQ1j5E2CiLiuCMHM4z6n0+as=
X-Proofpoint-ORIG-GUID: Drmz4Zfzge2Jjd9EBw15operu4v8AF2U
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae8b5e2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5-JVGYL1QLZbPSRHqMAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020064

If using VM_BIND, it is invalid to attach BOs to a GEM_SUBMIT ioctl.
Only the VM_BIND ioctl should be used for binding objects.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ff6cf39587c9..b558d07ed2b6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -272,7 +272,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
 	struct drm_exec *exec = &submit->exec;
 	int ret = 0;
 
-	drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	drm_exec_init(&submit->exec, flags, 0);
 	submit->has_exec = true;
 
 	drm_exec_until_all_locked (&submit->exec) {
@@ -589,6 +589,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
+	if (msm_context_is_vmbind(ctx) && args->nr_bos)
+		return UERR(EINVAL, dev, "invalid nr_bos, must be zero for VM_BIND contexts");
+
 	queue = msm_submitqueue_get(ctx, args->queueid);
 	if (!queue)
 		return -ENOENT;
-- 
2.56.0

