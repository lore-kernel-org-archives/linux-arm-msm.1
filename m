Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018344;
	b=cdIUq1l5EtHEMPePMyiOfnxjc1YmfzEMHcMjOWduCBtGg/j696i7SMWaa/WAYETjcMFN
	 LWvRQuKrjaasGFI9QY9sIXMt7q5INI/ohF61KiH8PxgWKMEWse786eI58v8oxzS0nRxR5
	 lAKjuf6h1RzMPgjw3pP2FtE0Vj8el7RX4Ft0NNYegdWxTQdZ3oyGmCF1VTLMPQHGXLrkE
	 0P8vYUP1emE5CXlvGMrdzXxHZpccQ/Ne950T6ohUvO03uxc0qNQQNMTk484fbYzzmjezy
	 RvtYqgdA8f5aJ+45q5It5MjYz/Pb2pzy2zSPwgwmZ29p3RBZdKA/6Jm1vb1e9qjVeRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HFL+js96RhWUKHNhY7ivcgh9lYpkZ9o/IpqO+CIG0rY=;
	b=YQK065RoIBcWnguKSNtsvsJ9nV+XgkkZZkjse8LQVK1OEureEyc5E4wYfdyRQnsbxR47
	 YUD0GpwU6b4pQZh8xtwGKgvOyR9Yy8Eckp+BobVgp3ERkZqAIM03cWQMT/mKbVDEV1Ng7
	 uy1cMEggzO59RhOPcXd1Z0/RAVFZaATfm5YxQ8xm0RfyKCgLfo1GX0XFkAup/Vvk120RQ
	 +AUpE5SRRKAAFf21cjieIiKWY462Qq+ND+WUXsFx0sjSTbQzR5PT20fqfN+GHGcIjnWy/
	 CdJWBrFXXjlC6hAbMUETW+HAHRhRVjp0xxyyuO5e06MKS6GI9ZR2LDhLZwR81WRlsUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RS1WIsuF;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3749A606A331
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 02:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3749A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RS1WIsuF
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so371375241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 18:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018343; x=1794623143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFL+js96RhWUKHNhY7ivcgh9lYpkZ9o/IpqO+CIG0rY=;
        b=RS1WIsuFV3Zo+JJfQ0Nq1LTxl8pMNv56SomsNARfTMz4rFTCcWpWobBqR7e2nJgfz+
         1WiBN8YHGaI+QlQ2RJtYTxsrZHFqXl7OTDCzOB4To789OgmGhznV64Kw5V6IsoYKfpix
         yu+ja344GTQaER/9Iuc2cfGGyO6XJ3c0PzznQAj97VqoNhCC2rD83yXDvgMLAH5FGz+R
         syInVSEcd0arJNNUXM9/gENtx9JvFBMIgrBYJVoq7R4LtyeGa/pBL/6DVOdDWsqjWraS
         k+IDxbuflUSRrM2GZB211GqttPaz018AtkdU6cy8kZqchGA8cuoDGhDfxv5iUQQGrLr+
         eUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018343; x=1794623143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFL+js96RhWUKHNhY7ivcgh9lYpkZ9o/IpqO+CIG0rY=;
        b=q9D7fnygubKfvd2SPnYbEEQYmQvw6w88dW53WWQu53SgVzd1AidrWwIz+KruJRGqoG
         KhACwxBTFLblKxljcEYdEhIkvs/49NJ+ON4a54jeDhGwSmrztTh+7D4ynZk3i7RJ2x2h
         9QnZZqIYlSMkG0Xav8okzgkt4RA6nkzEQ/i0Hc5J1cgv5hQin6VO+kPxMhV0LLIuvhVR
         1NmlyaAzpf4DOkAqETc6axmK6axucUbyUWwAupJ9y9CKdSf75zZ5dytvtpkSZLGDwPE4
         7SM0yAmEeXapwe2dwnyR4r/bRqiXYQb0MVq9BumRtOlgNXIqHwBgtXeENyOByhZd7yWJ
         4pSg==
X-Forwarded-Encrypted: i=1; AL+hErGZYJHFhT2R2s57nVAiQG9ug86WEKeXOsoN0h8OaoHHpMZhx2muVYa4R2hit5ZRlLdAcuHss5aGdcBqjkSD@vger.kernel.org
X-Gm-Message-State: APuU4Z/FNWvrNOdwSPu1LFLVbzfjxexBvCq3+PEX9o9Uw2NGQKxYw+0e
	ED6ktmUBBDzFk+lGnn92cq/mcnz1vlk/ou5hsOFr34iREyOtgZDskGrh
X-Gm-Gg: AYBFou3ZOCb2JtG/LxXT4l2oj6Vi/MoLMpRBzWZ1wNX5AhO9iOMzdDdsmruquui8Mbh
	JAcl76Y7H4qjMW4dmh/iKME3Ks0iHN74ZnRuOllFGdjsZmc/+PV00Y5lPew3M1d+QrLBi+mARbz
	i3izqwuIcNgGkrGFxQtrUrux1L22U3HVCgoJIUv3LWoZcB8BgGIGK/wsXSeTiFHvnuv3t9sWzLl
	/HBoovaCoEG0JHiOp8ya1rj34mNOwoD5YX0cm5JqQ9PlJci+YGQ+y73gL/7IaEauCMuYat3rhNY
	Ewwj2CHeP+UyThbjmAQmPhunlRUr3vXNOpYOwZU6NwM49nfcrKKPVlTvP914szl9xTEI+mzEQPK
	94CetYYjUDcwveyVHTS1Ff3Pt4ixZmQVJ3Vn46mpVWZ0RxjVL63mYtMPbNNF/B4U4QfFIuFAVQG
	G5kpmGZ2I3KMY8WVW3KSzC+3kQ8caBCEXYpnFMMeLPuzwLze0xJxelyRE9kZJmCoFsri0eZsb5D
	PNKdb/IUzPFn574Lf4pJe1JVYWsC5+dnzRw6kfk2hK6gC0K6uxXYDhSqiSrmC0rYP4y0wlis0RQ
	mxagfDePStNIdoSX4f/M5QD8p3QK
X-Received: by 2002:a05:6102:61d6:10b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d2a526b9c0mr1163316137.31.1794018343229;
        Fri, 06 Nov 2026 18:25:43 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99bae2a7ea9sm3221365241.7.2026.11.06.18.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:41 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 3/9] dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
Date: Fri,  6 Nov 2026 21:24:47 -0500
Message-ID: <20261107022453.159341-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

Add the compatible for the Audio DSP on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 7e8ecae8e6cb..6cac1f77993b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,msm8998-slpi-pas
       - qcom,sdm660-adsp-pas
       - qcom,sdm660-cdsp-pas
+      - qcom,sdm670-adsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdm845-slpi-pas
@@ -128,6 +129,20 @@ allOf:
       required:
         - px-supply
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sdm670-adsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: LCX power domain
+        power-domain-names:
+          items:
+            - const: lcx
+
   - if:
       properties:
         compatible:
-- 
2.56.0

