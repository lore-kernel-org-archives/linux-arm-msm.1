Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7506F41F5DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576714; cv=none; b=HX1TNBzEIRXeby56A9CPF8znC90449T5MO+79Y09WA7HZIsuC9ECirz71/kcwS5bt9255esIm5EYgxIZL4klBYXnA8huQA0ZWeN8IDPWYtuY0QApIeDaa/u+5jaLoxQe3uCx3qAl7KJKE74+YSnjjy2Zn8IiPeWbFcC7n6G3GP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576714; c=relaxed/simple;
	bh=pbOuLnMdY2W+iCdw66yndLQjoRN+QvlknxTRrElQL8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbVVUnL/3pk+LVJgrg/PspXJatzyRlFOV/lFf+pNz++JH639Nk5L2Q14yTjbP1hjLR/r1LorvCQb4pi6LTQ8o9QVlM7HmrPivzhkWCd9R8tiGBgAuuNh7TUH1GgavC0l08xO1Uc1SzcEGBULK0Gvm1qBrMM2EjLHPj6apB3XsMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDeBg8Hn; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDeBg8Hn"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-45171f2f608so3067059fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576711; x=1788181511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=068pYnBVpLmUX/vSkfsFSQIv11h+T+N0t9GB6UkmtgU=;
        b=HDeBg8Hna/geD1n1B3JgsT0q3KEg8go8efjdUh6y+LbzF0Jv2Eew/g21tYygLzLuKU
         NIQTSiRyC92o3VHcES50TLjmhu1BC6Dxhmn8EVTm5oSFZbhVsPF48/gJLRHmr6/DD9qr
         tcsr/KbgOFPHWHKGfJC8Dk5kcpcKhQ7KP1dr96vuZMIQmKD6ibxU1IiYxVPE7G56b9MG
         k7ULvlHSNpf/Q1Zf8eUJn1iLuVtAkcx+XqEcFzXotmgWcPgzQ5Kw0NnDCaTJz9NWz+iX
         DYd7PFQxoCXFIIPsJ0pGI0MwEF9yjfjJA5/FKgjrzVF1haYySujztV8VYAGMwtt6JD0K
         kKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576711; x=1788181511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=068pYnBVpLmUX/vSkfsFSQIv11h+T+N0t9GB6UkmtgU=;
        b=YHKp3LWPm+U72pwjsZyo3o0F+Db3IHUOEb+Zta4r93MyguJ+PQ/BlyoUNKx2uLP9H1
         yGsbef0Pt0UDGMXnj8sAT/OLmk8kwpkQLUerGMPDfq/haI3dWchqtue+6IHwUsRO+z8x
         7mYnWI5NDlFsa/Ynw9uKvoUFYswBgRw25j0M77QDknB1w9+ictxQZWMT9UtwDoH4+SHQ
         oDxgkw0dG8HkyGdiyewnLU7UHLliRVuVRaB7hsi74zwu5bbSk60Bn12KK8qQSeAfT8mJ
         wPwEuLOFoe3i/h73lgrNcAqTDNLQhXP2oGUszqq75MWCICE6ykQD9pSIFAtiwKz8pCbp
         RsDw==
X-Forwarded-Encrypted: i=1; AHgh+RpBo9AFdselCRKghJDDnEnAgVXfLuPiHZnZdeitQQcktYEk00vtriLI+vdyJD0l4WpSuVga9265PN7Qru61@vger.kernel.org
X-Gm-Message-State: AFuF++nuRdMhlgYrLTTFe9rh5slUySiAivZ/V1KU4Dhh4mlLz3fsr+e6
	oSflzm5H7H5khfNXJr52sKrkmM8JY5b411IFW21ZBHc+CyJvmXeKj8Z0
X-Gm-Gg: AR+sD12vuPAxJY8+tg3pWTePMNVALDxX41VNRREmBVczum9zn3hNYrcnReX4uiUSlBh
	2td+CeeELrbW79lFhWNQHjBS+9gukkhppQwfndOeZsQB/HW9vuviYt8wjChygvaMnMrBq0nXwrN
	rUshzMtxIV64DkMgBJurAXFRiqR3WUrRL9c7mtzHfuWG5rb56T4Yel786QDGwdr8f13w9zf1cpy
	p/IdFyTrr541/eaolBFrUWQOFxm/PRBVBSmztIupHYQiT3n/8KefLo11vKstDEW7qnq7eRllLSf
	y1O18NFiRw0nyR16Pdmey+00bL0rrtq+ZGKBKgoLR4K7HvWFBd0oSKi5tewrNWRPHzpClZ4BAtb
	kSABFSuOhXGq03GYw1OEnw/20k4rJ8Pry/YE1UN4FtLUJLfXuEFGwNCHTEeE5VE182hCDuIsElU
	k0yG/2sUyIr0NZZEU/dafbSwHHUWKoFCGqltKTpKR5GEdPqpWc1yfp/bU4cbtI++X61zqPMQf74
	43Hc6Ni9mhj54az1G6CHlg=
X-Received: by 2002:a05:6820:a50c:b0:6b1:5180:bc73 with SMTP id 006d021491bc7-6b15925dbc4mr18970135eaf.15.1787576711215;
        Mon, 24 Aug 2026 06:05:11 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:05:10 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 01/13] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Mon, 24 Aug 2026 13:04:25 +0000
Message-ID: <20260824130437.2771-2-sreeshankar0910@gmail.com>
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

Add the ID for the Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 2cf433f61..b63e4a0b8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -209,6 +209,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

