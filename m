Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177742;
	b=COFLJr5b4+myMavfMZUcOyP2uj+lew52Dt+rY0ATm0VUMd1hAh+rO1aIdAV69WNIyTG/
	 79ScxDWuU9BT6qciYoSeCGktGJfgARDPoEsin+JxXjC08p9Fx3ri9CmSWSjVdMiSD+G9+
	 2za6+JMPSUPfQj53dyjplyZWqx0St8zTuoeiGufAo7BOUAvCPkKO1mWy0znsMULO5BAkB
	 cCQVVf+Q3M6nLPgTEmnOL0mFnLys8Pm4LsqZkRsdKWgnmNCPT+AHJM9hT9YOHUGH/nJC0
	 gwmB1FZEePzGoOTafqKNGgXGSGzwysQWS64avdI5krClBLY9RlC8+92GUezD0+EKK8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lbe9BNDMr49UztD1Swhygj7sG/vajGHKtETS4f+BRsc=;
	b=EI4J1ejLVvmnB+TqTKTdVEBmtgrRojNrSrokYMayEPLgR2mpp/V64hqTFbLtBsoqZ1wf
	 0/5B+Ar7NAgdL/l0MU17+KQ7EoEfh0DG+w0vaQasqosz7ztinoZAoQ2zXxQDoAqOvG78J
	 Kp2Mpi+EW9daCc9KHKa4PzkYsPGRPwmHj8FbMkF4yVvRA3nQAYZJjhNnZD5VXYI3pLjci
	 Fs9PBb2j/xp/LSb4urWuJBT0bQh+j2PrW+Th2tqhQ5m+2DT+NoQoEXyohWLDvdE1Ai9Ov
	 j+eAZQRM275YcAYKUzD3MgQHnQLRsowVpjgETTw3/HhGziM5KnjVllJ2a07RFfOknog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xJT1q/n9";
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E0606A322
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 22:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 221E0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJT1q/n9
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4adaa0f72abso288037fac.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 14:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177741; x=1794782541; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lbe9BNDMr49UztD1Swhygj7sG/vajGHKtETS4f+BRsc=;
        b=xJT1q/n9GOguRU28bqvGuRagX2zSp26ZTA51clxFlNZK2ZPQwAqkPBuNiiZer5WA+M
         Updkfe1W5t6vuT3k+dnzacyHK1cJ2LP5H+0/fUOdwpeRs4WGo2p8PpmjPVd7/3FIVPXN
         vPET8tp1/BrLYN7pEhlEXIbxKnmCGoCXQG2nxDmIGrDtTu33h3HXdqsDrtJQQlPkywBI
         vD2UVuW98P/NNZG1qoksgn7M+kLLXxVqQx8ZWKyTYkKewfa28vQxqmHKM7+xr+QKqEdd
         Xzn8S2kQiIonEejA8cKwCe3z4/bD0a9vu/m9jSsdJMd13aujGPBnLrRawAsP/y1pflNm
         h5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177741; x=1794782541;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lbe9BNDMr49UztD1Swhygj7sG/vajGHKtETS4f+BRsc=;
        b=Tj/MZoQmYYSp1oMNvK8Ju2JCdlzYEluat8oMLisXHlJDw8zHyXB5lzxT+PGMZZIhDL
         dNG47vptO18IA11ee/UUIzOTodkfPR3Jlj6pEYM5ajfB8PLIRayRMeIZHqaOPhbZ7rRF
         0+EdrHEVoA2sgyoGvz0lkmfMdMqe6hL3HFFvNqsjzU7aC0axUVnUvEFBnPBoajMXAd6w
         L3ekOWwtHzyjTfUgJbdEGMN3B116EKfeuTWWLgxrZI4HowH4oagKeUK1DVmo3cVFfYod
         JoPsOxfKrHJ2PvlZS3KB+lzLQidDREMTqMg1hEQd7598UcVMwNQMdsOR0SHKEy5pbsd/
         qgjQ==
X-Forwarded-Encrypted: i=1; AL+hErFeStK5pVZvIn+vEMVHUw6ogGBAYcg6eKLbrP3kTt/zOxT7j/RxVRqJb3Hahd52QjNMotmLyTaHUUUQDWdj@vger.kernel.org
X-Gm-Message-State: APuU4Z/K0k+seIFQfn8Sed3SVPzTkT/L1nZ/GBPmCAFL73lxLgrRFxgx
	aPOsQnOX9yWQPPk5cphg92H3ZeucE8jAoD4kRvme2cR9L3Jo5QQsS/Uca2SJWw==
X-Gm-Gg: AYBFou1/9N8viuBBe9NBmAsc5/sLGF46cPh7H5AAViuZOAPYMS3eiWts/I7IJYAd035
	IJ+YMUE6xIZvBG8xlV0ayLWddZbnS6D9GTWSd2VgrIZrI5zy1ksHOisG6Bq75B5k+Fitahe+ker
	HempMMopruEuOQATCVmluPFo/G6O9SfLycprh3t9GfNVJikRfr+kR6j3L0Wb6uyfy2gTsXWrEqJ
	xo8R0rhYG/LsvBMyxrNVcN+M02jDOWfUlYWrTP2J+MRv5cMgE7kS7XnNijIea7JoCVImXQ72eUJ
	H/9f1KEaeYcQldGmEBfQ347SbZgFvMvFll2iI4J8+FcD2yR67KkhFPt37Tz+hVmAy8CpiXJ3D3c
	fSMK7wTH3BNJkofBGH220OguL139YOESzT5zI36iaBUJITbNsYNRcXQ6ZXuY4gxJCjK5mmHjyt8
	V2ze5zjPjXTm7wcOFSOsucGhSY77rnDgQssHwUFv6jyDjkHdLfhwxc9sON/R/V2cj9UUO6r+HU8
	7gE5qvR8CUXqusXqfofoDGx5Xbm6i9Jyrs+f5eUsH+QPSpU2EHpuQAkX0uzu6O45FE5cJbrcUxv
	mj1jYPZ4yrSyoLBROUKfqjvBcwitVVM2epYlYq7CrsiabJsDSulDUJJ0XUrdSCIxnxY2EvRagBB
	6NxBznKodTLbL969KiIzZjcZt6dsoopMFYvXne/Pid4V9vsHU4DoTkbjJTfPkXgmRl2sj3dtiOA
	+GSCMYo+J3cbWxk/CWlhcOt6OGRB0UxB3MigO6HJy4+MQ8e4VrFutCzA==
X-Received: by 2002:a05:6808:50a1:b0:55b:f88d:6e84 with SMTP id 5614622812f47-567fd57f184mr2789475b6e.37.1794177741024;
        Sun, 08 Nov 2026 14:42:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/4] mtd: rawnand: qcom: unwind failed child
 initialization
Date: Sun, 08 Nov 2026 15:42:07 -0700
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OPQ7CMAxGr4IyY0haSikT90AMaeJSI5qAE6oi1
 LuTgNiRvDz/PH8vEZAJg9gvXoJxpEDeJSiWC2F67c4IZBOLQhZbpWQN4dEOFOFu/ABOOwump6u
 FG/sWAZk9BxgVdBUWtSy1qnUlkuzG2NH0eXQ8fTmZLmhitueNVgeElrUzfW4N0a6zf+1winneU
 4ien5+ko8qeX6jdv6FSSahk05VSN6g29nAeNF1X6Uyc5nl+AwsHQcIOAQAA
X-Change-ID: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

Keep the shared BAM transaction usable when resizing it fails, validate
the boot-partition layout before publishing a chip, and propagate child
probe failures after unregistering any previously published chips.

The first three patches fix layout validation, allocation failure and
controller-wide probe unwind. The fourth scans every chip before
publishing any MTD devices, so initialization cannot race with I/O
on an earlier chip using the shared controller state.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Add a patch separating initialization of all chips from MTD
  registration, addressing the concurrent BAM replacement report.
- Track which scanned chips are registered for probe-error cleanup.
- Link to v1: https://patch.msgid.link/20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com

To: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Christian Marangi <ansuelsmth@gmail.com>
To: Sricharan R <quic_srichara@quicinc.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (4):
      mtd: rawnand: qcom: parse boot partitions before registering MTD
      mtd: rawnand: qcom: retain the BAM transaction if replacement fails
      mtd: rawnand: qcom: unwind registered chips on child probe failure
      mtd: rawnand: qcom: scan all chips before registering MTD devices

 drivers/mtd/nand/raw/qcom_nandc.c | 72 ++++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 28 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

