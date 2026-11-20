Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202457;
	b=Ny+zJJ3WL0yHhjmDTG1iM+uzfSFk1kTB3bJrwP4BG7XIu2YrnNg9yuBxOi/WfkIt4LuI
	 0vSfyJA/ryqOyaHgp3WnQN3hMADIu/6BFhJGHxyXd4cOVER6m6l6cosablI5UtzgYewfn
	 1uVKMCZIaKirAN3zNyRqSgeaZVkCSCNslkxtDps+O1MCi4qeWVZpDuM6Q6bQ4BsQe5SOG
	 ddPHS4EUrcixSLDr4Yu7T1LEnhC5OEgumgxK7/IJe+DMPSaCG4dP2VrD5fRPXIBc2ljcr
	 M2wTWGB3NvSMnsT3J9KNySdnGm9VdndYP+xUkHS6baZtZbXuNj7uabqajPfBD8Uf2sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e1XirmZmVETsTLq+R7/7pu1z8pB6tndX7yNuc+ysxdQ=;
	b=X7OUxREyfKfJpdKhjRkn8DEhycJICH8yQiaXtSOJ6TllM+n+6tYg2rURdMgPrLmRKsff
	 zqUYWPj1FicV4zGD+r5cF9S/uwjK8ZJM5Ik2BzKpHjRVV6ubL4vtT3sBGNOJ2p45cks/I
	 2svdlIh4NYJ3PyvuKq+R5fUpoOC9e2g1AMsf7ABbqE8ey9McdwVvaK/oAY33BpBaN8aRg
	 ro9sOBuqsHnEXbzcxq+7gLz/CGTl6SqLhUnhkCl8SbJFCFM09Pm3yflJlBHQ8+s673jJu
	 btxiSQADJTX0bNsXLyAI8VqzIsVMluGbHIbLWfMvMZbjh2Z/N0Is9bsb6rmz/7q+3ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pr59mqeE;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFC0606A6E5
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBFC0606A6E5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pr59mqeE
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55c38cdd5b7so7539101cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202454; x=1795807254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1XirmZmVETsTLq+R7/7pu1z8pB6tndX7yNuc+ysxdQ=;
        b=pr59mqeE0YlzwhE32wy9t26OzQMVMHhXtoO2eb01mlbUwMNfS4YDkLMPq0tVR3sXSe
         Z/KIBGBHNZHlXAGViYzkLe/ZguhEUot3TrSvwzegGXrMYqSFjh5kudpFioyw9bpmb9kW
         Xn+TQmhlac43Dl3JB0G7gCLB9xNLfhvdjdW+FIpP/vn9Br8MwS31j3saxI0V7H1/L30F
         e8hSPmw+9OBMa/gio6EvLeKxzk/5aDdTIrdSVLesdd1NRlpmZ00hc3lmioOQOWNBXMQB
         /0eYHC2g5I04Ml+f25BeGhWfTzv012BGGzcZKZyMy4wdDDgXq2xn5KBQPAXbwvAwoBXv
         ZDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202454; x=1795807254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1XirmZmVETsTLq+R7/7pu1z8pB6tndX7yNuc+ysxdQ=;
        b=sXJEccOj+e46NBkCFeCW48flVG/g28TyG6+waa1SA8I6+GWuPtHS+9fgVKxaNnYgSU
         +TrvDZtVp2cjNAL4tpeB+JaaAOMwxrBBQg91888Sen92/t448w/KeBBOmQNyqkwPosGi
         7h7G9S/BMU9Qnln6xrt9rqVY1dniqmhvJcl3Mk+fkY1kjR2XTSa5enuOStMsj0zu3nrG
         132hTK8mn3Yn7lY7/qYWm3LW/UL7er5YVB2GG+Mx2OIBCd2gUsffUK8ZH6L0U+x6M0QG
         3uwk3cwt/wX1lJCNp0PHANxIq1xPUyqbNCSTUKIKsasFTU8AlZbbeChLsz9VXmrlw34V
         z75A==
X-Forwarded-Encrypted: i=1; AL+hErHnP7zksI9O8eggUoVZ3c5pvXY6VKjKtHXMgkpB6DN1FHDs96vxuRrDR+x6Crb/vXl/uWe4Tv8Dn/U8Bsd8@vger.kernel.org
X-Gm-Message-State: APuU4Z9lsGb6oN/CQVgQ2rRZpTm2dPbnmNPcfivXb7T/AtIxEcgtKJ3I
	8mLgJaVUUocx7vecoh/KyD5dH78HfnRPyarVHjciSHkVS7hWQJ8UnZUG
X-Gm-Gg: AYBFou1QZwXS1dTbR9o1dUsj8mzIEH/LEGpfpWvkuCNNDBkrfMaz0nIHtWlky0b5gTs
	Fl43RTrWEKsPNGE9ZuvSKGRAOzXXcP5gIVrzYH8wgvVV3+QULhLymYFZyhpavF3ciUtRDw9q7WG
	jbu6AdBSOcdj2NWt6v3PFfynPatYfig6LVkoH0fUthKEJxBBTqKctcjTRu8EdkbjEthZJQrQvOA
	FbubvY9aPhbP0upVFPe4p3Pz/rSV5K4+chFK6QaPyHPwLhjP4GllSyvHUysqVDCOD5RNhmpxZbW
	MzSoYeMWoW8NEdLWk9kSgdcb3GMbDwFpKYEJoI8CulMHzBQdeztaxKTu+ZI1msXkW4nMmCsY4W5
	mDAcaEBA+9nYGZcmNdmXobR6tWCfvDn5pGFrVU6UOM7ClCYwObDQFIojGBY+7SZoCxhEqCuMRK2
	oKxiSfIgDD4aAKDcG565udHU+9V2z/OLEe2aI1MrEBh95HZpXjXVBQuZuglp0ZrTaUUadTeRxtZ
	nxjtNtZWrnInD9bvCgXQHY0zRkt4ImKTRO7psEiHDpd3GMJe3n4y8xjbH18yWA51Dv6uQoyuQXh
	AMdzOytH1gYSvUD5eleUfdlPevCdVx0bZbso4E1L9WDL4EwvkwoXd00Wb+iXxS/246SYfh2KnZZ
	SZwBLT7236KryDoN3fAzxRT9telhN1GleGz3b7ndhMvidUKJaIM99Sy45CDLEwJ0T94PlCKgpf6
	cNtVuAQN0ooXqH49+uquN2OxXQwyP+Iuv3NWhbqMshEQ3s+JYQJijlkjOEHAlPsoyYXPGluNiON
	2hGniApmNr/ws5VZYHtrXQ8pFMRJ/m1lGkyVdBoD8NIsQ==
X-Received: by 2002:ac8:5d90:0:b0:55d:32ed:38bb with SMTP id d75a77b69052e-55d76a5af68mr73041501cf.42.1795202453655;
        Fri, 20 Nov 2026 11:20:53 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e2c6sm31475921cf.12.2026.11.20.11.20.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 11:20:53 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jim Martin <jimmartin@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dp: stop the rate-set fallback at the lowest table entry
Date: Fri, 20 Nov 2026 14:20:50 -0500
Message-ID: <20261120192050.73315-3-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120192050.73315-1-jesse.casco@gmail.com>
References: <20261120192050.73315-1-jesse.casco@gmail.com>
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

When the sink is driven through LINK_RATE_SET and rate_set has reached
index 0, msm_dp_ctrl_link_rate_down_shift() falls through to the legacy
switch. If the lowest entry of the sink's SUPPORTED_LINK_RATES table is
one of the standard rates above RBR, the source drops to the next
standard rate while LINK_RATE_SET still selects index 0, so source and
sink train at different rates.

There is nothing lower to try once the table is exhausted, so fail the
down-shift instead.

Fixes: ed100aa239be ("drm/msm/dp: Enable support for eDP v1.4+ link rates table")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c8d097d65..8d7b6da17 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1558,9 +1558,13 @@ static int msm_dp_ctrl_link_rate_down_shift(struct msm_dp_ctrl_private *ctrl)
 	int ret = 0;
 	struct msm_dp_link_info *link_params = &ctrl->link->link_params;
 
-	if (link_params->rate_set) {
-		--link_params->rate_set;
-		link_params->rate = link_params->supported_rates[link_params->rate_set];
+	if (link_params->use_rate_set) {
+		if (link_params->rate_set) {
+			--link_params->rate_set;
+			link_params->rate = link_params->supported_rates[link_params->rate_set];
+		} else {
+			ret = -EINVAL;
+		}
 	} else {
 		switch (link_params->rate) {
 		case 810000:
-- 
2.56.1

