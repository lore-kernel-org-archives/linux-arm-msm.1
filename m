Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3454CC620
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 20:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280288; cv=none; b=rzQ+d+YmAfq6iIC/CVJtaZAUY87+KRwT0C/64qcQKAY6S+LbVZZxGkhDgbcfTGIjOKBWdtegp/8dP6ARiQKDtZgD8XcCVO6f8z3p00XGWrCqPsOxPDBGuRn7Fj7Mr1ri3IdJMCbHCZzZEKhKsYJM6VzzLojYlnjwQ+qIvD4f8Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280288; c=relaxed/simple;
	bh=Av98nN80+Pb2BEXIf+JCVsfILJfnVK/WJEoddTboWi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3c809485nOeob4NInWydNf11c+JNwRS7vSvQLpaz+wigjcjcq+k/tDOcJzTWtEETtl+sIKqlXx61HWEFJit1na1o7ObS8eKhcLg57qE5HoNSa/PFnfGq+8lA1OzHxSRJzi+yr+D993PShVodGV4IWLyItGf788KlDkD7Klkfio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgWWu5z3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgWWu5z3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso2671615e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280284; x=1790885084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR0y5oWVOEfEuW6A10hQnlv/3kONdwnVhlYIyafjNsQ=;
        b=DgWWu5z36eQ3MIZRAi6ocbRPSigrcecxc2id3njjBf8FHyxnLe06yoMiYgWNEVfylv
         QDRB689qG9a8H6ujiSaVJLjOY1t4YuHh65R0KYRle02A8vNXw+7bolOiENlIWBohTk/I
         qjL8diMJ/1WjHHLpSDkZqGAltPm7Gb/1JqtLDdqig5bStMWL2ltQQqjiMRVs9G8wt01M
         dur4TOtJJRurORZJfyxPAbt7l3xHMewJZWOdWkn1WtYI6GoPXy5ORP/YDBc7Ve44Nr50
         zg9WsyMY6tCV8P0QaV8gW4gJY0TXYVD9LXexmjnCE56c7rwow28Qy4xhtGOPVY7O9rSM
         avvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280284; x=1790885084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FR0y5oWVOEfEuW6A10hQnlv/3kONdwnVhlYIyafjNsQ=;
        b=Ra6WymK8IasfukDjtQlHOQ6Ad5PTMgMtZWhYaOcYZT9w0cU+5MMsS8GCpsEHlvhRl7
         VNEK8XL1Dg33oFzY120jAHe0nLD8M+NhjkoHIWDJCdf7EAElQR3jHDIgawF2vBs9qwG/
         M7QeKHEw1PQARxd4UQaLhigCAJYgYi2csqpROkpDPasYT1oSFKLrtX9aROV5AmLGbTjz
         LeOAysAoQSBASAHgz7fjnCk6ddzFmTpW9G5j42pQF7JSnItjJ3Mx7xsDfcwdZOc2fGcE
         A7S5EXaZh8Zk1t1WQJ/vCr1cF9zG1K100x+YQYETvWsG+YlHZxx9JwhZaNq2SAT2hJ3i
         tYkg==
X-Forwarded-Encrypted: i=1; AKwUvBzIH7kwWtzSTC97w1aRVNDrpnV3pf3pGB+NwO/Gq/h9yFixWhf0Cv7Gcctn7AgXkEXZWS4CBuLsholmMnlL@vger.kernel.org
X-Gm-Message-State: AFuF++lJzmwC6wOrWn8CI1FKrXadqZtBW0jOPgBbs9MIK1+0Lv83ax42
	eJRigDviXlO2sQkDUqjvBaizVJZk0PiOgUKZdjgvnBcKmOsRcn384Yli
X-Gm-Gg: AYBFou1ly0yqqqY8WBHsUX9F15M4FCdtzHIYTnLOwrTfpBqK6/t/YAntac9WZjDsRk1
	rXD7EB9YPXdfDa5mZMJ7Zxy4sSkHv/Ge6GocIT65vHIkdeS5RurmPWsrDyYdu0Y7mY2fK8nTZN4
	SYjKYNR3Wy4rwxRLIjcC10Zt4lbiPCLVTkcEqqmPqR1OGcgevuI46STi9g/aOUf9Xv0liuEsNAm
	uNIzJL8/GLPmNNzO0Sml4OiO7YaZUxrHy9WEUXVi94c9WmemY1msFshbnS0RrK4LlfSGLdMYGcM
	iw3Yi7Bd5PmnlnxNOrezNTN9xIm7gZvVuAfhagHv9V4sPNkPq5lX9mEQsYJ4mjPO/cNRVgotxWs
	VqDDLj6/GD6F5SAG0L6BgtRJdO5I6hlxo5uVRmvZI3zkD2w77OYRLaLd3J/YrxsTF7yP1kAeCfL
	01LS4I0W9l1PeyP/sTwWMeFCM3iVJgq+mp5Df8KJ2Ff5L9xIWywT+pomgzJ0P8h9CVhFHlA+fCY
	sF2Ma+PlG4E0Vu/1UCr85G6d1ul
X-Received: by 2002:a05:600c:a10d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-49fe8bf91bbmr39325455e9.4.1790280284310;
        Thu, 24 Sep 2026 13:04:44 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:43 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:22 +0200
Subject: [PATCH 7/8] mtd: rawnand: qcom: rename 'nand_stats' structure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom_nandc-share-more-code-v1-7-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Give 'read_stats' structure a 'qcom_nandc' prefix to indicate that
it corresponds to the Qualcomm NAND driver. The definition is going
to be moved into a common header this helps to avoid global namespace
pollution/collision.

No functional changes. This is in preparation of moving the declaration
into the 'nand-qpic-common.h' header to allow reusing it from the
'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index cc1e64ac4245..99fe2c434ce7 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -438,7 +438,7 @@ static bool erased_chunk_check_and_fixup(u8 *data_buf, int data_len)
 	return true;
 }
 
-struct read_stats {
+struct qcom_nandc_read_stats {
 	__le32 flash;
 	__le32 buffer;
 	__le32 erased_cw;
@@ -619,12 +619,12 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	unsigned int max_bitflips = 0, uncorrectable_cws = 0;
-	struct read_stats *buf;
+	struct qcom_nandc_read_stats *buf;
 	bool flash_op_err = false, erased;
 	int i;
 	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 
-	buf = (struct read_stats *)nandc->reg_read_buf;
+	buf = (struct qcom_nandc_read_stats *)nandc->reg_read_buf;
 	qcom_nandc_dev_to_mem(nandc, true);
 
 	for (i = 0; i < ecc->steps; i++, buf++) {

-- 
2.55.0

