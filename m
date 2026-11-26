Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706565;
	b=qf6xkrRFJ6ti8qLDbgee3nmp0aQnV9vqme5TfdRrpqqDZ79uYOj+Z7HW+kdj/fxGe91z
	 Zg/0OBdNGDMNaMo19Et28n1JodnK1yyqbre8kQvT68BZp5ZJFMTdju3UO43FiauA/Umxj
	 HJC0GqcaGRNlpi8SMuJ0gw+0bmnvWzuzpjkiJkWrmkTYLx1LJW5W2cx1sUB2VOvqpb+eq
	 n+QdvAzvyq4Hltslt55kQL5ijxGFNDbdxcz2pahOH7gVxTT8872xq2LuLrEbVN8xMQoZX
	 elceIreSiuf2PYg/4snAi6FTofclNSxCbV9OmcckHNFCrlBA70TwjiJ8+Kc9OkU237Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Z21pXVuBY5SXtRs7zspjoo3gtjvUh4V57CiGDExdMRg=;
	b=BS+ujY9kjioJd9BZaUOx6I89SLn3pcmwKat6c9p+P1NhYMp3DO4rBElX+nI8s76yJRvN
	 Sjvq9A+3oNhlYr2hor2yaaVmGPMPyXkWu34O89bkTW73/we7PDxRYjGfVzih2BMo7XuLV
	 dGA/SML5jCcU7gSzW91BMOGboNnGk6VuxILHatecM+9pK8ldNTYknI2YDzEyQ9eVjdi9I
	 YmS1ayuxdjqms3BYW5MzDhFUfbvBC73ZqzHMLSs4V2PS8aoHm/Y4BIhVRcVVWfStpUerX
	 fJjVAOKNagkdqduy75bTjqTejQq7SJ5+6geKgvrt6IkulLGNB8LqOK/LVN+BUCrvKnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWNVKGD9;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7856B606A337
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7856B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWNVKGD9
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4170458f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706564; x=1796311364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z21pXVuBY5SXtRs7zspjoo3gtjvUh4V57CiGDExdMRg=;
        b=EWNVKGD9CXCHzCbwfCidNB/ngRWbxmzwt4TD4YW21Ce3s17FJlsvHMHFa8qh0hwOSb
         PjkksecYFqBvPmWfCIbpwl/3dasm3fz1cVj3o4bMxQUPLD/oCiVwTr1l5SJ5q0M46nXG
         Tm4+5fowtKtnL+0gvG2/tAdWxONyfN3lT+xkSCcrrW5m8t2QBxRRnTrMQz7SyWmF4ubq
         bXPLi9hpW7idWl6Icwi7KPUGzHO3vzxYK5BTa4zqJ7mCBOllzHosUvK0IHGTA8GEeJTf
         fFJizC6D1Duh+LzAlxEzerVeXJfgrRslAuO1RCEHLZVpckzcFM7o6PAOeqF9XMnwY9tz
         zAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706564; x=1796311364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z21pXVuBY5SXtRs7zspjoo3gtjvUh4V57CiGDExdMRg=;
        b=ufgnCpU2k13zhRIyGigZ1aVBRbio7KoZTL+4D904e1Nh57sFL6zOk2xxCk9PWTOys2
         8pasd1aZMglNGNahtZwiNARarwDXVeP3ncz1PCi6f+y7Qzx8W98uLWlALtXNp+21S60s
         xDlr9qWoIT2kldPS4GtsdhKwn+Ez+ayeo3YHVrz7vQSqTkuz/Vqp5xTuDXBMJHCDOLwT
         pISVneAq1QAgNbwNkz7ItHny2c/IQWzO23/DuB9xvOWnXQ4sariYw2zt7SxKKaCRIXrK
         n22nzTMDAoZwbd2IjsPPXnnYJ2VeY2u1D1/wyphVDTiaRulycyJjIfgnqsxeLWK11QJz
         YLJA==
X-Forwarded-Encrypted: i=1; AL+hErEYos9M59RIueJT5ngVVCHWm5H04SPRkmux4bJ+Z9f3/m2C9Aq2OAQkDgdPMM/UcvbPPRA2MNWzEvgpT4tW@vger.kernel.org
X-Gm-Message-State: APuU4Z9oxB6gJWrBdTf6X+VIrNY2rhaatiZLd1PMWzSbbh4fmZPWn9hU
	hi2Ad/K+wFVj6ynPgTYMaqEGi3Qn2TRcC7j9LSI0GM54c9Fs/ZLhV/1A
X-Gm-Gg: AZFdTZf+IypLjNkDj/JKyeJTD825o4wpiJkFPu09j/CetBxTe6kR3BU2PDrosb7Ye/V
	jQoJsiiiYwhBcGGXZzn7nTqoxW7oudCvHwRgXM4tSI4D5wzZXvudslSbNv+9qZuSg7u5qJnxsIl
	GEJIkyCiXGJfxHeCGrb/dcYDjGwxKHyQ7DpuxxkCsUz/p6PkksmUwWMlyAIjDrymbpgZUNxV7RI
	BchgDW2Pxabcyn+c43K3zkzjn/8sWB88FYKuSS0S/qK36YxLM+J9V7zHhMBFOjMxFPgXiYFxJwt
	QbyrciKmSlHSwYFThyzC5NrEEY9StrMl875nLHz5M5tIdhP7iM7TVkIYc+0LFb6k7SqxZZ03uei
	tmcmCA7nu6bCyaLQVUz0Ut/ctbiD6zCORl2U3yAR+8ltobpwHFzBYjFCBBF8OUAleFHJysnK7z2
	RcJfjxWBEob3HWXbE00g4Ut9ImkM95HjOnkP69EqOl3GWNK0gvR0barPEohM2vgWr7JD7zFsOHh
	u6SbF+xPI6LT4I2S5I/CuSuieLrWlRkdOtI2mv86GASafEYPOCYHaw4qzmE95W2ylr/3g9QJu07
	SK7b6dCR8xG0qkE48w4ZF96P2TiZ/77YUOiwPQ==
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr452329655e9.6.1795706563607;
        Thu, 26 Nov 2026 07:22:43 -0800 (PST)
Received: from [10.32.31.209] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm591589605e9.15.2026.11.26.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:22:43 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Thu, 26 Nov 2026 15:22:33 +0000
Subject: [PATCH 2/2] pinctrl: qcom: halliday: Add gp_mn and gp_pdm mux
 functions
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
Message-Id: <20261126-halliday-tlmm-gp-functions-v1-2-b8543d6a83eb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795706557; l=4316;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=+hML+quA4x5S2tx2hPyI1jZaB0AWbKbrLEJB7RRYDfI=;
 b=EDdAeNDrR0Tlphk/msuUOArDjFqKz0nJtMgUBacMbJ2g+GuTWb1QtgdFKn72S8/tfNiPb0se+
 JUgKuOy0pPeDEcTsjaj3/48iqi8W23R+H4SJUxwGQ5xzKruseXCmpBJ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the gp_mn function on gpio63 and the gp_pdm_mira and gp_pdm_mirb
functions on gpio35-37 and gpio88-90.

Qualcomm's downstream pinctrl-anorak driver does not have them. The pins
and the mux values were provided by Konrad Dybcio.

Link: https://lore.kernel.org/r/84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-halliday.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-halliday.c b/drivers/pinctrl/qcom/pinctrl-halliday.c
index 05e7f22bb417..9d386bdec24c 100644
--- a/drivers/pinctrl/qcom/pinctrl-halliday.c
+++ b/drivers/pinctrl/qcom/pinctrl-halliday.c
@@ -603,6 +603,9 @@ enum halliday_functions {
 	msm_mux_gcc_gp7,
 	msm_mux_gcc_gp8,
 	msm_mux_gcc_gp9,
+	msm_mux_gp_mn,
+	msm_mux_gp_pdm_mira,
+	msm_mux_gp_pdm_mirb,
 	msm_mux_i2s0_data0,
 	msm_mux_i2s0_data1,
 	msm_mux_i2s0_sck,
@@ -920,6 +923,18 @@ static const char *const gcc_gp9_groups[] = {
 	"gpio107",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio63",
+};
+
+static const char *const gp_pdm_mira_groups[] = {
+	"gpio35", "gpio36", "gpio37",
+};
+
+static const char *const gp_pdm_mirb_groups[] = {
+	"gpio88", "gpio89", "gpio90",
+};
+
 static const char *const i2s0_data0_groups[] = {
 	"gpio163",
 };
@@ -1419,6 +1434,9 @@ static const struct pinfunction halliday_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp7),
 	MSM_PIN_FUNCTION(gcc_gp8),
 	MSM_PIN_FUNCTION(gcc_gp9),
+	MSM_PIN_FUNCTION(gp_mn),
+	MSM_PIN_FUNCTION(gp_pdm_mira),
+	MSM_PIN_FUNCTION(gp_pdm_mirb),
 	MSM_PIN_FUNCTION(i2s0_data0),
 	MSM_PIN_FUNCTION(i2s0_data1),
 	MSM_PIN_FUNCTION(i2s0_sck),
@@ -1575,9 +1593,9 @@ static const struct msm_pingroup halliday_groups[] = {
 	[32] = PINGROUP(32, cci_timer, _, phase_flag, _, _, _, _, _, _),
 	[33] = PINGROUP(33, cci_timer, _, phase_flag, _, _, _, _, _, _),
 	[34] = PINGROUP(34, cci_timer, _, phase_flag, _, _, _, _, _, _),
-	[35] = PINGROUP(35, cci_timer, _, _, phase_flag, _, _, _, _, _),
-	[36] = PINGROUP(36, cci_timer, _, _, phase_flag, _, _, _, _, _),
-	[37] = PINGROUP(37, cci_timer, _, _, phase_flag, _, _, _, _, _),
+	[35] = PINGROUP(35, cci_timer, gp_pdm_mira, _, phase_flag, _, _, _, _, _),
+	[36] = PINGROUP(36, cci_timer, gp_pdm_mira, _, phase_flag, _, _, _, _, _),
+	[37] = PINGROUP(37, cci_timer, gp_pdm_mira, _, phase_flag, _, _, _, _, _),
 	[38] = PINGROUP(38, cci_timer, _, phase_flag, _, _, _, _, _, _),
 	[39] = PINGROUP(39, cci_timer, _, phase_flag, _, _, _, _, _, _),
 	[40] = PINGROUP(40, cci_async_in, _, phase_flag, _, _, _, _, _, _),
@@ -1603,7 +1621,7 @@ static const struct msm_pingroup halliday_groups[] = {
 	[60] = PINGROUP(60, qup1_se0_l3_mira, pwm_2, mdp1_vsync0_out, _, _, _, _, _, _),
 	[61] = PINGROUP(61, pwm_3, mdp1_vsync1_out, _, _, _, _, _, _, _),
 	[62] = PINGROUP(62, gcc_gp4, qup1_se0_l3_mirb, mdp1_vsync2_out, _, _, _, _, _, _),
-	[63] = PINGROUP(63, qup1_se1, ibi_i3c, mdp1_vsync3_out, _, _, _, _, _, _),
+	[63] = PINGROUP(63, qup1_se1, ibi_i3c, mdp1_vsync3_out, gp_mn, _, _, _, _, _),
 	[64] = PINGROUP(64, qup1_se1, ibi_i3c, mdp1_vsync4_out, _, _, _, _, _, _),
 	[65] = PINGROUP(65, qup1_se1, mdp1_vsync5_out, _, _, _, _, _, _, _),
 	[66] = PINGROUP(66, qup1_se1_l3_mira, pwm_4, mdp1_vsync6_out, _, _, _, _, _, _),
@@ -1628,9 +1646,9 @@ static const struct msm_pingroup halliday_groups[] = {
 	[85] = PINGROUP(85, qup1_se4, _, _, _, _, _, _, _, _),
 	[86] = PINGROUP(86, qup1_se4, _, _, _, _, _, _, _, _),
 	[87] = PINGROUP(87, gcc_gp8, qup1_se4, _, _, _, _, _, _, _),
-	[88] = PINGROUP(88, qup1_se5, _, _, _, _, _, _, _, _),
-	[89] = PINGROUP(89, qup1_se5, _, _, _, _, _, _, _, _),
-	[90] = PINGROUP(90, qup1_se5, _, _, _, _, _, _, _, _),
+	[88] = PINGROUP(88, qup1_se5, gp_pdm_mirb, _, _, _, _, _, _, _),
+	[89] = PINGROUP(89, qup1_se5, gp_pdm_mirb, _, _, _, _, _, _, _),
+	[90] = PINGROUP(90, qup1_se5, gp_pdm_mirb, _, _, _, _, _, _, _),
 	[91] = PINGROUP(91, qup1_se5, _, _, _, _, _, _, _, _),
 	[92] = PINGROUP(92, qup1_se6_l0_mira, _, _, _, _, _, _, _, _),
 	[93] = PINGROUP(93, qup1_se6_l1_mira, _, _, _, _, _, _, _, _),

-- 
2.55.0

