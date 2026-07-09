Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D2B43F8B3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622558; cv=none; b=L/vfYzstPObO3QkuWppuJjAXP7yxMmvoJhmzYKWNuS2GnpRr6hvM53JLgRApeAyf64h73bA/S/2/ZkHfVPjZzsV/CqzHcXz3txRwEdqK12gR3SHWpwJJ5eCjiQ1qMUqjFgidTuUr9w1rQ0i83aU699zORpou/L9+dH1MHlpN62Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622558; c=relaxed/simple;
	bh=49NOvaGVwlvi581GKoxSpuUe/4IKdws2QDL7UFNjgdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nfuo5o/Pn8QSOU234xWLiWvO8DXw0d+hewJxscYGhwDsr+VENdOErgBuVNe958zTpcAOUAHOHVIe1y4m5mxGhLLlDDi3/hH10hN5EFwG/CDkgWQkq2GEzOxhkY5sfvRO9cOK+fmqkdqQxzVLwPDjViaDSUsQf0L9qycWMEMZGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAwLOPUC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvfF+rHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAwLOPUC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvfF+rHj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HX1FB2419432
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=; b=dAwLOPUCN4+fS3FY
	zSMbQj1VkLrgSvjf90D5Pv66M0wHcSeFsoCjPd3BuNGPPzjo4gq69Zr2EPuf87+q
	xY51GcMBq1NbBDYfLCy2PY4fi7BdQ3iwUiBqA+zJyxKyW6zXIdNu3zj2XEwihOg+
	NUfgX5QVOrcv7xIlGsEMRuE0LbXPRUnZsMCDlCmaLy087f16esmgAvpimQ6i4KYM
	aLgvtof5MdJeIJHSaljSMpo1NHxzwWTcs59aQA1+pGWqIlktr0y3wh/2TuYVzq+a
	tceDmYbcefwf6gkuY2BkT3dlAXVR6+gUlj9iqSR3Z0x4Q5Rrl7ZsY+R3sksmOxGk
	JoWkhw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj948s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:42:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38c7e26ecabso185330a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622555; x=1784227355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=NvfF+rHjo86Dpj0Qq+qn7+FdHlOxSxRVV1gara6rboyQiDBFBbSnNhwukEGQKYblyz
         Tm/YkYK7HnYiP66D9BEaeA+kD3ARNvWK3cTddHOvnq7WFoj9gGXs8YGBOcwnQnIFJA8h
         Wcy3gIbcKrPfYUYzyc+/bNRZ0CxsNvUAFnVuPxXeSDzCSb39qxoGrZeVrwdPhVxzTZxU
         GslzlWvYkeChkaJ7/R0FboPIPXRJed6C4kiV/4YFceg7n8p9DCE+JGVsuuhwlSyoL9yK
         ba3hn5i++h4BD5DhTnBFGJm8yW4ePCXqXFHHb1YYGxnDffxOSUujFnBWYUZ+3QTeJEIF
         SGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622555; x=1784227355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=LLebjzh193ZXvnHSftH0i2NZJXeRTTgOdTcQQPFe0wUrT/zurn5+V3e5HTUHgoPgvm
         KzM9XTkHZAajl42YLs411tfOY6Ni3pvvDOmsLj++YsJH80705IVllyq7lIUn/Vf2SoZ5
         5gIRkO/sqsBAJBQVeI07BaJDvOSgSxk8fCO8NM33qz4KgN8t6PmAJ+nDG1wZ4rRu8w8z
         eU/U1ECmIzIAVp1jVLALGOJZG2KEh1BhbFs6l1qgOBJi6aVH/Rte5DFoodUYpNbN9MDu
         NI0cXKK/FCJzubP+SOWTYPzorhMDDsfVErObnjZFCpa2b1GB/obBuTDl+HtrA2XlO5B6
         AYig==
X-Forwarded-Encrypted: i=1; AHgh+RpqI7RhneCGXRtqmmkD/73li67yWlxFhGbluzv+hCjNLQIKgG2VmmJIKWnwHMxdUP7KdYdlvR9I9n2djTmk@vger.kernel.org
X-Gm-Message-State: AOJu0YwUAfSSTS9a3dOja4AmC6uyrCAbRm8gettdlzCSChjVZDBRnGV2
	QQlrx93afsYKAzqjTEPxd+TXC2wIs3rngDxFMKpUl8yJ0/Fqn/ldKkrPdW3wRJYXEliVMzQ1lCv
	ulwRo4N3lVNpmSDb3BfFnVF9GPy0aclvWw2Boja5x7Qcc+gPl4hxa0vKM+uvlBQh3iMr2
X-Gm-Gg: AfdE7cm183VZd+49W56rlgCo2yJX1b9ER4YqZJoUJtZ8X2/Wle4Ck2LdruhfzyE4ToT
	ImDFUAANX4ZeqxsYoGUuA33mRNsHMFGy5ewehsjMk7cltlT1qSTlVgYmbAUN++9H5p8zGmiBtZV
	OBbQAhWv8fH8EsQdY20k+++6eMt69NSuX2iTkfUEzG6lXsyvKGHWEArap7a74VuTfs67FKuwdXd
	Rwv/YdE6gC8nk8DgjmDeEPOA0pUgXcOhy+vYLKe9n3O43sjNvjsWBxaGWpRA8LP/e823e7oQN49
	vDDCzds0sRYxnBYuG+YlCwMhOD5F6QYpnBDFqjUZMvrcrCKfn7PDGeowf6HCp9iQIKF19horUn3
	cGXP7oSFmsKLFfgeX6et67Rl2ffB9cJ8wPuo=
X-Received: by 2002:a17:90b:554e:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3893fe5d587mr9351769a91.14.1783622555151;
        Thu, 09 Jul 2026 11:42:35 -0700 (PDT)
X-Received: by 2002:a17:90b:554e:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3893fe5d587mr9351738a91.14.1783622554713;
        Thu, 09 Jul 2026 11:42:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:00 +0530
Subject: [PATCH v6 1/7] drm/msm/adreno: Add support for A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-1-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1210;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vmi+IpVwDwItd0JsdKwDI4X0C7GvFEMaBv3VFip4Ixg=;
 b=nxXrfXueHCc8y0f+NSNb9djpV2+XQhcnHRgE6tAiSlaz/KzrkKd70ZDgPVMGFyhqmn/+r/2aH
 qjx5RZWOQQCDnIJSYqVVjc9IR1xwlOARTfmr7T/GKNDW7jB80rJlUhx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX00V7NhHm2+Q6
 s0jgXMnBGJP2NUklHGqxvt1tLuY1wVTkPs0akYgqaqB1Ly2GT5nyg9wcfQzXmOmLD/jIupHYXzg
 ue+FHgSLwLJZr5uygP/870Sz5qfAJcuOhZIT139f3qNpyp5CXNnDeMPHM9RvFZ/0rZGQTFAnCtC
 SL+Fx6wRmoOGBJ9Mj6li8HaUq8V09lflxhIuMKVJOTGWMyz+ovcVamRgYATBxgH9mBKaAw8X6WV
 lXU9fyQUfQJGG0dqtnyM8eZ38mKiEtnM9Ht7pxnPuwJQcsUmQssTvcNG9L4TUyVPAmysSFMaReP
 u/PLb3Ibgpi27lmxBrz6yTAoqt0NkRpypwtlu90J2vc3QiNmrUEOlZXE5XVsoloSW0uvm0MWN0y
 VZ8geHMDJfAL/EDQ2zHM6u5cj/dFTMgYCXhJzODkHEtIOWflGSyj44kagseNzpRyd5yI3J7sGj7
 jEqE25sPvqOakUfXK3w==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4feb9c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qwNE1M9ckMpWqn5luXDSEIihgRrb689r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX5O3AwP36QYds
 IaHt9ELqRHq26D5vrbPaOWpQOw1mPoIwB5GXKvuGwJDVzlT6Jd1uTKcIdsl6YhJRKfn404/WoQa
 nDOWJMmNvu2z3A4WuaLZNj7AifeFKQ0=
X-Proofpoint-ORIG-GUID: qwNE1M9ckMpWqn5luXDSEIihgRrb689r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090184

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..2de3ab010135 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1454,7 +1454,7 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
 			[ADRENO_FW_SQE] = "a702_sqe.fw",

-- 
2.54.0

