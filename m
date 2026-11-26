Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706563;
	b=DeTWvgjL6haNZp8jt/Q3a2wSzc3gt0HieZOoiUQjSh+TYGu/+2faK1ejX+GGBYCPpMRR
	 eEycSI9VZie1FvF936WBOHyhFmzKF25K5XWfKqdgYvycSPAwpNdVkZg9ihU5AyhK8qooC
	 dsTzwAA8+b14L8oD7qVOld3Y6AuzlBS4wIiLz9u3ZzIMkpmmqCdnav8fAGYHSAjIBzX8c
	 +1StQkSw5fLuGkOSDgLFlkETfph3X89t8bj6s96b9+WYwmSHsC8CMT6Gseh1rhc94C6XP
	 4UhlJuELhFvwFZldZKgUIcSlJeWdbK6mTmAxgey574kEioNnJd/w4PYJBhAEHI2AjZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
	b=QrBi4jGUw1VlOdCD+A/2RQJvoDlsBV6hzIzD2ELwARSCimDeGuf+YEyPOYkKYzNgmnhn
	 sIUsOsy89R9Pc+ZHLkLMBeGycU7JbxkgaTkJnrj5fv/9P8LPENP5SAZasON14yEq/ycUs
	 T1huGFcalGn1XlQxs3LFyWC0K08vmjPnedM8WuIhP8KQjkecfa8M7LEORYPmiJkV8Ky1Y
	 lpNJeKkWirz/fkamqEdKkcxykB9pImfrEIznrqrudK/IZoPjHZU/RUhT7IZtSOZcUiPP5
	 f5IIfXjFERdPvxAbzbhYB5tBcP+F8LpaMIk6sfFL9WA6Q2ShITZ2gxPH6reJNQ1Zfcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iZu+/D3B";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F698606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F698606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZu+/D3B
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-497614c95f0so4087885f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706562; x=1796311362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
        b=iZu+/D3BniANHRXs2lzbkw7LWRXccfghYj35WKvmta9S+XdGY6U2rH8Mn/8As16s4w
         lo4HwXSBajMqRiU9kbpUWvPYIDQ1FPJmaZ2AX1EgbehGTLoboaSEqFbm5P7EP4M+GyKX
         znnCZR0o7glLDfiEtbztxhzRozOI6FJpdWiwsCKZFsgiEUGrv1uurtDK2LhAPjO+/jVO
         1rhvel0cCAeM4wV8nDvDjmf+cOyhq3Vv7tJ6jDAZihpHEO2J6xenYpTTyPlsC/TfDzSm
         a++r4qhm2D+aZOLOYMNocDhDij4OquLkvot7uFDJEcUfn+x/QAcr8MYbxNOXUUk6iUo8
         Jelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706562; x=1796311362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxxq6k8Sg2gNQ6kcoLDp7vBeSS81F2RqYahZsxP+SdQ=;
        b=paIY/qVr9cMIRcP92up77P9+Gh9bBtjWrITa6tyrLTCUN36u6eQGgSR1g2JuF76/7G
         QYcBqkOUa1jgFcR+Sc6V9GBn//ZcwQE+NHG+QsIx39COO7zpp55jN4AmXpZYBg6A9aHJ
         5U95mbgJxPkykTTs7na86dmYedJeBBaPGDJPAXL+t9kviQY5uPmx9gElrU5j3tMfFCLs
         g9X5xX9R9Iy+gRQVv0NrPdcsIGc0GmuiSqiSaX9t/9HwQPCkVunCPe7w4eVa9HCFx3so
         5t5w6bhqUtxVI9Xe37wv/tTB0FEfvg1dJZnwF6RAdYCzacuWQH2+LeMIji08ZydH7s1k
         QoHQ==
X-Forwarded-Encrypted: i=1; AL+hErEcyyDOgDhhbeHnui4KWn0FfWRFQJ5LtHu4ks+BkVbx5U7UNt+VwGMCYHgrU64HleLJlR2wWmLjPCeRwty4@vger.kernel.org
X-Gm-Message-State: APuU4Z9GcU7sIdmotPfTR+GcQpnkDXjkPSPkw6okAo1D3isy76hmnYvb
	+qxS+IQZcSbr/TMOWp+4UQorORB+3zz8vEjcQiM54B8c6Gr4lLe7s3A2
X-Gm-Gg: AZFdTZeCxFBcIZdg59jE5KORS4tiYsNiVzAyLlubx2LHfEbrqNLTrdLEQTYbm2aPX9o
	F5QYXr/3Gc2yyLRT1ctols+RK+VtU4VnbTrK/rmXOx2yGrDRHyTlahujvtwTokoq0x/eeFaeqOB
	klrXs3pd9AYQkPlSuzoECGRK91e6fCH157Y75M2MlNRLhUgr/a+K1c8UawfXx2ezk0sHb+2J5HQ
	/irTJkMg53ftskhQvr+66/YS7TpCCPV30EUZkebdqas/5BSXmfB3FERSG+11EXRil5IzTjbKe2v
	Z5txMd0Qvvionq8+oYQ1LS64ZdlTxREgtuMlo7mft/6qfVgUBbzudxNwHh79H57sJY6i3DWvo22
	WY78xGR/dLaj/xGaUton5qxSGWfKUlZcg2zp09JygLQnpP9D4JjU+77HKoxM9SWBPhZQtd1mE4w
	2YfbH/xB+zODSg6NUskzFlFMi5rAHmVlEh7ixw/p8I5rVwg/qAVqlIiISnvdPgdDXEkwI3w2dsE
	cx4FJgBMloY8FWqmFv7+fCFatvfpe5i5FJqfSWyHUvMaZXlloRAqy2LieknGC40KgfUcnK/EcbV
	WyF+0M/hbBSIT+AUd4EI0rinV4q2/i+vtOYUFg==
X-Received: by 2002:a05:600c:5303:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4bb88786cfamr410681045e9.0.1795706561725;
        Thu, 26 Nov 2026 07:22:41 -0800 (PST)
Received: from [10.32.31.209] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm591589605e9.15.2026.11.26.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:22:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Thu, 26 Nov 2026 15:22:32 +0000
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: halliday: add gp_mn and
 gp_pdm functions
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-halliday-tlmm-gp-functions-v1-1-b8543d6a83eb@gmail.com>
References: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
In-Reply-To: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795706557; l=1404;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QegpgPfocKYFJp+cQizBP2hJGKseGJLDx0NLMt+xxOc=;
 b=cnZmYNJ0J/woBA32L0W/n2FpxJmTXEFp2rRyZGRko+DsuEi6MzOSuCfu55i3nZbkgD3GUjjJ9
 lVDNNmqaX7YCDxP78kfu165KKFClqU6BbexaMsOaMD5BlHlOSdC5/6f
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the gp_mn, gp_pdm_mira and gp_pdm_mirb pin mux functions to the
Halliday TLMM function enum.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
index 2615d40b0478..e89220c185a4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp0_hot,
                 edp0_hot, edp0_lcd_self, edp1_dpu0_lcd, edp1_dpu1_lcd,
                 edp1_hot, egpio, gcc_gp1, gcc_gp10, gcc_gp11, gcc_gp2, gcc_gp3,
-                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gpio,
+                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gp_mn,
+                gp_pdm_mira, gp_pdm_mirb, gpio,
                 i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws, i2s2_data0,
                 i2s2_data1, i2s2_sck, i2s2_ws, ibi_i3c, jitter_bist,
                 mdp0_vsync, mdp0_vsync0_out, mdp0_vsync1_out, mdp0_vsync2_out,

-- 
2.55.0

