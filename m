Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177747;
	b=XF0sAlf6zyNXC5z3fgnXvUv9t/7b2GD5T8ZtLJjn2Mv2NHp6A8B6nFzZaK1DO6i9ln2I
	 iVOPn/lHk5wqSn0nv8LzvjmTtQPKKP+UEHGEFf9QVp/q41UpvLy/g6LBVrJiHyEL+cJSw
	 GMoAU1O5Z5ZjkEx8OvZSNVHuIuq0uSi+VBZE4+3QoyG9azVgPbNPSd1CZ7c/ljRkddLHf
	 7QX+/JyreY+TqhaMGwlWfijbmJmiQuK8iP4vCRNWwOvAeQuArNZ4lvLGl3vTfq5dudk58
	 YUKD8I570mE0Klcz4XK9ByGhTHwcqKak6WkR/0TqRkV9acocb5H+ZakVX3jea/YKHVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qzHeLZPhDy5sgZl2YeSaSSmwqxhMbI/xK+PxVybiOB4=;
	b=CXgk75X8I/u5ZnzEuvUQ5frc+8tQr8zDGnwTmPpzH5bJ371e0swlkFi8B1fcYVHjtF3M
	 wnubG8BQwsnvwiOMHiCuA9IbAUghVEpL3PDwZrQMPBVUooiLrn35hu3lkVEPlstN2X3Q2
	 pSGZN5Cg1T7HqhBi02/1Q+H7eqlVj6h4GW64hMuBL5g8FqRQcGh1HAY2hJIS2eK4aYVBn
	 02eZ2nuepQIfqPNpOQKN572zhzjA9Gl45npG/GvHCxGV7WkJfdzjpa2g/Z0mvZ8pVOfa9
	 0gwC2qvNhrnvF2M9zYxoJbiI3l5AAcHXsU9TodcgdQ1BPbaSXpndzdQVSGvZBn0ThzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hlj0fTXC;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6C0606D815
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 22:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6C0606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hlj0fTXC
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4e4a4d77e5bso218055b6e.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 14:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177746; x=1794782546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzHeLZPhDy5sgZl2YeSaSSmwqxhMbI/xK+PxVybiOB4=;
        b=Hlj0fTXCxV8yCmwJu4LjUB0Vf44qEZjv9f6NNP1IhwPrABj9WbrtEtvAgukZfSHY+w
         f5HN7SmaIRAD0bhEdfqrkxdhUi19dq8j684KV/LQfC7iix3CTY6KWixYQIGNXh8HEHRe
         j4P0KG8khsAveciJJb04vvPBlrdLxW+9kTQngCnNjb5Xqn70S9WMgb+q1zGlERTiRZ2+
         ua4AqZh1SCdJuFn2MupfyXvdW07UlJv8gm+5KyxXYUned/btGRK/S6xof4qsbIgsKuz0
         D/bjSfK4bYjoJ5kx7kdLI9NBtsWsvxeuCI10TBcklcce+M0iztRb1v9zbD8duP1JdPc9
         CelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177746; x=1794782546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzHeLZPhDy5sgZl2YeSaSSmwqxhMbI/xK+PxVybiOB4=;
        b=Tg2OsZrGnzf8nIs8Rq8UBIu9cKewdS2ws5XrOMRWs0vgPw26f1rcvwPDNT6hyXIQDB
         IoQ26L/zJlM4wLqw2xZgsGfJnFem52krNYiwVjUguZZZpH5mVokpnVMcmsTJNaG1f2Hz
         GAeXjQfFd1QlpD6SytfgYi2b7gaIBwGBFbLzaLg7jMFmEr0RTiyGJ/gfXEPrClfgNopo
         AWdg42rVTuQPcJkmz+wdRuEB2S/MVQV+W3JMoKkQE/bBT72RUHxsn2X21KmkdWlbbmiY
         jN8Ex1fRBLp+drQuwxVf6O47l/EQJEXTw7ROBIFrZdg9EXmYTqWVkTzTBGelU5FY0qh7
         Be1g==
X-Forwarded-Encrypted: i=1; AL+hErFY/h6gkkY/DMoE5rTUZJvd3EP0qFNfOyIU+jbJ5OghTrt2k3LlM6EjjlX3I2nm99834xQzbaBh1Ga3q7Pz@vger.kernel.org
X-Gm-Message-State: APuU4Z8kbQn0q95dmfGUaNMVRxgLPU5KBDTKkfs5vRhcq1oHGBTP/PZa
	b+cmMOcHDIYT5LMPnlAIeAzYOyHxeH/hiGFa44ev6di0Yjo8Wfndyh8o
X-Gm-Gg: AYBFou1d+Yic3/Lz8X6ys86Q8MQcAYyXUbSC+rv5gpZikmmGkPx19DFpywhIQsSaOqD
	55ZAklD2o0NiMCPgX4YJY6jht1om116DWS5/0E03Re03WBWBL67TEXQLJj4NCnIWEmSX7HpxYIV
	V/T8agKSVM+dztQ/l2dCuntBc1PQ41kPxTorXTFMsQZJKjtlfdBl4SfWgVxMfC4fU3jNA2xVHmK
	iX90tagoa/+po2xI2A/tldJ/nFJ9MIGUEmea03OsBq17SXpyiXzv86r1+v2b489dCVuYio9pFK3
	HDs9wdTY3oBsZ3oyZGbkV3NekiV4NKQabN8ZOXM7yWdldgC4UeTVu1WbGZrCmkFxPuL4qVpXNr3
	vSIhFH5M7Uv7HZFRUn2RcQtr8wRfO8McKPIXPwW4K6s+yhXqRBsOA+JKALWqJy6oSS5iAFC9zbZ
	u9e+gSVgfGc6Mgg45vpQFKV7cocleRhCZubUVfTSxZ54u3Fm5SmNvjeFk8H5JE45iycVrKIny+1
	CiLin+BSDTwD0/ApE8Lv4A5LN2Z5qOEutZQQnRaKMVbivM42j49nSJ0M4z1rmSkLh0qtPzBNf1F
	zEz2wIK0yt60l0ZBali7YR9163fE/1YqGAzvVweSGFVjfDSWnJdT/mO/lV1axo7GKKJwTxFWQPn
	wci6Cye3s0FI/O7bLRVaC4mL88RUySiXYuZ6gZ8fpguD+grLKdwd9JDfIhfT2EzWkRfTbBEFHkk
	4QDHVh9zZ24C1D7x+AeYn82pKxYiztif/qWc04tAKrmeVo4Y1cMvcx
X-Received: by 2002:a05:6808:181d:b0:53f:b2f9:1220 with SMTP id 5614622812f47-568144741edmr1029934b6e.5.1794177746301;
        Sun, 08 Nov 2026 14:42:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:11 -0700
Subject: [PATCH v2 4/4] mtd: rawnand: qcom: scan all chips before
 registering MTD devices
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-4-4a8704cbf7b4@gmail.com>
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

Each NAND child is registered before the next child is scanned. Once a
chip is published, its MTD operations can run concurrently with the next
nand_scan(), which does not hold the controller lock. Both paths use
controller-wide command buffers, and attaching another chip can replace
the BAM transaction underneath an active transfer.

Initialize and scan every child before registering any MTD devices. Track
which chips have been registered so probe failure unregisters only those
devices while cleaning up every successfully scanned chip.

Fixes: 6a3cec64f18c ("mtd: rawnand: qcom: convert driver to nand_scan()")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204074@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 14bb7f3d6c36..978fa84f051d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -89,6 +89,7 @@ struct qcom_op {
  * @use_ecc:			request the controller to use ECC for the
  *				upcoming read/write
  * @bch_enabled:		flag to tell whether BCH ECC mode is used
+ * @registered:		whether the MTD device has been registered
  */
 struct qcom_nand_host {
 	struct qcom_nand_boot_partition *boot_partitions;
@@ -118,6 +119,7 @@ struct qcom_nand_host {
 	bool codeword_fixup;
 	bool use_ecc;
 	bool bch_enabled;
+	bool registered;
 };
 
 static struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
@@ -2008,9 +2010,9 @@ static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nan
 	return 0;
 }
 
-static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
-					    struct qcom_nand_host *host,
-					    struct device_node *dn)
+static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
+			       struct qcom_nand_host *host,
+			       struct device_node *dn)
 {
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -2059,10 +2061,6 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
-
 	return 0;
 
 err:
@@ -2082,7 +2080,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		if (!host)
 			return -ENOMEM;
 
-		ret = qcom_nand_host_init_and_register(nandc, host, child);
+		ret = qcom_nand_host_init(nandc, host, child);
 		if (ret) {
 			devm_kfree(dev, host);
 			return ret;
@@ -2091,6 +2089,14 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		list_add_tail(&host->node, &nandc->host_list);
 	}
 
+	list_for_each_entry(host, &nandc->host_list, node) {
+		ret = mtd_device_parse_register(nand_to_mtd(&host->chip),
+						probes, NULL, NULL, 0);
+		if (ret)
+			return ret;
+		host->registered = true;
+	}
+
 	return ret;
 }
 
@@ -2100,8 +2106,10 @@ static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
 	int ret;
 
 	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
-		ret = mtd_device_unregister(nand_to_mtd(&host->chip));
-		WARN_ON(ret);
+		if (host->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+			WARN_ON(ret);
+		}
 		nand_cleanup(&host->chip);
 		list_del(&host->node);
 	}

-- 
2.53.0

