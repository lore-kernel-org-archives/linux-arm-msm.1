Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBA133D6CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314754; cv=none; b=PiaV64hYpKK6ZFPYa7i0kGaSu1I5ia4jDCIi6LvIcI9Wl4+vti+w4TriromRtcXHoEtPN49lVWRHNC1xAYzWmYK9Ity/JRimbJuOc3/4CLygwMa04TsRoeix2HhPN2v0uWzVYsTMmPLhe9cfszXuvOAwTzSSP7KHGh7CnA6q24M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314754; c=relaxed/simple;
	bh=lvXJIYHg+Za7wwIfyKwrdptP8jCEhBX03Cv8tnpa48U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f8zGhYjHBpbpxSsgpQv/MkTe+Wcn3Qp9YksMTkVCk+68M8f2w9/MyfMS1Gj/b6iyHE2duyN48PYM3Rjqp8h3MbuG5MRenqGqDds7f419muYOxX8CDyCqbwTV0dYrwl2pWyFxaRIv6lTY9mW+4c+/2EZjT+53Qj58pZRJXP+pC34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ry5RQ+Gi; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ry5RQ+Gi"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c207cb16cf5so151655066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314746; x=1787919546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=Ry5RQ+GiVl+i0Vu0KH1gppmtZbaWyxWzd7SCgbWFpeSpsEuWwqdoaBSrMNBSs7fccs
         Qc75kWBwhiZhP8A6T+rxEak+xZitkxkVomsAluDaqrEXmZ7vT/zxZGtTIWkLlzKX5xnz
         DUkununVm8K+hL+NPxWoE5oEg+mOIfsAd8dF1GB+smUrhCWNTN4m8CUWl3I4OVRxUanf
         wIw/SwY7giWoFx7He42PYU4UsnmRFzWOegs9CFJSTfXVtd0krTu/mxyG/hYhaTgarn4e
         twrEReNkmCHVzx0YDOgD1ysdx8tcYh7h/GX6ugM1Sei83wtDXm+FfFQJL+nZJhjpYA+T
         hmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314746; x=1787919546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=MTEw1INZKg0xfIZjd90F1K/euARSdnUeh4Ld9M9Vkwe1p2GYcL/vqrVtpEppkZpfca
         629wFpFQOtqOhzhbttvs/87cqxW+RqdJ6m49ybYTJmYGxD+FHSKjiQhQVzoq2e8+JaQM
         8zitwAUa0lAthZ3uVErQxXM2+swdUUnF9GZ6cw2oLvpHDlCtMMsjOqYjx0z5CksAmv9L
         fiI5+oIjWDgjuZ9ZqzVKoVeYL5uqspoGE5KzcAOj2n4vK5pgsKTy6+ziELb4cLxZ/iUT
         +Y5z/1uWK57L9wecoMHJ5j5jusuVr6w6F1sXCbSxKWPSE1+dhaUoiJyoC7Z8c97dldRh
         1x6w==
X-Gm-Message-State: AFuF++lh2TALxrOHydVttkau8DYQfxOEv6VXd+Of1rXV+TLD/tLI2Ijo
	pxOJkixQ4/QWjcF4Nuqzb5vjoS+RVfqRQEsOhqz3OnrcryzPlvHd88MS
X-Gm-Gg: AR+sD11ArUXlzs6av/nUc4byE/KygP/5mMB9m1jGlKpb+pg4dShG/kVP5j7aSy1Z1io
	pbIrLORD7X8ODVoxVfeykNQ8nMFUb8cWzSuzIC/NEoaSKXEXyQCy5mJNl9pnxto5Dd5dQqpEJnu
	d8iv7AfgI56dClusgkIGVIMxdV6oTjX2d3800mpMmRnvhgCq+U2GM7cI9IJg+57YOZIHFCiIS3T
	y/bVSzqbd9FXUC2dT94kS4mNV1sJ+VwnQbgUXH93duXQuAUmH60ZzUUjdioGzSOvLCfRHl9q2VQ
	dBn9smRwFleV1CgYqlqFmCTB1bk2TYAu7omjd7YtXwOLF7vRKIGf+2ALM7GBoMbhM+YzAkI45Zy
	YBpFQLCzRkym/d4DKKPptzMepW4ajnRcS1BFAWaPy/EjbdKQmjOHVE/9Z+Tv6X1H5jWoQQ4ANu4
	B61n8cChucNRwn/kc/0lk3kRYOwVAfBRCb6tKd7bjCNCe9Gp1uMFZEy1LlWuP7xq4NEqq+HmLEd
	RkNCsVTzfG67xWCY2Ehmbo40zQ=
X-Received: by 2002:a17:907:d649:b0:c21:818d:e97c with SMTP id a640c23a62f3a-c246a2ceccemr629384466b.2.1787314746167;
        Fri, 21 Aug 2026 05:19:06 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d9df9sm447823866b.1.2026.08.21.05.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:19:05 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:19:00 +0200
Subject: [PATCH v4 1/7] dt-bindings: vendor-prefixes: Add LeEco
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v4-1-7ab02c0d4eb9@gmail.com>
References: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
In-Reply-To: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
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

