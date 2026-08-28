Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9F33403FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 02:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882470; cv=none; b=Ch6RadDTYPtWU0o14MTfRrDhtHPknzk9k70NcG56oiXcalncmKkbmTbBiFf226YRmAnHY3nscb7prDLqFOquACQdlbw1n9EmyhwY3M5r/fEK4UKtXIcSwZbz1+CC2Lp56imncM3wForz1K5zd8JIuphU6p49s/DONSM55+CpJqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882470; c=relaxed/simple;
	bh=ScMUaMd0TbrobyvI6139tHt8pPlNlKUDJn7Hfs6XxQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sgBm3v3g3Tx7s+dIFhi7RvX9ERjcVcBQiFWHhSxU5/zY7jrNa07gZxRgxlQIJUYAEgCrOfLSYrybvK3Tj3I1dnW7AJ1NESHhuM9+vc07ML1z2wP/j9TFLarVNzfaXlysY+p7GLTS0VQqWvbOWSk+NVvVsn6HT31QwsggpWkElf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lue4XX4U; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lue4XX4U"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47fde295992so327923f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 19:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787882467; x=1788487267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KOcOnSph4R/SK6vbv+B+XNx7SuiY0RM+MECJyRf8erk=;
        b=lue4XX4Uwd9cOGuyIqgtgV8c591aLJ5u9me8I+ssjSxU6VyzJhtWAlKgGhPh1KBCWT
         zL2CKUo2aPVq5wzXaq+tJvM5d8pa9e/u2R3iCRmJLi7bjkRrWsSYXUA8f/op0fQ8njsM
         oWobanOGObEhSQ+rkq4TrZrOEFCHUDbxe1+WONb0z1/05e5kkdXMJ1DEkY/cdlVjsHom
         +DKs0xJlXSj54vd/LbFBJe+1vbPQHXitTUmhdn9gfLxaC2L+KanZJ767Fwt/2ra+yi+L
         hvjr69NmJEv+Ao9yECt6ceuiSaEkZFccPfI1jN6wWYcdrTRpxl9ZXPaB/TzSzV7WCebj
         bfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787882467; x=1788487267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOcOnSph4R/SK6vbv+B+XNx7SuiY0RM+MECJyRf8erk=;
        b=VtEqkiA33ki30yC8yFcHWDZwPmWOH3/9u1aNtbB1kH8OY5Fri2lfkkTjD4EFUixDpm
         /NAQnvnhbKr2shsnAsDx7p6a6B7ifjUnk5SNleuCCKSiC8NC0QurBj74qFu9ci/Q//ZW
         HA+PXi6bYZwSh3FYbvdIbUHhuoAVhlv012eFKi0OZq3VixuAbwdaaO2PpH0C6PDUGVFt
         ERD94QBuMqpBmSSsdeDYaJqgvawaF5N/2pm3rWr8Vdm9BfNoGYjCwQMPHXVg18k81ouW
         5XVtLi7wLbW3VOpeK6lfYHgtpIP7k5xeSxA2tRv9KWy6NqWa92ztuqEvOcRmpiwMDObV
         NECw==
X-Forwarded-Encrypted: i=1; AHgh+Rpt+0CI1uHohULKHA04fAUqwi/BbUKh4R3U1BvnkyOMI+gp5W7jWYOV0HZksZ/YrIM46LQwfQzGwUuMVYA7@vger.kernel.org
X-Gm-Message-State: AFuF++k1IhhkKuTVQ4WI1CZLYTtXQzKDJvx9TU4i4hOJqmuZHXJ4TPh/
	VqYb68BYfhvJzbcVrsds7Kht5IOyQqihlq7rd9dK5j18WWGca+JWRbFpNE6JfNsMC9ov0w==
X-Gm-Gg: AR+sD12KCeggzwr4JBzbKNJQ6O6x29mCj2LIXdoQYBmPsYA8I12hmpJjSGgmCqot5Ql
	iquc4CAEluOPS+YFYvVl2/BLL/SN4kMCeGQ+e4zmxxj8NOQrT2DBFxHWp4SeS4CJ3VVDUYjdC+s
	RyaXJIRGYKea7n18EdHdUZkFErukhWSQZnS2pMCRKea39zYv5MWsthZwEyqfYOX2TfHuOC9HT6s
	FLLLma3e4Y2xj0pwvNwHRucwRzd86YdTBWvsGQNoGzZD4DrkTfXlVmgOiKhaltQbCoV+jfq/HUp
	bM++/sU3InmYASg6brV8NDW/T7ws6csduwoyQFlVsEzSeR7hbxiewunEIo2g2WWIw4Vfh1OxW8B
	vL8wYppodcu3x3iFbi2lGVKDHIlE1fm+f4ZYHBVdmKTcuUL2e5h34eS9PlT+BBTuVC0iTkIFLFd
	/2VMeiM+nbZyUfO9tapYAqjjNu6tWYyDHSpQu31T8umH7UPnP95cjYFqO3jw==
X-Received: by 2002:a05:6000:2608:b0:482:b823:cc3a with SMTP id ffacd0b85a97d-482eaba7efamr16934016f8f.12.1787882466615;
        Thu, 27 Aug 2026 19:01:06 -0700 (PDT)
Received: from 192.168.10.52 ([39.41.155.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm362758f8f.20.2026.08.27.19.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 19:01:05 -0700 (PDT)
From: Saim Shujah <saimzst@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Paloma Arellano <quic_parellan@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Saim Shujah <saimzst@gmail.com>
Subject: [PATCH] drm/msm/dpu: clear pending peripheral flush state
Date: Fri, 28 Aug 2026 11:54:40 +0500
Message-ID: <20260828065440.140410-1-saimzst@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dpu_hw_ctl_clear_pending_flush() resets the cached per-block state after a
flush transaction, but misses pending_periph_flush_mask.

The peripheral flush updater accumulates interface bits in this mask. A
later transaction which sets the top-level peripheral flush bit can write
stale interface bits to CTL_PERIPH_FLUSH together with the current state.

Peripheral flush support was added after the helper started clearing every
individual pending flush mask. Clear the peripheral mask together with the
other cached child masks.

Fixes: 64f7b81f0358 ("drm/msm/dpu: add support of new peripheral flush mechanism")
Cc: stable@vger.kernel.org
Signed-off-by: Saim Shujah <saimzst@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 36a497f1d6c1..e8729fe1cfef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -118,6 +118,7 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
 	ctx->pending_intf_flush_mask = 0;
 	ctx->pending_wb_flush_mask = 0;
 	ctx->pending_cwb_flush_mask = 0;
+	ctx->pending_periph_flush_mask = 0;
 	ctx->pending_merge_3d_flush_mask = 0;
 	ctx->pending_dsc_flush_mask = 0;
 	ctx->pending_cdm_flush_mask = 0;
-- 
2.55.0

