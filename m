Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36632381E92
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 19:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363189; cv=none; b=VBt0BOwu1tCyCRqsWO0mSliqdK2/mOko+xWcsA+8H95DCTPZewl7FBghDiTtcUYDFRSHzsIUMHu2vPFJcUOtbcaDdMuIOArQ7cfqm151p9mOgMdB1Ty7u0bDtVNVA/5BUkJywnD2jL0UTuyJ+PbT1OHDz4l76fepfQGzuMqtrEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363189; c=relaxed/simple;
	bh=zVeQto5vDZxkJE/HRjdY3/VoI8dfd8pKPbmTAziS0Q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jj0iOFPkWmNAnXkdwXoOeNv9L9j/BKhFuvR0H43gpQRbt4czdLKAMC58mOkDHjxJSQDrE0OsVe2yzNMkLK/uhLJ9JcGh5ozEqwjoeXWCZvQuy8gLJgEj6RYCZ1It7NSm6CjLNXFlooIabn2q1+c1KRTauOjbJNlZ7aKTf6Ac/RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDOshxhQ; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDOshxhQ"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-4888598e4f9so95323f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363186; x=1790967986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ySQVKffvoWSE9C5/lbi1TrMmX8nXIRP+Q8bXCPE17I=;
        b=qDOshxhQuJuSWJyfd4xh7sJaJ7DVHwWTpbUmikhiffutUmdeSARrLugBrZKzFrz4OM
         zQJ54Ztg4LXzsETYT2GHUAavfsuCp5mTIQDVInOdfmmg2OC6Se2xK96i94dfDk7JyPDW
         MNjyZ9Y+wmR0Znwil7RqEPoQyad4qjw+mEiOHzf+nzxC0UODasfgT8MeVDGu4Lo/7NA/
         npfUJ0oi3AikI+VnmymeShagAncRdiHJvAxFqWzKgo20G2Kq/pJ7OHFS94V0Frb5GB+k
         aiUdTOgRrW2JjXy0bIUZHaUINxGAO7vv2pUk8V1RXutvEC+/uwny5uBdR4YMxSECchEj
         SfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363186; x=1790967986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ySQVKffvoWSE9C5/lbi1TrMmX8nXIRP+Q8bXCPE17I=;
        b=Y6Wg04aoHFAK1bCbxcEO0o7n77GbfRL1Tf+3dCTsdvUzT7H/EazL9Ls4LXfJtg8ee6
         5s6O5gxTRf2+bXy0GFaA89ylqRlkCaRY0WZduczo8LgbGcgkaT8e6FMt4TdRkvLamC2N
         gMb9bVFm99QN1fS5M5JVEONWjxwrnoUkVDQ23vRZx6lkzZIoX/ttQpf/e60KCmjeBsEz
         anfQ5Ef30k4B4X55iAwAOrqF2T4XruVvtyTMTbZrxX2B8ZYupjoiF0AA6l8dWj5pU1Ng
         jnYSx/RE7KZuE/1+dZhC7PCDwRNNXgwaK+nYhl+I/0u1JkZazXZezwlvWwLIOsV0+sA5
         NgkA==
X-Forwarded-Encrypted: i=1; AKwUvBxzX5MZZ/WEx9rVDSqsa+Gr8H29I+N5yP6qkr3G3EYCVmbMZyZvZiUZd4OPmB+u7h/xb92Jt4TEg5DCwcGn@vger.kernel.org
X-Gm-Message-State: AFuF++kDir1bHx61tSbSTTgPB6LyDwZNZWSEje3YGrvLyhUvaJ8idwkv
	zsw/2/5vzINMD40OuyyZ9lR8yN6BC9b+w8ToNIBVra1uLNnIm4evcwKAfOFP2g==
X-Gm-Gg: AYBFou2s8luYE6qdNsqXKqVIFxx5QXVp95y+ky1h7bG7zLMWjLG8G0XKHjC18WkwRK6
	XCwm7KUBwjZUKaSewxQBkv3JlwHqxtT4wJ96ahPACPRmVzOPXjQDpKpjyCz+1eXNrywtesazpzu
	Bn11Q1mDhEKsg4m+DFMAcIaMJ6qtDayRCJ3kFaH+N0IsHIhf+ug8IyQp/p7j2x19VXjmf3Lr+IY
	xkL5/N5MFGWNcpQpS/KspQH/LkZ5flksGDJU9xnnDYIJh8oiNIp5ZqZvKD+w/DTI1P45znv38xx
	K5tX0HevKdRm2DhMQN289DIBUPBCAIMFOg6wM8Iuh6bBeZQXtpZZ2kJjTFdYMlkwXHiQjTjGnGM
	ytD3cVbXVSgTmDyjjUtPGliTcx+U4e1v8MDEk00yqWV2JVVy/SSJmBibjgAbLA9YO2QNEjhf9qG
	QpETRjmT5gXp7JHU2eQ7RH3XoqqNsyLiJMcgobFyMUqBrR2FFJ2nv6eKKFakNDhLAjyu5dZC8gm
	BHNRFj9hh0Z1AdVXWqdiyZnCj8=
X-Received: by 2002:a05:6000:2304:b0:487:27f9:83d with SMTP id ffacd0b85a97d-4887171b80bmr11515371f8f.50.1790363186404;
        Fri, 25 Sep 2026 12:06:26 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:25 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:10 +0200
Subject: [PATCH v2 1/8] mtd: rawnand: qcom: make check_flash_errors() more
 generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-qcom_nandc-share-more-code-v2-1-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The function gets a 'qcom_nand_host' pointer as a parameter but it is
only used to extract the nand controller's private structure from that.
In order to make the function more generic, change the declaration to
get a 'qcom_nandc_controller' pointer directly, and update the callers
accordingly.

While at it, also change the function name to use a 'qcom_nandc' prefix.

No functional changes. This is in preparation of moving the function
into the 'qpic_common' code to allow reusing it from the 'spi-qpic-snand'
driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit message to match
    the actual code (spotted by sashiko-bot)
---
 drivers/mtd/nand/raw/qcom_nandc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d7642db2e2df..12bfb14cd9a3 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -449,10 +449,9 @@ struct read_stats {
 };
 
 /* reads back FLASH_STATUS register set by the controller */
-static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
+static int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
+					 int cw_cnt)
 {
-	struct nand_chip *chip = &host->chip;
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	int i;
 
 	qcom_nandc_dev_to_mem(nandc, true);
@@ -538,7 +537,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		return ret;
 	}
 
-	return check_flash_errors(host, 1);
+	return qcom_nandc_check_flash_errors(nandc, 1);
 }
 
 /*
@@ -1181,7 +1180,7 @@ static int qcom_nandc_block_bad(struct nand_chip *chip, loff_t ofs)
 	if (ret)
 		goto err;
 
-	if (check_flash_errors(host, 1)) {
+	if (qcom_nandc_check_flash_errors(nandc, 1)) {
 		dev_warn(nandc->dev, "error when trying to read BBM\n");
 		goto err;
 	}

-- 
2.55.0

