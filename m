Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604665;
	b=SE6YP3XYtGT++1B2lDiN9S4WSFLiZ2OHSkZ3sG0jy5Ysxxy1dxHFKxJK38YJd0xDh9Xp
	 dDSUS368zGgcwuXvYJOhRPetK493vu9xjdzadWlA2HdNySJkhjawJsfjeeC596tHRwXCF
	 o+hnS/lKs+IWXDa4840OOZErGOKcdej2/PlpbJMZtSOp1DMN7+QBmiYkP25M9l6nD+szf
	 36a6ahmV2CVBwQ5havbGkYN6WXedE3Loq+/ymWZGkMyHPGg+L9On+UGr9KVY5TVLCRAt6
	 1T8Mjs4rKQZSrJKCU3bQmz0gP8eJ8KSGa0HFCQ/VFiwKOd0FcMKnALxxjIaVV3DvfDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=xVYwLQptQkyCuKBhGnfYLOY7fLR9tn1ULqvNq1oXzRk=;
	b=ok/F0R2Baz8DFZdclc0hZEP+sHUfMvzMBvYLj7EPy5v1/mZ4eJu3eTYuzg2etfNmYn07
	 2gsy/TC0lBS5+Tlp7IsyybCV0QnOSe3kw7ptGYmsx7Y+gyUwGi1rV/+tovrezxDT6pSfG
	 2AIvGNtbuHdyYw7v9CwmXEG13ywonmYAZSryG5OFEOnlo8ibY+yJ64tp6iY+OzowbJS8Q
	 +g3EAleDeRzQ3zESulZzrOHQhNRZYGYj/O4Fi4fl0yLcY6c64laeM1Khmk5Nbhn/AOy/9
	 UXhZLCg49kdIA8cAPZXq/GvZblBkKZ3kAqXTTXgnXBsNVymy/b5QcSCRs481PrT7NrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sFT5D5BP;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5DF606A685
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A5DF606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sFT5D5BP
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so3962757f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795604663; x=1796209463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVYwLQptQkyCuKBhGnfYLOY7fLR9tn1ULqvNq1oXzRk=;
        b=sFT5D5BPSZOJhNiYGc1pvsOGfxbbGScbxvIMeYR1ibq4OrmijwARv9ATZglUlCnL4U
         +YWs/olbXixCuI+UWQAovIhi3fqY1iHRpHQUMtZ+U0oJm7wV5etXKk9UEqgQzqzpx61r
         r9qy94vAASVaS3YxdMvhd36MAG/4j8zyvy9Uk+qOIsvCuypmqji2xtgaeIiu/dO819KL
         lx/33A3nhEO1nx6bqNwGcRKFQUBJ6pl8wQrtz8iVRtMdneso6JsJ3vLRH8L/64RXiJOy
         oNAy/cTv3h+zFO4AoV+7BAGR5XEBG/0J6oiApga3noJBxuNQtyObufwrQLcpG8p6BF51
         mwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604663; x=1796209463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVYwLQptQkyCuKBhGnfYLOY7fLR9tn1ULqvNq1oXzRk=;
        b=WJkWDSrswT7u9dYohugOxXoXe2idP9vRV3SRpNsVPON5QyVFD0Hyadahg0gc2Oi8VN
         20m8Yyf8lq2bXOGfFl5wf4gekfYQ9gsyg+qclRNi3JrYlAldR56vNf+oB7lVWedaCbWf
         5kMR7f/rmch0YqNElpl9tpwWn7IKz3H7Ix++cnkykg7k5WyBA5vxoJfDHiIG37rjslWg
         0NPer6KQZOfhyr6fraIM78CL1xvxxQwBu6GgAZGyH7nyyXlvtLKof+Apm3s4FIiM35Ma
         2IqqrRT9Ftoq+JSbljTF7x+Z7YLWwr0l3X5So5hsjywQ802o11ZM9q1DF6XDRL1Pd+4x
         epDg==
X-Gm-Message-State: APuU4Z8voR4xoIuCgwXdeh2E5GLQsOAeqtZS/vSJyYnWs6Soejq+d//Q
	/wfyEMZ1hYyR39MqkN7Bnr0ROlWuYq+4fTwcqBjJhW0ndRnPIdTi3zHmOOnKzLqrlvY=
X-Gm-Gg: AZFdTZdB3Lo3hDb4K4X7cE71TWOVlxtVloOsQSHe5g4W/AGbI7IJQg6o2/W+8xpDPOG
	jHKjWPqbNOnQmJsLy+j877udUGLo6dSAI2oGonPLHQkjrtPBZ4FXfXU0Tp1onyk311PVWZdxx49
	RhX732fOArp6AM2+5ThqDG/v8+rEzAbTEzudq5O69A0VFVrTqNdxFopqUeRwTvrj6CbNA9Sf4kn
	fG3ya/VGLgT2anhIX9qDl26vDhfaS6UYyU9f+zq3Z1WWVywhMoq1m3pzrDxqruQ1axAJVzOLABe
	/pDn8xQsbdt1RK0u/+/FHSw9uS20zQSYaJJM1Na7RK7x0/4STzRXkuCHMY3PlN8mW42jaXDWYLe
	nMBnHwOSS0n7Rh7ZVWBM2e03Z3KUPzRN+urX5EB4NH4ChPAmu0rM6ucFAwRTl7LqACF4x85kzgM
	W7yJpuulFeP3u1ODdwDlMe9Kn8WJv2KAAbSQ8gf6SZMWnbRG7XSfmSgtXyd/IKEFOOshtdoOSWO
	zp9jZw7K5Tr3a+PUNjrpqN1Zb/uBJqw9nieFpU54NPHbITexz2/ZnSv/Dpd7fL3lsyZRtz9u0Os
	ZLfDFqeO5A7d2Wl5XbMpNG5iKMyAr6iDiN7HNYvqG1DYNyo5Kw==
X-Received: by 2002:a05:6000:2986:10b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4abb32a41f2mr26859347f8f.39.1795604663354;
        Wed, 25 Nov 2026 03:04:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm34532250f8f.2.2026.11.25.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:04:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:04:19 +0100
Subject: [PATCH v2 3/4] usb: typec: qcom-pmic-typec: switch to SNK_ONLY
 before DISABLE when disabling port
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
Message-Id: <20261125-topic-tcpm-qcom-fixes-v2-3-6fede9a69f6f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wZ3V44vChkvHDcga4+bvEukKI6NXm3A3vV+3tvY0IgA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsCzRXNdENuqml3MNAqq0u5gGshoBpK5zo1Ys1pQ
 d29kcmSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbAswAKCRB33NvayMhJ0e0WD/
 4yMuarLUKQZQkPWdhDGaP11duAJNqHv5UqQMlekn5p9uwipfIae1H+GrXd7XwlYvx3D+Q62eJpUpsF
 0agB3OBOP2fLddP3vc/WgtyxQdga5PL7OkN6L+TwrZPqkFUbj9qu+z6BHup1EkAYyzgqCLlw8AqXHw
 GuDr1iDp8v2RQj+E7AVUrqU3zZMu1TWhbPr+g7tbC77tZVcGTICZJjsGbUDM3GKwdd/hwy7dAtrJE+
 PiF9XsD/50yrjUNSKs7VGzZzmBZp+8FZteF/QFUcbI17OqmldXZjnSzNOE5A1qubhA1314k5q6hh6b
 57rSkMCL2rQd3Qa/DxSAju/3o6CWaPHnMjSu5JFxYH3/UWjhYIddSHNgXzsGyPpv4Gd1U3C+x6KGPl
 iMdTy48Zr+xGNmekXZwMtf1kaFOqO2orka8jNnUxCl3bFZZudL8hEQW7ZmsG9RkJ4IT13CukSLiABB
 wIiHUD9ic/luIAVZ1j0nCiiuDok67YVZpwRkR2fLLoRLgXcfY89dXkJAEB8WCRIqTA+jonQf8llwlr
 AghXstKCMjOcXuJ7pYfDj3jWpGhHm7t763AFAzS9/P8BJOJmApJCa91NzGmeneXkDzPlvfcEr6Q34g
 lIv/rgqBMGcSfff4ohAlEdFtyqts2BHw/vj7SZeVDFUihgbI1Nlodtjz4Krw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Disabling it straight from DRP mode can trigger an over-voltage fault on
the VBUS boost, so switch it first to sink only mode for 2ms, then present
neither Rp nor Rd, so a connected partner detects a detach in a safe way.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 710acdb9689b..f125ac722e8b 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -705,6 +705,16 @@ static void qcom_pmic_typec_port_disable(struct pmic_typec *tcpm)
 {
 	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 
+	/*
+	 * Disabling the Type-C block straight from DRP mode can trigger
+	 * a VBUS boost over-voltage fault, so go through sink only mode first.
+	 */
+	regmap_write(pmic_typec_port->regmap,
+		     pmic_typec_port->base + TYPEC_MODE_CFG_REG,
+		     EN_SNK_ONLY);
+
+	usleep_range(2000, 3000);
+
 	/* Present neither Rp nor Rd, so a connected partner detects a detach */
 	regmap_write(pmic_typec_port->regmap,
 		     pmic_typec_port->base + TYPEC_MODE_CFG_REG,

-- 
2.34.1

