Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674715;
	b=yXTJv+op/xcJlqiiyHk6mh8Rlz3t5lVFyZGwgOpCxKEfABUVYeFVWW+F9/ertaCt9sv7
	 TfcMSsbhrWIwQ7hNCy2YAEbcXCSRo9zzGdi32NSwWY6VEEnCb3uHqJ6ImUxOwCiICdNGG
	 8hi/fmIoY04nLdy3NtYmfHmxXgj4fpUtVXKPpIiIyIa5+aNCv4L+t1ZPniN9C8hevGLPc
	 THOlQujDNUwkqMJspodYR0PU4bMosFPnobolHKYVb5Bw8A1+n0o48OGwDLFUEpUmCMc0s
	 oNdUCOwH671drpIbi9rTKjsf3CMvR9760vVFmNXIxPg9nzR39qNKtRKjQS9ExEpiJwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
	b=ty6cpnN2J/ty9F5zh7C+1vYmOPnU97rpHcx/LVGU2lu5bs4Mm+r2BDV17LQnDuOS7Pgt
	 PHtlSYSy8o24Dbl8dB3rnUw8tu5Oxbu5KXAKHYR+K1EJKN8vVzbjUfdAkC6Vf/gAxAxrc
	 iC7QedCHd99AE4nv8dff0lvMNWE92PpxDFd5zjZ+e115iAL2gYflGEIlk7Fbyawynbxbg
	 htqJJEY6EtXnLQhnv+qio8rOjXoiSGD6FgR00H8U/yEPZ9muZRyCuXbzcf/P3oUXEAqMz
	 18R6ltqmsrY23XK/EQTtTNgR8kYhHDs2dina+XWWXhSA0dNUs9fA0kufK8FsW++5dcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2BL9GBK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXZh3xYW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54DD606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A54DD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2BL9GBK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXZh3xYW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36IcB1157422
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=; b=l2BL9GBKLXs887F2
	sLqje7Dq6r9V4WZ5Xnvv1YrGUb9S/WkxwzcCEQau3Uacff//5mVTuLHAtxBoA6n5
	El3q6WkqxpLGOjsUkIM4ZqMBvy0wWWk8DfWlQ9/HjYSD0M1uZzaxORxyHG90mDwL
	MfXx41rkB5N+CjNvefQYLiyZ+kOFhZSOIfDb5tGmZX5s7nICFRkA/4ITUFoSSyb4
	FzUt1xJFPg8w87az5Y8gy66E2i5GuMJ6QEeBCn6ALmkSKzrGK514d5XX28jZzRY/
	kBJjAkLanu5P7Ty0JdJhT1rCqrw5yRiZDxs/XHq3COxZ7/27q/f6YOQ8pqtsNSFX
	iQnJLA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aejrx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f08196b148so41040295ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674713; x=1796279513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
        b=AXZh3xYWvpotSMsqiKqzf/q4VrePNeO7i1gXziRCkbHkthUJF6JQ4anRKGFD3HDAn2
         kgcvCwgV9VZtODDvemtmFUBDVMY0G60jK2XNHTjvu5yxBC3g3/9WiM3xZJzSZJlJiGCI
         h2PZQ9AX8808QHWl7f/oIycC8ZQS2igWi9TCiuKvP8rfDrEHySUSSTXK3jJE8ojRwq75
         F5qYY5ot5WrOdg/KRTHqUV1BbvDe6/6kfJZj+ecPUYudMA+wAZdzwVkIZFI8BS+yzcny
         UaMkSjoolvSSqBP6MIYFn/Pm9xBuwPb1eusJNWkE4Ng5z2t4ac0TJ90xZM82BbWL4JWG
         lZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674713; x=1796279513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
        b=A9zaYzGi+/ftz5iAndDWqiWnw2dIhx0Fkm1eYWkpSWz2/fwxr7U3ZPgqAtKSRMgNPn
         sLRyoK0B05aIjIFD21gfga1//IKRbTJVaak/a8YRZ40G8dPBdzKmenDuBM8eSu0HYGeq
         H6TM7eetVnxz7jaqSXV311DPxhdbEtj0sKCuwVFTNKH9UaiXXx1uKKjSr3DaNS9ut699
         /F5EFzdR4sfrd1bsc/dZPVbKSyCpNL2dYwxqPCkc4lbLS7gY7hPsj35uv0BSeJ93rFct
         wLZN06Ck1dvZyICcMLU3Yg//xLdiXmI+DR1D5qgVWkdeZ74zY3OhahMX075oWSm9YzhD
         WmkA==
X-Forwarded-Encrypted: i=1; AL+hErGQxdRQVYJJoM2JgOLVMpKvCjUnnJfIawp1USdkRm0Nqw8GYoX0xsRUidViOUw+HBMbB3RV0IYI0bSdtmOO@vger.kernel.org
X-Gm-Message-State: APuU4Z8i6JUL9xvpY7Qlkqi/3Fb0tMTcTa+zKXpkKZnzMIkZCyIc2H1O
	kQlf+4m9XkQA6sPT8u9C3gkvrm29HXj44oF90M0Zb1AOAljMb40EVWjgmG0+l6s2iW5CaUeklVC
	JEncnHZW+cSo5MtH3LUVpYDs0Su19isq5ne5OM6dLdJZPh+jhe2SgoMSkP+5UZ/jaezjG
X-Gm-Gg: AZFdTZeZlLWQ8KWrDBDlk43a7Q5lj65e7XE204LTz3J0UUydF1rosEP5Pg7SbyGhFOI
	whgmrD7gMsoknQGCUyEykroSuVYGWrMWVado3wAaZ3JFlYZ3f3qWU2ujs6+2u/8ddSfDdGz9NbY
	AuuqClV1BxsIfEhvv0FgzJsFWcIbg+MpNkKEsdvq/+fIPYM2/hbdI9XHdGjMPbE+znQvp7PlhAM
	NvrmYApwA91vDbq2LlObGFcUGbRbM4A5akeHw3WrsmGO2h2CySz9FkQdBPuFqUxqrA9cOEZWJDH
	FK7R1jKKL6P4KHBifM8IxqfSMlhm/p6VFkeVG2FGCju3y0H1WxN6LW8GjeECQzpTIYgFNzUyZ5y
	65HCxtEuoAFsvUeOjhOc5w5wG1A16UO7UuY7+xwPjEwh/QlcRKgNrpeAeZAILZwMYCvyZcFS67X
	+HllVBMnVi
X-Received: by 2002:a17:902:cec4:b0:2ef:f392:38b7 with SMTP id d9443c01a7336-2f03f1a1841mr216412045ad.24.1795674713069;
        Wed, 25 Nov 2026 22:31:53 -0800 (PST)
X-Received: by 2002:a17:902:cec4:b0:2ef:f392:38b7 with SMTP id d9443c01a7336-2f03f1a1841mr216411775ad.24.1795674712566;
        Wed, 25 Nov 2026 22:31:52 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:52 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:25 +0530
Subject: [PATCH v3 17/21] drm/msm: Export GPU component matching helper
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-jshekhar-v3-dcp-v3-17-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=1633;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=+kHZ6OP8gcD8pNbmCuB0Bs0MumxiGgHxobreJFpOXLw=;
 b=3pGTZXEIQomPo58QAYimRvl0pzI/Q2Jyk4johiZeBLOcZi0M1YjrV3Vw/j14XFIzbrcxTGQhe
 bv/vtYoQfOGBxQWGelLfLKDlhbSG/r1lhDKz6ZbhAoi+3cZ6ozveD4j
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXzqZy8mJ2A1Zu
 li5nkEgMnUZcXOcFDs3hIFcXUWfSa+2D01FZnVuSu2tGhqkCmz0CddnaZeoYR3vzNu7CMuXiILy
 2BSubSW8aU1Le8jwk+aQ/6/pIRWQdrUm1I7VDlY7X1x1G7+Ya30Z848zfvxuxH7mMNhF7g4lyjA
 9/pTgt+43jVJiLs7PVGT+y5/ma9XQP8tu6FN9YYC5B4vf6UtE5Dd80ZwnvI0qoD9hpKNk141Aqp
 SFy7SPiBDOk/654Y7QGMQagBaXc2VHNAsaLAYhuMwomOaTGRqaO+z6RSQleTfZhdr7WxiqVc//O
 hSn7E1ihV4YEgg4HoAcBvhh+w9UugCDFz5BNjlSFcGDPveUmKEDVViw1yvlANsek+23DzDuOvLj
 4mlX/8KTa50Z+q2lRhqGCaGs7vfkY8phjCk2Hb39OcraitXjGHtZ9M8veNXI2IBEwMqAOVOB6Rf
 wD3xsx4iEsTG3mVovUA==
X-Proofpoint-GUID: 1cEv0Mucpe-bZy_eZflEtX_Ht-fUyhT1
X-Proofpoint-ORIG-GUID: 1cEv0Mucpe-bZy_eZflEtX_Ht-fUyhT1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX6bD4caSZ4hAH
 zq06/szrMzgf2PKAjxEG7mnmTQ542TCuxc6iGPq650UEkq5e7u54d2FYOQbJV1DT7mjJe18e0Fr
 3F1LLKAmF2XLsVIr5LiMymzXx3JnHzk=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07d25a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=a_sH-KrDn922EyEOKHQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP DRM master needs to reuse MSM's GPU-component matching logic.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 +++---
 drivers/gpu/drm/msm/msm_drv.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3675df277f6a..bb383bb0fe8e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1094,8 +1094,8 @@ static const struct of_device_id msm_gpu_match[] = {
 	{ },
 };
 
-static int add_gpu_components(struct device *dev,
-			      struct component_match **matchptr)
+int msm_add_gpu_components(struct device *dev,
+			   struct component_match **matchptr)
 {
 	struct device_node *np;
 
@@ -1154,7 +1154,7 @@ int msm_drv_probe(struct device *master_dev,
 	}
 
 	if (!msm_separate_gpu_kms_components()) {
-		ret = add_gpu_components(master_dev, &match);
+		ret = msm_add_gpu_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2840e8a5052d..aa5dfd82ac6f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -523,6 +523,8 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 /* Driver helpers */
 
 extern const struct component_master_ops msm_drm_ops;
+int msm_add_gpu_components(struct device *dev,
+			   struct component_match **matchptr);
 
 int msm_kms_pm_prepare(struct device *dev);
 void msm_kms_pm_complete(struct device *dev);

-- 
2.43.0

