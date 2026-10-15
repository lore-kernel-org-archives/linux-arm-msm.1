Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE3D522EF3
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058176; cv=none; b=iWs3b8cDJdoTD8nKu33/VHJQnW8u+jKyHYiecL86wYNJjYWyakdYZ2Xjkcge4o2KEqeeaaBNxAcQ7BXf8PJVJnEP2iiDyNOdZb4scejbdj26JuO1bj5Z2VciLzXUmP9/uiiZckK22LB1PiHW2AZS8qQEQo36EbC/6dnJEa4b334=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058176; c=relaxed/simple;
	bh=ddTk5W/Dgf9uQMox4V4cADmLiLzDP3X5xdF/lqgMBBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EHEsjeufHrnplXFLvL4Yg3O7hklRQ6Eq2C1fNKPgXNpJIGN5H8DyovYRhQ+/Y1eGeGRR/7RQKGTCdEyeV4V664cpewnGwIbCDDWZ3tDdDUBJvPl46/TiOGwETzn19ZZV5UrBkz0ntbfr4dGy+nfuu1TybSblDDWYJeV2wFh+UuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blua1wJy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxNPT4Ie; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blua1wJy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxNPT4Ie"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jnXr3408836
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gUmQTR6lwBIwnjIcjM1zEG8u2gKmX8BLsKfyQzN3LJc=; b=blua1wJyskUE9aDu
	6Wkw6hJHlOpQDAZjLHqFHFUHNnXRIW68/uomFBF4Z2SKiZmoSsFD28QgywRb1i0+
	UqpIeHeZl2j9G0CT5BceWNC7u/FJhF0sr23bOp/5KRnuy74y2f6sCADtPVbxJsgG
	KgPhJqb1fimZd22j+NRgWln2w5Iow14WsPK2Urwz2YnHTAQY8hugHS1EZr1Mq6g3
	C9atO64wmr5GZIdW7vBWQ+CHuvaUqGyhL67aEK/6oKaPk7awCEU0y+3WSlmz7ENl
	TVhwYnLsNekQKWeeOgFdlgwJWPGXf0N3c7JJtjMwlZYv1tUrOLKxV2tCzjIR+NNi
	AWshKg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2559-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:56:01 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14fed306427so1941709c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058161; x=1792662961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUmQTR6lwBIwnjIcjM1zEG8u2gKmX8BLsKfyQzN3LJc=;
        b=cxNPT4IevgCzh5fhH8zRlQpUOdPYW1FCsGpftAspDsS5yhBENospatN48fdxL/YX/a
         o61dSBdoEarLxOzGA2ee6MEdB9T+o5E6VD6U3Mxyh8BCx4NH7gEmNya9c2tUs/obeicy
         kyKrkLDHlEahREAt913ejk5FMkojhDPT2jbCzkNnu3X/tcd2Ye5H38eCcmezeN3PFzFj
         SMhkQ7FMvFpRYM4vNUpihdhVA2M5xiKEzkvfcMhqUFjetjTg7bdl+1kRV+UdT6HUl2U1
         MyPvgUFnjcpqP1RYIdTdJW3mwlo/SCHS9+09j1hZmJ/MsD8eXebdJnZkiKQpAh2HfbnU
         kEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058161; x=1792662961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUmQTR6lwBIwnjIcjM1zEG8u2gKmX8BLsKfyQzN3LJc=;
        b=chweIlA3bohN0hks69Brf1RhagduBuyNrBvD+uGKmWv0wJj2BwzgcIbjasDRwhD9fV
         MWX1K7vpN2Z9QKrvGY0ViQYTrfLlKPk/F+7NH4r40XfOfw0daUGxx8JhaeZ3X3FGaRz/
         HpQPtKC/hLNBiVnWExSCWJ1Z9UxYobqyZtfz1AsKqg1wHWUJeCiQVe0mfUgY0Qn0PozX
         ybNduMDnGt2ayHF37GjIO+fQiGu8w4tDk2AO1/czjCwJteZhM52iKZIhSI/5kRGzQvGd
         BsGCT6fNOmoOj8SkDU11nz3j8nXZ8GC7qsgqw6llYAqKjOR0SGj59ANcfGQhvxlMRb6K
         JFkw==
X-Gm-Message-State: AFq9FYKWmZu2wYwEMRSOXSQdni+TheOqDxKxh1i/CxT4hN9wlq4h9Rag
	o7vDe1tSDc01I6dR8M/ef3i029rj8wf7EZv8EQB72hYFBnnq1kXpYaGUplkOLt5X4ZRTPh6cOVl
	fiYyf5or95Hp1pY1SB3xnZZjuaIWt1Z3SE1naNQHvu/kIBLuzBeqQw+TixWiXJLd64dCs
X-Gm-Gg: AYBFou2ZeaVvN2yOxS15mpSIiOzW2HbPL5LI53dD4jwO4Sf+poE6urGNx8LPgpnZgDs
	XkwQ7f8oYi+d/cT5zeZTvGcky3Zv0+REzKJOHi+dxCWKnGpxifgUKZO5YxWmuzYb6lxOmdjLreS
	Bamy0ibJGymkgTcmvOWfpKwUAgU3qryUYcAOkemqk3QOJCBLcB0Fwg0hbehe5D8caAmaayDgtOF
	BaWd8RSyx+AsZu3dOez+FyCNbbqfhVBM+/DJWbgmmlB8QeqF4bMxN+4mwE5oY17HX2+kqg2i9Jk
	vErJEGnp6r2sjEGYdZO2HRZ0MajsQtiF1ZwiHB9u3bV6dtYyYfCbuAGFuUARQJ0eFHM1xzvOENZ
	Zo+v/PQC6EuHvVkz5WMX+n7FpQDf0
X-Received: by 2002:a05:701b:4541:20b0:143:296a:3ed with SMTP id a92af1059eb24-16a5ef2853dmr26058168c88.24.1792058160457;
        Thu, 15 Oct 2026 02:56:00 -0700 (PDT)
X-Received: by 2002:a05:701b:4541:20b0:143:296a:3ed with SMTP id a92af1059eb24-16a5ef2853dmr26058129c88.24.1792058159798;
        Thu, 15 Oct 2026 02:55:59 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:59 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:21 +0530
Subject: [PATCH v2 5/9] irqchip/irq-qcom-mpm: Program wakeup timer when CPU
 cluster goes to LPM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=3139;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=ddTk5W/Dgf9uQMox4V4cADmLiLzDP3X5xdF/lqgMBBo=;
 b=4XxGEjopfau9sU91leKRlgFafePgslxZ12LQUuUfx5w3HExM0EKN9aLTJ4cSnIvbEx5SdjcPj
 ccxsce6xJLTCJCvmy0a8sOWvZOolY/xp0q23mRU7gpZCkm9qsZpEGOd
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX0/quzNveicFf
 yugnOIgxFPgDfcH+8wjQi+DkJllJn0bzVb5G/Aalb5/KbOGh9Z0wANDXr8ag81mEwFdQaj51Cyb
 aR1/9xlZD/frVhgCBP0yZMmTGzyIAxVovjVNPGcS8g7KWrJohd+Hz0jFRpeEESCdkxCLmURBa1U
 /KHMOQS4GuJZo+zn2WZOL8dFSIFq34ptiB5cIaxCWjeUwoplmFBLDQ/n1vM6s2GpMVTUDnv8EKp
 N0bGH/TaNkTfvw+FdxORajwglNVhBeCOw+iBIQ4M0GP7ZhP7qRSjH8vnT/qBA0kP4hjLARmI3Sz
 YYooICDgYXvZUPWxUaB7oDvXdpY2Hk5J1siWYE/Cyyj5XojQc8bcHQYt+JpEj6+60ALEOwxgRiP
 /+lxc6p5SxbWd8NBY6y9vR3Hudsl/rIaAojXxLLaEwY4jvNq5ziTM9XZGOjoEqDKs2vdIoJqvqq
 RvZViXjPzIW0Pj0YX0w==
X-Proofpoint-GUID: iwIqDvRAAbz6q3mYf94RXGrwWUyOhvsk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX4Hrn3RsOwutd
 4woY/1zZb2fVPd7ocOVmmxB1/tLFMjfKU3sPqs0GoSuWf6zFiE3ynKtMIs4itkCs9aD2BWJ6GYI
 SIOf+aYeGJkdN4AyeQJy9iYHO8bl4P4=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a331 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=x0-aiICezeCXQbOhsWAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: iwIqDvRAAbz6q3mYf94RXGrwWUyOhvsk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039

The next wakeup timer value needs to be set in MPM timer as the arch timer
interrupt can not wakeup the SoC if after the deepest CPUidle states the
SoC also enters deepest low power state.

To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
timer and the Resource Power Manager (RPM processor) takes care of setting
the timer in HW.

Add MPM timer programming when CPU cluster enters power collapse.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 0de6ce818a506efc07913b16c479b5d5efb15108..676c45acd2716f474d474b1eb2feb61451404968 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
+#include <linux/ktime.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -23,6 +24,8 @@
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
 
+#include <clocksource/arm_arch_timer.h>
+
 /*
  * This is the driver for Qualcomm MPM (MSM Power Manager) interrupt controller,
  * which is commonly found on Qualcomm SoCs built on the RPM architecture.
@@ -82,6 +85,7 @@ struct mpm_gic_map {
 };
 
 struct qcom_mpm_priv {
+	struct device *dev;
 	void __iomem *base;
 	raw_spinlock_t lock;
 	struct mbox_client mbox_client;
@@ -312,6 +316,36 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
+static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
+{
+	ktime_t now, wakeup = KTIME_MAX;
+	u64 wakeup_us, wakeup_cycles = ~0;
+	u32 lo, hi;
+
+	/* Set highest time when system (timekeeping) is suspended */
+	if (system_state == SYSTEM_SUSPEND)
+		goto exit;
+
+	/* Find the relative wakeup in kernel time scale */
+	wakeup = dev_pm_genpd_get_next_hrtimer(priv->dev);
+
+	/* Find the relative wakeup in kernel time scale */
+	now = ktime_get();
+	wakeup = ktime_sub(wakeup, now);
+	wakeup_us = ktime_to_us(wakeup);
+
+	/* Convert the wakeup to arch timer scale */
+	wakeup_cycles = USECS_TO_CYCLES(wakeup_us);
+	wakeup_cycles += arch_timer_read_counter();
+
+exit:
+	lo = wakeup_cycles;
+	hi = wakeup_cycles >> 32;
+
+	qcom_mpm_write(priv, MPM_REG_TIMER, 0, lo);
+	qcom_mpm_write(priv, MPM_REG_TIMER, 1, hi);
+}
+
 static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
 	int i, ret;
@@ -324,6 +358,7 @@ static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 	if (ret < 0)
 		return ret;
 
+	mpm_write_next_wakeup(priv);
 	mbox_client_txdone(priv->mbox_chan, 0);
 	return 0;
 }
@@ -399,6 +434,8 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (!priv)
 		return -ENOMEM;
 
+	priv->dev = &pdev->dev;
+
 	ret = of_property_read_u32(np, "qcom,mpm-pin-count", &pin_cnt);
 	if (ret) {
 		dev_err(dev, "failed to read qcom,mpm-pin-count: %d\n", ret);

-- 
2.34.1

