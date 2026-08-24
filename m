Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DC7321457
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576776; cv=none; b=M7QrOPvauRRlQxRCY6PvHdZt6eWh4gKUCe5yqhljD52jVXdAFIWiEp1+0OjOe1vlpobVPBcjRZOHmVKGAFZKirNab7+Bn4p+w3HpD2X356aIf++VusHQIBKqnCdhDJQ5vPGkpSmcSpGUDrmwqxttJNZMzCkJGa0QsPuwU8KhG3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576776; c=relaxed/simple;
	bh=jKh+XPUoJmr7fIpNbx8/2EaPd/67MsZW4ebNDZ/8MPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrgYVM2z1vGo44ZyoEkHg6Xu/8P6rEZkmMMnwT1XkF6iwQ2Ny/4tuhbuUZodFKl2Gn4HrvMpSqxT5swBLEoa1h5qnaAkpyRLYUPLBp0wXv2yFCsbiTJuHXqEnUQDbrsa0tq13+j5drwsi0hMX3pPAdjfVyjnVdiu2JWa5AAUSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZUZvbRo; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZUZvbRo"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so3255574a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576775; x=1788181575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=EZUZvbRou2Xr7NLyyOa9VczdO3YZSlEpiVXkPK6fzNAWVUvvpEoUZvFTezWV5v7ktJ
         jFoHb/9DORa8sTyg+yTNAoaXxgugfUDmdNCji3q8lMjHUjhR5C3Ky84112zZ9Sd0BSG2
         iaAwT6u6mXQVshuR2/o6QIpM8gRpoQThnOmtFQqnj5+0ztiSW36YggHoY1IFmsIZ2f3a
         RbnIC8qaw0p/pIi9loXDuIMKkLdVKIHqg06jXLEYg8+NsDI9TWDMxyPVTjGNJeLhL/si
         jxnyrtQkk+whJTMP3lnQ8/E0cB+fECCNSgKSA3y6hSXx8yFq+xEA01hu/Q6gGWYowr3v
         AiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576775; x=1788181575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=eZiy5xY9/ZgpUDqK0/BzWRl2zIvi1nDLhLqS7M3be7ZZKQKKIU/hhUqnFj1pOWVElA
         Hli7G08uyRXdnkzPYUPCj04swVMdjxbUiaAdsS0WM5GfyxX00rYVoGmd1WnowlN6xKyU
         kmGgBtotRy1GpvOrbHRb8yy4rx0pQoOxGEpBGTXUoh4xLr8CR9c7CPSdSLJhO4Ko+bVQ
         JEJV2VcWdrsUpBNL3eyBegr1JxlQtHrDvTCho9VTkIKduUTXm2yL247oizwa9FFOk5sM
         IsidwRF3jjEng0pJ3Qjf6w3kY5ra4OwBWZtCLmXGxsmY6P8mtTKieVnQk4ZA0oO8TgiD
         ycug==
X-Forwarded-Encrypted: i=1; AHgh+Rqw2IbsurChkgwjeD94VdD9dQhtAxlw8TD0cdxHFeNc+ltJBEzMJTajNe8OzHsT/Q7atQ5v15WklFYM7FG0@vger.kernel.org
X-Gm-Message-State: AFuF++n/qvRdI//unzqq5GDZI+cTw8NlfxOKboZkhteHgxdkrye0rikr
	ocMAcHg079++wMogmY0IfgVr+wk6/zA07bRLBR+8eiXG4+ihhKB4NTRE
X-Gm-Gg: AR+sD10aU24mi4oS+bKKBRKB8r+EwK4zSfjaiTMKeN+J468FP+cuxQyc6ejyOyljLuG
	o/Bun52psEWSBrnc4ku+fAj3rRpivKE0vwh0P4KAyzqPAL4L8UbuEEaDcXcvQC3PMWb4mwXWdDf
	3Qsq06NXsXS6lbrzB200rJ6iPBCBZ4GHHmsRcbTDHeOZ9zYU8aK62qceeVxkAqlmTuHnD1/LeP6
	E58WLxtNAROLugrJRGIvd01BRoU1fmwuO/EZFzUEhOPXEe9KYgCpz3sdoeZngBcSCp+/lQl3tGz
	BkzmsKMWRxaG08sWXmp8ksuYji5UWowR9BlcxlIaOdzlkufy3GmQnCbKjGSLgagimQqf6ek37Vc
	lhytK1XERXVe7/ey00X/JSVGyMjajbE5Y7nyVlixkQfX4MnsdQc2USYkXXarT5tB9qxHJitK4uI
	RInAIKrCba2OQO8shPATAjAXv8tUnTJZA6Ml+g+9cV6lToJHr9RdnhoXSvDCRT1xCbbcPW4MjRe
	nN/ZRikmqYi
X-Received: by 2002:a17:90b:524a:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-395a07022b9mr41041319a91.18.1787576774842;
        Mon, 24 Aug 2026 06:06:14 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:14 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v5 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Mon, 24 Aug 2026 13:04:31 +0000
Message-ID: <20260824130437.2771-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

