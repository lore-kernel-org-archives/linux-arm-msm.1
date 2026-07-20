Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861B83C9892
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534183; cv=none; b=NOKZTGtvJh4tysngDFu+FjnXOLgtwnidTah12Uv54HEhebWtgcHPaUINQLLbKMA83J0PXIHIjP0ryv23w+IAp3DrKscpK637mH0HwdxzTBeckubAOybV/wduztfbAjZ02c/xZSjwrqUqZZ962RcU0k8N6Cmn2xOVLkNBhwTYj8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534183; c=relaxed/simple;
	bh=UIa+Xcp/itVmIeS+C8X4mGvcA9fV/ITHOdiF/RHRt5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eAQVn9sTgb6gV4pk/S7k+PtrYKOQJDjMUlppqKYACij7BrZyNxvbGj0baNSTTIzTUFRyAIqcOdOENmpfmQD8z2RNY/WkevxfBf8wEWIJeFFFBKfOT8UWPUnjT2KztrHwtlYC+zr7bHnR8tJFaDta4IYeKOTAs/FrvkIJ3Dae9/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOaBsQfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1lMoZvu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOaBsQfu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1lMoZvu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YDpa2043790
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z/fQ9IgUcPlKcznfvswD9W
	ypgqtISqb/qH+AvKDm84w=; b=IOaBsQfu/GiCPwm2BvViRhfsL6H0Zvelwocwjy
	8nTxBZkCchAclJByye3GIY+zBMxI544WHru6ClAbGAWTmrgw+qxOwcr/sYzY685a
	lVMCdfVXcdeGDJEqHXH90nyBmGT5t8EYnRTxbT/5a4VHXxTCKgcOPC+IsCaJ3NCm
	UqSl+n8fbzhs5/z1RjoTkHxmr7UC4Wk9cS2FuVdS4mMUnQ7KjdL2iZmyTOd4+m6b
	UHlmmSf15kQKq2tE82yWTY9VyLo5FVFBYB5Ru/T1UCRDaSVveLFzcszsXpJEkHmw
	q9LeDYfZhOIRClxLasi9xW7LcP1RE4+8GJLr21L0IbygoJRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcg2bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:56:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9a2b95b5so1564508485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 00:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534181; x=1785138981; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z/fQ9IgUcPlKcznfvswD9WypgqtISqb/qH+AvKDm84w=;
        b=B1lMoZvucJeGDcTnjJrEzAzf9m8UQC2ajlGNOJ1gXndIkBxpJcOQiuGPN9iVI9T4g5
         Dozs7Z7qpEAzCzKHim4bvLLhjs9UzbS5zEYDNCCm77tfcN1B06/voStyXaB72QnVaQR0
         MM0KQsyDNdTSWPUc635bGPR95DQXThhVBZzaXR+xYVIVeicjJu8VH8WSeq/OgmssPe+N
         pDfHheS/OV5yPMHS3y2OaX/zXt/kdLqO+smrAiqY1Q4NtTY4x6TnlsZtJos9ZuhOI8kW
         KFW8caOvJcfBhBvGcF4C9NRlIcwnppBBbDXJWH8PzNtxmad+JuAWmrVb3GtNWc4FyoKb
         9Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534181; x=1785138981;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z/fQ9IgUcPlKcznfvswD9WypgqtISqb/qH+AvKDm84w=;
        b=LkF3CMr1YFs+qr3xvQs/LxyDZROtz5R87iyjHt7CPLhsWJzHwupYrBNMOL0ebWOReo
         o15yG7LmO//PNQdIPqTSLluDyT41DgxlsJyJRdRvCFXDCx10j+pCBL1ZObWSwmwhUz1X
         jCg3OObJmwGI2JmigCMA6gXC4Y/89xdKYG7u8CqH13YW4js7SXHdJbj1kZlFt9Sg2UP0
         LltkSwFe+ZuBV+sVAky91R/nResz3Y6Dy+mh5K6gvPUVMZYVNR2WMH05a+x0GvD+joK1
         +/wM8BVcNohuisWUnHSGWbv5gj7UXWHmNgIHJCAl2o4aaQ6ekU7cpYqGdUEBLJ1epQFX
         uo+Q==
X-Gm-Message-State: AOJu0Yz1nOvzXl7Ti83kgvBJmZhF6hfBKAdAvYIi45q/v7WneXdER0Wi
	bZ3uYxTuvslQzHuB45vsOI1izqSxlzqR3EJa2aGxZO1rGviy0oVU8PUhbEy8OeR69gCeQw1ihWb
	vnjLp3i4iRWu4a+i2x9XJKxNAR7beGThC5bcRQKzH6yGzHI/4KCOZLt0qP0OhurdVaGNW
X-Gm-Gg: AfdE7ckpNwsxRcih/hcua8KbHTcwy8dNj6pXbUJyyonTJv+Luq0d/5OEp1fXgPWQRhC
	tWHZrIzG8uvYU2lH0QNH8sO5CVCUue27ubi821qBN8Pk5+mxt8PGzLSFqS+vM+ZvfZQ5+SYR2IF
	60iibMG9T0LRweS8Pq5/QdeoTC4ajnRNZ27/XhvKlxtAR+cIyxvobloi/VG2HEc8JcsDmPxUl7k
	avBwUgB0oF7+mqQv2DbE3ulPE7Y7e9v2w64ZWXG1vUendvI/Z3D1H0qDXVCUWH3ltl4b3mHlarU
	QapwtcShboj6U+Ltl5wB1Nwwt/4zx1X50HO12cNk7IjULQjCDSNCgMBNVBxX0umkD7sAwJISdWJ
	x7y6RWEBMzuAJ2efUuk94p82Q0WQO+4DLTR08Oy7B9aXnKs6RIAUDCXPaGyZ5x5M=
X-Received: by 2002:a05:620a:d8b:b0:915:cda5:27ff with SMTP id af79cd13be357-930b41a0ef0mr1282599685a.45.1784534180458;
        Mon, 20 Jul 2026 00:56:20 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:915:cda5:27ff with SMTP id af79cd13be357-930b41a0ef0mr1282598985a.45.1784534180046;
        Mon, 20 Jul 2026 00:56:20 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b52dcd31sm810651485a.2.2026.07.20.00.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:56:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 15:56:08 +0800
Subject: [PATCH] drm/msm/dpu: Fix DMA SSPP REC block offsets on DPU v13
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dpu-v13-dma-sspp-rec-fix-v1-1-10d69b4875e7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJfUXWoC/x2MSQqAMAwAvyI5G6gtuH1FPJQm1RzU0qAI4t8tH
 mdg5gHlLKwwVg9kvkTl2As0dQVh9fvCKFQYrLGt6axBSidejUPaPKqmhJkDRrnRDa73HUUXI0H
 JU+ai//U0v+8HWZaJK2oAAAA=
X-Change-ID: 20260720-dpu-v13-dma-sspp-rec-fix-3938a7df3ffd
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784534173; l=3956;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=UIa+Xcp/itVmIeS+C8X4mGvcA9fV/ITHOdiF/RHRt5Q=;
 b=3aWsg+3stCwWnO78PjKfVT8bMaiyFogXBiDrsdNG16X9UwUDn0wfsB8rhajdXeTWOaiW+6OdN
 BGK7395fSz2C5GWYFMfduSnQ9qs5Vi2erF5bB6daVMqhpji636JObMv
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: TdUg19exgTNMAu1W1Sk9gzlOZ-QjgX6V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4NiBTYWx0ZWRfX8BNOtKD8GjJD
 B/saPwD9gfIiSVmx9l1i3Qki2wMv2RWp3ap3UlJbhUGVooBhQ2usWOM5eT1zuGS1/u8fq+3JQSL
 4VX8nls/ekGoJwkO8MR4yQtIIuaJG9rq8XgDHhBJmpTWOxijiL2xChqDsUDAP6InI6wuQcpWtzc
 bEHivgQWaG0QuyKOCUAWa3DY1ltTAWl8PXvCRGSKU4Bwp7wwcgvHGn1XtOZ6mAPom6fmQygem4d
 iW3r8s0UiH8f+5ENKetliaATehaVuDttfbuqyl/gI5j8IbS1ZPJe8DizJx63GDtRHjRg6IeUTLS
 tMCFbekwusid9JDcw5TCmefU+Qi9xU1VJChDuZhkbGnEHpKB8tNqg3TFryP3dSt77AhXCL9Nx1y
 x5vXymFBrla2qCoAxE2WKzqJgaAfni3XYppFtoxaVyXGvCgMAScz1NYvpB0j0VphSuugj2eZn+r
 MHFQ98Zq/nxWj3Se0xA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4NiBTYWx0ZWRfX5cAhSsOsjpf+
 F/b0R0ihByLejNwpetIO1A5Fnc91UgekQdbSulpBomOW05cMa858qv21rREFJtuViMiznd1XB/E
 plzg2b1zKSF/wtYooFaugS+a2lneXnc=
X-Proofpoint-GUID: TdUg19exgTNMAu1W1Sk9gzlOZ-QjgX6V
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5dd4a5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OlMwNCVCb-L7xj7jIJUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200086

On DPU v13, the DMA SSPP REC0 and REC1 blocks are located at
offsets 0x1000 and 0x3000 from the SSPP common base.

The existing DMA SSPP sub-block descriptor does not initialize
sspp_rec0_blk and sspp_rec1_blk, causing REC register accesses
to be performed at offset 0 instead of the corresponding REC
block. As a result, DMA SSPP pipes are not programmed correctly
and fail to produce output.

Introduce a DPU v13 specific DMA SSPP descriptor with the correct
REC block offsets and use it for all DMA SSPPs in the Kaanapali
catalog.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c             | 12 ++++++++++++
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
index 06da1583fb1e..85f455a9f29c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
@@ -86,42 +86,42 @@ static const struct dpu_sspp_cfg kaanapali_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x97000, .len = 0x84,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &dpu_dma_sblk,
+		.sblk = &dpu_dma_sblk_v13,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0xa0000, .len = 0x84,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &dpu_dma_sblk,
+		.sblk = &dpu_dma_sblk_v13,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0xa9000, .len = 0x84,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &dpu_dma_sblk,
+		.sblk = &dpu_dma_sblk_v13,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0xb2000, .len = 0x84,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &dpu_dma_sblk,
+		.sblk = &dpu_dma_sblk_v13,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_12", .id = SSPP_DMA4,
 		.base = 0xbb000, .len = 0x84,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &dpu_dma_sblk,
+		.sblk = &dpu_dma_sblk_v13,
 		.xin_id = 14,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_13", .id = SSPP_DMA5,
 		.base = 0xc4000, .len = 0x84,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &dpu_dma_sblk,
+		.sblk = &dpu_dma_sblk_v13,
 		.xin_id = 15,
 		.type = SSPP_TYPE_DMA,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2e10add84fd7..9a993cdfab85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -303,6 +303,16 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
+#define _DMA_SBLK_V13() \
+	{ \
+	.sspp_rec0_blk = {.name = "sspp_rec0", \
+		.base = 0x1000, .len = 0x180,}, \
+	.sspp_rec1_blk = {.name = "sspp_rec1", \
+		.base = 0x3000, .len = 0x180,}, \
+	.format_list = plane_formats, \
+	.num_formats = ARRAY_SIZE(plane_formats), \
+	}
+
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_maxheight = 1088,
 	.rot_num_formats = ARRAY_SIZE(rotation_v2_formats),
@@ -353,6 +363,8 @@ static const struct dpu_sspp_sub_blks dpu_rgb_sblk = _RGB_SBLK();
 
 static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
 
+static const struct dpu_sspp_sub_blks dpu_dma_sblk_v13 = _DMA_SBLK_V13();
+
 /*************************************************************
  * MIXER sub blocks config
  *************************************************************/

---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260720-dpu-v13-dma-sspp-rec-fix-3938a7df3ffd

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

