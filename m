Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6242B4AD7FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050057; cv=none; b=utWyxUXdfgQiObJvsqEU6RZHJfDPujKsIIOOHJ/acZX973B5vgT48f9zohA5WdIssQzRRLqlb5Z128MGUKUnIWgN+ZZGH0gxCdjwaTK4SkqaWa7EGKjCPkTAAVdBusOzlA+RtgwW9f5LFHDKl/BXZWM7iMa5dgd/4vjH+flgH38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050057; c=relaxed/simple;
	bh=KTdIkjaGNgd8M+aQhN1Sliw179pZI7BN3p4JO2Z8Txw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cmOu2sG5gMp/Ik7by7pewfixStI7od47rv6fDWUjiim3/qznYeecGC3+7iXVt0bTmDuyVthi9We58WtIkb/esmALDL8GYuPD99eL7ehBeK+JUlRbbcw+FRcNMQbS5K360fVExXkko29c9UVxuFUXcFoBftyuzd8UrNElu+mJSKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJvwGzEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ws43ryG2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJvwGzEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ws43ryG2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6WSw4586377
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5cTNxoUZcqOAxt1GmGEc/9lBQ7YAHi80QYMo0vkxe24=; b=PJvwGzEvtYVYkYTp
	SHinAg5IXPtETn3dk6XSbm/EZUHpWNF6wKR0V38xO96AqMtfvBZDEUTosHkxXwvT
	iV82LGLxtfGUSppdy3nOYnyMBCagh2nxm5eODM+hqOyM0rW2diFTG1Gb4L1mMSYd
	Qpqn1RnEwaEaRJVALNvpTF/1jm6ZbZ5/0+6/5ury5ytEu3L1bX7iWuM4Qb5VNNsW
	Vngc4zM8WzTdjVfXn6kqPNusWUA7SgMrO+IvHU8J0ssKNKMQC37lYK5C91Gz5LKo
	MWpm0nvD+NBYUOL1ZrENIRGv/QKDyavMBQjSOSDvGwW0n3PyOId2oTIjBwubkj49
	JSapvA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdeskgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:40:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso1148251a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 00:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792050051; x=1792654851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cTNxoUZcqOAxt1GmGEc/9lBQ7YAHi80QYMo0vkxe24=;
        b=Ws43ryG2YN88J3WrCIwMvo7CLDreIOtlUeLwM3EfH0gZrzv44ownYZbShigvpUNO4D
         7PyJ99QacsRm7cFLXl7cAXMG0yR2Bob+WAe0DAp4crPaoXzqWvKiE4g3Uvf/65ZzUsPk
         ZMmJr0MGrJLQftgxjCUMRFcqPtm8JBzq0Tk+CqwLuxtrJhmjUSg8D2OcVWKYkmrdjINm
         CKioJRYKSzzivYa1QSTrzFwhhjpiDSjXJdEJrxpr1RlzYsotbBLck/KG6XipzT4RaW/a
         X1r3Ya6vxiS1RP8OUrwDB1wQMtiN6JF8jhjGdRPje1Wo64FTxmiluuRsV6MtX5K/vL1w
         ewig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050051; x=1792654851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cTNxoUZcqOAxt1GmGEc/9lBQ7YAHi80QYMo0vkxe24=;
        b=nMFgXe73e4GhBFzHLZ0+EpM1zwR7wKr0hpCOVpMcOcsOL3BxxLAIYUPFnj32rS56DI
         uehS4elg5/jqGB1Si4y6/J9c00R1yzugxkf3g+pcn6Na17K5HFvlEEZBUSxncBRc4z01
         40RdIoLWx6cRmiLoyt6sKbGWpZZl/nqCsuToSROOpzaL78v7djZ8MugBr2LIWSsT62+J
         GZIeoHvWsicKh4pvlc3DgyMnnoNFHOBH3NMzI4LN1FL7nN+AguXS1B1rSK9ltY/7EZUn
         +3gTRUE2Gr/ZIQXYyoDOts+wxOHsbkLtSB51qXVx/bNlW0C4diFATl1fbRj/EMqWOmYQ
         p0Fw==
X-Gm-Message-State: AFq9FYKLeRPhIf9g9yt+4yDcJ592EPJiFKLlUoZJLefNEjihpCKQXJq8
	k6c24BaVhc6BVJX31f/1LZ6/Mij0zMYthSUk5SwNBMpXBCeCcggWEGn4QUFQb72kWYV0j8LsRqD
	mKpbeN2ALOvIjaB8/I6lHC0NG1ykSlqz6bO7NdPFeJ5f6WS4RqMHDchVu8WJ6oTHiQNrL
X-Gm-Gg: AYBFou3euDpLLJQvvgX+yf6nUBFOEm6vl+DCgTW4wn7U7/7EguCXTC/Var9iNoNDRmz
	jaObQKm7LA55chlAC3FIj4LzehyMTyLr4pyEE//EQugBFBAUzwmnIim3sAvlYEkffyN89L+q5bU
	JgNom8xKJvAQ4rNbSzv9bY612Hmb0MvmQZ1BT/KiiuQBpceNybHpVZ0nlxW3Ykx/WLGLb/eKMZb
	fo84iPsCtZtjZ/hyQNnJJP6W5pFwPsp5buG4zv5EsoUgH0jxbetnSoB6KfUL+a49WojsV2SdQwD
	fs9O15wvudZLvyfhRw6MWMii+13b2RCCUaN+6kIWuPM3bkNPMX53tDn4fakuIWQZhZjaZddq3FN
	UzwpDgwUlfUqPLGc0QaB20A/u5YwqysttnKw=
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15644336a91.14.1792050051166;
        Thu, 15 Oct 2026 00:40:51 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15644306a91.14.1792050050596;
        Thu, 15 Oct 2026 00:40:50 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e944c23f17sm14014825ad.27.2026.10.15.00.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:40:50 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:32 +0530
Subject: [PATCH 12/13] drm/msm: Register the DCP backend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-jshekhar-drm-msm-dcp-v1-v1-12-48aad0fe4f72@oss.qualcomm.com>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
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
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792049920; l=1867;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=KTdIkjaGNgd8M+aQhN1Sliw179pZI7BN3p4JO2Z8Txw=;
 b=gZH8cI5MZKuwSBGLRmM9KBPrUf6xwCojXAgQ86ziJfC23p1ZjpMksabwSdcHJeay6I3FXyCi3
 zeauB9NbyiqBIdzvpbDLVgDbBWtAjLblZlEpRE2DFZ3R2V/NRucRNca
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad08384 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lVH-uUz8Z5eEn0x1YxIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ZC8sdnHXO2VuIxvsI6cCShbXV1FPHMjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX4P81N7w0GMBs
 E8j7z7zueSvI015MDXH65w//bqkLdYiW6Z8tAxBC9ds+S7+OA9RWMH+7njRvKA+LgWwyePybQJZ
 Ce0ngnZA7uM3xWFzapzxqJOsFs9hUB12Jx0VmVWyoKRKWFWhSeLnORdnmL1ldCdvygHgBjYLF1x
 QO16zX9ohgKxqYbL5o22WKHIF+cgNI3mA9T4LM/K8ti2M4X2P9wGPgBO9V6nXiT5GcRypuM+peE
 iojjU1PfPcBvTh66puds3/RsLnlHSyo9SRA/eCb6cRe88sRE/VMu+c5s+DAVpCGh534vQvA2CEY
 rEZIrKOvayuGz8xFdqGZPrG0Tr/F+AjPRe/pGut/KXWFDKy/yf3z3JPgvYCUWUnbs4De63ybORv
 xcW1T3XFyLvDYOdaB4I5V3GqW89etv7Rqmq9cOviQTcpdg5dhx36vaTIex6s1IAmgrDhPbba/KU
 DlA3S/xRq7EhOYtQzgA==
X-Proofpoint-GUID: ZC8sdnHXO2VuIxvsI6cCShbXV1FPHMjg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfXxjayMy0/mpb6
 ZpfWjEXjfT6Sgs61ktpqr6lMqD68/jKhbQWrHsA3kQfiExJDI00ZinxqZ2yyMTFPVKBwY/GJtXc
 jqMjjkdg3S/tfd8B8sDgxYQw6kOg1uo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150030

The DCP platform driver provides an MSM KMS backend. Register it from the
MSM DRM driver init and exit paths so the VirtIO driver can use the backend
when the DCP function is discovered.

Add DCP registration hooks with no-op stubs when CONFIG_DRM_MSM_DCP is
disabled. This keeps backend registration consistent with the other MSM
display backends while allowing DCP support to remain optional.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Assisted-by: LLM
---
 drivers/gpu/drm/msm/msm_drv.c | 2 ++
 drivers/gpu/drm/msm/msm_drv.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f3d2eaa04f14..04c31596d6d4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1135,6 +1135,7 @@ static int __init msm_drm_register(void)
 	DBG("init");
 	msm_mdp_register();
 	msm_dpu_register();
+	msm_dcp_register();
 	msm_dsi_register();
 	msm_hdmi_register();
 	msm_dp_register();
@@ -1156,6 +1157,7 @@ static void __exit msm_drm_unregister(void)
 	msm_dsi_unregister();
 	msm_mdp_unregister();
 	msm_dpu_unregister();
+	msm_dcp_unregister();
 }
 
 module_init(msm_drm_register);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index eb4bbae8557b..39954932b91b 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -415,6 +415,14 @@ static inline void msm_dpu_register(void) {}
 static inline void msm_dpu_unregister(void) {}
 #endif
 
+#ifdef CONFIG_DRM_MSM_DCP
+void msm_dcp_register(void);
+void msm_dcp_unregister(void);
+#else
+static inline void msm_dcp_register(void) {}
+static inline void msm_dcp_unregister(void) {}
+#endif
+
 #ifdef CONFIG_DRM_MSM_MDSS
 void msm_mdss_register(void);
 void msm_mdss_unregister(void);

-- 
2.43.0

