Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177745;
	b=NN2e2bjpPK/CbUsps7eYijDrivBvWscrl1nZZETyqnFHBajh8TH72FotOeQz/5cYL5dH
	 hIUykxm4jHxYyiwQbXpamPG9kxXdnsmTKd0AAyv/a85xzRR3kWXA1SifSAxJeOWNG2bWy
	 qVkX2l+j6o1soGxrY9KHuldBnH0ObAUydXq6oAT6njkjuqH/ZbUleyVJ8rAQOrF7n/Dpq
	 cke4ZbPgpqQNVloODtUQ7F2CYg1L+f6MV+IbhZ5mJlGBdVpMqGVxShY2pTyD+FoBx3fJz
	 Po5T04Xb4VBQtm5oOJvXkhFYCc09/FnmUzBOhFwqJZ0q/XSq5oAPjQ2RXtdpt+Ih5ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
	b=G62tZ0VW1pjATOLdZFHEXfqOUi8hK0uU3ky1TsAAnh9wPaBjb60ggckBsfCeVAzwQcPm
	 o3T6DdQSxx1tSu69KQ/4+e13pag7zZ3Coy/3WOp4UD7OJuuF+4e1E2WpVnLp3GWOhAxh7
	 qRDaozFSjZVjejzkE3il8EKCXLQDCe6plbzS/cH/Xt8Bhko6Aa1TTZdHG2XZdxWfBs0W9
	 62YNSJbrIuqX/q/2NXdjagBcDnX710XbjxbQdRms8uJAncAcvdQwChL6i+nO6ETC403l7
	 JNZw8vMaeTLu7juS6yg5GksncnkI729rME4UxPSaIHRPwomefcMQuRR0UXCNVomPJbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8OzPKdN;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01FB606D802
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 22:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A01FB606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8OzPKdN
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4d198f1a591so139646b6e.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 14:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177743; x=1794782543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=q8OzPKdNmdLYRq1zgFWwV/LaYGoCt86qNEDdrNZOhWW/F71jWsFH4YfWBtwve9rPVL
         6xEt0+knLMvyZe+34OrbRH64DftnHEmGQlv7xrReMfweNCdOH54J7L5M6b9u+cAjJjuT
         Tr+VEkJ30s6z7DAgwucuydppZG+yuvBFH4knG+BMrEQ3mlME3nnwMhn3P59efq+KY4ZY
         opSeJD2L/xjG8QWI93uib4QmDWXswlYuCmyzcEuZsmhW5l/drE4BbQWnDwiwe8HwC+R/
         eFYsbTCXoojKiZGhNHAf/iYYKVvCZF4M3L32O+7QBlFXFyLdZvX33lGqt2u7fQo8lxAV
         rNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177743; x=1794782543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=j6kYk4L8TYZWftAA/Zew60bNW30tN1uiaxFExXGiFDubTbA/ldq3HJOM3/G4CC9ZO1
         1ZofIF950IJNLUsbV5QW/wD+tWD033bj8D4DLJEMmfPZj4HGIx71R0W1BsNbzqYgKCRJ
         qwhb1NBR8jrnUUQRwe2/TaPiLSC4017veSRz7ck7zT393wC64xjTHdhtFSqaqJRzLmeb
         0UFaYyDbAq+xj4fInhMzwK7NDvs7ljDHlwJdWCbK1qv6tXTyruSoRZoMJQg5aNXDBWXo
         U6vgaX/0svTtY3ZhV0wp6WU8C+IxDtBeFwPZnN2G5g30b3Ky54N/rR7BW/j3b0OrZws6
         hOkA==
X-Forwarded-Encrypted: i=1; AL+hErGp+k0Udkv+qmUPYBqHgV+otOlsurAJQ3i2Oguj2b0Zwt5LXCPaYXrJjMESji7Fifi02ij8VgqpdsQQbx/o@vger.kernel.org
X-Gm-Message-State: APuU4Z+fZMZ/yDgJZ0Tzwnc9mlmzTFcTcAb7jcYvePutj6jZMcVsd/G+
	FrFCuACrZxaLR6PpGb2hT/MQRwnyNrg2GkSOtONlam/AukyTxpUQPUNA
X-Gm-Gg: AYBFou2uHCVWg/td/ucPax9Iy40DYgh4UX6Kaez9wA78Vg/ZofSdrIZtppEZ/AGvk/M
	KEQCxA1CHn/D+G9z50FmIi1hQr1ZNFfOw/sxCy64t+8UtP6EqMO3XxG0wJohNLqoOHEq4WS/Mup
	C26UkT9PRxBu8XsitRWxMwNUtSaHj6B4G1HPKfLXdekOUEY3AQC5lRA67q76laX7rguwRG2Prd6
	q+agI/Re0f1qCPKp7pG3yIERTVOGQ1NulwibSlVyJfgcZ9QoKPnxjPXbePp+0UfZvuOlVQktie1
	wyqiiGVyqIGAHiX0JhmcYOGET8ASr9LW8/XSRCwI3MaaeGMR+rexpCckEnsqwApr2UJSjhs5aiE
	IR8tv9aDUhOb/0m+zKIj7Ndo3U7xc/sI9q+lk7pH9ybV9V97NalaWNE5GHaPx320gXS4rCD0iHh
	U1a68Jg76MoXjgzntRHbQGpUbgHRkArZIC7mKt4qK8ZQ4PRh1jE6bfLD7fz2sQ1Xp2ouCei2FE6
	Kgl0ybRXBp5L+AmoP0K4lM5gFDW/D6CxEcuvyfPNqfxmng4stVwfmRAeOZerOMKPM0M+zmLXEWJ
	yutYqYAilOKpyv+YC/76LaLNScgxAZN9FfIm4v96Cess+o3ij8zJw8DPciqTG2Ksao7xwVkIeF8
	Lz7S+fDQfDajFdzgvAEuniJv/hgQqdC6aXOv4GZY92OWJ6fqf6DDmRGh4wtePZ4Y2r/mSNaxqgd
	iqNi6FzmzINl9h01qnHbYwhcSgZucMcqvTX/SWhznUKA1BlaebmMhT
X-Received: by 2002:a05:6808:2383:b0:4d6:90d3:e18f with SMTP id 5614622812f47-56814624be0mr1364853b6e.46.1794177743647;
        Sun, 08 Nov 2026 14:42:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:09 -0700
Subject: [PATCH v2 2/4] mtd: rawnand: qcom: retain the BAM transaction if
 replacement fails
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-2-4a8704cbf7b4@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
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

Attaching a chip frees the controller's BAM transaction before allocating
one sized for its page geometry. Allocation failure leaves bam_txn NULL,
although later chip scans and previously registered chips still use that
shared transaction.

Allocate the replacement before freeing the old transaction. Restore the
old capacity on failure so the controller retains a usable transaction
for already initialized chips, including I/O during probe cleanup.

Fixes: ba7542eb2dd5 ("mtd: rawnand: qcom: fix memory corruption that causes panic")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index f240d1effa04..062fba9eaecc 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1329,21 +1329,22 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	ecc->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 
 	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
-	/* Free the initially allocated BAM transaction for reading the ONFI params */
-	if (nandc->props->supports_bam)
-		qcom_free_bam_transaction(nandc);
-
-	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
-				     cwperpage);
-
 	/* Now allocate the BAM transaction based on updated max_cwperpage */
 	if (nandc->props->supports_bam) {
-		nandc->bam_txn = qcom_alloc_bam_transaction(nandc);
-		if (!nandc->bam_txn) {
+		unsigned int old_max_cwperpage = nandc->max_cwperpage;
+		struct bam_transaction *bam_txn;
+
+		nandc->max_cwperpage = max_t(unsigned int, old_max_cwperpage,
+					     cwperpage);
+		bam_txn = qcom_alloc_bam_transaction(nandc);
+		if (!bam_txn) {
+			nandc->max_cwperpage = old_max_cwperpage;
 			dev_err(nandc->dev,
 				"failed to allocate bam transaction\n");
 			return -ENOMEM;
 		}
+		qcom_free_bam_transaction(nandc);
+		nandc->bam_txn = bam_txn;
 	}
 
 	/*

-- 
2.53.0

