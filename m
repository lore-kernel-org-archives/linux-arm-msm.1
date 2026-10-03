Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A714A0926
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050232; cv=none; b=n7NOwWSmVOGkDqo2o+0jqJnrarnynVmUmDcK33ItIuz9F+08jnuFudMSQGFfjf8RPhE9F71ZPnLDBY5jj2eSKF8+HhofYCvPdYAIZudrUeDnTMyDMwhP8wjlf1CO7pU/p3CszmZeJPJUdooEMg/I4a7bPCbc9kQ+ACpJNVkQ8Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050232; c=relaxed/simple;
	bh=tWWkXmcLrU015FJEOBdZfA9EEywm+QdMZMe5B7htL20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdifyYK8wS+kRtJGGAMbjX+V/s0Rxu2IZXo7KBfoz1ycFM+JLaCUSoksD6c5psWRAg/5qtzSHQjtuF3bEb7WFjkWVFRmIzYPBTD9Vh85oqzfDrHxnyYtXDCr7PbHvj3GrkQzlWnlCww8odkJVMabHnHiNxvmaHvoVyCe1on+p3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blCTcA+b; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blCTcA+b"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9178e92b27bso7542376d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050229; x=1791655029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DmBg09oZeDofnXQzFRxcPDaeMRkTYx6eshQQ7dpKQA=;
        b=blCTcA+bfwtE6zYnjTnu1RiP/GjLr5hsYSjRmavCT/Ijp920mVKRPC7vC3akvUhuiI
         +stTe44ptiwlgoBc4BxOfy1kS/BqRCbqAmNb0KX525Pa9S6y6hBMDS7NzW4XUQAkjISe
         J9MsOBMTU24CNr5ELpCGkb9XvfiLF94Vmo7cUoBrxzORjfcLgJWYx7CT2XEGDurUYB2R
         xrdSzWbd+VVUeBaBO8Bxg/grGGMLPE+CY75UuhO791cakmeNv+fBZN+00laKi7+zjhDQ
         AU6WnUy0IeOoSiCqwmbnUN/vCGsinsinBD9ARH4XUqTt+Bc8gjg0mI8CR2Am2YgiOHTp
         P/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050229; x=1791655029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DmBg09oZeDofnXQzFRxcPDaeMRkTYx6eshQQ7dpKQA=;
        b=rLb3P/+eMktWhK9AmwCuY3X/7IMqawIBVB4CyfoUvMNUO27NILicgS4FmaFwphIiy3
         OS0wwWf3MRbT6AiuW+2AaGo/VY66j80LBEy9bZOVXBLR887rCPfSBFl+C9goF35azIqR
         mxxjZ4Qs40CBJViuYdrL4pNL1Z9JT4ljbFvSlrawGJHj+wT6nFxc6dUYPhTMFX57vSjT
         pOwKfKdZpOCvzbG6m+F4FJ2QEway0ubDy6d/Y5weTRFRjIIU4VHDu2dJ+oOZAYAWjjin
         avqtL01KKe2lcx2v+vn0Ou16LIz8JUX+6IhaSx1v2ehElpYA7bD6xQgE4dtjVSU6W+0F
         PpVw==
X-Forwarded-Encrypted: i=1; AKwUvBwd7KaNaAe98eVepm1cKptOEx1YvWGqn2bn82YijL10f7JekXjWamtM4+HZ5/MuswwzuTxzfzDfaUBIFEuW@vger.kernel.org
X-Gm-Message-State: AFuF++mYOneg5sjqXg22WDAJIX280PnNIelDaI9sEdm9Vdo5Y2DbzSnr
	hiPrTjoZSGwESHC8yssLsXCsxl2zKzTZMPRgwl/sgtI/QZlAMiKzf2wQ
X-Gm-Gg: AYBFou0xOzjUOjqO0CA8yvQp5FWA4GHEmv0takrzZoMF/wILIlb17M1GvF3rPKfqYXG
	uHvApVWvUdHbYsw5Qdrj1SXuo99pXEfU/LQiklVCLNIIQsEo5S8Y5KZ3b1omA0pcLPXXibpOJZw
	zihb/XwsZty+n5LQWDU4FRVLeavnyuz88tLAkRmPm2aBsqcyJjjdIjfkdeNmB9KZ2BOJ27P0iV2
	NSmTQFwUrxwbOhqvyitxIBYXB/vFhKY80suxn9IrzVr+PO1Wo4K9J0Modgj9e2Ac4hvwKeVWizC
	fBJCFTeoKTTtQljnqrKYdIO5WTE7eIPakgbg9AhzL4Akb5leu1ytXDPVYeVGh8M5bTRk1KIEhVp
	tDJG4Zgh5r6x77jIpyNn5JAjXfuiYn0WQ963ZdpMlPoVrdpE/lUVuttoHDXqyAToyphYhjepqNy
	uhmicoQk9cVcCOjmknuolk05rxqVOtYAL4kgFLzAGajCnSu+30WfNDa5+7X14kBQcjhUjeepOux
	w==
X-Received: by 2002:a05:6214:1c49:b0:914:525b:8ff8 with SMTP id 6a1803df08f44-9195d15a773mr57022796d6.25.1791050229577;
        Sat, 03 Oct 2026 10:57:09 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b690f3sm48350106d6.24.2026.10.03.10.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:09 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 04/11] dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
Date: Sat,  3 Oct 2026 13:56:52 -0400
Message-ID: <20261003175659.23536-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDM670 ADSP is like the SDM845 ADSP. Add the compatible for the
Audio DSP on SDM670, with the fallback as SDM845.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/remoteproc/qcom,adsp.yaml        | 33 +++++++++++--------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 7e8ecae8e6cb..6cf1f11efe04 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -15,19 +15,26 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,msm8226-adsp-pil
-      - qcom,msm8953-adsp-pil
-      - qcom,msm8974-adsp-pil
-      - qcom,msm8996-adsp-pil
-      - qcom,msm8996-slpi-pil
-      - qcom,msm8998-adsp-pas
-      - qcom,msm8998-slpi-pas
-      - qcom,sdm660-adsp-pas
-      - qcom,sdm660-cdsp-pas
-      - qcom,sdm845-adsp-pas
-      - qcom,sdm845-cdsp-pas
-      - qcom,sdm845-slpi-pas
+    oneOf:
+      - enum:
+          - qcom,msm8226-adsp-pil
+          - qcom,msm8953-adsp-pil
+          - qcom,msm8974-adsp-pil
+          - qcom,msm8996-adsp-pil
+          - qcom,msm8996-slpi-pil
+          - qcom,msm8998-adsp-pas
+          - qcom,msm8998-slpi-pas
+          - qcom,sdm660-adsp-pas
+          - qcom,sdm660-cdsp-pas
+          - qcom,sdm670-adsp-pas
+          - qcom,sdm845-adsp-pas
+          - qcom,sdm845-cdsp-pas
+          - qcom,sdm845-slpi-pas
+
+      - items:
+          - enum:
+              - qcom,sdm670-adsp-pas
+          - const: qcom,sdm845-adsp-pas
 
   reg:
     maxItems: 1
-- 
2.56.0

