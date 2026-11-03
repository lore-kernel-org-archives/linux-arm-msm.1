Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731666;
	b=raK5Vtybp7YI5fnjg3O2BYAlFFvHy4zoA2aB2Vcob2o43B4y1f7F5AS4PM5pGDLOqYZZ
	 YUKfTCan37WSHLvNDgkrs8loLQ+7LthrSX05Iq4z7SpjVBm6dLFdz/HqErFoFADuYr61c
	 C65Zb0Z7M1PldMLVmz1+A59Rr8Xs6rVPtOF67VcEl3d4yM2qqnF9DepHh4D6cE8IXx8bh
	 g8XvBSgtZ7y99ehIroUFJTQm6q2i0L1hYzCTp5vV+ZfuPrHymbCzw+YJe5X4L06IQ2xIB
	 9qYJperZxYmaG9CDonG+Ca4eGXjCD5/CzqYaeM4LFHRd+QhcCbOBMhlNo8iak/GXhew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
	b=CD5SPx611MCdJ4PJRgV93W2ZTl6Y5LjaVnGJkd4iK/wrHnb3Zxxahav+zeXQplsj93TT
	 wM/UhljedhsND8gcTHIQZTd1MI5M/7czwYFiKcTjp8IQOwLk4waMQ3KVpWw7hMJQRBBit
	 5HmEbg9XNu9A51rtVge1DTrbCXNcWDpfCj8vZJnUqKVN+gtzhnYAyNNP7iS4eenHkuz43
	 qnJj5717IsuJKl9MvKDOx9U1nNrb4bcp3Tq3P9UTCYPcnp6jqURiaUXSJa5rmAaYqbWv6
	 e1ZvolKHdJgLI8sFdkgiTPvf0/zxAG8Zpw5dsqiIRigmaGktTOEVnaXXt7S/k4QscJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PVWQkSSZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WGSBekiB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B84606A32F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 18:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B84606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PVWQkSSZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WGSBekiB
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ74T056655
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 18:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9R7AOWcFK2O
	6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=; b=PVWQkSSZJC/z/n6VAMha+F5P5v2
	erT/O5hJQqURWiLGhRQk8VDBQv0dt8HHZ+RYzBYDmYqSAx2IRX0SHBUEnJCXalal
	ufJp5Rsy8yV23iLQGE/yrjSe1BcFm26MyPazDhrduGi1EmGBR7SCCBMmKLijVsgs
	tFRuUnXBZTtPQf8JqWhu6wDducHPrm+9QZ1GGiw2YMMaWFBEmAB9oct3aVs30qjr
	xtBnXYwsx5Xcu0rOK58p7Dft16GRojHfj7dtI4IuuZOk5McR178zEFitaW1NhH9M
	tKVUzezFSKRQPvFSXeKuslkCtR1NyfNgatOsI/alDbQyn1LNfY7mh7KHpRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp8k5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 18:47:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf3f829b3so45193165ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793731663; x=1794336463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
        b=WGSBekiBTdx/fz/vKMkp68TWFVACKl4qIS8JFs5OCgynAZHlDg7HNWIwKDRDGSLuT0
         ROWcxM5Y5YvYe00A2iTN/e2w/6jK7vjQbpFsfvzo0wHCKOEFUTayWqG6WjETTm/vQsgm
         rNp/dNtWAk0eggIWb7pEYbZfUyO6V00OiRNnApfOeMmkuZa5lbpoxJlRzEGXG4m4dcem
         OQOXovAraw2IMCo7aiRtTUv2eEXsLatCHWNSqyAH9uM6T4MBNY5nVkOl0KyOCjvLI6+n
         +WccuK5gvgkewOVI7GSW0L7T66KNj1Kq5M45VNkQ7tVZ/ZWbnTyAfGMFZQMeGKi1IMEb
         H07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731663; x=1794336463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
        b=SbORUsTEDBCePMYImJXIxoAsdcgAUmfKr0msMkNpuFy2KHQNVArBBF9kgQxYHH7+Xj
         WhIrJ/fus3rfkPfaWO+DZJbnXpKyh09Sd8vvUp/Xs6ugneS6NPpZ53fNe8dzukUIpWwc
         wbOlWwXabfAwYt0HBniz2kjifFvGeMAatLFeMmuLn+caAqe/gNhYZZhL6kiN24KqGLlM
         A0JuGb6GG7cSCnvRpxZ8E6PcC6GDS+UwQCslSJyhSvwSEtHuM7wMxXEYL8SUQ7M4M3Qz
         3UHzp4ITkEMkqhWyU3f4+GGQFsnOsuGHBSscSAdlkZDIijJDufqlWQRssNFg3izQsyFI
         eyyQ==
X-Gm-Message-State: APuU4Z/trvn2+34BoLfvkHbhJScda/sbk5NGTOs11UokG/JN6GP1DmIy
	fMtoDY5rdlAMbR1VV0FXgAPsZANHbsggLO4HOHiLe7xk5L7PaTMT0mMoXFEAKf/xNDx7L0eJfVS
	n8e336dLs78R2oVoVYUivotNDSdM8QmxuKqZqHfJLSvw5TovjxfqhsUv+BGx7yM+6xCNI
X-Gm-Gg: AYBFou1fSTc8ipe7nysU5BXajzMe9bqeCpi8dWzwSWgCPrpRSOlaRqJNLV8g8pAVW+5
	GTQoONMCQUWJf6VilVEuHCt2AlW0k8Wbftj42S8LTx9fyjkA3x7Emge0UalKv/GFAzfnuGugySM
	Yma3r+DvG/Db+jyYB5tgM+Kkjhoony6ICQfUYOKBxZCFU0NisQSc1WHr+0oY5KJJPOxbV69mr95
	oE1txZ0Lgsfk0i2YAzm0pmCe4SruZiwuTf8e8fXkzHxLfkvnoTCiFH2pKgyf4ryJ7UXmBejFCsx
	IWGD8VtKZxq6SFa1GaCS2DhAoJlVaoUdYaWR5A7IWA0BQfiwaunNJkN/5ZUP3FFU+x+SseCYN8s
	HyhUNr0xKDkp3ViVzPEx1BSz1/JN8vrI4/O0w90eCHMzxnuwLsRjuqI69wmLLRRZi2/7QTroHSF
	dv35LoGPCu8Tpm9at0LDmrMI+2J1gce+FOo6XoMj/sVEUWo9eui8Kk3NxZfA==
X-Received: by 2002:a17:903:1b47:b0:2e9:6788:9381 with SMTP id d9443c01a7336-2eb36396895mr125207645ad.7.1793731663369;
        Tue, 03 Nov 2026 10:47:43 -0800 (PST)
X-Received: by 2002:a17:903:1b47:b0:2e9:6788:9381 with SMTP id d9443c01a7336-2eb36396895mr125207415ad.7.1793731662914;
        Tue, 03 Nov 2026 10:47:42 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5fesm44626145ad.21.2026.11.03.10.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:47:42 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Tue,  3 Nov 2026 10:47:09 -0800
Message-ID: <20261103184713.29664-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
References: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX9uxvYSOjz1s0
 3Bc7mwHhwS15aL8kyygeWnwnzk5RAnBQ7RjJNuVl/enbim9e/+/QnRM0P+knrHndPOg4tE0PL0y
 SMmC0JY9FrZy3NV0Fi0JboMlR5Kebffjj9ixno2koGOXE+oRT8yJn+93qbJWzIe4b1z4BpJB91o
 NSg08F6MbvhRwUzjFcPMzYx/5kkzc9jh9GQX90fqQSOfEDfQX3RmRFvBjehRWBTylNMkSOPhOLW
 sRrmGkxpyZqMduU29fpnYdO1KLe84K7XDDLQKxGknc4WKVGAPHcxTOXIQjxN1odnSDkB3OP2ZCd
 YDOYhfao+5lPcsO2nn9RjMM55Hclh5CbG6oD1EvItrauOpcDK+rqgMx2XbWV/G1ZKmb4u2kNZDG
 iDEG/qHe2pBk556nPrHu2ryLF7A5wz/uU4gb6cObui95xDMc0P548TC/UJ6miYeejfvaaeUN4t0
 43SE0yOWkzuvqhs1qxw==
X-Proofpoint-GUID: tyvJmF9ZRXcjvc46ejr6pP-KZOIfUnZz
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea2c50 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfXwIOTcBLl+0v3
 WxRiP6YSFETD2jXeRXotYYT2VN+46Z/upm6sie9i3u5e8lquVvR/ERDrTwXlIw9hybtqTLfJN8P
 biIXmBYpezGvwceFIFK787WMO6gkdm0=
X-Proofpoint-ORIG-GUID: tyvJmF9ZRXcjvc46ejr6pP-KZOIfUnZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030074

We need to move the gpu lock around a bit for the next patch.  Use
scoped_guard/etc so we don't have to make the error path handling more
complicated.

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index f12701e286ec..aa59b28a3392 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	struct drm_device *dev = inode->i_private;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gpu *gpu = priv->gpu;
-	struct msm_gpu_show_priv *show_priv;
 	int ret;
 
 	if (!gpu || !gpu->funcs->gpu_state_get)
 		return -ENODEV;
 
-	show_priv = kmalloc_obj(*show_priv);
+	struct msm_gpu_show_priv *show_priv __free(kfree)
+		= kmalloc_obj(*show_priv);
 	if (!show_priv)
 		return -ENOMEM;
 
-	ret = mutex_lock_interruptible(&gpu->lock);
-	if (ret)
-		goto free_priv;
-
-	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_hw_init(gpu);
-	show_priv->state = gpu->funcs->gpu_state_get(gpu);
-	pm_runtime_put_sync(&gpu->pdev->dev);
-
-	mutex_unlock(&gpu->lock);
+	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
+			msm_gpu_hw_init(gpu);
+			show_priv->state = gpu->funcs->gpu_state_get(gpu);
+		}
+	}
 
 	if (IS_ERR(show_priv->state)) {
-		ret = PTR_ERR(show_priv->state);
-		goto free_priv;
+		return PTR_ERR(show_priv->state);
 	}
 
 	show_priv->dev = dev;
 
 	ret = single_open(file, msm_gpu_show, show_priv);
 	if (ret)
-		goto free_priv;
+		return ret;
 
-	return 0;
+	retain_and_null_ptr(show_priv);
 
-free_priv:
-	kfree(show_priv);
-	return ret;
+	return 0;
 }
 
 static const struct file_operations msm_gpu_fops = {
-- 
2.56.0

