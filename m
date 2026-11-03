Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668480;
	b=IKukQA1JVCM4oPkuq82qHDzaS63L8ikoM061yVGirCpm2pNlDX0wWkP5500XGL5sOWq8
	 yBTI/fCAM8OFqgXlQqI/h/Yf9Gm6gaY8qdp25Va9bggXxEQDWUHO8VEaFnu5UoUUaF8J5
	 LTwgI33yJqIs1gzeuH/U1ym8sYsye6gM/NOUWLKm7KzYWW4WtC02paHaz7WNvUy2Q1ZSd
	 fD4sxVUGOfRDbhWKKobgIz1uI7apH6RAroyMEY1w5vJ6QqA8WPFgSqVJ0GjsrJ/wHP8AJ
	 9IWDK5J6ywxNHix/8dp11gAIJ87O+fgijJjOfZ2zbj2Nlu6Gh9IiAug7odA3+IihBGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668480;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FDbV8o4JlaTKYOI5WW+V2TORhEyLD4PGRa8uy3gNXRs=;
	b=5LKkntCF+QBAOGWkvLw6pWJP8Gy/p7QqtAEgkOhTheJejCZZtbVxYo2Lg0N4BKn3CN7W
	 5Viry2A8nYXpDQOXHVtHzpVGSOEH8wQ5e8xRB2syloi1F8Rbk5To0OnyBrD3Cslf3stw/
	 e1tt20NLvFetTWtJs8JzEyED+Dk1+dxP+IyOFBwD/gqDDEAOoQ8D1znqnAjEVXZepw2kX
	 vVDS3W0aB6hhFcBrRM9Ol+2X51t6yiNujElfneKURewU/LNLJfNESCfTrA93e3KiX2Mbp
	 949S7newm0WWdnuuqvsINXfKCUx7huY+ncLfi23gzkoZ/+s3h9BatFDHLfhSNeMCNQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=hUHuFU5R;
	arc=none smtp.remote-ip=95.215.58.182
Received: from mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807F5606A333
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 01:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807F5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=hUHuFU5R
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/G7wmxsTL23u9bAYd6YQYYYXjzFS/q8bqKEQoNriAAg=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793668477; v=1; x=1794273277;
 b=hUHuFU5RlcnDhKHgGREFIsXDCtO8AnpM/znRVTTc98utRqLH3OFHLnbI2a/R49Nztwqjn1C0
 HDj5hNoQ2xznG3VYVPzFx2Qs2OnVkXMwliOWmo1o/Z5v8RquvRrHn2APWz8ecWK77zcHH47e9S7
 7z/FhK1gFCZ4pCR1D7LwXdBFTpbk58WWXto8rb5CkXeF0qTKgMuOapL5Q0oN1joynV96Aa2baUj
 zXmJQNcRP9UUM5tdyAZNHQGuLbjEvZZ/xqh4FoXVZTlYTsjEuJ9PvK6/lVshfP6BZpr5xQeAVdj
 HvdHq5TrW5288d7oH+qx2QCMSJn21F0rTMpci/Jvxosiw==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c2c0fa72fdcaf99d;
	Tue, 03 Nov 2026 01:14:37 +0000
X-Mizu-Trace-ID: c2c0fa72fdcaf99d
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: [PATCH 1/4] drm/msm/a6xx: Restore GBIF CX config for A640 family
Date: Mon,  2 Nov 2026 22:13:50 -0300
Message-ID: <20261103011358.65398-2-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103011358.65398-1-val@packett.cool>
References: <20261103011358.65398-1-val@packett.cool>
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

From: Maximilian Luz <luzmaximilian@gmail.com>

Commit 60a4e18e0e8a ("drm/msm/adreno: Do CX GBIF config before GMU
start") moved the GBIF_QSB_SIDE{0..3} configuration from hw_init() to
the per-GPU catalog entries. Previously, it was applied to all GPUs of
the A610, A640, and A650 families as well as A7xx. However, the A640
family entries (A640 and A680) were not updated with the new gbif_cx
list, so the configuration is no longer applied on these GPUs.

On the Surface Pro X (SC8180X, A680), this results in GMU HFI timeouts
(e.g. for HFI_H2F_MSG_GX_BW_PERF_VOTE) and GPU lockups shortly after
starting a desktop session.

Add the missing gbif_cx entries to restore the previous behavior.

Fixes: 60a4e18e0e8a ("drm/msm/adreno: Do CX GBIF config before GMU start")
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 4ef2bd6e7ad2..6c154792cb07 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1041,6 +1041,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00180000,
 		},
@@ -1164,6 +1165,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
-- 
2.56.0

