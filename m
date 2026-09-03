Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7974537F30D
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 18:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460655; cv=none; b=nfzCVeen/p6tCh2Zf06kQYRwOL+cGC4puQShn5Km1x5GGy8j9BEWrcMcywYkaqGJGEkLlvly6mUYjwxfQIQ4OJQi9L9GcXjm2Ff1OaqYklV/rlH0i6knTvhqJKRDrIqFLU8GaMYyeOeCyLC2LNl3uKKQ8VzWUY9a8nx0aPGb71A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460655; c=relaxed/simple;
	bh=sRPTkFWhn9MXXlTcuT4Mj+8mqGM3b38g27WcJFRTivM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QmBEx5nJcjSFmoUraJvenOG/QVXx8j1aQtBOAPVjkkcvcf2vw4APJsdbYDcVoJ5EIyXUk7pLQG+UVZkSb5COfVqkDxg43sO+oGiClMCIrkoVfU4ZLiA2eVkrYgGzQ9rXWdhxq2BVzSALA2Y3AEhKViFTjXHVRLjB9nvgmOmSAAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQVJWhZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=in0ZbTcm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQVJWhZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="in0ZbTcm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3FxB417506
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 18:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t7Ub3ljv+unfOsu5RVQH5xhiC5eIDsoAHAo
	5/jO6LDQ=; b=hQVJWhZSaMMioFE9tU79LGAzhDAgQag8kowwAgcLElWAXE0vI+s
	coirHixObD7rrLlB+VnK6coKaZMj/A1w8prqypCRTVwJC5RXJZjkmcFYlhdKXQ+7
	tEaxXV0oKze9NJBYKGycMeaYVeXMxgoA2FSRpOisSE/7nejxf8M3sQyhEUNjPJE3
	nw02BaUU5XJZDKw325IVZe2UiGpJ0F8BymAU7leSZRzRPakRM2nGnG/Ne2LdmLIB
	ZsitnjudIt+TEO+4gTZtV+YyPlJOsUNbzkvZAaIKJx/lC4UFn3+SHfexlBveTkSd
	V0C8KDck16MXWne8Dbbrgi6FcC2z/VB/CWQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m2ufr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 18:37:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso230164a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788460652; x=1789065452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7Ub3ljv+unfOsu5RVQH5xhiC5eIDsoAHAo5/jO6LDQ=;
        b=in0ZbTcm9nYHKGrbrm+DW6/E8DT8tXnUPZDMtsxbkIh2FmzLaj7IhV7Y20gGMy7Su0
         1HTz4UIMjSj3gsgfFdrh0yJ+jfGc3UUv6f/EDfYAQ14/IE40shKyBd1vll0nIrX5MGUQ
         rcV2/jKhMi4oj6tG5APFBN0sYOWSf1Am+iHNfkN1yrqkmM6hRyR+fQ0kGBcpxn1hbi2M
         tMZUb3T9zDu6FPYx/tjZgwuUxRIeDgzRpVWdK1Qy5XIJKmhcrrCtT4Y8Cll3nanxFi1b
         5WhG5GoOzEDe+zGOhTnIhg1snUbaWcxTVbfZC6yFR6WitrD+Xj+EEsV67JPhJsBGO2pB
         Pkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788460652; x=1789065452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7Ub3ljv+unfOsu5RVQH5xhiC5eIDsoAHAo5/jO6LDQ=;
        b=A/Fz7eQpBNbVaPBDH/V9r9VtXTJQL8skct7rSWQ8IYjEUmihzwQQ3KLtOEXfLuDFTC
         izjFfjAd8hn5xIpIQAsiQmpTUy4A+mFZ9I6UpIOTjBTgZBdFIOoPlNLTuGMqhKSXvFFM
         1oEqBE+x06nMrdRz2xrt58zeTs77sijpirQdC3Xm1nJzl8DyXKCMgD5YQUxpPBOwHa/s
         8kOlyZxefEm8w3KB4DjSMbHUssjcVnBj/yz1BSTmEu9wzVt+4EsXsgmrtIgewq88KZRA
         AoC5Uk/XHFTu1EyfUKX28geYrxCdUwJ1g8/jNs/fVR5QhgNtvRgdj4O4y71b8P3owuK0
         ULYw==
X-Gm-Message-State: AFuF++nFTd5T5F5kchv2qZ2vI0Nb6AyBm6SXKak2bihOM0M0biiUUpYA
	VHdHBbHh8oZIWFjdTLHwhoOa7xOYTCpmtVQUoBS2JlTFUDJBWDzFON3pCibi4TGM8w6hz8ZC2Id
	kSvLCmr42y/kJOkXE/z5/9tE5HBdIRVbjuIOsRLpSBiXBi0HnUnbC2lycFF8FevnK22b01WlBTU
	K5
X-Gm-Gg: AYBFou15AgiHdR1jiriiVnKR39CivI2x5Zs2hczN5h3rtU6blp+oj9mXxpboX5U95x1
	NyE8io3kML6Tg+pvWBGC32dDcgbtW65Qeuhc1QJgilLoEMhpLgCurRj3jxQXhlCn8TDFM/XLCEi
	Kr/qlOGWidAwzsi0SqK1in2AHKwWhwMGWg39zJ1MwAE4X+LGNnEII4nitbqjwK2E2H5xpp2tevg
	Kysj5GnHgjS+jTJN9Fzovx6m1YWfGCVSfpbiQq14wCL4Bbw25/E0p8g7PfkGgMBGKATRL8eSga2
	yGcfwhvQPKz+vd2jNOiBEkWcy6BG03edSbQ2MfVhUl/IEbQo7OUne6+sozDtC44bmYKn+TNtTiL
	V6GMW7I8UZfnq3j++tlsnqFrQ1WzHB3G3bkzn0r7ufCISAw4=
X-Received: by 2002:a05:6a20:2583:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3da39ff4716mr523042637.14.1788460651594;
        Thu, 03 Sep 2026 11:37:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:2583:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3da39ff4716mr522983637.14.1788460651127;
        Thu, 03 Sep 2026 11:37:31 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45515436asm10903a12.3.2026.09.03.11.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:37:30 -0700 (PDT)
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
Subject: [PATCH 1/2] drm/msm: Enable THP for GEM buffers
Date: Thu,  3 Sep 2026 11:37:24 -0700
Message-ID: <20260903183725.15835-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PzVYH27UhLpmzOczDOEWgPJ3ZvKnYGle
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2MyBTYWx0ZWRfX5zi4N2aNgd4l
 Y55J+r+oWbcLAkuqxm7md2XKC5lpGAUyClkXLQL9rEQXmVM1ERllsdMVHjLW0mTbBBuVd0oahF8
 nNNrAwIOeosrPQOQJpqdUrdBrJx5C9B8qky1u6SETaAXLva3iFy+sYc9jLCPWuEmzNUzb/DhCRI
 F2F79qsHg6lX7bK2+K/gJZ93Qp68UWlFEq5TygmatuvPicLbclhCHDPqEuwPTlkGn9uyjcZb6pr
 j1Z7gG24mBIAwqWoKD+PyvGNOWGVRWTWYrM5FRWdwxdBjpsTi+Aeg92hzFFE1sB1yfTDTDw/C8L
 yF7kwIvai6Ieo5Bmcb/k74A/AXyjevWzmXWhdfE51qaMXGgecWfD5mcQ6/3LWAsezFmHsQZRuqD
 iSNYZMza+sNOM//Jf4bpJLiZWElRmM+8Wsm+fm0UJDItTTNJgvKn3g1Hw9u2K47UXhjiCRL+9tB
 +gXlo/V0D6QvfG+mtoQ==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a99be6c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=bo7bELecpVJEBXAwH0gA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2MyBTYWx0ZWRfX5YqlSGLV0nit
 a5/jfwzhtZ7xsXjeD34ez4zu9xGezUCra7GbvLm79VydHkJLCETRXUmqOJgcpcI8OwysnX58ttd
 MIV9swQ+pJ1QnxCJibth5GVFqGNOirI=
X-Proofpoint-ORIG-GUID: PzVYH27UhLpmzOczDOEWgPJ3ZvKnYGle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030163

More than 2x speedup on darktable benchmark which was bottlenecked on
page allocation/pinning.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 73d99bde26f1..8129e7d229d9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -58,9 +58,29 @@ static bool separate_gpu_kms;
 MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static bool transparent_hugepage = true;
+module_param(transparent_hugepage, bool, 0400);
+MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount point with Transparent Hugepage enabled (true = default)");
+#endif
+
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
+static void msm_gem_thp_init(struct drm_device *dev)
+{
+	int err;
+
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !transparent_hugepage)
+		return;
+
+	err = drm_gem_huge_mnt_create(dev, "within_size");
+	if (drm_gem_get_huge_mnt(dev))
+		drm_info(dev, "Using Transparent Hugepage\n");
+	else if (err)
+		drm_warn(dev, "Can't use Transparent Hugepage (%d)\n", err);
+}
+
 bool msm_gpu_no_components(void)
 {
 	return separate_gpu_kms;
@@ -178,6 +198,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	if (priv->kms_init)
 		msm_drm_kms_post_init(dev);
 
+	msm_gem_thp_init(ddev);
+
 	return 0;
 
 err_msm_uninit:
-- 
2.55.0

