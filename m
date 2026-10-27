Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106765;
	b=cmDEWXfGXw0W8cR39CFZ5oV9yqe4c1tl2TLJwp9LeJfZrX5ufivE3FTi7JE67UO9En5M
	 in1bslcfscWjcqtoRHezGugPYIO42kXcfseSkR7XoULJ1qBfbpGx9lWd8hmlqfhw3Lma3
	 ZlJmroFRpUUCajJ4ugwCqaRQedJl6ggbgyNKb3W9+E9PXPEVNz/cpvVFUzFEgq79tbp1c
	 FKJCULVW0en3F2IiqqpCOzS0rzMwMx/16KU36GCPa0i249Wn9cHgRhu3CN9QtyUmiYsrC
	 OqjOdurBTAuqjYoM9rAIcSaEXYcUMNiV0fIQs2HXGzGY5bEYYHPEfT4f/zseOL5kKzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=;
	b=3hfVMfdOnBjXu+cZU9WDpP9xEUiIPYuagyYvZt+1QBTeuGpd7/OLSxliVLpwa9tcSlGt
	 YAm0JJ3N0M5znV0yXLbQOZXJXKFGxk3lrD0H+xt0E3r7KYmvBI9EsGuCzO/V1HHbZ8Aue
	 +4ZeY2AKRDQ4e1EzURYbykV18CyaBRqDF08F1dvq8h4qpcSBcPb1BZ2WnIjK5iDVlbrGx
	 ANNc7b6og0rrfs4cn0nsFeYQThTXsx/1WpDZ1AwdKJ/VH+8+5KaoD620TizMmv0TkvKr3
	 DOEJjPwYCad2e1Dar3R2JLI/1y3Pgy7M41Zx8+WF4jDowoz3frYGn/Bersn10fpJfxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ca6+0FZ2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnyDGOWv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295E606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6295E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ca6+0FZ2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnyDGOWv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe4R7432510
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=; b=ca6+0FZ2ppaUgxtp
	qcouJXUDvv8HdbSis00zffytYt3AYzLQqN7iNpGVvxTtOc3C8XAhsNEWDJWoqAoc
	/Hn7fmNkj9yYqMkhdFM2wY32iUYFIeEHU+lnePniAv/xWlpRaA4+/WryNIe3iH2E
	OO7VYGCBHqAK2EFG7PeyYCllVHGwtEbo5fFGiph3RzVqVWt8uwHc7fE2h4RLGItd
	4VTnEGonkkNrRaUG2VYqGB1Bqb8HrrDzYSfzq22t1kskS96AIqTY/ysaOELjwK9m
	itdfZo7FWy6q1tRovRByw8WokH4QBbV4uxFrxjAzkRUbuQpB2rO3hxEQApnEG+uf
	TBf8bA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kxbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:12:43 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0e757e70eso66287137b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106762; x=1793711562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=;
        b=JnyDGOWvhnABc5IvO3tx6hFgm90yrBmmZanZU1/xMOzDF3l6Hpx1+jMO8ETcYu+ynJ
         Fb0ePO7KxDjp41i4bpNfo77npAH6/wpJcDK7g75Z/ErharsazKFzWyl36BUNwxeshH3R
         pJ4RZhmDvo8CB9asg5IghekfUPNG5+DedRQk1wpU9XAegI5iKJvstkndB9QhN2WNrV22
         gpzNy6iAU6EX/g2JRpEgzwOX6MQ7xlwVMXUgaGR5gZ8eHPdXyIRI2SbdGrXbxkAoBfy9
         Zinr0yvmw0vprmgYz+aRQrSmYSuA1oXjhon0smY1OMcWfDGHahm0+YvUCZT07xrmaknd
         BDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106762; x=1793711562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=;
        b=ZltMJ0s5oC/zEiFv6gMubSmdt7IoMREUajUYwZ9o7clIVqVUUeDl09+6c3iugy8rJF
         KHw709h/eoRuwUU7wc3qfx696GGJqRtj5oRqC1rh/1Nm34ek44zStrQlxTxj4364cxz+
         OO/VSLDiU7dIXoQSrb0t+TR/cBxz3aIGvR1aXE4dEoDOZGoxpTo8Q1x675Dptqzs+EV9
         /qD3vcSPILK3x1NE625WqwSRIMlh25T/K5GVfTggQRIh35OQh2kwiDXumyb6g5nYDsXK
         zFYaaNHrEvue9kJeDCh9ncbivRkOp26TQwr3E/OodRs3p5ApYF4lLu3OCbQIOtylvyi4
         IoPw==
X-Gm-Message-State: AFq9FYJYIqR1x+pE2I/qAHpuZr+WZU63uhf9yIsWYRXv7bxGizRLQE12
	MuWTTHmqPsC890jLUsdL8qm1xn1qfXldNFqhDRwFwsgCgiU7/c2m8vPOM6XnROT4mXLqlv8+q9P
	vU+DIwuPTUCS062rQZJP00CnLwK+3s8BwlP1z2cRgH3FNAPkCKStMwWeSfLqNp0nBR6II
X-Gm-Gg: AYBFou3IiXBmQxERou7IAVzsZrBJwAf40fcDgPygq3Qfh55MLg7W06XYANHkchzNgmS
	CDi0zd8N9u7VPp3LhcArhgaY0/VzQdcb1Uve2MISR6o8SJQdP/IX7lg3sDe6uKq+ow/ooIGj5+4
	T76tBtwF2I1O04fZsLiGnIpQNeAk2bRSk55D0G+i/EXFQXEFB70ynQzjV21eIcTJcd1ZiP2j9UL
	BUBX2plp3wr7nqx315G1IfZAw/bka5C+yr/8aq1yinIK2PVZfbmtT7CRcyfYSztcz4NiaX1x9cK
	1cf2dAwPy93eeo7pKsLheVnWeTP7kT5RJ7B9wUWDmZ/4ejFpjg7g7XKUgOXt1mq9yb/5sQextgU
	PWkuUh/OAA+s34o68NadwPmiszLsE
X-Received: by 2002:a05:690c:660b:b0:8b0:ea15:fb61 with SMTP id 00721157ae682-8b166c4cec7mr58168637b3.71.1793106762173;
        Tue, 27 Oct 2026 06:12:42 -0700 (PDT)
X-Received: by 2002:a05:690c:660b:b0:8b0:ea15:fb61 with SMTP id 00721157ae682-8b166c4cec7mr58168437b3.71.1793106761634;
        Tue, 27 Oct 2026 06:12:41 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5ea7b9sm10743547b3.32.2026.10.27.06.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:12:41 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:41:09 +0530
Subject: [PATCH v3 1/2] irqchip: irq-qcom-mpm: Register MPM with cpu_pm for
 RPM notification
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
Message-Id: <20261027-b4-shikra_lpm_addition-v3-1-424abcdcf824@oss.qualcomm.com>
References: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
In-Reply-To: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793106749; l=6732;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=B2aw8nOLksP/v4UrXDlB3J3clvj0LTblXgAVl4nQhYc=;
 b=8r7GMgNARmMKCP7BrzhVEKlMvq+X1jK6HAV27ijgwbGiHeGozq+Bjl3yiccR06SC0Zrmg4NXX
 flKAt7sOzQdBYfWuCUBzpJ8/nHjrCALlvkkogadejIqKIkC6R/r6XMz
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX7x1uhYvVyUA1
 daYub+c8ZbKWe4VakLrk2YgX6lsCp5v140FbmytjSZPSmz2u3jxtErvLL4OJ0ZNmqjf4WWDiUU+
 nz43shMP5U5L1sK+NTGjh7us/RgoMts=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0a34b cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=lt-0Ylhkz4Il63NEeiEA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: NqghAizPhuDFlifOKNmi7eRcen7aAg0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX8ArbYsD+Vd3M
 Bk067m1+Uq6aiJ2EuOF4vtO2vdlvMeAe9MDpg3P0CY8kJ9b7Eb1M9h4YjweubXIPKocVna0uCTw
 AzyeCJNtJipvFRuCFc//xPZ7D6Pte23Wo7vRY6EdpzrpoL+blTAq/cq2h+fOYMfmWi1lkd3niF/
 9aI5xMDTgZrCF+ONBbTqGZVCmQ83ej5sRUn1i953IvkedKX7zmkYQL+1Cbg8R0DAiW8uIZmR6CA
 b16zMIW/SElnfb8VGqOkwj0o/0Jx9642NgWPpfmwIQPrCGBCHKp3LBYeSeBm0EQaKMcy5ybuohI
 kWQ5XDR5rlzH0WUJhkg9FwhPTPcs4iE78Tr0kqEne0ZveuLx4RmDJ8VBWF5RfUxdVHNUckWRhLK
 Df8aWt7tYoSz0f43LVqmtSPpNZR3rVH5oDu9FvU0cADOh1PizLQ12+52OTKUA6M0/od+Njskz7o
 Yjf1MRYgoiqkpHQ/qKw==
X-Proofpoint-GUID: NqghAizPhuDFlifOKNmi7eRcen7aAg0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270052

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 104 ++++++++++++++++++++++++++++++-----------
 1 file changed, 78 insertions(+), 26 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 181320528a47ac1bde6cf7d2d0a9f79499990092..136d126f0ea24bb10b5183d6ce47b630aa77b0cf 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2010-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -85,6 +86,8 @@ struct qcom_mpm_priv {
 	unsigned int reg_stride;
 	struct irq_domain *domain;
 	struct generic_pm_domain genpd;
+	struct notifier_block mpm_pm;
+	atomic_t cpus_in_pm;
 };
 
 static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
@@ -292,10 +295,8 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
-	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
-						  genpd);
 	int i, ret;
 
 	for (i = 0; i < priv->reg_stride; i++)
@@ -307,10 +308,52 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
 		return ret;
 
 	mbox_client_txdone(priv->mbox_chan, 0);
-
 	return 0;
 }
 
+static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+{
+	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
+						  genpd);
+
+	return handle_rpm_notification(priv);
+}
+
+static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long action, void *v)
+{
+	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
+	int cpus_in_pm;
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		cpus_in_pm = atomic_inc_return(&priv->cpus_in_pm);
+		/*
+		 * NOTE: comments for num_online_cpus() point out that it's
+		 * only a snapshot so we need to be careful. It should be OK
+		 * for us to use, though.  It's important for us not to miss
+		 * if we're the last CPU going down so it would only be a
+		 * problem if a CPU went offline right after we did the check
+		 * AND that CPU was not idle AND that CPU was the last non-idle
+		 * CPU. That can't happen. CPUs would have to come out of idle
+		 * before the CPU could go offline.
+		 */
+		if (cpus_in_pm < num_online_cpus())
+			return NOTIFY_OK;
+		break;
+	case CPU_PM_ENTER_FAILED:
+	case CPU_PM_EXIT:
+		atomic_dec(&priv->cpus_in_pm);
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	if (handle_rpm_notification(priv))
+		return NOTIFY_BAD;
+
+	return NOTIFY_OK;
+}
+
 static bool gic_hwirq_is_mapped(struct mpm_gic_map *maps, int cnt, u32 hwirq)
 {
 	int i;
@@ -415,26 +458,6 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (irq < 0)
 		return irq;
 
-	genpd = &priv->genpd;
-	genpd->flags = GENPD_FLAG_IRQ_SAFE;
-	genpd->power_off = mpm_pd_power_off;
-
-	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
-	if (!genpd->name)
-		return -ENOMEM;
-
-	ret = pm_genpd_init(genpd, NULL, false);
-	if (ret) {
-		dev_err(dev, "failed to init genpd: %d\n", ret);
-		return ret;
-	}
-
-	ret = of_genpd_add_provider_simple(np, genpd);
-	if (ret) {
-		dev_err(dev, "failed to add genpd provider: %d\n", ret);
-		goto remove_genpd;
-	}
-
 	priv->mbox_client.dev = dev;
 	priv->mbox_client.knows_txdone = true;
 	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
@@ -444,6 +467,35 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 		return ret;
 	}
 
+	if (of_find_property(np, "#power-domain-cells", NULL)) {
+		genpd = &priv->genpd;
+		genpd->flags = GENPD_FLAG_IRQ_SAFE;
+		genpd->power_off = mpm_pd_power_off;
+
+		genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
+		if (!genpd->name)
+			return -ENOMEM;
+
+		ret = pm_genpd_init(genpd, NULL, false);
+		if (ret) {
+			dev_err(dev, "failed to init genpd: %d\n", ret);
+			return ret;
+		}
+
+		ret = of_genpd_add_provider_simple(np, genpd);
+		if (ret) {
+			dev_err(dev, "failed to add genpd provider: %d\n", ret);
+			goto remove_genpd;
+		}
+	} else {
+		priv->mpm_pm.notifier_call = mpm_cpu_pm_callback;
+		ret = cpu_pm_register_notifier(&priv->mpm_pm);
+		if (ret) {
+			dev_err(dev, "failed to register for CPU_PM notifications: %d\n", ret);
+			return ret;
+		}
+	}
+
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		dev_err(dev, "failed to find MPM parent domain\n");
@@ -473,10 +525,10 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 
 remove_domain:
 	irq_domain_remove(priv->domain);
-free_mbox:
-	mbox_free_channel(priv->mbox_chan);
 remove_genpd:
 	pm_genpd_remove(genpd);
+free_mbox:
+	mbox_free_channel(priv->mbox_chan);
 	return ret;
 }
 

-- 
2.34.1

