Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604664;
	b=K0R5bgsK/MiKlQ1z3pS9H+AQaEu9nHopSrKCyQe+DX6z8LTe+9xptyJ248w64A1Mppoz
	 Lz9joBgabx4I1tmrxS8IruGaZtJq58XyoZWBNyFA9wr1EMQ9MX1qrctXVZ3x8dAG1/vV5
	 3mp65h7CePtox/8otCE1feQWxQtoL1TQbnovOqrk3GONFMGdQnU7I69TzGvmNr5AjQA80
	 d31VN3E5iDpf4+gxWEd1hAy2VNbdB2TLGOAw/NXLIw5eBTi0op5MCE8qJKlivWot8Kd0U
	 3jfkpCIz6SAcYhmdn/gI+x7MKu7kuWZyNF89i1CyS1oNpgBm8Tuise0DqBERxP+yvRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DOeDBZ341dnAxqMqy3hGN4NCfT6SI43HZ8hl/CHGhkE=;
	b=pvxHkKPtlEd6yAEzPXb3bxvX21uEyFhcyD/TIfxiUqLghG+rxmtOA+7SksCTdiudvWkP
	 ESqGUxmHv/aBR+RlJtZb+gp4+UMtjtrsanAAWtOVlKsnMvlnjC7n5lhIuH7lNEUSuYaRT
	 NXSQMp4qa42uN0D3664p6FU3UdfhBZwQe7aczcPRq/mHv3Go3s6GUuLuRjRQvZQwGbnaZ
	 sbc5LH1LYmj1PAsSK46VfVtw3/DW1RHJgA0zpKb/jDBiNuo5mimBd8JgjyR+2A4RZ8r1x
	 YMrLIIxOjkWDUbHdqvB1+eyZ7loYfaTm2PsuKjzCYO0uT/uz3ez+ZiiYbuB65RGvTwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zKS6PfHF;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C070E606A33A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C070E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zKS6PfHF
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso4893525f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795604662; x=1796209462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOeDBZ341dnAxqMqy3hGN4NCfT6SI43HZ8hl/CHGhkE=;
        b=zKS6PfHFM3i0b2rOd75UH6dya+291HBcxn9HmTyjqxZ2eQkvMkOBf4LGd9nekicGy0
         phkVUfNUiJcTeSDb9MZN9KOaBuvT5nTjOmenR80TEkDbhVGo2h2+JU31cr+W67wlxfhP
         qnN2IwyDpaQLn2eYOXjFZO1FIBSdhNsr3oIS0od00Yc71TwBalyrnaEelMZViRaH6gBp
         rJkyVbryTJsPDKPBLVEGutbqTBYhhcNjlg1n6VyVQGY8X7+CzpCI4HPQy+7gbHIp06qv
         W23j+E6Dp92hwlkERWSgoKvLOzBNxQvPhskppq/e9lj3+qT56ojR8eXt9l19EXpv419D
         +BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604662; x=1796209462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOeDBZ341dnAxqMqy3hGN4NCfT6SI43HZ8hl/CHGhkE=;
        b=S6JU6H9M5LFYdGaWfEOtoZvSXFHroLGwJ/b5gBC/e7eu5kYXl6HqqVzvxq0tieI2wC
         6Y90+kF2zqNUm8/CM/aJ6ofVez0WnMlfXieHfT42lOWgapNcgMafJ+avzCbYkpk5HcHV
         qMzzbqU911PFsGJAFZ1GdZfNWu2kuPMi7nFjtiTC97Z60uqJGbcMILMFY7rJI5BvuJgz
         J9TFCJSn7HsBGNb/UNe9o1tImZwmTofVVNNfNcQDHxpBHxUI9XVXdKlcPkU7cFmLFTt9
         5v4a7lXoWS3BJgLkFLnKUmCW3lrQ6UrB2ctCsEpIeSlhP5Q1vwuDfWqrjHDCx4fp20rs
         oigw==
X-Gm-Message-State: APuU4Z9Qr/RMUg7RH07Z5icFtVzMpXXNGefiiQrdtdOClltXvhVbM7mL
	7AaicDV/x8pUOBkAe1xDDiEaMug2SOfjC8xFPWLqjPNnEJoU7YiFDRucVzOieKX7Zao=
X-Gm-Gg: AZFdTZfUz/x/1wJ+VxFwkMfFTZFbYPkF41nZNAhmz8kWiDQWVwKleCm+3c80fZmcUGK
	MeVLsGBKWTW1g4MjpAP9+PlNzhr6IKrKP4+4aQywdsVU9piU47NRUQP7Qmf3iGguLFQcVeCAK9q
	wDNw5sCd2qOI4qSjXyrlnf2TR0DwPSmq8+bPf+WHHE8XAwCG0ag6S5lReqh1gnht9GM978pAF75
	5AhzLtI3qnXVobGSHCVVImRstXaqHSq9eI+T0AhrhcJZGunfgZyrcno4MhnJ3W/l8EEUU2A93FB
	dtlJZbMlKozOB2QmhXbdawTyCcv43oyDXu2R1QUzhzJRSPt9C3pvgZAtmdhJIJBhvQzqIEJqzHO
	mADdcjXSly16DtHI+pS1UBEWDyqUsh8e5JIy7pZL088v6F54Kf84DWMAr86ng47JalrWZF16lJJ
	9c5qypvMCQEZypoiWcAU1Zsgm4bdD+9mzbgQy0hp5tfMZnxDtKqbnjE7WBHc9dRfKkKA7nNkizL
	e7Mm1Bm7eRBHsyTqSFhiDu+i6i7TTENnUBoNP+S9JqmwJARk7xr7i8TzcykIHFBoD+lRdDPAT8u
	gh7Kgq7weNQDLonfHmr9RASQf1JnKvJak2wa46jU2n+whdSp6WlmkVsRMjDQKTnzeubShN0=
X-Received: by 2002:a5d:6f06:0:b0:4a6:8d5b:7338 with SMTP id ffacd0b85a97d-4abb3a4d35fmr35192766f8f.37.1795604661986;
        Wed, 25 Nov 2026 03:04:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm34532250f8f.2.2026.11.25.03.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:04:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:04:17 +0100
Subject: [PATCH v2 1/4] usb: typec: qcom-pmic-typec: pdphy: disable the PD
 PHY on stop
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
Message-Id: <20261125-topic-tcpm-qcom-fixes-v2-1-6fede9a69f6f@linaro.org>
References: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
In-Reply-To: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dUMEvv3krWxA+TDYHGV5SCTqDXXRPTqDZwpXialeofU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsCyc4i4NAo/ezBHPBI3du6HFGDa0DhGfe7c02dh
 ohALEouJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbAsgAKCRB33NvayMhJ0ZI6EA
 CBqNfhopOtESkJjVU999R6izxfDn0h2njZNZFufykyaHhhyQePQdZeY87tyjWxQlQJAj0Z89hOAsSh
 zrxQBHORYziM3tvd47x11qrJgSGlkzGFOTNN+sZ+4plJo+da5UqY9jCp7rl3jrWDg9qOIlXZW2Sffk
 4+LuIPixyC4olT7dTILLIKptf5obpmPPsvSBt7XuQRV+oZJPJUKskxzKiMKwTFQku/Mtth5QHPGvo8
 cZT4W2qnuAEMD+NBCJ4o3eSIDGpAZR0ab/18XGXZbMAqFYzpKm9auDM6L30GRp+HNzGHsYLMIh6x+x
 5cmdzS0dRzmFvmAAYjpxoz/e9Th+Qdgxmojzu313yVwmZwWbI1PXfeJ95dVy8ZlJDrqDOPjNG/MwrE
 m4HK1uuX6W324U5Vp1eADkEB7akCqiK/eP5iNxfghlfu1jMp/R1SeD2Hh+WXF8Gp8SwrSN/DPYs7ti
 YzD//copOXapU9hq9VqpQabZCvqyXJYLhloXKqzOh7RppXTaXYP8YJ0+4m7BqU59m0rujLdMyvq7H3
 uskJkeB1KIgH+/EDgnEm4BKfgY9mu4L2Rapw76/uHLbtrjTb28JvKmFQk7xEzhTxTU4XsGydT75K/u
 a6AfCKzbL1Zo9qf/1g9xw/J5TfP299+nvPhC2yKm8CPwx4KWfJAdYIAdglOg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

qcom_pmic_typec_pdphy_stop() only terminates the ongoing transmission and
clears the RX frame filter, the PD PHY itself stays enabled.

Use qcom_pmic_typec_pdphy_disable() so the PD PHY is also turned off
before its supply is released, leaving it in the same state as before
qcom_pmic_typec_pdphy_start().

Assisted-by: LLM
Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 435e07659d65..08cf65951796 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -545,7 +545,7 @@ static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)
 
 	cancel_work_sync(&pmic_typec_pdphy->reset_work);
 
-	qcom_pmic_typec_pdphy_reset_on(pmic_typec_pdphy);
+	qcom_pmic_typec_pdphy_disable(pmic_typec_pdphy);
 
 	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
 }

-- 
2.34.1

