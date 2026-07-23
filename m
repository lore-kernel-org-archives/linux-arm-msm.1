Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3854908B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784833236; cv=none; b=NXZoT6fiMm3xQCKhHNcKbDBavd2adZ+iAyTBo2wOZ/4DhVS+1j1HclBj57vijmaRyq8IBZOmjD0mgMmk8oOeumoTQThdpK+j/65rraGDesCoZ9cxOzGpqnGw9wD0hPsuMQ3Jg19J7dkCTr6J+IVi1FmJ8e3fd0IR5NB5sgdNiQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784833236; c=relaxed/simple;
	bh=bx+yq3b6NMB0dC2HA27s9YD6S5hAkMNki5KybhjC2XE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XjC8xUfRn6NOp6EYTK5IRPR85JnG74VJXXrlmPHf8qaHlhTUhzpDMYCyOl/+/RTfx1FvrXWuztEO2ym3jH1ztwN058pTFoMiIskTNmGWYww5TvbNZVDe7ec++yNKh1zI1yn60zFIZTYcxSZIgiWrJUrBcsOX5dBYHgQXu6kMBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkfFuwu4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkfFuwu4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4798bea72f9so670961f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784833230; x=1785438030; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HPfC1v/GC3kC9s7ibLpR2V6inqtkWGfr1/MYygbgWAs=;
        b=lkfFuwu4E0L2SibyuZKjrcCS82KSoJowg7embwRnKvI/J93i7q60y5OYtZ4+KXpIFM
         8dUsA5UzToWXbTV+GpAuf1oxT48CGl0z5Psh2kvyntaEHlSY79Jh2gitcvFNEl6eXp1l
         fTAImrvbrYUI8J6+tgBobNRTr/2jRkyAMF92B5rQtS2ISpe7lKV32VShT+4F+0BV33bZ
         xEi+v3iUy7kBpEmIaW9B5krsm+fhTbW6hVt8PSQVV/P2k9dBu/JVNL1uDIfwqXc9EgBu
         95Xv8eNI/co8SugobcJBDZ6Uwd2lYkk5ox3y672GD89daBDNDriQPTtfN+dqqNPZR/j+
         vf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784833230; x=1785438030;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HPfC1v/GC3kC9s7ibLpR2V6inqtkWGfr1/MYygbgWAs=;
        b=WxtmlFeorla8J9sm/2Ak9i5rv1OoyZOZrcOPFulCDI1U41GZodAdQDvl/6Qrk9s7Or
         1rX4/xcAxM+xrf2o0gsjla2+rGlcaX9WV1fnAhN4+2HFrwzAqPpHlv+zOG+hE+qpE/6r
         jkwLbgf8m6OsRwyG9CxqASOTB3Kl+SK5lZMnlaRAm3npVPVzgX4a1aHLosXuvoGVt/Aw
         FdrAsVu1KWsB2kazWhkCCFdOqQmKgRXJrQQWm0tNecb0dDM9M4it90zLOh5UKLcx+fzE
         syl9ykI+1OzMncnsTm7WwRmjhvIUB81akaaz5KI0OtPFjX2CtxN4yrlkLjzrR9icFIxC
         7yWg==
X-Gm-Message-State: AOJu0YwNVJAUAmMB8ILgWMDEpSAWuaUv7buqKH7NuzoA1nInBv4Od79E
	96IKeIBNdWp07FfR4j/rR4VPKXiSwI1lm6vcE3d/HhjOTZuiZSDVPW8=
X-Gm-Gg: AR+sD128ta3BdQaqJR/qvQ65NwvdrpdohdNEkH6D9SfL3Yzs1XdbbZuRsZBTR4QD0pj
	7J/HrTWXsGNV134Wg+IKYEfhex6TSeyi/6zsQcw7mry4n/uK913gb6yEES6ZzXtK8s7rkpqcR16
	Ecs2+k1uC36KNTGODuG9o8b7brx8xil/rJoRQj57GaB8ruGW3XKClwCDIvluzleXxIrV9Do4wTh
	S8bVO7m7IVtyp9RCFVtk7pc/zZyJJtlrbIvX4OorYXpUK41lZ9L/JmkcJhnPlmCElA9DBLaTlhI
	DQdHFeoypQ9PxunQ6xKbeYVphOqs604/rSVDp5YywkamDuCbcsBOrDWlfdX9sDpMaZZXzze9VQl
	gCGE4t/FPm9rT03OFihnS/Nix6pJb9VDtPRhnDL1GrwnbHk8uqxJAqcm7+L92K+WDZZmAoY6xjL
	iKADTWTEEG1ItAn0WMb5w=
X-Received: by 2002:a5d:5d0f:0:b0:47f:85d6:9e7f with SMTP id ffacd0b85a97d-47f8da5c8f5mr5401418f8f.3.1784833229762;
        Thu, 23 Jul 2026 12:00:29 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm17008552f8f.10.2026.07.23.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:00:29 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 23 Jul 2026 20:59:25 +0200
Subject: [PATCH] drm/msm: remove objects from evit list after pinning them
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-evict_list_fix-v1-1-1a1d80bf61cf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNjXaCa5JL4nMzikvi0zApdw5RES6MkIzMj88REJaCmgqJUoDDYwOh
 YCL+4NCkrNbkEZIpSbS0AEztju3IAAAA=
X-Change-ID: 20260723-evict_list_fix-1da92b2627aa
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784833228; l=937;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=bx+yq3b6NMB0dC2HA27s9YD6S5hAkMNki5KybhjC2XE=;
 b=Sf0f2MSJU/GLwQvFR0Js5/lGuEXjpQ/cB+5Q5vAvT/u4tsJerowqKCiNzbY+v1LFc8hMeXWyH
 eJl+GGpOgP2DhLd2P54gUt50xzWINULiQgLK8Rh3f8raD6Wgylvd55t
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Once objects are pinned they should not be kept in the evict list as
that will cause drm_gpuvm_validate to keep ieterating a growing list of
objects needlessly.

Once an object is pinned remove it from the list.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 1a952b171ed7..4422677f095c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -458,6 +458,8 @@ msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 			return ret;
 	}
 
+	drm_gpuvm_bo_evict(vm_bo, false);
+
 	return 0;
 }
 

---
base-commit: 9a967125427e03c7ebc24d7ad26e9307e8403d4e
change-id: 20260723-evict_list_fix-1da92b2627aa

Best regards,
--  
Anna Maniscalco <anna.maniscalco2000@gmail.com>

