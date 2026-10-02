Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5594E06C5
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 15:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954997; cv=none; b=Rs/gUJXDb3vME9A5RRd7kk1EwJ9eCWnYktZnxjIbc3QZepR9Wt11LiS7o8k67fJ3Itq20hox1lrvnIjtyfLldbf+YZ9ERxKNnZNM9vL4CbThcxFzibSKs2eX4eFUe4Gt1U/bh+i35idFqLzuKl7OhEgbXDpPfCamLLXgkX47Hdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954997; c=relaxed/simple;
	bh=mS0FhE2fDdWheJ40UAcPo+5ONGfkjPD7fbDTaywPj8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D40PZl2ZlzpzS5gwjQmDIs6UMGK3h6jcu4P4WaktuIyZ94J8+LkFI1+W4L/EODYwI/z9yeXOujWhJ8E4NAuHd8CSjP3D88SQfWoqwpdbInbu+jxDywsgTDM2U+zMTh4/hidlADkP3+VDLKRwsYP3Pnl62/y8TJa4wGPZ8Gv2RlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LI+BHTHw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ieBMb4G4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LI+BHTHw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ieBMb4G4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGjrj1877919
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 15:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lL9LxccpmF76VS5eD8CEC9JA6/zL6aQP1sNdFqAIvMc=; b=LI+BHTHwrZxYR1kW
	MOD0uRHAu2a2R+tGgm7fqGsjl9rY5l3h/BBn7UffV8FsInKTJcegICwMXsX6PviP
	Xj4dRlrw3rftrYfscS558V4ktad6EM9IuitUQ7jIQK+JgcK5MgbeesZB2f9xwSdL
	OwSYeiHVD8bRuGIZ+f5jZtqfq59Hjfo/xhnX3OPz4+RfjbU0giWebmFLHdnO30vT
	7UwERaKi7pCVq8raIO04PWo/gW9eEev1Y2ncGAs5MinzfFVABvK4lJRDP/dwWvJR
	2Sr8WAUXVYeLvjnd6JZdpbifiWgu9mM545YRLxiFrGIXasSCEl26/E3FNfzKSNgq
	IsWjRw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tkqux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 15:29:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso44302a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 08:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954995; x=1791559795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lL9LxccpmF76VS5eD8CEC9JA6/zL6aQP1sNdFqAIvMc=;
        b=ieBMb4G4eOGxL8OyFN71XEVw04HXqEtZzRzxoAxOImtq4o9YaIR5Ds+VG0syeSrewi
         HuWwZk/HrLeNYkL02mK8xT8jc4kZrQBpsEFSXTUyZXvvyQpJ787fDjmJq4x+7jg7hUO7
         VZFiqzO3OEIBv1Qneb9wdKXQLDtL6vwnf7B7+8CRnXJ3K/vtjTsAmwtHYKpEyPqezABr
         ExAxvhGzUZLxbZHEkK/yqdavjeaZU7mLGnmTu4247E5DM8Bmgqm85DS938+wXEgwi/tR
         O3tGyId6/J1oi84uCxAv8I6Ch10uOPogbO2vxsXHlpr8FBNKHdwvl7xypNfzN/wShRCK
         5L6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954995; x=1791559795;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lL9LxccpmF76VS5eD8CEC9JA6/zL6aQP1sNdFqAIvMc=;
        b=oq+ldsdt8YUplL8k1qCMG7OOelQM/EB2ACcrV476D0VmIp64tG4+rj3ApJcZ6p4NkW
         /6hElzMNfaDbncCQcqOH7uNHVDGMZEGthcKbs3yqmp/i/Ot1Vpc7v9dg6zgp8X9n6NUV
         HifH9CUM7IMDDCQXcOIXlNLn+rvcDxDNeYoxqEVhlJ6W3tVyKX/kvl4aGBnj9ykm+hbg
         FOb5srgzIuhUWV1BbxRfj1PNWRO7oz9CpXGL2vjj5TMWeor2wYiAoe9hSesQ2NNJ0vie
         QIGkhLIIEqSlwiZGTa+fi464iHuPZagPgbCHh5A8OGMRlz7A0Du62jWT39yVpQO2qbcb
         ty1g==
X-Gm-Message-State: AFq9FYLWwrDmJGWOwaWc5Gca6Xm3WpRiERcLOQMOu+sLWJu++wyJVVoB
	LgbO+UQ1z5DVQK6y9OjUg6OcMfYvppmSMFWw4flPJtzf36SsIDzMf3LvURxXvMCDw1cwwePHNy3
	ws9m1U42BKnogBC/6nLyAlT9CgiuBeYTpJ/yjtWyEgEqpwkr2nikbRTBZj7goKrMX/mV0+D0ypK
	t0
X-Gm-Gg: AYBFou3VJkECi7u+7ld7H4ARFshucx/WXT4molcf/eFSv9aPrPEHkayyr7gWCAbDbI/
	jt2qkBDqUZ37YneLxCkhzUDLqjTlu80+3jd4EAjO/CZP1CQjp0XrXpzvBzzkDFuBfjaEJ6ABDkx
	RSZow4Tee0AVEr7fivh8kUiriVMMFh+LzysOf/OVwB4LFVJ5OqB9zecVyBa/xglgojyu0y203L1
	TiyTWRN1hGep6RZ9Sb4s9VY95+80UXd3XbjuusxzaTn9gbUa4It/JYKcWs1UHL0jMx4/e73azMM
	PJSZBcSjz8jVdt1s8uN7uacMA7x0XRGpj9EUf1wXVClXEveSDCO+FtdV/7ZnPDNGbKmLlV/Ah1N
	q4bQeA25qnx1dRI9q7V0bPyUW8S2QHopyzR/qkTq/ZWZ1XN8=
X-Received: by 2002:a17:90b:268f:b0:3a4:e735:b3a3 with SMTP id 98e67ed59e1d1-3a6cec8cd26mr1765389a91.40.1790954994392;
        Fri, 02 Oct 2026 08:29:54 -0700 (PDT)
X-Received: by 2002:a17:90b:268f:b0:3a4:e735:b3a3 with SMTP id 98e67ed59e1d1-3a6cec8cd26mr1765372a91.40.1790954993839;
        Fri, 02 Oct 2026 08:29:53 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f471b16asm9657791a91.9.2026.10.02.08.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/6] drm/msm/gem: Add helper to check if resident
Date: Fri,  2 Oct 2026 08:29:38 -0700
Message-ID: <20261002152948.85308-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
References: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RtuEJVLUMdFy5glVA_qTOByykzomxX-b
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abfcdf3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=Ql1oLI5ppxrsW8Emd60A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfXxZ1cMCmch8tr
 JIkt/8gXsgbTplCTn3tzqsxXL+41MhHNXhhxzH/5Nn5IO9t9K0OI0W+JpLdQ4rFJYRKYaujX+bE
 KWgEhtL7J//JFDkMTu3/uqVMHpQ/PePIMUMJMzMjGQU+Rl+YVScUe4ablZpEnavAB1U8qNnSGxt
 nj579swV/r/fMdIh6p2Wyloqp2o5C84d6RMnC2eGI2dqM8wFct+jZ+ZyLHyTHo/BMljpOgJUJ1w
 /NYS/iBBMIBr+W9RnHz7kep71iP5gLTzgG1Zj3tUTmDAGLABaZoCFhQ40D/WL3Up2Z/HsdkvDay
 lqcB1/86fm6O4mJnLQqTOs0e4/rNg7KyL6iG1R8M6oAc+slBzOV/AoypkOtwbyCTPOklYMgWkgH
 5JyoOi4luzbMG5U7oXJ2DkSZuzJvG/xxbiLdbBzJK8JHvNuEFcJ+uDJ58J3ks68E1FijlJqW5ho
 4E7JM3mjww6eVJztbLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX63CvcSCFc1kU
 aggumRJqdgXrZqHqJWjlWLWuW+3WHOJ25euP982KMgqpMos7uzoPTf3bwxFMuLqQuiq/b0HEN3Z
 azdGrSjJQ4XiNUgLGRsBOo096gbsPS0=
X-Proofpoint-ORIG-GUID: RtuEJVLUMdFy5glVA_qTOByykzomxX-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

Mostly we don't care about the page array, mapping/etc works in terms of
the sgt.  Add a helper to prepare for allowing the page array to be NULL
for imported dma-bufs.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 8 ++++----
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c4cff3d53d81..e8390ebd5dd5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -147,7 +147,7 @@ static void update_lru_active(struct drm_gem_object *obj)
 	struct msm_drm_private *priv = obj->dev->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	GEM_WARN_ON(!msm_obj->pages);
+	GEM_WARN_ON(!is_resident(msm_obj));
 
 	if (msm_obj->pin_count) {
 		drm_gem_lru_move_tail_locked(&priv->lru.pinned, obj);
@@ -167,7 +167,7 @@ static void update_lru_locked(struct drm_gem_object *obj)
 
 	msm_gem_assert_locked(&msm_obj->base);
 
-	if (!msm_obj->pages) {
+	if (!is_resident(msm_obj)) {
 		GEM_WARN_ON(msm_obj->pin_count);
 
 		drm_gem_lru_move_tail_locked(&priv->lru.unbacked, obj);
@@ -949,7 +949,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		stats->active.size += obj->size;
 	}
 
-	if (msm_obj->pages) {
+	if (is_resident(msm_obj)) {
 		stats->resident.count++;
 		stats->resident.size += obj->size;
 	}
@@ -1172,7 +1172,7 @@ static enum drm_gem_object_status msm_gem_status(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	enum drm_gem_object_status status = 0;
 
-	if (msm_obj->pages)
+	if (is_resident(msm_obj))
 		status |= DRM_GEM_OBJECT_RESIDENT;
 
 	if (msm_obj->madv == MSM_MADV_DONTNEED)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index dff60cbc9d95..73dafe080bfd 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -419,6 +419,12 @@ static inline bool is_unevictable(struct msm_gem_object *msm_obj)
 	return is_unpurgeable(msm_obj) || msm_obj->vaddr;
 }
 
+/* Are backing pages/sgt allocated? */
+static inline bool is_resident(struct msm_gem_object *msm_obj)
+{
+	return !!msm_obj->pages;
+}
+
 void msm_gem_purge(struct drm_gem_object *obj);
 void msm_gem_evict(struct drm_gem_object *obj);
 void msm_gem_vunmap(struct drm_gem_object *obj);
-- 
2.55.0

