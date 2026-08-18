Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0476541D221
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040585; cv=none; b=DxGoIdbrlIFNHqL0/uGCXOlrh4AKTK+f3QCNniSdiUQoFQLL5jhcRsZif1BCuIK3AidlwQxs5GV50tQvl8bXGDHe+ax7W09nIZ2dYhpdCWzoL1/VGiQRUA1SK655NvzbzHD2d+tjtCkAZF4EyAUlcDI/2hWN62GUBbtAwrwhVWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040585; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+Psus9nrSPq2Qw91B6adeLWEQPEQoYNCiBRabE0oo7ITnv4b+zaiAuvUfkdbcUJ/vHuwjuuiQSyh9XKUhqouszwNGi2fDT+kKPFyiQI7cv9rzMSQ7+x/QiVif7Vv400P+FNIGDG6VJjiJT5SW+beCniPJfHoCFBSxOn7rO4mvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FF4dQhan; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FF4dQhan"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cab973140bso65764095ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040583; x=1787645383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=FF4dQhanQa80jrhuV8O5EinHloE+L7I9SIrdGbMeow0FtBxQ/1MNZz24ApzJDTPdB+
         gwE9iSNQ2eYHu1a7SOyWGMlSdtEYDoOFftLjKciW03I6Wg2waaZbgvwAW8DnBqPpPM/L
         JicDDisW6Iwz0YYCCK0uwCVxgT1834HS+4IUTv9fNAcQZagbGBMkSGs7w/a7M4xGPgkp
         5DrDSU7IYe6Z2Hl8u93vz95vl4T5hxs/L1rElblduNAqZ0Q9Q4CZGm0eWjsFpt+bYaRt
         JhNuOytstuQJgX8Wsk8YrYCdgs9VJkp2VOlOoPaHdG8Fh8h/OKQh6SZA7QbCwGI5Petf
         Qfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040583; x=1787645383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=b5d33HvKI7MtYFOjv+SDUv1a62sIsmhzuKiwsI2bKe7SeKXxFmYgfXz8vTN46hBhTr
         JXqEO+ncncsbLG36z4YsYhch/1UV86YkDQ9GAKw+lnaTMGOpvnS6KL/sINT9j1o0KZRK
         cpuxOalyopUUnvvKL+O4C2AnOlmPgcbZp9RaVaXWb6woPCJbZsXm+5P25aGGmE9UoF9M
         TxIDwU7KNibX9ssAPJscmcrjLNE4h+XWe6WlW3EVRK6bvwJWetAc7ns6GBMIBn9vFQ9V
         LYFIZYOR+G31O3kg8ddH34T1uIfI+2JqlGqyDBfIigUdILn7GrL65YuDnVbolfzpN6Mc
         hVyA==
X-Forwarded-Encrypted: i=1; AHgh+RpiKSJy7NFTVsrrOBiwXLKyC6QOc2F8k0Ot3GufdipnW0xR/zh+dzYL0U7QUjFU1e5n5RnStEBBPxng/wYO@vger.kernel.org
X-Gm-Message-State: AOJu0YyxKkJkY11ecTLoJwvDT4PuHy4bAm4rcKE6Fl2oVt7Bcq0OKBlj
	thib8CZK0sFmpSDNHUXvwEek/7OWh+w0W9WoKmqL6FKkk0B7fx5XwN0B
X-Gm-Gg: AR+sD12y9ehUcMbNAW1I/TXJfC3MQA1d+Yg9kLfKgM8V8yaVRDT/+FsvhjdpEpInizk
	XzZvUvvo4ezVI6Gm4I61bIpvFp5BdW10fXRNagbZIm1m+YuDt7c0PCa9FTZLAqeFp4qmQy3XsAk
	utSmikccen8Bei2hSgmMZ9voGG/Hc3/ah2AriQ9leCPQqRnLGR7rM3Aba4weIvIPiZMAgld9Kj/
	IHe54TxJvwDTTQlHVQHA6ZoRFjujaMK5nM0vCN4ymVS1tXeUWhkwavxzJnfT4Ccbas1iFCcuZRn
	VwMM9C+T/BYutDAZJ+JFAsDweQfpHvrCQZLA9xpqj/HiQ7uIIumw1WE/50+1lmlfHrxJ1Abhe82
	pqsKcX2mipfEuLcqY5HZL7GAkj4c+YMGmNxQN44iAj9I7DGpQpgyfM8wBBVN0zyL+90uwcimWct
	B57xGwX79uVw0pKvfnZnsAawtdqpdqgRDDSGcIrdr/SAS2IheWXBSgKXix+YxGYnNeZ99MMf/l0
	cOx7wI3AgE=
X-Received: by 2002:a17:90a:e18d:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-3933b764d23mr35772186a91.8.1787040583219;
        Tue, 18 Aug 2026 01:09:43 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:42 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 09/12] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Tue, 18 Aug 2026 08:07:51 +0000
Message-ID: <20260818080754.4362-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

