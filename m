Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E36048CD70
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312215; cv=none; b=WRk/D1fUWRjLeHbHUS72Ck6qKJdVbTrcbVj19PCrX6Xb3JU1Rb06EiRobI2s1DEBm3hr52AxF5FCth62+WsLuCp87ddZsYNzw66wmwirBwRj5Ni2r8A/OyWSGMRwm3BP4Jzd31Tx4ofXi2/96rpYa+LNbheZt37jbByHPXe5J5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312215; c=relaxed/simple;
	bh=aRikrKedr8rRD84dJqfsSjKHfSLi0ROhZlN789CUbJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJU8SWyDfno1zL4/46PIhzW0DcsvG7n8hxu13MuMgBcoQo3IcEbBHOps0qCoVJyl1+hmVEfJ7lH/c7oPsPE62RzLvjSJlfZw1SNJRJJx1RbbgbU/2H6Y0tdEc1K1d7rr2nYbp7P1NW6oyECelXrs968zxxKzjssxte2eWCX84Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrFkNb2y; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrFkNb2y"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a36982a875so1538144a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312211; x=1787917011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=MrFkNb2yrnREKPLoofaLYbdPF3eSLc6z0drf4TGInqntuKYSeVTppHpl+PLKfTAfMJ
         UDJ4L0/uTAq5htHaZyEAU3imO6M3X/b+1FED34nrJzP9a85pgU9r/tkC09X4RWXn2YMS
         4FuRUaUyY7q/dtI8djMUWgKo8bIxQ0o4LaHg1NCP0dv0wGecSUEbSblMXFl/GrqYcJpd
         W/1RKsOcxIfaqrBJodZsNaY6gti16TGCy/pTW3jLWFaQ1dkp2cuVyrycLaKCnFuk1OB0
         Yw45xuoTTujBAXVwMrC7mcaHbS/oQKHErwvy4dAaMDf13gB46kHf5BuW6gSdzI2KtLqm
         INug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312211; x=1787917011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=oXYZ+/CkVOwKYOPK/127MR8rZuehKYHeZ6Z8cTqwn/UyJJt7+jzMr9tN6a4TDpOV2q
         3ZmDteeluOr+6RyQnrdq4NU1fStZkQrX0S+qubnDABbmZeZtomggKZWnoq106ZTSY93O
         xSFR2jxHXQwY44RyTmrx8eY4kj1TvJsOp3g3r9UY4QYSCAGYEVAXcaQhKECXFmBciMDW
         Jumz1i01I3tM0wMTXkDxrg+eCbEAnrXpRmtgScACattX0vseBa4sOyK59NM8phKLUejT
         OLgfUZ8VqkUNPqEpdxobbWWoZe8j5Hc8Fg5LcHUqVaVEblEFPac1mQcxqFQHTPZ/HXOl
         G4fw==
X-Gm-Message-State: AFuF++mFEgU0Sv5h3DeVvkUp6EMGjmrAFy36ygD3mgwO1QUDgzzFbzPz
	GFEdoJz6MEqi/BCbkJo5ePDM96Eq3JEqmsEjwy1n7zG0X4qemNLaP8Yh
X-Gm-Gg: AR+sD110KrxU+t3r9Skuhc5jIhXy0iTHj6IU9IeYWHghFpV2Vph0QbMgdvbP37gtWsk
	LOr3ONPt7QDprxfxJUzr8iJw4aI+tl4x7VW4WZ3e3Rteca4vpfxgVi3ankJN4lC50wyn8dbkeTG
	xi0e1ZrVwpIbiRs8V4z/7e2jAgfO0WUZvJv60CxwSq1izu589nhn8j3BtygdhOqFvVjjR4OpQiW
	dW9oujRB1xBHd5KU1i3zz8Eg9dN0nahFsy8Yra4aSFxcIiX1m33du0AYHJ8mJZbFSChU6vDV4/J
	K6SZMNimjWTUD7VFjwC+aO7E6P/ZviCxne5rid1XlI8KukdilJJdGKr3Sf9O9yBdfsRkFWBHBZ1
	91Z9tmmZvPh3ua85F+yTfmbMue+Mndqqyn5AzHbhSzECZcwbOqI18+vKdbdVcHuQzjO7lFPzz38
	6EhbKzALHkt5BGqwJY6bJmNiIC0UEnOB8vdMubAvhZqpJ/j436weDN7kG00S7Uh7geu9S0ggYka
	A/wzM4QxUpub/5C/0OtexY5
X-Received: by 2002:a05:6402:270c:b0:6a3:ee5c:8800 with SMTP id 4fb4d7f45d1cf-6a42f1ac2edmr5170860a12.8.1787312211244;
        Fri, 21 Aug 2026 04:36:51 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c3491sm6204661a12.10.2026.08.21.04.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:36:50 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 13:36:33 +0200
Subject: [PATCH v3 6/7] dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v3-6-cd64bcef6e21@gmail.com>
References: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
In-Reply-To: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for Xiaomi Redmi 9T NFC codename lemon which is one
of variants of Xiaomi Citrus lineup based on Snapdragon 662 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 68542f76df30..5363efadd4ee 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1035,6 +1035,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,lemon
           - const: qcom,sm6115
 
       - items:

-- 
2.55.0

