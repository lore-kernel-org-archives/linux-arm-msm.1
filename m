Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511057;
	b=22xHEehwYRSU+7ei2QrA56/vSXxo7ILlJux+eNsFK1UsyuGjYeMK9S/LGUC97UIFBKYZ
	 oLrzPLzu5vTNjtTcSTY54y14AyTO22TiBiC8ZDdNddVbG+9ppqnAJiWtc5p6dGR4q9nCW
	 TJntmI2BxqLmIUBPbM7LhfxtEBV3sGEQwuaFCbGq7ETatEl1wkqhapsbp6zy5GY0JeduR
	 aW9DYjSHrKJpgt6zpv7oFzNa0dJKQiJksBiUmkzpapBFXMzeSwCy01Z75ufzDF3ZqAvJj
	 K5UMUhknE5bn2de19LVJqpCNaH1uyIImnJMMlRsHnVHO2k5wnDencqA2X7XVeJEqwqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1UQBuNMToGONG9hy3Du+9qM2XSmErbNq29UGtfHTpFo=;
	b=H6tETAvziJLHyZ2We2lzZR4P/OZpPtbqoGuyUaFFHGftfAQOjzQjTWNPrQAFYIQIN9Dr
	 RMtf8Wl5VLSJtCj0Z2ZpxCgC5oxlyF8VGgfZC2bNQPllY1iBhkPm6QYl1/vTlm7j5hDcS
	 sZnycG7OLhHMRcsfelub/20Di7fsPx2eq7WF6zde9MWc1LcdatCNhBX+e7e11hg839WIF
	 YtwXsHRJRho8qBObFtVrm4DxJOgVDzd5A5+kdOF4b5GPbB6WnLKTcoB38Jz073yjlBtG3
	 O2HtH1JieoyGJvgmLyGaBoF7rFnpOQ7yHUyc0Xf5NGo4h6TOP6rm4hCJ+ZqWhh3XCoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pVeIuy08;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9UXAD8w;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66897606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66897606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pVeIuy08;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9UXAD8w
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8rq9E1598186
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1UQBuNMToGONG9hy3Du+9q
	M2XSmErbNq29UGtfHTpFo=; b=pVeIuy08qEr2oNoNSLP8pTCIZGYmmF6m2eOFCy
	m57rGCXwzj+u5sUgM0dI/Gvf0/Czoxz6lEbF6ucvpCInNiQ11JWKPv1HzvWJj9aD
	wOohjS4NWevM0K+cjWLfBPzyRl1cKfiPNuYhj8zyyY1Y5oLUD9FGmzbzmnv0/vKx
	jAD4UiIDmaVnWx1mNXk1jEjiub7EZVoKrUoec+wF6OY/yoQpF8IbO6sSHW/bADvK
	/Lo38n9kznB8Y1AMhj/wJnJPLwREn1qbuDfrxQLwf2yT9BwPJAXrfN7yKY0YphE3
	zKw3IH2UoQsUY3ytwr03HpeWQW2Tw6xRilpfYdmvYBmvUfaQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqjr8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:04:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869865a304so3304870eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795511054; x=1796115854; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1UQBuNMToGONG9hy3Du+9qM2XSmErbNq29UGtfHTpFo=;
        b=Z9UXAD8wve1UhhiCqSvEwMV97LY1f0MKtBzt6hCpyqJH0RbqLxmx1BlQxWJbMNmpM3
         /eXdBzWgiIBnPsTYxv6DS/EOikExbMQPL6hZJihAgMHrpYBo2z5rK3NM1X/F+g/jKm66
         o2QZ5sAmy7FEQTWgS0UZlgOnzISAGtGzyyEyDz2jiiWI1uEeKCaccSy/MjOf5yRoBuba
         xNfipuOEfG9rASFg97eic8nOjGyjAx7SYj/gBTKKLd4E8b2OQOs9mooAHKq5GMLMwyjJ
         89bRUgrIedV9Fgh7AAYDDd0G2pp98f9sNUcENDzBdH8CBMmXzPxMLAzlVcJ00tFGsqMQ
         J1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511054; x=1796115854;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1UQBuNMToGONG9hy3Du+9qM2XSmErbNq29UGtfHTpFo=;
        b=tMoxRRB7fwBpV6g+qyzaouuiHHuOpUY84D+F+FVNoTJLYnMO7Y8zjrAkJ6+cq2x+h+
         jkYcBqhpdr4DwbRRZtEKnPDDhXZW/yG/1QfmHUOeKjWnEzKg0u5CscfYDsl/I/qISYs+
         rrxyh1YNCLKQ0DLBHFw8nqXHT52FTi5L7FSkwZnGVdWmQjvB+uaGK+whD3G5+JoRQ2mR
         8L4szf2cbVzcfxx3bcLkorKM5+CyYC5lQYDQYeJflZCIpGc9GCtZ/dFYzUkhV5C8/Pbh
         pjpn5sjdWNIQQMmV2ksasfq/bSKuZpsXT4XYeGybfDxBOfiu10dut/4J/M4UDD+7G2S8
         7UAQ==
X-Gm-Message-State: APuU4Z9lYgBAW4PasOFBlKcKtqu4Kdd/nwSpE3KdVgE8ujCerRb/zQkl
	G3ZzfX+06o8dUo96/P8v9D9EJNRisXyFA9iHV/3dPGYm+/dXBQjRs9UwDfSeXCt60EHgGCDSER9
	wo7Zasnx/fW50IWyfPc86Ue4a2mOCNJ79NrHV8DbeVV3/lzzxyUyMXYQoBh4ML5AQ/xgX
X-Gm-Gg: AZFdTZeiO64SOj3WQ7UI3E0pgPes7fDf8Zg6I8V0fF33qhD3xgnHO49CPvTsXy/ffim
	fC1xzyx0cPnykM3Yqs3n7O6n+mz92pnsPm9jC5CCm+ksILybmUFNzk2jYswqcU+RIj2NdewxsiD
	eso/3/NF5ld4XMWoPkqa6Rqa+LVnVl5ajg+KPVMBQ6vTVsW3zZWWEjYlP2u7EHQTuAsXiTfl//3
	jHs60qQ4pRwQKcAup+7JEnPTou56DPgtle0YfBE68O+9vu7in8eaQwZlhj8d8a/Dt5Vmlj2Gd1K
	azwlhTHCkq6nInoEmRbya3a839W2NLMpPhSRw17ngdf81k0vRv6H6sJRB6NFc9yDKTMaBqmiztL
	9RqDa+KobbuLYm54MgH8z5JJXS305UcbPprpWNTFzHVxmkPJlr15m94jQmdAbJVWMtnvo
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr16288651eec.32.1795511053662;
        Tue, 24 Nov 2026 01:04:13 -0800 (PST)
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr16288619eec.32.1795511053078;
        Tue, 24 Nov 2026 01:04:13 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm75516157eec.3.2026.11.24.01.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:04:12 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:33:49 +0530
Subject: [PATCH v3] thermal: qcom-spmi-adc-tm5-gen3: move hardirq actions
 into threaded handler
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
Message-Id: <20261124-adctm5_gen3_hardirq_removal-v3-1-c7923e9a54c1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPRSBWsC/43N0Q6CIBQG4FdpXIcDUdSueo/WHMFJaSIJymrOd
 w/tpovWOhdn+7d/3z8jD06DR4fdjBwE7bXtY2D7HZKt6BvAWsWMUpJyGg8LJUeT1w30rG6FU9o
 NtQNjg+hwxguRsUIUJVAUhbuDq35s+un8zn663ECOK7k2Wu1H657bfKBr77+lQDHFOeOgcsJYx
 eXRep8Mk+ikNSaJD62DIf0k2W8yjaQgspJZSUiV0S/ksiwv7TqkvjIBAAA=
X-Change-ID: 20261111-adctm5_gen3_hardirq_removal-467a437a78e1
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795511048; l=5207;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=Oow7SbHjlqlBkog7Fq729nsTBAo6RGjET/g3jAQ1r/I=;
 b=4SjAUaKOLDBt5BAzga6Qw8+zDqlN2EiPL2NXOKUN2mZVWhJOrwzjDeNUlnD3agVp1vt9eizWw
 hRvPfV7qcFlBDGJocCEqMc0GxhgutAAtPg3PD7ypDik4B8M9rJmw4y8
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b05530f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=2T0weqYnj29I6vGzhR4A:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfXy8tL+MOEfTl/
 zVqdfHWmRIxHUwMG4e7r7VMCuak8tE11SI773P709n1OFQFj0oOLxMC/ol6wu7SaijtFwmgf6L3
 P3wTm6IIrbdvjxXtuji8dtlcYVzj0ZL/jA42y70iZb0+pi6Fy19gxmo5lvdw532fbDlv4M/hsuu
 I+ZTLg6JbNW9+87X93jQnbOwmRrRTEQYF3oWOfbNGnSDKapmcPA/719CTxJZE/p0xqPkuroRREC
 F/WRvc27YmmQjMIIFcHCXh2mpKBfmthzyry2olWAA+ltzPEmIZR20ImY3BNzEfCACXZiP4hh2hJ
 C8WcJPk+blCJxHlrZOO39tOwvF7iJN83FkSH9jQ3uESUZDWi0ZndpO/wPLX2xxMndiMzV6E3qRX
 ZROW3pxDg+Zt/IRA41lvwXQ1GmiJbY/rqkidTIl1M1+S10l8cen+mSyoawrGM9kvlvVAG6U1QC6
 YDkRdtJhgb8ho5GkD2Q==
X-Proofpoint-GUID: Sga-m6MArRrBZkz7H1UUt1y0nqSLFC7l
X-Proofpoint-ORIG-GUID: Sga-m6MArRrBZkz7H1UUt1y0nqSLFC7l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfXyES2GQa67lVC
 uj6kuzyISiWibosv3BmNBfZ+X2F77q97lRlUajJknSgLrOQ4+c6FAB4cQcC0KdJFIW21P75M7IR
 hjCcu7N2YPkhZkUslCKu9lFpaRuwuvE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

adc_tm5_probe() registers the ADC_TM interrupt with both a primary
handler and thread function (adctm5_gen3_isr/adctm5_gen3_isr_thread)
with IRQF_ONESHOT. The primary handler calls adc5_gen3_read(), which
takes the SPMI regmap's lock (a regular, non-raw spinlock) from hardirq
context. With CONFIG_PROVE_LOCKING enabled, this leads to a warning
about an attempt to take a lock in an invalid wait context:

  swapper/0/0 is trying to lock:
  ffff000b67201018
  (qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
  regmap_lock_spinlock+0x20/0x40
  other info that might help us debug this:
  context-{2:2}

  Call trace:
  regmap_lock_spinlock+0x20/0x40
  regmap_raw_read+0x88/0x328
  regmap_bulk_read+0x10c/0x340
  adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
  adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]

There is no requirement for any of the work done in the primary handler
to run in hardirq context. Drop the primary handler and move all the
actions in it to the threaded handler, which removes the invalid wait
context warning.

Note that both handlers used a local variable to hold the index of the
SDAM whose IRQ was triggered ('sdam_num' in the primary handler and
'sdam_index' in the thread function). These are the same value under
different names and 'sdam_index' is kept now, since the variable
represents an index, not a count.

Reported-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/1cb6d902-73f3-4d65-96f4-4b3c5217253c@oss.qualcomm.com/
Fixes: 948ee3a74f35 ("thermal/drivers/qcom: add support for PMIC5 Gen3 ADC thermal monitoring")
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v3:
- Updated commit message with right justification for using the variable
  name 'sdam_index' and moved its declaration to separate line in
  adctm5_gen3_isr_thread(), as suggested by Andy.
- Link to v2: https://patch.msgid.link/20261113-adctm5_gen3_hardirq_removal-v2-1-a0c9c4800941@oss.qualcomm.com

Changes in v2:
- Trimmed call stack and error lines and added clarification about sdam_index
  in commit message, as suggested by Andy.
- Link to v1: https://patch.msgid.link/20261111-adctm5_gen3_hardirq_removal-v1-1-536ed503396c@oss.qualcomm.com
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 42 +++++++--------------------
 1 file changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
index 910b241fa94d..9e9019f5009d 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
@@ -73,58 +73,39 @@ static int get_sdam_from_irq(struct adc_tm5_gen3_chip *adc_tm5, int irq)
 	return -ENOENT;
 }
 
-static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
+static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
 {
 	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
-	int ret, sdam_num;
 	u8 tm_status[2];
 	u8 status, val;
+	int sdam_index;
+	int ret;
 
-	sdam_num = get_sdam_from_irq(adc_tm5, irq);
-	if (sdam_num < 0)
+	sdam_index = get_sdam_from_irq(adc_tm5, irq);
+	if (sdam_index < 0)
 		return IRQ_NONE;
 
-	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_STATUS1,
+	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_STATUS1,
 			     &status, sizeof(status));
 	if (ret)
 		return IRQ_NONE;
 
 	if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
 		val = ADC5_GEN3_CONV_ERR_CLR_REQ;
-		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_num,
+		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index,
 				       ADC5_GEN3_CONV_ERR_CLR, &val, 1);
 		return IRQ_HANDLED;
 	}
 
-	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_TM_HIGH_STS,
-			     tm_status, sizeof(tm_status));
-	if (ret)
-		return IRQ_NONE;
-
-	if (tm_status[0] || tm_status[1])
-		return IRQ_WAKE_THREAD;
-
-	return IRQ_NONE;
-}
-
-static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
-{
-	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
-	u8 tm_status[2];
-	int sdam_index;
-
-	sdam_index = get_sdam_from_irq(adc_tm5, irq);
-	if (sdam_index < 0)
-		return IRQ_NONE;
-
 	scoped_guard(adc5_gen3, adc_tm5) {
-		int ret;
-
 		ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS,
 				     tm_status, sizeof(tm_status));
 		if (ret)
 			return IRQ_NONE;
 
+		if (!(tm_status[0] || tm_status[1]))
+			return IRQ_NONE;
+
 		ret = adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index,
 					     ADC5_GEN3_TM_HIGH_STS_CLR, tm_status,
 					     sizeof(tm_status));
@@ -405,8 +386,7 @@ static int adc_tm5_probe(struct auxiliary_device *aux_dev,
 
 		ret = devm_request_threaded_irq(dev,
 						adc_tm5->dev_data->base[i].irq,
-						adctm5_gen3_isr,
-						adctm5_gen3_isr_thread,
+						NULL, adctm5_gen3_isr_thread,
 						irq_flags,
 						adc_tm5->dev_data->base[i].irq_name,
 						adc_tm5);

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261111-adctm5_gen3_hardirq_removal-467a437a78e1

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

