Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644673EDAB8
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518297; cv=none; b=OpgFH0zhLeYMwPWmqZiHFnVTcfQHnela/UhUmIfq99QOu2aTJTkyhWWdvM07Gwqnn6LR6CoML0YsJWjb8R6Mhi0WxVUdOLQkBsHmN3kbMRKkF0xWAT3wV/OSOSJFIYYruDnss4wuIw+Fh4RZq+KZ8cd2KLIOZ/oMjyBhBFbnsNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518297; c=relaxed/simple;
	bh=Jo6hKbGHkm66l37ZDevFtAWN03dbYRZ9E9ZLUdKNAog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GUN/aByC6xwreD2lhQFX7XBg83yG/ZVkGJ/lmDmkRhti40u9w+2FlaxwcZhpRq2R9unMPB4KLW1unwFOnQzVFGPTStKdHRt7JHZ2yHBWAmNFG1VCPAsXQYtUT54x9WkKvZKFSyTqA8gfa1O83Qiazx2Bg7kHREYsFMYjJcX1+I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHX6xW1G; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHX6xW1G"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f635552aso1743169f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790518293; x=1791123093; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q66d7dJ6XGqTvsuFbKIhtLnO/AdCHdZe6HhcW+GVCsU=;
        b=AHX6xW1GJFcUR0ZznYXj7c09CUXwD41fA3/GddGck6fusgizAsJvlWTkuUC9FE8LMk
         SypbjSRKP94OLftWTouKgkGx5ytIvMTiOsgWy9Eq4w+XtXnUtuSA1aYnyH22a4nWbwB5
         OnDqVctmxEdVWYde7VUrqTwjvunsHRYAGEGYLSDDv23LBPg7ck4l3othzLSHnbc/RykD
         LOQdk9FIfUpqyQqs4uZreiGcAocWrQKVzgSozFq/tdblJuXew1T5EErkwFDIIs+g8QHg
         16+IrtAxgCy/UOVgJxm2KwQACdE0MyIVZPY7ma47dqbpcArYxUZXimwHKtAJ6SXPFDKf
         URTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790518293; x=1791123093;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q66d7dJ6XGqTvsuFbKIhtLnO/AdCHdZe6HhcW+GVCsU=;
        b=YkuuSS1i2kSc0NFMZ4NthkvKLU9ZFFdnXqB/YjjXFeXrl2LL3m/VyOzJdKMHLU4qcm
         +bhZQoqnihA/50k3Bp3l4ZcEJb+UPJQQbQgN314nTsemiW6GgWrof78CMRX3XHnLIkAz
         hnkHQWPtQXXFIo4xjoOqC8dCntru3vKnwXgURb0D1SYsLqNCDi9qQtzKeN1KP2jl+UmX
         qqci/WHBoCb71bAuu1qs6APFUcDoKyFGsF+DfvfrELwQZ+B0aBnTaKH53ACOZ0okhAL8
         eUVIVHqdEzPzWTJcs4fQilZDJ8myDS3F+gaOcXfFrEVnrRWxmTp9rHbD4t0yMzACBymf
         d+pQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9+lgRGTEkkqBeTCOIU7bqUjL2EUgzjJKT+wsAQUH8JQ4TQ/2z0XHtsQi47B0nGpHECp3c8P2fciq7zBC1@vger.kernel.org
X-Gm-Message-State: AFq9FYIn+J/AQQHm0N8Yyg7LWnZGluz1frlZNwBM4RXBuEgd/6voklko
	jZSRLDl4N8MFqdcQSp6yXgKu21/kXP+6VUoE8xnd4Ie3rw0rTHtuxFJX
X-Gm-Gg: AYBFou39HTGoMkTIyD14wKviXYKEFEe6pYy9UdRRWqZdE2uf8lUwdLfh1sNsR3CGblr
	nDb1d6dNuFUcjLzQ6BSVScetAETP+fM8M/NDe7E/0VyY0P1h1kFDcWe0DHb1wQkqnKmWiIrQv1f
	/+ul0PQ2ZRLoJCUW5yzU4R6a+/qSPJFwdc8i/0mPEE1JI6qKCkaQvDOLHJAQUCijqgl6dOufbf5
	sxsrpaAPXmQIOW5qT994jipfNCyBnPCo9pQNkya8EI0+cqH79Tjrk/0Ql66RVzem0DlOKfeq+Ot
	xz1l9pdHzo3DISAXRD7sCTboWahSfItBC51MuuR0WAsrddeKg6WAwBhbvC5xOZlt1Fzv7sNMDkY
	ha3OW3A7BruVihbg1DqiYVxKhKNFCb9/5DDJ6lDKrqsnovLgk1/OmBjWGVG6aVjz0N+f18y8DWs
	QbqOYOrRqSk4BFMj0IO1Upo59ArcoquqcjZ5Q9Y+SLq03d/8PUMDGOsTlw549Zt1Yv1CVdJLhYw
	YQxPVKk18ORqkBuzkpHXGsUFz57nhD90X211Q==
X-Received: by 2002:a05:6000:4703:b0:487:242a:c020 with SMTP id ffacd0b85a97d-48872a5cdb4mr19193713f8f.6.1790518292615;
        Sun, 27 Sep 2026 07:11:32 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a640df9sm19930964f8f.24.2026.09.27.07.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:11:32 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 27 Sep 2026 16:11:22 +0200
Subject: [PATCH] spi: spi-qpic-snand: drop ecceng_to_qspi() macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-qpic-snand-drop-ecceng_to_qspi-v1-1-993e9ec1c2d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqEMAxA0atI1ga04gzjVUSkptHJJq2NDAPi3
 S0u3+b/E4yzsMFQnZD5JyZRC9q6Avp63RglFINr3Kv5uDfuSQhNvQYMOSZkItZtPuK8WxLkfl1
 at/TUdR5KJGVe5f8Mxum6bt5mwiFwAAAA
X-Change-ID: 20260927-qpic-snand-drop-ecceng_to_qspi-e5fb12b5c33a
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The ecceng_to_qspi() macro is only used within the nand_to_qcom_snand()
function. Drop the macro and use the respective container_of() macro call
directly in the function instead to simplify the code.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 9d626cee3d17..40ec6a3769bc 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -63,7 +63,6 @@
 #define ACC_FEATURE			0xe
 #define BAD_BLOCK_MARKER_SIZE		0x2
 #define OOB_BUF_SIZE			128
-#define ecceng_to_qspi(eng)		container_of(eng, struct qpic_spi_nand, ecc_eng)
 
 struct snandc_read_status {
 	__le32 snandc_flash;
@@ -168,8 +167,9 @@ static void qcom_spi_set_read_loc_last(struct qcom_nand_controller *snandc,
 static struct qcom_nand_controller *nand_to_qcom_snand(struct nand_device *nand)
 {
 	struct nand_ecc_engine *eng = nand->ecc.engine;
-	struct qpic_spi_nand *qspi = ecceng_to_qspi(eng);
+	struct qpic_spi_nand *qspi;
 
+	qspi = container_of(eng, struct qpic_spi_nand, ecc_eng);
 	return qspi->snandc;
 }
 

---
base-commit: 926f9c44a76fe9e722180d0804c607c6cf1ebbb4
change-id: 20260927-qpic-snand-drop-ecceng_to_qspi-e5fb12b5c33a

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

