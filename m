Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372824;
	b=kdhjc+ghQRUjdTQWTZseA/EpGFQDEb/gSjQxM3Vl3XG++hNO1Ws+ZOZXrhZ1LB1VIfp9
	 cfOLgD6/SDFSndXXto9jAahRnnqIN5SjI5du9iPkYvbVvtwxIociD5vZAYIyvyr/nlgXS
	 lAhbfzWdKScprCZ6ZrvzzS7TBheSF4t3IVsnfexmvAzoB0O2o1GCQEYVQhbQdBzmJ1EjG
	 5xu2BlIxl58zE5Eo5nB1DJc+6LRyJMT+lEjAI6shsd0hMxNGWg78Y9LaDNmxBiKnti3IW
	 +RmBJHIgBz7+WLyc+h57XHqY+VYl8+thioBXSJwklDT5aszaIvow88ElYzud5dGOOPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=czilngxYr4DCa8qp6+h+f369XEDq6BL7zSm3xrFlL/g=;
	b=Z1y02bQE+AAmdk6lgt7amiML3YMsUJvIYE7mW95+N1Vr5jje4p7eaKoNlIKaBcJS43d7
	 kvb2S2RzfCIzeQewxTJL8JG1tVkOEFLd5OeVdEmH9OMkEKZiOhDQzh7m2L1gp4C6m836V
	 mLZxt0yXrFYh4dhTQhcJTdHng/Qt/i0ZmQ3w/jGdpVzT7mYCyBGpXP2GmLS0G5zvcPTOC
	 89cbERoDIwNDgUsPp6s5CCQPpR4LT8q6oI2SMxSs/5CTgrf+airC3n6F1DhLIgT7S7GGK
	 x9zTuhHIigSTBYQX/qHlNmy1RFt+ckQB28JUYijWevNI+HM+XqlNstybNonW3hKjKHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttEBhIGg;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E57606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E57606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ttEBhIGg
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso1992375c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793372823; x=1793977623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=czilngxYr4DCa8qp6+h+f369XEDq6BL7zSm3xrFlL/g=;
        b=ttEBhIGgwoNvjx79/PnN3j6bkh0veJHsN0NCUiD1G6OGelKk+m8zlOzI8KgifA5hf0
         HAmP1raP5o7zE0mKZ/OnOyWImdgTnu26FK5NBppRfUFQzp0vK2Gn7zATfGc/KL5xKZv/
         fLpCnZxFFeVX6UmfimRD1W0d/hTWFkhMuha16q2ZIi1ilRfkVWLTzqdCvCw+EoO5P8tt
         PHXFZx1lTmKvIiQU3xRv6bOg7htydx0D0EVG81JgSmiZjxyFzBFf/kqjw7xRGLIjGit9
         Y+zLHChz4ZEfIUbdU5aIELn8eQq5ufzsiOo9ZIDvT55GNR8YBd+1jOqQAvmgn8KW9hm2
         PYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372823; x=1793977623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czilngxYr4DCa8qp6+h+f369XEDq6BL7zSm3xrFlL/g=;
        b=h4B87TOTrW39aCWwGcNLC1vr+b71zkp9MJdEhC+GCDJC5hhGksu8MpLl63pgQ43erH
         y4CvzEaVDe8ES4V1ebdM4/jn12c/I4n4kQ9TvPdVqx8lViFJLE7tZn/uu3Lr1ezk6jp+
         /rS31YZNBX2tskldCjI/2IzZ964874h91PQ8U4kz20ML/wMAsPKehQg4VfJ4iaDuev41
         kJMepkwpyLUVX49m5qYOxCws+yWoYZgh56KgODEDVKBCv8ebaX7WCZ9qxF13TJwoMSJF
         WUj+tCad31V4Sd+IIua3vdbLyEMyjwittthOTZ9kbvHGMVyPLHqIfFX7fCTCl/pwcDVX
         2wCA==
X-Forwarded-Encrypted: i=1; AKwUvByqTmksIBZRiCscMbxibT+6JzSS7zscXzMQd//ZOJkG74x/OxoWErxj/PibO6DpnLLmusAbszij7JNxnh2m@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ4BF6nWdvIKsusaCGdGX3K34nV1Bn7jDK2FPx57AKwYZw57/e
	v20q+7RuPjGIh6Rpm3XuB7BVB7KaGvK/0z/C6y0MsZAyJpSPKfNU2ZCt
X-Gm-Gg: AYBFou1Oze0leEH/OJdxm0HsZt42rbcWTzW2IopLWkMKJGf7NEL6DKq2F9l2QbhTTah
	+a91I6eOcj/p6r2Dip4pHkW6ByEXA+4wwOnqwWvuv9hOwy9aLUIEh8Uxfbl+8ZebMXxAQbqjXMt
	NnawmncexX42CIu117TT2FTgi6NjRs3CurGSLLbfV832hMa4dRsVY6igLQAsZAwuQLq9QIw7EsQ
	Go5bQw2DudmiMIvVgPrwq54b+dCObKnvKYi7CgATqml9C3sccSmzVxHbASqc0450Jk9mgBHSABv
	D7Y+C+1L8s+hRBjCzD9v58nzxNCce0h/h69UUAzjnMwMIoRMSTiDsHIYTk0d8ua4SAoP2xeUqkb
	X23h1IS2h+i52BaOr+g2X7qrQ0G4RpP4cbvSIPi0DSTsuMOnaTDrOpPIoX8km5lb+5mM+ZRn80Z
	Uzs3haMsFSIauHYZ2sQCQu9i4wQyv7Uu/+xMzP4BageqmRr4MwhEp0X7u016IjNUOubEcPbPjNu
	INoptWz5RDQ6fas1OFaYJJaqvupHxcCpSCLm8GqRsKOEW4LKe4qevf19x8LWsBKDu9phBs+wF/w
	cGjyfim6RfPM+iEujF/VeEFsk6cZGvbxBvgVtuHgI7nQgsjv1MAyWFDrHP7eWF0nZBmw3cMEv8Q
	XqJmINdDYEGnWvW0k6dKYzla370LgQf4Rp+zbFKM/EprR1c+lN/h9ySRUq6R3bkNjq8d55pn971
	gNv74rVEEFCkRtoXntJYTOUewo27qL2f10AeU=
X-Received: by 2002:a05:7022:1113:b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1ac9dc67128mr2995647c88.30.1793372822378;
        Fri, 30 Oct 2026 08:07:02 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm7475171c88.23.2026.10.30.08.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:06:52 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [RFC PATCH] mtd: nand: qpic_common: terminate DMA channels on transfer timeout
Date: Fri, 30 Oct 2026 15:06:46 +0000
Message-Id: <20261030150646.2942368-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

When DMA completion times out in qcom_submit_descs(), the driver unmaps
the descriptors' scatterlists without stopping the BAM DMA channels.
Since the issued descriptors may still be active, the RX and TX channels
can continue accessing the caller's buffer after it has been unmapped
and returned to the NAND core. The ADM path has a similar issue when
dma_sync_wait() times out.

Terminate the affected channels with dmaengine_terminate_sync() before
unmapping, ensuring that outstanding DMA transfers are stopped before
their mappings are released. On BAM, termination resets the pipe and
discards pending descriptors.

Fixes: 381dd24539a8 ("mtd: nand: qcom: add BAM DMA descriptor handling")
Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
Questions for the maintainers: BAM pipe resets may raise a fatal error
if the attached engine remains active, so it is unclear whether the NAND
controller must first be stopped or reset. The success path also assumes
that completion of the final command descriptor implies completion of
the RX data descriptor, which may require confirmation of the hardware
ordering guarantees.

This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware. The patch has
only been compile-tested on arm64 with W=1.

 drivers/mtd/nand/qpic_common.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index 4f3e4dd76..250154a08 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -592,11 +592,18 @@ int qcom_submit_descs(struct qcom_nand_controller *nandc)
 		dma_async_issue_pending(nandc->cmd_chan);
 
 		if (!wait_for_completion_timeout(&bam_txn->txn_done,
-						 QPIC_NAND_COMPLETION_TIMEOUT))
+						 QPIC_NAND_COMPLETION_TIMEOUT)) {
+			/* Retire every issued pipe before unmapping its buffers. */
+			dmaengine_terminate_sync(nandc->tx_chan);
+			dmaengine_terminate_sync(nandc->rx_chan);
+			dmaengine_terminate_sync(nandc->cmd_chan);
 			ret = -ETIMEDOUT;
+		}
 	} else {
-		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE)
+		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE) {
+			dmaengine_terminate_sync(nandc->chan);
 			ret = -ETIMEDOUT;
+		}
 	}
 
 err_unmap_free_desc:

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
