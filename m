Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4B947F3D0
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217328; cv=none; b=OiEG6Qsxx8PcgGu8NPL1at+jimUwt8PR2nQEVfi1p0AA5D4s0cVyUHO9UBNWxzQs+DNV14tmD+IHQoPDNIpxiVBiJqH6jmQ3V4MmjeAmIx8ibdWyWxgTbIw+LXc4uJUaTjyy1x/vzSOCSkMwJZmFN6WS32/7awjIcRhXpaTeRi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217328; c=relaxed/simple;
	bh=b0Cqqqr5RXysOo/IlbQaAaOsD61faw7dj63ogkvFqxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPHFaQQpTqq28w40k/xRaRCGoNAZmsRQ7bAju2JFrSVgBIv/5RfP2mAqvuffujakv8nU6YhJEmY6CCAAqqy5OfFuyCILixgLg/obpfgf1SwhXaiXX2ie0869rgfdSBOKKVRqifGaB8ZiOTnLJn0ieC90I/RK4U6MEP2/vZ1cEeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agBy3CGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkJWtU8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agBy3CGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkJWtU8I"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBddHs3457354
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=; b=agBy3CGYWFJ5DI4x
	eTq4qneUlnWTOtXb8bDHuABNK3AZxKJ0yLcBzvNsDbChUWZ7g477OBfwbQ9b9dJl
	lz/4ubWfYJvkkH/w9wGTdjpylkuY1iZn9x/xPqFOWneAzd95COlxTk7TStdW/6St
	84YpiPFgifrG/ZOjYe6ZWxn82GA5Gmyqr2o1gND/PQFuNoO8SfwamMu9//eDAD7h
	FyPeJcWgrhjQD/kMBxF5S6aH6AEDGzPqq0B2unkytcVga/wvsj8L7P0fal4rMSO7
	DmFocjphE/SITiiLtSjr41dydFZPavOJ1BXG5ebdbh+83Rb3h4VhdnEITAEu8HFD
	oaK0/A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dgxw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:45 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c683ca769dso683227e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 05:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217325; x=1789822125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=;
        b=DkJWtU8Is2aoXej+8PW5LBVrxq5zI1TeoAwQg6YGFokfzY6Sn+S4dExtVvLsPX1ijl
         d5U9ZSFK1oD/wJv1BdEQB4RG0DY0GHDXOMNZc8LAhtx7Z5i9zL2vm2KLUAonzl8LvRlU
         OZfsW56fCf/uM9i9Ym+jCgs5/Qco+5s5ohJhWZ9RS0qEEtgkDtIjrCg68RM8SyZtiQZA
         tGJKut+BldtFQWxKc/84SOFENH6TnGAgtM0kRFaKxF2yzFKZlYyj3xU2OGn8rZ6mUzb4
         Ks1Kx7w+JvfLcQQVEWF1NUBRNzJYvd9iGPHoTCxVr3qc7ciNWFIA7l/2jPmPgbXAXoRP
         i23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217325; x=1789822125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=;
        b=YcwxJMx7o6MQvcko6MT7cUcdOeNoSBeufPceQ0TIFIW78WWL5p4Chym6G58XxvGE4T
         RZ8LuwzEDycpPtNjE+bhhavEqtRzJSoDJO/zsHJ9An9WEVvplNTJFxUF7u0JsaSmlH4H
         NrO32vdVSMrHwUaZ5oL7qLUztlcK/iKvIu4ucb2MUirzLhIK3N/UVlt0xWhHHIZnWMtk
         ujkQavlUVuLwPqdxB3wrQ8+Y/WfSr45FF9HQb5SnVgXeZtFeyZm6S0x/oilFz6VgohEH
         asoCp71D2cWfkX2mFKSslkJ0oCwWS/sQyZv78CPPn3dGDUQiNNZFZT8vzMdxzxmnYnk4
         Lchg==
X-Gm-Message-State: AFuF++mBXOCDlKVVbTuj4YmW8PNWEPhRnQNiKNpCQQjK1kPs5CbBY+HU
	69IPr5twY0rGHqjpaibcC7ybubBKOoLf7tgY3qa64g5HdJWmFNkumkLBLpxh/xNWhSkzvb5Xl/d
	z6Hhkgg8qhL0NZ/TQU/kkyPvlVTCkQpi+gMrrCKnoPqhPPS69zDzVl5Ga5HJ3LJX6Yqzh
X-Gm-Gg: AYBFou3UE6ntnPMEyOuTm1U7CaJCscv9kTAKOiNMY2D/nYfZqHpGJ0IlaS0g5MvxoN7
	Jtcbns0DbsJ71RBCUdE8Llixlok1CZo8a5IyUHrKkjIEyeelt0Urv1Q4tCUQWKuGqhC27SVOJx5
	zoZ2QG/i3S43eNRJf63+I7ZP42dGt35iFBWPpdiBLd8oSbS57nt8xsPa4o4PPFv2ewAI8x5bKav
	IVfcg/kdGThA49F/cIYEKIeyYmSe0DdZ5FK0rxpnRPapgUhxGBeimN+AUj1wXi/aNkFi7RenRbb
	OWAhiTyG62XB2vK+gJrHi6sMxlEe+oahUFXXuyKS9o706U4lBlWYbvrM0sKLMO3eBXaPo5x1bAs
	tajOAszWgg3Ou2OPkeG9X0bOPLKoj4G3U9qHy1Ij2P37aLiMs+2XZLGN+qgAUi/mExK8EVgtApJ
	4SNN63lB0lJeO1
X-Received: by 2002:a05:6102:390b:b0:779:5049:87b2 with SMTP id ada2fe7eead31-795a0ea85cdmr1722633137.0.1789217319829;
        Sat, 12 Sep 2026 05:48:39 -0700 (PDT)
X-Received: by 2002:a05:6102:390b:b0:779:5049:87b2 with SMTP id ada2fe7eead31-795a0ea85cdmr1722614137.0.1789217319453;
        Sat, 12 Sep 2026 05:48:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 15:48:28 +0300
Subject: [PATCH v3 8/8] drm/ci: mark pixel-format tests as passing on
 SC7180
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-fd-kms-fix-smmu-v3-8-a7ddc6fe2032@oss.qualcomm.com>
References: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
In-Reply-To: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=b0Cqqqr5RXysOo/IlbQaAaOsD61faw7dj63ogkvFqxI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoX05zXcOAfkFqrJSW34pjmtrAN5/+czbqJT
 E1f17mbnJmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFwAKCRCLPIo+Aiko
 1Z58B/4r2dJLvpGdfeJ2mE2IkR4JV4FYoW5wZOTXRVl4nIfbVoDce6hkOP/+xHDWzJH2r5DsTU1
 ++CAFw1FgE5GjA2pfBne8NG4Rv2N0tsuIJNfcw9WHPAK+n0UWD8WngN0CASzx/8zQ7mhz/ltPx7
 JD9hnynNn3gd4duwzUfyLB7ar5xpS7T6qeFPnWn3qt/IsflzBzGd2JiR4L+IQkzZn3ODhWybqGu
 Q+4yRseusadrwzDOl9UDU6FFZtvLRKX7Rh9BruzLQbOkqVtBRBgXPH4DygGz5dEF+Vvl9MTWE9u
 f0YQ3zN0PyJeFu9eeXYiYBaus7Vc2BIS66ncbEl2g4OLri6v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Ky5sf447QUk2x2u-v5eVSa5P0lzQIDWQ
X-Proofpoint-ORIG-GUID: Ky5sf447QUk2x2u-v5eVSa5P0lzQIDWQ
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa54a2d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=_1_hEmUK9n4M9CbZuSUA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfXzn23EsTx2HVL
 Scj4tWAmR12svUg9wl9pJzVmXKw35FWEYe0upMgZpSW525LkjIn1Qm4b4oGBRnIj2ze2DiuIUpY
 zBm2/XrASyvMHs8ifUzXW5IwYqkz8z8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX1o/kCmeoB+iB
 RrsBodszuilBxVsPVtGOIM/vhrLbLme/1S1hYWnYiPtwk/Zuhp+pnA8Mhz4NkPWcaiGtn2QVZdC
 bTkWuwvm8SrAomOTxLP6tw48vR9jw3ClMDsLnnfqg6OO9/8XiLN4OKCttfxruZmuRNc5Tkbuyhn
 3iTp1PyEXe8gN1nXMFBSY9AMtJMpmJ6S4Qm4P8IYUxmkASrGpoT5Rp3+2M/B1bSsNkfa+qSQCOb
 PPRAKvJBoZb1OrubKc91R8yAm9z8kh4u5taSHCSfkEYUEKRipxopTugRTBREx0kdPbfzKoWEFR3
 +sJZZ5QjGeoyMedwXhibpJ6NluWVmObg/VNrn1Yex7Lc6Q7VF17TvKP8ZWzk4/g3c21/IpO+qRU
 Jh7gS69x4g9u3aedwqQmuMvH5BTz54SccAlWFkfKADDB18+Ijk/dJOtZF5uRjV/ybne4kt8c+Eh
 SUYMu3f/PUiRFPf1Z1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120184

kms_plane@pixel-format and kms_plane@pixel-format-source-clamping timed out
waiting for the first CRC once the test had set a legacy gamma LUT.  They
pass since "drm/msm/dpu: only reassign resources when the encoder is
reprogrammed", so drop them from the expected failures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt     | 2 --
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index 2daf4ab879a9..ea3013faa37c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -18,5 +18,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index 2daf4ab879a9..ea3013faa37c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -18,5 +18,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail

-- 
2.47.3

