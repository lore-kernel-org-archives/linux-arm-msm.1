Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172604;
	b=5Q0y/+yq1/6SPyt7ZnrAISLhEP1RzFgOMHdh5+kTiEm08i4yrrhbjGsvpFTI0zexcrac
	 a7LagJnqOdbwX0drlNx4FaN5a66rznwAH0KnnRVBatkJmOBFWvsMvTocX1MBCBcotPVyG
	 DMTbuI+kDBIaa4HX3ccIPcUbmppF3bcCxmPVrl85Z3O5cGnLZVIsIb5ZYTxisUJ/Cs45V
	 QR+WClEuYCY0Oxe6+LFGSHsLqxwS+tEzlX25YFDPaoudzxlIHZoZz0kJ8bfRhWFp0ILci
	 dsaY2zi6ljRmAFC5UULvKZaskGRWAEiSYofqwZpyG9Kltb/inMKp6jrBKZxsKvJWyuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
	b=BEtexgrFy3eZfEgU5OxXmPXd/UbUOkNRXPzrhN/Gi5hKinMUIFWGafj4CPx+Tb4l61u1
	 8u3Y3GcKIcVqFEtA+swXLlC8BZmdPr8XrEv9mkhm/LAP3hV/pTkJLjW9UGkCE7MU/vpD9
	 9DLwJPhhj9zb0CCTOf+29JVLOLDBAgAYWDI9DduSwkTCj1eCudGaUi+PmjQSERw/3x92T
	 z3U2a+QH/gEnoN7g63mxeDJrXVV675oHSw9bC+Nx9IVuiesIl599Tx0nDVyxtvy8SR/lS
	 Tzo1oWdIB7Je/mKxhE/L5xPW3A7oCSbrAW1Vy78Q1SwY8ZaBlfxdkIoeSKvqWl0R2eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gjh5ETJg;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB97606D805
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 21:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB97606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gjh5ETJg
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6ddef424972so233244eaf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172604; x=1794777404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=Gjh5ETJgttZxG2mF8evsbAwLJ3GjkEAy1jrx5pHGUifMlHZbZ/aRG/9t7kzuCZy2YT
         IoCcF9EcDPklzfhwN4lKbeau1ssASVIAO9+YEwDGqsVtVrc7bQKNDA2oJ9RPlgRTFGPm
         9RNOH/wVC25C9JUFfkjNFbB9omFoKfH9ZY90Tfkmb3LvNUrGTFnlCmrWvRTjwFpsPNR4
         8zeDjaZ25FoCP/wRiR0QjdIiwPxUor82lLp3viYCTm0h0rL2LHt7yNrz31uNWKvB4rim
         W72JXuV4fuwgIcWb0VlcSoG9KysFWAu+osxDFjzdufgvCYbffSwt0Tt/SP9uKVb5u3TG
         O33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172604; x=1794777404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=wQk6IOTfZBjiOPy7xzIR/OeRwjGDft36XwR+GSClTH97DLHHrf8hIzIl8A4jb5wUi/
         ilzBFGQdQelmbxgrlZg/6Web+HhQUF5eeY+yw3Vyvf+AMD7AxkiIaC10xHEA83z/wG36
         YOx0NLZFDItSaEsIy0LpD7XYos9bQcI/068fcc6jfiwMT48syzFasgukAptjRfvM8/Hn
         YLDjTvWTp3sTiKTO7fl7htGwK+e1Hon700+3e9ghc9+IOiqcfyj9pPmFBYMFh7jaTOGV
         2SYIRoZJmcdEUzqlCsvsTMiuGEJtpj01NzPfiwkxVY97fgTf4anMHu7BRAlSl4h9NWNb
         4Cpw==
X-Forwarded-Encrypted: i=1; AL+hErEFp7PUHKO3jyMMUNlL8tBXOxfqj0fTxmcdGggD2I6BphT0SbxVySty/MaC3EeugMpeG2D/Ux33XROMSCz/@vger.kernel.org
X-Gm-Message-State: APuU4Z8jHjGc7s4mtKBJTQqfpLqpMieWQXceEVo0znAm7celrV8un0WX
	brDOqdydcO1iYBU5/XUqsM76dYWBTkRgm+cbgkHS2WX76HPLvpVITgsL
X-Gm-Gg: AYBFou1sECo1NfsBfFPH0bU6pgwAtIBal3TaNzL0Z3VmyL+i3OpOG95GQDFgdot9f/O
	yUizK0csPHMZCvfIW8B+NBYWKsnDBQzcfSRa/D0ZR7PfiXS39hYhZEB164lq9oFVATXDqm49T3z
	lcl1X71GKusd0d9vmymEHhbTvs+H1yYQ87S8NwBhXnPd+lNkWoRNrVhvKZRwJpBOfYaIKXVzxCj
	FQZmzShg3B90TZ8j59YjYlWnhl//UyS/od/Qv/KGhJ9V6OeCI7hpj+CVORMbStRdND1cSEaF//2
	DRSuCuae4QacOK+8g7cWpC8QC+szhBJ6Efmde09oKO6kJeFqD5yZBtAOLm2JOKy1zG1ZL1/XTJn
	YR87018gwIi4IVxUnGM1L62tA1WzbV7Rh3pj9w5ld2IF1dvdicRhWMxsS5eNRL32dwJMrQlji27
	sMGdOApqLicTZ2aa/6F3VY7avAx79ssafqCGwWf5k2ZmFE0f5yyqWDBpaRjESDB5W+52inYFhOz
	t/Y6IUlzmPbrzRc3Az7bXgjcCRLbwURLqcfpJN1Lv84M7n/C0fIw6P37PJ/RRcclbNrv5/4TiKw
	w27GxQhdwUebUzgE64Ng09RkZMKG7c0aGnRnn/lNfzWZOMbD4hGZoZk848VAnwpv1Wb5ozuA+KV
	TiqtZWeXDaxsc0tD31ljAjnYfJYY5Sa/TPNXX9OGLEV9kFRzsHjvS/5/pbZY2rQPx9R8pjpnzei
	re958yp2HGcmQhPCqq6y0dwKBZ+s9OImy1+0maXV8SIyiPz7f+xgs=
X-Received: by 2002:a05:6820:1690:b0:709:529a:478f with SMTP id 006d021491bc7-7170f2dad52mr1144251eaf.60.1794172603603;
        Sun, 08 Nov 2026 13:16:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:16:36 -0700
Subject: [PATCH 2/3] mtd: rawnand: qcom: retain the BAM transaction if
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-2-509f30a9e14d@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
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

