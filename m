Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5C34756DA
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253147; cv=none; b=GOZsGSHski4mJbd1TU2gkXQql/WQcfTZ3uZtWGpU/wQAv0r78S+ruTjozJ2jQovT6hUoKJqUDl8Kz4e5S8xrP1NlXeZRxk1q1vMJp21uBjpO9Wj9kw/yDe6daFgIi7NVwMX8eCXA3xh4HsF7jaCfGlgbtkyDz2xmozdu4E/xe/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253147; c=relaxed/simple;
	bh=gtRV6Ewke43YWoD7VGaNfgttgen5p0Izbi4DKRlrJlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hcf17o0QfgPDol31ZOHuseskGjjHuevILx1q9+aTMkc6c0f2uabB7ih8aM1CIW+YoQWOjjwIgWM+t4wyL27IMGTyxPqOVABW2ry1IaLWpDCrVZQ6OlJ1IdFoTrI62YlSiYW4ujf0Oo9FuagjhcnDOvfnqwHjGsqO+AA2DIzj0Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Uerwpnfe; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Uerwpnfe"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1c26d7e951so775511966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253143; x=1788857943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myNLA1zehJ9sNi0f8euedNSkhaiWUYmsY/g28jpA0NQ=;
        b=Uerwpnfe0YtAHFqu0fEgO19FcC3HQH7V+smK9iV8U1IkjlhnJiRtIvYYJKkpimm56C
         KC7njpMdkKSJtio5obECYIA+p+NdTalx1AGgWxxtg3v1tE7Pi5no4GhQnf4sn//yeqA8
         eh0AGdgErpC6FSE1lqQLa8+NQj91y8dlj3Sx9MrmB2OXKw413JrW1UrO1phnXBfUCbmE
         PxXsiar2g86MZ1DUJkdfdcaJONwUoVDNUv5+Jch5ZfkaK+KGFQTmG9qLxfcEH79rWe3E
         S6PHJqR/5eGBZXgJN/1VTkvrg1z/f7RBdcfvH/r0pDtAdUs5COE8XqhNpEBCI7oWlsvU
         rPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253143; x=1788857943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myNLA1zehJ9sNi0f8euedNSkhaiWUYmsY/g28jpA0NQ=;
        b=eeL0EOIZl6rinA1Um2pp22KacMyYbZCr22wDmh6MKZdrGNktruu1wpaO6cg2Eb0r7T
         MJ/SkfVUlY4VHQTzoTciYeIt5SpVWZwZeZtXOHNrKcQjMcpmDD6suwV7bCzNlQGC+I8e
         nItMgGqpKmB8E0LRgcmPG2NkQslq+VU9I88SUT4iEP6bHQggu5J5+TjsymZVw8y7VhiD
         kwxv+R16OUZYONtcFedeIWcMOO4nFW0BPJs3qHUhWQng9hFlsaQdKVlhIVVYI2l10rJY
         wudUYBnlT+KFwFnG2dDRVlXqxEUdmiRH0erKR25NxRM7b+ncKi94JErAhZn+y09bmGYc
         4n7g==
X-Forwarded-Encrypted: i=1; AHgh+RrN246xqLgMwMDiDHup4/QLOzys0OSNKHBg8QZ+jpy/K/EDs4qvi0LDK1WjtbFSHsxywZrU5arAlSGwIZ1P@vger.kernel.org
X-Gm-Message-State: AFuF++nHSVhgHv84Ck6LtuZPWZfAVAvJuEV9JUmJz1bYi51KsSqX11XT
	g9vy8RNI5aqmSTXV7EQpqslB1EPxiVcvU57M+AjDfA1SumEgBwF2QIr58ZBDY+XwrAI=
X-Gm-Gg: AYBFou2nmVfImRvhmsQjeOLzB2fhQ0T6izYxA4gz0y/rSfaPgSTCMcHHcK5iyqMD0zi
	iFY6PSu43fnETPVdGva8uwDnwwkTU1bPKrVAPG/JF7REQwQ0D/uRpf5XxzGtptj8/tOnlubrbsH
	GFPZlaRCpkn5S3SHE69io2JnKPaW9AM3oiDV5h/MYOiFhHYHL5q4fpREpzf2g7boAracsqDf9V8
	CCccD45u9q3Ddd31Vt7KIWCQ1ml45cLujHKwXgZ0KTzE2emy0xqK7OPABLW8NBpvRK8TmIwJWnh
	oCq+FTof7V8NyYYdYEE8SsqeboL6uTlXafh5DkmsbE6XOIHuPVMOCJ6LwJm+mqW0NJ0YfRhVeJ5
	toWLadyJUZ3+sVOdhjvwWu2UWODgAJfQWLQC+LM/UEi+sbdcEtSH8o/lMIS+elfMhUpVF/3l/aM
	MLUTyJWuSpx+qp36BGTlykJqahK9wLKanrrEjclzd2GlV7PuokH8dXo454AxzHrm04OKqE9Xira
	9FNccnBObgjHU5rX1h4iHIwaH2WLeW9cPRfzgZSp9JGbJrMsorHag==
X-Received: by 2002:a17:906:1005:10b0:c21:4393:c41a with SMTP id a640c23a62f3a-c25b3c9a988mr335100766b.11.1788253142843;
        Tue, 01 Sep 2026 01:59:02 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e314a1sm511942566b.42.2026.09.01.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:59:02 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 10:58:58 +0200
Subject: [PATCH 3/4] regulator: qcom-rpmh: Add missing regulators in PM6350
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253139; l=1979;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=gtRV6Ewke43YWoD7VGaNfgttgen5p0Izbi4DKRlrJlQ=;
 b=wTcjvPwxFnWd3nmkZRvV9d8daVlU48WfygpIRhMf845BuJBjV9RspxVJnrVwo6g5N4EdjTlGD
 05uVoGUWRcuCCD5BZKIPRjjPbWFAA/0jMQgWoGa8wIFyBOKpBnkxDT9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the missing smps3-6 and ldo17 definitions. While smps3/5 and ldo17
are not used from the rpmh regulator driver on SM6350, the regulators do
exist, so add them with the types based on the datasheet.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index dd2265961151..7d20f3e47760 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1591,7 +1591,10 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
 static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
 	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
 	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
-	/* smps3 - smps5 not configured */
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_hfsmps510, "vdd-s6"),
 	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1"),
 	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l5-l7"),
 	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
@@ -1608,7 +1611,7 @@ static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
 	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      "vdd-l12-l14"),
 	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l15-l19-l22"),
 	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      "vdd-l16"),
-	/* ldo17 not configured */
+	RPMH_VREG("ldo17",  LDO,  17, &pmic5_nldo,      "vdd-l17"),
 	RPMH_VREG("ldo18",  LDO,  18, &pmic5_nldo,      "vdd-l18-l20-l21"),
 	RPMH_VREG("ldo19",  LDO,  19, &pmic5_nldo,      "vdd-l15-l19-l22"),
 	RPMH_VREG("ldo20",  LDO,  20, &pmic5_nldo,      "vdd-l18-l20-l21"),

-- 
2.55.0

