Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81053D9DC4
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704462; cv=none; b=U4zKpAv2jE353tEVxeE223f0nPFU6EsgC9DkBUGMpmBFW1rAzHOVvud30AaUR6UnOFl2bi6ds6uxIQVUdiFjVkwCmHhkzegr8GAAszdMw4QuXwvh50MMZylVrmaWNdxT2rfYSGy7fG1iqwQD20Y0/q9uf1qZa+WIf/Qf0GmKrUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704462; c=relaxed/simple;
	bh=lZbSOiq6PpWvGtztIT8irq1yq+3657nUu17HzUf8NSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQmyURUNGrG+pEbOre6wcW52ZrVXNqDaAZJjvsqH2DRF+8ZhU0wMnrWRGcnNDB/Uw550QTzPUgNct9niwr/2fSc/onaFRhzZFFIBQsOys/nORtWvZGCaub1wiHDLXUANmwfw6P///BaaRFk/PpTjZvBzS/7CLzOPMwbIQJ+jB3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MjQnovmr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MjQnovmr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48441fa5c37so1828462f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 07:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704456; x=1789309256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFACwW3FzP5DW2PPT2LJDEH+gbA8r2g7VY7yrdZmoeQ=;
        b=MjQnovmrp0G75fBW51H6iZwOZdXdTC3VA2bvbNY9OsjYH5uvYzb3ABE4P1oAhfpEAX
         hMvcnuhrHfD08bvkg3+Jm1xeQ9vjo+MWrBcxGrYXBzGUcsN8pSof7dQv9/yjpamkZ00M
         RVe511hIwV+eiTsLTjURwQomyrBULxMSEjrguM867HRJp4frO0QCSpatKeohrFqanWq3
         ejpL8AE9Fx95r7tJwQ/w0C8VtBhrnqBza3ULYaGmrCjGJ5SJNcawuY5k4iiRGv6CSBI+
         PMW2BXHZ0R7ldoDesIJm33H00IhWW1MmqNT9dweIfzvdPaZtLCVUCa22UycNjYN11F7E
         4UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704456; x=1789309256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFACwW3FzP5DW2PPT2LJDEH+gbA8r2g7VY7yrdZmoeQ=;
        b=Iob5rrosLu8lbHFGvcQBYlaZ1dkRdywVsuUwtIlYSQZCD6rZn6SIB8wtgy+fCFVFaX
         tLlAhCqngqIGIuu/dM3xDmlWt6dQLVh76KlubLLExyRlzKSDn6B3dt6CjbcTxPcBvN7s
         YPxafyqREmoHq0AaJdLY7mcHQeG1vWAQnSJlb4qVsrdJEXWPjb9/ihPN+9tKV4fZeEfX
         qjiNsjWHinQP6y/vzG1OVkJq/3DhHn3LqSuEy5uhScKTYVTQseg9O5wnTzaCa6I/vy6s
         ohZ2zhW2QiBES04KBe/76PJBYAOgdrZT5G5g+UOxaLBDk/EuCRCq/hyT4fO9cCZI9Km6
         1jXQ==
X-Gm-Message-State: AFuF++leuwp/WKLIN0TUas1FBSDH/P2vDnGgXbZFsJtuqwLhWvsJgHCh
	NUCiUixjdKkr5qq10zvhPwtt8Li9Q36BtKtROoc7ex7oXofAV5Wk3SqDfKour5gQXPk=
X-Gm-Gg: AYBFou0qCUEZdzBNrGhIzz4/3TM4+xNfkwueyWrLIpdVtShKIPL+VZWl4fU9YF4b2ZE
	GYyj7VP1QZ26ThP1HN/b1LP1FAyPlS3vm9RGsHXRDwJ7AcpYKyyis9NDGPhWyoPO7RePVwGSXrx
	IcuYhzyx4zkomg8c4xP1SsFCPfzLu1/hYKocIC5zI6jC+cCdHZqecO3q0uVriZ3ImUoIaX2CSuZ
	ZoeOwDcZYXxkZIMiuWvER/2zNEDf46y8s6D1VO81omzobe7NJG2UYbl3bVgBqtSg3HMCaAVdTB3
	f9OEZzlYqvFaIei0KS8cbRryg9ZMvMroWNXIlsn71Rna6OVkCOfqsbJ/0EQymVXqbbwtIIEoc7l
	nvDw8XtmjsSwQWlSdSF6W0AfLE1LS4xf0hN4CK29qpUcD2+h2plt5VNSgu8nxIUwtYbUq2J0hhN
	mhX7jNAgqtNPsvCH7jguMGaRG61DhJeqVQ1CCTegx2Qi8jDqQyggVS3hnj8lvc0biM7Da5xgcw
X-Received: by 2002:a05:6000:608:b0:485:8e4b:3d34 with SMTP id ffacd0b85a97d-4858e4b3ed7mr13628030f8f.5.1788704456216;
        Sun, 06 Sep 2026 07:20:56 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:20:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:46 +0100
Subject: [PATCH v6 01/13] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-1-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=lZbSOiq6PpWvGtztIT8irq1yq+3657nUu17HzUf8NSs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXa/wamZ1Jfho1H3YdsWqD5TFhQwQOgNph7Nj
 ikoZt5V0C+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12vwAKCRAicTuzoY3I
 OlFYEACSsDSUl1fw7qhTLdddK4F2CfiwPiXfk10TY/oAR67bJ3HZHkoZWG4QQagnAkm8bilXU/n
 Bnj9OskDS/Em0dzcpLhfUq1J2GxyafTPJ5dnGlcCWtzOCO6ho8xrCMYrZe23XhA4ZIUju58jZLE
 +2Vnw/7MNzxCeoQlWbPUsIVmgVPx0210ABwQ94+6sr7RG0TCFYOeHEjnQb3r8e6JXNwUO/67yGu
 RJzKn2jgCirNh5oEYYjV9D2YV3g08N8xVk7gsHfaHdTISG3TXryokokwIRoVZ1dMprziYQ2K+xL
 +NL0W22TwpxkMC5XeaOzL+TPDYvOx6B2s0j9MXKTmmThVgd6j4eFjcF9NfgfmVoAG8GYl4MGz5o
 /LF2yhG0zs5bZCfLU4w8Ste3HQrWWnmMrczqQQ5J+8ZZY3iP/Oz2gETRKUgV0e0dt/5O40+SGlE
 2a0bwzZzKDRIxlT4ny8+RjeJ0gX3HADgjS4auY676O1vJzzT+I0HlctABFY+48Jh80S+xgk8itX
 6j31FpfMevJcRohQ2YTZPenUILhcAC0kmzpbpHXk/+YwWa23cL4T8vHkgMZ9o/6E9WXCzTCtroo
 ZBCcVRGDkN0t47DBpwy2WBekjT8h5wXLZA0D8HodzUReEIq2qQWqXP/r7OSUTTe29UwE+fafgyX
 K+Ej1ZsjkhR7Xyg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..126400772d028 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,7 +104,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -332,13 +347,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.55.0

