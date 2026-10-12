Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C915363C5F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810206; cv=none; b=i87u+N6C+QxSAgIv6/3ssOAHP4+53lyaLjd0w0iCxTpvv51oEFamovSjXZwDl0MKAWQO5Znk4sau7NBM6dxDFr/bzmWKshOMFTrsBpu8j2m1Lj+72+bFGPpYaw29qvNENbh8y0zV84zV3qguaqgqT92FtCAW/BvmWVs98eyU/hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810206; c=relaxed/simple;
	bh=81EjrDsuc5jeR02Yg18zw0dlV7+6SEPswLXQ0dSABZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MysjSYqNRcDW5nBc/QAwH9AFvYsmx2zkCypcesSeO9EQO3mSs871pn/F0aMoDj2wJafjFbWiLV850hnmePm08ppZvLT5PWSgkD9DYkCiaklDgDnfxmgSZ+G4xdLuMHfWOc/k8Jawjd4kkJ3OsFipMpe9zjVFSTOI5L4BgUTemCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=VJKWhq/d; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="VJKWhq/d"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afbd2c386so928746f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810203; x=1792415003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDN4rkDRcDd7KJm9/0ncoICuBmRQ5PhNK4vBzfJMTiU=;
        b=VJKWhq/dPlPAYhObQPgYLrOSF5wkt6j6sdx4WBolJJbFIhmPQ5hCmwNd9BqEcZ+h+I
         5Uo92QLMrWy9XCcg6NlnueIThKOYkwXdxavoYmH+VK47pAtrxfZSDQFKUf8qlZ61GEn2
         LNynWiHzTMiCvrxO72PwEQ2XpllgUViuHfzMh1YY9jATZUxMroIJpnB8joy1khcKBiqj
         ProqseWSlmhg/kWq6452scCnxVasI3IWKpI8wqX1PSpdK6br/XShHsVgSwHo9qLUkced
         WZGPT9ZfAlhWgnktipgSCE3uVrEQQdioyH6+IYuicln2GjeyPja4Qdf8WIDDqPeC5t/m
         ZRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810203; x=1792415003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDN4rkDRcDd7KJm9/0ncoICuBmRQ5PhNK4vBzfJMTiU=;
        b=KDryA3bX3C2rQlOmJ/N40CXWPcApuU7GfkT0QF86kiA2zTYjU1KJbfxRr5hFKJ1N1T
         A1oOqpNbOnZFANzCPlsvnkg1MbCJDoc7YlkPUq49KX/SvS6VkCVuTt/BT7qWUGvHi6eF
         HBxS/IGDTswuzAOzjSySrH3sTWyPObXExKT0eFdC/kFxY6LfkvERCOJRqwSw/TgYQwLZ
         5ErOKqXfcO7UB9FgNGNvzZD0uUr13eeWtCGaUs9kxn9SboRtPFVH/g44o8Nlyf/MD6FE
         3mvhIxLcehP3Q5kLL02u1X274wUY5mFzlwEzMBb/OEy0yqVRpBW49Gg8F3MPRwWqDofN
         sAfQ==
X-Forwarded-Encrypted: i=1; AKwUvByOernSyEcr/Nx2d2kx9WV/gjz6rRW95l1bzsw310nTLF9Z4WjXFVj8uXGltFqMIx68wfMtkhBkSO2hCrCw@vger.kernel.org
X-Gm-Message-State: AFq9FYIBJTMk/muvkfMwLP0jusbMEC1KPElka0Gtp2q637EwkQurfUCp
	utSvZFi6gE7qJMmHHrn5ljdVNR9jh97uNxtgNl2Op6Jr6Rz3RUK923+cZmP8fQgaYXk=
X-Gm-Gg: AYBFou1bZ90plwmp+CYzmiUixCqProfZW0dDx19Zgmcyo4Y/f2ULdb3ADw0XT9waGbF
	ncbKqSb0dCmqr2r38ui2AfnwFJMx70vZnt96pKYoBmV2ZFCH7RnA1O0KooeYJ9YGaOu7PoS7vyW
	WWajY3NOHhG9KNciTuq1Chtrhx/O0s4dxFN3h0uWHFI0LfnEDYicPsUg+qs602n8f1oOlU+fJqc
	kBN4xkUu09YYb7I5t+1ARF/4CsU/bcolaBzNiUQGWkuZl2E/c4fPyDk7p5whb5HXO0Ws55H4jdS
	Uy0OWzCbN9CEYvK3vFJxk6rNEwSi81tH/zAe6NfKCHUgbBEl0ld2Jtl4VqyjRmnn157jzK8f1Oc
	rz/igQDZhBwqZt6NMA9qb5k4Cef87VJOzVk1Sue6AJwb3cawgipaOpweEB4aoP5sUpM+dB6mEuI
	ro2MzmsDHCxGB3x1/amkl/JkEC9qT6zfe0W/lY082M5FVcA86c8mZ1XWm5WUf0CdUaiqmWBE3ZT
	aCaOybXRCL7B7rqPBBGXfKym2NlKoJtkghhp5qjEIs6d+gcGnFHKWkmvtbNekgC380RbExX7w/X
	XuKK736uXmtxZNEnPDMYZFbkKMZN1d1o
X-Received: by 2002:a05:6000:2212:b0:48c:5cf9:88d6 with SMTP id ffacd0b85a97d-48dba7bea17mr17686645f8f.2.1791810203273;
        Mon, 12 Oct 2026 06:03:23 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:21 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:03:03 +0100
Subject: [PATCH 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI TPG
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v1-1-620ab6f151dd@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

SM8550 has three CSI test pattern generators next to the CSIPHYs.
Allow their register regions as optional trailing entries.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
index 4b9ab1352e91..05101dc97711 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
@@ -17,7 +17,8 @@ properties:
     const: qcom,sm8550-camss
 
   reg:
-    maxItems: 19
+    minItems: 19
+    maxItems: 22
 
   reg-names:
     items:
@@ -40,6 +41,10 @@ properties:
       - const: vfe2
       - const: vfe_lite0
       - const: vfe_lite1
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+    minItems: 19
 
   clocks:
     maxItems: 36

-- 
2.43.0

