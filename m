Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A88443E43
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 19:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363191; cv=none; b=Vju5Kf6vZYUSyVkntZWC0LUJAhA3+oJAo/wb4lht7/OgclSLEGrHJuEOjIdcNLVHfiUWYomxEkxNIsv9kmgg1nf5Or4VO11p59/75SQsQiq1nznPc4VgQmsBG3kLV22FG512dG42lekraAnaFeDgZpY/1DXRaV68QSq6+DyNUvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363191; c=relaxed/simple;
	bh=il92iscxRx335UsW8VTDiabR2loBTTgVkGFIZ1f3ayg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QW/zNcRE9OSPUh55DFrkkXzsFPPwggaKsczjkI5wRUvC7SCH8Ma6w9PuG10ziHVPc+WlwSzR3ZrKWA4uiWlMDnRQmF25qNJZu85mnANzcesXTjrbunxg4GOEiKPoLbNr/tOz2eauqWzNYjIhNXRuRuF9HF/i0/bGPwvjy34GBBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iU2Y0y95; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iU2Y0y95"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso537289f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363188; x=1790967988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5jkKD2v4oiF/61cAOq1H7aVeTB8y+S8JbJGXm/lHUM=;
        b=iU2Y0y95bDsYYAb3ZzAqPzRrHk0AEWNg9zNjCeDlD5uh47ERT5rQOD7Wpe7W5ibXR/
         4922NIolF3SRZ/uH+f+iZhLZ8o034W08ukadQ00ABRpoinzotrfe3+TRJI6GmrP9CtL4
         21nL8x1smIUeEfAp+n2USlrb14JDy+FEPaDyQQP0yhz2+L/xSDA1eMgIeEQMnqYypuI1
         otc8CBPrWkf0u3PNt8g1V61QChLgBgFIsjcmghKSU9By4NgP4YTBm/R5FCALC/2MeUWQ
         JAnbBmmxDaQLu9aBo5k4pOsgAGf5MkvAtExWnJjHzROyL6jjwH0PmEYQPjCLeOQN/SJD
         HaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363188; x=1790967988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5jkKD2v4oiF/61cAOq1H7aVeTB8y+S8JbJGXm/lHUM=;
        b=1S3Ij+ZCYnY+xDyT4FJ0bQF9A3SNQiJAtt189b0KaFwHJB2jAQEYNz/Xl4RzEWj+se
         aytxQQstXRiiNSHlaczPyuse0mieYmkpTgXxqbJ26ctPgX7izU9V5LoiwQw/fhP3lzmC
         91vwbYWhBUhDJQsxJUD7xPR0m9kR45u1PGDsnup5ykii95pFcT6DkK5FQ5fEkiOVoF3v
         5zTVZh66qbasl2DKCyR4ks/qfM2nIqBTRsnXQIQvh4MR+oGG9c1bjZUCw62KieDgDu//
         nnVxfSTWbpyg9G6HaMWQ4k1t2jdsS1jk6Cy1OI+oqZMGtij3yJxGID3kk8ukfZfAwUns
         Xd9Q==
X-Forwarded-Encrypted: i=1; AKwUvBy5luYSdt+R803bYOSzb04s4gZELHm2pHe1f4M4bkQ2PrYsEY/rm13fOV5UgkjW9EDmqPjLwxIFSWW/mnQU@vger.kernel.org
X-Gm-Message-State: AFuF++lYaMWCHUxnKhCxn3mUys9led7vjl2WZuglQMpQ/BfsFq3dH15j
	GjwascazaHbLKCEHBQ+6FZ4t5Ij0G2jpMXQowxtNS8LuWKt6ZS5miJcZog0HTA==
X-Gm-Gg: AYBFou0yt3U+EFo9WSE1CxYd6zT9ypTZsr5lMKLUxtebjBgfUG8kWT7KYCGq6ISmLmo
	vCiyhL3ur9mVykMbXIrczKEl6q+xP05pRA/a+jsQr3sKELe0eBmBHIDXinBSOSB6y3avy4LVy+q
	JEmB+TpUVhqwxP86m001V7pBSBza/ZGK76iBaoaXzMAAaUMs1HBTIbx+r+gOabPDiPyQYwAVZOE
	wZtPwJ1Yxe2naOosScJ6QNgr7DwZKDxxGVqytfGv9+CdoHrbMcskQFYbF/gvpXyV/bzl00Dz8fs
	94jWxWEiXEU5A3b3aFQSMkWpAoesh2tTA2HToy6l/e4lwEfNLoOo7hK0qxVCcc59A3FFsPsM/Uj
	XXElee6YGhhUTcZEBxHXfC0TbdKWkmMpOXkvAt6G45cRxC54kpC2YfazLevxXNvdlfgaYE/5V0L
	8KpQZxjXKuEA5nZlVBnOSIQpoEyp5jOSzL8vCQADY8zBi9xLQ7XenS9ejyoJ66lRll2PLEwGyUk
	pXnVGxwf7Gw9F6C00mBS++hyPk=
X-Received: by 2002:a05:6000:41d8:b0:488:7b80:f2d0 with SMTP id ffacd0b85a97d-4887b80f651mr6001675f8f.52.1790363187806;
        Fri, 25 Sep 2026 12:06:27 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:27 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:11 +0200
Subject: [PATCH v2 2/8] mtd: rawnand: qcom: make config_nand_page_read()
 more generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-qcom_nandc-share-more-code-v2-2-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qcom_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit message to match
    the actual code (spotted by sashiko-bot)
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 12bfb14cd9a3..c65a8416c3f5 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -305,10 +305,8 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
  * Helper to prepare DMA descriptors for configuring registers
  * before reading a NAND page.
  */
-static void config_nand_page_read(struct nand_chip *chip)
+static void qcom_nandc_config_page_read(struct qcom_nand_controller *nandc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-
 	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
 	if (!nandc->props->qpic_version2)
@@ -357,7 +355,9 @@ static void
 config_nand_single_cw_page_read(struct nand_chip *chip,
 				bool use_ecc, int cw)
 {
-	config_nand_page_read(chip);
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+
+	qcom_nandc_config_page_read(nandc);
 	config_nand_cw_read(chip, use_ecc, cw);
 }
 
@@ -490,7 +490,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	qcom_clear_bam_transaction(nandc);
 	set_address(host, host->cw_size * cw, page);
 	update_rw_regs(host, 1, true, raw_cw);
-	config_nand_page_read(chip);
+	qcom_nandc_config_page_read(nandc);
 
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 	oob_size1 = host->bbm_size;
@@ -727,7 +727,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 	int i, ret;
 
-	config_nand_page_read(chip);
+	qcom_nandc_config_page_read(nandc);
 
 	/* queue cmd descs for each codeword */
 	for (i = 0; i < ecc->steps; i++) {

-- 
2.55.0

