Received: from mail-qv2-f25.google.com (mail-qv2-f25.google.com [74.125.230.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C22D37F320
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 01:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042291; cv=none; b=VeMS7o2x2W24id4GZD/rsbQBWjaNuGWBOWxgxXcKMwMJc4+6PK6JyEn3YatKfNh1H2n8n3JmfAEcM3kFVp4LNLaBbm5X4gDw8f3hDXXWszY6ZAjL1dOXOkzNlF7caYd1pxsuWqIPtgDaUFYha89Sl39m6kS8Fdrentnpdbt82I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042291; c=relaxed/simple;
	bh=ulCX9DivHgpW5BC5fyfBvUAv6CGYle6DP695F8lkfbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRw4qUHXFOEQu+9ZmkcjWU32a/hplCHVPn79RsXWuZ8kMlzLY0IndZQ2BkQp1uwRWUKyo50M289ewMT3Vg/GPUM8FwJp2QItRA300lUVTcv55/uGZqtFwqsMXgUkDOSF64eFFqQ7ONp1s8jMCByiF379CrxHOvwcsnDAYveuxt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoVu9IoO; arc=none smtp.client-ip=74.125.230.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoVu9IoO"
Received: by mail-qv2-f25.google.com with SMTP id 6a1803df08f44-90cdfcb5cb3so39233156d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 18:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042289; x=1790647089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90RAgwzAcvrx5dM1biB0Wk1pQcr+1Q3GdANhKbJFQMw=;
        b=VoVu9IoO62zh/PSeLgAr0dFtqqFjfr86F7hC26GYXojElkxxTIGiWZlclkG3Kpx34c
         56VtTueRpQnHUR0J5tNlpxxCh/VM1iU/dYNd5im0ZFX8qfEAydFPSM8z7mNxH/lQ4Oo5
         wVhuIQqvmZ0DHpErmEPyfZber6afrllA8DeU3ULq8R9dTTYP+K8/K3YhXxWEoJt+veP3
         wLdJF/rXyAZfRfxpFlUGGk0a+I4sKm3SMvo18tf2xPjbqby7paDMDsKVJ6DhXlSntSd8
         /jwiJdUO8ezaugXlAZMXG5UIV3oCCM9PbNA5sssCcdyZSjYh5Pd6lHZqNeEPYtu/9lRF
         fy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042289; x=1790647089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=90RAgwzAcvrx5dM1biB0Wk1pQcr+1Q3GdANhKbJFQMw=;
        b=wKlx8ZNCGq16ChrX4nRI2pL1AT6J1XnfUvEwSt0hN+UULEmzCop98ynprEL1cTtgwH
         tb7yphk7EeB1FguiGQkErCu0ikPjhauzRy5XYtPB2tPD23w3JypWj8agOebbjYB4TRQP
         mdsFX3RQeGBpCWgYPSuHchVZzn6UV0k99L8PAQOEVDqFrsp5UBT6lZLE2NrunugrOVb4
         TVh+zsRHi/USscFFBX4y2SaEBV8pg2nyKn4t5xUrGzHaI4Z7hcGRE0pO7p1GMD1VJaQm
         zwpOwrfWz5sTJsMAsN8E0RcPhladaCqM/zVAYYod3m/RaTjbs4kkYqLn5IpjnIdrnDhv
         1d7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzSIs0bex+pvkEQ72JJ3LS1I4ClJ2ZFjsbQ4cXxFsBuEVwa/y1NGi+wxe+rLhsZU1I+VEWP9lqtgleAjjrB@vger.kernel.org
X-Gm-Message-State: AFuF++kool6kIDopmofWdqH2xhn80bD5DnH9HXjTly6wwkes60gMFiso
	+dzj5lmWDXPo4+rWW/rgQKEW9jPbjvn9CrICOxoX4J2ubYRM9ja2iL/2
X-Gm-Gg: AYBFou3T4yVGziYlzhw/J4FhrIhU+j3zLKco8EpCTab3ttjJc1pqHv9B1JVg7RmHCs8
	ItUeE0gNcIatYFUzUCAnSU1HwJYXHyVgmn4mXY1C9fb30kuqyos7yXqONZEarOvB64YXZ3wUPSx
	Lr0jKZSPs9vdKcZcJGy3lW4hHEO121vX9LTvU8VQcDJwoVwZnMQiwGv37pe11d0lkwL6TEriD94
	AbwKm5YG0wIHu0AaQEvYIDJLlbwGykbZhzVL1f+yJx/eUAFVIWM1Tc6LVuZ6HcRbJmfSI5by5d+
	HLm0b+3G2gXx7jEGItGTCIcRLPOTW9t9Rv06qoN/EV3oyYMKqZbatSVCgPrAoh6b6BOGQFrRsJB
	k+420PSg7A70EK1Du6gxmaTN+w6nLXy50SfxN17waf3oEKNTOwTaOiE1zJtiolUhuf8srX45HJX
	WJ5MCN7Z1WH5ezSkhhBnx5Cx0NaWBi9H5SAngCMiKrizUEBgHXOEzl8H3gCIzHXfSKXJvKdOBht
	A==
X-Received: by 2002:ad4:5dea:0:b0:912:5b4e:3df8 with SMTP id 6a1803df08f44-913fc98e3f1mr33972316d6.50.1790042289461;
        Mon, 21 Sep 2026 18:58:09 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140250b82asm4010116d6.39.2026.09.21.18.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:08 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 03/11] dt-bindings: soc: qcom: aoss: Add compatible for SDM670
Date: Mon, 21 Sep 2026 21:57:53 -0400
Message-ID: <20260922015801.32373-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index d2ae2ae87a95..6672f441c20a 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sc8180x-aoss-qmp
           - qcom,sc8280xp-aoss-qmp
           - qcom,sdx75-aoss-qmp
+          - qcom,sdm670-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
           - qcom,sm7150-aoss-qmp
-- 
2.55.0

