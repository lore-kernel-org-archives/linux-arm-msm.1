Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646034;
	b=p7VDj9Fv6VyNb75tQTt1kh+YSHlCsX04TFIWgett5cNW+V/O+BawRrhBORK9Fmvceo3v
	 tSJtG9VqeV9/njpwN7noYEpwdDJYiMgTzLCufreEeN7eU/b9eT+8S3lT/QGCJ99dSg85W
	 2+Y5NP9SbxgahSJHbtt2rDAjlJ2YqPCMifrUofBmWtn4iJodeZgP8WLQbbvYS2E45AcrY
	 BC3HQ97YE1sluJMQGqCMXShc0gIvUnI4p9MxxIznptZeqHj3gU284ulsctjTx+xsqJE6B
	 4WAu3HVapbrCqHINmHhsbMwys23pOMc4QJpgtQICov+PPVB2iS1ljh+HCrmkSdS8jDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UttVKb7MWslvuojwoH1mw96vCZ9byntzzqymS3UyJsI=;
	b=Mpl5SmaqN7qqBPRXSfJisusKlq92i42UuOam50Ezp3alsEgveJ8uvT8UohqLzcVlfmOF
	 c4Oby6JnEZ9EpmP3QxbJRhDKQwy7EVKGQqcGCR+09mbjU4lhHGA4rpu6WROia9HKAwmvP
	 uomsQzgFju3nb05AjlGNjNk5pgxi4aAucY7rM8q381mbfQgwN3IpmBG5Wyx8IXFlcRjmz
	 bwZHTRa7ZXXaCDR2yFIJ0pELbDcTPuUdfg/yWBgOg/P4XlAbcnewDycN44rbscjlmvZUi
	 DleHJmbmoZt08kI1rtIYo1YpVMRnP9mnYCY9m33Tw24bjAsUxz3cRTb6WktHE4a55eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="exnL2Y8/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H1XHx4hM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E27606A338
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 19:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E27606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=exnL2Y8/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H1XHx4hM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2ItaPg210920
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 19:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UttVKb7MWsl
	vuojwoH1mw96vCZ9byntzzqymS3UyJsI=; b=exnL2Y8/JnVvjbjSfuTYD8Xumt0
	Zlgs47QV8kvS56AE11qpAnVESj7x434Ofy60fnejMpiPwSHlcrDrPWOnvrWOoJxE
	X/h3SHAXPRY7uTlZL9N8S7jNiXvMMmqIFWEn7cXKhz1u/3zGeYFs+d5m3j4x6iom
	EU+8pU2jJRJ9j1XirOHjQfc8V+qHACm9Ssj05EMrK/H5CaJ3kUOFZzWqkB+h9w1B
	YiQME+56ZvDYoWS6zO89GlG7HEUrphkU/05Tko+V4BfzLCbjuyzjuRFPOMHJgrzz
	PLA2+QhRY9TjeTzAZtYky/CwLrVT92gGp4bMXV6I+Q5u0GOddkUNIQErcRw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r00v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 19:00:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd67466211bso1783125a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793646023; x=1794250823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UttVKb7MWslvuojwoH1mw96vCZ9byntzzqymS3UyJsI=;
        b=H1XHx4hMj1/PRLuApEdkAZVcOlIdNXaT6UXcssaLSwVFeVuga3vL6nahp1ZRfX4h5+
         uLsg4GbOjpKjCgZXn1RFwzx4Ml6LrW5TShbvXTU2EajMXG3OMSBM63+df7oyRZRkFCnw
         RXNriCVbtqy6z3+16VPQPprLrKWDoM0Ee9Pxl856nVpB+Z+N++bAJdl8avH8rj+6m9/L
         aoCYAvlehwYybAsz94lw9W6VTBuwf/tbsi8PkTmpQ33Zk9H/otebSfH9JEJjOG/mAF7z
         k7u822Vd2qKZZ+Jt3nb5A7j/mZYQoWcciDAajqsAGAMjt+yNVN6B7IdT3vvhEc/ntRUi
         xCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646023; x=1794250823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UttVKb7MWslvuojwoH1mw96vCZ9byntzzqymS3UyJsI=;
        b=K7Z5WfOJiPj5eQj+AMSGygVHZkAW4sGCAL4w0SYxJuQ0iKNUqvzm+rKyB0JJAL72Sj
         c285N4UZ7com6J+t/1Y5Bnbf9wsiHWnzVmPl8aEBr/9hpO3/c8FySHGPLomUxQrBsPUH
         MAEBaBYyb6FeriifEBWMt6r9eerrlFJeaH310UWOmP7CCrKHKWt3wV7S1gT1pZcWIKcU
         6BVQyPDd2pCjID5EAnC+9lCjK4PSVO+oR+i45HFiGQfxQ+wMxY1NLrhBTTCRkhICFnnF
         iSzTIs72UdFfTsSDIm6GeuAGdCvjRbTO1LhyzIRzAmZpwSIhO7bhFK69erJCpbFVTy3L
         tCvw==
X-Gm-Message-State: APuU4Z/z/0siZ5Tv1DLOosqN0Kj0J+8LJCJK/CMFL0FjUDoeUNTMnF6d
	vl8sW8raapGCHF3RSbN321YG8/Y74eLqjp2D0jaMvMpZBd2RyZL+hKuHoIqG3xSZG92P3PZ/SKV
	EU0fJqUSRYS109ZNyKrcuHk6p0PWpFuVgp6j682fQdQgDEiKBwd+oxSX0kdJI0oK3MEhT6ROg6z
	1IJPs=
X-Gm-Gg: AYBFou0FnDewRz4d/bdD7UaJFTwtH4J3cH15i+vVGrwACK6faH80pIxHenfMpZHSgD+
	omSfBUBx0NPd7Xc/t0O7BnapFSzYG7DOWbGip2K55cJl1HH/oupLF1dsg+apz1yXZLHTfj8T9/B
	IMA+oVnhAZ/VIoOS0bu1ePdrLuizLM73XVsiTdGR5w/Vjw9H/OpvF0028ViW6HigxU/uSUPKuHf
	Tx6jy+v05ZWRpwyk5Qw+KhX0Y8bE6wTwG0HTLyE08q5yGm6Lg8ju6NimjVzz1w9nfMBwAoNz5gU
	VGWHnkx6XpzzVueedalatn8bbdlAbgsUTZs79/HxBRUw6E0k4jQkWR8656swg/S9mAQIxm8W1XW
	3TMVnvuNQgwGyTDj/RcZHyaNK9ZAJ/nGzNug07INfei62Pn3+xPWwGegnUrK03Mm8NNwq3cYxK3
	jpjjcmFAgWKcfxgx8kcbNTlg==
X-Received: by 2002:a17:90b:1d47:b0:3a0:c85a:ee02 with SMTP id 98e67ed59e1d1-3ae896f87c2mr9662324a91.17.1793646022625;
        Mon, 02 Nov 2026 11:00:22 -0800 (PST)
X-Received: by 2002:a17:90b:1d47:b0:3a0:c85a:ee02 with SMTP id 98e67ed59e1d1-3ae896f87c2mr9662286a91.17.1793646022177;
        Mon, 02 Nov 2026 11:00:22 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c62984bsm444552a91.9.2026.11.02.11.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:00:21 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/4] drm/msm: Inhibit IFPC for state snapshot
Date: Mon,  2 Nov 2026 11:00:07 -0800
Message-ID: <20261102190010.720443-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: dLL44vL-aX4FlwsbjSqnLCWMkr82OjMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX0Vrstx0d0if7
 KoXK4Pfiya4DWCY9P+YpI5CjKw1hD3hJ4w5vhbbFFr6yUfGKIQnzIpXeB3jWhJgVPp6VSTf3Ecx
 0yxuaVoEg0zO3pd/beKyOD2duyshuwj/GhLhRs1nfKfKP4xrWGWvCMGw1mbD/vwbFOv4/dE+p+u
 9+cQKNeMDJuLMrwl6jvfW9dnjJluEu79Y1j0PB194n1YUjq+DlmIgf76V2v4UCKhnQNa1krf92b
 goRQZXckWERNLuKv3YMUgwPpmFOvQdtDjP/Gy5cIHod00B7ifKYFUc1Pa8tYbhzxgSAeyG2Rbwk
 Jt9mswD19bKpDY1gbwR7XHdY79jA9HxENA+V6KfGKU8yND1fpHEydFqvh8WsgSXHJZpSMadB3vn
 VoVV/IRnFmI8iG7vkzIpDkJee/WMH4vR49BOpqUy4kXqwvPQFc7TE2w9Rg0H/viakI5k8U7Cft1
 ZGrXMHCHHh+3yDW7lBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX2fBDMWCCquvv
 S80f80AuNiCN5v+Xtfp3FKUrNV8h5LXZu7Jv86pd0X81RT4Xn8OufnzD+S4roaRe3jns/r7KWbf
 CO/68LL8athPo3CANjkdVfsbQSd7AHQ=
X-Proofpoint-GUID: dLL44vL-aX4FlwsbjSqnLCWMkr82OjMo
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae8ddc7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jgQnFmZX3A3noQDnNKkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020075

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index aa59b28a3392..29209c23fcfa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -81,6 +81,8 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		guard(ifpc_disable)(gpu);
+
 		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
 			msm_gpu_hw_init(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
-- 
2.56.0

