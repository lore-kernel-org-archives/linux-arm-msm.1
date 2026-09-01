Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92962F7F0F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281154; cv=none; b=aWaBcvCQRugNl5G+hNbX5gu6SkhYS8liunFITExz1EUtStnlE8YZDz5TD7K8vL2Juept0+m0SrA1YIeyLiPt/nHwOAX+go+hbaCG4o0KLCUCKOig2HXgqvg73HPlW6Cxz2hKKrKSFSBWptwK38vQA9f7SGO15DofrStWcPXDU9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281154; c=relaxed/simple;
	bh=cOS1bEd1M/SiPxsgNFvMEOu3M8RVaNUUy5WbSBaacdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CZHA4nBLupaTtWD2HSkoyr8hd2Ma+VoD/ZyEnBRYu+MexTqWrJdJIfzms0hzM6A7NSUr2d+XhwMPohfRKZqNZGJPIp6VirC6FurAulCncdNGEt48qV/tXYQkwmrQYuQPelx4TnowjAch/YRKP5dLb27g1UKkppgG+ZI+ywujrn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYbptYnR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJ5clZXh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYbptYnR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJ5clZXh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681G4qS52531631
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 16:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F4+C391BtjP1q9S4/6jLnVVE0nXicN8iK+S
	OD5Ru2jI=; b=BYbptYnRlz12I23yNM1lPLO6n9SI4boNZcLnsP4JGRFxjZw3OFP
	IHkHaG3RdS1Jkfd9xxDUVULG9ISl+B0T7oQ6mM6/FKXRDWSdzLTykYjlCSEYmv5h
	zpt1jjZb9776JZIADbsYSsJeBUeUtw64GogK2anQ6gTU+xc8tCNVP+AyEHWHSKrN
	8J+ERZSsHfV1zYZW0FtbxU/LHSAavrdPMtPlMrp1GZAD1mnKKxKUKTo1ve/9/Qnq
	DnqKU5PtgSW42gETvRGKuPpO2v01bl05Gyw7OesoGkP6EPk1vDrcFsZBYfde2wHn
	ylS2ujcj4AVXMIMTqZYCnYGc/+pZo4HuvPg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wp89pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 16:45:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8553305b7c7so25823b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788281151; x=1788885951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F4+C391BtjP1q9S4/6jLnVVE0nXicN8iK+SOD5Ru2jI=;
        b=MJ5clZXhU62COrXRMcTw25kQwAAXNQFn38eiKafZUxDnjuHrwMOo30CcfSjaDJLwVq
         wVJhu8O2r0Q/FWgnFFF4WRL2BB17edB4Ues+qbt1+C5G9CZcojQ2alOTJMuvymuTfqdp
         KAjdBt/Gghztu1jPrhEQcwres8i+FhFXsqTXoVdnZIz3s8Bl3XzkYZTmx/0E5leC4653
         3XQebgublVJcaweQxVEYekesF5BBLEIoByZmw4zoY1/MEJyq6LPrLhonOXM6jeKbVqKD
         5CRPJA9UgJDJpKbBA2lV99HH8QVBHAIJ1mv25wq0KyAIt//+240pPFXQzhI+5nrylxkm
         481w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281151; x=1788885951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4+C391BtjP1q9S4/6jLnVVE0nXicN8iK+SOD5Ru2jI=;
        b=TkufNonsB08eXdKt8ml4triqrsFJPpRh3dHHm/GtD38A9kv8IWviYT8IvWp/7sQ66Z
         08aJmPOvboqFiBDsGNH/CDsFRCwbF3A9t1BwIfCPuBa4ur+e+5ejhE/TuiAacLrlJXkK
         OdiekMXxgTEu2Edn0mHhs7JrVGNe75tkvfXptAlGIRcozUQfe/A0Mz3RGPPipX2Oz0aP
         +57Rx7E0d4cesHFO0NRPMQUwJeFA8N2ZNg2v6qDPoRTUk50gzvcUeUCUsCmYjJqQbCeb
         wvyldb1ZXIrmKEqeJdN38t5oo5jeY3CgWiyfLnslvGaL74YTBZgv2hOi0aXvwo2Cdb37
         LTCg==
X-Forwarded-Encrypted: i=1; AHgh+RrWsm6c3sKNrJrF/B7/E4iAz2I/wHDeNZxcxhItNBizY5lEjwMRt25kGVV4wp5IjSW1oDGqmdwjuWorsCWE@vger.kernel.org
X-Gm-Message-State: AFuF++kQiR+4Nou7iO5cpKPbyicTeZ/0dXWCLWxuQrCGnxKGtOa2szdo
	iqXoLyWUAoIvWASd0dhgWeaSRq2sSzFFq8a9jhSfb3PJHxO0Zfp48fgmFr4NCJf7eA/861KanIi
	k+ALhXsqVKPJPd/oJcqmH9KX/R9/sFwYCv7Xv1elEYzXfhzLu8XPiMWLJ16jvZu1RPvHl
X-Gm-Gg: AR+sD10uURHDEcSMbffr5sunaFNnl1W22e9DDXFnhVR3eD0DdD+NHsPmGYW6sR3CyOS
	Ro++SDRAZ+JuW0gCMVvm5hAF+uCaul1SjQVljac7UoxZ4zjtDalxKI1Rnr671g47U1NajwGy6Ng
	q6n+vuY0JpNSigSKmtt3mZTBr+pZfaW/w5EhTHhklUNjwWCFUpgyA4oho5i2XWcOxLan/RIgZwb
	H7s9aqy3+YtEG7/lmfVb5QRQJ+wtXE5k1teYL/Ad9whKRPL2S1AiaMimDJEd9nCDVsx5i2zb4j3
	O3KrVfJwOGOL/wALzIbailIkGYOjo+3KLGtU1FY1/4F0dyFDJg4zRf9QiIGRPIkKSHhffsmgPD/
	XKhzI7/do8ZPxspiWdFKX+LvbXGfSlPs8RJ2QBOQNk3QoHRk=
X-Received: by 2002:a05:6a00:4649:b0:84e:f90e:492f with SMTP id d2e1a72fcca58-8562a1f6c2cmr52567325b3a.7.1788281150940;
        Tue, 01 Sep 2026 09:45:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:4649:b0:84e:f90e:492f with SMTP id d2e1a72fcca58-8562a1f6c2cmr52567209b3a.7.1788281150271;
        Tue, 01 Sep 2026 09:45:50 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11fbc41sm163898b3a.60.2026.09.01.09.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:45:49 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Steven Price <steven.price@arm.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display hardware),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware)
Subject: [PATCH v2] drm/gem: Drop ticket arg to lru_scan()
Date: Tue,  1 Sep 2026 09:45:43 -0700
Message-ID: <20260901164544.642985-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97013f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=7CQSdrXTAAAA:8 a=CpjeYB2KrTrYpFnhXQ0A:9
 a=OpyuDcXvxspvyRM73sMx:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: C7EPd7M6drWHrYAV-pXw5rmx8yLngt30
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0NyBTYWx0ZWRfX6LUlqmDAj3Rs
 u0H6BHeml7Z83Morn5ln1nMCj3JjFZVqviJvPHrryxgBdB/kXC4m2/evAE7RoftPabQw1phBEeP
 ea11YrDJeh70Fyf49blXjduIp9PsvwU=
X-Proofpoint-ORIG-GUID: C7EPd7M6drWHrYAV-pXw5rmx8yLngt30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0NyBTYWx0ZWRfX65rf+oKYkbrm
 ny4CqMqjzNXE0hFmqwWRnZTpLKf034S6Tgttbo/4v+ugk2R6OPcl7xEE1Vrjo8eMNo+TXpV+Lnv
 MxuiBsRqemkzE6mZ9aHIdH+7dZ1oFUAsRC1W4/Bvmn1HZuZHgtkWlCbvBbgdhcTppqGgajaikTw
 RrL4DUvl4F7lDKemulhw7Ui1pekgHoIPrk5YtXsnpWxa+H7YxrtcYCiAD9tNhRi0sWLvK8x/w8D
 pEMxg/fvlXsL9Q18f02HRPP6o1BKpWVUx27+9lylEjRlgHD6hJisf7YD8tJjomZefq8BRAGGl0I
 r/dKa74RMUdqGn6lRLxnmFkYp/WgkKc4X7Obdys36si/SUqOth4Ucb8Te5nb78fbG5eNB/FD9Bq
 zEOU82FwVIejf8XbRdyNUQXgCT7SIoZNfIaw3TyjiayKQIittTVvfQ0Mehy+p9mJ7zBfCibCLaQ
 HQtNXCQ9x1sZwTVPYsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010147

Commit 3392291fc509 ("drm/msm: Fix shrinker deadlock") dropped the only
use of the ticket arg, but at the time left drm_gem_lru_scan() unchanged
to avoid conflicts with in-flight panthor shrinker support.  This commit
is the followup to remove the unused arg.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---

v2: Drop left over kerneldoc param description, fix panthor spelling

 drivers/gpu/drm/drm_gem.c              | 14 +++-----------
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 22 ++++++++++------------
 drivers/gpu/drm/panthor/panthor_gem.c  | 14 ++++++--------
 drivers/gpu/drm/panthor/panthor_mmu.c  |  5 ++---
 drivers/gpu/drm/panthor/panthor_mmu.h  |  3 +--
 include/drm/drm_gem.h                  |  3 +--
 6 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index e3ed684ddcf2..3113b4a53b99 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1649,15 +1649,13 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
  * @nr_to_scan: The number of pages to try to reclaim
  * @remaining: The number of pages left to reclaim, should be initialized by caller
  * @shrink: Callback to try to shrink/reclaim the object.
- * @ticket: Optional ww_acquire_ctx context to use for locking
  */
 unsigned long
 drm_gem_lru_scan(struct drm_device *dev,
 		 struct drm_gem_lru *lru,
 		 unsigned int nr_to_scan,
 		 unsigned long *remaining,
-		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
-		 struct ww_acquire_ctx *ticket)
+		 bool (*shrink)(struct drm_gem_object *obj))
 {
 	struct drm_gem_lru still_in_lru;
 	struct drm_gem_object *obj;
@@ -1690,20 +1688,17 @@ drm_gem_lru_scan(struct drm_device *dev,
 		 */
 		mutex_unlock(&dev->gem_lru_mutex);
 
-		if (ticket)
-			ww_acquire_init(ticket, &reservation_ww_class);
-
 		/*
 		 * Note that this still needs to be trylock, since we can
 		 * hit shrinker in response to trying to get backing pages
 		 * for this obj (ie. while it's lock is already held)
 		 */
-		if (!ww_mutex_trylock(&obj->resv->lock, ticket)) {
+		if (!ww_mutex_trylock(&obj->resv->lock, NULL)) {
 			*remaining += obj->size >> PAGE_SHIFT;
 			goto tail;
 		}
 
-		if (shrink(obj, ticket)) {
+		if (shrink(obj)) {
 			freed += obj->size >> PAGE_SHIFT;
 
 			/*
@@ -1727,9 +1722,6 @@ drm_gem_lru_scan(struct drm_device *dev,
 
 		dma_resv_unlock(obj->resv);
 
-		if (ticket)
-			ww_acquire_fini(ticket);
-
 tail:
 		drm_gem_object_put(obj);
 		mutex_lock(&dev->gem_lru_mutex);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 9d2788f79ace..3514d5c84989 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -102,7 +102,7 @@ with_vm_locks(void (*fn)(struct drm_gem_object *obj),
 }
 
 static bool
-purge(struct drm_gem_object *obj, struct ww_acquire_ctx *unused)
+purge(struct drm_gem_object *obj)
 {
 	if (!is_purgeable(to_msm_bo(obj)))
 		return false;
@@ -114,7 +114,7 @@ purge(struct drm_gem_object *obj, struct ww_acquire_ctx *unused)
 }
 
 static bool
-evict(struct drm_gem_object *obj, struct ww_acquire_ctx *unused)
+evict(struct drm_gem_object *obj)
 {
 	if (is_unevictable(to_msm_bo(obj)))
 		return false;
@@ -133,21 +133,21 @@ wait_for_idle(struct drm_gem_object *obj)
 }
 
 static bool
-active_purge(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
+active_purge(struct drm_gem_object *obj)
 {
 	if (!wait_for_idle(obj))
 		return false;
 
-	return purge(obj, ticket);
+	return purge(obj);
 }
 
 static bool
-active_evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
+active_evict(struct drm_gem_object *obj)
 {
 	if (!wait_for_idle(obj))
 		return false;
 
-	return evict(obj, ticket);
+	return evict(obj);
 }
 
 static unsigned long
@@ -156,7 +156,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	struct msm_drm_private *priv = shrinker->private_data;
 	struct {
 		struct drm_gem_lru *lru;
-		bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket);
+		bool (*shrink)(struct drm_gem_object *obj);
 		bool cond;
 		unsigned long freed;
 		unsigned long remaining;
@@ -180,8 +180,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		stages[i].freed =
 			drm_gem_lru_scan(priv->dev, stages[i].lru, nr,
 					 &stages[i].remaining,
-					 stages[i].shrink,
-					 NULL);
+					 stages[i].shrink);
 		nr -= stages[i].freed;
 		freed += stages[i].freed;
 		remaining += stages[i].remaining;
@@ -222,7 +221,7 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
 static const int vmap_shrink_limit = 15;
 
 static bool
-vmap_shrink(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
+vmap_shrink(struct drm_gem_object *obj)
 {
 	if (!is_vunmapable(to_msm_bo(obj)))
 		return false;
@@ -250,8 +249,7 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 		unmapped += drm_gem_lru_scan(priv->dev, lrus[idx],
 					     vmap_shrink_limit - unmapped,
 					     &remaining,
-					     vmap_shrink,
-					     NULL);
+					     vmap_shrink);
 	}
 
 	*(unsigned long *)ptr += unmapped;
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 54535bae2b0c..17408f832af3 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -1392,8 +1392,7 @@ panthor_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	return count ? count : SHRINK_EMPTY;
 }
 
-static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *obj,
-					       struct ww_acquire_ctx *ticket)
+static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *obj)
 {
 	/*
 	 * Track last locked entry for unwinding locks in error and
@@ -1479,8 +1478,7 @@ static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *obj,
 	return ret == 0;
 }
 
-static bool panthor_gem_try_evict(struct drm_gem_object *obj,
-				  struct ww_acquire_ctx *ticket)
+static bool panthor_gem_try_evict(struct drm_gem_object *obj)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 
@@ -1488,7 +1486,7 @@ static bool panthor_gem_try_evict(struct drm_gem_object *obj,
 	if (dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false, 10) <= 0)
 		return false;
 
-	return panthor_gem_try_evict_no_resv_wait(&bo->base, ticket);
+	return panthor_gem_try_evict_no_resv_wait(&bo->base);
 }
 
 static unsigned long
@@ -1503,13 +1501,13 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 
 	freed += drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.unused,
 				  sc->nr_to_scan - freed, &remaining,
-				  panthor_gem_try_evict_no_resv_wait, NULL);
+				  panthor_gem_try_evict_no_resv_wait);
 	if (freed >= sc->nr_to_scan)
 		goto out;
 
 	freed += drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.mmapped,
 				  sc->nr_to_scan - freed, &remaining,
-				  panthor_gem_try_evict_no_resv_wait, NULL);
+				  panthor_gem_try_evict_no_resv_wait);
 	if (freed >= sc->nr_to_scan)
 		goto out;
 
@@ -1523,7 +1521,7 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 
 	freed += drm_gem_lru_scan(&ptdev->base, &ptdev->reclaim.gpu_mapped_shared,
 				  sc->nr_to_scan - freed, &remaining,
-				  panthor_gem_try_evict, NULL);
+				  panthor_gem_try_evict);
 
 out:
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index e10dbd18d8cf..ab070bc74857 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -3133,8 +3133,7 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
 unsigned long
 panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 			     unsigned int nr_to_scan, unsigned long *remaining,
-			     bool (*shrink)(struct drm_gem_object *,
-					    struct ww_acquire_ctx *))
+			     bool (*shrink)(struct drm_gem_object *))
 {
 	unsigned long freed = 0;
 	LIST_HEAD(remaining_vms);
@@ -3160,7 +3159,7 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 
 		freed += drm_gem_lru_scan(&ptdev->base, &vm->reclaim.lru,
 					  nr_to_scan - freed,
-					  remaining, shrink, NULL);
+					  remaining, shrink);
 
 		mutex_lock(&ptdev->base.gem_lru_mutex);
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 3522fbbce369..abc36e7204be 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -52,8 +52,7 @@ int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo);
 unsigned long
 panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 			     unsigned int nr_to_scan, unsigned long *remaining,
-			     bool (*shrink)(struct drm_gem_object *,
-					    struct ww_acquire_ctx *));
+			     bool (*shrink)(struct drm_gem_object *));
 int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec,
 					struct panthor_vm *vm,
 					u32 slot_count);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 8a704f6a65c1..ffa607c91aa2 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -616,8 +616,7 @@ drm_gem_lru_scan(struct drm_device *dev,
 		 struct drm_gem_lru *lru,
 		 unsigned int nr_to_scan,
 		 unsigned long *remaining,
-		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
-		 struct ww_acquire_ctx *ticket);
+		 bool (*shrink)(struct drm_gem_object *obj));
 
 int drm_gem_evict_locked(struct drm_gem_object *obj);
 
-- 
2.55.0

