Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25456471D09
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315232; cv=none; b=kcqTuV5qzLLJPUoBHaIKId7woI+s2Z5QzOoZkvi9d4W8VcLJrP+107IX21XbMjwhtGDh1NQ35xM5EWQwJt3yZv0hifMdjzLVItjZvimNb6TIUB1dH8NWRSx3JBQcjwPvA+JElUN/sTcSCEojHxwPSQQL+iqMTj6L6A5Y8Yztm4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315232; c=relaxed/simple;
	bh=lvXJIYHg+Za7wwIfyKwrdptP8jCEhBX03Cv8tnpa48U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ME6hAEelhqsdSUI5AbeHcalDfZPSH4sJcNcK06tiruRX524cKHVzQhKuF9fA2v8xbdBcQEZZ3SzchYtuP+6i4wjuZg8PWfwSkAQ8pw50zZl4uNHl5U8WAToWL8+Xr24vJ5PCUntLgBQmBxeacQFbalZ1zFgbk2OgG3DLo3HGRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyHkRCcC; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyHkRCcC"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so1898390a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315227; x=1787920027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=iyHkRCcCael8ukhCEkpReKwomUTJYsOYZyNYjUguFh3GPp92yFDWuFBJP7pocirwEZ
         HkEbA7qnnG0dbN9lpyfN02h8eCY6iW3BpPwgoNDqrmoeEfPqTb30UnYcQRfbt0YSZ79Y
         PzOjU0e8gYeLuRT8rrgw+c5i7FULxSbUkJv10rFEAcPnSukQHhLjHPd0QCISUKwpHVFN
         dPIOo/Z+0iyMUSeTRRm4dVModRv+TPxF/+IB7NGlZNbtSkNhD3cUzL/7bNnqBxJgIApQ
         OmZehncGz82pUoXosiyd5XEdgyN5UBBIxdZUmM0IjPQLE/X8sDCsyFTSupFWRajaWuTu
         JNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315227; x=1787920027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=dADciN4qUrXOK5q0o069osvkUy/UOxj6hwa7dZLwG1vbkrvG0ak8uzuV8NhoTkXFj9
         sWPK5EgmcMqZaQUXqnLbP1gUpvaUockOPCVNP00TOj9EhBCyLPIpLCD1Mt4/01dAa3o7
         OntCi54ARMF76NG7gn8NtI054QtM69qAD8SanxziZ2CV4P420WoqEU0GoIqdCtPkL7F5
         38f/ZuU5QQCjuJ2Pv39uoVZRb2CSmuyPlqIKakWzS4YFX1mGB4RW/klBN+2T1JTtGYZc
         1UQ+HxkgbZomy8GCxHlnlEDwCNR2kyqtrXV2CK5emLSPApESx1DOJ6GoYHu1u9S9aQHj
         eVPg==
X-Gm-Message-State: AFuF++k8lJan/zs0bXyODK43DB+R5SAHMHOvEHQUPNK/MJES8DXa7kaP
	qxb8DHdS4M9+OkgyA/k0SoHWlT7YUYgmEW/JStadv2SymhQ8f4FJNcZN
X-Gm-Gg: AR+sD13SsVTgKtW8fe65vOntEui6q+kW/RINFBwSXcjUqeG7d5LRJsK4ymaail/+o3u
	Ku62eZSawx71pusKRm4DGe/WFh+xs91Sf20KCrhqgR3VNRJohyFkpAQ4cvwqfGNPr8t+8n5WXGZ
	VWT4RMeHs31THzcBzpFUyC/FNh+JeUvNla3CvDyxVSA8gqPrFtvqE0gVvJiGRFZrhSD7S+WGs26
	o1aFcVGqSTR9pbDL1ytNXeH6XttrpGQC87vvhCeGVTJGgzbDS0AvjnxGAn6vMH74oqApnKdmVob
	qVCNnjopcFxYBLFB10THyiO6kj3+GPkOipncp62koUSF4qkyApKqu4FwCqnH7sVMKyTqCyskYXL
	y8hzFD6vlbwbeuEbCVV0z6A8+4OdDN019jWYIbF1reJT4THx6NGJi/Qj1yOiuDoEIPl6h8AqJWG
	o0YAoEe9MVw+gbHQbMn3z6EZ7pE07y2TfkrEkWSoOXYg6yWdw/UNsFbdQsrZcnUrKhbmkUflo/w
	ruJMqRDnPgYThiNQavvvSmE3dg=
X-Received: by 2002:a05:6402:249c:b0:6a3:71fd:4083 with SMTP id 4fb4d7f45d1cf-6a42f1e930dmr562762a12.9.1787315227582;
        Fri, 21 Aug 2026 05:27:07 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c315dsm6220262a12.9.2026.08.21.05.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:27:07 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:27:00 +0200
Subject: [PATCH v5 1/7] dt-bindings: vendor-prefixes: Add LeEco
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v5-1-ec81cee63e09@gmail.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
In-Reply-To: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.15.2

Add vendor prefix for now dead ecosystem company LeEco

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 136681412501..dd0762d3334b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -947,6 +947,8 @@ patternProperties:
     description: Shenzen LC Technology Co., Ltd.
   "^leadtek,.*":
     description: Shenzhen Leadtek Technology Co., Ltd.
+  "^leeco,.*":
+    description: Leshi Holding Beijing.
   "^leez,.*":
     description: Leez
   "^lego,.*":

-- 
2.55.0

