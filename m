Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445747;
	b=GvDkrJ+jrgAchjjQp6D2mZpmPTDKUZJEODhudW+ocU98+C3Un+FWxUfMYn2JuG/TCJoT
	 pLmq6hPFN2Z5HrssWRnyGnQONi0NE/VGG0+IBcmXo0ZCgYRhNDlWTrp3FKeAlImFQKyUL
	 U+OdnkUkMHZV1BZ08LAXvsCRCGpslLJgYFpB5iAUu5WF1W/eiLaur6x7tlszteMkbuNyE
	 Y9wYHhwe3JzAYBrPUOg5XqIUAd4MdlhBdYDkSTULVTitgyEQfuosXl2lOdSZy7WbusYOF
	 ks01/X74+Z+OYTApQPOL0HVLjGcJl7C46KI7d4vO5NHNGmnMJX50k+xZTUExxvutFDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/DP7KNdQWOH7BpliivQ5bW4gkOy6G4pd7ggK78SbJr4=;
	b=3xVC6eUOkebpUXDsJt7IL0r4TC4100nrYLEEmiCzf/lq6n2w/WB++WT3Ld+L9zesvDu8
	 LBrEGPHfb1tYn1pODZX+Y13t+2XAhwh8z+2/UVTo5YJzlwczFMFN5Mpl9iqjXdVbr5Zdo
	 ajFEeXrK7nkC1W56ZBqvD2fVXTUQKq4bo3GqpP5udng51OrG+VPUcxOSzcTWOim09G8U0
	 0z7zeqD0XZPPyMtp6mmAmz1MH3ro1SCPNaiGoIdVW0HcWNNFs1ycUoWHjeRAkqmtTACGM
	 YrGkh0U8mC5eTmKfSUpxegG37Vg+lwHYC8i7CVUKdFor2ZKzO8wNqRvn7sP4XnFcWug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mldDd7mI;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE125606A320
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE125606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mldDd7mI
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab3fc6e388so1889641fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445745; x=1794050545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DP7KNdQWOH7BpliivQ5bW4gkOy6G4pd7ggK78SbJr4=;
        b=mldDd7mIUPPKxAeoDWfejbL89Bun8PxS/Pfoi/C+OVqoLglRPk/llZ975EI/vJnPFS
         MK4M/1P7wBS0DRkWhJoau6Nz8P8iTt2Cs0vfgBp7lOzxtuNU8Oq1fDfuf5Sgogwzr3iV
         lXYWR/O6p/HCum9RuHeCf6slQS9z54OlsW3lJBtUmgSnXna1fd+ihj4DXO4vmgFWXq1W
         j8N4cYbS9qVov43xtvmoFeE/VPhHDjnZGSZSrS1AiWsjoUcrytSDpxgop511LzdipwS9
         2Xi/lbGUlgukqXC35RlO+pn+W+DoLmEsmftqIugwPrMJQoS+B6qWm48/+d6VyEB1wvQe
         HoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445745; x=1794050545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/DP7KNdQWOH7BpliivQ5bW4gkOy6G4pd7ggK78SbJr4=;
        b=2g5hG+vSLqL7NnS1lIypn+HRgHZyFq0OopAYnaDdMWzfveyETRNxy+j6uoD/U+1ej4
         Hszn34r0wJUoSTfYLiCVWkFk0ZQoB6PV2nHBU6NZPEa9z7B7NkEJhuIrFYLPElkFWUV1
         JNbRHSck39Lpe41CjebMdMHTnNPPZOI0Mi8dX9weHVIv8QyLDEBpCQw7Pmq3s8XZIDYv
         Y03QC8CMJXotOIG8l90OR1WexCTLR63IRuDQYyAvcfnrmeXsXCnsfYQT3U9jV5UE5gUo
         eADVuNMjTFnlLdq6OwigPlGaqjrjzi4juhMVCegIIuI2O81sM/58PaAf91IwVxePz0hj
         DAQA==
X-Forwarded-Encrypted: i=1; AKwUvBwKzItDgccn0Zn0sbuW9j5JG317EyoG3xWAXzCr9K+E7fLk9HnTmHL1INg7k25UIok9mgdI0FEmCjCvdNRt@vger.kernel.org
X-Gm-Message-State: AFq9FYJmVdDqLrF8GdbXyunOB56QvUg4chsPND7LWzaSWfgkAvTFqfuY
	8oYuD9gy6eq2GUO3BJ3brGEPi4MWdvkED3NCVlGHKhMNN63UkJVuJxl+1xdRWkLU9Mp58LH7kaG
	Y6DTvqlc=
X-Gm-Gg: AYBFou01yVmtMppQfTdJWxQarwXnaAEzdaK2QuG8zYLzki0lfcQOU/oBNJ/Vm2opinP
	83lIB63/E51jtLcX0oS4I7HtHtaOycU7jrk14g4hZS5AFn9736DYzHM0RVV6FVIS+/yyVUSrV8C
	9Wdw1h/nXlARH4t4/XnkGGqRoV+PwY0EuwXOGp5SOmu0mmWFlcLmAaA7TcIEk2M63JaSUe5Nzew
	iUQSNWpT0+kgdgurEqej1YiYohxLjnJWG0BWzIYGj2OAJwTftx5IG5vx1Po15VFiilebSdp0otf
	ncaK2CRH5WQldWOeiHjHp0MheN3qrSLof3HIGTNDhJIW7EEVdbqXAp/NfEjiX1cIZGQTFYIbrE5
	KHRrCQCAXxsuZe7e2VKO8h6ieFW1fva+gCjUUBSBdL1VhWog2xWPthD1gHgLVIvqmGX90aWbkjL
	0dqlnmSmObpMx8vCMILE0EFS4wn8lRqY3aq8yhs6vSwiju3o5fUWW/REk009DpeSNQJOruz6ZqG
	x5KizCeDeskGNNnnJ61P1NCrMQXNyumDtC+VE0FJgZt2RGTJP2ZDqnR8/xE8gY3PTTtTj1TA02B
	DAXZxmVPZBM2rdSL4x/dPzc5NZhX+IJBoneDTJaz2nQGQXDD9gappaXGSwhv/smU5QbfWoI=
X-Received: by 2002:a05:6512:4041:b0:5bf:a48b:7807 with SMTP id 2adb3069b0e04-5bfd952024bmr1809892e87.1.1793445745111;
        Sat, 31 Oct 2026 04:22:25 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:24 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/6] media: qcom: camss: tpg: Add support for v2.4.0 TPG
Date: Sat, 31 Oct 2026 13:22:00 +0200
Message-ID: <20261031112203.545319-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

Add the TPG resources to the Kaanapali camss resources so that the TPG
subdevices are created on this SoC.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[vz: extracted pure TPG hardware support part from the change]
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../platform/qcom/camss/camss-tpg-gen1.c      | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..cabbb2638cf3 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	} else {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
-- 
2.53.0

