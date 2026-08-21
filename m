Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71035367B8C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315840; cv=none; b=pfXNUkQjMTpORhigH6Q3T3MqRGetNRqfL3I5oirGNPUpc1DQcSyqnAZA9+U0N32WOyXeZnhpvWc1mogQzA/BaI7ERHRrXKhJiFk1Gw/vp8yl/lAN+A8vU9UFwTuS+hII1Mv/MLB4VOnY3SPKl0RaIvFr+bksd/Tm99sDy4mu9MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315840; c=relaxed/simple;
	bh=Tjd+qqKRlPATrV03pdQqCuwbNQZAlKYm8gvQMT9w2Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtZKqKvuP3ap7qfhWRWKhAj9Fh6pYZwbgimMDE9pb2VUzynkBUndD+7RRK4PBFFg25pwHcpyXHjrxhOvadHciBiOEGsa0LxOLvgRUHaYr/Q3XwtvEWh7MgWZbS4xQWZPmRcdPcy4umoVJCxaC9Bh7R6XD/i871d1qvMv+5zRG0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fw7dt/Np; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fw7dt/Np"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c214321dc32so187067766b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315836; x=1787920636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=fw7dt/Np97B+uB8XF07hJyCi1Z36S4oLLvsm62THffOHSq36iMkpCWgawjDi4wQRWs
         /vOiP7MetJfzyA4CJvfqH9QaaVobqs9S9z+A3HQs3WaMnKZ9OQ9t7CPcgaRbA4YOo4cK
         CYOYu/R3vn6z6kOe9o5zHaFgQvJdplL4BNTM3iiO8bhzCuBk8Na6HQlYca4ENRFKmm1S
         GtQbTF6cTbt1fiVzzRzsvjetGMl+5fSyNRVs5TdsxKmQ7Md0FLjNKZoCMFCmxCYDxVAx
         +ty04xbW5kCvEJ3gqef4FqMD20CVH5O5jTjIexZtKKTTWHOsrR966sygyvZHtZWBJw8u
         xhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315836; x=1787920636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=cKAg43YF8tF1Kfqryd72NXv1GeZS3pNiMwnJO6EjMEoP/f1vkjKpn5oyqrY/ncAOkl
         s/flnBlTUZJWbdcrv5GlDIhaYZnMG8qgkfTecBquLuQM1sz6oAGr5CN0qPenji4BhKQW
         6SZ7yypUMJxmy0+FHwctDKeW4Lc+lIPxphuaYkqcBFBzAvx//2F3EcBbt6rplZJo3USm
         v+9Roh5yNDzeSeUYuRkOpE9L89GhlYExAwuegEw9cynUeZlOXfuV5zSF/LYfc2Os2EAH
         +rQVUZTX9XSBfrDhsAZYGfjXn23DH4oeTzTrWgmK4ULqCsCA2YGTkwuMORn0i09IBFmR
         uF4A==
X-Gm-Message-State: AFuF++lBG8jDUEFZNcuPG/btvGw6UxzIjkK3ehEHqz+F1YTDxyzjjG3z
	Bz06w+7e7O2LGzbwY0ViaLSZPnT4zLgafumk0G+yqc3oQGcJmYSjT2gG
X-Gm-Gg: AR+sD10T+z8KVuXuZn4AwrnGwAebbe4V0JA6prkl7FNurFlUp+vKKJB3GdB3mi/42vl
	IkQaqVR0BN1MzLeQVbpjE57XBldZfflyR2nEXiK2Iey4arqM4FE1EHsYf6EM8GuP/qWOsG/Lf1m
	Zd++u8yT+W59Dj/irCq+hr64X+pofOEpnCCnT4v9M1+PViRyV4F874bBTBriUt9Iu4i+KCaJAjx
	hJL80oPkHNqotwazIgMOtzPTsPJYRGv9gwPSkpVARm4rhIgTRrrDdx0QQh86pK8in+awFS45gsF
	6uI6RGu4lNKGXMACkRHaNaWSzHSQHAAoy4wTbFdSbj4k4eYIDgP/dd1vzQ3VShEQ9C6g8b+K3e8
	3cjP1/vhPygX/efOU9wEOky3XUJrwnmRZrtEpkudo/xY759iKfb3Rgo3YG1JcmBq6rT1zI35cNJ
	hw2zoFWJPukldVpkbwBP0uvILerEWAUwXv0FGv8AZTTluLWcoaEY67kRpXceIE3rgLoLVQhcaPu
	sG+ToGuO+AEbHTQmrNtPgg=
X-Received: by 2002:a17:907:98d:b0:c12:b2db:873d with SMTP id a640c23a62f3a-c246a2ec634mr725649966b.5.1787315835633;
        Fri, 21 Aug 2026 05:37:15 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591e0397sm451194666b.53.2026.08.21.05.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:37:15 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
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
Subject: [RFC PATCH v3 1/3] dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
Date: Fri, 21 Aug 2026 14:37:09 +0200
Message-ID: <20260821123711.1579539-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821123711.1579539-1-zstaseg@gmail.com>
References: <20260821123711.1579539-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string used by Xiaomi 12 Lite 5G (taoyao) so its
battery manager can be matched to a device-specific variant in
qcom_battmgr.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..8ca057c4e3e6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -41,6 +41,7 @@ properties:
       - items:
           - enum:
               - qcom,sm7325-pmic-glink
+              - xiaomi,taoyao-pmic-glink
           - const: qcom,qcm6490-pmic-glink
           - const: qcom,pmic-glink
       - items:
-- 
2.53.0

