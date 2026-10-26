Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995733;
	b=lGvFgvy6xqDuPiCgaEkV9A6nhY6neBT3XKi24R5UgapToTCxQgEgGWMhi8ecjIK8MIL1
	 hlfdQaDqdGrlANCfKdaUwlwRTlNxq5trvhkQHh3HOYs6xaBV8MaDS6zVUCZUBVTr4YVuZ
	 AeFPJO9Nqsij9tfuAf4LR65kLHiCg4pPyD6+bLnRw6SOznXbHXrKmaFdDgnnCBioQouWO
	 v0onI843SOt8Z4bQdKuxC+vdK6KNLSmQ0M2CPXOEDzPn1FZdc/pXI1cgPqeTlQraCbj8G
	 yNqcq1KRDj2f+VQus76zsJFtXxPcDwhvTIgGltdLgq5/XqYIgvuje3qY3ZSLV3/Cn3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=POiBPcDJVA0W7NWtaD04Jkc5yVkz3p2FFJOSCoNB5ck=;
	b=SIhC8SdR9AhfMStpL+x9RYH2dhks0GOFBinY9lqxY8AxOe468Z8Ass8JtkJN0F/OaIjT
	 lztBTDkA/2fx6OIvyxyknbktMFb0PaoYV42KLAu0coRt2wnnVNBRaPhqOCgnIEVbzoIV+
	 3szXjrjdNRjjg16L6kCPljewFzWA00p2plVArYPTkcXw17J00lf0HtjEop/w+YDhO5yxa
	 gLI5aH4V116D1fiJYBMGQMcAwVf1/mhYFlxZ4r0Q/hYSic9cp128a1OE6a7rze/ArhhoB
	 jkfhSiAHu6blVBoww1fUP7RclEUrpsj445YVSlmanU67GFBVWl8h6QA8CgG4zmuh5rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pNAqnVpr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NNnum9JV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AF2606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50AF2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pNAqnVpr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NNnum9JV
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1qv2206202
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POiBPcDJVA0W7NWtaD04Jkc5yVkz3p2FFJOSCoNB5ck=; b=pNAqnVpr0ql8iyVo
	1gToezzkw2n0tAj8wurHtFkST70W6cGIapYdPDD4M59cqHzCG+2JBZRrTCTBqQ0P
	AcW/j0jQpBLTzoAeMXKeY7Np+8I83dE6kZJRMm13k0PyZhzvK4nZr+q1hqNAGR0Q
	MZG6xGkxMxqeIKbZFeAkoXFTOlTdLB4R3NsAZzF808Sj159EFZcO1LRK1yUK3ROD
	wopb15V4SycTWuwDeOa3DMEer6RxRbvQ+kBiJcZAYO4kmx2LGQuXhdKWn/7axp+d
	ogusp6koFQC8Zp9mT6NAyLgaCoR2KJoLrbVnV7mdUmEiXyGqaWsp/LYFdGX9EOI1
	X0FKsw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrun1kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:22:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8ad8c5f80so42150085ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995731; x=1793600531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POiBPcDJVA0W7NWtaD04Jkc5yVkz3p2FFJOSCoNB5ck=;
        b=NNnum9JVySvAiF3rl3I9pKI/SR/21R6WVWvt6Sv05xgIFps5YfSu6EIeMCwkPtCsQ5
         hCZ3N4C4crYkkDA1pq3cNX6NBtYFqiGK0kZiTnAAVRygkiBctVw5g6cOZrX9fP2wnDUj
         KCZt3YwY+uPxHVHoN1Q/pcjC93u5PkV/jDlP7G5NPomkUIEnQ2gF18wE9nnErrXe5XZb
         2RwtnB39ngrvZ/Ez8EtoB5lHmjW0TdEftxp3ETMWH9HeYAQmdPpnmzr/5rOlPPBMuyV+
         awIKUq3hu5wAWgvJvvT8WPe22eCtYhl7uOl9Ho4rgviqNcTsgWhE7W3UqaTumY6O06RU
         uRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995731; x=1793600531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POiBPcDJVA0W7NWtaD04Jkc5yVkz3p2FFJOSCoNB5ck=;
        b=e8TGt+w9eMDe3xSj9CcAyiCUFUd1yniKhiGCoxunJCbQ/RHgnJeO5q1d2BM374ct/3
         tzsqFUu1e/BvnSupU5T84tN3EE40dv9+SDqspUUXNCJGCrYsDZkhAm6H3Z+FtQcx3cUc
         k4e0YcNqBk5swMht9C8VPoPlVrxRx4HL32Sd57aH51OMwo1n+7aKP3Zm+gYZ87mxhY02
         KatDOPTNnlTzlDwBc5j5lABAzLhQgYc2qyLPhtQwEWpLoB4aeLJWRwg9mGJJQyqA5XB9
         Oq6eW+fMCTHMfSGd/+nEk/0Y/XKo7ZVfks6FJBjkDnMR+VOGDZVTwbtfuPRu/WpeX0Yx
         On0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwPe5LbtsXnjrp+1nLGNbwma28DhE5gcmhmyFDgSag0xl9G+jPwopPRMi1S8czTw/V0kH62oxGC/979oObV@vger.kernel.org
X-Gm-Message-State: AFq9FYIMRdOYiztzQhctbRqHtqEl20zlqrwokboW7hZhmUC0BGxzNBm9
	Vs1+xgLCck+P534+VTHWfX4cKaVLr7OU9uWFtpxLsddPQlVRQDg0PqwGMgm3Ja6X+qe67iEl6H6
	CvhSL6Kt/4WawY0iIi3Q0aJ0/YGByTjvY5tx6r/FUFV7mowq689CfdjpSpFJTbbQgXgsQ
X-Gm-Gg: AYBFou2gD2oZBXz+FPzcZWZ25B38SjtLwHzAuylYanH3xkdfLRSPZlk6pidti6KzP9A
	FrcfOIIaeWdO6L82xVxV/m7j2z31vD5NvMbgKqIiyVNkZlTG+3o9bKMJ/RoCn+39cSFQlLoEN1k
	nJjMP56dVUYxekKRQrIgXSPJyCBfroTvNUxHqfvl5l378mTt/QgPAWR+V+sYhfNKd6WY3d0qB3N
	shzco3c7o0n8dLFm1RE0dPyLqcRmuWgVRI1Byvy+xFPP9UdkJtU/J8p+gEpa4Op8Wbas61F5oqL
	6BXxNgh4JbEAebiBWUow/sA2hRPv9nIGibNvu6PHdTtsaURydo+O3IYrL1YwxPWXoQ3bEHTVPMY
	5M6GHIuW5c8pciWurkdRj/xuZAl/CVbhcuw==
X-Received: by 2002:a17:902:da91:b0:2df:7fe1:72b8 with SMTP id d9443c01a7336-2ea9c621714mr54435365ad.16.1792995731277;
        Sun, 25 Oct 2026 23:22:11 -0700 (PDT)
X-Received: by 2002:a17:902:da91:b0:2df:7fe1:72b8 with SMTP id d9443c01a7336-2ea9c621714mr54434815ad.16.1792995730740;
        Sun, 25 Oct 2026 23:22:10 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:22:10 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:13 +0530
Subject: [PATCH v2 03/23] drm/msm/dcp: Add HFI device definitions
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-3-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=10561;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=sk048O3IgrNWFy3YZMxwRpaI1TNXq2tqfBpVYWngnVA=;
 b=q118fngHKM+mYo2M4qDdk6dfsYGHMv1a2Rxo5BFoY4d8b0A0UzHmhwqF9Jitu9S7HKMIVZkYA
 LZiC9eh2u3kCyc04NhpUtGtf8rw0m6gIQVfYX1QfP5orT7XQBe//A9V
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXxVxu3h0zlP0q
 vkLuF+d2W45KB+OUOY1TsVDQVThfyPk7kB1RzbmDuGELWtq6zpGEA5+5lbkMydvxTVu0JEyKwuV
 dv4qhCIjxT0EQ6dojSecdQrG5NxpsTaSIE4uqv9SO7rMn1ZhU/s2nIIsj0PM8RzBJ4t42w/Xu8t
 +air3H0bMhh5sNLStRkLQ4+hEMI/kWVdN1Q7fmQqh3/I2SfCK0j6ILIftCxeRmcpuje+NMAkINF
 9XK64mfMkkEnjN2Zi9LmWrqHHe9gxaDsa+nVY4m3u58gcRIwGF/IY2KBlAPzqkr4h7ppgKHV+hw
 pPpI54aFrrylk6oKe0BJ8BbgGB24bGMu+uGRs64tOB5OmUPYDCL2A6DZzJ6hN9slDBPiJZbTVWS
 +x1H3UI95lcYmG93iD1PRas5HtHpvRKtm/LyI39iAzErUNszG75xfBNZQ9OpTwZdNKj30hIpuii
 SYqo7KPsq+7h/8ED8hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXxsGq0EcswRDw
 CvPvM366NRs+pA+N/vsL5htJK3de7S179QiW9JqV3tkyComgD8i+f3QFOAVHuOFkUfKEOXfHhMr
 3769jg7VpydNyb6iHVIBHd5jLENZMVw=
X-Proofpoint-ORIG-GUID: x8HiFqGeE5ibgYDA8FLxg8cW3gzDWWxx
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adef194 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9hKN-LdXriKJwKJ2pKYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: x8HiFqGeE5ibgYDA8FLxg8cW3gzDWWxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

Define the HFI device commands and properties needed to discover DCP
capabilities and register display resources. The KMS backend cannot
size or allocate the firmware-owned pipeline without these protocol
definitions.

Describe device commands, resource data, and capability property
identifiers used by the DCP device and KMS layers.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/hfi/hfi_commands_device.h  |  78 ++++++++++++++++
 drivers/gpu/drm/msm/dcp/hfi/hfi_defs_device.h      |  61 ++++++++++++
 .../gpu/drm/msm/dcp/hfi/hfi_properties_device.h    | 102 +++++++++++++++++++++
 3 files changed, 241 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/hfi/hfi_commands_device.h b/drivers/gpu/drm/msm/dcp/hfi/hfi_commands_device.h
new file mode 100644
index 000000000000..abf15e6ceaec
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/hfi/hfi_commands_device.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __H_HFI_COMMANDS_DEVICE_H__
+#define __H_HFI_COMMANDS_DEVICE_H__
+
+/* Device-level command range. */
+#define HFI_COMMAND_DEVICE_BEGIN                                     0x01000000
+
+/* Initialize the device and return firmware capabilities. */
+#define HFI_COMMAND_DEVICE_INIT                                      0x01000001
+
+/* Device, display, and pipeline capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DEVICE_CAPS                          0x01000002
+
+/* VIG pipeline capability response. */
+#define HFI_COMMAND_DEVICE_INIT_VIG_CAPS                             0x01000003
+
+/* DMA pipeline capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DMA_CAPS                             0x01000004
+
+/* Common VIG/DMA capability response. */
+#define HFI_COMMAND_DEVICE_INIT_COMMON_LAYER_CAPS                    0x01000005
+
+/* Display capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DISPLAY_CAPS                         0x01000006
+
+/* Writeback capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DISPLAY_WB_CAPS                      0x01000007
+
+/* Register clocks and bandwidth resources with firmware. */
+#define HFI_COMMAND_DEVICE_RESOURCE_REGISTER                         0x01000008
+
+/* Firmware requests a resource vote from the host. */
+#define HFI_COMMAND_DEVICE_CALLBACK_RESOURCE_VOTE                    0x01000009
+
+/* VIG rect-1 capability response. */
+#define HFI_COMMAND_DEVICE_INIT_VIG_R1_CAPS                          0x0100000a
+
+/* DMA rect-1 capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DMA_R1_CAPS                          0x0100000b
+
+/* Provide the last-command buffer to firmware. */
+#define HFI_COMMAND_DEVICE_LUT_DMA_LAST_CMD                          0x0100000c
+
+/* Deinitialize the device. */
+#define HFI_COMMAND_DEVICE_DEINIT                                    0x0100000d
+
+/* LSR writeback CSC layer capability response. */
+#define HFI_COMMAND_DEVICE_INIT_LSR_WB_CSC_LAYER_CAPS                0x0100000e
+
+/* LSR writeback reprojection layer capability response. */
+#define HFI_COMMAND_DEVICE_INIT_LSR_WB_REPROJ_LAYER_CAPS             0x0100000f
+
+/* LSR writeback CSC output capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DISPLAY_LSR_WB_CSC_CAPS              0x01000010
+
+/* LSR writeback reprojection output capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DISPLAY_LSR_WB_REPROJ_CAPS           0x01000011
+
+/* Configure the hardware-fence HFI queue. */
+#define HFI_COMMAND_DEVICE_HWFENCE_HFI_CONFIG                        0x01000012
+
+/* Update hotplug state and provide EDID/mode buffers. */
+#define HFI_COMMAND_DEVICE_HOT_PLUG_DETECT                           0x01000013
+
+/* Configure resources shared across virtual machines. */
+#define HFI_COMMAND_DEVICE_RESOURCE_CTRL                             0x01000014
+
+/* Notify firmware of a subsystem restart. */
+#define HFI_COMMAND_DEVICE_SUBSYSTEM_RESTART_NOTIFY                  0x01000015
+
+/* End of device-level command range. */
+#define HFI_COMMAND_DEVICE_END                                       0x01ffffff
+
+#endif /* __H_HFI_COMMANDS_DEVICE_H__ */
diff --git a/drivers/gpu/drm/msm/dcp/hfi/hfi_defs_device.h b/drivers/gpu/drm/msm/dcp/hfi/hfi_defs_device.h
new file mode 100644
index 000000000000..c6c8fb556c3e
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/hfi/hfi_defs_device.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __H_HFI_DEFS_DEVICE_H__
+#define __H_HFI_DEFS_DEVICE_H__
+
+#include "hfi_defs_common.h"
+
+/* Hotplug state for dynamic display interfaces. */
+struct hfi_device_hotplug_config {
+	u32 orientation;
+	u32 port_index;
+	u32 pin_config;
+	u32 hpd_state;
+	u32 hpd_irq;
+};
+
+/* Display resource ownership state. */
+enum hfi_device_res_state {
+	HFI_DEVICE_RESOURCE_ACQUIRE = 0x0,
+	HFI_DEVICE_RESOURCE_RELEASE = 0x1,
+	HFI_DEVICE_RESOURCE_SHARED  = 0x2,
+	HFI_DEVICE_RESOURCE_PRE_RELEASE = 0x3,
+};
+
+/* Virtualized display-resource types. */
+enum hfi_device_resource_type {
+	HFI_DEVICE_RESOURCE_DISPLAY,
+};
+
+/* Virtualized display-resource configuration. */
+struct hfi_device_resource_config {
+	u32 disp_mask;
+	enum hfi_device_res_state vm_state;
+	u32 resource_type;
+	u32 reserved[2];
+};
+
+/* Subsystem-restart event. */
+enum hfi_device_ssr_event {
+	HFI_DEVICE_SSR_EVENT_START  = 0,
+	HFI_DEVICE_SSR_EVENT_END  = 1,
+};
+
+/* Subsystem-restart information. */
+struct hfi_device_ssr_info {
+	enum hfi_subsystem_type subsystem_type;
+	enum hfi_device_ssr_event ssr_event;
+	u32 reserved1;
+	u32 reserved2;
+};
+
+/* Active layer mask for a display. */
+struct hfi_device_active_layers_info {
+	u32 display_id;
+	u32 layers_mask;
+};
+
+#endif /* __H_HFI_DEFS_DEVICE_H__ */
diff --git a/drivers/gpu/drm/msm/dcp/hfi/hfi_properties_device.h b/drivers/gpu/drm/msm/dcp/hfi/hfi_properties_device.h
new file mode 100644
index 000000000000..790fcca6ac0a
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/hfi/hfi_properties_device.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __H_HFI_PROPERTIES_DEVICE_H__
+#define __H_HFI_PROPERTIES_DEVICE_H__
+
+/* Device-property range. */
+#define HFI_PROPERTY_DEVICE_BEGIN                                    0x00010000
+
+/* DCP hardware version. */
+#define HFI_PROPERTY_DEVICE_INIT_DCP_HW_VERSION                      0x00010001
+
+/* MDSS hardware version. */
+#define HFI_PROPERTY_DEVICE_INIT_MDSS_HW_VERSION                      0x00010002
+
+/* VIG layer indices; the high byte identifies the rectangle. */
+#define HFI_PROPERTY_DEVICE_INIT_VIG_INDICES                         0x00010004
+
+/* DMA layer indices; the high byte identifies the rectangle. */
+#define HFI_PROPERTY_DEVICE_INIT_DMA_INDICES                         0x00010005
+
+/* DCP firmware version. */
+#define HFI_PROPERTY_DEVICE_INIT_DCP_FW_VERSION                      0x00010003
+
+/* Maximum display count. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_DISPLAY_COUNT                   0x00010006
+
+/* Writeback block indices. */
+#define HFI_PROPERTY_DEVICE_INIT_WB_INDICES                          0x00010007
+
+/* Maximum linear writeback size: width [31:16], height [15:0]. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_WB_LINEAR_RESOLUTION            0x00010008
+
+/* Maximum UBWC writeback size: width [31:16], height [15:0]. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_WB_UBWC_RESOLUTION              0x00010009
+
+/* DSI interface indices. */
+#define HFI_PROPERTY_DEVICE_INIT_DSI_INDICES                         0x0001000a
+
+/* Maximum DSI size: width [31:16], height [15:0]. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_DSI_RESOLUTION                  0x0001000b
+
+/* DisplayPort interface indices. */
+#define HFI_PROPERTY_DEVICE_INIT_DP_INDICES                          0x0001000c
+
+/* Maximum DisplayPort size: width [31:16], height [15:0]. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_DP_RESOLUTION                   0x0001000d
+
+/* Downscaler indices. */
+#define HFI_PROPERTY_DEVICE_INIT_DS_INDICES                          0x0001000e
+
+/* Maximum downscaler size: width [31:16], height [15:0]. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_DS_RESOLUTION                   0x0001000f
+
+/* Core average-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_CORE_AB                                  0x00010010
+
+/* Core instantaneous-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_CORE_IB                                  0x00010011
+
+/* Core power-rail vote. */
+#define HFI_PROPERTY_DEVICE_CORE_POWER_RAIL                          0x00010012
+
+/* LLCC average-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_LLCC_AB                                  0x00010013
+
+/* LLCC instantaneous-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_LLCC_IB                                  0x00010014
+
+/* DRAM average-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_DRAM_AB                                  0x00010015
+
+/* DRAM instantaneous-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_DRAM_IB                                  0x00010016
+
+/* LSR writeback CSC indices. */
+#define HFI_PROPERTY_DEVICE_INIT_LSR_WB_CSC_INDICES                  0x00010017
+
+/* LSR writeback reprojection indices. */
+#define HFI_PROPERTY_DEVICE_INIT_LSR_WB_REPROJ_INDICES               0x00010018
+
+/* LSR writeback CSC layer indices. */
+#define HFI_PROPERTY_DEVICE_INIT_LSR_WB_CSC_LAYER_INDICES            0x00010019
+
+/* LSR writeback reprojection layer indices. */
+#define HFI_PROPERTY_DEVICE_INIT_LSR_WB_REPROJ_LAYER_INDICES         0x0001001a
+
+/* System-cache staling configuration. */
+#define HFI_PROPERTY_DEVICE_INIT_SYS_CACHE_STALING                   0x0001001b
+
+/* Active layers per display. */
+#define HFI_PROPERTY_DEVICE_INIT_ACTIVE_LAYERS                        0x0001001c
+
+/* Writeback DNSC support indices. */
+#define HFI_PROPERTY_DEVICE_INIT_WB_DNSC_SUPPORT_INDICES             0x0001001d
+
+/* End of device-property range. */
+#define HFI_PROPERTY_DEVICE_END                                      0x0001ffff
+
+#endif /* __H_HFI_PROPERTIES_DEVICE_H__ */

-- 
2.43.0

