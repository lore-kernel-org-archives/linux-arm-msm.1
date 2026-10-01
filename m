Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEE73A872B
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858337; cv=none; b=VdJd3kLiM9SNOhVpcKrIYKI2obFi1KzRgy9an1v0L1vA+beNIwx2Fc/M+BmWr+fNvNYCYB4VprqL49FGpHe/HPLLpruIvGibSEq/vT25X5m6fTz3+oGsKiyWwKHHsfBzpUTM3yCq1lELqrCCP2Ktq8CqN3jByRqJgjdUKm0SvzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858337; c=relaxed/simple;
	bh=ijCSYAcNTPTA0wNNkv0J05wEP7LaZbaGGMvktEbc4zI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGdfmnMVGnvX4NH6UDDglM8HzPOn5uYt42aGbcKUfi6f+CiAPOS9GRMvM3se/bBI514+TeI64k+iaSkPvTQh5+BEEC1AYsmw9chcIegoJ/aTTLnDjraMSQrfep8LfGu3OcFIouUr4MV1PiYN2oFuvX9KxdxUSsJOUJuhLuVU7DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RVb6ekGQ; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RVb6ekGQ"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so997139166b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790858333; x=1791463133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CA+IFDE6Us+Oz3DiIKigMOa8DIe8IYh8RuelCKGNgE8=;
        b=RVb6ekGQEkV2OW/TLB24ohpC6fDUj/DclkaeagfP+mW8RshQ/qOdnQLWjFU2j6oka9
         9Sp/tJxRbrjfD9dIaEXJNqSint1s9tTNh52IRGxL58mft4MYKqes8TlPtgeNERTnk8u0
         +pjvm45IcZigNObB/mv+TSXWnh9R3oqi8J1/lmgosAfmYphuV0rR0sE9uWmf1EH8xpqu
         63P92f/LyelRYQEzbOlO6Onhk4Qd/0oWVbfto4poWpHW7CSbShfnkHJD8MqFmPCo0fgW
         ZKRjouLZl0vGEtNX7S8YFWcLNFhtxkNrJF1FvBjMteIHB9wBb1I8JHe/kV/gJs+1Fxx8
         4kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858333; x=1791463133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CA+IFDE6Us+Oz3DiIKigMOa8DIe8IYh8RuelCKGNgE8=;
        b=kF6cgITUv/fkTt1zRhsEVYJGkFE5RHaCqOBrRAMp0DbEiXkqqp77Fu2u3nsIb07x+0
         7bdVpEsm+ChNz4+pn7GJP5e+JF7K7KtM+1EbFsIqRLL9lCGxDfCgkue1SXO/r+5boJAt
         enRwEmi+gprBaJficOBffIlOH2c2g7wYdUT1jle0redroEvUMnb/TPcfBPTK5ECtbzcS
         EnPWpu26MPPG6Xx3CXkQb+lyML5CPNX1Y/iHOHYPiHa/QBAvfuVokhwWnHMoxZG5DmYD
         yS/ZABPpEeXCaVwxd65Rh9AH/dYscFSbRGJMNM3Kkn1xZ9uijLgJaRkBqxmA1qLgpgRh
         M7kA==
X-Forwarded-Encrypted: i=1; AKwUvBzepmFitzmehhWtG0UyEU86mVtdGQk1jtJdsHmP4cM0LtElfkFpHgHfasmQVhyp3WEOBc8xvRO0KxIfjs2M@vger.kernel.org
X-Gm-Message-State: AFuF++mfWqKasHJKO6dcAil185HGoIpNGv3nNf1CUEw0BU0ha3qLdx2u
	DkTbo801NkT69HDX0uiRT+ljq94xYNSvU7ExfL8Kg/56zwbvj77og8Yd+f9JAgj9ZRE=
X-Gm-Gg: AYBFou1wNPEowLmqNA1+4e3A/H8KD4rVv0wmmqyOurAT3UmdNp2J5WvUWnuKjyYsBZ2
	SXKtMv+HA9pCtFPodfP6GNyyRCmpERLZfoTlatpA8Fmxpn+SvYRGh/KhX0S0cCO/nhKE7llXiU7
	vFRNZABLAGwMzMckxu8qE2tXpNQAOs7uKWWCiwwVlzBppVtOapiSJ+24SFp2rcNk5yZbjnJkEff
	DT1oFU8SikPQOeDci8FaZa+CqmeLo+cS28p3L+pVGiZ+0LaHpqTI7cbiZPURGX7UuANuVirTrk9
	4u5300EOgJHO5EK0+ceUHPufmptZYx3pYRsXxhotLRSieB9qKRZQb2F15frHhMmP8lI7OiHehOH
	EekGVsrL8l5PLjGlW7fNeragQxYDszChql9orEIhYVFkpVxykJbJwHdgEwC87ctwWr4m5d+cZvK
	3rWbZT/qnQ1dZEO2P3MSQQfRIzPk5Zql40/iytu7D5yNa+HtGtJ7eTRjUB1HeTlcUNGQdYF1BOv
	LaGZhPka4Z5I96cKPUn3ZWmdDvC7HtMg/Z99CX0usnHMctEb0l2g2Q1
X-Received: by 2002:a17:907:c486:b0:c2e:4705:467c with SMTP id a640c23a62f3a-c2e4705500emr17887566b.10.1790858332842;
        Thu, 01 Oct 2026 05:38:52 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c8ee1fsm150346766b.24.2026.10.01.05.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:38:52 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 01 Oct 2026 14:38:50 +0200
Subject: [PATCH v2 1/3] dt-bindings: input: Add compatibility for Awinic
 AW8695
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-aw8695_haptic_fp4_driver-v2-1-1bd38b1943de@fairphone.com>
References: <20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com>
In-Reply-To: <20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858331; l=1106;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=ijCSYAcNTPTA0wNNkv0J05wEP7LaZbaGGMvktEbc4zI=;
 b=QaRqcEtOjzGLiwdtaz5YVC+TvWDqf5gnDYLqb1W2m7ZkyFILz/cchPg8+XL0McoVPg0AI0rCD
 5eo0xrpA81dAzQydsjVxQxEnv/fcG2q6qvRDiHne6E/BeJgyz9yUKrB
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the AW8695 haptic driver to the binding documentation for the
AW86927 and AW86938, as this binding needs the same properties.

They are not compatible though, because the chip identification works
differently compared to the 86927/86938

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index bd74b81488f61d72b675b5701b321b30b3430be0..d7a2fe62c1b76456b0ea3260172d523f2761ea01 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -12,7 +12,10 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: awinic,aw86927
+      - items:
+          - enum:
+              - awinic,aw8695
+              - awinic,aw86927
       - items:
           - enum:
               - awinic,aw86938

-- 
2.43.0

