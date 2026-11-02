Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640013;
	b=MOTd1QJkJbo4yKrnTsKLzZgtHVhr3wCyBpL3EKMmno7oR3YJdB6OqkVMnx6JaDl6Rs1c
	 XDZYZAngZr+ULjNNmlSqxOrz5otPpWi4hYotuFO3c3GbHyT865tC+ZrEfU/65iOU2x3Nr
	 AnMIqPHA2n4nX8KkKaJ7F4y5XPN+iWb3Z9BVRNPz/vzbXFobVWuyKq+vcqVJetSb6Qm5z
	 haqG+KypYsSVTTQO0IZgSxeBuC/zTgf+KamYl88xr3MKV4+Iy10C0EeAKcOZv+ENkUp6g
	 3ijcasccJ7+cW/12msHFIPmVFstlg87bHYa/KiQIPF/+4SyK2DPIZ7dXadOF31/zvRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DPKvk8czbS62fbcTmg1ZaSluRYceZvCPw56cZbEA6vs=;
	b=afLbq09v73e0f7lETKMKiBX85K4fYkRvhuART1sPEycYcmkKbfdwJUFfjYYUpUEwNPVO
	 Lj0+OBJ6iiZzWnjJ+FPxZhpy2l9ih4T3sH8J8WC0MS2Cwdi86DPFHDIO54/8XZJbX6rCt
	 o2Py9MBNe0qsoHNe8k3fZ1r9tpFQ7/+Hj4OkO5ncB4PZLZNlBe5fNICISvVgUE0zCrpyt
	 NEY4Cid2B8lBAioF1uaO1M9lxayw28LzDqLLnRLouI6wAg8AS1XeiD/0wKxP07BLvYJR2
	 v2IdEhVeV79723CcSTN/oqCUlCxjer6cb1IPZ53XmQgu8Z8LdbjNJWv5HOuKI1XHC3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SeOJnIQr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMgpVOlb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C79860A2600
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 17:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C79860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SeOJnIQr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMgpVOlb
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZ4Q21270917
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 17:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DPKvk8czbS6
	2fbcTmg1ZaSluRYceZvCPw56cZbEA6vs=; b=SeOJnIQrqDzYsLP6avWHcV/Rcf4
	8TuVu6a2mZujaoW3QTz2wxf9MS3xpFlegqU49GMlh6qfMzeTTMMgR3pxJdDObJPD
	BjBgIVyc0H75bdK2Y7E4rScr7hcVlw20JcZ7IcPcifSagSV2E5q0BXMeKwmFixoy
	WZFD6bXgxAwgC30AfAWDFXXvxo/sV6Y0ykk44+gZgF+7yEUM4N/OJcZe/JsRdnVy
	/30HutOk6W8KGMPMAUwwhQKOx+RdDpCVomoGG4ppOYdRP0u+45mHtzGUCTI8uyBb
	ZNoJQkqHYdJbMQReO1/wpywO4J4/yNmQVRMVjN3n3vo7eqJL83GJHDtnaKA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvt1yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 17:20:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so4433489a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793640012; x=1794244812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPKvk8czbS62fbcTmg1ZaSluRYceZvCPw56cZbEA6vs=;
        b=BMgpVOlbxiyUZIpbMNokRFSJ5BSYDX7sUk+JxNraOhwldS096+VSl9op+g/vdgCgRI
         CC9mAaepihYGkLer8PkPIw02H0+1XtgRYaLYVrdkrb9zcaqcfNLmplXA7kjod93LYI2s
         IOkHFKxlRpXpAdpmrG24zpUHmymV76clZipapycnIWRydCC9JtHXKxMfAoXNn3Qfn5TL
         zPhLdiRZL1ggbN4WrRDHJxHcbkA1lKNGeNPXIErWX7OOvouOcX9Z8TtVvC+FT/tMrR44
         dVoue1XURg6lRxLOI9KDUnxYVFAj3S7eplKMtGTMEGK8X6H2Df+tTCjdNahXulgcIt0w
         vczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640012; x=1794244812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPKvk8czbS62fbcTmg1ZaSluRYceZvCPw56cZbEA6vs=;
        b=BdeccJ7LLm0OLeR5WdUC4xHM5biQxxgbfBevtxcYqRtQCNwBUe6mo7KAIuCVrl2Sa+
         yDC2goqv68SmDTVW+7HIpvrTpssSJOGBs7xKizbkgY5/Avn8pjqJNXvG0R477gmxiylm
         oC9/plLDjgMQ3DTM1CMD193QUzmUa6pfo0OeOhPPL8ah1u3TP+EgudX0Ld+/k+4A9QTT
         Fxo55x0zCN3TUFFLSX5MQG/D5M8KhF2E7sPOk+L6Oe+q56pEVNOKXBXap9epoU2nksHo
         SUJ90j8ZI1vMCBKucvXFHA4x1eHn3ZEHlTJXN0GOZSbUGvXkm/2FtP97B8AWON8neJTB
         TbUQ==
X-Gm-Message-State: APuU4Z8opzLThn//EFAdzgRFlOdC/q7omLZtrWYqNDgNaxgDbFN/+cow
	e/6qWJU7P1+/G5zinH9wyDJfmsO58leq/NUg/k2DcNmA08x52d0F10vuPgZvdnzd+wEyyuC3jHL
	F96E556tHB2s2zPDy31kqIM85Foc5xkmba8dl7YGqJSq2FXElAWjXqXGK+a20g35c+rPu
X-Gm-Gg: AYBFou1XYKydP7iiL7e8WwYVgzvgkix5FTmwd5wP6a2iJINARIiK8MgrqYBeyvxzHud
	22kSFvl4vHs6zBsVAXVE2xlEs+/578tgDee6+8ZVKchnInZcLI+3ns6cck5BWdile5PDGg2v5FS
	gcznnex75huusD6L4Rxh9pLe9TfN2t+7MJi3NsOE1lz0A1z0F9tR/+y/7Mxau6HqjZyRycwspgc
	O7ME8JIkOuQ3fpf4O+QBq0a6tw242ge0aPUa85O9EaisgLDNwatdIENuyAS8/VQKLYvgGGOy1XZ
	0e3Tsu5xul2KUCFRViK4oz9BPQNMic4RccWaOzmi4vE2r7FDl7vnAZc8GwY/XJVwRHYhtzBwB2Y
	8c+38zYkIqL9y17ibxq8mkyJLBJg4SI0lzxlVZzspYpNK3yJR5mKJE91fdq/6K7q+uRC5szlnTE
	IliPzgHOIQQK2Si6rhXdeklbA=
X-Received: by 2002:a17:90a:a68e:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3ae898166e0mr6719685a91.31.1793640011997;
        Mon, 02 Nov 2026 09:20:11 -0800 (PST)
X-Received: by 2002:a17:90a:a68e:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3ae898166e0mr6719665a91.31.1793640011535;
        Mon, 02 Nov 2026 09:20:11 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e087csm61637a91.4.2026.11.02.09.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:20:10 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/4] drm/msm/gem: Clear nr_ops in lookup_ops() failure path
Date: Mon,  2 Nov 2026 09:20:00 -0800
Message-ID: <20261102172001.508440-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8c64c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Q3LUg_9hO3srVFazYnoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: JBZURjXZFG-kUlj-ifUg92Xfo2KvXsXt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfXzecEK7PrgTLC
 9iEJtU+pX+4GdXaZ6AsuWO7VHlm7dSWHyNlWClFRQEttew2IRZJS06gVmuwFnDmYWDQKLqvvD+i
 LSHua+3ctAG6lBnb3ve2b4ouirADpvM=
X-Proofpoint-ORIG-GUID: JBZURjXZFG-kUlj-ifUg92Xfo2KvXsXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX4MqIGahlpetd
 1fjf6f9oJgtEI8Ij3pxHXS+pMmG/BH7I81Y3LFvQKGyFVo6MonufjniFTQ3b7V+zyJvkLmO98tR
 L3/xnuAzAO8C8nFRmhiZneSC/DK21zvxL7Ii/pG2LKBC1VKHSb+31rfps1JOsbCXnVvV/lUe/xq
 epGqBD1R6wok2gxqCo/l0oyEGoUnsPTAkPIHsT6PyJ+lIgx+cQ1as1WQOJhWIklUugdc7T3UAQY
 dKhqiA25E7+8UpAZAirqogh3wZTMr2c41TqnDCegxp/yUKxoax33nHK+Zbp9M5GrYSCANwzOyeX
 TOY2xo+06ktbmmSV5mbKQo9ei7N9l/bOBRWXAiOJ4K1RazPkn+5pzaHouED1Xq5bQ71U9yWs6My
 S2u2pzJUns+kvPAu/rPrmx9WYFebQAiWm+PgkX6czaXzp9cToly8t9L6iJreX9cYW38u5jNbj7A
 TekapGlP0lgLRVrO8xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020069

We've already dropped the references taken in the handle lookup loop, so
we don't want to drop them again in msm_vma_job_free().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 3177461d7ad0..8b702422030a 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1088,7 +1088,6 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 	}
 
 	if (ret) {
-		job->nr_ops = 0;
 		goto out;
 	}
 
@@ -1143,6 +1142,9 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		}
 	}
 out:
+	if (ret)
+		job->nr_ops = 0;
+
 	return ret;
 }
 
-- 
2.56.0

