Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B19370D49
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583853; cv=none; b=pu8/XbkST6ouHE07zC7620BiuSWG0EpJBV6jNjQlGu1FJtYSsJ6VLfGiISqbrsLC0LLBHGLF4Aj8Xogx6DJaXJbZIeTt82Ry8Sdq5ylV8VvJR+WuwvC/QB5g7iIQ2de3rEICnovodqSwfZ5094YzJLOwoHFFQeWKUk4xDCLZBKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583853; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJ9yy/1BI9riaz8ioiTf97dhofSD11WJLWunfzkfCbpnlsqCShXRVmRHp2+PPgyTimuReoBAAV44meWKN+brmLe+Mav2AulCABQZpHF650x1c1qvCN44re3DL4LpnBNsBH7fp7HGGrQQKTalKH51fyQgss/t7xGkjHf2gjogD78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHNVHx0h; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHNVHx0h"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-44caeb973b3so3281487fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583850; x=1788188650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=NHNVHx0hK/kIBtHgpwUf9+8F/yfx6x1tRtIBQ0mI9P4C0dOVCGfCGIbrlybc3n1Pm1
         gfKkiec3Aaenpwn7cgabZP9EnjdxPhIBamaUgcwH7s/Mtcdqa7SaeexSr+fTfMYjeLJX
         Hr5kS2W/cc9ajAWc71XfISHNx6qQVcg0vCJEKg15O/OC0cN/MKVZo2kPWYJKfN0aH6gF
         Xdqq8XNW6J83tT4y89l3ba50JjD1uhRqDG9zf9C3g4emoZyRw256eNxwgKyIlXY0/VFU
         lr2q2CNMkA6CZozWJxU5g/JYf9c8UTxY+iklq+oK7gtHtk0sE3o1g7vraK12MxiFw1Uk
         +bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583850; x=1788188650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=LseauBtcVebQlP/0lOCmD8Wfdq8biFcbycbZUoswLCwVhFlXrQt3tAqSTflYrdYL1R
         w3yDV9CFuy0tqBQyePFvILJeHH3PJ0e1ODdOjekosK//ul9Pl1rsb9gST3ITosCKwOoH
         haFxijINTRWIrSMXgaERXsqBg9YB6g+hd6ouzjq3b2QMGSaSvSGN5KPxVTmhPXy+MAqG
         DqDhdT6HYjWeOGIB/BgVA0GbFuNDmIEe/0kWwPQK4kgjYJKsMOVLwXFjP0O0BeGwkzjH
         tdDaTSOZDmg90Iv2z5teGoMvSjsvIjACcoFWSuUlQq749Y+OfVTKRby596GkhJ6A2KVR
         NKeg==
X-Forwarded-Encrypted: i=1; AHgh+RodGAQiWXlZr5M0bC56aCpT3mB531+3zZrWeAmeFHeJh17rpOlyGcJavFfFBSmvNy7B25HNtO1Bxq/fW+d1@vger.kernel.org
X-Gm-Message-State: AFuF++mo9SoMaghxdFZJtkCglt4ZsxS+nqKH0YdnPH8beiO4tXUnBYlf
	NwRUNOc0Erq8rMUoFMtLJS538xSVXKWQ4U58nsO1mJmmn9q0+DJ6S0nW
X-Gm-Gg: AR+sD110dCzrGdCzf0tJayixip0jgPtuGZ3Od19hfcvvLaz28sd1O4mHcZXjy+ZQBJS
	WcHa5UZMbdVZ+ubt0uMG89DNSC39j1kwwaI3925unmRbuV8VEXQdpCcz+OqK1aVRYv3DKyGzXVZ
	EAzl6XcCFVG4ajRzYSZ2gM4UMRimYO2pPOKr9mvmyo7CriOmbGRDYSKg7i6lgkZGnNeSetoRgxl
	qAmX/FS7fyPl/wj83xO0GGcEhGvh1pNRifbc8zMgau5waq5+XuddkKsUcdK1inelfX0NCPpjM5j
	SQ0+feN/KP9Q5tk3dYEnd370DTSTXBOhbgm1VnInCrqHBwYaeA70AW8vrpQOkI7loOb+b2gFRig
	eL0Z9JpjNfHJeqeJvggO2cks7Ki9PCST81bcuedZIsmv2ZnlbSV9Dr9OvII4vMSkq3QnThx4Vx/
	qHFDMBQGA7goQMgYKO59PlmBQB5wyBj4rDMODwJVWoXu1gjDbZ5QFkMPF1CA1HFoZfX1ezRwxcO
	JY1+13cZcbR
X-Received: by 2002:a05:6820:612:b0:6b1:61b8:7ed5 with SMTP id 006d021491bc7-6b161b8854dmr20246640eaf.1.1787583849896;
        Mon, 24 Aug 2026 08:04:09 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:04:09 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 10/13] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Mon, 24 Aug 2026 15:01:53 +0000
Message-ID: <20260824150156.1310-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

