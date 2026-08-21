Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1632F486BB6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 11:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312208; cv=none; b=OAvTjEO9zgb97i0U9qHQuOzqgUkJcvCjo3z0u+f25KVHtiJQ+JXKDxF6YwMPN56NfF3YLT+0qZRj52qv0cMV0CufhTCFCqxKXM3ihLyD9vUX9IHtSUGGzJeqX1rlgDZqw/SfMss8fzwWxaptOLtjWuDdjnMu3u8pnEQUrDgoj0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312208; c=relaxed/simple;
	bh=AT2nCkqaStkGDkKbRaEEc0Gp/jVkJLnUYFN+MYdaXSU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zme7Ti2qk8K0sRvZPBNJTOZa+dUYxtWGVM5vCrZC79Y8BGpiW41qWPoWDKFnuEzTIUKEkISZ76JcwM7NS0L1sH4MN0+ZZ4RsMRd2nADF7hKnV3uDSZmURO/0WYUhvcHnhKxOyqoqWMVHShLLdXy6Ve51h60Z3XIRUb39Jpz5ZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z75x8hF6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z75x8hF6"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1889157a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312203; x=1787917003; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FEEs/Ed8HmMYsgK4w7JBeJkb9cZhktOgtlxlFJ0RzVQ=;
        b=Z75x8hF6Enf8XvfIYmANNrqp2KrJwy0hcWOd06kIzzVKyuXhjflj1zP2AuDqphW9eQ
         Z38oa2X6wBXEZu3XxDw0Sm7sa2KNqe2gX3xlAHE+AhaarksBNAKY38nlS9U0uQnpsjdD
         9Gyhhieb5Xz/mD/IoE1V7xUkKIn++nlspAwV1ZmF2uxJgL0gBNbNMO8m0EgtC8KjD0Lj
         izr5sA3P3DlA6vvOZIUg04caEbHL5UQi4NZxIHQYwJBH/8ZkU6bWl0ee0TmhMl+StGqS
         1w/iEVi+BsDkuBevdl/PfGddz5wCBNSV9QmCI6jvTKc1pFyLeFtp1WbJs/BFHts3Y0/a
         r4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312203; x=1787917003;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FEEs/Ed8HmMYsgK4w7JBeJkb9cZhktOgtlxlFJ0RzVQ=;
        b=q/D/95lskZH9/zpJ+G4D7ppkkU/24D/ABZwYOcFUHJisaVpkf0VnELGZu0kEekPTvA
         roD5rc6+Ywhwsw5Xle5NyajteHdJD7cy3atFnCQs+ronvW5y0L1OFT/41j2U4dBlFBDY
         UN1sQGj+NUB5Kl68CznddoKjjki4gfMZd1gOVtF8/Ss442jBISvySa0U2sDZxFQ/R+tl
         fQ73lTyJHST/vfEgxIi5BgXQ9579e4nSrhKTtXetJdZYSsHKIvg7w82kzimvwyvYan5c
         ZHJrqpZDA58F7zs1a5CY49L25fa/QgnF5SzJSMxWaiAlQp39MWStzd3ujGLr/qbnqUTr
         RstQ==
X-Gm-Message-State: AFuF++lvwMV2+zlNP11UeDaNa8P6PXXcQ+pHsFaUzu73eKZhpx2v15K4
	hrE8Oqlqm6J2N4pQtX5MfU6wKS8BHiFnYczy9MrdJcHevulPbLXlH38z
X-Gm-Gg: AR+sD10DBtBqe9d3TUZpTW/cdRjzhAlZRwPOsZRFjxPmrwRMxhuCLYT5kKO5vX4/W+f
	1fGC/WPu0dxmnTu15/b+HwD4bgDUso3lhxl15bp2jq5IBRUoo2IMjvnb8BzGsb9aHBvIsSXF+js
	hH5N1xkcKfW1YSWQ1L+Oxkt1u6oR+SLNjE+4UstnVdyR1hQngHohEhDrdEHeB4zkpwkZZCXryHz
	WYzxwvrPF2RAUesWWoXKyWtoGHSOqqjRQlRUoxbzyIzkMV4CK0hJxjWDCTMBBVNwkIvGueDpSl/
	wZwyp3MUcu6vwQFSyVDRi3voqxvvOCrVBglYQ6Kui46LGCHmT+H5vK49BsUQcnxVaJkH0BBMOB2
	g4EVX0bYHkODUuJyU4ugNqo9ddujl0N4I/+FI7lXidnAOHwwYzad/laavxgPSj5uqY3JHVqSy0V
	5V66xZTShr9xJZBsHnD+LPdnowmurQ3B/e3h/zlPA7yOZZ9shoycIXWfEs7T30sZFrU/gJ2M1T6
	zJDZ8GGMRheaCT5b8xHQmTH
X-Received: by 2002:a05:6402:4494:b0:698:b6c8:70db with SMTP id 4fb4d7f45d1cf-6a42f196f83mr6180263a12.8.1787312203110;
        Fri, 21 Aug 2026 04:36:43 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c3491sm6204661a12.10.2026.08.21.04.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:36:41 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Subject: [PATCH v3 0/7] arm64: dts: qcom: Add 3 new devices
Date: Fri, 21 Aug 2026 13:36:27 +0200
Message-Id: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw7CIBQFf6VhLeYCCbSu/A/jAuHaYuwjgKSm6
 b8LddOYuJzkzJyFBPQOAzlVC/GYXHDjkEEcKmI6PbRInc1MOHAJNQM64BzppKPpMFCprbQMQCk
 NJCuTx7ubt9zl+uXwuj3QxNIoi86FOPr39pdY2f1JJ0aBqkYr1VglmRLnttfueTRjT0o68Z3Mf
 2VeZCbAyprVwjZ7eV3XD6GXbMT3AAAA
X-Change-ID: 20260810-next-patches-6ad6d10077a0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Introduce support for 3 new devices:
- Motorola Moto One based on MSM8953
- LeEco Le2 based on MSM8976
- Xiaomi Redmi 9T based on SM6115

Device trees besides enabling most of supported hardware also wires power to
subsystems like MDSS even if those are not enabled to lower maintenance burden
on out of tree forks.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
Changes in v3:
- Motorola One Touchscreen was removed as it doesn't work
- Leeco Le 2 gpio-keys node name was fixed
- Leeco Le 2 volume down key via pm8950 resin was added
- Redmi 9T Reviewed-by tag was added
- Adressed more Sashiko-bot warnings

- Link to v2: https://patch.msgid.link/20260820-next-patches-v2-0-7130d68183d9@gmail.com

Changes in v2:
- Adressed Sashiko-bot warnings
- Added Krzysztof's Acks
- Dropped confusing link from first vendor-prefix patch
- Removed ramoops nodes from Motorola and Leeco patches(now handled via lk2nd)
- Motorola One USB-C connector and FUSB302 is now fully wired and enabled
- Motorola One Touchscreen has been disabled due to panel power dependency
- Motorola One debug memory regions were removed
- Motorola One regulator setup values were ajusted
- Motorola One NFC now have more specific compatible
- All devices now have described reserved GPIOs and trimmed unused ones
- Leeco Le2 added missing pinctrls for peripheral IRQs
- Leeco Le2 OTG is no longer enabled as phy dependency is not enabled(need rework)
- Redmi 9T USB-C connector now is fully wired including pmi632 setup
- Redmi 9T nodes are sorted now
- Various changes to styling to keep nodes within single dts consistent

- Link to v1: https://patch.msgid.link/20260810-next-patches-v1-0-79a779d76173@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Adam Skladowski (7):
      dt-bindings: vendor-prefixes: Add LeEco
      dt-bindings: arm: qcom: Document Motorola Moto One
      arm64: dts: qcom: Add Motorola One
      dt-bindings: arm: qcom: Document LeEco Le2
      arm64: dts: qcom: Add LeEco Le2
      dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
      arm64: dts: qcom: Add Xiaomi Redmi 9T

 Documentation/devicetree/bindings/arm/qcom.yaml    |   3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts | 440 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts      | 441 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts   | 497 +++++++++++++++++++++
 6 files changed, 1386 insertions(+)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260810-next-patches-6ad6d10077a0

Best regards,
--  
Adam Skladowski <a39.skl@gmail.com>

