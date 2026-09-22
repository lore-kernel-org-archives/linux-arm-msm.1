Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401253FA5F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060368; cv=none; b=HKAy/r16vbyfX32iGgujV5hEokh7hxfEZSTUuiOr+nQkcMWonEl2Z0Gexj9jFaHxpVLhpDMN6CxkEIUjvbbPMOSrnkFVfXnS+tj+rASfWOtyy9q5ZEjKzWqrWwkQQpkSuobhDV7WAo9Q0YwLeDj98wZf0jA1kMNGrknKPtm1gOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060368; c=relaxed/simple;
	bh=iyEuj8ZuYgVHXZdeWaPQ0WiZOh4LrnZeOC9Ro6Ud3gA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jT38v+h2RE1sbcUYwprMvnXpITHVWKbTdnXjaCDTVtQlBM7YDXNzIa7fe4vhmsjpczUmbMwKiZrtQSrRrJgG+FCQ/+Uxm2cRu1s2e8kybIlxT2k/Pn8cNLpBFg1yKTB4SuJpo6qIc+rP8WdgSe1SzWTpFwgb2f0KT5cqOOhDcTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgnTBIpF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSI50jMR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgnTBIpF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSI50jMR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4MaIh3382626
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1LsyYh4hypDdEF2qoePNSyxQNqBxZYGA+BY
	ImKY2Xj8=; b=XgnTBIpFZgJJhJwucppSR0e3ozsp6iMzFXWuAycQ4CpZE/KnBKX
	xjlG4uUgd5ZWvwppmAFN4646cpu1Wy2dexfOSLBBPYqmjQyZfoR1oZaf+iAEe/ou
	k8NIdADkdBWyVAWtdFFs8Xh9QmolDsYwdaD1Sd/ROem4f43DnEB3lG2v74tbgK2I
	GyyKJvAsixYCaucHp2U3vPTx4f/fkS7Av9xF09hTEYTboFAEv6HynGwdH5dX/4/s
	Vnuu2DWCPNhpV8bYegJb5KNxIOsm5u2zp/62TCPD1zGppKxB2afUzUOisZI3RZzc
	I4PFD6MG5Y2GCRJow/DFAbS2836OhelITYg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj8hqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:59:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86ab8302b54so4305613b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790060359; x=1790665159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LsyYh4hypDdEF2qoePNSyxQNqBxZYGA+BYImKY2Xj8=;
        b=aSI50jMRMaTCxwpnBvlFcDY8wGty6ajBBeVsNSzb9oTPL114GAKIECFnKIrKVSCB46
         XutN/9VTyV2kDnZkaa1Dimske3flXyVx9qCkw2KWcObRYZiQYC392sFVfSe3zEcZKxBH
         Ur7Jp74d6opK7O8jd/hx9MNvni7LDLy5LuiAc4weRm/IddOlcqSQMnH+YfqpZrncAVXY
         t4tZGsqZsWu35Se5jh2av0jFxkc9mEA05eP22OKBqbkkrMtgbN0CNEHmb7cKXOfdiEIc
         78US3sxJ2RwoSaWFK+pPrZ/BFYGpAEnmyqPsAzg0ha0/0o0Qn3TbEKtcdzf0IPjY6z1J
         zBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060359; x=1790665159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LsyYh4hypDdEF2qoePNSyxQNqBxZYGA+BYImKY2Xj8=;
        b=eL/swKw1qjZ4ugM50xUKFxknMx8WYQdIGZtgyqs/v26iXMeguoSkgZqaRgxhqwaeID
         x87q/3TZFUZz3qJnmlyqtf3Q5EbzxD8E93U5jN3A013CHHL0o3d+603NDHmiVyTe1mj/
         C6/L48O/yH3b7Ua53saRY7FVTRXq8VQV5e9sbHh/Xfe6DRefBJ4UuHEjiwQPY6y1SaLC
         l3WEQH9IzAkks15mIRYbyiSriEC2y/YRx08zCN66Dja+wvGIW4BpsYmnhRfVyAUL/Ggn
         kFOFt1na+lbNKqKrjv8eo1LBO9PgrAIqgZI64LqZPmYWIkfr817+8JoDdMcRU63sndyZ
         dFlQ==
X-Forwarded-Encrypted: i=1; AKwUvByeglmV9KaFGMC1O+f7KshVob7EXts+JtxF4X9a2OzHygLCEXCgySsLZG16O+WTkqdYLPAErI1t1BsIqPmZ@vger.kernel.org
X-Gm-Message-State: AFuF++kL6LaebPkzISMW+qypuxpRdW7CbFO+Q3MgOBzmBm0jowhensTt
	vAVYu6L1GtbQHCpvepgmK/j45T1+USdJY5WpPOlagybrUbZ3CsoimO8FTscI7tyyxnjJN4bezuu
	UxycMCdbew5jj9u50WWAJtwe0EQ9Vhz4WN1vj8KZG8tb3H7Gl/+Y060RvrXgjwcM4ADy+
X-Gm-Gg: AYBFou16cDBDCLS+nevH+fV2x+IRhLxOnVaMREGRIkJ1SQu9g+OqNFtrDx0MvN5UYLg
	O9dhNMz09jbE5O/xC7IoK4FHKFUFQyOqTd0qCn7YI5D/sEwNev7nPxJ1nrPOP0NaMDhm15enUq+
	AtkMwpokQTJ65k4lMNWyIRiFQP1vBpRZaTR5pVEozmlPUMwYNUqIr4Sol9bEZKtY7GVraSMnB6r
	XwarJHlNn7ytqHJuVO3g1GydPTeMElxDIvyTYuU8ZRYHcvBvBjtyC+NmzmWPewJfhTpB0mejj5W
	lIAbQ/8XDe4aAt6BQO5W08tlDYtWwriq4fu8hToVu6sOMcIiqTUvgLwrR3HNIJRVI0CHMRekiAS
	x1a7mxF9dPDRiqdCKwDyizHHVK/pC3guP3x8buz5D25g77oCJieYqekOiCt4=
X-Received: by 2002:a05:6a20:c90e:b0:3dd:85a9:559b with SMTP id adf61e73a8af0-3ddec661693mr304199637.29.1790060359208;
        Mon, 21 Sep 2026 23:59:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:c90e:b0:3dd:85a9:559b with SMTP id adf61e73a8af0-3ddec661693mr304165637.29.1790060358595;
        Mon, 21 Sep 2026 23:59:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61271041sm2999418eec.10.2026.09.21.23.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:59:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] pinctrl: qcom: spmi-gpio: make direction changes exclusive
Date: Tue, 22 Sep 2026 14:59:08 +0800
Message-ID: <20260922065908.477523-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FkqKIWKZYCV6yYc1-3agVdr6iII48qRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfXzj3UK7elYoPe
 KOVGWy0tSQV6PGod+rdmOGipO9I4O4+M8/UIl6DjlhBW5yJ/PKXSlC6rbUqsbWXAdaZlWaJFgNd
 7mOyWWz3H03PhlAFPIMOW/CJRVrmMWlfdFKWsD4AzGLclzn2184qweGRcFRyVTiHNjVUJ3ujpMN
 IOnTtXubv9bAqe1dwNccLhQfzzIh8S8R/eMBmi4OUZi71I4D+zx9SE2///ly7km+4oIRnZr4cjD
 pCkMNBmKa17bcSQOHvYettS4LIuY575KYmWQtOa01eBX53JQ6Uttw/UDeahxNnXWrRsnXn99piv
 UXnxZRQIzMyKuQky/Lt8EP4poyME0rVIecqyi/s8ujIb+tXwBb+sKszx+7oPmmBKtHczd4YUHTF
 NTDiCXo/Hza1CVbYaXtu1JczZQasoS+Z7Mm/AbIPOu2NRn1PmuIleIq0DqNbQrrFH+TUwDm/KHr
 fjxxFc++Fxcx3A+9MLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfX2WxmEtfnr8sV
 AlOFtOk8hDO6d/PejDKA/xfkQ1qfFBrgTWhL3kWGwQ45tjT2G03IQq3JYiClIqSYhkEoZ0ImdJH
 6/omu4BzYEo4+jtc4+Cabu4wCa/yDXs=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab22747 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jHABHta5L3jSstw6_KYA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: FkqKIWKZYCV6yYc1-3agVdr6iII48qRr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220099

pmic_gpio_populate() seeds pad->input_enabled and pad->output_enabled from
the hardware MODE_CTL register, so a pad left in DIGITAL_INPUT or
DIGITAL_INPUT_OUTPUT mode by the bootloader starts out with the input
buffer enabled.  Neither direction callback clears the opposite buffer:
.direction_output() only packs PIN_CONFIG_LEVEL, which sets
output_enabled, and .direction_input() only packs PIN_CONFIG_INPUT_ENABLE,
which sets input_enabled.  Requesting either direction on such a pad
therefore programs MODE_DIGITAL_INPUT_OUTPUT rather than the requested
direction.

That silently breaks both directions.  After gpiod_direction_input() the
pad keeps driving the line, since the output buffer is never disabled.
And after gpiod_direction_output() pmic_gpio_get_direction() still reports
GPIO_LINE_DIRECTION_IN, because it cannot tell plain input from
input+output, which makes gpiolib consider the line an input while the
driver is driving it.  On a board where several regulator-fixed nodes
share one PMIC GPIO the shared GPIO proxy reads that direction back and
rejects every consumer after the first:

  reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO

Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
direction so that the resulting MODE_CTL is DIGITAL_INPUT or
DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the registers
once after walking all configs, so this stays a single register write.

Pads that are genuinely bidirectional can still be described that way
through pinconf, which is the interface that has always been able to
express it; the gpiolib direction callbacks now mean what gpiolib says
they mean.

Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Drop GPIO shared-proxy patch
- Update Fixes tag (Thanks Neil!)
- Link to v1: https://lore.kernel.org/all/20260915014447.282121-1-shengchao.guo@oss.qualcomm.com/

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f6dc43e27b38..eb4431591331 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -741,22 +741,26 @@ static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
 static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 {
 	struct pmic_gpio_state *state = gpiochip_get_data(chip);
-	unsigned long config;
+	unsigned long configs[2];
 
-	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
+	configs[0] = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	configs[1] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_config_set(state->ctrl, pin, configs,
+				    ARRAY_SIZE(configs));
 }
 
 static int pmic_gpio_direction_output(struct gpio_chip *chip,
 				      unsigned pin, int val)
 {
 	struct pmic_gpio_state *state = gpiochip_get_data(chip);
-	unsigned long config;
+	unsigned long configs[2];
 
-	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
+	configs[0] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 0);
+	configs[1] = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_config_set(state->ctrl, pin, configs,
+				    ARRAY_SIZE(configs));
 }
 
 static int pmic_gpio_get(struct gpio_chip *chip, unsigned pin)
-- 
2.43.0

