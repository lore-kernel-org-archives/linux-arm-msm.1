Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E553C459AEE
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292219; cv=none; b=NVXHJQDjijwPUuMwjSsNsI+5UXdxclwUk7s15GP3/ZAne+8UO82S9XkpQGv17AU/wc2vneal/1Ym0/umL+xKxINYNlBOg3tCwCOQ3P6Bv2/2e0L+vBF8uuk5DltIcCHQE6zTW/hZ/dnBnqAloZm1UWMJDBGUlYAzcgNlKanY8DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292219; c=relaxed/simple;
	bh=W0L6R4hR/M38aWsJssMfWMsOwZL20FRh/reY64aduFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHNtjfnVZPT2rkVgVKopc/zw6rTkVPyCXdB6HS6K02xGGUMtF8+gg5jCoehBjilhZ95a0HAttApU6C5PJxB8EKYQ4HFet1fuGv/c1f+f0KQqZkI/qKQBE7hq4CQkVq2F2g8oHCFbcGB0wL+xos0YCd3WGaz2H1U7IjSH1Id1L6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKZihoeb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5Nfkexr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKZihoeb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5Nfkexr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPLJV1172256
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 13:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+0zJukh9QSz
	/GMbZNJuCTb3x7RaCsJro6coTIz2KI2c=; b=nKZihoebcqKvrFChvxXlIKhcs/y
	jRpo91KJZ8VHWpGbaZNqG9EWlMfAAyzd9vB+Ok4IY0L/eCsSxCQ9GLyInoXAurWl
	bPlKt2RG4QKDOn+QS9CmWepfi1S2BB9qSEhTREa6pGm8vR9bFxOvvvt+GyUknYt9
	e5j/YV/KHYrHXoPfUbN+zzyC6eqoZ+Th6MDNfwvtbPHQI8sL8XgogvZht4MoMAaI
	2PaoBIHujQysYKl+9ptKosNkcjW5CAQvmvCDtfHlCB5JfE+b5fIdMtpEKHEm80Ij
	FgsaNGFu3k1K5SbEB1q+SmymNv+3SGjjold4WbYHgQG7eN+kB219maXQcuw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwrjau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 13:10:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so5572901a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791292212; x=1791897012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0zJukh9QSz/GMbZNJuCTb3x7RaCsJro6coTIz2KI2c=;
        b=X5NfkexrQoWhw4H/yYGv3aQXhyzoAK2+W8+BBeszgA3Kx6Hub5pxxtU5lkPeCX50S1
         uPNEuB9TwWiJ7AN1iZk2q4o2TKabs/4I+0XbBvUKu8v4BEOlm33WRzbGmjhpI9fIeTXz
         P03wtL5hFxSpGuJfTRl8Cga2FyAtmz7icfgguIHzTwobhWPO41dUm9iMbjUpU5+NWsRg
         eCRNxsbUrTNNdZSwzSuohy1g20xWE/o9D19QXgtjR5ldbikFIc0QBaBTmFU7i5f18vRr
         O2BiRoJ0ak9l8IIW7vG5JZEaGowpcBusbERGslB7EEGkJYo/pwgUkbaI5WaR/U9wHmHj
         JI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292212; x=1791897012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+0zJukh9QSz/GMbZNJuCTb3x7RaCsJro6coTIz2KI2c=;
        b=MLPVHn4D5zFr8pprC9QKDTTmN5k2ER356dfdtkhVMosigH+afrxJESoCch1NispOnQ
         NIqzvOQ2LZXzModzW+e560Y/objh/d24HTtC4jrZZS5wkvbGPVpRI1FQcE+Hr83a2V8s
         yzuncIb0zapnKgqWKwIk/lbgB/gdbFPAEsTeYSjvfbUlvlxLWxTkvLtaVF1XEDzPrmX2
         N8Ud1U5ttjtu9Vs9dwuzPQiVt7kj/G4kNelOfXxuFYw6vYGvMCofo6IqHOzj2ahoBY4Z
         QiR3JPwS4s5vpMTVWUfSpbVWeirNaBIgTkjyJNXEhO15zYhbj4Ufl9kno921G2uNrYUz
         g4UQ==
X-Gm-Message-State: AFq9FYKaAw0hFrOb2MH4UYUWxYj8N3j69lxZ30HrO3picm+/BOKG6540
	bJqhT9rt2PsT8jDk/8sznl43n03EppZvBZaSI5IfCI0p6fIUqxXpVDi6jrPO8ZRdI8v8RRxDi5m
	+6Ik7PWpFp8w2/LrU1Qo6dtL4MV6TZVBXcHpkkFChhahtPX9Cj3v9bbY7bD7Qa0PsQaCN
X-Gm-Gg: AYBFou2rqx9B1cWmFi14oxSXPWnj3bN5NTgp0Loo2LZTnPU9+gMdW1BAKyYtmvlvbUF
	aXhDcP86WOqn13lT/va8wlLvwVeKlqmtXJ8zFJJVhG+OAQb8BxaYwTC2t1JiSGS/5YqKv5/Jw9g
	0Py7LnZaKAi47iL+ROxidAf9vF5k2R4Cn0aLQxV4czsMcjUcRrbGFPhivUPxLg1wv5Pu1VtKZzU
	RvBtHP45vqvC8UGzbwUG7HRLkjTVeGkWTIMVFN9+adZlW09+ghR82G1O7hobpX2KCuWjGxCn337
	jmtjgcracZOk2EsEjSQOFDhz2/KSbn4+cxx9RsxKn7l+XkTE8prXzWOoN7/k9YT5CEYAgImJRv2
	wnm/RS40aP5v2Xrho4rZtezJfQk+g373Y0sImbCESv5TPSw==
X-Received: by 2002:a17:90b:3f8c:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3a78776199bmr8709905a91.58.1791292212054;
        Tue, 06 Oct 2026 06:10:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8c:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3a78776199bmr8709876a91.58.1791292211586;
        Tue, 06 Oct 2026 06:10:11 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ef5b60sm21992595ad.73.2026.10.06.06.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:10:10 -0700 (PDT)
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
Subject: [RFT 2/5] drm/msm/gem: dma_map/unmap_sgtable()
Date: Tue,  6 Oct 2026 06:09:53 -0700
Message-ID: <20261006131000.81501-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX4HGQ1W6AOKSq
 /I11mssrQP9XoBCiAmaAYaFhEe0iNz+tvWH74PTYOmvRrfn+Ddbv6q4OWhXLQ5seZjeEQwXhMXk
 oOSOQ1MhbuxV064D8y8iUaryI4IKk4ukPgYaTocK/tPp1uFDDy4pPpYMbk/mc/udZxa7IQjveHx
 /GhfA6KMVYmHBQLXAfkMzgjazzKp4ITsa0j1BpBYRCpqpZnBnFYbyJd+Viw5Zc4l0BdBt5f3bxT
 2FQ2mR0zTg2IO6W9cAxGQqanAhM6HB5rcH6zpnLhwhJANzHPgnbkUrjWMlyIm43HBTLwycq+mx+
 x1YbrXUrEpm24KySJBDHCc86uvKghzkFIo+nM4nH99DB4ew5JiPQsaMIZ7OJMxDzlK0Xx1am0cG
 GIqfQEm9aHT8ELQ78mCZMmY+aQDE4uGuliHxpnyk4Trbc8k8N1bVGFxtvyAS3TaYpo8Tl5Ik+fb
 CJ1maJVzibn5G5e7+eg==
X-Proofpoint-ORIG-GUID: OECrcbwDpNpNQeafGDVhg3DkYb0DE80X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfXwJSkZuDkWfY3
 cfPuyJ/cTJeH2eOTc6dMOn1s84UO90X66eVNdInioRrVHYBEO2vY4rwnwXfcLoMmCeFbP5OICwv
 9s+mRNyAal2+iYuEc3HJbNdJc1Wb+ww=
X-Proofpoint-GUID: OECrcbwDpNpNQeafGDVhg3DkYb0DE80X
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac4f335 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060052

This should functionally be a no-op for us, since we are managing our
SMMU directly (dma_map_ops is NULL), but it populates the dma_len/
dma_address's so that we can use them for setting up pgtable mappings.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 181b9ad32672..72e3cd8bb1e7 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -219,6 +219,15 @@ static struct page **get_pages(struct drm_gem_object *obj)
 			goto error;
 		}
 
+		ret = dma_map_sgtable(drm_dev_dma_dev(obj->dev),
+				      msm_obj->sgt,
+				      DMA_BIDIRECTIONAL,
+				      DMA_ATTR_SKIP_CPU_SYNC);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "could not map sgtable: %d\n", ret);
+			goto error;
+		}
+
 		update_device_mem(dev->dev_private, obj->size);
 
 		/* For non-cached buffers, ensure the new pages are clean
@@ -233,6 +242,8 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	return msm_obj->pages;
 
 error:
+	if (!IS_ERR(msm_obj->sgt))
+		drm_prime_gem_destroy(obj, msm_obj->sgt);
 	msm_obj->sgt = NULL;
 
 	drm_gem_put_pages(obj, msm_obj->pages, false, false);
@@ -260,6 +271,11 @@ static void put_pages(struct drm_gem_object *obj)
 		if (msm_obj->flags & MSM_BO_WC)
 			sync_for_cpu(msm_obj);
 
+		dma_unmap_sgtable(drm_dev_dma_dev(obj->dev),
+				  msm_obj->sgt,
+				  DMA_BIDIRECTIONAL,
+				  DMA_ATTR_SKIP_CPU_SYNC);
+
 		sg_free_table(msm_obj->sgt);
 		kfree(msm_obj->sgt);
 		msm_obj->sgt = NULL;
-- 
2.55.0

