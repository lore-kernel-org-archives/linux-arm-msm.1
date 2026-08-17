Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134C441037
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979366; cv=none; b=AwsH+EfEDGbrDOpw3za+jLy/Ws4iSoSVYKUz4p5Wf+8LRpblaTSMH7+CeamPrKW1UFIK3e2NjsGKf/u8PtLcn2/3YouxEm3zJdsj+9Oz1OaSeDYnRX7vJ1MqbeAcER0TVZKSB7/NBr30JI6xdnNpov9qbD6LIjL43CX4J5DKc2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979366; c=relaxed/simple;
	bh=jgf8SXZZdg8yn7G96UMAuhh5WZwvNapKXO0ftwAr1TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MvXlaHHvikhPaHN8sH3RkppY7hnnRq6dJFxyI+fee1RiFPLiPbgfe979WPn9kr8Y5hc4FcoF8EOszpdFOJHgsyPj7U8xj3WQYy6963q/IsRy3adydw/SrWkuHjS08BlpMny58ULZBLTK5ZPOeWNk/w9KhVuC6FH9nwapBS84SlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFNpknGk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+8P8dDq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFNpknGk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+8P8dDq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6I4t2937176
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 15:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=; b=aFNpknGkKOtel48o
	di4WhHWTIXkUUjvdy8PqX9QoUl7UcGRtp860aJC1aUdWiS1MBdeP0pwZHfxkKGMH
	CCjtWFQy+5ickmg2X3YarM2QIio/t0v4NJ8VpIMosLHldkczdpCuwJdKNQS1XiMk
	/bPMxhSPmMIE+10IuWLpFRkszlIqRqh9wt7Rdy4+ujnlh//cn/a5wiAmXWLGTpQc
	FyBqcCoeuD7ao8lmd6WL7YMykHRyg5SAhslOBuPNZOhgHgYbhljC0IYsxm9omIfe
	h8Ou18ifl/immbR8SWOoHMVfvHCJsIwuWlXZuV/AXTWf3NlUJKLbZ6S7NgXFyci8
	7BUMeQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7su9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 15:09:20 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66c767e23f6so6976280d50.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786979360; x=1787584160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=h+8P8dDqbGMAAOMQlnLLyVRtFpS9dQ4KtZoWhBV512T5t+m9knKlMGzitiIHgVzScB
         LGOnkqTR2hAKSFwSTD2nSvvcLR1JBSSZe7TCU4r0J6eyIpeulzVC76qOvAvj1yrr7SWp
         C9MK46EFZhIQrVaeL7j4ckXXLG6kXkzG+5p4lZ59LC0qumXrSiTnFxtngtcHEZWFjHox
         Sf9UXYuArRTnXdGRF9XbqqAUTAtfrEzvNnKRwRKSUn7xtSoZJphzt1jEyTNZkJraOxn1
         9KJ+lfEhlIqylUgG46x+PtnHOH3E+ie810UOSWDjzQssmgHoOEa2EXcju2rzZgs2F8Sv
         tIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979360; x=1787584160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=YPDe709E9AnxbpGSdged5dAmyo14wZH5shk3Ud/OA0cpSn+dCZmy7hJjnkr2b9VLkU
         ONFTBQ8GFtUbOEwEr9nondCbpeK++G9FYR9jj1WnA+oYaqURH2HK+YyIdtRjMdL1+dSO
         //9jqD/otNUG+oJNGgbahNrNKzhPzPs0I3TGOwgfv4c5fOKZXPr9xwkGbQbbrlwSlPBM
         eF2+NG90s6qFRSV6DTrHnejtDn2d3vkl0swElU41N56oyZZ0r8O++Z3UzRlt8jTSETZO
         Sdh5iVII39/erFJvzU1U3uO7CTDloyYiG80RN1axDk+qldF/iWzlil+XTGcO3orjv0mB
         pvNg==
X-Gm-Message-State: AOJu0YzqeiCfcvqnf1Tk5/KcdGq/9Yv6+JxUw+IaPVnHysfT/UHlsCg+
	oBqqy4yiO9OXOep4/c9fJiQ1zS3ZH8x+SIW4UtK1N5i8qfKGQ0O3xt+6p2cjBOn+YfHsbRy7AQA
	/f1vbW4VM64AA2/ycIQ/P/5LuugqTFYrrlImZQQIC0DOssJozoQ/u45xE9HikKBYgZ1Gi
X-Gm-Gg: AR+sD1175BO65eunRAsYVSey45j05eoh2HOroZgP2QBrCF+JAXE+3qDKsa96S83HmC/
	iLlxs1+qj/zfllyZGS6ZysARcyyY14kQJygilOawUldmSTQyl3q0982xGRFEs8FwB2gj1K3dy4d
	h/5Ti2sUOdv0TyVjvObNJS2zdi+HtHFFuEL+zUj9cKupxpx5Yl1rLUKWj3VA0XnAzCUbL4O2MkM
	yYhzLdNB2itR9i8AzpW9iAD7JBP7fpEXrzF3WR2zPTHIgQCX9SNjTN3pLPpAXWak9ufk9cgSwJy
	SW5vQOYY2XB7fcvVibLiskL00kLMU53VI5bHM3A09R3FEfIWi2Pf+M3wCYgjt3nVVNKGAU3z/0b
	kNyUHE9HO6JbEfFt3+WkbcKvqmuESKoj4cqxISLsyXC3NP/AN8w==
X-Received: by 2002:a05:690e:e8e:b0:668:161f:c7a4 with SMTP id 956f58d0204a3-66cb9de5339mr458778d50.23.1786979360024;
        Mon, 17 Aug 2026 08:09:20 -0700 (PDT)
X-Received: by 2002:a05:690e:e8e:b0:668:161f:c7a4 with SMTP id 956f58d0204a3-66cb9de5339mr458762d50.23.1786979359621;
        Mon, 17 Aug 2026 08:09:19 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:2c9c:bdd5:b705:b119])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cb3d377bbsm938108d50.0.2026.08.17.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:09:19 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 08:09:11 -0700
Subject: [PATCH v4 3/3] firmware: qcom: scm: Allow QSEECOM on HP EliteBook
 X G2q 14 AI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-glymur-send-v4-3-3fb89cec703e@oss.qualcomm.com>
References: <20260817-glymur-send-v4-0-3fb89cec703e@oss.qualcomm.com>
In-Reply-To: <20260817-glymur-send-v4-0-3fb89cec703e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: yADv9UdUIeg8ergvF8PtThHV1Wzeyx6C
X-Proofpoint-ORIG-GUID: yADv9UdUIeg8ergvF8PtThHV1Wzeyx6C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExNiBTYWx0ZWRfX8mQUVLWBjdwN
 /msEmxHVFdRswVOoMML+3650Z4Dvs94VKbPVhBDbTDle3mEWdLrG71oI/sQD1LO7jQsaJke0ual
 59EP1v7skPtnNqnQEw+RCt23PmbHr3t7PFEOz8sDO0gqC+hWYc/SVNUPelahQb2IFZqAHmXmg8O
 anUl9YMpSSxO5burnIrTDqS2OuZfLLRW/9QdRTI1Wwty7aNgUMbE7I2dbkjDeSqs5LJTAc2CBe8
 M6VdpSguasBWv2i56gKAk1FwsPDwW5QjklCZIM7mjjzODAP2MbQIgJA7WxXlNOiPDftKPhDWkdH
 26wWK6QY5dR2Mz4i5su0KnMYG6j45LWQN8gi/23lVaHsGDbLYWxzX5GjTdk2vfauzWLKRrIdkpd
 Iz/oFRJPItwiWzjbDSGI7ibAQoutBAC7F0kaSTx7ZIq+Hpt/PTdoH4GS5PQ+veGNhwxdA/LpcJQ
 5U85G4afuz6GRofvOCA==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a832420 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=UXNKUhSJZRFg4A5DIqMA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExNiBTYWx0ZWRfXxttJ9Cc3BG5+
 T3zT5fOBfaF3h+s7YePtHFMbaXDPyyWScgJ4Ee2VFEkhzkH+8ndS839COZFCWfPuuI7HdyClZMk
 DmKtDzzicMWSZZgPia8D0OXom6uqtXY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170116

The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Without it the kernel reports "qseecom: untested machine, skipping" and
efivarfs is empty.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..c44c63e1c20d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2311,6 +2311,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
+	{ .compatible = "hp,elitebook-x-g2q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.50.1

