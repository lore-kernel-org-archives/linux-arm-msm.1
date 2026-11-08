Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172603;
	b=x5EjT7nifU6r5fKh3wISdV0K4HDraLex57SKv7ZifWyt+tx1wEpKOA7Di4nbGWvwIBNJ
	 pajnZSIrodVbgOKFnRZztTuTeO5+BQZFd2GiZf8udW+QOCwW7I3uIPHAUhyt3SqXMIS9g
	 BqeKv4HEvd4ldmrr2Ks4xjG1KZWwn/1jK564rB0JvI9+blpawLguAcB3KCF6ZZvMjJBsr
	 tXUtDdv+jLhjFKzitj61lPqznPY+s0N0FXBRxJCi0iPuNl6K1LrZLsMWWnfh2lrHpSwZe
	 2hPN+HPPAKTCniHvpYIiR/AxcLFqVS8xg7kn+fqqiCxKmMplAEBA71ezqf4KeDL2nOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
	b=iTReAiEPH34TjveG8xTQjf76JJVApsjLpUjl43ZqnIdujV8I3XrNzT1fO+ujJGYeGLWZ
	 H5ZFmXwv1hVkOTkkkGg+jQYQ/QaB1VMB7+h0vAxdO7bJGtq5QGbH/mySOikHMzs4P5XVY
	 ybQhTZ6K3UhQM9NHNGjSCJhzcbsJnazDbrFpdiH+3k0h1wz5WuZ1WT7ay4jYHu3RogzxK
	 rwexv5FgbgC8q06dQmRiTdClUFXVIXSWtSN5xywRnq3LAUpUOW+oHfoXWocEPjIKZYO/O
	 G8COGpXiVHjPp/PrUw3ksq2QUVUAV22Se6IWtD2Ys6ZjVTv+lC7yyjx8UmTPIEcxiQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bU7xrZPo;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D918606A337
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 21:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D918606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bU7xrZPo
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6df7f544919so140597eaf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172602; x=1794777402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=bU7xrZPocRyvtLJVOnoXh6L/jjLyxq00tlIIGhOgVA3WaAKC17vTodxlJPAt9hWJZ/
         QP9aBjG4hZWizdAZeDa7k+KUpFxwyrU1AK+T5N8QOmmdUmUHBpjetaD50TVGG7UHhDIQ
         nj0f5khFkvExeVTERE8LJ9uYXwGNrn5zkPVcSVsVyTUoP4eVdmkc8GzyayxHDp++uFiG
         Bx7ypym1TmnccE9DhF7ZVSWQIauxUwOcWMZSNt0dC2+F/oqgrQqYCdYvAOel1AW12tSf
         AsXzOCWOmmQNOoc4cfL2RU7qZgmSfiI3JU/pD62B06cpMOCCFE79a62D92eBS4YLAoCf
         OUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172602; x=1794777402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=QS94sdUXOhMdPlxOmgOQ6V4smQLz+jG9pgFrtp7G9RBM9WD/v3kaooh1mlAHbYsxQr
         6akidT1VVk1bon+sneuTnkFOIsGBiL/x/FcEi8XJEDlSEXhPabiiHCGwLK8LIyyx4EqZ
         zU7v4u/KfNa4u3keCuRKrRqzJ4w2nNMbbzOVKeaYYTyG7UGRgw7qT7ZqSflDWvvV7AQi
         FDXmdhtIH8Lb/aIgdx4V1fvArg4FqS/RW1MwEHUFGh9wRVxBhk07N5kW6VTwyzz7IyL2
         wDewNB2sJHHySjTm6/gVOL3rT15ld8IizJpEbFc32yEqkQhmKdQbehykTDb9ZMnvx2Vh
         DpuQ==
X-Forwarded-Encrypted: i=1; AL+hErF7BjoRh3xvfcilJMn/iam7QAFPXgzlEpiFhqxzwdigDW39AuN/IRa8liELO1mLLTAATUESqmbQj0rV8tU5@vger.kernel.org
X-Gm-Message-State: APuU4Z++vRY7oKWy7pI5RDcs65JwwFbYPEtHITB7GywwguYsmD9YtFji
	CVKSJJLJ9dRy6jJXAE1OfYon7tlI9gN+SY5wR/LrKqHQFetj6ghrclgr
X-Gm-Gg: AYBFou1vOPrPsfEZq9HIZ3MOAw42BG7l7RV2luaw9u0UXL1fe5qPn0PA0JkRiq7npSw
	L5YrKQ1clJkYaatIWwmWnnMFNNTMt9gL22VVl6cv+TKaDwP1dazonxiyPWOZ2u38T6wofSONo3Z
	pT1Ybrfse/SbRMeGRQlqWDW/3lZV0fpOfMnO2GcRaAS04sIKBUuvqgw0wMHk79aP2YZcdQ27Qfr
	+SOYFicNPZ0CWxvFbiOwEPVRoBA3QvCuZr3WcRdcW6nVyXLmtJYUXsrooJqvAn/QLOLafj3xEJG
	Rs/wgVZm4fjl1J3oVr1PA9wr89spVXJ8fvmCVRt29V4RiwtOaWiaVrkb+GM0iBrcHAl+dz90n+K
	QWVhpNjHTeshN48H2yTPqBVCVKtmbhTdU3uWuLCc7TfFWFI9yf8RMDFjTgbn89k9H0OkY1r8ZWT
	XLMb2MdovkQolsym1N9HOZG3kc6MKcDEbDXrw6MJjGkIPkf5j+3bBE/uzp8r2p/IeDN/1kCQSpP
	Anfk1IiFc+WDgToYveeUaSwG8ZmD9iUlUu5hbyO/Oo8tUX6p50lra47Op0kFaRA643vnno/XX90
	UEVWAbyLMad7eEs1Tk8KlZP2qCnsrBjtP5er1vaq8lkC1zgJQfHpFQihEFbkiPO7YQ8D3RWyLXE
	k0qCN88FiYG9VmNMgRosCp9x/Gfhat/qDNLdoEL8LoZvlwt9e14/6GTVNZndBD1tBpn5ubVX7hu
	UJ3gkCREzjw9IVyeNk57E6E5aDS1C/yerzoehwZt+6SwdTf8FnMgw=
X-Received: by 2002:a05:6820:83c7:10b0:715:2787:e1e3 with SMTP id 006d021491bc7-7170f2b53f2mr823230eaf.14.1794172602221;
        Sun, 08 Nov 2026 13:16:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:16:35 -0700
Subject: [PATCH 1/3] mtd: rawnand: qcom: parse boot partitions before
 registering MTD
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-1-509f30a9e14d@gmail.com>
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

A boot-partition parsing error currently calls nand_cleanup() after the
MTD device has already been registered, leaving a published device backed
by freed chip resources. Registration can also invoke consumers before
the boot-partition layout is available.

Parse that layout after nand_scan() supplies the geometry but before
publishing the device. All failures then reach cleanup without leaving a
registered MTD behind.

Fixes: 862bdedd7f4b ("mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 2d98f79b492d..f240d1effa04 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2052,16 +2052,16 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
-
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
 		if (ret)
 			goto err;
 	}
 
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:

-- 
2.53.0

