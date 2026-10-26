Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018909;
	b=ptVKpnUs4O1qTDNsbZ/ATVJJiiiIws6aM46slb8kKJrAtiR7MJbBWGQcNvxifiP0sEr/
	 ncFctYYvDls9Ql5ptBuRVEi02FrbYafNWyUOMEELyeeO6Qyv611WYrYbZxLu3VfPpRbUy
	 ajf+Xg2bXg9eV6qpNfF3cHOAQst2siEJdgXFbFq6qcGYRMctPzxBhNu7Ww9hgvvw3/EO+
	 tmRZr75saiu/94LsgtQckAjITcdb+VrVybd9fUs/GQtPNwDRPOAqpTnF66a9kQM+eOBVb
	 SYHANJ942jT6SxqA+IH4HRYE6OuWVBVw2yFPo/E2OK464IE3vN56D5LRmvxOWk3RloA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oLrrooat79HtkN3dz5cx1qFd3lBwlFNkO28qDmfrYY0=;
	b=eAvvcAam0dKuTZjm0bvNv3cVMqwMi8JHmn/vGckvjl6pDuodSbh6JLEA1bG9rg4OsuCH
	 6zM1GLvo65f84NWnYIOIFPL1nOLkavFVs/KCP++elTBCWBmzzuvVZxS0m8UA1z6W2kKvr
	 +aGb//+IprbtJL8YY0LT79Sz7PiILP6KNFoJMvln5b9+tdQDPlCOT6gMs6ioRJ6DGcQ8A
	 hBYWUfrcr+tFTd4SZN2F9eytZ4FIffCXs43/ma4QxzGwvk4QZeXiWNNUdpiNlPige9zWi
	 GFYheq44H0nNkurdEAknQPmebI+UJdYEcF43E7l672utElnvSbTWHJLFZhdbRGFlkpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PPih1DaC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S9sbDHIZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D08606A320
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D08606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PPih1DaC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S9sbDHIZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2o72733255
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oLrrooat79HtkN3dz5cx1q
	Fd3lBwlFNkO28qDmfrYY0=; b=PPih1DaChJtnUNubASFi8/iyy+OXg2ud4IdU+O
	5aXLsmcVzPiKyyFoucDzUXlEPseoY1YBST6cY2FBH/D+f1hK5n7aVdnXJcT9j8ba
	zqOG+pczqo9rVdzUJx04+AKvIX8skXi1iYOyErlhfbEmHgjAHF8GqNn8R0b7JVFh
	2oJTrRuOhiDPZpDNwRM7dp/SflDfXPCOIYPWhFhk+7WOw0w+U46VCYfi01zvKMwA
	2WuqgtPabJSUVrnTWwtoj0Co9UP9j8jylw6NTPDZrstE8c7ipWWujnYUtNETwuo/
	SjdIMpV4DBtSi5X31Onfikmx6xagBWAjVXjvAJKaFxESLAcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8q26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:48:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so747233685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018908; x=1793623708; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oLrrooat79HtkN3dz5cx1qFd3lBwlFNkO28qDmfrYY0=;
        b=S9sbDHIZveT3++J3S3r7n8Ge8YOWThMF63uBqAEtr2BBtxGZ2tto/y53rUXo/5DMp/
         z8pkkCLcz5O4WWgP6Ux3mb9TNvqA7P7aF76PV3LCe1TkCLUvB+vA7SsNGdKV8bcawbmX
         /DmGP5TVJN3sPDiSLTlRGJxwBcUwR5EZlrGqTGbwC3h7Rjowk/pdd5kXs9fDdM9fHtnr
         /Xu3XgwHLCqhe0FdSODCqvfq9QgsIhF7T26WnQ1vfonu7AGlVeb2lQBKX7go2/jixmQW
         k2Oa6HeTrnBkjEsUmQU7n4Mct/0gRN9ZB7fU7+2akb7Qfj8v/Wiu7T6ERwuoNwSBY6NJ
         UsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018908; x=1793623708;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oLrrooat79HtkN3dz5cx1qFd3lBwlFNkO28qDmfrYY0=;
        b=naC13ALC/g1SRLucX3xv9H5Gmwb/recPDB4L82+w/duVVRwjepmktylIDeHtbaW7/8
         du01YPXkuX60njZQx30Ko8KWRK0wQzRcBpFZad8AcUy6Ojmnf2IfKUjyIhd4mVYukDid
         eAkMW47HJbI95wYIfh5IDjjuthPX4cz47/ClcLz5M8om09fMFvup78FDTF44fro/ggO9
         ka8t54fujnggrkBjf0KS0ppSThl9e0GWwKPAV1flSauq+QhTt3z4zZ8o4clgBQsYJxPo
         cW+VDioGgsxrevU27xG6N0NI2lQCOr0hdkCjs2MkzaNxotWQRYlPKGMrrlvubVdXL7MC
         pvRg==
X-Gm-Message-State: AFq9FYLRn6Ne2twRHCdC++vu2FJ6P3AXaKcNBfEUflpJQ/toqDt5rxl4
	k817clRRZN4igZPu3sizNhY3bapde/we0gsazyACgwYwOflklHXMmFfw6PwgW6CrpuD1ZG3HQNr
	YQahuVYu+eDfq3UvPQ9Gww/QWr5zQB2+wPz79YxrRqDnGqDXn57UbmF4JgtqWKdPbga1B
X-Gm-Gg: AYBFou2cuayMf7vUiuH2NT08GCVOFTxTlG52MabNM370UAra8Isl7o+3PqO3eZkXvO0
	IWANLpyVy8yoXjOqjs3PisOYm8BC8b1sS9hRcxnttqkpv1WJ6tglCpyj0VP5zb1qEx3qL/O7at/
	zgI5edUDr3SxVBQzNKWouDIGs9aduk6j2MSxKDRceBZIKnPtXNofBFdQ3T6P4bx5sYAB5HnqZSr
	0v8IzzIkBgHYAARtZ8+UxeIL+hMSmzyW1cnPfpYgNLan7yGfIhfMSWU7bxeOazBJVj8eNjLv+kq
	VtV6R99epG3heGpreAmQ2gJb/i0XU5HWI5I7ZtEa/PJ0wE6E/vHcsuyFuv11no8YNWINon7Shi8
	sk4OwPuiFEQ==
X-Received: by 2002:a05:620a:4150:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-940ef7aad70mr972310185a.3.1793018907345;
        Mon, 26 Oct 2026 05:48:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-940ef7aad70mr972304685a.3.1793018906663;
        Mon, 26 Oct 2026 05:48:26 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3da7sm17488711f8f.20.2026.10.26.05.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:48:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:48:21 +0200
Subject: [PATCH] spmi: pmic-arb: Set the interrupts up again when restoring
 from hibernation
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
Message-Id: <20261026-b4-spmi-pmic-arb-restore-hibernation-v1-1-5f2438dc7813@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABRM32oC/yXNQQrCMBCF4auUWTuQxFCjV5EuknS0I5iWmShC6
 d0bdfEW3+Z/KygJk8KlW0HozcpzabCHDvIUy52Qx2ZwxvXWuCMmj7o8GdsyRkkopHUWwokTSYm
 1BTCYU4y+9zacA7TUInTjz+/mOvytr/SgXL9t2LYdF0y4M4gAAAA=
X-Change-ID: 20261023-b4-spmi-pmic-arb-restore-hibernation-807aa4641898
To: Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3957;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=576hds7YFmxgz0T20j6TL25eLSSQ48tiFuGk7ikETeM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq30wYuCXxhZFe+OKlD771JB09ztGr2Ztr2MwJq
 m1E+ShpkRKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat9MGAAKCRAbX0TJAJUV
 VtMMEACCrlzraYJ9tnzqbs9ejB36XZNw+QbtK0DtlgasGUtXKrzCwc0rsgzlA57w/5LWfTRT0Mq
 +eiKms94IBLztnpN8uEMjFfPTZETpakUWzUi58QSpJUzhF9+YD3dnoWtn8z7E6hqEAPWLH9upaK
 TsAOcc/ufn3OzqyD/LGkqjy5DCdjB77/YaiS04C41/cc+fyCZVLakh4VtAjvToIqL75veeLmqxZ
 6Q9HtFrQgdP94s46JZG5Fo0fzqKzuWv6uP5CcYy8JH0zNMrCTJP8t/2HLYDkjaOTObHG2xfjx4h
 iAWnJtOou02V14dGfyT5/vAPTZzxTz1VlP0OqA0HVRxJAT4Td1w3sEJt1SqjAQW8NThYSjkPagV
 3l6tujoYrh0CddceNpRXme1fzPFZYBimGtf5KhaqiosOzSEQLE1L29XL5ndt395GEwc9PGVGrmB
 V8CqVSIxIjGoi2YqOXtPwHbT5drtFCU7Hg8cmpbnXpKzmTEUqaly4fGYkWNFcizJhHCz8cI3XiG
 PLKclpb74EY6IUPI7+5WMR8WrJNo6aCrQo+iD79HZtvYi47Jq2KI7PqnR9QUXjbMjOVjqw1dWp5
 kGnrsqbPzhcb5ip3NxfrME8OD9j6PpQKAKQTACJowYXjsWWjtXzD2JibKYDdIm25uzgOYMAhH8L
 2YgAgL6LH9ZOVUA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX3z5oHsWdp+8j
 ynk8gNkLwbuxGBCO4243Q1lHAK/uenfrntfZvGdnpTZy9f3S+47+ursiilLWbp3HAtDeSAoytv+
 LBdNTNbbXytRxGLVkhMBAbWtyIbxVetMhKxg8uA3rH+0KKy/aM7VE4gKSDNQHgtOSonzWI7uTxJ
 M/h002R9pphG8GbVSFyXx+P8guWuGJoi4XfcrTqjYCmhff6GhteVKf5vBHknFUHnT1oWRwOPTv9
 hQLW86UmGPGGm16IuaW5J2shVu/EZJ+DBuzmiyvgZZVul1ksI5vLmwK2i8EhRSXnUBcEa99s3Sr
 cemoTTTWjqVVVnG5jiJ2RsnJT49Zuf0w+QFplufn8b9HSPll51kCepWLoPiCbw+erqzQy09wWzL
 0QEki9uIhL9ldZtcQxYwUaIC69xbBq8pqMsZHz/AxxcXiHBIo3bLN1VSEFyVizvdenvS5YzmCaI
 v1Yj477JvApSBO1kjTA==
X-Proofpoint-GUID: fxN3aLdB4cuLu-w16dsGLOSOwnd9egMf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX7ysHrS7CAj2W
 r90pDMLAF1EtaKl9cMrzY6M7fNlCpzbMuVf2hdDRo5ArKDnJu2L2ePT0BbFU/FTpEDZtQQl3r+s
 TbODybbhGo+FIrIltLAxtZl2x+v80Lk=
X-Proofpoint-ORIG-GUID: fxN3aLdB4cuLu-w16dsGLOSOwnd9egMf
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf4c1c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gULSp4nZ3xnbK8Yvv1gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260050

A hibernation image is restored after a power cycle, and after the
kernel that loaded the image has set the PMIC interrupts up for itself.
Neither matches what the restored kernel remembers: an interrupt it
uses may be disabled, have another type, or be latched in the PMIC from
a state nobody acknowledges. On a Qualcomm Glymur CRD the temperature
alarm interrupt then fires forever once the restored kernel runs:

  irq 293: nobody cared (try booting with the "irqpoll" option)
  handlers:
  [<...>] irq_default_primary_handler threaded [<...>] qpnp_tm_isr [qcom_spmi_temp_alarm]
  Disabling IRQ #293

and the machine never recovers.

Set every mapped interrupt up again from the restore_noirq callback,
before device interrupts are resumed: clear and disable it in the PMIC
as activation does, program its trigger type again and unmask it if the
kernel has it unmasked. Also clear whatever is still latched in the
arbiter for the peripherals owned by this EE.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.
---
 drivers/spmi/spmi-pmic-arb.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 402ffeaff8e2..eeb584e2777b 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -2167,12 +2167,74 @@ static const struct of_device_id spmi_pmic_arb_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, spmi_pmic_arb_match_table);
 
+/*
+ * After a power cycle and the boot kernel, the PMIC interrupt state no longer
+ * matches the restored kernel. Set the interrupt up again from scratch.
+ */
+static void qpnpint_restore_irq(struct spmi_pmic_arb_bus *bus, unsigned int virq)
+{
+	struct irq_data *d = irq_domain_get_irq_data(bus->domain, virq);
+	u32 type;
+
+	/* Already activated as far as the core is concerned, so redo it here */
+	qpnpint_irq_domain_activate(bus->domain, d, false);
+
+	type = irqd_get_trigger_type(d);
+	if (type != IRQ_TYPE_NONE)
+		irq_set_irq_type(virq, type);
+
+	/*
+	 * Follow the masked state only: when enabling an interrupt, the core
+	 * unmasks it only if it has marked it masked, so a lazily disabled
+	 * interrupt has to be left unmasked.
+	 */
+	if (!irqd_irq_masked(d))
+		qpnpint_irq_unmask(d);
+}
+
+static int spmi_pmic_arb_restore_noirq(struct device *dev)
+{
+	struct spmi_pmic_arb *pmic_arb = dev_get_drvdata(dev);
+	struct spmi_pmic_arb_bus *bus;
+	irq_hw_number_t hwirq;
+	unsigned int virq;
+	u16 apid, ppid;
+	int i, id;
+
+	for (i = 0; i < pmic_arb->buses_available; i++) {
+		bus = pmic_arb->buses[i];
+
+		for (apid = bus->min_apid; apid <= bus->max_apid; apid++) {
+			if (bus->apid_data[apid].irq_ee != pmic_arb->ee)
+				continue;
+
+			ppid = bus->apid_data[apid].ppid;
+			for (id = 0; id <= FIELD_MAX(HWIRQ_IRQID_MASK); id++) {
+				hwirq = spec_to_hwirq(ppid >> 8, ppid & 0xFF, id, apid);
+				virq = irq_find_mapping(bus->domain, hwirq);
+				if (virq)
+					qpnpint_restore_irq(bus, virq);
+			}
+
+			/* Drop whatever the arbiter still holds for this peripheral */
+			writel_relaxed(0xFF, pmic_arb->ver_ops->irq_clear(bus, apid));
+		}
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops spmi_pmic_arb_pm_ops = {
+	.restore_noirq = pm_sleep_ptr(spmi_pmic_arb_restore_noirq),
+};
+
 static struct platform_driver spmi_pmic_arb_driver = {
 	.probe		= spmi_pmic_arb_probe,
 	.remove		= spmi_pmic_arb_remove,
 	.driver		= {
 		.name	= "spmi_pmic_arb",
 		.of_match_table = spmi_pmic_arb_match_table,
+		.pm	= pm_sleep_ptr(&spmi_pmic_arb_pm_ops),
 	},
 };
 module_platform_driver(spmi_pmic_arb_driver);

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261023-b4-spmi-pmic-arb-restore-hibernation-807aa4641898

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

