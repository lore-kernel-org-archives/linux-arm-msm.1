Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669142;
	b=IV17amj3/cTItNBcslQhYFnMfauiA5VkB8JTWjPEboYTvI8gGxfyhSRJidabuIiELKDH
	 Kh0QQxobO5R4beHXXMJea+tqeOKWxdNX8ll/OHst2zJ1zP2d0NH6JmDSn/oizEEDHi9VQ
	 v6wKZjC9vNds7iA92WkGhDyj/gf5CMj+4KGtfp03rwE9cTgWY9NvAbh9xq+Xi/Ewmub/u
	 3OvKhmwex5FFpYbiSs8c0xcmWN6GOc4IPMlXOZ9ljjWabLxRNubMpFttd3CRlQsTLSqPc
	 UvIXk0mz/m0XmtW6IJ6Hgnxknri+dnLkD0zYyqN/MOLvQpPqxiOb49o0dyTUPiExcNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=YzVS5/HGpN/DaVd53jHP5MUxMheKdA8uYgpDt+EyjaNnyGwP7tzY7k+9H+YGyK1KeYcs
	 qo+AlfXRNJ1EL+rb25Clc1BLYgRP05MiuLDsIDO5mH96hjavSD4slrRvrEVBWkJwXnHVL
	 1DMcD1mGUE8bQRZT3SbVWJYy0F+7lHgrlv2aBlRFvTyO2CnT48XG+rIkv9TeCOnkxYY3I
	 UiUnGlLQ9b67fJyw4UOIU97w3ssnAS0JpA10nHcwHuVdClW4cGAW7g94C9OaI7QPQXrtJ
	 Aj5SSOyEN4qIKT9athpMAUvpW9LDoSgBvpEhIBxj7AB68fDKL2l41Azexx13mkcUhag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSCCzsYD;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D04606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D04606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSCCzsYD
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3869f03af6aso5780644eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669141; x=1796273941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=kSCCzsYD7TTe4A2sL6/ycJJjMHyhno0Gm7v4rEASckt7CADBOTSYdgZolwxbk5ly8G
         ysTH5v0qRaf81Vg/CLag5o9PIut2u/GrMvkWnKTP6/Pwm5gX0B1XOgvF9Kk1F0NPMw/A
         gNdqG3H9A56JnEPxB/tym8sSNQ0xdU3BW7VyEwNal/q9VseZZHzJRy4Hn+HzVqHdVpwd
         9Br4aEBGYslbcoSL8Hl1hFXNBFMqN6N7lLK9hsyUVcRR8xaSvrr1nSAMTM4vJ3kRNapb
         X/dkNWOYyYezCQuNUgyh6p7lfHzVVhmLBUcQkl9dZhBG91WDyReJ581nLKjT8E49GXHm
         rX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669141; x=1796273941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=qEqVdgssiDRkcqB5CCLrVgT2yfV360Kf5lte0Saooaacu4/pGtVxmzSb9UJnYeoYmL
         Q3LyYBfvMr0aVaF/nyMc3l5ttfZKk5DY3f+jfMHTqWbs1DUC6GdMQSfcWDWB8zsE5AaW
         Mf9pvb8BIbFeKeBNgngwpj+QSd9lL5qm6iZwseg2SZoGDNoPviDpwvG1JSsudq+RR/qC
         JMOeLKflpC8XfY9PUMMOy5p3QFhSB+nEcVvRZyK9WKxE3JfxAT+QTVTtcvaStYoVdbK5
         NKf6U0UfkOBiQlERky9pSsm+utTS3BGPRqwybjBg/rmH3YafLYCrXvfGUHBbI7XbiGwe
         l2sw==
X-Gm-Message-State: APuU4Z+KpRrtbO4CrOIW8EFjyueoqCRPWCqLe/hqW6JOu2RBfLZZJD8P
	8mxLTGJbnLKe8QU7FawWU4Ie9nFOHY0Hbpxn6gIU/yTnxXlbAeNABfEj
X-Gm-Gg: AZFdTZexUXnAb9FCt2PH0qDbmF6FtExr7ys7fDqHCue2E2K2QeI/Cv2jASZmpnHssQb
	rUoL5tDDIycWZ6ejiPz4lA+KfRkfMiInOdW3v8o1RtjyxhtbTBva8CRmsvu3kN9FHduh2yHtUIc
	U3MeGFQAkQBHdTKXMX/qZu+uqbgVKhq1tK9SDv27vSgV7NomMxiG/hsBLbll8q8f5+vxtdW6UaX
	x/YL/FGMU+PPY+TCawz6iaik3ZesqpwzPzsBxwwAWN1B2uCIHooaFk8+WdyO0nectq/M2gm68qE
	O3sbjlEbSXwvcndDVqgm9SyrTGMHDP4rKfudkUNFZ2Ld259s34JNFawrFVCaWxCwqHxQ/naEqMj
	tl4Y2LBdci/dX222P1k3TZdnM3jr1eqHBVSxLtrRnKm9HSh2Us3zuYlHjzP+osbetRoJ2E2h6Iw
	ZqZ7tMd8iwpsqedLJI/G2PJazDRBe0MVRjnBCPfGDn3bE+A5XqYYv3xDKfXITfkUnrbW07Tgo5b
	tOuej45CFDjJUdk5RVlDIyLu1fV44JTRRFoUNitKgHk61wUZb0328J3qyQfu51ooDfuuQrNrEVe
	2poAxn3Ul5nOFDm+4PwBOEoHHBtgfTL7Er9F3LPdO0ZLNpwntGexjIc2CWXj7Wp9EWD9ucHsJCL
	/frgkzOA=
X-Received: by 2002:a05:7300:cd86:b0:36c:a3ae:936e with SMTP id 5a478bee46e88-384b398741bmr30143044eec.5.1795669141005;
        Wed, 25 Nov 2026 20:59:01 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:00 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:09 +0000
Subject: [PATCH RESEND v15 4/8] dt-bindings: thermal: lmh: Document SM7250
 LMh
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
Message-Id: <20261126-sm7250-v15-4-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=buX/Uir1r9Tf6tM9hX+yZml9fjYOnCxBqpLAg9mgfqPDutjiJqzrSC7fD/1Lls9r89OUWSfqY
 4QvPYYL9spzAIblrGWW8QtgGHnWwsrntmH5gOADX0P6V/5pn1RhOJOm
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

