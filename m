Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213F2390CB7
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 18:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786301926; cv=none; b=DGCTn/CsKqCAGIz7uDRx3MRnc567Zgg6U3RtKTu9RjmmElN9WARCpNDxcplMZJtAZo1t+G7viU/k6dM5lBBiA2iVMrBzwTmkdjmwGWFAOPNPlMXPSuzn+2ZcbNTTdGpix9BWkbZEyn2owPwJ+6dg9mX75C3FTJii06rugiVaJNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786301926; c=relaxed/simple;
	bh=4kdQcLHaNqH0bNFWSMBUN1Ena+T1hMkJB23bHmNC13k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QNvbKbQaU5JWK0oC1Yst61gRLV0M2Swj5hjqbx1bEjG6lN5bfSuMe1lPMcZHtnlkKM4zWQ/07pJG5bNoB379T2QdRVhwow+7RzB24W94tmSpyEvgpvqCHMEoLN4lReRIMQs3PD1wuiEfCNiBd25Lv7JafH+wxQ2q1HIM04NTiN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fdzmGQ+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiKOomIo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fdzmGQ+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiKOomIo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679IAtWO3978133
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 18:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lzRXDP37ElESnDzMwft4DO
	8ex8QQj5ZwDC+i3fGv56Y=; b=fdzmGQ+17b/LM/OO4sBPvd02HD3/+2FnqOy1Uq
	FOPjw2F2Qg3tlmacOrUzWRUGtFXyLUO5Wj10jw2Y/4B/PDsZlHXrGybTxOLl2SUr
	ItwdKRXSpJifRcHNi5wckDA0JiDx59XqxOmQBlkvo8UmWm9biMqAOMUBuyEZ/RII
	O7RQXeHIXq9CYnAn6OWcLzem+0KBWeRZayG3aXAqhk97GsVyHI1J31hWn9w/5u0G
	KUpKH3gW02XmuC4mAQYzrsdMrilU4ZMjQWMnDURNiQNzZdPxGNYjVqJR6ucgAUkg
	Y9vatBwbbhJ7SBzZUulm3VqLSAjhdqY78dL0SfmtV2JRZJQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqkfe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 18:58:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so11527341cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 11:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786301923; x=1786906723; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lzRXDP37ElESnDzMwft4DO8ex8QQj5ZwDC+i3fGv56Y=;
        b=LiKOomIoejBMbzhW2zrC/+emLBzfr3UhqflfdBp3I+hE48GlSGp5TEzuA/qoDvMcSP
         llzMM3pO6c9gbvCxrpf6DMBo7MoO/TgTcFAZ/7XzJNaOm8KAK1iVrwZnKsFenKZXeaZ0
         uDdwSxgXvOGoYfizCMeOeyGJFO85e9CwJAGn7DIr2jlJd13Oenqy6ihAWLehXk9KM2km
         Bxk8AJqv7oewr/icGDDQRGJnA5emss1e5BxsmXbBa9h0KNnLlt8U3cXN/Fj2bpdEpqkk
         CDzyytkPTgY/kR37XbfQfXPvYEGKJlMSQImqpIZme+EpsK9ycMBEOaNK3pbhZkaXRB6g
         a/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786301923; x=1786906723;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lzRXDP37ElESnDzMwft4DO8ex8QQj5ZwDC+i3fGv56Y=;
        b=AaoCelz8yxmaAL9USJz5ZNWn4TgdACOovbXeKWddCaGOZepgJuzmIAofcQiYGgtJMH
         baW/qyev8BLCc+A5DpDcHWCOGyTCsipt2zpWcgRAyrEU8Z38pGcfg9c4lE54VHHE0ync
         saYNZ4lyGptGMl7rmZ7p+uIfn1pvB/l85370FnCW6S1qQqUiocE0N1MtwZ2RLnNp0Wfh
         Pqh1NI6AIHMKR6DhDh8VTiCL35sbZYtcaHtQAe8lHglZzvh5Jmin5d+L0BHCR6qzxI0w
         mPEJRQ//TOaVuWxE+xE1CS2fZiUCoWsekY0bgeXz7FRr5ULbxqAdkE562S2qrR5id5pz
         Imgg==
X-Gm-Message-State: AOJu0Yygp8fd/AYa+KzEFIwjvEnCbmgiYG2kTb0m/K5A4Y2XM9Rc9bb6
	Mp5b4jJ425k1ZCWlj86QHFHSWZwQlmAyiO9oiRRrPjaZ6z/uXXap/DUApjBvfV4mwpR+qE6fHNR
	2HI4N0CJ9z20o1xuFeV9DeCgfyPq3CKVv1cdTVaqDjHYbfzM7sZlLmmiM5xQcegg1DSrp
X-Gm-Gg: AR+sD13tonGgefwArWfeP7TlJW1diXimahVmcrqKUrzuRUqotWQvDP5KwqBCNTSMdM6
	aFOavsem4AbNT69In9TrsKj/G7Xk/QVotNHqjw5WVB1hv1wDBde0yirxhZhs0IIfKaXAjBK+4lU
	/0HCzm6pYONccMVFXCMUczO+AN6WZe0icMrwHK+oKCN7WAJkDYKFbN0HnjLb/tT16CV5ZCiPfHS
	ZxfWx8I5rA4sJP6UFZj1TdT6oQxjvaRruVsOHrAMZsaOdwd5jICUlKGhlmoLhUuM6qd09j0/EWT
	mrhguRUomvbvx2Usxk/u/wsnCe3Xq256uXJwUQXiR2maxgMI8QTdsKZPHuw8S9w+X6UmjUfPnmw
	7tzGi5iv5PMJjUjBcIqYytKvBX2R0VY0F6G7Xw0rE8kmzjpPBLQL8VGkMufMIRhX6+YS1wRP55e
	r0Yoq/YZMbzriJPw==
X-Received: by 2002:a05:622a:a18:b0:528:399a:8f81 with SMTP id d75a77b69052e-52d20a16251mr188882321cf.23.1786301923232;
        Sun, 09 Aug 2026 11:58:43 -0700 (PDT)
X-Received: by 2002:a05:622a:a18:b0:528:399a:8f81 with SMTP id d75a77b69052e-52d20a16251mr188881911cf.23.1786301922818;
        Sun, 09 Aug 2026 11:58:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd52514sm17157581fa.20.2026.08.09.11.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 11:58:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 21:58:37 +0300
Subject: [PATCH] clk: qcom: mmcc-msm8974: add GENPD_FLAG_NO_STAY_ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANzNeGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNL3dziXAtLcxPd3NzkZN20zArdZAvjJNO0REtDs8Q0JaC2gqJUoDD
 YyOhYCL+4NCkrNbkEZI5SbS0AWjQNMnQAAAA=
X-Change-ID: 20260809-msm8974-mmcc-fix-c83b5fa916af
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4kdQcLHaNqH0bNFWSMBUN1Ena+T1hMkJB23bHmNC13k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeM3ewXo6wdqTel4JBpyKPYEM4EUeVztB3OGZd
 UA2dwH2zyGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjN3gAKCRCLPIo+Aiko
 1X6bB/4qX3fbZyLBywYfelxx/EJperTokpK4P/Cpy0VVFPQnYdjRa3eJ9n34XKgLxOK6RhWKbjh
 Wu3x/GbisfNsX/0kucffupLZRlWbtti0UsFHAY8rLCV5y0FcLR4CUtZIqYfx0sNQbSdPs7DphpH
 8mc0R8MHzf5lPoUTldrkOzAdl/0UUB1aRY1WRDA7RuELKDKOpjJf2kgQ1Zd24pnVSm8Nyp0rxq/
 qeKFhYMmU7ouLAMjSoCdXAn6z693yJHbVVsmtE3bmQOarRnkwobJPdpzgmXoH+Z5ye+MBV1fb/D
 i620jsCSjiRN8GFiznjalxrT87G5HnL0JGDHLIUMxmNFVnsh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE3MSBTYWx0ZWRfX5mr0wl5luaHG
 AXwWeOg984AqrIn2hvgN70fH8bWwI5X1nyogAE+8gZGDmCkXBwU9sFjKzJlmE/iBWT9aqq5YYep
 EER421qMgxo+z/y7t8jsw4Z3t8oaz1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE3MSBTYWx0ZWRfXx90i1PGvGyBO
 uQrqUaYac6bTcStVwOdSNxCUzy37/26TYFb4nm1vy9hL1NKicTy0t7aPxvTf7y7qh9oHCZJlX5a
 WLgGfpQrhutDQw4bpfcq6yc3/jfdu/r+eKkzcaaK0YWlwkNy+bPisMmnERtZ2QJiD9M6HGb5gZo
 dsaQGrT5A9b39MZ+GBU0o8ciwGoQHTL8uCKME539Jl//B+ijPjvcFDQQLhuqcYzx1KNtaorIjIm
 nb1rLu1LnSJ/oZnd2J3fJXwDvOinLaHjMIzASHJhNl3699djKV4D4m2Kmq3NO9yzJit3PTlGVpU
 VLJrcZJhheFvA+vzWFk6wKqWUK8Lxeh/HeR8KTAjYqFp1DhGsdy062lmSc+nvMujojblezw8TRW
 JIWJTMdyPPo1MEyxA0J2xUu905ke//I6BJH82RQhekpKkjvlXyQoRhuiwvjyDoU+MKhyTcC2NQX
 +oOOBDd0vtO0ceO+WhA==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a78cde4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=fGnOUpkfZkl4fvj9H_EA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: f0TWjMSbLLWjFU4jBBUyzhM8OlghzBBG
X-Proofpoint-GUID: f0TWjMSbLLWjFU4jBBUyzhM8OlghzBBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090171

Commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until
late_initcall_sync") kept power-domains on longer during boot which is
causing DSI clock to get stuck and fail to acquire its configuration on
DSI bringup. While this is being investigated, add the flag
GENPD_FLAG_NO_STAY_ON for MDSS GDSC on MSM8974 to restore the previous
behaviour to fix this.

Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-msm8974.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index f2e802cf6afc..b04885864baf 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2367,6 +2367,7 @@ static struct gdsc mdss_gdsc = {
 	.cxc_count = 2,
 	.pd = {
 		.name = "mdss",
+		.flags = GENPD_FLAG_NO_STAY_ON,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 };

---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260809-msm8974-mmcc-fix-c83b5fa916af

Best regards,
--  
With best wishes
Dmitry

