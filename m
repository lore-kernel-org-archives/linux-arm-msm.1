Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712745;
	b=x8r8NNosFW79aoOmWKC5Tp9W/z5QGgzUkTNbX0Sr0pJqmiJtuUFZ0bi142pidoAefkW9
	 7oON2x4aXXQD6rJe5tmr3GHjVNBxY++oh0yY1+dhjdSrGq7ihnOVFxVtO4PFiIozGGG5r
	 ibZfDjjpKmQj1iZBjeekGZH4qhd4y113XTMENIpfQBPo8OYqQrdO9oTuc2wA+GC18V+K5
	 U0VcfeKb9OxWaTKaVuR35SeXFr3ICEqhdmoGhCu0bhO9fEdmYMBYjZullHu0FqEtSr8fS
	 iTlidkBk02EdTwCxFvOZ6ti8DxNBjMAHLUieeLr1STrIV7UQGx3Xl129N2qElWneGpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712745;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9APBW+dUs9GpdJy5y/xbzdZ0LWmjpaCtZZOTbtr7bAc=;
	b=X09vyMDTejlhKVJ+juftKz50KRYCfxzwoOyzRsMDOcanNcRVrCViHj30XWk3Lp96Gk9/
	 lNkEzw5gA4CyhLA6tChwz5RAgae3AyYnVgzoAxHsl3E/4zC487Nt5rDsjvwi0Cbj4pL0F
	 HBm274AtUFzjF1uiea7klY9qt/Dx7eAFQy6a2Ptp8acRV5nSYY8JxGdDy8OJ5VVEXn6Fv
	 LHwBS6GMrgYIsuMJ3gB+4tDuK6OOj3dXwiDJaHGKyXbgTi4P4K44j1ciQik5QlPcrXYn0
	 0Asdl5TObVSXhuZIZmNRqntFBjGLsQsqSQ225jJKB29AUXTyr+h+kbJjwU1UwZ8Oxsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOUavIkb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D1606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOUavIkb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96461F000C6;
	Thu, 26 Nov 2026 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712744;
	bh=9APBW+dUs9GpdJy5y/xbzdZ0LWmjpaCtZZOTbtr7bAc=;
	h=From:To:Cc:Subject:Date;
	b=SOUavIkbPGn8sk8JueP/0P4u6P4LteQbEbD89wo7ljIXrwQ6baPnRY7jf36irw6dT
	 gVSysa6Knk3cSSpWCQVoTJ4MtoafYY/LymXf3f3WwS9Co9Mivi0xDBW7Z/ANVytodG
	 vi1mD3Zb29uafIqxVT9+Rxc22gNqZ4h+M963f/NCL9Zs4okfIxbLtJfHvvjkTO4p8s
	 9k7ZcgfupsGErZKzCGAbHwSoXC5VuA0olTXHfYK1s7XUgMtlBU8foUjQimQ6e75rd9
	 FoO/tdEE/GTlU3Ii8rJl7Q8eH7vaHH1XucVa8Sw3thVCPyBSa0cysfd3FF/cqW8ft/
	 2E0muor1ZToZg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: fbdev: Fix the framebuffer pin leak on destroy
Date: Thu, 26 Nov 2026 19:05:33 +0200
Message-ID: <20261126170535.361985-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
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

The fbdev emulation pins the framebuffer buffer object in the KMS address
space on probe, but never unpins it, and the buffer object is freed while
still pinned, which triggers a pin_count warning on unbind of the MSM DRM
device, for instance on removal of a DSI panel driver module.

Vladimir Zapolskiy (2):
  drm/msm: fbdev: Unpin the framebuffer buffer object on destroy
  drm/msm: fbdev: Add the missing VMA reference of the framebuffer

 drivers/gpu/drm/msm/msm_fbdev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.51.0

