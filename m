Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F6B349CF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232970; cv=none; b=jpWoScRL7gM+XBxyFXNrH57BnONoMvRkBbvQfI+h1JNknhXhzWxtmCt5LkYlyK5YXPF7xjta7l8cl7wGwmBtA4NJ6iyMtEyW6CjFpQNje3BV7ndCe7jao2xrDDUu3Q9s7peR6QV7Z7UrNxF7Xyd3GHi4uSr/bXSUBhoP6cau/oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232970; c=relaxed/simple;
	bh=KuRE2G+9WZSgtg+s9COPO+3ULtlKav3rewHMFppxllY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jo6Bc0Nei1ULOsvfJXnlycO/qgbY/v5KSikZjvwFfi5jW5zq1QmZJGZnht4+yEKgTOuCnvyripeT5yhnvnr+vd+s0yDm3NokR4PMXjE7cftfue92UyfVOtbIBazwcrtT3E8k9PmD+tG/WNU8zEpwQjngXk0FgLQfR1WTmq2v5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxhsdYpU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhLN2Y/G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxhsdYpU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhLN2Y/G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJpAO53754557
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R5rQRmby/aI
	qaDxi3lDE9FH/pFFSKzh2fmPcewxXgX4=; b=mxhsdYpUIkz1c0vF+NQrAtW2Q+h
	eXErsuuxIrCsGdLYDqKAfC9GgLmNQcKKmQFwU5gZC5qiDflCtp6elpKFDz3fPFNG
	N2oSRhGUDongA+fwF4RF9GGuX4FlN9jnGU3MnuWj+/lku9+1g5Wg/+rXUn0GDknr
	F7ffst7sZvWyAWAkUONO++fYNvogB+dnm3LfecRSjLItQ1Y5eCOAm21Za35qHVDH
	3YlpynzIxgXv0KtYxSWwq0n8gvB+ZPmuT3L1seui86mhscc0HpokoejTjPEjie6f
	9C20+X+jxYiN+EEHeXBiy1uobPSPT27XB1z3G/A+xIy504IGs6JSU9HWMHg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex35pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8487eb67173so11088275b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 13:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232965; x=1784837765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5rQRmby/aIqaDxi3lDE9FH/pFFSKzh2fmPcewxXgX4=;
        b=dhLN2Y/GIsvL+2BUtEXs6aH9RODYIozK2+4Z00ddq6IGAIcGF5g9uII3iBYOYWGl5B
         fnu/yl07sZ4P7Kx6mwUV7RCvXU8hD+aZsq1QTzCneCBjuy6HsLI57UKLHEzKTilsllAG
         hHj/xJ26U5XDQAxayP/PIs+8MSnppvkSkSYDJTO7dAw+itO+Hld2q+IF7fVaVvxiCvUJ
         Sza7BoVX2zhStf1k1yUnkXdLH8fRdhmWo5UIJFh6wNzS75uP2S1/eF5ykQQlMHRr5J5T
         czzk7jHXUA5aEbk6M7PqzC3Adraz2d9PUKwZPpwEh4vjgOG+X34aW/tHXxbVWQ82YeV3
         SIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232965; x=1784837765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5rQRmby/aIqaDxi3lDE9FH/pFFSKzh2fmPcewxXgX4=;
        b=E6vN/YhpA9A7n5vv2IVayQU87gSYoUDfixRCUry1jz+75HXqjunnHNg/XJNb7qIduM
         9rsvIQ+cPcAWydk43SPQumx0KKS9ragiroo/3jIgO8ZaBWYLiRZ8sSCqpocUQBnPuH1u
         2Z+KheKi92umLrcD+jVF2/xTbXwlc6bE1nBMk6aS5Wh+15MQg8XJyC+wk0oZk7kdG3uV
         ZT5JmVcbi9VqHAT4MGu3FwJ9bvdAQSctMve1A5RllE9XGhhUULUVNV3B22hye0xwmiTx
         KzGfhMcFBPpMrAnMiD+2+YoCAbxRik79V1Sr3G3jQEjJIhCVI6WpKhyfOhWnuOkyZaC+
         wddA==
X-Gm-Message-State: AOJu0Yx30XJoeElh1BC7qGt+JmuNBf2Cw/UE+PjeIuJT45NcV7L6w+Yi
	UVNNYHIXMDSM7nAJTE8LAHICYex66oGRtBVhgHX5GKTjNxcnFjOmAL+0QQcziLLe00Hi/aVt0z7
	uyryKQXR4DXBGFIzICU53/9CPN8yYEcyKwv1jLM3L4pZq11fPAjLVIH+saHDg4A5FLPKi
X-Gm-Gg: AfdE7ckqylpaQZXeCYFDBAwLUxlOWbqKy1+N9Nc2UlpbJ8Qakw9MuDFYBHBHFfjm1qx
	jizdphG2wjbnmhCEDqjSToLSTtyUHPLVEc4KrPyHFeFxjoX0sDsFNuQWRc8egqucAyVEglsuTWj
	afHhldUF81UIHG1meu6mWRpif+lswJOb2MVI2sM0/mF++mZVyBkImjNxyxlm42I1OVFTuw3yXxp
	r52FYuYHia+HLFXnEoDJ4G5O7rWwpzpTKfs1lT9ExSw+c7g+e9D5iwYICC6yAXImwMvI4In2nwm
	sdtwusmV9osPhnFnRqAc3sWq7fP4/QJ3+2G/ATe8sGxL9iGAFuEuHW1ROm4vf7ePb3+7wUpahcR
	ngDTIxzrB7D1YIRkGBCdijBrGrUoVQznUZD4c3QcJVLbsN5Q=
X-Received: by 2002:a05:6a00:4484:b0:847:9367:e054 with SMTP id d2e1a72fcca58-84a5162fac2mr11522946b3a.57.1784232965216;
        Thu, 16 Jul 2026 13:16:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:4484:b0:847:9367:e054 with SMTP id d2e1a72fcca58-84a5162fac2mr11522902b3a.57.1784232964749;
        Thu, 16 Jul 2026 13:16:04 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f2389f8sm5296283b3a.4.2026.07.16.13.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:16:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 10/10] drm/msm: Remove invalid overflow check
Date: Thu, 16 Jul 2026 13:15:33 -0700
Message-ID: <20260716201538.365824-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
References: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a593c06 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0g9OVxrcTuodNeR8YWUA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: VgBuswfidCBS5dAa66B7yXcRHS_YaMsB
X-Proofpoint-GUID: VgBuswfidCBS5dAa66B7yXcRHS_YaMsB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX7HivS4n/tQ6F
 ZnIl6M7qEK8PIEJFV/e+XUwFP88N+cPY32Yb+jV5Lc5HU80aamYWDR6rzfFipH5e1/MvGyd4bwz
 9UWcpEKxaCaMkMuoOx2FJ20eNetLq4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX65OpGejouqwk
 Tk6tE7w83sC1N6P5cWqS3sdZFW1QhBxE60XC0EcAAc4L9aEuE2NLmUDs+pHSgpfFHgv/nIOoFUY
 8kmB9sPyf2J8L0iJrzboC1MPP2Yd5Hk5zw9g6Ht/klIjL2zlAxJkLG5f9NbU9The0c9fN7pozGU
 kmYofK03+Ik5qvzSAs0u8JNjGqt9dO03quTF9cHy07pOBjBAYgHPq+muw66QqR6eyzwS+ht2/qA
 d+ppz9PNDCZ9P0KMONHA4F656jmkxYMuD1igRdAEKON7nSHP2oOz8PiAaLHtc0PaB043CYAHzWQ
 kLdYctNSmiGR1YW1MjeVo7rfghBc2dwzfjj6iYsmTgFxYuAux/8MqEqIosev0jPh0vxp6w1ImIZ
 1PQVigri/lg8W7nC8dUZ3bhhT7royiqmWpgN7kbZ+CfYiMaYZQhNwUJAYahCBYWnwY5svL/fGdX
 6rwzK6RHD/Jph8NNIAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160206

On overflow struct_size() would return SIZE_MAX.  But kzalloc() (and
friends) check this already, so we can just remove the check.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ab33d499a0e8..ddd52142c1cf 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -36,15 +36,11 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 {
 	static atomic_t ident = ATOMIC_INIT(0);
 	struct msm_gem_submit *submit;
-	uint64_t sz;
+	size_t sz;
 	int ret;
 
 	sz = struct_size(submit, bos, nr_bos) +
 			((u64)nr_cmds * sizeof(submit->cmd[0]));
-
-	if (sz > SIZE_MAX)
-		return ERR_PTR(-ENOMEM);
-
 	submit = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
 	if (!submit)
 		return ERR_PTR(-ENOMEM);
-- 
2.55.0

