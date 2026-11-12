Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491374;
	b=hQXhxFQYniTP4Y96nZKVYJ2QY8QKw7J86XQ87F/EppFaP4jnkgvk7XXCC72SGS3OAI0W
	 XlE1OCx6DiQZFmtzYpgfb9YFpfu+DJw6FjOR9ap2qTklHVQD9braWg5uV0+Htz7NqF7/5
	 cnx0NRRxWBRaEwtNB8BW27Olvgnr9dw3XTjZDekS9FmU69jDeATlmb8JTxq0TQkSS5CoA
	 RgOVRaTqjiz914N4T90mR5PkpnLnQ9xMxZWGCoDdRNzbjBHUu0kBmYbvyQ2CJBGHl+0g7
	 ZSXK+/ASe3xY95wHogVum73bUpc4UTvMGjUL00i4fxrqVjWW+UJG44ILZoOJ48nx9fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jQ9FeRAXZK1KkJCdEA8O5o1oktiZUjTf4lBe7KLzAWY=;
	b=HuIU2X3JUXJOqBRF1TNLWVeJ9u7S4fTN+0+4C8hZwqWERxkUv969AweLxkeRpKeju7b8
	 Rccf15JsqcldJ0XuqRE2TqpOx9VRxRL3GRU5cD7nfdOgtS9K0eGO9k9gWI4xsipdscram
	 wEmoJXAt01MpI7OBmXQAQcxYdNLfNRV25I6GAtCjrAZ31ZHAax8ASx4nhr/UcvcEr2NxT
	 0yQRYha67ZHga8y7/zqnhkbRXdo9XYFcwdJhVd7Ii5BXkBRXUEU0GHZY2Y0Lhp/bH4dOv
	 FVLSgvjr568cgT945rpJiAgYYNp8G1O3TAESGyoZXL3i8MdM9qmiyfMHwvEgRJRBOuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="G/0APneT";
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02C6606A88A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D02C6606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G/0APneT
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso1499034a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794491373; x=1795096173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQ9FeRAXZK1KkJCdEA8O5o1oktiZUjTf4lBe7KLzAWY=;
        b=G/0APneTalyZHNVJn+Orz7dqjahcrBHq3vJs0ca7CF+dDsWBekJzRxJ7E84Jn6TuXj
         ho/NduaEqmLieP1DbioyaxdUdFPdw1fQc5AqwdUDjXTEZZuh/xUF8scHsmyBkhZ5lhOQ
         gR2Vrbo6QgbNaJGFQz9h6cRGgXwXAdJjCrY23YZCgv31Zztyh8NHF9UflNNn7auHOAuk
         BbaUGUPzOVTD+ZEHKrEEB7E8Axx205z6iAQXz0A3a3QYOKEpx1UbQ+NaLlcFxAimWJXV
         AhUZ3TMPW7QhILA7tbIZ2xS4m/8QdTp1uDcT+kSnNWsXqHQ0jaP2paYGQ7JcMUMkUFrX
         NTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491373; x=1795096173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQ9FeRAXZK1KkJCdEA8O5o1oktiZUjTf4lBe7KLzAWY=;
        b=J8/Onl7o8fk6F9VNyMXKJ7E3uiNL2NMND0pe5txTEwTIiId/WWmt6GrkRzAmqoBEsc
         Zfhh0PRL07NHb6dks71XSxDAu2UG/hC4DDxrX2ZT00x5lkVm4fS+0RQIeYX86TtjuQaX
         lfiybx0ChEhNI7rxQx5Ys2ScsZn8iPs8cOtiEaHpW0WnboEalfAcMH9hOxzvUvUunVQS
         iv8o4foOOrZBSXBBhf++O41oXSH9qdLzzMWCgJ0rGZHISlNWjmDPy8K+sy3vKSNEq6wI
         yclEVAeu7Od4oeJ1jiqU09WjCRPEQLhO1G/lnaJc1SO9EB4g4XejNcvJL+ERQ2snk8HR
         5pqg==
X-Forwarded-Encrypted: i=1; AL+hErF6vO2m3PA3wkku/y4Wc2e8Wu/RETdGdri57EKL0XoneiqKCzc7laFSLGtJs4iBcKRAwyBmGEfKC/nWEJK1@vger.kernel.org
X-Gm-Message-State: APuU4Z8xZ9fdOVIAlQkM8MP3AoXw6sldSXD5F+LFc6Xp2x3pilhTmmBz
	VEO4bC9+aIgFOu55CWiX+3P9knAZA1b4rlocaqgRoElDVjNJObDT5vvE
X-Gm-Gg: AYBFou19LFLG3OiB/SlldLZAQDDzsAGzNzYNzOXXwuhbpDtc+WI2ZKdJ1HXfzX56rRm
	6AuvTYWw+gau9C+Vvtf4n49SuGEWe+/SjTX5/U+VRXaZLjzJSPiQBfFuMb0XG4ako3NA53l/L3J
	53QHECARH6n24G9gDtdvx1wO0uKn8i1rlx5HKXuWPwEZ0U6BhnkAL5s6ccNdsEeOEaOer7PQHVk
	j7hfo2p926h56DZvTaK/tN/VwIBQlt6ac6U3JTbyYwizOSgntA/FD+5Gr+sl5G76la7arbqjhZM
	thWy6YvhH8BHZyZj2vdwyTDIrSrfg07e0c8FkBGUxHzdLg3UTP/kLoF5GhvhWyytgJ1QY9FbDaB
	FSR3yg9hEYyMoFJCup09dv7mf5BDP41tDnNAmBsoUaESUnVioUKxBzAnlrVsPw4Pt0cH85SV5r+
	DPxg4zH5qKlZHYf7cVoGPnXqjDzMj9khKekL6wutRLR1/AcAzhBCZ4ot6IzDfrNwM5eB0ad/fGD
	OVdipHV2WdapJi9svheD57HZ/ds5Z/zTeiOt5v0mE+72+oxeLKbKjCK1nb/QkLKilui8tlHMBxN
	zcvnzRHorGtn7C5cSc0AkiYJyeb6xxMpIT9nTazyOg==
X-Received: by 2002:a05:6a21:4801:b0:3e1:8300:f6d with SMTP id adf61e73a8af0-3f2ff2d2523mr6322723637.59.1794491372834;
        Thu, 12 Nov 2026 05:49:32 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a6c51sm3550580b3a.14.2026.11.12.05.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:49:32 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	jingyi.wang@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	anjelique.melendez@oss.qualcomm.com,
	dhruvin.rajpura@oss.qualcomm.com,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] power: supply: qcom_battmgr: Kaanapali current sign and charge current limit
Date: Thu, 12 Nov 2026 22:49:25 +0900
Message-ID: <20261112134927.95-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

Patch 1 fixes the sign of the battery current_now on Kaanapali.
Patch 2 exposes the firmware charge current limit on SM8550-class
batteries as charge_control_limit and charge_control_limit_max.

Patch 1 has no code change. Its sign is still checked only on the
Lenovo Y700 Gen 5 (TB323FU, Kaanapali); Konrad asked Jingyi on v1 to
check QRD/MTP [1], and there has been no reply yet.

Changes in v2:
- 2/2: use guard(mutex) [Konrad]
- 2/2: return -ENODATA when the firmware reports a zero maximum [Konrad]
- Rebased on next-20261111

Link to v1: https://lore.kernel.org/all/20261016124806.1789-1-26rote@gmail.com/

[1] https://lore.kernel.org/all/0e5b7d2e-e141-4ce4-a873-b65bd9ef3c4a@oss.qualcomm.com/

Joonhoe Kim (2):
  power: supply: qcom_battmgr: fix the battery current sign on Kaanapali
  power: supply: qcom_battmgr: expose the charge current limit

 drivers/power/supply/qcom_battmgr.c | 61 +++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.53.0

