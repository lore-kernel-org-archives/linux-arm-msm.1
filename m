Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CF1145B3F
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714190; cv=none; b=a68vVxmvpyzoF6Ixeapv8Owq4gj6+fEdRere/+djYRSoMVNjWNEeFYfV40VRLVJKb4zwo7ImITS7hH4+U5a0qHGbYO1pbLks6ZQZ46tSS4WEpqDkBoYNxQWx3HzAhkOiaUVBEmjIoxHd4dq9UCwDPv0VebW6h/H2E8qBvDPB1PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714190; c=relaxed/simple;
	bh=JdERWbk/yQ8la+uVrMoblOL8wRhRcAAt+FH7m+1hVdc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qKeihZXovURgmPCQsDid2L1/+msSIkhv/xofxZ/V68zHPOKaTL8SXrLKNykSUsV4U81T1qCwQ7q9kWVh9Gbu6u8OblBNs3zy84IIO3e5NWtQkeCtpXkILj5VZC1rbYbVXxGVIsoF4vhG8ITfXOWoBWZXtY4I7xxqAx8MHFrYmSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVjY4buI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVjY4buI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so37730055e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 10:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714187; x=1789318987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=keOtw6Clq8MhI7P5qphmjdddbgYhK6syZpV3w0I8X+w=;
        b=YVjY4buIK2jkZQaRSfio2HQxeIF64ZLEHPPzT83vQjSoDh253xAWLPW+pz/rS6o4MT
         tXJqV5PnjH+j22mHEgJZ0IKlhVP2WsYTNSCYrqcgLGknadC6bA21An2RJ1uO4c0D+wyV
         HdSI0CTIfGQwam2kwKfsq1j3AVWNvi4SgB/vhsegdYsZ61o85dlgoBqN1AHh7kLzjLsv
         3cWRgQIBbFMa+z+5UDmXH8f2rk0ysjci8fa/YPTcHVuiM75nsS393zFlf6SEYWPGZ+cC
         MYKsHvAKWZchX0KoEmM1MML5Q+7jtAQvVtTw/J2kNZ1AkjxfpL8gJYmrDMIFdvS7GQd1
         elRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714187; x=1789318987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=keOtw6Clq8MhI7P5qphmjdddbgYhK6syZpV3w0I8X+w=;
        b=Bennz6wR/bPabjklWaP2ZkhS7hQtyXVWI5Sl14N8taAhMViRmTE6eLYetwNCA20fXP
         2fqRaq4TOCl/lR0USUBS3TPIyYnCtg9EDdO4GK7rS0rD9nwxP+qHBvv+A9uGVi/gHsMD
         Mbw5qRHeVwU6ykiFy2l4wi5dNay9UjTiz0zSUX0NWoRZ8aq3k6J5kq0/aqzg9M9D5UOJ
         gsYnp/VNN+hR2MPNXXXB47gd3pfPutrHEU4QNw/3X1i/FuBIM3kHShCVcCcLYsj4V4YZ
         lcvi9QMEKAOep+vGTeolic0T2SV+iBX8CkTnfIaHxD2UbDrWUQfJXEE8SongHexOAOrj
         kxbw==
X-Forwarded-Encrypted: i=1; AKwUvBx7nS7Y2tBougkcOwJtENuo+KYGPwGSwr79CEmhV+whYa0SYmdzhPKplalFactmhwIVHZDFl4kPLqCVKEDH@vger.kernel.org
X-Gm-Message-State: AFuF++m0Bs3imOe5Q4tz1O3vIdOUfFpM3Oro5SDD0iSzflZsO58MQJVy
	fcHTiLHQ4psU1InQxQWb1Jl3rfn/HkeJUwbMtVEkHb6S8sk8nyXCVYXW
X-Gm-Gg: AYBFou0L8En05M+u6BJ6VpkBpRp6pVDUfFnfv3W4zgUWdyu+P2ggt48ykaxVpLyQuEy
	vQjRPiGNIPaCmN9NQDa5smRfHLTiDwv2WVVLAoSpJkmKFCn6d/Iwgk0JBOWAUzvjaUgIDwSR4st
	2ae8Hlmem2XYQu1sPBeVDPD5Ksks+ZCzZ6w3cg97O5UyccL1oumjH0gnGR9OwgbUUnd12fwAWSV
	VqK+er8EewAC3eR3q4XRLOkc2az9UtWHYJ8EaUd18yQ/qaCWxL+l5iO5nXbsgx5tIqeXKAziGif
	31pIv+hadZ9hMJN188TORFnymd7YrhVAUBsLs8yCsdJCyZF3kr7ucpEZ0yuw8DP522cHEl4iI13
	fuWQaYGMKwehy2e/dGMCEkLZnWM433sewgFIGQ1IXKbVgiLUHfhTIBvMlF5sJjTdTsJ16foRU50
	MYWh8DRPYaFOfSEliRHztIfNjCRXKQy5vQMOtEd/ysca3ljQWY0f47S1Y7TJ97LAZXLjRTtXWjc
	pm5pN9WwDlr+A0q/x91e6nJxycGl0Aw16DKkfzFgqIgyJsUnmWpPZO3EXLE1AsllPv2nvArU9m+
	b3VtI6bbox5TVhE8y8Q25CL426sefM2AmYgIUvxnJhqmShtA70tjEg42jPqZxppqR4jDBY/k
X-Received: by 2002:a05:600c:190e:b0:49c:fa21:1c82 with SMTP id 5b1f17b1804b1-49cfa211d3dmr159299395e9.23.1788714186823;
        Sun, 06 Sep 2026 10:03:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d84-5101-9c80-d25b-14b6-410c.310.pool.telefonica.de. [2a02:3100:9d84:5101:9c80:d25b:14b6:410c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm427796685e9.1.2026.09.06.10.03.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Sep 2026 10:03:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: Fix the skip_gpu parameter description
Date: Sun,  6 Sep 2026 19:03:01 +0200
Message-Id: <20260906170301.2393-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The module parameter is skip_gpu, but its MODULE_PARM_DESC() names
no_gpu, so modinfo describes a parameter that does not exist and shows
no description for the real one.

Use the parameter name in the description.

Fixes: 3f17991488af ("drm/msm/adreno: Add a modparam to skip GPU")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7f20320ef66a..05c77fe27e62 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -25,7 +25,7 @@ MODULE_PARM_DESC(disable_acd, "Forcefully disable GPU ACD");
 module_param_unsafe(disable_acd, bool, 0400);
 
 static bool skip_gpu;
-MODULE_PARM_DESC(no_gpu, "Disable GPU driver register (0=enable GPU driver register (default), 1=skip GPU driver register");
+MODULE_PARM_DESC(skip_gpu, "Disable GPU driver register (0=enable GPU driver register (default), 1=skip GPU driver register");
 module_param(skip_gpu, bool, 0400);
 
 extern const struct adreno_gpulist a2xx_gpulist;

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

