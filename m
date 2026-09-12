Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F273F1078
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253598; cv=none; b=dKW7bQs9F+XI6Zh6MSHFs+Vyqd+bgfK6Bm4hsu5tKXxkQ0muZjR+TLUKwc2FQ7DdIghJwKDnQFDF7B02aP6QMR1wBjtw6YJl51ywvpgKc77ZtvUsJqrvOSOYc6TxwJatR14FIKCKiwZsZYZmUVn/DgQlLpteBQfc1f/zz5EcfNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253598; c=relaxed/simple;
	bh=CxINbAgj0KrvDpn80rfuC0LTbqzZ9PR7KL+bHMKUQPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tkGYJOjoAHPTEcp+dbYUZN+JTcSy17ru/2IkM2I3hcGplT1WnZe0dJcv1R0nDngTps2KnJxOk+ZuJYacgEiHlxyWkj6CPuqVDej3TtVNtBe8vzYD/LbJYhceMqJJj3vPjQPnw92lDwChU1qXho3IQaTBAFoGV2v7aUZzxc0KYf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owe+Eb0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkAqggJL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owe+Eb0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkAqggJL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLoFV63673878
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HseOcJDMkSV
	2wbU7KryEfZ/oIZYLo1W223ZlnWsKMso=; b=owe+Eb0SQ5iWsXh3cPMn4r6vbWI
	fighoJnvEZkaPKFEMGUqWw8+3YVdjzylbi7CjKJP1nzJgoeAJvC1UigSGsYKFfFa
	3jV8KhYqqxGjHpKqYA49UkkfbhWpSuVL/H2xK7v63rNUISAmJIZVc4ksyRYVGAHy
	UKICzxPaGjHA4BeYMOgV9kaUpZXP998OeJv/pdsiRNClw5L5HCXKn5z7+DxyUHZ/
	fQcjE5dZIzkCFwA2PZ96gO440o7+q0ZhA20ZncG/D9evpjbocnMZok4809Ym2I+6
	5Vs6BwlIaHgoJWJJC7vhvW9GPf3TmLtmc5zKRSSx5bD1ImVqNedG9+adjlg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd236f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso3748156a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253591; x=1789858391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HseOcJDMkSV2wbU7KryEfZ/oIZYLo1W223ZlnWsKMso=;
        b=FkAqggJLDJ33m55Qlwx4UZao09tL05vUTx0AuCS50H9Hetai9JqnlC1eC1Z+12DlUJ
         pvHR0oXpN8ExkVps0DVT9VoK6VaM1Yc9PaXVsh21TYLRWlIj4npViDXE7aF/H4t5IQAs
         EW7k/EQtnvRrI10fPWd7qYR5FPGzvFwMLDAutGAO7Zpmb64rtD0EsYcVbN7ArhxkrFKJ
         W/RTi4NCKf7Y19bkpC9WVLY4/YamzD5EZnfvxJ5eiPiwV/CsEaP1n4AZFxD+s5+jb78y
         ij+1fkWvBfsHAz2z+qhflFx9H3tVjrHvv+pXLLvFn4WYGpQk5GmCKMQOw4Ck0th/yhRV
         Fwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253591; x=1789858391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HseOcJDMkSV2wbU7KryEfZ/oIZYLo1W223ZlnWsKMso=;
        b=er3qhUvhAp0LbHIUIIVC+7GMRiGIR29l78hHGncOQGD4xXhtZilvkF0JdgEd2/ZjcU
         yMdg12GY27beDAA8QUGsWH7RGS8jLs0e54oBYZRbywrN3cCpUGB9ZDnrZm/tAxKL7We8
         xQjrHonwPFN9VII//j0laNBRiKzCp1JA0ovb2w4cj7d/9eid8h1YwSV3Dj3jZ297saUz
         N/p/vc8jpiObDICUiGjljKaRNuNusXkRJQndZWYDqgiM71okzXERsR5WJZOtrOqF8hun
         3cMAKV90SoX6Vnx7lE4Ea3NOjEWG4iaWrOTZfxVQdFBifCFBDkgnGXLgwu+cf5Nvz3wP
         vIkA==
X-Gm-Message-State: AFuF++lzepoOOX940hkts0xeF5+dUVGojU6c/xvTjE9nI3m8v5oC5wmT
	RqBlGqpcOgo9HWE8z2v8iUfnPEttmRQJsec+3H6ZUzBfjTtRO3WvnozHWXnZrV7qfrnXxn4V0Ka
	O5A5TLatdZU0WkyLAVFfHiR/JbsW9mY0JJ62h/wJScgS0DYU+rs8i7ORjLCLJbNthyMbk
X-Gm-Gg: AYBFou31AzcYq5+EWxS2+P7UcsJqTKaO6Azp8cAOUzvYyM3BWsfN7/gIYOtWVAsn8xG
	rUYdcTlKspbE4GW7Q/zxROOWzZa7jVP6cOsyzu6PKBLmNP1n4KeuwwNtpJcdqZMsUKXA/Q1EvcQ
	fDBuj/hCfRcm9NA9m2oH7aOKVJZYf/HFvct+Tz/0ZspLPmAiESqfoNVab9EvovXeF7oFQZhSzgN
	p1GwACFzlZoyo3zLGSNjRtfupshKz2tApQa0iwz84ynY7Lx9IbE+IEgacanwmKuaD5vhkIg1/7q
	UrmsV/babA6Kb0zGT1+SqkWlBrI5AUIyzWLUhsvRO/k+puKpVwV0xngurWgEA3PSGxg03UhLaUH
	G9Th80w6hK52KwuJuWegaQC6DpaTO44taO2nj6ijG7TnzUgeEeZMxfw==
X-Received: by 2002:a17:90b:4c0d:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39dbc6a3e56mr8467489a91.13.1789253590696;
        Sat, 12 Sep 2026 15:53:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0d:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39dbc6a3e56mr8467436a91.13.1789253590284;
        Sat, 12 Sep 2026 15:53:10 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:09 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v8 5/8] usb: misc: qcom_eud: improve enable_store API
Date: Sat, 12 Sep 2026 15:52:58 -0700
Message-Id: <20260912225301.3396556-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa5d7d7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfXzKZFjGO+2uac
 3eBMf4gM7xQU8vf071/gOtfMyQzyoQK69BSiHrxyB1+bc54piFGtHin6WLVmu489HjhKliDmfqG
 mfkc7DHXNYi/7xwh0uq8eU7FUGhA1s3MAMbi3BjdMszevi/FFtG4pE1ytREN87laTInuVYxh9IA
 l7snDTdl6fShVypK1W8XcbDky7fZ0Qn3hCDwJBQehNwxce3SNnso/IluW/jh2dQtIKEF5s9JyuJ
 33gzBimFg4JBzLCcEZJphTmS13HocDZHlzJkSTlRQcfc44Dpg30dtM/+jiLISEeL6iJG9PhMzcb
 4jqFPAU+w1C3hJzHS/SDB4RYlwuIc1PkyIC1qJuizMD25AbNM4IAlSscY5vCYoVmlQ3dCUmoZZL
 QlNdjwVxqjzWA2h5LTpyfAgW/MiThmkWhPpngzkUasxycX7L5D358r9COsa+93txoZljtoiqDWl
 K9t9zG7Uohjm5xn5HqQ==
X-Proofpoint-ORIG-GUID: D86TxHsodRuiof-8v7ofXTf49bBbfmjd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX4QceYaa6r2wS
 gxQuZkVCox8IoAkH/ocTsNlRXBOeMq7H0Def75yW+1mvwBXQIEYnfKeF9g7iWKlunjgJmuFtrwm
 pWKWrY0FPLnARNC3Xf4pWAaGCDFE/AU=
X-Proofpoint-GUID: D86TxHsodRuiof-8v7ofXTf49bBbfmjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index e2694c6109ba..d280628370e4 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

