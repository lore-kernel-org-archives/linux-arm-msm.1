Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E459C3939B9
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447513; cv=none; b=M3T1kOWNkFpK80OIeHH9aZaOUVVf2VGklZl4g7aBuV62Gj9UP50DaY/dTAiyjMCW4NMPPF5Np9/TEQ94XU65kxd4xe64O93Yjc+bcGO/yPv14/gaHMtTK0EpeSKbRdawbi5nmiFi0FBcPP6Am1pGnjn9UV2zVzOVpfBrJ/EKeo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447513; c=relaxed/simple;
	bh=e+b32niFby/LIQoT6ak9oCbCp1udcfR8ES+knEQXeGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7V5tgcH/Z7gemCuMlAwLO10k3BbGTFu3qOd1m/VnRRZ2/B6Pp6rfMu/oDxOpbjTDj1jqIbxQt533Oe3BPxBrxZJQF19PcDuDFnzGgWqPMqQ59y/YTSEqAW8+9u/ylWnMd36z+ZqVzuDhKGXMvkW4e5jqo5SyMpCno37yUa3q2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMdEq/vQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9Gmf0Tr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMdEq/vQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9Gmf0Tr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxQm63793104
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rCiTSj82OYF
	5QfTUX7zKg4lPx2ctvHCuTZqaZWcoJjM=; b=iMdEq/vQPLGIJbtI7qPFC3/JCWk
	TSXuGyqyy1w7U9dpCannDKH+E2ubk6j7kNSG+Q/ZmH74qqvs4dAKUWj/ueoSD0rh
	JtrhihfrG+Zmifc+IZ8jfe+Z509ovN4eQ+Gg6CpI8shXR6eHDV30uUzgWx0zJ62W
	1HhniEf4FWeY5VUeE3GafFuqNugbra3gzZ3aUp057feU2zPWyZWncDs2SUBeCkIN
	/ExsZPzFfW9dQvriG/dRpBgY19VuoZjuvZaJ4CO+VC7TFJg2YARfmP4qRe+5H0fy
	lBy4YHhF2KLJvHHFeFy7xs5ZUtewnkwfm4GD1HJikeLWqf2ick3o/pMogBQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9sb36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:31:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1110255a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 11:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790447509; x=1791052309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCiTSj82OYF5QfTUX7zKg4lPx2ctvHCuTZqaZWcoJjM=;
        b=i9Gmf0TrEYzNHcBIWUEWGDpENdWN0EHgaYVG2wUnqaA2qWqLT63sRxJXnr6zbdqEfP
         qTawtcWBN0shErcABpBzfhYgI7fNkv8XyJlbsjlgBKg1zRXtb8/Q5HzzuBldRmyNxzTl
         VkSEYoFX9ANwYEnF+UNG3zKwbGyKsGVEqfdVv2Mq1fcdaL0GTJ3ASX3NjvawRX7Xntbq
         GSvHVzAW7IIcvRvLUrJbuqZ8bCZV3u8U9xBe6TsLqvVSRyUVo+uP9HJqWBK7tvIt81aj
         TjxDOU9kex53iuCUKP4Ox1qEfTmhHrgVMv6J72Y6DDU+as7NCkueCm0axxiieZ08ZmSU
         DztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790447509; x=1791052309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCiTSj82OYF5QfTUX7zKg4lPx2ctvHCuTZqaZWcoJjM=;
        b=BDy+/fFNoE+/SXKAchFY1kQKcv5qpQcXmzLqUkpmZ4Q4oTxDus+EeUAKvuEFJe8OsX
         PvKtQwx+0LBQN/hrTTa+QdgbLNlLee7tnFMuWOetH1dGtUPB8czYkMwnrgw2QC0oB8xw
         480THimN1IhiEe+c8XBs+/QxLbW/MFYILN6lPHIsgslXpGbnVX+jR0ufyc7YaNJVbwTL
         bwM+ZqgTRxOm9s9IkMFcUYd+CHzoe+1PF7zjBilJtM86gaH9sBDl28fT5Jlk7aA5iTDU
         tSHzNq98pSeoqv4PwdwD5PN0yBOlUKS+ZI8JHf44umUd9Y1RAi3VD0mRAbTyKP7J2Gaw
         Ao5Q==
X-Gm-Message-State: AFuF++mOnZU9qFX2AVAfODTeWn7Dxdr1zXCdTFOVKlrtV7/9lCBTuHTZ
	4Bv/9rR2kXgKgawlJKvkzy+mwiwK3P9DqZankJ3Fut0EU6jLuVrUxVbNUJdbdHP3AYtRbgIqj2h
	e6s7fz0mDGE7BZx9JzEbINYfXpmYpNl4AfeOr0cBvgIFugGmBiCJHP6qt0Cp4Z4Z7Iw6L
X-Gm-Gg: AYBFou0pKb076EqUQZb2fdn8twIBOE8WmkJNPgNzKQahjhG7oU15+FdIMKAMcJX7o04
	A29rZKyiIBsAxYW2HKN+cGx0ah2Gou7LsvYtE6SUcSw0XqmWbpBw6s62RzacFjZwT61t2KC0NhH
	sCgekoZ/oeiaZZnia18XL4aE46iB4vOjl1AcB56X/9mdQ+Y5lSCf4kaYxGSDJnpn91V5J5z96Ka
	eaZOosOMAgA7GhmxZNBvvAhaTFDuNUrDQDCg+PgrIssPGEMjbhN/B3jgq88XPyszeqvuKe088ob
	O625vLguYJKFk4zSXa1FZUMsw0otufujpiNjIbQVcP/lTOvbVTEV6KA9QUCGi5BDs/iJdSkWvr7
	lcV39aQb9e7IPIcsik/f6Z3F45vBh+LpGZOnlMZ/t8PeGmWI=
X-Received: by 2002:a05:6a00:138d:b0:881:7ff5:605c with SMTP id d2e1a72fcca58-8817ff562d9mr1878434b3a.55.1790447508822;
        Sat, 26 Sep 2026 11:31:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:138d:b0:881:7ff5:605c with SMTP id d2e1a72fcca58-8817ff562d9mr1878419b3a.55.1790447508323;
        Sat, 26 Sep 2026 11:31:48 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea88dc7esm2332614b3a.30.2026.09.26.11.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:31:46 -0700 (PDT)
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
Subject: [PATCH 1/6] drm/msm/gem: Add helper to check if resident
Date: Sat, 26 Sep 2026 11:30:41 -0700
Message-ID: <20260926183051.25754-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926183051.25754-1-robin.clark@oss.qualcomm.com>
References: <20260926183051.25754-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX+CZUl7BWQ0Ts
 ee0Gh2RtLwoV5fuGyX2nTOEizkH47NhAKxfFKwpMR/BiDAzOPTwgIPGXmr1dfTtv9MvbYSAudML
 zn0siwoN8ZDyRdpejXr2M0xYt/7Ctuw=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab80f95 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Ql1oLI5ppxrsW8Emd60A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: CWRegUtVlrISTucDTN6E9Y_53QCbzd0_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX0a+q6EXi65CS
 7VZYdkaAbbNzDZI4DLzqgyvc1MVaxKSd7E59qx0gFsUugKL7ilHm2Wn12AOR+D/yd0QVp8lGJHS
 +Zd4BbynHxW/yfEXlLlm8WpUHajqfuJ/l8ec/0izp8r76tAjXDMfSUigmula+ThLUL+ZR2O4DI3
 MTsiGjOHdRM6WeNZvty5+aJY3suJM5qMuxgWbNou5/fAvQTW5+6hiVLXBvKEp7lftRj1SBOcNyv
 F0zZkC63yZcDhMcygfGVzvwuQxssDzRw41r022S0yc2Iq/eCTzD3+riief9MooUZnHALmYFNiov
 1Kk4FBivZ925Lba5FWk1T8bAGtnTyys17N7z4ZA97pbu7RLLWK0pTFfs79WK0Dc3IqfBBuwOIU4
 L6B//qjyPvCoHRj0+lqFQ1K9YCTixVTMaBv5+mcbwtAn5Kg/l+7phVxb8c6rznqXmy1mghvJIrz
 cmFZgwZKUcBkOLtnvYg==
X-Proofpoint-ORIG-GUID: CWRegUtVlrISTucDTN6E9Y_53QCbzd0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260073

Mostly we don't care about the page array, mapping/etc works in terms of
the sgt.  Add a helper to prepare for allowing the page array to be NULL
for imported dma-bufs.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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

