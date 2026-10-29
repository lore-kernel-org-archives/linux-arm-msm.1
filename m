Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314667;
	b=ZZw7NIVyrT9XFme4YDsi8A9X0pGX83/JWIL8h7qIhotolWbxXvpy6bxRxxhc1t8uzB4t
	 G7zYbYdjBfI/he6UsJo3JQaSyhNKxri9T6l9rQlib8eUGI5Crk4GpxfBV5YS2U5UAfijV
	 Ife1AasugJl1D7wNYtgRMHXTo4KekO8A2wdHHzA+ySX8fhLqqmKD/D5uezOdFnIJlJPPQ
	 Y0PFVPrsc/zk8sDCoCVzwrdKAxzJagFVr7i74EduRQE1bUKgADyPAGmf7T/16AHMapVrQ
	 00mlxdY4rI9IJWA4bTGsdsX5nazWvLLxIKmtP/OKMDxsAGWNGa2yaLkf4UaBtdToKDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=h5Hpaazv/PJJXvnma3M/buleF7hZLhW/TVfnybhiNnk=;
	b=iIRGcRAfdP8a844Uoar52R+o1V4qNziQbLOYJkTYc1TkCkoDci+va+qU0V0CkW7A0IYG
	 7kwATwee8+g3eIsuOzgnc9ejxGKrdvcN6ppL3gmuWrrbhWuT5H+PnS5E02ub/CqQ/P6Gz
	 I+FNSvB6MfUg/8bi/JUNA16BJ0EzBq4EBYWG+60JDoRU6l4ktrJ9vJKdIk54l7ynZBqh4
	 gvxDSQ672YHwPkvrU7+NNaNgJsmF7sRb4B6qm56UsfNZkW9ln4JeDM5gqu8Y5QQvFZ9vx
	 uoJic4wvcxzVs6K4B1VnqxoHPq909+5INfwgRMRJJxcz1AcIcrxoevHlkQKvX7Zc1nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4Pk0bGY;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B277606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 22:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B277606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4Pk0bGY
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e5f533c35so1315885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 15:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793314666; x=1793919466; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h5Hpaazv/PJJXvnma3M/buleF7hZLhW/TVfnybhiNnk=;
        b=q4Pk0bGYejC80Vlg67vDiA4cVoyVezrRwL/1kfbcJktkHfwldceCME3k48jqzEdkVH
         BIZf3TJ+vT12mmlyXb5TU34cFd1GCX5uM6+LYC6SSZKz4TTNPrreQhoKNz68yjxq5KGv
         iuG8X0cBW5FiFjH4wK6SY6XQpOsGGIVJbkJiLeGRFq8ny81jQHabr0xmesjdzbUzzCDk
         nd9lQzo6sBGPzRNeuG6Ua+or8vKb5lX0QBP6GkMcBNVzfEo43rbhlpfLWr0/5AYscHm4
         9FvWolXD8PRa6YTChCqHvPFIoK8UMbJN7JdAKwi0rm/yjbctju6tyJ0GtpXLkUtB/+nI
         +agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314666; x=1793919466;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h5Hpaazv/PJJXvnma3M/buleF7hZLhW/TVfnybhiNnk=;
        b=shAyHQ5HNzPOVOFmH497F6jgdehrV8+MDoyl8qpwyR16Xe32HyP4JRvvEU4Shbo9n3
         AkeFr+WKzF4R2beM9cS0FP8f/SBd8+qrTl/4SN+m6g/yvi5o0Z69/d6YFmmfQRDFSLCL
         MTJdDaVscktn2j8Ie2Qbp8SPSAhZ6VnZVbhA4HEGVuP9cI6RYbXCI2FiOU7PhMA6l5uh
         hhV1J1n8xkGmiDlJHu9YLaoUiySk2/IF+VrEcs3w7EvdapmARUdl/0ShnISChHgFI8eK
         XMcZwCOJFCc/WDon4u1NzYFk7e/SQaEGtJ7k8q2fJPM/3GYV6Zl7xNCEoipNzZMyNwYJ
         yb5g==
X-Forwarded-Encrypted: i=1; AKwUvBzUfB0YRlx5/E1jZVz6nK1OP3xkE4UCmY6uhAS7s3XEsNKDwfpRGZzk8ckZQM6VGk53ctF6DFyxyGYqxKH9@vger.kernel.org
X-Gm-Message-State: AFq9FYL33fqmkPuUSNKNDK/3xrk2CFMV2SA9WYIN7MPa7idKRl1Y9mLV
	ISD5DBGFYMizOVrJavTNdL+22zmiBzXJ5DfSL4G3WLFVDtsr8VobqXoq
X-Gm-Gg: AYBFou1CYwaX3yy1aemH+rOMnNaNzZJMrrckvlKsSEINJRLZTQmwBrgfI4AYrvY0mm9
	3oTBpMpghhQkDGcf2n+nmobM0tZMQ++5+aRc7h5y/6QvnZMgsfDKsepudfWEyjtHJSb94D5dhjJ
	A1ThMh33nGujH/1RHzpYXYRvk1ExyqtAAMpFA8vPQJrV9uNeJC8a5fmoMocZhBl5+dNyl8OZkC3
	33q+VeD+OwxklHZpSUUeOyK0q6y7Q2iy7NGbTgr5sDbLbJv4Dl0I4eeRUJOlo+VqJCgq1mBf+aR
	C4A6etyQ29zNWZ4D9krIgpqOMm97kx1vTEptEFKp8AhlwvFbldBAqtbAG8FojxAREDxdskUaRv2
	339KSDTU1nCS3HAR5EpRK0dRbOUZXErfPdTZTP/e8k4uI0Sc65Qd8jZhWRiCkYKu1oMr/Z/7Gjs
	IeTXUPfxn5pT4k90YXSS1Gx+EZ7qVtRnepkQvLBzJL0BMiDKCGC5/6rkrBnmF7IyFXoJVyiy/+c
	b3o5d/bb8sd8FkX76IWvss9wxjP6DTsZTs8ymaASHi6+PdKOilyk2DKD4CEWmwIXgHelvfFyv2B
	5b8oSm1q6xg8nr2/JaCRp7saxpbVcUqcrFxJEgu+K9/H+AU651cjyZiwzxXVMl9C+Q==
X-Received: by 2002:ad4:5cc6:0:b0:91c:7b53:8007 with SMTP id 6a1803df08f44-91ca4b3a873mr10249726d6.4.1793314666398;
        Thu, 29 Oct 2026 15:57:46 -0700 (PDT)
Received: from [192.168.50.231] ([142.255.23.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca68c1578sm928146d6.40.2026.10.29.15.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:57:46 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 29 Oct 2026 18:57:37 -0400
Subject: [PATCH] drm/msm: Fix GMEM_BASE on a8xx
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
Message-Id: <20261029-drm-msm-gmem-base-fix-v1-1-347642c5670c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBBFf0XzbGp3k/Ar8rC4mIdBOyUl/27ze
 E6d85AhCYy64qGES0yOPYMvC5q2uK9gmTNTcKH2LrQ8J2U15VWhPEYDL3Iz/Bhc5ZuIuqHcngl
 Z/99+eN8PXlurUmcAAAA=
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
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6bf..aba2f0d6934e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -382,7 +382,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->info->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
+		if (adreno_gpu->info->family >= ADRENO_8XX)
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

