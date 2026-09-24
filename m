Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9774CE66B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 20:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280287; cv=none; b=FJxkwN4peGoHuU7sQmhBzO9VTUohhCtiq74A8AfjfmHOpIOgfsUU2oBQHSvPw4fYD1o0zuytsGapd4eAtVFuiBMYaM8Eu+ygpCS2WkwHc559s2LPJezxD5T/rk3SfWhoaDUGX9k6MYHApkc8/2V6RHY8LUhBi+gj2l0xOa37AWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280287; c=relaxed/simple;
	bh=SAkLzrZ+NgrWoSnB0dRUCDukrxXHAouRh2jFxYeJoIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ETn3FhQ5htOHtmPdrJoXALZgce6onepfDtljaBNHl71IpdkjKuYZ145gB02yehjQZj1316hyXmiOd58IFwBZHEJmRzHjAYTGHzCPeLYU5hY/Wcq2qFmxifvf7gJH885uYUNr751FQCtdwiHIQyZ3wzLtuzeLT0HDuy6nxFOpvzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWdZcowJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWdZcowJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso144950f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280283; x=1790885083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbc6iQ0ywUYDK1nXJ/WmLZf8Dcp9GFj+ZSwYgXpoTt8=;
        b=CWdZcowJx6uDQLEX0cRw1S6Elhcj5GeQEeYZivEfJlc04FYIwayS2JmTpGQC382/nV
         xaAoJ7j2tIhKFSggzGf7iAAD1msOWlBA1P9J70xiDF5lpWzPktdCufMLpWqSUL3z53+e
         owXT8S7wj2dVpHlzEmWVJyrtYQ332v/F88WDZm06IsQ2PouXUKVIictdUOYyxbrkIFAj
         CyLTUsPGMkpE8JX45gdSkQ1HrcI1CjB8dvIIxdML/X6Sa4AUYvo8T+mxgY4x7NLUeHzZ
         JLk48y7PFaY/ux5xbrIAnx6LOGmaz1HT7e/ZNkeFDBhuJedVU33ohM3/8MxJu3ZyNn0l
         AJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280283; x=1790885083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbc6iQ0ywUYDK1nXJ/WmLZf8Dcp9GFj+ZSwYgXpoTt8=;
        b=jUL+N9KU2KaIs20CvUUJPCTB4qu6AIf601jQ4isHCz+xv6vPf7Ld6pchQR1h7JDhWi
         z8rAckBzQkRbYVws6woXu3CQI6XWcEXsomdkLH9uT7XHSyt5N+s6Xsz2lN+/xafNiYiY
         z5OBdCVPbFQZiZ0PdZQ/3DqF69942ykU5jOh9GsJeAr47oAi9jRQ3OXrutkH7q5tonUk
         KZgyRlcdHEak3g2b0+VLAOrDBQle7l2DdP4zsMNOjTuKO4w6l4wBR/wcNVLK3A4KSiej
         BvEjISW3RsjfCvYem/xv3xi3NUx51v9hGDDSr8U+UX6Nj94HYRmZXxOSkZNj4myvYmEj
         kKqA==
X-Forwarded-Encrypted: i=1; AKwUvBxLeX9aICZfGMUpaGmS8UsdVNoVugw4Zx/85SPozG9foTkwAWzoLGTDjyz5gCJo7elly7ZKqtTq+9sMWjDd@vger.kernel.org
X-Gm-Message-State: AFuF++ltQXyZSlKB8DftuxYbp+EMifPNZN0vhWjndr382IIZzqtknr4A
	FpThGZieqCXoeLBKu8k492x+lW0Nf1rxuZ2kI7iGyZ8EmJfzrYkEh/cB60XtZg==
X-Gm-Gg: AYBFou3T1Wlwp/yBriSnyieRNRQ72RlZHx5OvG7ytvtpchxo+QNS6KEbuz3euHHxkRq
	cocOle3dlOvl8W2ib3IDDDMZyTS28SQJ26s+5qjGpO7UIGX8evAc4pbbfnJWiU/hd3HmiIqZlSO
	f/95XTHF+MoSY6oixlsUW5ucYVkC2tAZkTxY42HMix5Jv7pcAauvBriOb/D7ScowFMsoa9BN+zZ
	nnlMQeoFFyKJv77Viry01b5t74b99Ibt/+C0h/2h9WnlUlMXM9fLqX8pw31vLr3n6Dl4wkGvqXi
	6Lwig97GZQsk9ww8sqwVtPylp3qa+vyNKE/TU0VfS9Jpu1twmhZw8sFeK1+KcXxNZ8boI8cAJWu
	zQM73YD4n/NWeCg+M73SssYJASdsq2c+ick7nWB0uAnM95FwkiJWLK76ao1hrV5WXZkSqIftC+J
	cvZ9CuLAwi1ziYlfhmcSZ/vEFJOwsTmW2ztgswS97kv2hv3Zne6+5VTNZEe6sxnZZr3bLXiSdJh
	FkyipDtaRSTRRnLtqshcaSn+Yc=
X-Received: by 2002:a05:6000:40db:b0:487:21be:dcc6 with SMTP id ffacd0b85a97d-48872a77f45mr6028406f8f.21.1790280283045;
        Thu, 24 Sep 2026 13:04:43 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:42 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:21 +0200
Subject: [PATCH 6/8] mtd: rawnand: qcom: make nandc_set_read_loc_last()
 more generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom_nandc-share-more-code-v1-6-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
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
use a 'qpic_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 96a1a5a03de8..cc1e64ac4245 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -181,8 +181,8 @@ static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
 }
 
 /**
- * nandc_set_read_loc_last - to set read location last register
- * @chip:		NAND Private Flash Chip Data
+ * qcom_nandc_set_read_loc_last - to set read location last register
+ * @nandc:		NAND controller's private data
  * @reg_base:		location register base
  * @cw_offset:		code word offset
  * @read_size:		code word read length
@@ -190,11 +190,10 @@ static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
  *
  * This function will set location last register value
  */
-static void nandc_set_read_loc_last(struct nand_chip *chip,
-				    int reg_base, u32 cw_offset,
-				    u32 read_size, u32 is_last_read_loc)
+static void qcom_nandc_set_read_loc_last(struct qcom_nand_controller *nandc,
+					 int reg_base, u32 cw_offset,
+					 u32 read_size, u32 is_last_read_loc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	__le32 locreg_val;
 	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
 		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
@@ -226,8 +225,9 @@ static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
 	reg_base += reg * 4;
 
 	if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw))
-		return nandc_set_read_loc_last(chip, reg_base, cw_offset,
-				read_size, is_last_read_loc);
+		return qcom_nandc_set_read_loc_last(nandc, reg_base, cw_offset,
+						    read_size,
+						    is_last_read_loc);
 	else
 		return qcom_nandc_set_read_loc_first(nandc, reg_base, cw_offset,
 						     read_size,
@@ -1916,7 +1916,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	len = nand_subop_get_data_len(subop, op_id);
 
 	if (nandc->props->qpic_version2)
-		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
+		qcom_nandc_set_read_loc_last(nandc, reg_base, 0, len, 1);
 	else
 		qcom_nandc_set_read_loc_first(nandc, reg_base, 0, len, 1);
 

-- 
2.55.0

