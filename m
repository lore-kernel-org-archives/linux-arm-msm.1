Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896934;
	b=WTyiR7Ot5iFeNfFy9AX0+t95aMx+DfLThCUWT5oxQNC94Xgbjotl0w12U3815gDo0A7W
	 myLFSq2Qhi9QWFQLmbj70fE521tMk6NfLv7Trk4E2+QLjNttgV0MEdnL8GdjC7jzP6Gxk
	 1TYQ/vwedRTwn2jFeDHiplgrRGV9TlZ4FRKg+ICGjgP8l89Hpr2v01EYWg15XXzRaG4X+
	 dz24qpenyoPB1R5NBG8mQ7ZDO9SzLPz12WeOkGwTvsqvOIZ7Z1bILdTlStbr2x1NVAcD2
	 MRJYbjuJNQNZdXOBBP11FKVx1Git+rBDI5fRhhaQt+3Lk19KpV0A1jHzRgBtOghDZTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ioes65rnfp85b6fEnzRJDMNqj/Hc3qhj+ZAMKqnw94Y=;
	b=sqzI+7VEjJUYGYYmmtPy1MzbRwd96M2jYYJHa2uMNV5FFVBJQGsW6o3BbaIQUp9XuvVk
	 LbSkD/r9uxcFDrc/XKLPeyp1SWW8ga1qrJJV+kquEHeqixDWFVKwbVn+WPaYgpicqxPz2
	 lGyuywOhLR9+OxKiQhTMKTRAXCQRS76EZzt5Vo3nnYOZjgLDmhBdf7mGU3XvEjnhvITyy
	 r7jRCJEqxW0lI/GHyzHI9TUywCeZf3hgaNPpuCZtSa9NHflTTaoWhWLjPw+oLlvF5pvQF
	 a7F0w/S963IJpYfgaHt7B4CL3FVGg7jtnnbk4JaQh1hpP4N5Zy6Xvl6myr3SUB+2KKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dkN50QIs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNYy3sQJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0F606A900
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E0F606A900
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dkN50QIs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNYy3sQJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQExn494430
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ioes65rnfp8
	5b6fEnzRJDMNqj/Hc3qhj+ZAMKqnw94Y=; b=dkN50QIs8Rqv6MLkEcYPaicy7Bj
	b3MLYjvVMoBoR2Ephi8W+2+8dYc0IDpPH/McXkw+gPGYvnuXkgOuqzrantsYat1k
	yvtVR74hDDQvTx5aZUP8hFkYXmu2mwGSxNK5biQKoANsdVbK3xHuyIlWa4SBvDX4
	R7pX/pVJiSKukgtYTAP1kC98jq/qQM7h1ngOkI9T9/Wcdsr8QFwRhIwIUIt5RZx8
	n7xWN7Smy+SkBK5e/VKVJspJ729UEubZzy1B7m+Xb3gYctjUGfpeTuw1UTNrEN3C
	q9eCNqs0Um2idqsLA1ge6yUOR86Ny/fowLP4H+KjlrM+s/qp1RLMY9AuGFQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhksqw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:42:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so2163503a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896932; x=1794501732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ioes65rnfp85b6fEnzRJDMNqj/Hc3qhj+ZAMKqnw94Y=;
        b=DNYy3sQJ8r9S6flNRS0MZgTu7qd9z7KIQIcZ8Z4nlrTUVGW1REpGUpOqSMfYDq8iok
         yqK7oynj3p97jeOgtxOlx/AlfMFByyfIKy3sAZq3zKZ180PKu97IHuDf+q51mZ3b7Zsg
         TgcNQ1mxZgfu3eUtvfuIyxTHt8p7Gb1Eg9lGJXXV4HCEdsnj5jVVJ4vCxMkZ+bVTQPTQ
         cDAugLNWxiudD2qv4EzzYgCEX1ytzdtE9KLybAg5KQ5kKzVeDzaWZi2j/W2yQLwdsFA6
         aGmt8YhParoexJ54FzJyRkg/UXTQHcQVE8j/54N5685dzVGWTyy0OwTdcbTFDuJbFzWw
         gerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896932; x=1794501732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ioes65rnfp85b6fEnzRJDMNqj/Hc3qhj+ZAMKqnw94Y=;
        b=r5eWxTvj2SlkFiQH7oT3U4048vQ1GAezSrYRH0jCOC72UadTg01qzCeN256LzDhcTQ
         SQw32w9i9qxVZqao8xitV4xnsgY+5pwExFUjT23dPJerTYeGE8n4ctEHE6liX7y47NGk
         WQm5zP7AxiW7EXqrhNU/RZ/zvPWLIMPwOSl/BWv3EFiLNViWyFbSJax8TQZzqE7kXV9F
         BzliGkLokMBcW7ZQl2XwMIsylKp6uV/Bhl+9zvimTJab1+W0S4quX55Ak/zPBUTXrKZh
         MUgDfBl57vJ3RuKMpZ7DHUP+xz3VL2XvtPxgplGpqLv2Jtzt/fUDD4tZGDQLg/9jTSY6
         53Mw==
X-Gm-Message-State: APuU4Z+C5Q8EdeHh2AiufInQH3p5rpk45Z5S/pBq3LAbmndERVgdzd8x
	p1h3PkvZEI3R5LiVQ7tL/SQb6IKRwZ0kxKvmawkLAHf+vdqCvrqu6hAo/02jucdjIFEWEGe6m+7
	8yuc4wZBftq3lRAPg2eWqRBX8ljJ7KTsK8C9aOzY5tr2kVZCuMUdSIX5je5HGlJD7Ixbf
X-Gm-Gg: AYBFou3tFSZLGLzA4DgQJmsG0LpICMyW079R4xgBabrQBR8rjC7TTdNYuKXxMjrVnmL
	GjVuuQg+z2QIwnuP5ueQaaftZELQpCl4ix0uwQvc/xrOujH+FIqD3DjxwKavm9kqd4nFNUyBQND
	xhTUOJ/oOpWdsgLRABI/vJkXvzWLh3bkm3mPqT4/A3i5SNxfhMFum1ELbHfu7t+uWG3vgOJX1ud
	74i2xTRTSNQRTamzHVraOxlkBiKdVAiFIOw5jysN9gC6e9k6/1Bes+O8H8sKGhFZkKRGO7G08U0
	gWfeTVFBNxPKfYfvyXPeiURl2tbYFJzNaGGViqpzyxtE80L9VheNC1+EMnf9X5mH7TaKCSVUHsP
	WZ9XUxK3GY5kfaKpFQgqKdsU/6S6ByUPsy5dl7FkpH9HNAOcFVBYQx8O3teIDMOd1AiHVdmobMV
	SyoodCVkrf4YX7nxjDFvYa9Usv/gx+KJaEXJnZCJp0qgbsUNHkq7eRQxbEDMD9XA==
X-Received: by 2002:a05:6a21:8889:b0:3e0:b71b:a8ed with SMTP id adf61e73a8af0-3ebb297fa62mr52181637.13.1793896932492;
        Thu, 05 Nov 2026 08:42:12 -0800 (PST)
X-Received: by 2002:a05:6a21:8889:b0:3e0:b71b:a8ed with SMTP id adf61e73a8af0-3ebb297fa62mr52152637.13.1793896932032;
        Thu, 05 Nov 2026 08:42:12 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bb48410sm2289079b3a.46.2026.11.05.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:11 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 6/6] drm/msm: Inhibit IFPC for state snapshot
Date: Thu,  5 Nov 2026 08:41:53 -0800
Message-ID: <20261105164158.23263-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
References: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfXyVFeXFm3zoRq
 fGHbaPZXSuX86LinVJEvp9AxMdB08vrxlgluftWIxlAFvzjs4/w4Ly71f7IMZKaTmSLuKot6LJo
 Kb/sJDd3GiNWt+vaWzR0xygVKjB46GnZjvGnqTcLoq6iTj6jUXHhBk58mXjNI0SHjCRqH3KqqVI
 z8cre6W0wrreeu4bwXBj75eDsR2e2HQlkioB4Y4y1aKlfMSF9pZ8Y6I2ROKHcYB3dE8WcHQY5gT
 UFNSIMA2GOURL7MfH+dNkCUiQWN11rkNLPK1lZSrgIsuOzPUFOvht1SP241DjqJm7HFq0FV+Q5I
 qWmL6CmcC83kBZY4knPLjXF0X5we8kpHPns5Uv/fQBjFP1/CcshzLwYT9H0LotKnCjjHPE5PWZs
 6CwQ5VD8Lu63s0PTHy7GlClw0wFu1XJqbMP1tXoYcb/smdGEJ8TBd0VZWCsZ0pLz6wu1WuQ+jsm
 fdTx4FRZFtKZiGFM3+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX+NJ/RU7FB7XL
 HP0Mvd2M8ndFLUAbBmlanmx3GdskmQmIx2ZC7/6Il7lC/LfnNyldgZHvmtQChd6meDZMUow4iWg
 M2u6eF6s0iEZN0+W25ot5R23+aKJECE=
X-Proofpoint-ORIG-GUID: ZlYh5X3-HyEbdOnyBj_pjws8WRoTn8O1
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aecb1e5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=eWlSUfSnBrBg5eVjM6UA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: ZlYh5X3-HyEbdOnyBj_pjws8WRoTn8O1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050066

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 98f67b7aab66..e6c872ed1a01 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -83,6 +83,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
 		scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
 			msm_gpu_hw_init(gpu);
+			guard(ifpc_disable)(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
 		}
 	}
-- 
2.56.0

