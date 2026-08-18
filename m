Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A457E39FCDD
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065850; cv=none; b=bENs6nof3/lXz3Pbkcq6pMrmXraD3NjRJZ+p0C1tgIeweEqJeaL+eF1YagaBSn6PQYUoKWFl479XcSeAiprnJWDdy79RRg3UU2RRHIZ+xr5N9OQsGhkK+6eSUVnfMk6BETfDv04vPZROxVapFUJdzjpP1yUboPGTb9LKiT7+OZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065850; c=relaxed/simple;
	bh=+7pHwsnV4lHrk8bBeQ822eoOERyjkAcl90hyw9Ad1Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dq69kRjpVkb6i7gOH1atkQ7KglNYwDZqeVSz49K0pz48hXuiANtHXVkxgnVF+nudTCXh1NbEeKs8bjBzlJs6t4RyPTwQ7iHje3coQlzpBk5rOM/WLcZUi8a9GlGOI4wAUu/2lNIfH1zOM4nOOuIWRkNnIw7qhUIwO4PgHTz5Nz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WH/J7bt2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WH/J7bt2"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c169ae1cb26so208296166b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787065845; x=1787670645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJ2AQS/8vCTGcQEdQTct21p9QgOdd8opq2N9gve7b/s=;
        b=WH/J7bt2wH+HBMoxP887XG7EtzPN3XLvEbs5iinkE4w01sz3/q2sDXMyA//RtJBGjD
         9sW4NknHMTSDBrGY9m5KM4MoagEF7cHSQh6Jk/ybrogiLMqf2LDXqFePMXRUTQpG9jVT
         Di8n1tz7KW4Z62qS4jLpAvbClMMbB78dYOYkO9WaPgWhMJf1PbdRX7KIobVmy4lhiR8Y
         KdUq4fPLqnyC84Dcwia8KjhLbeT+ONgFZphs7eHXNJZcjJoqf/o4AWIaj41Ao4yf0ma6
         TJpMilqQM0aGm/B0LZrplh5CPSd5NlSiAhp6qyOIu85t5CHBd0MR0EaeRJ5cmUQyKD9N
         gbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787065845; x=1787670645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJ2AQS/8vCTGcQEdQTct21p9QgOdd8opq2N9gve7b/s=;
        b=RVubm0HDvyQ7LwePjLPPSmEkJo+A1HOkmKLa3M14KVR3zdhiJTUCJsg5uCXWES+6Eu
         dKesYAztgjNZ7ADrIefs1xDAIE9VfXvF98YrEgiIBfqGWHwyojN11eUpTsRtpD8oY0Is
         RFRaFTkPCNzJNFILelKD2S3QjF4tM8YsIyJ6/cpfGDRNKaPkjU8XlFRFeQbfX2V46b4S
         awVsk1zOyJZlmFSURWEeJd4lt9dGFxCdCiJOctROPK9CVOrA/nHHj0MAGKqFvyfP1Gzr
         YR2REfPyIkJ235kIoY3Q4rl55nIs0alb/cxcKTvpGCaDeJT9NaM8EvjKDCACH1Kr90Iw
         Kq+A==
X-Gm-Message-State: AOJu0YxT4lFZRs5rIX5tZQP0lCLoUejxvC94MZJbMrolUoETwogVBcq1
	u1nVlLZdmq0aA75o5qWe+MhPMPHQqpFFgeo1BuD0qmOmlIbdEDVMvEL+4o5OxEX/
X-Gm-Gg: AR+sD11yNCuuEua70UmB0GtJ3PteTHPoU26eMi1b5Mz9uYsHfMYAqt3nt9EsVlYXNsf
	qWnkLa5CfDFsS/QxTp4y2wCJbWH1PIGBLCuMKVl5sGZq7Ist1X5qQH8CGpTCs0cwStmjzt4zWCT
	uaRFxh6HG7N6AIufIr8k92oyK0oWGHDZHaQbANiw1pKTRrxOwU9NrvcUbagsugzi566wMozsxyB
	axL0dnpPvcSMr2ycSXBMSbxzmKUz/V47rgTm4hohQhP3vfiyX8J4mxmWTgaQu5cx3Ku5nfOp8pE
	NzO0YcBYK8XTcQUP57FPC5tcJt48v83N/IT988+QKKPLgmEbydvQgDN7pbXfDpC7xXwXrZaWBi1
	W4pPSHBpjylNoV3ou4R0GjgylLQXotf+2MUghTxSvWyCnun/uUSHJeXygZE1mIg3IFLLV4h8p5y
	nlUO2eFhbm+awgTrzjo1b1WMyAJySrspQqlygUXO7XFQjFFgIM9l8iJqqoxvu1pYskYVA7OjBqO
	WIiFZkjYfJR3+cwpTb4jtXUt0Fi2p7VDA==
X-Received: by 2002:a17:907:6d1e:b0:c20:f85f:e7c6 with SMTP id a640c23a62f3a-c218b0b63a1mr487444866b.8.1787065845137;
        Tue, 18 Aug 2026 08:10:45 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe69cf4sm205772266b.3.2026.08.18.08.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:10:44 -0700 (PDT)
From: "user.email" <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific pmic-glink compatible
Date: Tue, 18 Aug 2026 17:10:39 +0200
Message-ID: <20260818151039.409767-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818151039.409767-1-zstaseg@gmail.com>
References: <20260818151039.409767-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanislav Zaikin <zstaseg@gmail.com>

Switch taoyao to its own compatible so qcom_battmgr can select the
taoyao-specific property mapping added in the previous patch.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..6621cb40e710 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -72,7 +72,8 @@ key-volume-up {
 	};
 
 	pmic-glink {
-		compatible = "qcom,sm7325-pmic-glink",
+		compatible = "xiaomi,taoyao-pmic-glink",
+			     "qcom,sm7325-pmic-glink",
 			     "qcom,qcm6490-pmic-glink",
 			     "qcom,pmic-glink";
 
-- 
2.53.0

