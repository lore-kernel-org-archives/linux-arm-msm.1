Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646035;
	b=t3g2iQ2S9oBbJ7K137A8TBo3tuB3qzdY5WaWZZXaHuqtfMQM85E/bAItQ4Q74WTpFsXA
	 8bv5y5VaYGcyrSk84ABFUQ49WiTXyEgIPIrfmIZDbUyJbvQrU1rmrnfvOYSXAG3/1+aQj
	 4V/t0ZyGg+B34PtEmCxb0fFN+PO8GYG2yhW3RK/I7zhvca6LRPqa/PkXIoPWL4IwhJ6TR
	 4asSRSdBzhmE9i8sDQs5uFsJv49XyIGh+gosg/602z7o5S+gx8+6TLLMb9RkY5HYoHeGe
	 DNfBA/Rmy6ftDt2XeNs4+ah8W/yfnKoH647u46jP7m5jAVUt+uOA7U4IN1hSikeP5Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F6H2yfL9HCI54AnjG5fFp4KvZiYwlVgCCRFJCHr/W4w=;
	b=07OQTQnrwotwctKXJ5sMq1IfWeuQYkAiZVLgE7E7DNIV6bZGzuBoFVSOBggp+tyt9DD5
	 bapIRUXBoPpr5KmlHJOfFI/hfglKuTSTT+pk2y2XCG1PWXzX+53kZz+5ygR6hqy4/YHXg
	 XKjw+UlNX6k+FsChjzPlMxHKYVKmIlU56vJkDFACvG7tX/brPVObNVH/otiAkvdB5w1Xk
	 BZbvvFBkQp37NZJCQ6nwFpSM0dcgxVPdd4bWmY9j6YAIGJ7ZFPgYGPox0dvjG3x87+wKK
	 YjpzdDo0ZAUPSB0S7KaxSw/p4Ry7x1SbnV/UQix/DagFaCoRzVi9ElIYAk7wy6rbqpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="QzAO+G4/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IKGZUWBd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962C9606A331
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 19:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962C9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzAO+G4/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IKGZUWBd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HP19O4000101
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 19:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F6H2yfL9HCI
	54AnjG5fFp4KvZiYwlVgCCRFJCHr/W4w=; b=QzAO+G4/5jBP6PJnzqPoOSD7AoG
	yxS2rHeSt4rH4pKRL7LHQ5uXBPObws+fmXeK8WEwCmKxDhDDjfhKBU3dGbm0FHh5
	ByK5DGthnJ7OWW+suhEh0u3ANYmEWkEdzE9PHASb+ceQW4DziUne2ywsb5DL18Oe
	shcGR0Y+I7iYMSo3de9BLCzWhtH0de3Kubb6QJDGrGVgiJF8A1CYcVCLutAhy8RE
	iwDz6wUufAawN096+P1fXie8kPA9gxHttWT4wqwalzFk94yzFuazSSkOcggYGZgt
	GpP7cCewfVrZ9nJiekv7RV8RFsB4jNQ2xEisdzHpsZB7mDHyAc7Ahw+2Oew==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrjg2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 19:00:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a073778890so2324471b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793646021; x=1794250821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6H2yfL9HCI54AnjG5fFp4KvZiYwlVgCCRFJCHr/W4w=;
        b=IKGZUWBdqYvR1efDqX6AgYEyfwcR6tDoJf9Wgx7Y2W0OdwGZCYQ4k4GC65R/UJvBiY
         yBF8Kgzk41TRCi6h4Ph+++0X+SdjXoceEH+QwapDRR8MaSDRvl6IXapwFJjv2botFNi7
         ELsxHev8QDIKulJSfvDGJzp/ir5bGnat0Q/9RXgP3Wdz/7XbeCuBKgfyA4v5pamUn41y
         sa4VugJTM98ZSTEIER5HuPqbg/sbrGjn7QR8uOclFcadEBG9Dh/bqAMxmV1+WejhvMW9
         rJTD5yXSfzX5vBO/kNaltHwKuy9m8/F9lRxG+EYCAVCnfw4aUs2oSX/VEPA9UdrxawYr
         f0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646021; x=1794250821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F6H2yfL9HCI54AnjG5fFp4KvZiYwlVgCCRFJCHr/W4w=;
        b=XfWHcylDUnkQ7W/D1Xnf6P8obY91ebiWO9kSIwGt4XbFoG++sksJS4/xgZR1xfMv7l
         O8T6SRXhzjSMfldgJOrzJM4G5oL0f5VC/gIQhEvWhht6YihIpyfz03ju1nccVi4+wVGE
         kuuEw2s53FwS/gCX9XekZpgyYzqt4+oj5rlnwgwlst2tNeh5f5fzgDnxk2cdm+f+J0Mq
         d3QUle7RMjtsi+C/dYSJ9KaHkePtwWqoQ0P7DDmU3Wh01ZeZYsTbHEHRI2dUBAKpgc8k
         wHoLihqs367oTKoUBku8D/PKYTweTvlLFwMGgDpBZGFZCyhkPOzDJLADqTPdrRjYUabl
         Lgdw==
X-Gm-Message-State: APuU4Z+B513v+3192fK9sDp/LT8zMHzu1bC0BKs3wxvDPqEbIAkNrIn8
	Ih7Fobs6k4sIFAuNW3iKKiyBgeEtSK0LDq4c62mdvWb8INJa6DfAGmghmu7xDZLAvJvLC1AzH8A
	AUo8UWZ9tOLJlhO8olyz9guFnKGbIO0ODGhLTOkULjA/5z1Kcoc0L8YqujKTfm7c56Nrd
X-Gm-Gg: AYBFou14jANPTCjsjSb5fcyaV72bTzLfiVVXuqQ5b9OlmnVaZreqM1cdso+GxaMoOpd
	kP1FPEM5XxHmO/ah7G0HCWTzqV2Af+CKM97BPbICPj1Awd94DMH+4F2XgN7RVsUNADiVEuEKCV1
	4UW++Zvr3oyaPLDfaTjnIET1Hy1FGgG77V11pvr0MTUIFQ0egyB4g44fIby7xQ1jcaPKDVRCcSl
	gFb9FKys3db6deuIkvcFpsW3zgsG/CJMNackAUeQebu2VlcNZa+xvbvFcsFy4Kr/FfUo1KOjKSE
	RFwIy1oq6+k/GYVw0C2Y4+Ghibqzq7G7j47zNcLDAAJGYpySgYKspY/GmHCURoImork0jGxl3Kf
	2oUDdx1ZFDP+TCsjBnzwipHFLz0KC74DfBJQt42WbI/9wyRAUb5AiTw/3Fymq4RmfAxKmpk77x+
	UkiTukE37QUYVPK3q6urAr1EE=
X-Received: by 2002:a05:6a00:4c1c:b0:89e:43ee:654d with SMTP id d2e1a72fcca58-8a9ba703936mr8590802b3a.5.1793646020759;
        Mon, 02 Nov 2026 11:00:20 -0800 (PST)
X-Received: by 2002:a05:6a00:4c1c:b0:89e:43ee:654d with SMTP id d2e1a72fcca58-8a9ba703936mr8590770b3a.5.1793646020264;
        Mon, 02 Nov 2026 11:00:20 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada9ae39esm2379711b3a.52.2026.11.02.11.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:00:19 -0800 (PST)
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
Subject: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Mon,  2 Nov 2026 11:00:06 -0800
Message-ID: <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8ddc5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: fH5Yjj5KlKnARQaYuY67m0GfN6_ycGy0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX1agdQvKAjkpO
 551F2DoaIC3Cv8d/XjL9cCXr8awlDQd3/SIVnkejfgnJmU6J1RiCJ7/MzybN55gUjukxmlxa9QY
 Yp/B/Bc7WsflMslgqH56VokcyzohGuQ=
X-Proofpoint-ORIG-GUID: fH5Yjj5KlKnARQaYuY67m0GfN6_ycGy0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX7lMnG2jeAaES
 to9ZI15oRnc6Vdql2N5xVCwIWNN0YlZu0sjSPtxEd1nuqotB1JQwvfMNrVgtPHLBq2qC6jxY0G7
 z3y8FMFRH+xJ7npKNy7/B2ex9CJxgMyzvct5QC8+BUeJ35i58jOWriO7IwTpJSCNWhLcqtlEkYI
 mpnH9NppH5DXtxr8XZCVi1PXjAfKUiFT5Pa06hDIECtKv2nAQ6LeUdTH9R2/JJmV/LNhzo33xwD
 ZdqJvwr7jp2ho2wkd5KleFaGLHGiTa/O8q9EVTQyWSkJGZfaP1fYHEQZ7g2pBettcgh008y+pgZ
 KLQmoCn/qnDwtkyJrGIorvhPHBmNbixAc2llxq0oGp+AgTvQhBGE+enEFT7Wl2ePIKeXf0BJJCZ
 dtBTDLTePEPDt4Hqb6iPFyj88nDj8UIk6EWrynMD9ICFUIkI6loIuOeHubJ6hm0hhJngM8KcYem
 wjhU+Dm3+aNvWTWB3UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020075

We need to move the gpu lock around a bit for the next patch.  Use
scoped_guard/etc so we don't have to make the error path handling more
complicated.

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

