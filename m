Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA8937416B
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320930; cv=none; b=YUH7ahEyIMxn8hV19rp73Q9Eg6tb/KOwH1//j7t6hf6JkMiwHl9QYUrGX4HsoWxxNR0kcGoPP3wJioToSMrmkHbRx3U+dVswTnEpcYxgU8Pi65hUNc8D5isJ4a9DkQQCLsB8Kp3je4OKfdO92EeR58zuaazZLV1LfQV+0TDDvy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320930; c=relaxed/simple;
	bh=OTjz/hUYsdXL1nGMP1P88FY2BvXLf3kfPOscxh457b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IT54iu4+0XGsJHvgKL6KWmQfe/9+My6JkEl7y0KsW343BX967kXKAyKW/pQP+/M4Eo/JpNdm/eF/I2dU+j8y0HB89RWIUBWq2TaPiSqoL1XjKSh8j1LS+d8D6VzpS1gGfJz+rn4f9on4G63DMSL6FdbSpvdQ7ZoGykN62ysYk0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8KWpHMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHL2Z92c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8KWpHMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHL2Z92c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtEAj2597412
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEJ0uZQVI09LETC6xozJYzAod+qX4DJ0MzQIJLZn12I=; b=F8KWpHMRjsjMPMsl
	iZCB39fkxhgaevrxxSw/OnsjJu9+UxkQXWwyBPOT+jkzHSgljNuwfR7rUYwSxqBj
	97ZmV+/G7hGE5Xy3FoeF2vRifP56AW3n4++Q6qbFuWC9LZDrXBRmsdvMY9Y3m/3W
	JTladnYYNU26T2lZCh4aEjapaV/kTGlnmi8WGIEIlYuvhEiwWdNvxFT/fmuhoQu5
	HNiMz5Mxfl8UV9xci0w+ayfeCtSJ68XMLnAeCljwOQ6KhI7Oaqn3rihx1GWzciVU
	MMb8dhXBsTpKqwWFXnYvm/VipgnF/2ly2maxApBLr7xG32iInLxmzEiovSZ8DRVz
	Ih6oew==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrp8rrcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca124bf0189so1248775a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320927; x=1784925727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEJ0uZQVI09LETC6xozJYzAod+qX4DJ0MzQIJLZn12I=;
        b=cHL2Z92crkdvNhfwNdrx4OH5AQ2qI9zJaCWWLyRtNsx/5dn51vxA1JqOcgLi1lL26z
         dwe+JbOxVK4JREuo9kxRwwnv8QRQezR7Bz/mNud6gYtk+VKIw0/WqeJIYgDO73CbmQJi
         Qx9ynj47KxuLtWpmuLGpVkL8Qar6ghm+4qqPkRj1SPu9XYkuoG2ObbLELN1nK+6qCPLy
         LVaIhuWCROfHitKGAsbxVvtfSnCPc24YDC3N8YFmk2D7EZGIcbpbB59DHShihh6cbdvC
         45GMH8Uvlf9PtpRLkPMlWFshiWUzqx7endVwEJx+12cOiIMtyLBYK8raJfqktMReMQ5t
         wZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320927; x=1784925727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEJ0uZQVI09LETC6xozJYzAod+qX4DJ0MzQIJLZn12I=;
        b=VMaQfR1+EQviv2Cq06HIpIDHBikpGbH9lUTZrSZ6PX4+j/WUGFaHC0qJnYBEN5PIaI
         FgfGdfLyX6H2Xjv9ARXf5m+DIeRqXu5froVam+5f4DZKeWnZPpr8E3A27hr9WsUJoi9C
         wG5QvLyBW2Yq1jI8lHDnjl5nPp5zPC1C6FI9v/km3vaOQ+/iEcDn0QPW8nQcRE/px7dt
         1GzDdAA4twuSRBvoMxJfH//rjN1Ls/8onXzER6/cHvoS5HePfrXPf4odRiHfi5sFGZTP
         J2SG2a7uB9Fo0h5b0z8cVe+aGAbc8/wWefHm6p+8rl6n4ewZnofk9SpvBRuaXcHHUW/9
         7klA==
X-Forwarded-Encrypted: i=1; AHgh+RoFQOc1kmdV8DTYwRb9Y2CBykeziTYgbElM4bztj/A2dtYuXY6TkISeBtXTwv95Y1uOgN5fbUycYYoLnbRr@vger.kernel.org
X-Gm-Message-State: AOJu0YzrVniR1G1kNhnaBs1P+9YfujsKmo9k3vm/aNJEXqIIIE7BFH0I
	ahaOihUNeeUbwhxaUJ1nIdtv4f7wvWCYrjVTX2M+sJxgSyXasKpyadENQxn+E0QKbFDkehUeoLD
	luYS6uIb2/wxFa9QhvDe/4CDPP+GTyrIK911BmChy+dAa3ngma8s/3JQzmdiGR7kMfLwp
X-Gm-Gg: AfdE7clEilfZWH9pRrF+jq8NEY0747LG7NZ1jnZv5PL/E/dXm+fej213HJLKC/vHDna
	u0+yEteffFqLJcl04CBYTt3ymGPOJ/8Z+c7a+Nn4T3X79CvO/3hf1rNFnfAQPE/RAi3hdK8bHxg
	A8+Mwe47hQz8C93YUnKMPO/l7Tyxl79VBn12v5qX67238HsdU+EDXPZdWhqRtvWHr++QE+23di0
	IR7nNRaPzrN+/OiNuhRcy2q29vENMtZXqzoefVb6rB3U8lIGVwFOsUQ46kr+O/uiJWHjp/5hYAv
	pcZFSsu6QNYnrOTwa7DbKVn2AivrrTU8PrCw0Fq+09gsl2TlJ9Qe7KkfMouCVQINVTUdkX6KWYG
	jwTz9wgIuFV0d+qQ9mE3TVFbs
X-Received: by 2002:a17:90b:540f:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-38e3d163538mr10090689a91.5.1784320927540;
        Fri, 17 Jul 2026 13:42:07 -0700 (PDT)
X-Received: by 2002:a17:90b:540f:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-38e3d163538mr10090626a91.5.1784320926891;
        Fri, 17 Jul 2026 13:42:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:27 +0530
Subject: [PATCH v2 2/9] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX-
 variant register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-2-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=3230;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OTjz/hUYsdXL1nGMP1P88FY2BvXLf3kfPOscxh457b4=;
 b=arW5LOtnhsz7GNASG3k6T6849UaVGE8SxWpxFRJrV5xGwidmIhco5hKA79Zbb2P93PIK0zXO5
 NW9ANLNRiHjBZZmVwziWRlZIJZJK1ayJsn7ebxeRUw+CxcdiSQZwX1A
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfXzjO0B1d0M0j3
 +YraBdgMZNICKQzXAp/Mkn99EPlCXT/3m50fqfZ27aqWX9FXKdPOYoAIyJCtGh5pG9UQUcjRmk2
 tu4fsd2+EV00NtLl+zTi6cUiyrlZryQ=
X-Proofpoint-ORIG-GUID: HAV_RWqQLgMD2Aist8TgTxDiBV-M6yp7
X-Proofpoint-GUID: HAV_RWqQLgMD2Aist8TgTxDiBV-M6yp7
X-Authority-Analysis: v=2.4 cv=fMYJG5ae c=1 sm=1 tr=0 ts=6a5a93a0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=W9u8H8Hp_niEWJubwdoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX/6Ks1Sojpy0m
 rxg8XB3XiOewgU33Q4nsHrGCfkzdK7lT4OS/Bi91SfZ6B+lriI8S3icGdktR3sy+ymlG2s5MLvh
 vvFWU1wG8v0U4Oqx7rJjUh4QzxghCCgJJig8JXDLdXc2niyKku1pgdCkwM80n7JkQWWfKTXo2xn
 0OvK2YpK2Y9OqvGk2sAHzc+tZkdfhQWS3GJ/erDf5svrYFQ15KwVVNC9DzumioA+5T45oc9NW3I
 EO2Io599YWxW+Is3mLeMAYWFU+X9yrj9MPqU8ZnrDx8OwLwFpfGsIWz81Zt6TQvMZX4L9KJ6aYI
 LLNRmOuwOBbV9XC+uwcaBHhr6WGMElYxXCsnzAomKB83PUTJaFB0mzs7PR63ypPfqKkgKgzNM1i
 UyjyW8+ZMSbUD78CGU8hOriUjl1y6G2fJ9Ds8OcSs46C97C5nLmdgLa4KBI8ugCDEPVdftfpGHH
 I6aTyH0FcrjByBvDTdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170212

The GBIF_CX_CONFIG register exists on GPUs prior to A8XX (it is used on
A722, for example), so it should be tagged as an A6XX variant to match
the register spec. Widen its variant range from "A8XX-" to "A6XX-" in the
register XML and rename the generated macro accordingly at all existing
usage sites.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         | 2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index a98d550b72d0..4b68416e4d05 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2180,7 +2180,7 @@ static const struct adreno_reglist a840_gbif[] = {
 	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
 	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
 	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
-	{ REG_A8XX_GBIF_CX_CONFIG, 0x20023000 },
+	{ REG_A6XX_GBIF_CX_CONFIG, 0x20023000 },
 	{ },
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2e5d7b53a0c3..4a3c8dc8bb88 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1032,7 +1032,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
 
 	if (adreno_is_a8xx(adreno_gpu)) {
-		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
+		gpu_write(gpu, REG_A6XX_GBIF_CX_CONFIG, 0x20023000);
 		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 9e44fd1ae634..6a75bfb6cec1 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -228,7 +228,7 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		 * GMU enables clk gating in GBIF during boot up. So,
 		 * override that here when hwcg feature is disabled
 		 */
-		gpu_rmw(gpu, REG_A8XX_GBIF_CX_CONFIG, BIT(0), 0);
+		gpu_rmw(gpu, REG_A6XX_GBIF_CX_CONFIG, BIT(0), 0);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 3349c01646e1..69dd0446f8d2 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1268,7 +1268,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x3119" name="VBIF_PERF_PWR_CNT_HIGH1" variants="A6XX"/>
 	<reg32 offset="0x311a" name="VBIF_PERF_PWR_CNT_HIGH2" variants="A6XX"/>
 
-	<reg32 offset="0x3c00" name="GBIF_CX_CONFIG" variants="A8XX-"/>
+	<reg32 offset="0x3c00" name="GBIF_CX_CONFIG" variants="A6XX-"/>
 	<reg32 offset="0x3c01" name="GBIF_SCACHE_CNTL0"/>
 	<reg32 offset="0x3c02" name="GBIF_SCACHE_CNTL1"/>
 	<reg32 offset="0x3c03" name="GBIF_QSB_SIDE0"/>

-- 
2.54.0

