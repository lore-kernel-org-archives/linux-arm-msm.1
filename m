Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838054;
	b=41ZQBqM6wLXDft8N+rfWCpjsVlIbNuOKJyCaLndsVsSI4aqy0AQDYU7X4R8uIyeV0IIj
	 /4CbdO4H1WBcjr+1TlNWDFhyL87bvaDoLTDoCA7fWN/DEJatSkLcz8WeDuiONr4a23VlV
	 Do4Y3MtDJNFutEKU+A2lH5+qaPcVI/ePX8u9fQgkiPYHK7lVyiM697rdu4ADo5MXg3/pB
	 bpBdAQIpUdzCtyLdtN1LWRvr+Qgh6ybdr9zYRtD0xWe6k4df2zSOCUibMQPmv37mEThPB
	 uNMeKttoMayJe7jrQbMq9MVPog9311GRGhOCevtZg6+j8Lp5tRWqD1YXurQMvWu4WzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
	b=PFZ36jpOqxl0dRs7WWOtPjAmIOfqwZ8M7n5SYMombOjh9164uo4NRsQyKpmdTldwMFxx
	 9Ds5eXPBpVAOOWyP0pp5VPVpVg3G/6g41i7NzziCj6470geyCq41tVQkP7rcuQpqM/fQC
	 f4vaYan6HBGdLZ19AaBcGOZiPXPr42h1KCEIdVKVSLTlVuhuvGaW5lv7SYH9RKNSVjHuk
	 m+JXqNQbl+OZ5p5l/SK9wl0UnQaYcbitMK0R/Jj99v+rqPDbvEorgIyM0M42PTGs8sRfq
	 hIBHGGaNl6R3zD87uzZ9KNdV5Imhhjc55/a9PTDphTH1EbazoMWxKt/wWIVBbRhYJZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKgowXyL;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D4A606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D4A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKgowXyL
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so932897f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792838051; x=1793442851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
        b=YKgowXyLWBwrg7I++LDP8W180Q8ZiqniVMWkvWW4/5iaBMr2iDr91+cTkh1b3/m4Sv
         Lea1ql+KOC7EtGE/uJDarJSmpxelzCuHTBIVoce3HLGWesCapXCXBPK9wSsP4E9oE/KW
         um9D8prowuOKuB8EHFlLI02pStgKNsLQlt8oLKhxZaLgwHA23puRZtrvnWuj4ryDGqBW
         /K7w/9mWlK8LlfeKJwraHbK5ByzlQAUDD8SUCv0eVS0kEIfuyUEm3uF1LnCMQ7em7eJM
         vYoWLjhE3IDHpIyjKzsBeLYQawgqgrYl48ympnOHRm4P5/xSLaN4WpJWZpdvcR04WiXf
         8VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838051; x=1793442851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
        b=QkSrfWBPF9FnsIum5t3lx4Qr/SmfUklPUzkoTHjnv8P3ZRAnje6zWofTVHgEAw8k81
         vAJBHtMjMMyT9KvK24haWsKeJIZLVjah+RFPwOdO7YAbEZjre8UYNhyWfuv9TnBeqqas
         0C1MRaNCCheBwrZ7107iTl4zbPLSjWrj4AZekdoww4PFhDYZt8zDnnzl76qn3bXi+H0a
         wsq28/u8VeMqiRsNCL+VB+QINkbMq2e94n15yPAMXLQpwsf0FmrQWcn5vXfhEIaxPyUJ
         ReHlYKBlr679893aZ95xWSdLOGgOp7JA9Wr5gZFxxjnMYVpskQKKJol+Y7vbaHmR5Evx
         oJaA==
X-Forwarded-Encrypted: i=1; AKwUvBxSwNZRyIneodP28zLqmwo9YXmf+oHxuTkVwsPNcgmF6lpFH0mzxtaCP7FZd/8D26pdYR/n7ITmgLCZ01pA@vger.kernel.org
X-Gm-Message-State: AFq9FYL7zhM7jvRYu3rsR+ox2tRonHo4Odp+07d8KHLOqr02AY34Umyt
	U1EF55lJMlDfYibnYiPRZ4IyIOB9Xhi7r9Se9do2uiUYswYmM534Bv9D
X-Gm-Gg: AYBFou3OZ7eAsS/7B8NR8ggEHxE39r0BKZPcjQqxGPZoHI1i+jrnuhG0C99lC1DV0Nn
	xThY1l6JdKuTy3buyf1FmwBwPzCsnURxyZ1WT1U0vIGn2xm7T0Rg6FE+tmFc+3LT8c4RCouZ1O/
	/eLjVwTZzGlTzix3gjJ85RNkyoaR5fO2xXlu4gu+7jQcBZU4zS8tjeWXODC57w2gk5oHaHp0cRF
	G5mj6zdXe68rxBRby72Ky7wjMGCApVTedrOzTsLWCpgr03sxxB8EZXr9IaJhFMrCozxDC4mH+4a
	ocy0ly7WWAQ42HBhjZzz/h2A0xIJkkDlEX+Sd44Zrb1WU5eOm2UpDdGhDq+rInhbFtjA2e+RVeW
	HqAkxf1uvohGijhc67agQKntMq5W40pJ0gGWejJN32vTAPsSL8FxfdzpKgw4tvC64z9wQPy7biB
	ReBwcwohUsx5Xo2IgaxGSN8QLlv1gTc28MKMiRpDIZlVhHfrVypSD2w/HJKeJfcaSllaVqpYOaX
	Zf1H/+WGeeJqldNy1r0r+PJKWimKyLWMhgVY+DeDtHzd8cYcb2QBkfqRm7FerbRllTGnTxeMhvt
	XIdRvWXhY8A8+5tpEZP33bhE0sD+4ecYJW6jGenx65PXK3q7JEqhAp3YPE89VRTkB+Ollr9POXX
	tNtq+m3Y=
X-Received: by 2002:a05:6000:2312:b0:48e:e98:8b64 with SMTP id ffacd0b85a97d-48e3eb8b45bmr2346024f8f.19.1792838051352;
        Sat, 24 Oct 2026 03:34:11 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-024.globalnet.hr. [213.149.37.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm3544825f8f.39.2026.10.24.03.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:34:10 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 1/2] dt-bindings: clocks: qcom,gcc-ipq8074: allow CMN PLL bias clocks
Date: Sat, 24 Oct 2026 12:33:09 +0200
Message-ID: <20261024103401.761125-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMN PLL in IPQ8074 provides 2 fixed clocks to the GCC clock controller.
In order to describe this in DTS, allow passing them as the inputs to GCC.

This has a benefit that it avoids doing a global matching by name.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
index 00d7df75b3d6..d489c6332e6c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
@@ -29,6 +29,8 @@ properties:
       - description: sleep clock
       - description: Gen3 QMP PCIe PHY PIPE clock
       - description: Gen2 QMP PCIe PHY PIPE clock
+      - description: 300 MHz bias clock from CMN PLL
+      - description: 416.5 MHz NSS NoC bias clock from CMN PLL
 
   clock-names:
     items:
@@ -36,6 +38,8 @@ properties:
       - const: sleep_clk
       - const: pcie0_pipe
       - const: pcie1_pipe
+      - const: bias_pll_cc_clk
+      - const: bias_pll_nss_noc_clk
 
 required:
   - compatible
-- 
2.56.0

