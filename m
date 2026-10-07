Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384449B5DD
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 12:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376804; cv=none; b=oVCx2s/f5IGvVIUURovTRHpXDjvje/z/yqG3py/N/vRWAog1GftXE4Zqd2aBuRSu1ojvE4r09uunglJ1UfX8g2yVw/voHw+AtnKtJVSZpUhVaAnOYMgmlXLTQYc2pTU9b8uJ2S9sVieLTGCMULK0QvUoSrAhHIQczNIpOv7kxT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376804; c=relaxed/simple;
	bh=f1QPQMmCEelKhv5EyxV/k3MVaSi11TvWPJBnLsxaEKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HWXgjMoxIGC6EhgxiX9Oz06S7HOmt06Xzv3VNqld+jxubnIIfFAjXYfAHdEKsPxD2ALlXXAL5HQviXPFM15ZpidjqHJeLfhzzJgCMpVGpCw5pf7dIhAVc0UZ8uUI3UOnPVedafygy95GDVj4EyDuTKFHgLlQzwOfPy2ZR7Kj0CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiUCCY9G; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiUCCY9G"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso767159a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376794; x=1791981594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stbPCEVKk5/43mdbhizGdpTlS+biXo1nBfE8ir7ZWR8=;
        b=EiUCCY9Gp8O8xmWkPfUNRbNOaTl9mUK3y7cZSARDKU9wkmOsL7npc81T849XBC/qyR
         R7s4re/SufA3OWTDWLqYzGMRcem9NDyc5yuXmXPEuIvFZlJwx6VitEVyM4VJf16XTTFs
         g5lygdZhiyBX1H5G6mRPcuGrIaTxgZuEyaS7FRLo7bM2+gk3LIg/e3e0SLDXtU+qOBGY
         7qYi1nD9r8j8FLyruflv1Oa8C1DZaY80er6nA6LzswCOAUCjFILc59oLhKxBrOSrFr//
         RbZjGhnnjghIQtu3YuFHbuppbMHIZonrhhDu5xENXhMjtPtN7Tne+uFX8PA/VpA9SzLd
         GMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376794; x=1791981594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stbPCEVKk5/43mdbhizGdpTlS+biXo1nBfE8ir7ZWR8=;
        b=t997bx2Tqcr2WmyQ0hRS5W9kF3QjJvOJFgpBSBFSE8IQ0P+O04KPb8vdVscuvVYZYg
         mNehZ91Qh7EZxY6AFoxZ9pD4agTxs/6FPv5CcAbq2xD610LMOhVzMzvE2+u3dhA6dRpb
         50M6jCub04MY2SPc8Cq1Su0Y7wNszyhe9wnooL2LXICZtrbywYoEKih8byiLkEl6nADQ
         j1EILah1xDeT27TchPNIGTKjXMKkkYYypr+vr8vMzEzS0C19UDxsze7Xt/pmrXpwKn5z
         mv8b7QPbeQPksrf3oXhKL97V4z3M26vhuCxqgdaNI/wM0YCAk/waK7cqHMaPxJ5i7SAg
         yecw==
X-Forwarded-Encrypted: i=1; AKwUvBwwEAm5FgphlKu98w8ivbp9JeP2ggUdsu1R3PuHDCBdX28Inm1LVvkfC64j4+JoD6epPjI/HHbatn0i6izz@vger.kernel.org
X-Gm-Message-State: AFq9FYKnnCy3KjV0/vQNl1WCievPH2KCX8uQh2wwYiM30K+bT/vjfeqI
	dT3IwjmopJvDgRCCwhF74M0ESWM5kxyL2wMPnX6FaJswoOwV8+lGFpRQ
X-Gm-Gg: AYBFou0F8PdyOU9mEyDmRWTfIt0MVfiUUaOxxbOlxGJ/szLQw3TuF6OkCY1hj+JaZkK
	J70G47MFFB9hlKpVpg1Qfd2e7nHVtW0ydhGIYV/CDbGsk8hL7UgXFnfLjul7k8bCuyl2ovtqc/g
	d2jPIVlGHc69Dqhx0yxJWsG3c9r/H+Q4MQ8Txd/a3EDSldd7WEhuII7d1NN71KSkHv2F/+uP+0l
	88FbNd278VTcjyrIPM4WI5r8sl5NdiYX/kBFn7q3Opmm5C3wK1q+yrt/vQPbyq7P/8Mb1KsFeqj
	QoPb6EtLvqxBaEkhzO/yNFiAynNc677XKJ4abpF37XMEERVeFR/qcB4/TzsTfyyC6za/0tUO/1e
	oJ5ubN9Vdqwx+hJFRNbgnP84Ghd8j/Lk7afTYwL3h0F1xVQ2inTnCasgCD3WusKzssQHA5HEstN
	qvbUua5BVtu1mEBVV0CxXkHLZJHdXvdr+OSatqyE+mb4zxIjNyk/7XbyqKgeJKMYXzFQSbdRNAB
	dZrFwbFdkedgvQ=
X-Received: by 2002:a17:90a:da84:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3a8a1c84418mr1597807a91.63.1791376793729;
        Wed, 07 Oct 2026 05:39:53 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8c46a2f9bsm650899a91.2.2026.10.07.05.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:39:53 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	yongxing.mou@oss.qualcomm.com,
	yuanjie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: add the SSPP rec0/rec1 blocks to the snapshot
Date: Wed,  7 Oct 2026 21:39:45 +0900
Message-ID: <20261007123945.1694-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On DPU 13 the SSPP block is only 0x84 long and the fetch registers
(source address, size, format, multirect) live in the rec0/rec1
sub-blocks at 0x1000 and 0x3000. The snapshot dumps the SSPP block and
its scaler and CSC sub-blocks, but not rec0/rec1, so the plane fetch
state is missing from the devcoredump and from debugfs dri/N/kms.

Add the rec0/rec1 sub-blocks to the snapshot.

Tested on a Lenovo Legion Tab Y700 gen 5 (SM8850).

Fixes: 688c7734002a ("drm/msm/dpu: Add Kaanapali SSPP sub-block support")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..dba8a07d34bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1006,6 +1006,20 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 						    base + cat->sspp[i].sblk->csc_blk.base,
 						    "%s_%s", cat->sspp[i].name,
 						    cat->sspp[i].sblk->csc_blk.name);
+
+		if (cat->sspp[i].sblk && cat->sspp[i].sblk->sspp_rec0_blk.len > 0)
+			msm_disp_snapshot_add_block(disp_state,
+						    cat->sspp[i].sblk->sspp_rec0_blk.len,
+						    base + cat->sspp[i].sblk->sspp_rec0_blk.base,
+						    "%s_%s", cat->sspp[i].name,
+						    cat->sspp[i].sblk->sspp_rec0_blk.name);
+
+		if (cat->sspp[i].sblk && cat->sspp[i].sblk->sspp_rec1_blk.len > 0)
+			msm_disp_snapshot_add_block(disp_state,
+						    cat->sspp[i].sblk->sspp_rec1_blk.len,
+						    base + cat->sspp[i].sblk->sspp_rec1_blk.base,
+						    "%s_%s", cat->sspp[i].name,
+						    cat->sspp[i].sblk->sspp_rec1_blk.name);
 	}
 
 	/* dump LM sub-blocks HW regs info */

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

