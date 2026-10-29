Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314959;
	b=ZNH1vG+Whv4rXdvdJqfbnYENqiMxCwotssrktW44ZjAurTkFeD17MkKeIJufMcxAUGPX
	 QIhG0QKSw61ac5KFbrXGHvKvEE5o/1D1XAA1P8Zuw2idpMW9QUtL+rDHxYc7s6rqHBJE6
	 8fQWOO+jzIb+w6XFDiZaqCrt1W68K3/1eeVg9WPpzy6RNC5YivXVKY41cI6Ns6wtFUbAn
	 8i0Hy5LTQOiwqs47sz05bfaM8Fm2PDyhkgDWPuQXvkhTx2wzNXGwctr9nm1ZEjO8MeZ0I
	 1nV0O2wUR2xUum1zfm3cj1LhKQok/qW7brhMXs/6L5TsjO11yBZubGylZbcbFSWzg+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pdQPJwzRJN+nwSRrKcHiePRwRlhix19hahTM/4bzC3U=;
	b=J6zgNNlLSciXrGb+2rCk+sg4TgAzA40+UaM9RcJGD0z1Q9rqKiEu+/VR9Dhg8HyAXo6l
	 Z48SQqfIxW/7Dlur6C2fV0ra8fVr6uLpiLVIkUH2IqVrpMJ23u1dreMWXhQa8CUff/Rgv
	 XYlcD8DacdXIaag2RRdJFW6dNEuCFuHL9zo4NsYDGn2w9if0zzT1FN1+lSzWqwins+O+x
	 SzrHl0RIORSfxoDy6cxZeGtLNd+FDG9B3np2SMnDfV2d6zaOgtBEmawLNUA6BMEL+ia7T
	 WQz+DJtkUigs6ADQ6TwHRoMfJpRbeNV8VMPmrn0nzjmbbT3X9Gh1oc3fpFyIFBiYGIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAzLNtKm;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CE7606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4CE7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAzLNtKm
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f1f8f59a1so1146485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793314958; x=1793919758; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pdQPJwzRJN+nwSRrKcHiePRwRlhix19hahTM/4bzC3U=;
        b=NAzLNtKmCsF0IKPMBCGp4+IcOcKUbrxqzpMPhSHot9YZrrD7fDW6aqmudJfyu7IG8R
         qQX63gDLg/ORm7+PWOUwW4IwEAHpUFmtBk91+smAEsZ0qYgNPdXt5gYR29qeJjQUmN0/
         +jVX4RcZNIdKE1QYKjcSsgZCK2/TeGyu5zP0WT3EmwxLdvzsFUEnMhxJbOS/75BZq6X2
         rwUbWV64rufl8eJJDGOx0kYyikuipmgTHXz6HDjVcG7lQKbZzlpM9+zNivbIxJJ8+rdB
         K/6dJSbREdsozfMcdC4ADmD/sIPtrnoF4Yd3cZFXOnRrzwGiNEUMkKc8D+gj4FV5jkPK
         jsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314958; x=1793919758;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pdQPJwzRJN+nwSRrKcHiePRwRlhix19hahTM/4bzC3U=;
        b=Y/3dBUpT46D/x6zzwp3M7R7nPFGw2Gs7/jpeZRlqBRuMzUv151PI3zDJ+GuOvA7Sbe
         1ZVGA/koN0LN+JP8yqLQa+t6ZDM8nnPxI3acY9unE1m9kZp/3V1BwM7qHaosOExzB5am
         p2InYzajm/XbOOhYWtqHEDBxg/YANmZeTWxsKFMvARD10Vmw44tT4IZRCPPw/rYz0ZCZ
         LBIr8/oF3rV3eTp1B14lHRrXqPU9ahD4033+hx2Dwqt6Djex8scUzzWzUhcMe6dMiVMR
         qp3SSUWhsCYgPTm74KiBSw4Ch6/ly4tQhuvxrg8S+MBX5JQRZ+3+paY1sHo2A3mLpDHe
         IXzA==
X-Forwarded-Encrypted: i=1; AKwUvByRBrxKdABKZgvVRQlULUgMPIrNqS1KPYdrISSePCNNcaQ2jscXgG4H6eGGRigPf2vnhslDrXS3GqLrBlLk@vger.kernel.org
X-Gm-Message-State: AFq9FYIk6up6C1e4XlOp9qGwpaMIywSBqIExduw+sZm/IYNpQcpXZB+d
	jeJWwDDZ2yyaZC6aHVOx2Vt4Pfa4CWj36h93wc2aG9fBFhpMvlsE1Vnp
X-Gm-Gg: AYBFou2tcIqr1Fp+UG7EBr/BHnBkQ1VXMOfK4hbb2ehQqn4KHzTmOashvTVFoKBLVcP
	GmWONSocGQ9mDsWjlzS0c3DYBd9uPLT0goLRnlHq28c4sS5EcUCyDViXSAnrOoetKhm9Sfg79uW
	YNTKheXWPU1LHQECPJmc426riO7RtxnCc0H0qxm/P/ZcU1OSyhF3mqvx/h8ER7pVfRoZT/aiJoe
	Fqj7u7PI5P3HhhUKQ7ZJFXbq9QQG15XsqmYTEd4JmjQ6PXnzCpzCXm2HqFlnQi4HygfTun0//B6
	nNC2qJZFmIAHDulY7uyJRD14iXnyyNGks6dBwrTXaLJTzROm83nVEt5qnihJRNYRyXotVthRVES
	zBxMJSnNnLmgHUrKzksgnReY93F+Xm8m+auR5JzvfDOp0riOUo0fJQojo0ebRWUSON+d8uky6HL
	ibKHAbGukSo7kD82SzSzsW/aWv6uf30F5y9j1/uWuBWIekZizAf6C9THso+SVF47XaH/aZEVvgT
	EYKCm9jIacUEhWiKG4qFV78/nUZceEgZejlqlsYBDsG9y+0RbaWaYbbdQZkTGHJxjasjR3EI1Jt
	c1n6mZ5QG9/gcPloOjSNBUEPIqlW0ps5Coc2VnTZ94rnRD/7SfOmyLX7ZoKS3K+sQA==
X-Received: by 2002:a05:620a:870e:10b0:940:f21a:eb64 with SMTP id af79cd13be357-944216f3e4amr127183785a.5.1793314957732;
        Thu, 29 Oct 2026 16:02:37 -0700 (PDT)
Received: from [192.168.50.231] ([142.255.23.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94424133d61sm2791485a.3.2026.10.29.16.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:02:37 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 29 Oct 2026 19:02:30 -0400
Subject: [PATCH v2] drm/msm: Fix GMEM_BASE on a8xx
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
Message-Id: <20261029-drm-msm-gmem-base-fix-v2-1-26b338471b46@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi21oKuvIdhUcpYJnGAtIZoC
 He3cgGX7yX//RUyJaYM12qFRAtnnsYC5lBBGPwYCbkvDEYZp5W5YJ8EJQtGIcHOZ8IHv5F0Z5T
 VjSfXQNnOiYreu/e28MD5NaXPfrPon/1XXDRqPNnaWRPOrlbhFsXz8xgmgXbbti/Yy28iugAAA
 A==
X-Change-ID: 20261029-drm-msm-gmem-base-fix-e1b20418ae68
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.3

This was missed during initial bringup because GMEM_BASE is not used
anymore for textures on a8xx. However other things such as mesh shading
still use the GMEM aperture. Fix it to match the value programmed into
the registers.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v2:
- Fix enum name
- Link to v1: https://lore.kernel.org/r/20261029-drm-msm-gmem-base-fix-v1-1-347642c5670c@gmail.com
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6bf..5b05386ecffe 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -382,7 +382,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->info->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
+		if (adreno_gpu->info->family >= ADRENO_8XX_GEN1)
+			*value = SZ_64M;
+		else if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
 			*value = 0;
 		else
 			*value = 0x100000;

---
base-commit: 9c31496a57579d0a46e1eabb8f53ec735b72d180
change-id: 20261029-drm-msm-gmem-base-fix-e1b20418ae68

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

