Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8D459A1CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420777; cv=none; b=N4+h0YVM6Cydph/PejhArD6PMd4RLxJF9kn8eki7Bo4ZS+3ppFstpv/5VSgjipRLQuhG46PIwd009ZhVyAR+A2BunEXeu1NYoUszRqx+oYBln7CZm97T2zNaeZXkmnAXO49MZ+U5uQ9btRBAue7OcCW7BlF7AojITiiKitQ1L1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420777; c=relaxed/simple;
	bh=W88aFyXLVL2s6jefU+R6NEkeW5WeUYxK4fu61wyaQLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YeUPjKM5c4FI66SGH/axe9p3/GWU6otiQhC/kLmkXesiU5uMlMXNjYnZ62kF9+4602XPjb5bIOt4v+1Yl4o5VzPungkJR5THea2NrAuF6/1pR8dhVEatAsafV9Pk3w3FxdsY8b95oTA+Z94JhK/BgW65IHsIYwIknRIB6MPsafA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IN3hRBxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CrIlxNYe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IN3hRBxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CrIlxNYe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0dOi2081649
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	seWH79pPmvjDQRYnMxX62IYmBu0NmcGCDHCEkLyHmhk=; b=IN3hRBxaWfM8zoOl
	a85MCSkfA/xZnluqWAKlufnyTVGnsVpGD5533TUydIB4rf8gVKVPu6C3y7WAesS/
	+UJ2xLUEtxDvndh4mtoianrM+O7wXTlxLqL9FmJ5QhvtqJs9C/geC36pzd0GtPde
	0CiC7FpQfiI312Jug9S8EMyUm9wqryOidGhyDADXuSol7J8WLdZWCLjfPgmrzhKN
	j6p5ImOSvDRZJ4FHwStUD5CxuoT9iQPRYD4JviZRa2kExQn029+TzHuX4yU3OQnG
	jl8LHFhFip+HEhW43s9GAMIY/c3Jrpd/zKqn27VJTpp/gov6F/Qb/czvCZWXNiqk
	DpNRwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rhng7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so472766785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420775; x=1793025575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seWH79pPmvjDQRYnMxX62IYmBu0NmcGCDHCEkLyHmhk=;
        b=CrIlxNYexGRRD6JgP7CmuNMLyvnoU+OGGU6PfShJYnJHoJ66NTpTUMK+8blDkbck1+
         rCLCGiTiYCGzbyzNbR8FP9PqPcAD5yinm5fJvUULJNaEadDdM6dskNwM11qgdHFgxm6J
         Yj/6Ru+JLQ3tjx3gRPvxRpTUBqTJ2NV4Z7i6cZLz+agycP2fMUgE37wx5jILQdDuKKui
         kNWebKQt964PuQMODFEZxVMBKTo9GdDOozLpPt8W5HdR7zfLA3k5zaC1pHos02IrCsq/
         CPLhafgB7Nrrn+rt5mGBsHaPCPxVGQxfEYUqg/LXhIYVjGvqk36jEdpYclmuJ6whrkre
         z6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420775; x=1793025575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seWH79pPmvjDQRYnMxX62IYmBu0NmcGCDHCEkLyHmhk=;
        b=MWcsF07q6diua46Yv+3/tUaByFxGUph3lomRubU68bVBFBruqSsF3drwRdQav8r+gm
         BRWAbpUmG608fLbyvkTq0w4H53oW/JpgIWqT03cxHcLfwFIycJBE+nq8CWlRs240IDs5
         RAvz9iagXRitx8BUKOhARz12zDJdmCxTNu46nDuoj+B+iO+JI+zNV5JoAThTLF82PQXC
         IrjRrJwyIGS44FofyC2qB3UIakSpYg/miCSDElv32bQB4AW4lL/bRVSlAzSk/IbBJN6q
         3YlycNd8mv2GB/LM0xwJ47nsB9oCNPjhLzFuFHPgBhzrpT9FmaNGix2ot7SgG3fcE2PZ
         DjbA==
X-Gm-Message-State: AFq9FYJbceMnRO5WGGmOfsxst5X90yFSy0hAWtb/FBtl/1V3MyhGFW8M
	fpSpxgOyfjZ++TmHMHH8XiREX+TCoGSgaj0vQoKH9+5H/8zGTPpoC13lycXuzCUUsZF9FNyJ28T
	p7mVxPAxOHNrGz0fbBtazQCD0HTADF8D6cSWL6a9zhOtonS5I9csXXLdsOl6zmJ/loxeE
X-Gm-Gg: AYBFou3TYoIi9+Mv4V59tq4/0QnUbloXic26dELKA5ps9RQaPuiILOV400l3NN+8X04
	uP9pCKr4V6EGv13TcrRmtbVRqWnrMrI8X9ONX9KeXdWBZNQC1ID4DntEHgcdgwc6e6bWiWj1z4c
	J3cZ7GkD3oNW2iD+Ntdf8gW0ZxbrDbe3KvzQ1GF1gV+oKFXX62NIGmXuzG+3kF5Ubkb1YMRUNaQ
	yoyd16qAuBH7Y5u0h60TqNI22jZsoDNZp2A7Ipl6FbqPkrjZHwhyKmkF2ONFA/GYXljDkx1LhXL
	v2XcPpmrm7exP9meKiewZ7j8jzai+bm6ascYI40hQNjbiCTVsez57evW+2DSh1VIQymOJm5cM98
	A3A0K0LbQxBNPQonVhVc0PpX2rIB3+kL7nrufqK5PYBooCsgi2xGYwPK6XfRyilXedLAV6CrqQQ
	H4RB9Xq/lHXc2Q
X-Received: by 2002:a05:620a:288d:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93f29cc979fmr1361949585a.25.1792420774709;
        Mon, 19 Oct 2026 07:39:34 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93f29cc979fmr1361944085a.25.1792420774130;
        Mon, 19 Oct 2026 07:39:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63aa17sm2033436e87.69.2026.10.19.07.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:39:21 +0300
Subject: [PATCH 3/3] regulator: qcom_spmi: don't take a sleeping lock in
 the SAW IPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-fix-qcom-saw-v1-3-9c7ba3fc2493@oss.qualcomm.com>
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3759;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W88aFyXLVL2s6jefU+R6NEkeW5WeUYxK4fu61wyaQLI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iuZtT0j4U+vB60NcH0N6Mt6dwmk9o+rrkmzd
 aZqq2RrKV+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYrmQAKCRCLPIo+Aiko
 1e4WB/9NOR1ZG4GiaNnX3KgtFpggU+x2+0DyhdeGzSrb+MHoLL0mO+CAWCR6eknlrB5Yp5izPKr
 WKxT2ijDfEKgiwVCWJhD/dfq3iP+BNy9lk6/r17SuYX/TOgL1ux3+fvWO2gcTIEa5M/gMaI6OwG
 X94tM0/jtXMODQqwlmG36ohEBBDxIw9Y8lSzyHNELF4GndTBuuc6GSMtjBS7Csz+sE2DO2T42wx
 OVaqh/LNfkAywcuAvDm2GqdUPjvaGv3JvXvJ8jHZ+zvC4/aknuARzIm0KvxA9UOmEHlzYNRsaOA
 WAtMXjztO7zuKQHCYur1pA0KWIxy5KP6fa6/KNRtHqxn0HMN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: BoNq6_YnkSOIfSLqUSi_pbEuhWdbCEf3
X-Proofpoint-GUID: BoNq6_YnkSOIfSLqUSi_pbEuhWdbCEf3
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad62ba7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jFepld1HPJdq18AQ2i4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX0FRPLpBAwRKb
 96mtHT8aFdnedK8Wp6KmSUsyQkiOH760K2vOsXt+ZOdSklnNZoY0pnRPylJcMyvIGLiT9dSoT6m
 I5qg8/I5oXYuIY/QXn7mobAlMG3k0jAqvxSoifeu0Eh0jKBJTg9zCGGiEqwpcyI+3jT9duZFPc1
 n56tPafc1W7kG7iVPTRI1G6X0XxkWZaKwtkKwd1LOToHn2Dh7WQeOsLptCFED/3LU7OWs79NQnm
 3G3ngmNBSCQvck+MXDLbia1Ngy3yuau5X8Tkg8SRlVc16ihTX1RdY45sRvDYmaHzGZLHwqHSHDZ
 G7cBsMcCwg70bPawdMMM8Idqhfb8b1yJBYlEH95Ulq9IR/DQNs+dNX7uw40tV8GzXqlob7yLl5C
 Eedu2imTdEAFTCP8wAKUgxsZprK0z1BsCK/yRZtzZxstqYsnSWsO4q3HqqpTU6SVmX7E/ed+se/
 wfCbiRFQRdK7l7ogv1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX9KPjpu2WDRTu
 3Vi3rmDNSate5DVByx7fwF+BFrbpGI5xFu00gHv8m6XXTkgLq94G12vGk4DgcL/EOLst3PuVapi
 bcuYphvu9FZ1miDA9I3jM41wR+ItPss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190058

The SAW voltage change runs on CPU 0 from an IPI, but it reaches the SAW
registers through the syscon regmap, which is protected by a spinlock_t.
That is a sleeping lock on PREEMPT_RT, and lockdep complains as soon as
VDD_APCC actually changes voltage:

  BUG: Invalid wait context
  ...
  regmap_lock_spinlock+0x18/0x30
  regmap_read+0x3c/0x78
  spmi_saw_set_vdd+0x50/0x1ac
  __flush_smp_call_function_queue+0x1ac/0x334

Map the SAW with a regmap of our own that uses a raw spinlock, and fail
the probe when that cannot be done instead of carrying an error pointer
around as the SAW regmap.

Fixes: 0caecaa87202 ("regulator: qcom_spmi: Add support for SAW")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/regulator/Kconfig               |  1 +
 drivers/regulator/qcom_spmi-regulator.c | 35 +++++++++++++++++++++++++--------
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index be6b72daa76f..83a76b78e58c 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1210,6 +1210,7 @@ config REGULATOR_QCOM_SMD_RPM
 config REGULATOR_QCOM_SPMI
 	tristate "Qualcomm SPMI regulator driver"
 	depends on SPMI || COMPILE_TEST
+	select REGMAP_MMIO
 	help
 	  If you say yes to this option, support will be included for the
 	  regulators found in Qualcomm SPMI PMICs.
diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index c1a41ce70b36..a04ddb1eac94 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -12,13 +12,13 @@
 #include <linux/bitops.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/ktime.h>
 #include <linux/regulator/driver.h>
 #include <linux/regmap.h>
 #include <linux/list.h>
-#include <linux/mfd/syscon.h>
 #include <linux/io.h>
 
 /* Pin control enable input pins. */
@@ -1335,6 +1335,14 @@ static irqreturn_t spmi_regulator_vs_ocp_isr(int irq, void *data)
 
 static struct regmap *saw_regmap;
 
+static const struct regmap_config saw_regmap_config = {
+	.name = "saw",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.use_raw_spinlock = true,
+};
+
 static void spmi_saw_set_vdd(void *data)
 {
 	u32 vctl, data3, avs_ctl, pmic_sts;
@@ -2504,7 +2512,8 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 	const char *name;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
-	struct device_node *syscon, *reg_node;
+	struct device_node *saw, *reg_node;
+	void __iomem *saw_base;
 	struct property *reg_prop;
 	int ret, lenp;
 	struct list_head *vreg_list;
@@ -2523,12 +2532,22 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 	if (!reg)
 		return -ENODEV;
 
-	syscon = of_parse_phandle(node, "qcom,saw-reg", 0);
-	if (syscon) {
-		saw_regmap = syscon_node_to_regmap(syscon);
-		of_node_put(syscon);
-		if (IS_ERR(saw_regmap))
-			dev_err(dev, "ERROR reading SAW regmap\n");
+	saw = of_parse_phandle(node, "qcom,saw-reg", 0);
+	if (saw) {
+		saw_base = devm_of_iomap(dev, saw, 0, NULL);
+		of_node_put(saw);
+		if (IS_ERR(saw_base))
+			return dev_err_probe(dev, PTR_ERR(saw_base),
+					     "failed to map the SAW\n");
+
+		saw_regmap = devm_regmap_init_mmio(dev, saw_base,
+						   &saw_regmap_config);
+		if (IS_ERR(saw_regmap)) {
+			ret = PTR_ERR(saw_regmap);
+			saw_regmap = NULL;
+			return dev_err_probe(dev, ret,
+					     "failed to set the SAW regmap up\n");
+		}
 	}
 
 	for (; reg->name; reg++) {

-- 
2.47.3

