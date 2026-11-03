Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668489;
	b=Hjtb/e1sBjT9pc5wAeB2vSib4Ca8KXjz21BKemBhsrJHxPw4KRhq7vK2XVEzIMr+iTjX
	 H3vt9L1Lp/qSMJL3GaH4a7LIEUFLwCAJrY7XeBRZJySWeXQzIoKCib7rPU7y3Mz+Xpqf4
	 qi+l3uT5S31rNT2OTNNd4EchdcD7hgEPJ6Fhg9sIe3a03IAj1aBoHXqS7ZPIaaWN491gW
	 iU2fngMpqnyWWiFlYgYyI5OKEMAXHf23jWdVznVwfuVGCA1hHZHklbeeqRHHTKtN0jKuu
	 9DvPbd6UTG0/oIhQujKuXCtAaxLDxNCkVmSes06bYgY6JglrhnS0/CZuMVbTILj+6XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668489;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g/UwPbZsEfKPyu0kqvTNSyQCWMIFwuSw3fy30ScQPdQ=;
	b=qd9YSmf1W9jCYDD/PoUEtcZepF9V/IIWkzYVGcK47ic3vgQ8Qd9BfYV+mkOZyH5C3Usw
	 O7681G0bXr/bGxMkMF3JRPWbolSn1F+duYkOVd5o1lkg1H9fGf6+it3n0Xjh9h97sUh54
	 EUw2fb8LLbTjZNpA31vp0Q8ctutN0pudcvwI44HJcmALna2ztn3zHkcXIPYJ02dp7QY4G
	 oc7zHyv63NeNnHZw1cCDcEqxvtoFfnQx3QWFLsDYqX1rt3p2sHA4I4LmDIAq6t+nq0Mz4
	 DqgS3bouwM9OZMoXJMsnj93XWXdPRoqqWhs8tN/BitoA8Zbumf5m/Pp33YuHfA9P4aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=xUB2bOwL;
	arc=none smtp.remote-ip=91.218.175.201
Received: from mta0.migadu.com (out-201.mta0.migadu.com [91.218.175.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81C3606A332
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 01:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A81C3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=xUB2bOwL
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M7KNsVL52+HwE/KuKiYMZJHZOwiCnmNAq9sLJ6hYIck=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793668486; v=1; x=1794273286;
 b=xUB2bOwLp5bpr5+F48OHM/aO88IDyrddFUNZWumraqq+lXSZFCWtcTUvWO9cUqnGESwW/rLE
 86VKij2vVZg3zS4PBAziS3DajvdAsGIYQ+KjcqtDhEhkXBb/U8Yo3b333CazpPvf1K9zW9QJSuO
 9LBVhEklEri4L3f4q//7tagVW5yK6nV/wKBnVvUwFhyWfflulQW2tEwufzVKKnevNs0Uo60LDTY
 RIRGCL8ZLmuuU6D/VUTdbT75LrG2MdDDLNwHHiYYNYiVi8F/nI8gPR6L/M1Pm5+ZwJyC+lLrC+N
 evoHqaGct6d9523N4ILc4P9KusSwrgvmQUxSA2sCCId6Q==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 347836c0883605c2;
	Tue, 03 Nov 2026 01:14:46 +0000
X-Mizu-Trace-ID: 347836c0883605c2
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
	Simona Vetter <simona@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>
Cc: Val Packett <val@packett.cool>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/msm/a6xx: Fix GMEM range on a680
Date: Mon,  2 Nov 2026 22:13:51 -0300
Message-ID: <20261103011358.65398-3-val@packett.cool>
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

On a680, the GMEM range starts at 0, like on newer generations.
Trying to use the 1M value results in texture corruption in Vulkan.
Fix the wrong range by introducing checks specific to this model.

Link: https://gitlab.freedesktop.org/mesa/mesa/-/work_items/15349
Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Signed-off-by: Val Packett <val@packett.cool>
---
I have tried adding it to the if (!(..)) condition i.e. not
touching the REG_A6XX_UCHE_GMEM_RANGE_* at all -- that just
made launching gtk4-demo instantly hang the system..

So the only thing that works and solves the issue
is actually writing the zero for the start.
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3e4afaa5345f..26440a3ccecb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1279,8 +1279,11 @@ static int hw_init(struct msm_gpu *gpu)
 	if (!(adreno_is_a650_family(adreno_gpu) ||
 	      adreno_is_a702(adreno_gpu) ||
 	      adreno_is_a730(adreno_gpu))) {
-		gmem_range_min = (adreno_is_a740_family(adreno_gpu) ||
-				  adreno_is_a722(adreno_gpu)) ? SZ_16M : SZ_1M;
+		gmem_range_min = SZ_1M;
+		if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu))
+			gmem_range_min = SZ_16M;
+		else if (adreno_is_a680(adreno_gpu))
+			gmem_range_min = 0;
 
 		/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
 		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN, gmem_range_min);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index dadfe4c69438..67bd66c78424 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -382,7 +382,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
+		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3 ||
+		    adreno_is_a680(adreno_gpu))
 			*value = 0;
 		else
 			*value = 0x100000;
-- 
2.56.0

