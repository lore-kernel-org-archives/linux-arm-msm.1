Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.164.201.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027675;
	b=xY3uUc33VvpfKKxVwb4LJKntwShYRTWBlNlY4VfD7WqInPHrkLgKVAv3i+5+DSq1maEb
	 KOOjTRuuRuUSZJPIv/hy73o5sbWHCmdNVZlk9p0JIRRbVO7ojFT01pGQ5Uh1IJngBSSAC
	 O5tXMG+AZi/dvYMaNG/ZaAQ8Sq6GDAXHdk9/ttJZBKG0o4B4WEyhn36wA6tvULuvgoSJ2
	 h1nDTqSDSs6ugmAKyCLIWDG6DFWfTUcVdKeho3kIq01r20WI/AS/LbGsQCON9pdQtD6Ut
	 8VXcHb8NiOYBZ35RApiB+yRM5hNtLOtpaiHrIh6jaBLjVEGfuyBqzXNNPn0VPHA6/cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027675;
	h=DMARC-Filter:Received:DKIM-Signature:DomainKey-Signature:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=Igr8KPwgdLdnvvnM9g3DoqbOn6kPzCyE1PQJ7U4ulvc=;
	b=ibanzmuKhAMcm98frBNCo+A8hfOhYSGuqAC1ErwRShSt6thKsSEj7f4zH0HRbjHm7Ea2
	 LF/4yMivGnVaX+yLbnadaxtlF4DtBucjzacWJHJeqnMs0LepqYsjavB0U2ge+PsILpfCk
	 Db/JT/x5T37tCrD9Oxz8lCaavPc7ZLT4eoWXnn5nmCIvQQTvfmkV+WP8MASOrp2pyreJl
	 n7pb353T/Mzltq/yjUKZcNdVfGRDMB92ucb7NOg/AkLkyS0sN+ScNNLXYxbwohrCP3U6O
	 43DJj3IPaCp3Mkqza0H1Ryj1k4gLucNy4ZXNEaSu9rG1BAOhaATr1tNwpmW3KEfRiMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tagirov.ch;
	spf=pass smtp.mailfrom=tagirov.ch;
	dkim=pass header.d=tagirov.ch header.i=@tagirov.ch header.a=rsa-sha1 header.s=feb22 header.b=WMiXMh80;
	arc=none smtp.remote-ip=109.164.201.207
Received: from tagirov.ch (207.201.164.109.static.wline.lns.sme.cust.swisscom.ch [109.164.201.207])
	(using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFCD60A2606;
	Wed, 18 Nov 2026 18:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFCD60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tagirov.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tagirov.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tagirov.ch header.i=@tagirov.ch header.a=rsa-sha1 header.s=feb22 header.b=WMiXMh80
Received: from mail.tagirov.ch (localhost [127.0.0.1])
	by mail.tagirov.ch (OpenSMTPD) with ESMTP id fd25c820;
	Wed, 18 Nov 2026 19:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=tagirov.ch; h=date:from:to
	:cc:subject:message-id:mime-version:content-type; s=feb22; bh=1p
	3rdD8qGIQmUkKZDc2yUhLaQV0=; b=WMiXMh80w6UlRDloDoMbWDpn35j+d6qZCT
	CgT+i79JnN+bQN3dVt916syT5YSxCZY0naG4nhh69mbu7h66McFKJWozuM6Nj7a8
	o7jiSbcFWJlqq1Mg7+9O1hRVCc9X6VpRuidVKs3n3yB9YYcHM4BiCUR1kOZdO4K5
	dVX9/jB6Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=tagirov.ch; h=date:from:to
	:cc:subject:message-id:mime-version:content-type; q=dns; s=feb22; b=
	E6Q7wTxLdntM8VE8Rzz/aKmbg+pBYkmcOH6WqxelCUb6iJEx1c1B4nUSne+616YD
	lu7wulQHD6Uf1dRviSx/l8b4LuunlKx9KJjgJKAP3oZ3CGpzK/x1f26G6g4LR+6g
	sXG6JrH4ses1jBDVBsL52eqqrWMn97YbTHj8HsHcXCk=
Received: from localhost (109-203-63-142.dhcp.voenergies.net [109.203.63.142])
	by tagirov.ch (OpenSMTPD) with ESMTPSA id 7d3e5ec1 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256:NO);
	Wed, 18 Nov 2026 19:48:07 +0100 (CET)
Date: Wed, 18 Nov 2026 21:47:42 +0100
From: Erik Tagirov <erik@tagirov.ch>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RFC] drm/msm/dpu: set possible_crtcs on cursor planes
Message-ID: <av4OfY5sML97l2F_@oasis>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I am using a lesser known wayland compositor that uses the possible_crtcs field of a plane to detect
which one to use for the cursor. On the Lenovo T14s two cursor planes are created, each with possible_crtcs set
to 0xff. Which from my understanding means that they can be used with any crtc.

However, the compositor picks the wrong cursor plane which results in a lag of ~17ms
on each DRM_IOCTL_MODE_SETPLANE call. Making the cursor movements sluggish.

After some investigation, I found out that this is due to the legacy_cursor_update flag not being set
in drm_atomic_helper_update_plane() which has an impact in msm_atomic_commit_tail() where the fallback branch
is taken.

The lag is solved with the patch below.

Best regards
- Erik Tagirov

The cursor plane must be used with the correct crtc to ensure an
asynchronous commit
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..4e0e9c2d8062 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -877,6 +877,9 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
+		/* Ensure that cursor planes are commited asynchronously */
+		if (cursor_planes[i])
+			cursor_planes[i]->possible_crtcs = drm_crtc_mask(crtc);
 	}
 
 	/* All CRTCs are compatible with all encoders */
-- 
2.49.0

