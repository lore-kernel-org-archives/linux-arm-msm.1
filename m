Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569929;
	b=yG/y9MXkrAloLUqeA479/vyN+m4blk7k/vHC4fLWO4grpOpT4KkIbe5ppfwDPslB2VXe
	 /NFaF8AR9XhDZBH9DPGUYeVk/biEj4U9B02Ip/PdSF2lANqBvHK/crVmYtwIk9JfcmjdD
	 nfbIbrMw8oPt08aiaeJwipFz+yph4p2nwfvdRZt45oGAyjOG9x7uuDMJH8++vCgOw2iC4
	 kRwLeTQnSPWPEd9blLTXKb3J++hsAvixQfhwu09rt8QC2voJwsTWek7IcPCTQaZYJ2g8I
	 OryIUdqOlRLTamkyGgX/s+hzTpHTsTbN2IcXeg649Rg8eIRoCWT+oYThAi1r+l3eCDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ucrcGnxXyuYhogAmjNJch54rUpgpdnz/8hQqaKskjsk=;
	b=EAiP1xilb6hOpSPlYtQgqXhFnmflF3AqWYFoTmGnlnCn9ij4aUXcOXQXFKJwfL2zLj/j
	 zbZpYCUW95E+j+290xBkpKviyrxPuuZfBcgKkoAUoBApeoO9aJFCAbk7sqs0G8KWOWgdd
	 Khd+7a/swdS5pLb0Wsk7fEPkh1awXVJdbiKnGLoAfRG8WyBiuHDtCwWNhWijAt50zX0Za
	 Mq/cQpylOq9nYrNR/ldI1q8pOL0XgygRuoAh07Gl64V78aDJBWNQJT4/Y31sxpDmt0CDo
	 Hgiv+8+/Is0dHaIyNgQqZCOxVR75tbWW7iCoe8GYwlebSLJ/oloWwr+Qn8rLziMHm/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jwG847XJ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999A5606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 999A5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jwG847XJ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso2025455e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569927; x=1793174727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucrcGnxXyuYhogAmjNJch54rUpgpdnz/8hQqaKskjsk=;
        b=jwG847XJhJbV9MnwCiFohonUbKnj6JWHGBY63H4xDYKx9C8HSElWVEdTmW0dTxn5qB
         sg+ehAJ1WM3rvjLZsCQAyeWcyIn+yGDKvq915orp0dRrGGSNEMqdlaUHwuIrPYs9YmT6
         uinEITawyfHiGrsnhbTCBBwIZtLGAoDcVMadKyOc7LT0ycdfZZusmUyj53GLqnRHFaB2
         4H6I+ZKSN4c7bynljJJHON45X1/mIBtXjHBmBFiE8aDfiJBB71OufeK4MVFGiyH6LSDR
         PfXTgcOPZbpUcUyuE5ma1VNoCVyh6XnM+A7hD72MD0yxKr+OjxIxyJnZyh4dPNpuluyB
         1HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569927; x=1793174727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucrcGnxXyuYhogAmjNJch54rUpgpdnz/8hQqaKskjsk=;
        b=jAqj2zjA6fJIGcq1/+AurftJSKoCjTw2gLOnOSZEIvTxIdZe2kH4pffBdHNncW0KFV
         rFElBmoNgyh8WWcLPa0UMJKGaNnWmwWbIsaAm14pIHD6bNmVwlUB+VvIumYDIe2Lm0KV
         3aJq38Fvx3fkvVsWUkZh9DZZNk790MJBlC51P+yMpgvTgz99LEr7R5tlzJdhdMpo6rFc
         /WjdknrX2psdeNWudNo47roU/wMNhH3wg86gKpHLg81atH1FFrGbTAMCcNjbDNKHYZcb
         9RLWAd54Au/RrZ54CF2aF9xJ5LB/mGwFJUD3GpNttWLzoOrw/KvHWmG/8wcIUt3Q3oi2
         eeFw==
X-Forwarded-Encrypted: i=1; AKwUvByhBUlXcLy6+qWS1aGh8EenenEPrV9yENhHRmR+82fGHK7SDVsKnEJD5FCKkC/l1o6r4hw83IKR3Ahgg4bP@vger.kernel.org
X-Gm-Message-State: AFq9FYKUrCRU5T+I+hCCpkT1u80/t9SV78mBpUEBDG0etNhST7ataCiJ
	cNe2DvdZtn0kQO62SNpXjg+1Tn1uBaz9MLTr7eQiM9ylHrWpQovVbD/E
X-Gm-Gg: AYBFou0mhnJT2SXROJsGcUynjxXwyTjfco+xDYRvbxWNQOcQ9at2/xTgK20TEkfvR5F
	o/HfatQ2fcu/TyNTeeCaRxtc3esvtGvEoSIxtDE954qHpq6hv7pptzeGF2LNTC87skp6Itdnd1C
	EphSG071MF/d/3ppzuuT86TOYil6aN7gzJCim66TtbZRp+lo5Kyiw3I61IaOrzgidoXHXnZliFQ
	VvbzZ+cutLsYIwcc6QJA4rvLePGOl8uFSRTPQCI9f9ztcGwrVyJx9tS5k+NWRuJ51BaGeAc3OoP
	kl/8Wb7y/NtmXODfUQlXe1+NwAxHIQTG5OeR1hzyB4YnshrEwLIc9Emuv9R2WraMtOobyGrfFx1
	DhSBUgwQdJkuL76HJQz6073WGLudeDL0OFO6thMJEASHLta2v5Fu2/y9zHQStd7004A7MKZGscr
	ZlPcsWGTE9HTNETk0KuZ5IDYjNeJEbuFctEI4hMT6A/aE9KLa1dwdgnodOKg69GvgXYc1TwdiUy
	Qm8WG4jLIESagd4v5LeHUyCxmeXcG0aReTj7hg8VbFTA5nG7s7E2ECtWAZ+ugTRew==
X-Received: by 2002:a05:600c:c4a7:b0:4a1:d41a:afc2 with SMTP id 5b1f17b1804b1-4a1fd8cb7aemr24443845e9.3.1792569926424;
        Wed, 21 Oct 2026 01:05:26 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.12])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1066cfsm38928165e9.1.2026.10.21.01.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:05:26 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] pmdomain: qcom: rpmhpd: don't clamp gfx and gmxc before sync_state
Date: Wed, 21 Oct 2026 10:05:17 +0200
Message-ID: <20261021080517.2161-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Until rpmhpd's sync_state every vote is clamped to the highest corner,
so that hardware the bootloader left running keeps the rail level it
needs until its driver takes over.  Nothing the bootloader leaves behind
runs on the GPU rails, but the clamp hits them anyway: the GPU clock
controller's probe runtime-resumes and suspends its GFX and GMXC
domains, and from then on both rails are pinned at their highest corner
until sync_state.

On Glymur gfx.lvl has 14 levels and the clamp holds the rail at the top
one, 0x1d0, while the GMU's own performance table ends at level 11,
0x1c4.  With the GPU driver and firmware built in, the GMU boots long
before sync_state, and its CLX DCVS calibration does not survive a gfx
rail held that high: the firmware gives up with HFI_F2H_MSG_ERROR
0x007306c7 (ResMgrCalibrateDcvsLvl), the first HFI_H2F_MSG_GX_BW_PERF_VOTE
times out and the first GPU init fails.  On the Lenovo Yoga Slim 7x
Gen 11 this means the compositor cannot start at first login.  Pinning
gfx at level 11 or 12 instead fails the same way, level 10 and below
boot fine, and pinning gmxc alone has no effect.

Leave gfx and gmxc out of the clamp: they have no bootloader-configured
consumer to protect, and the GMU votes them through its own RSC.

Fixes: 93b6c8d10fad ("drm/msm/a8xx: Enable CLX feature on Adreno X2-85")
Link: https://lore.kernel.org/r/179248663855.32151.9955864156939592299@gmail.com
Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index fa8fed5bd3e5..2c9d4beeffbe 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1006,7 +1006,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
 	unsigned int peer_active_corner = 0, peer_sleep_corner = 0;
 	unsigned int peer_enabled_corner;
 
-	if (pd->state_synced) {
+	if (pd->state_synced || pd == &gfx || pd == &gmxc) {
 		to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corner);
 	} else {
 		/* Clamp to highest corner if sync_state hasn't happened */

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.55.0

