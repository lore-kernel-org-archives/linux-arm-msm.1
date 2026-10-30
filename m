Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395199;
	b=TiH+NwFEnPYJfofdl6pz2+8iMAjIdWaAE1PkopSb1SKNEKLcXflksBCr3C/OOOcmI0Oh
	 Ab+TE0dtQCUi8uDFy6gl4I14md1XGGOj3iOu2GZMz9Wv/HGEopEkNZQ2oumhFWfbyK2z2
	 c+fNAhq9299in+03IaFNeck6r3RUqLczuhi2+/p16D1p+gdWVrwqO5arQ6yhg5vMlNltM
	 NNcGL/fTsaeMQfrW1hZl9Hc79aO7B2k0qp6xsoX/PIGiSE13l9B8K6p7+vP0h6146NVXU
	 oELPhLs1X/SIVly37zspq+mumQorxp60btv9+1nAaOaGxajhqZNOtW3ezmZamNgbnOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
	b=2KXENPBKTemRC8JaZB4Ce0e6OQhIFjK+rbVw61RmYVS6yulsaf7c43lzGWZLPCLNHxON
	 Ip/KtjBkALo+TywwzZQw3NzVIoT07jtlk/+bcU/EBUh0vRNatH1EFzlJaidKNd6DLRwE7
	 sDrIFVi6q+J3i5LlICzR9gZlC2IQhPnsfwJcq2I/LDWfqiFby0sA6z76kL1fT9UEJIhaQ
	 4XnRAx+SycjLzNGCtCMyw+oV0UeDUOqz/SGlnkCO52FWIh1lFy3J3SKGLC3ogJaYYljKX
	 ywJQWcB6ht0fDqzgMi+G1RS3xJP6KEnYdlgRm4FTso+LIpgfkwLkGwjKP15U9wy+WvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWMqRK0j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEqlPshY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A153260A2621
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A153260A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWMqRK0j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEqlPshY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULH7Q5261574
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mvo7MCBtKan
	n098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=; b=bWMqRK0jAzC9hiMUeHLN5I/G2dL
	ETokMUQEMbNyy4pm5qWIW0DXrp+h0Rn/15zedKBdZraRuGnoNerikPotR6bQj/TM
	/2pEw/JjbX9kHH9IE1+Hs347ilBd4C4tpy6Fb++k7ge2uYW8zZrvHh/yPVoZWhpt
	03BcXhVE/n/uHWtBpNoQDk+ymrfNgojH/ei1GAEugiqytV1CkalgBkItk90WM4t/
	/X89VpKRa2gWDD/FFozk5X18fE18HRTE2YwSZVwzw3hzbt9G+m5YsTR62nm7t7OA
	AFNNU+RJW7KYSyoumNaI+FewHinBaJJDMgBsJQY9geHxP5cfJPZQNCQbtPA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g1db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso951145a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395197; x=1793999997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
        b=DEqlPshYCJLwRlkZJRKgmay3c2LeSU9AmiChmZ9OKG26fN1Aq+i2GS1ICXbn0yK2F+
         T7Eu98fG+HQdj/ZlJGZpaV8wjyaId3FPGGKMYrszke6QP3XGu2oSQtYkbiclLFF63yNv
         B4Cs3SwbRBy4LsWOunqPvn41SjANf4+9Y7x8FhiIRauJ/Ukg8b67kXpUEd2hiqC+R3ni
         64ck954I4RCut92yrygNm8AKw8WoGncfbJ8FWiTHiMU0wCzVO6HVdVLDT2DacfpCPylf
         CkUraH3z45bQItbjP5jaUki+mghMppsRQSNjjlCy7UnZQDS7KCpiyUrH849Hg7PCFCWj
         GH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395197; x=1793999997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
        b=u20PoilNL4YF6Jdy52zA4xMn5YAMSZFNgr2gG1VdonIoN42iCmLzF91PpZpOsfvSUe
         x4NDJKBWLZOcQt5yChhfxX8UIHVJ+skQ4r55sYFivtAHv32N8w8LXrfBxmZA/a5sdMlY
         yrdDEtKk7Cl34MOcDKWpCAxC5ItBO9JmhdwQk8zw3OX5tpV8r7quQQFDh7TplKnYq/mJ
         m65WocNU737CX5ojVj8////DsAu2SlXtHYz71HZeNIaCciVKJHj/ugzwldb5AFq7Hnv2
         vn8zImdL2qHd9lEIw1oR28FTH/YXVbMRvGo5/DC8wvwS/iF4wwUpngOdR7McQXxkT44f
         dYiw==
X-Gm-Message-State: AFq9FYI6hOtzYDo9QYJHYe+wqf/nHxPaVKU4ljD+QDzLmllOIxEcQPr5
	uAS4LMmrietRv4aKBdhaJhCyaqqGGngB/HpvxEoP0pJRZVkES9+RqCRQHnExY0zsJaNX+znB+3z
	AnrbvXvFEw33tpaTMF+cH+znWvM/f2ABtMSqU1s1ZTEEIQ3L9B+qa4R9mcKOwcGONwFN/
X-Gm-Gg: AYBFou2xAtuzV98heXYkw1a8ufN7JskNg93J9y1sza9OTedhVZEc2MChW/daKgQC7pH
	Rx4Y0mC6uwx9Y3gPNJkb4py5mzPF568JCu8eK1cuaOjWTaawEXQlroKwejGA3f4tCse6IAWDOvu
	Pr4CM61kjwVEJ81w/LkrcEuW8I7dBy6DXoqHUuVmhOiO4cnV08jgmcwROtkVG07zQne88iimwNy
	S0w/i9C94AhlGJPHDsDnbcNmfuZcyIYwVyyzEbUJIJELhFYz1OvwVvFpVfxAg2zyp+GApwSWYmu
	Mslxv/LyfKQToqwjxNqyNpKsDdK1zxnrf+emHQrWuYHxFuKJFr/OcQ0w6P0MmYIGo3ifuiZupt8
	p7kIS3vq2t1xMYKiPU5TLshAXM6AQBqFfBbtVJk1LY07GNLJnF+JhpgGi+Y2n7tYbcyWzOf3VgD
	Kj9o2siw5kKCYlfzIs69rN/iY=
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr2799609a91.40.1793395196883;
        Fri, 30 Oct 2026 14:19:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr2799590a91.40.1793395196372;
        Fri, 30 Oct 2026 14:19:56 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ecaf5sm5291613a91.16.2026.10.30.14.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 12/19] drm/msm: Inhibit IFPC for state snapshot
Date: Fri, 30 Oct 2026 14:18:14 -0700
Message-ID: <20261030211928.45761-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: czvf9RgNGCZBnNHmnf_lYWIAFK_ZciK2
X-Authority-Analysis: v=2.4 cv=No9E4MdJ c=1 sm=1 tr=0 ts=6ae509fd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jgQnFmZX3A3noQDnNKkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX83rryGKEhMjZ
 1IbWcTMtnSknEQILvGmz63S/K41N0cmTKivKw23vMaOIMQbyRvCBwJPIZAEnH+Td3mgcZ0ulK7O
 kfgzjz7TmEUnfd06hWEr4Nr+qV9aeZ1RtYMCsvPZm8F3VSGLm96IQREAWFdCptXpfx8mfhriiLB
 FnDe8E5SDoSD/dSajUm1p4R4ytGfq85EYTtV4KKZYs9as8NQzEkvStaWp/0jvAufMPBCCkysVl6
 7rzbPpr+3Cz1NlZGlnPUzVI7DOTI/qBubadj28Ju1l82SvAMXuU5aWg0tXCmlkuZsqci+si2to4
 EMjY8eY19E2k5XoZjuYiV/bD9SNlnEQA3PyzBpwKWeDzs/X3RCQyqd7FJ691rBQKgTp1NsQVRze
 iGwaVXt5WEZ+TtZUMQrWhhkiLO25kQ==
X-Proofpoint-ORIG-GUID: czvf9RgNGCZBnNHmnf_lYWIAFK_ZciK2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX5Iw0Gy+HOnML
 3pogban/uoVDAlRV+e4knBEFRnB7jPYzL6ImluqFM+Mj3BRuOq/nRDxDze1q3qutrCYEqp5UaQi
 gDjUgrvI0+xZrXUhofoxTVkXBt/1szo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index b0ddc02f67b5..224401b4ab12 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -81,6 +81,8 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		guard(ifpc_disable)(gpu);
+
 		scoped_cond_guard (mutex_intr, return PTR_ERR(scope.lock), &gpu->lock) {
 			msm_gpu_hw_init(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
-- 
2.56.0

