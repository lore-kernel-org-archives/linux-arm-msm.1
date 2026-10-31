Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445747;
	b=rT4NaCJ7TOwxgg5Qg4Q1vIV2gu5/zPdOszTcYaaf6zcwVlzPdvgRT0vNCgJywGmr+V84
	 kCqXVZ12kyIe813mTpxNdtOdHaiMuVgSY2FL05yWxPinxy+wDkLyEP5srargSpo37wE0t
	 jujn6ZOnJwevzWxI98HMQmxXo7i8gnpQtC7tBSaDlH3sU5tnu+2Yc+7dJRrkwCqUoCawc
	 5JSY2RY+S3XsQLd995GvhNCgr0Z1GJfyfbNk8L1Hwg17EZaD+rMe29fn33Ks1dWj6uZN4
	 oJ6m+F8q/hTo7eGLMWb56H6A9JUNkW8IDxUuGGtWyaPN4NcGYMkacbYSI1u+H3AW7AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tpErthRmnc/Sd165TRJRy3hTqpBnrdJ3knKfPzqq1g0=;
	b=RfFYO5vtHc3JDb9VQTKw3X269AgHl3giswcbFRDsoUaZSLJkNQ1toPHzJMoUEK3xNBFG
	 hI1tYiAIDi2LmiyNx3zc9TZI5fUAZwKD9ZGhq3cGdVimG7MeFXmMsVw8lNY09HxmKGk14
	 zQyHjLvU+soc3PN2B4C9qPxuruEnXeWLQbl813b+Nv6xITAVTqag6Kt1jyuQ2DvLAN/0I
	 3JhwzWJ8b7SWCOShwD96LFXNE6e56gI42z4zfRn8WVXEK3pusovuhcV9aQ+hIsiplBUTQ
	 jYszV+Px4pS6Ynb3pQXeo7SmLTDjzvQXbu7GKythcjYJ68GD/UR7LUWfgqnFCxK0D2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=smYomg76;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC3E606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC3E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=smYomg76
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be41a7aba4so191823e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445744; x=1794050544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpErthRmnc/Sd165TRJRy3hTqpBnrdJ3knKfPzqq1g0=;
        b=smYomg76JlBtZyAHVkitLrlxUqVrHWOxG9QTciE1UGoSL6VtHE7yoLtH8ZrLPOE3ER
         LdAI5hhpM0xD6zCf8ReZkvWqaZ/EsQp9AJw5N3C9PY61euVM/CutyRl6mutSikSNhkzW
         7ODUxC6ClmoF25ubjB0Xf1cuZPhfu8XLXSaSpP1wtEaD0pFAh1fOCj4l2B4VlHbdduFB
         V9mXBkmygJw0oY2gVtkMlCKduJrFaA8lme5PrH/4MBTh2nZzDck6nF4kPj6trRDpdRTK
         qFrVDOrC5RBZ5hzAg63fOqm2dbswqg3Tch6gWHjKeZ/TQZsIuNFY3efD4FSKglhRrNaE
         7Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445744; x=1794050544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpErthRmnc/Sd165TRJRy3hTqpBnrdJ3knKfPzqq1g0=;
        b=S4lJ3LMNQpH9CjdOtzPwHKU/pJUwam3IehddF0cP58ruSQVGBKm3pDF89PQ96JSTvp
         MHIDKOyzsXYgjhdPpzZUXogwvig09znC34oT3wxAfUTVIbr+st2fHok+HdPfNFpBvwJa
         ej70aoR1cW++8Z3BaGKwuPBbtRFchBr4g+/o1T7gM1QSKj7LsnhZWY6+QNSBXPSGIJ3q
         6nEON1J32zHXmKItBT1Vk7dviEhy1Lm2W4sDNFtYcjUe/sf19N6KucGrtWtjvY+O25sB
         vJ5kYMnD1ed1tthZsmzMOHcEsJ9Y57RFsyfBtY5baF1iID7PC109ExVg28hyhQOeOqQD
         G8Hg==
X-Forwarded-Encrypted: i=1; AKwUvBz36l0epyjjt102Y4HP9umavjpkMLhLfK0ri2by0sWF9W9WNIiy3Qb6YXFTiBTX0SpmXKN6wprfc78WzHJb@vger.kernel.org
X-Gm-Message-State: AFq9FYIgDgxJrSdrOdczOxKUb+TMpkwJnODkG8DBWcCjtrkZatZkP9Hk
	ton20G2dCU8ujaSggJifjfTmUuu/mAwpI6s3I+sakUlTpGJhZxZ9vDuhsxmMHZ2uYxI=
X-Gm-Gg: AYBFou0M5nAdyI4rFdYsrNQDRrWPC/AIcdE9FReUWedYsme+kbuuYVL6eEozZCkbsh1
	SWheUJ5U0EBJ9gB1jdUGm0INd1TKfrCpQ0AAihW7N3Xkw83VtqMI21h5cH+/1MvBNF526Vz9bsb
	GOPS0ewNMSDcA/nPdcTYbXo0A1CYwxpIc7y1vKA79gmlqQRYbui27o+FfOu6LpXPndWZ7Bw+AlZ
	6UszBy/05+hukpMSserYlD8kgOUR1mC8EdKERpn0J8h2RlxBcz7FLR8HihfSHzAh3g6wXsxpBr/
	O3Bo7JXni7eueX48z7HcQTjE2+pbGbXBMwb3fvHn5X+TOAGq9TrPIbvVlhPCBYLOkDwWObjVbcB
	CToToWyeZUkRbKMrhE5IeWrUJcD4vQrQ2aAFbkuYNgzpnCjQcHT6wFCQ7287oKtj4LA3zQwetZb
	do/NvUcc4zMSeeFsgrbhoZkrRgeUAwv3ZQdrtlKJXotcNC7KxNGFsGhbJx4C2qeY7vXVS1QR/5l
	zmuQELcALLWouMA+oZYRj1N9RuBGwcLoc6a4Do1fnA0ZuzA6CQgOwLO0pS9KiptPikJzBylJUIA
	djFQHtIXKRjpKDbpgvNgiNZt4BOcNdrBADN3HZflKTwHWNchg7XzWNzpKOPgIxejiQBM8cA=
X-Received: by 2002:a05:6512:3e20:b0:5bf:d237:449d with SMTP id 2adb3069b0e04-5bfd94c8826mr1847404e87.0.1793445744234;
        Sat, 31 Oct 2026 04:22:24 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:23 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/6] media: qcom: camss: Skip TPG if its registers are not described
Date: Sat, 31 Oct 2026 13:21:59 +0200
Message-ID: <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

If TPG is supported on a platform, CAMSS probe fails on a device tree,
which does not describe TPG I/O regions. However support for TPG can be
added to platforms with functionally CAMSS at a later stage, thus
registration of TPG subdevices should be skipped for sake of backward
compatibility with old platform CAMSS device tree nodes.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..cf4687a20dba 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4965,7 +4965,7 @@ static int camss_link_entities(struct camss *camss)
 		}
 	}
 
-	for (i = 0; i < camss->res->tpg_num; i++) {
+	for (i = 0; camss->tpg && i < camss->res->tpg_num; i++) {
 		for (j = 0; j < camss->res->csid_num; j++) {
 			ret = media_create_pad_link(&camss->tpg[i].subdev.entity,
 						    MSM_TPG_PAD_SRC,
@@ -5434,7 +5434,10 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->csiphy)
 		return -ENOMEM;
 
-	if (camss->res->tpg_num > 0) {
+	/* TPG register spaces may be not described in old device trees */
+	if (camss->res->tpg_num > 0 &&
+	    platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					 camss->res->tpg_res[0].reg[0])) {
 		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
 					  sizeof(*camss->tpg), GFP_KERNEL);
 		if (!camss->tpg)
-- 
2.53.0

