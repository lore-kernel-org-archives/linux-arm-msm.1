Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445761;
	b=3fKUMUkxKJ2zVBnBkw4wAKONX7lmKPrZO5lvdmdcQP/2NFAnsdaHf3wiPl9mbKjusZU1
	 8aASbH+AXMUgERM7Mh1Ue/chy1thoZAzTXjv/2MmsVejXqhofTHAwHmVcFk6Ff8r8p1ce
	 VnNx2F0ihLT+JiKwFNgjCklFKn9jwcuHi7boRl+pH8Y/wJtqcW4avqk+H0/CSKnwo7e1l
	 xU1G17sMhRiAIhXSPomnC053tL3Pv2vkvQvFAfcrzQGfihlk7FNaSMSXLkBlhoJ1P4JqB
	 xQ3kqqGWeCRmzRCwxyDs+UrFc0KDMuV1QYtaluncXxmjRnVJQgsE1Ucd+I6mEKSMXSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oz6HnaVkQNp0wlnmYBqQmR1f2nmsjZ3gtDQXQzDwKzQ=;
	b=TrEATQJOSDU5prmLp+jH9ftH3Vl7ZG5uNblZIVdsZ5939p1VtMQr0JIdyqtPvcdBed/D
	 YI/pqJ1x0WExrfFBOvL3WuaRFZUXPXp0vUTuEeROjfBvQt9F6fwa+G1DJlSixrezvrDPg
	 OBk4KVMKB42bz/WajzXvgYBKgCpzoFZJLwSyFX53zn1uAbj5eNPPOxDgDeiqbjMgt0Z02
	 YYgLTcSCXlVZUmBWnELqvrs0Z43RyiOwqmkCuemCZqALVs/4/w3n/Hq/OUc1y11hQDkk2
	 YWzx4/6QOaDVrgyprkuy1u17IsnKbJMffkSQgSH/axnC8nFrr7QVnaBcEJxuVVpkylw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oo29KnUP;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A22606A320
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 11:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A22606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oo29KnUP
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab35a9d9ceso1994631fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445746; x=1794050546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oz6HnaVkQNp0wlnmYBqQmR1f2nmsjZ3gtDQXQzDwKzQ=;
        b=oo29KnUPaZOU4KVt+d0y6XBTsr0pOWuWjB0K/xrOk2rMsFzRHKI+fkVoPOROmsk+Kg
         tTKq6IgFyCeCbErfG1rBiqrxdJP6wHcE1fFNJo7Y9fSBBnn8tRl06vjmrPZI9DtCaxdO
         Y58hZ/wx4em1g7rrdPI1p9oYDTYgW8kqsvXvFFAYboQu5QGd0PgBXd8oiNF4jLtse82q
         8HvTm9SsN957LsRUrdW4QDgv3aFl2IFp17Kz4xPzT3Gy37HsCaItmvdorXxcOIyucHcg
         gzG4Azl8SJ9EcVphQrXJFcza0de1ZetjOC3jPTEEWaRPfjDH0s/qRLIGbaN1aje3QDYp
         +08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445746; x=1794050546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oz6HnaVkQNp0wlnmYBqQmR1f2nmsjZ3gtDQXQzDwKzQ=;
        b=tQJOrd5G692QIAUwue6Frr7IsYOld2kDXw4U/8Xp69e+tsBctfM0vS6EXO24vVZRZ3
         SUJHv1HFN2/ykJ8xUhqHiZa9/UHHj/vkskWQjke78VgWFECI85CtL3Mek83ze1gCAtXC
         g7M3F5Llk1OgriUyihUSbNlZGGA+O9jv3dEVANeb4dellfmqSC/xslk+5Kvksel1ZfWW
         A7gM7nIvhPlMb3M7MM3Md0gYhoZWIsPFeQTVJx+KMq3eeRdJ4B5vh48TOaSgMyKcN79v
         IafwIVknMxhdQeOh0uQA8K84TLJFBVXXDIhAYrHrP6pnGuYKlgNm3stlF37s9m8/NSuW
         R8zA==
X-Forwarded-Encrypted: i=1; AKwUvBwX1mnphF7yU9/MiY03ruN7qTz8CEV/JeMWl8bkiBXxAq9qK4NlKqtC6in4J+N4Uwb2qEe3fahB1iC70UP2@vger.kernel.org
X-Gm-Message-State: AFq9FYIqLHea5w4n7M4fF0GWa6MckLMgLVOM4CePsUEdj25arlR7pxdE
	MDIDrq2+2h+gSOMH+UDh7uk+yZtAoypGAA8cqlpyM/ruTvQNQBAVivC/RDhGlIRXq5s=
X-Gm-Gg: AYBFou3A5JRZmU3t83jFq7aPZLt6fX1gVrkeYA6VDQr9hr/a2Ujj4L8CNUyzqAHwfaF
	HLIp0BI1UB3QsRXyMSH69uF2OXgmOOpUb/cKziHp4ETt1txfOQUzaR+1iI40JfoRgQ1IwwOoSw9
	UJnCCi4T3+xNKG0TR6E7OlZasu6vz+DCuwBMebZ4Hcjygnez4mb7pN9X0S+OvBlYTO1Dclmiu/N
	JxMUBARlavd23XDKuiCpYGnGFvq/QGHLjVfzVFBsoQMQcrETIM/3USoE7iFlmWwIrRv1Frs/Kzy
	6nOo6uz9H3QQDmzzBuR9kPlVMMP2Aydo2oe0aZ37t+uAGCEb9+gRSa6KoQRbHmPiw60ebuRNnXe
	5JANt+oceKgvDwnA7RjDb9Y5cdssS6m7KGzuNnWt+y1RBH1Z36AGAq1EEyOz3QV+S2UJDNfJGWT
	1RR6ETwz2qT2F8zAqrEGF0eljdV0iVpLLjRjf0E6kH1N4U8xRPYugIHxMFPlvR/FDjePd5qKPJM
	CiJ/DoDq1Vy06gKCrx4DIrhx/7onDfAPJv1R+xXNDArkoFmPe8V4JRgFNfobjK32Pv8cG/21Zcj
	YSTeXIOKzUpLaYhY1mBqzutrjwlfOvhbdh9wdroZMybfUidlGngd1TNMktr82WZhvWsq5g==
X-Received: by 2002:a05:6512:3341:b0:5bf:b963:7167 with SMTP id 2adb3069b0e04-5bfd97a7157mr1898007e87.6.1793445746192;
        Sat, 31 Oct 2026 04:22:26 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:25 -0700 (PDT)
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
Subject: [PATCH 4/6] media: qcom: camss: tpg: Support TPG hardware version 2.2.0
Date: Sat, 31 Oct 2026 13:22:01 +0200
Message-ID: <20261031112203.545319-5-vladimir.zapolskiy@linaro.org>
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

Qualcomm SM8650 CAMSS TPG blocks version 2.2.0 have no test enable bit in
TPG_CTRL register, test pattern generation is started by a test enable
command written to TPG_CTRL_CMD register, which is also used to reset
the TPG. This is the same programming model as the one of TPG hardware
version 2.3.0 and 2.4.0, hence lower the hardware version down to 2.2.0.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index cabbb2638cf3..a83f9a80c2b6 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_2_0                TPG_HW_VER(2, 2, 0)
 #define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
@@ -170,7 +171,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
 
-	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+	if (tpg->hw_version < TPG_HW_VER_2_2_0) {
 		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
 		writel(val, tpg->base + TPG_CTRL);
 	} else {
@@ -183,7 +184,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+	if (tpg->hw_version < TPG_HW_VER_2_2_0)
 		writel(0, tpg->base + TPG_CTRL);
 
 	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
-- 
2.53.0

