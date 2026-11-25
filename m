Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640077;
	b=iLgrSQUsixMhKdDzBsMIH5Upb0v7DMdzzEmT1Ks6uuuHdq5/h5pice/8uWNQW4pEU9L1
	 1DI4DJJgSpYdFKDECfuHwbU02L5jee+wXCBnRyn2yM9MktQSomx3xqTgFwmnj2Dmr/Wm8
	 aRApDZqanNUDr4kx2Er+xftv21N5rk92hkblilS1C3AhiBo8hx0OjgGwxT67XD8ThTFZ3
	 gyhy6wvF08OhvHPoTYMBI2EPTtnctHTKYtHfGKXWNr4U4F/G23mhqgDKk7fOthSi8b6Ok
	 ACjLgbkAtSiYOGbNYA5qVZcRTU5jyumDhML8+S89HJ5y2lyupLgxs3H5GyuuY+l9yTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=At893HOits8PlbcqKQMAG+x6VHDDd+yyVnApfOrreEE=;
	b=iOt6vSXamIWjTx1b5ZcipFOSwXX+XQFh9j3jYOpgGLH+ViKfluFJyJem0BLpflqf3odG
	 wZ6S1BdjsozZos3FIcHwTwDGtnJ4RUk81BWePqRXnyCLGhJ88Fl0Bz+ELU+zIrt8dhbv1
	 IVySKbcKpppxs7qtk1Vh5C7iulksfMiMV3JszrMx8/MwN0Cwut74VxEddnDrFsXzdVnDK
	 Sl444TjCK4R2lPXGmrKDI6inaa4KW7qqRFH6mjmJahyt5pbAJBR/oZZex6Pfr6KwQazRI
	 B0ROSmSpJqulI6mjHkFnVzZVQh5F+YrxNXR9N8Q2R4MOx2sJev4jizQjm+s02EL7R/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRIuHIDa;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3460B606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3460B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRIuHIDa
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c1ad0d0b72so577085e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640075; x=1796244875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=At893HOits8PlbcqKQMAG+x6VHDDd+yyVnApfOrreEE=;
        b=tRIuHIDaAazSvAYxdsTYzbqP6+kJs7Q312mhnldXf2RHls+Ke/Q5o0jf4fLyNmjO6v
         cDBiBWaikLMWSflRvanN8DO7UXWMII/dHXhp2V6VM4awMBtUFJvidJ+6cF2gRbZdcH+Z
         Gh9/Vepo4RpRdqoN1Gyyp+FJSrTuSLiEm+tIOCJlKYiVTAxITO4Ve9g6+n91kgXMlIyr
         UOOhawheHZdMNW3IPQWFzBzpicQ/seSIyyihRuIVJ+qkiZZVmUhegLPaK+/vWrNhKGED
         hRq8KFXqlYjRZZsC+woHhx7sb6wMmAilIUs57uC6wFGdZjuczqUSaHz56ebQ41mhkF2u
         /rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640075; x=1796244875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=At893HOits8PlbcqKQMAG+x6VHDDd+yyVnApfOrreEE=;
        b=KB9c7N2yZ8CVuFqVpO/CvDNIPlVPelk1J2NqB2bs/cTC9wypP/uWD3gJca5/5EvOWw
         EiMaUS9tEO9UmTmUfNoapkYBJ3Qrv+jqnKasxSfWJqEJYQUr8A/nSdqmkRT+unWPoBH2
         8ZkfIFOW7yJljF3wvcJF/n4n21stvj5aZTdYKOHmm/9rxwDWQ7c2D/liLXFlFjauhOxd
         u1Wr8e7DEK8/IbmJF5HFCAvSFlxyHdjPcJNBrtPMhywkkF/WZVl9Q7tuXA20X6a8IzyQ
         RfAp2Yk9leAM2YOYpASf9LW8uRfsgkKelzeRIpgagEwHDJ7mprA0SJdXifbLbpvkrqvp
         WnxQ==
X-Forwarded-Encrypted: i=1; AL+hErEeyMaXm2iXABtXTlRStOVHRaN5J1qov8cQ9/m9E9uHynzqA37g4GNuUCIFJUz3dmRbRKUY5c2k/LsEPgaB@vger.kernel.org
X-Gm-Message-State: APuU4Z98m5dUKI/NiMNc5xY50VJffooTInWxU7vwoWnvZAcye+pbTTcR
	yKK3BFHZM5Y/B2SgA8ygspqFLHAfCfkNHmwKnq5ll/11S9QndM7kEOlgQJTQtZguXMo=
X-Gm-Gg: AZFdTZcugpEgVkjoqnv2e3ozx7l0gnHQ8ZatYLhsOn+FI6CHMg4aa1kkSBdsGa7wWNt
	8nyqXRUoTOU6SUmLxAhmbm9SJEOAEa6TVPhmVT+TLgHuOh6wgcKRu6HdyBItskEurDTx5TVPMbJ
	Ywi29CE0ggY3T0cyrTd1rRyN/tDsbXQkjCtMXthoxtwMo+C0PtA92BHNHVgthaHAk1H6RlVtgXW
	QDxW/sOVKieYAuQb62f2YpOXYTScTI6lt+D/AXYGMlf3N+//wljnhej9SBqxL4+a3fkkrBxa6wo
	ZWsjs+TQkV9WYbWi1pE5x/x1Hxlt4oZDtcRKeVXtA+kXZVW9Qf/w4B3Y1fZVJPrL35fN6dbJyW2
	eOeR2Hufn2C9X/NpbaJp0zkIXaurtNBqO/5fEvkmHr8ZDWYl6KMbxScwPGU12ptbPcerXLbj3Ga
	akvhfE7rBKSU47hiTXLJxNliAjWCx7vr7Xs4eCU49aV5M+c4DKRK3LR19KGz0n7yiBYy95qLDOT
	YJvTkDT30V8A731c5fammRjrnO/Z2ShkDhbwn2GeDsZT40r7OAEBD5aDS8boEfG0HKUm96tRFIu
	8WSUp6Q+kNvdLNrMKYJkjlWDPQ5zhPmJJ78O9FtOPvHy7Jzw9xPt6zX1jkoE1pzMcpPZ7w==
X-Received: by 2002:a05:651c:c011:10b0:3ac:dfad:319d with SMTP id 38308e7fff4ca-3ae7f9d6f4bmr42526411fa.1.1795640075524;
        Wed, 25 Nov 2026 12:54:35 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm50871441fa.40.2026.11.25.12.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:54:35 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650: Add camera clock controller MXC vote
Date: Wed, 25 Nov 2026 22:54:17 +0200
Message-ID: <20261125205417.1437355-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
References: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
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

The camera clock controller PLLs are powered by MXC rail. CAM_CC_PLL0
runs at 1200MHz, the PLL supplies CAMNOC AXI, AHB and CPHY RX clocks,
and it is enabled on any camera use, also CAM_CC_PLL3 runs at up to
1570MHz to supply 785MHz IFE0 clock. On SM8650 the PLLs running above
1100MHz require SVS_L1 level of MXC rail, while the camera clock
controller has no 'required-opps' property, and the MXC rail is voted
at its lowest level only.

Fixes: 673fa9a42606 ("arm64: dts: qcom: sm8650: Additionally manage MXC power domain in camcc")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c8..af94fada15a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5641,6 +5641,8 @@ camcc: clock-controller@ade0000 {
 				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_svs_l1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.53.0

