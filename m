Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485407;
	b=ipJ+LL4I4vVgBnj+yNafL7/iMMrun4WXoY1mD9ZgRRACoBYOP9GnQhEqmPrBcVB0vUZW
	 pbvfwUzfj4x91BnMM94892m33l10QqPO3CprRgMpt+Mfn0+0Ii0OeE4QTUZjZfS1iLz+D
	 ZbKvzPK5eBKEJqT5MloeBARBXNdDsrzv8oDugeleNA8VcZeSCzz7yhmfaBlEuMS52rum7
	 OUyWKZOdRc5urvuz3lXhByofz36+zHJjJg9gmpljiEmqGVicgk95eYf6IwNBV+sp1Hy1/
	 TAB9dBOp9YZoLNgPr9QI0yTXolUYg9m2FSF4xi0msDs9sAWLu87yCk/gHxr76R++Edg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6VsuKwlRwWJYLAsfMzykziZnzXbEyU4vNFoxq6pdzj4=;
	b=jAoJBAcHTEf0rMbf5JFFGnR+CKSzlEPKTu0NuB8q5SxFgE0z1acCJxWu+K7k3Aa9UmIp
	 7R703ldaJKijMxePacKWIsXjspFLTQRagkalIX3iglCfz6XSyyxowp5x53TOvgQVDTony
	 mvQZBBHtsllz/ZTmh2FDf5y4zjOe1CR3daugkL/DEMSwTkHeH3C93Q90cebt+2BbOUyLy
	 ElJnvUIdaq6tUb861g9bv708r2Bgu/mb+08YJjMxjL4I47z3O/qPXBVwoJvSfNYiPF4mj
	 9jCCsCL3GfVMRi4roM6y3AW3hxNSY2NXYtwlgGG8KXjTebCBL3Yi8oq3SADmzTnkAZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TAXscRkF;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517E7606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 517E7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TAXscRkF
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5365d26ccbdso48740441cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485406; x=1796090206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VsuKwlRwWJYLAsfMzykziZnzXbEyU4vNFoxq6pdzj4=;
        b=TAXscRkF9Yx9KLcAv8IGhP0/4x+zy+9DS5x9iUu9ZnB+ZIpOGR1w+22i1Z0iRAJgFy
         lVOMbiosBEvTShCgO7uRDgbDCGlQgDLwpUlSQboBYkyVgjnNrWRL6w47e8EaN+KSge7c
         +WgICzH1CPR4j/Wa+SFtFGDoMgAGYsoKjzRYiksOGL37i02modDX1lXUL58Qnw0XbZqw
         dhNH/Tl96iERGNyVq9aiHLibJUtEvA3NQEJCEZeGIcxvh7LMrOQsiGx+h9pxivCcwpq+
         4isibU9ICG+cKhwsyqr4oFdZeCNBlt9zknV9zVZ+C23weE76xqvbKtkZFTaYyXP9DZay
         m+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485406; x=1796090206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VsuKwlRwWJYLAsfMzykziZnzXbEyU4vNFoxq6pdzj4=;
        b=jq4kMsA7mV9+LLfrWzdQY8g6VHK5iuhgcvdqLqwrxuV38wrOW5yxg5uKVFJv5YkGGP
         +VcfCa3zy1Fpm4LJYLrI6QOJWQzboeY2hxhEoXJ2FDA169SllLCOqjHkP2ixLyCFpYC3
         ZaKMjCR0Zi7muaXWzwQGSjrihYKPVtBAN9iMjdz3zvoCVn60xh3uA5AuU3FJ93EEnAh+
         vnssy5UxXxYPCGFIm0WSGlNojbduvAuD3pBeRFUS8mAOcvdZrDvFUR3LZdCqJoK3789o
         fcXXuK7uky4NfT+GquSGEzlmpmFY6ra2aUqY9UV/SplMe/Ru4ChxvGu2mMsCeFofkovv
         MdkA==
X-Forwarded-Encrypted: i=1; AL+hErHIGp9HeJOJkJqkb9QYZjg3GlOvHZgPpVfY27KbT4TCIdQsT+4Zle8qFhX9fxvyA6sULpbxP65G9hnKIDCY@vger.kernel.org
X-Gm-Message-State: APuU4Z+16TGVVZWIA846/lg+bwdP1nfZVXtXYISTOHGJkXfa7OCgdUb6
	Tji4muUbYaqMnpvUY4PRSH3YQ4J1hgMZNqvSXp5LdpYCzTZI1c7HGl/s
X-Gm-Gg: AZFdTZfGovN4U2cnP9wA9Bq50ZhRwMe+KxRABhzZv1yjcZAhjsWoTflCuFfRi73UFaR
	BiuY9oGOReGkVw1xRNK7K6NRF4wRA4f5hqMVCHWebYy7SZly7yYaP57lncxUgXbfQ+WRyyhy9BH
	O7DVfN2r6YKTk8owtHZCBCbkx5Ox6bvUnuSElju1+GGbpaLQagAZ11pBZwJZVtfT4RrutRiWQHx
	FsyGE/85L4EfRQgtHmtItIJr+2rwEE6GAJein8UmwnAUqSzLFwh0Ti0TzsxqVdVEY1Zph0ilIo4
	OYQ0ERnoczDW1sgRUIfQwDRzaBc4FVYm/8BmBTGbEiHd6kPPcMt83taf2FxRxxiMhXA9oUz9/u0
	IqnTdiGrc8FwmLMYWIKKGrh9zQT7yZpB3QXsccML8XglOr4QyW+TDa0KCWubb8O6VQfojQIJ96d
	AMuDOaTeQi4UZrwiJNKx+Y7bOm8t42NfaMVMnnCPZUxYoTPpvnokFMgggbN7FGyPkZiHshFM/PV
	XpjuL9f+7mgbCrpk6AOGvfZvFYKM4nU5uoIv20xRBlmq+daXs2qpxa4mCMUnPcpiL1ebKlUtJ95
	I8i1S6UVYaGlflwRcQMoOQgb523o
X-Received: by 2002:a05:622a:2609:b0:55d:6ac2:ceef with SMTP id d75a77b69052e-55d768a3013mr248411801cf.2.1795485406231;
        Mon, 23 Nov 2026 17:56:46 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm115098901cf.4.2026.11.23.17.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:56:45 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 2/5] arm64: dts: qcom: sdm670-google: enable adsp
Date: Mon, 23 Nov 2026 20:56:08 -0500
Message-ID: <20261124015611.187024-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
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

Enable the ADSP on the Pixel 3a in anticipation of audio support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 4ce9b62abe53..2044593c22f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -199,6 +199,12 @@ cam_vio_ldo: cam-vio-ldo-regulator {
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/sdm670/sargo/adsp.mbn";
+
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm660-rpmh-regulators";
-- 
2.56.1

