Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D51648BD2B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312212; cv=none; b=iDEU/go84jGGckjloZjgrm/elFZI4EbBd5qzqzjmfRhkFVwydpNIA46T8xG3oKG95iSq3nFwO41obgSL4CgEOi6q5kKJ3OvaN6oHkDNRSP3IQr2sph8E8MSICt5jxXTpsEMU6rA2YUxX6yS/a+0Yskc6PwXGfdS0FrJFen0+dWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312212; c=relaxed/simple;
	bh=240qChyaHcgAIrUoo9v0o8NSZCJsliQZCuzI/589blE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5WWIStU5prjX5Js8GerLKjA5dnyin+zK37dQSBpcsT1nmJPuvL+MZGURqdXXuu63VvBH6FoJ6CRwcTieebgOXKOlHGFReDhrk+lRxq+cHwKhehyASnPUXLIXOPhvj1QQM5M8Zog6lb0bPZEahJPs1lu3n5gvugmu84RyL7RH9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPKYVMWq; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPKYVMWq"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so1290322a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312209; x=1787917009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=HPKYVMWqdrlpxRM4N4RNK6ltl5JL9UdDQ5hOqltqiGSeQ3HknGVYcQPX+fPaK1tWqs
         U/rCJu+RWn/L4fOdNnAR7Z1/qqB+uHYg+WV+ju/I5kN5rGlVRw/xosHPKkRehth+Oqj4
         1IKubAhmh2FZpPk4p4cBbfrG1Xccf8csw12j25nF+8depk8X0mDQ2Jd9EM9mzOfRr5EG
         1qqdRw/XVGYaoEXMoyZT7daePyGbT9P0NRj0s7B42S92MWow7VfnaGMJzvNxbRvYwrYz
         rJgOgRA6Nm+YaAW97dXZE6aTxB3fkDRRXOZDeLnKDMZcGhGbj+lduAaCHn/r/GvId8iX
         NXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312209; x=1787917009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=Y3cZZJpUqsgzcogazf2THO89OVycxFB6wMmGmM8RolA5bPHqCRR5HFDOuN+4jJfoPX
         4Riixu9NliOb1Yi7h39HobP6QPC082jKdbCh66msC6EPZCv2NOktyJJGrLf8omA9dDn3
         GUjzUdZS5x3Cy73sG29kU5S/jgFiWAwsOVE6mjAdpSgrcDWedaRglEkJrFIgZ5sySMzR
         HM1lvW3Acs9iVTzoZjl1NLE3dYKzwNGxSN/cCsDwnTRy7jKoAJtSzWDi72GnENxutItW
         W1DS/hOyiU2L9TpN9mn25gXmqo6CJZIXL7DeNjDiofTUFHY+QfCRnqhQrSxlJOAtn1xn
         10CA==
X-Gm-Message-State: AFuF++lRvVEaMHKKYG4FTpyUf70I3xoRIMk9KXMPkyQ939f8T/yyLskV
	GUbhAAJ1pSKgF4wlAMsDRk86C25RElBIqS6/TXWGDoYWfvhUdeRSiS81
X-Gm-Gg: AR+sD13MBFJY/S5L9w6N9DvvdNZFFd1QJE/H71GmVmoGZFCOKZj2iXPVo+4L9s49yOi
	TYz2duX17fM2mrW4k5WN8ipSuCqs5FT+MnktUcRAozr/MjLannSUYpSUTBvoxhbATtBBAYN3Vqt
	UGKxnAKLPm0UF6WKVbUD8pIINr/JkhTqBRW6IhTfzRnJ4oo/qGKndVOdCOOcNDmleNu2JWgJfZP
	2XBpTKZtbiiN1bIBbxdixK4EWk+NpmjUBiWcidDB/Xjdw9ZEmgeqBEuGMf3VRIOmvhF8RBesOH/
	R9OVKarg6JNf9zheOTC2cLrxaMWiXC2UKeJ7Pgd5fzf8VDSX1uI6MZ5jvTQZjJAvrClTddyGadC
	bjTAM0AJ5f8OTpr5xxwv/QItAQdtnWooaDUxb5S0HJXed9QBKGGIrMIadYjTomzqXAQAPF3F4+A
	YGrfLmq5ivLM5KOiq98T+4P5M4k+Cm7/wsSTaVPzibbs59L/3yxJV0PDXcdI24QAZR0TWDne9O+
	tcmiayyDuNoIbcD5Qm0RVB1
X-Received: by 2002:a05:6402:458d:b0:6a3:87b7:b5a9 with SMTP id 4fb4d7f45d1cf-6a42f1f9d6cmr6197996a12.12.1787312208743;
        Fri, 21 Aug 2026 04:36:48 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c3491sm6204661a12.10.2026.08.21.04.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:36:48 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 13:36:31 +0200
Subject: [PATCH v3 4/7] dt-bindings: arm: qcom: Document LeEco Le2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v3-4-cd64bcef6e21@gmail.com>
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

Add compatible for LeEco Le2 codename s2 based on Snapdragon 652 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 289a3de1d24b..68542f76df30 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -348,6 +348,7 @@ properties:
 
       - items:
           - enum:
+              - leeco,s2
               - longcheer,l9360
           - const: qcom,msm8976
 

-- 
2.55.0

