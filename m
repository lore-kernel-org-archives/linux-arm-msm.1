Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB9C3BB699
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834636; cv=none; b=lOwAvv1VgmAS0iOdJzYnTqBA8b0BU+tE8eKEwzhHnP+jdnQDXJOWCtzn+VZPFRLjjhiiLbZeZubjhvGAeLJaZpl/B8OmpGPkN9E9YanvlIVnRiOqzrzQiP7LHF/4CqEhsXOBymBtwTPG+thdz80jjGZDl3v6tVji/6Z/jQWVH+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834636; c=relaxed/simple;
	bh=k/JTkZF0a0smNy/xXdhUk8nFQroFgmrlPE0Qs9N4U1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F6P9fK+ml/5T4PBfn5HOcP41dGzZ9HUc4Fz020yV953BOLsYXV2LkPp5XZ1kFfAckPw/r4FtWGLbWpWqIAW+j1Lv2yjajUbowTgriZSLzMUJuVO3cE72eOESu77+9kSoAqY1kzmadGcNCsIb/qx4znWqXiENNbpRPV48yPtkHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms5ZQbEz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms5ZQbEz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954df200ddso6394205e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784834633; x=1785439433; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mqxcfVrR6DJH7Q8LkKVdFh0w04HNqAky5ozgYuy/EFs=;
        b=ms5ZQbEzAastBErpr5jkKpv5nHh0Erg1bsos5JuaJCXSG57r9WMPlL1qci2ZnjLWLp
         WcaQjIEL2kwWbe+McHhk2pFX9JxzqglCUQGHvpbESdBLhtZLU8OW2ixROpu35yNE977R
         ltmkXKg68PEqzL5K+lXvewGZdzehdNjEXMw/J30T22rrEdy/7QXpmSG58ZffJdxrwwS3
         OlJMiXsXcPXA6+PuEalv8xxzLubUelCIZz5L6SshH7fNgKgoXpEwQsIsNb2YMLI4c1z0
         XB8TxHXPXzNBP+bX18CNPk+yIxh1KhAvDY8NEF+dPY3jE4N3xj5IT0p6Vz9BFrbP/9Tc
         O+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784834633; x=1785439433;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mqxcfVrR6DJH7Q8LkKVdFh0w04HNqAky5ozgYuy/EFs=;
        b=OjVBRWVyXWA9GHqODSAGj+rWOTS7iWdMqiZoZAw43aqgXUmrJMM3vgK847yDNuU+0q
         /hiuNwgLJEuZ5J2w8vg6Ag6+sbQynoColKNd9/ceLHQajJzR0+Pw9ayRwhQO8SynMlCq
         4OYnfxZrH40rRXKVs8M4F5wHGlkGih/tYpydQOoyhRP2BnLB9xYRAibRZXn4lWduzu+X
         VIYBWJrGBfY++FvC0VAe2j8h0N3ybhercL4rXILcCiaDOM8klFNaCihDryVMZPYCUyhC
         ixsmC6Ap/4J8/Mbpjev8ZeEEHtxiWJCha+nzctMp1Eut2dENdpmhTLikJKw/cGoLxf8g
         II2g==
X-Gm-Message-State: AOJu0YxMJixXjESB4wC8yrSJT54HVYdiuGba0y9BKddyIDZvUKMsBgBH
	130OAVN7d2DIn3n8Isa3DLUYxyAsrt8PmbePq4swgs0rE//GHrlQvv0=
X-Gm-Gg: AR+sD11v1O6drhHtyDZa8cFos7CE7f30ovKPBTzLS1jAEGKW1kUqOo5iTb81PKheskb
	t0B+eP5suJaFSCMj1eZlM0xdb2ARAyDp8YjPCnT2lNvb/l/eDpOMNdxK9HQdC+WPpI5N/dEyedU
	jOAZCvpF/A/LSWRhoFHTV4Ul4v76grVCFgj1UVLd3c6sk4H1SHaZoaowm99YWYTKNkbMBGZ2uWa
	SKTdVVlIav2s7ZFXeAu/RT/G8kBM8PtF5Sw2qoCecT5U1uLVjFegTAfFBRJWsuedAb1tKjqPCVO
	cLzH6O5I2u8zUL0UR9jtYk5uxgQ2cyfeRiGoMZYLLeK+XjpjnWTeYNezdqamD7q0Ev5tSNAsLyW
	3GLT7U8zL2opt5rh/io0EkFmpdi6h0bShXahk7FsTMobitAWWf8rBGk1+LfA9BzagNNo08MS1yW
	381TEqgS//64s19PJh+Ks=
X-Received: by 2002:a05:600c:1d29:b0:495:699:84ca with SMTP id 5b1f17b1804b1-49573d142bamr50812275e9.28.1784834632689;
        Thu, 23 Jul 2026 12:23:52 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d4d7sm15416245e9.2.2026.07.23.12.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:23:52 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 23 Jul 2026 21:23:22 +0200
Subject: [PATCH v2] drm/msm: remove objects from evit list after pinning
 them
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-evict_list_fix-v2-1-bd0725e56253@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbQ0dk6KuvIchpLQFxgA1LTYaw
 t2d4trM6v+8/2aF6AK5CNdiheASRfIzBzwUYAY9906Q5QxYoiorPAlmzNKMFJemo7eQVl+wRYW
 V1sCjZ3Bc78J7/cvx1T6cWbIlEwNPffjsH5PM3F95koJPS3su205J0936SdN4NH6Cetu2L7Q/2
 /m+AAAA
X-Change-ID: 20260723-evict_list_fix-1da92b2627aa
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784834631; l=1651;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=k/JTkZF0a0smNy/xXdhUk8nFQroFgmrlPE0Qs9N4U1U=;
 b=TGbF0HVMiylKJpQxVKlBl47m+NOEpqrAnzusIERxCbECnNRC8S4Q/4v14QhTClm/aFf7aK7cf
 DdwDEysRadnDG0LErRTVatQILEmbeO27QwE4jTL27uRG/gVmt1oWTVf
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Once objects are pinned they should not be kept in the evict list as
that will cause drm_gpuvm_validate to keep ieterating a growing list of
objects needlessly.

Once an object is pinned remove it from the list.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v2:
- Added Fixes tag
- Link to v1: https://patch.msgid.link/20260723-evict_list_fix-v1-1-1a1d80bf61cf@gmail.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
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

