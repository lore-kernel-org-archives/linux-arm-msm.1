Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD314E4302
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954999; cv=none; b=JlehSTymfYN3AK/dYKMKKGbZN+3mxSALl8tY1GmsPH787CNYthbS0rctqnCvwjbLz4Rbur7Ms0nLuTg5k/VgtZzDEnq7SWYmY0b5xsjcEx54UeAk3dZirzTlEI6jc4N6mvoFZT/nUzWvQVUQ5YCcNgUtIg0AASBK8ltc34mWHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954999; c=relaxed/simple;
	bh=T99F34frJ9AfF2lK9ICPo0C6vzBvlMDk7/qsNG0Fhls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b1zQW5s6kiuBGZLaDC/KK9ikIu5r+tD+ROhpOPBomH4g5S4kgSe89ykwn/66LLnI+KZ78zsB3QLfrfqJuyuiWL9f7YiadPxL6tY1BQjHSrgo9Mea15nzDLcnv1T9U+QdKcdDmvTWY6HB+FPsqi7rRgAirV/qxDLeDIulithA5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOdNgT16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EI9GZY9C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOdNgT16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EI9GZY9C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGma41042969
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 15:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSpAX2ci4IyuylsIuoBJyMoBurc4WTIiQmLhuNQA+dk=; b=DOdNgT16KAspGaPK
	i6EStB1B272SWArCMwjFVYkSnj8Qt8eFpxPtYEDPsCG2oeiDR+8ozC0IL+rRSYL2
	FK2q9KVhK7Vou++t/TTiXeSG4POSX0vwrz3uIdSpseXlZ8HIs3Nm5oyReg3LR0E/
	xOO5XLcs0KVgPsl/7/0As2rFBmssR5P5pcVkyhEOl8DU9chCf6WlDgrwH1qvAC0h
	Wx7eu6m7CvxnAKuZEUq+SZjQpL1Jy62L6MnlMBV5XM0RUT4UObQONkrnIp1Qyojp
	0D+NymiLYK7cAQmxgNMTVECsNZZKzXSU4behxLp7Xs2ClYNiK9IFUf37REzauLah
	iQxqPQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdgc08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 15:29:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso44340a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954996; x=1791559796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FSpAX2ci4IyuylsIuoBJyMoBurc4WTIiQmLhuNQA+dk=;
        b=EI9GZY9C2p8dB6m6kKA9iNfHy61HQ6i2esE7j7cV2l5LQdPO6vaJPFXSMnphs0ym8i
         YHybpt+AddBG0FCd4Nznw8J/3Nao0hFly06nQ+pBk+B4ykcifB145MFt0SNeKrxXudas
         8ipoTXHOoCYSO+Jno8v3EH0zKNMw6Uf2mR5yyysBRlX60hesw4eRGyLZtQEz/3COOBZ1
         t+pEVFcBgFbwrJe4MTwhMveOR4WVoeSYPWAwN+7ePvZj823JV/M9Qd6JDG/mNkR1XTRo
         K66EjCXnSIM8SqqAjrAHVXlaPYDciMQwWYRM4Yio8FT6LYuRfE/Ma4OgnxPx1c/TRbaB
         iD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954996; x=1791559796;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSpAX2ci4IyuylsIuoBJyMoBurc4WTIiQmLhuNQA+dk=;
        b=twuhkBVplUcsx7FOrE6tXkvmv5/6RKXsWvPdvXTpWh7gbH0R1ZsH+psslgyvdbeWtW
         KJK4EyPtoFId7HQiugQ7U6umivUh7ZwnQXy+6S9bJ3G99kWpLRUJNlsOzkoEPZck3bfA
         x3/lEBK33+attVYbr9F8LgMJ/3z1yCV1HcN3u0miWoQXhjI4b5bXaslJay7eYoqhQci9
         LwR0LpFnZRm6EV8RJ8hTny1WHIv1hbX15nVoWUWlHLCf8clV61we65V/zJmzEhdwyWM2
         0dJc/ZvXN8PGG5aqg024d9kUr9P5qedinXg2ICNEe+PrqWkmFmQxtBSZycOOSLV6dm/b
         H5dA==
X-Gm-Message-State: AFq9FYKsga1PECi8PF4A3rk4SvgUbELrp7r8/XA8YlAE3v9/lgd4CJbY
	DVFMFPb+ymKVz18N4oaHVDgF0jwZSKJlq3m9+Dk0K8kEjUsaMwbBORuRey2aH27rrGNUtDGwOEa
	RTxW7y3GL26s135P3Fl7YICr4U3j9JfaMLmEUytARvASNAWSWkfBVyG+UE1czyZCoXPQG
X-Gm-Gg: AYBFou0o3Wmt3bcf4bw2WRFcKmta+Wj0IBBnwKhZt83V5HACBdLxPvW2XoUwmb+748Z
	hrvjLqmpo2wTK59QBc/FUOtUuO7+J8rQqTFOM59zmWEg3bzRYLUYVZJMl4Ks7Yl5yXAh3vhJdNY
	JYCDyLDAVvmVABFo0xLwmcmQ8dUUnmD9MQmdkyBITzfufhIoL69I6ahn3wI9kc4c16FWQDgM0++
	ntK18EYwOPIln1v6lo+6fgyOTx2Vk0tskTvJh4jUPwxGAwmpNoiBROMYbFaHAJuDp33/fePqPjB
	JIaBb6MohmnsV/D2BAarmf0wFeoTvsCuMD6lzEx/ayQclytyA6mJvnSf4J7YUYFbrAE0+uRki/g
	3O4RKmHrkIUIg48AkGOXyWQdwZKmzP8tZB86MO7InLKyDThY=
X-Received: by 2002:a17:90b:5706:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a6cec2ff75mr2095720a91.32.1790954996122;
        Fri, 02 Oct 2026 08:29:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5706:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a6cec2ff75mr2095696a91.32.1790954995609;
        Fri, 02 Oct 2026 08:29:55 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5ddb51sm4390972a91.14.2026.10.02.08.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:54 -0700 (PDT)
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
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v2 2/6] drm/msm/gem: Mmap imported dma-bufs via the exporter
Date: Fri,  2 Oct 2026 08:29:39 -0700
Message-ID: <20261002152948.85308-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfXz2LmOMDy1wZK
 pf2LysH9UuQfDOgw1q8XqThjt81/56hgCJBd2ZtXAuw6WRetrc8+NVvufYQ6rhmm4eJQKpzAdXR
 xEADMXmv0TRFUGB4azRxpBPd2hzxqyc=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6abfcdf4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=plbGacqYsnyxf3yiAH4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: onYFu1qdiyZtFIH9gCM4W6ovPEVX87KW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfXwucB82RT3cRm
 xcmhBjflhCrgTAoLQuiBUUraCAf9ri315GNH5X8WBgmHIfEsNizSjV9FxESubGbJr4CwhKCC/mW
 JOYpcPEmf1Q0q3zBIqU7c8tOjJH3DUvwSMZz1Surn5e/FRf3obpmHGo2Fqn6pE0IZNbxWlNPog9
 w2xJJVPELUIAuc+u6GeHgmJ8OQD3TDubM6QtLqBZpc/Rs3ZCnYhBeZya/CicBSYX0FujGrzYk+a
 MuWBXYoz6tXc1KnFlFtqYP2XpATPbeb3tOR/EGqEAasxZ8H33RZULO0oTN3sL3rkIy1eVo/H1ap
 aLINs7+d/KwP51nD2GO7N3K/jaF73Sp/gs1wgbxhVVXh+gavmqwZ2RIUxqK2EkalmctXJorX1+r
 /ZaVdwH1jq/9MvHIjN8AB8SmqsIzUuffo29kCBBF3rQKZ/HefU7rPETFbrld6XPIEx7r6MFqo7Y
 IS/3IQZMpB82ms9vUnA==
X-Proofpoint-GUID: onYFu1qdiyZtFIH9gCM4W6ovPEVX87KW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

This was always the way it was supposed to work, and when we drop the
page array for imported dma-bufs our fault handling path will no longer
work.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e8390ebd5dd5..c90336b3b231 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -23,6 +23,8 @@
 #include "msm_gpu.h"
 #include "msm_kms.h"
 
+MODULE_IMPORT_NS("DMA_BUF");
+
 static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 {
 	uint64_t total_mem = atomic64_add_return(size, &priv->total_mem);
@@ -338,6 +340,9 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	int err;
 	vm_fault_t ret;
 
+	if (drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj)))
+		return VM_FAULT_SIGBUS;
+
 	/*
 	 * vm_ops.open/drm_gem_mmap_obj and close get and put
 	 * a reference on obj. So, we dont need to hold one here.
@@ -1126,6 +1131,25 @@ static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
+	if (drm_gem_is_imported(obj)) {
+		int ret;
+
+		/* Reset both vm_ops and vm_private_data, so we don't end up with
+		 * vm_ops pointing to our implementation if the dma-buf backend
+		 * doesn't set those fields.
+		 */
+		vma->vm_private_data = NULL;
+		vma->vm_ops = NULL;
+
+		ret = dma_buf_mmap(obj->dma_buf, vma, 0);
+
+		/* Drop the reference drm_gem_mmap_obj() acquired.*/
+		if (!ret)
+			drm_gem_object_put(obj);
+
+		return ret;
+	}
+
 	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vma_get_page_prot(vma));
 
-- 
2.55.0

