Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75681477E2A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059706; cv=none; b=AzWOywd5LjWqhKmN1EA5CT888k6MWVtLZJy3wHVU3NFfU8ZvRRU5IamsEWEtOHRcAQ/M1lUNY3Cv7dE3fT+mO00oaSTs2GX1hbC4t0JdGsiLd70dQ4E8s95dhQxSYYI36lknz0OFBWgM/l6xqL8kGxCx/hEHHbzjSRP73bpKt7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059706; c=relaxed/simple;
	bh=BpLYbDTze5uFtkiCRqcEFWa/uhNMG9l7EwehucHfhME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M/tYlJLx3gPsnRu0CgJJ/u2gws5bZoXNgklNVLNmiKLFr3NDo3zg44VZQQtFSWPicTnY0OiVKL/M3f6v4zsWrVUywZRrxDRQRWJ2I4brGM1L86MVPBIcdW8vv1+kQWs5a4iFrmnUkD5sMj3lsSdydVvOIQTwQ+ovHMP0jMYGsXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgjVVis5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPF+Lm6Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgjVVis5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPF+Lm6Z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDQr3W1250890
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3mgtIdNm+Qcja3pfQQpEG06zXdPExxszQT4cQ1BBpI0=; b=IgjVVis5adGb0887
	AK3ZpaD/sEdq8TaiDYx7uoAckyxGKBK4bH3xAzRGZsIOnetnT4KQwRG/c6MIUoeu
	3GIMoOnQnDXDtxQaP+G/MFopW5iSezk1nqxa+QZb2UbKZKUqTolqeiwIQZKKQhKk
	CGKSct63HX3/sRynAhHRk9mGxmec3HTbA5VI8zq9xwhL1xI1GpABYQV66jnL2Ktm
	0zZwstb15RgI46HPT/Bc5few+hGIRPVjLubhDLh+aUk4bv0zY1if0HMwK8dOR6ry
	Zj4zZ7RFyHdgxd15L7W9FjXhwvmBeFXmSPBRYmrlmkz/j77GYitVaPrIDklEvzMi
	WX1k3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p27je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:28:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so560964285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787059703; x=1787664503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mgtIdNm+Qcja3pfQQpEG06zXdPExxszQT4cQ1BBpI0=;
        b=JPF+Lm6ZFqlPUUobRbR3vYWRU9vkSIs/wecp/t3r5qsF0E0RLyLjf3JxCfkWbZPf4+
         tfiN0S09VjfQ+wqHpJCln0O7kwx4K2xQJf4O2bhId9yQ2s2ebbXHe6GJqDpde972Yna1
         Uj611Ro/DqE0nUge/GzlcLlovxzjgZxvugYdTjSrW/XmlKtKbHy3DB9UzzecVM1brKYK
         qj93Wi93bT/2TiZ0cApJloWu5D85g/ZMpgSuj3sXj7ltJMnNg+Dt/6cK2cjqohap1uTk
         RZUCCt+eXWTsoRjc97Lx9Nur7qMU8fexoHwiJdeBEpJB91GAP9351fWldNYey8LLEutJ
         WAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787059703; x=1787664503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mgtIdNm+Qcja3pfQQpEG06zXdPExxszQT4cQ1BBpI0=;
        b=ihQIwWQbAsVDKe09eBxrEcZfaOQM4FxEHiIWRsV8J32P1vEbN9D2SGV6p55D5a1MMb
         7IU8PVhZii81ZluBCRA1bODoqL/6pqmPS2CA2mrUq2Ed3zvF0R3Z2gZ1xGm2oE534N2V
         sryjS831DpBGWHQpEwy+gjjUeH+fWf/whE5M3gccasGc/QlmanyRG77hIUvR8aM2ACWB
         gBHLJcVE3LWPyjS2jFKso7Yyugy0kx9YO1c8KGMQ+VYJx6z8EfYZbmb1AVzy72r7U/XA
         Y+RubQiYMoWuffjgvfUQGKL5uo6rSSqZ2kL4OzGCwyWkreOLQIQvWUBUP1kTcb7ZIYOj
         a+mw==
X-Forwarded-Encrypted: i=1; AHgh+Rq11Y0USpvo4dPEV6KPN/saXUel18CzG4S0kzziLxi59kSL4lyvG2qomoWalzEmwb56hkzxbzg/gMf2vVfI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1OeCZ1sx+Urr6DWpwMyvZJEH9TkqpcQto5oP5d1PJJofAqRL8
	inOWcLujVZPupgdUnw4LISBt8+ga0WJDfNd+UcbON4ErjnGRV3BcU37DKLIEU7NWDgVf8tzUPAV
	tTy8jrVHc3c+Qm34Fm0p25OyDm65Hfr+msnoU+8M9eHsXMQsd7w9IogcZZ1HE83HQDDRJ
X-Gm-Gg: AR+sD13BiH1swFGYwlyAp4/dc5S+sjrIs2p0utGlxlfJU0rG2bYSmh8m7771YD28r76
	XK/KO8yP5oH6fZIK4JiwqC/eg9sJ/uml5EILsfCz5HqNPha446dFBVwoUSM1NpQu1eJOWKKCuNr
	gZuhVA2dPou1ttDmZcJHNfkJRrCE5oSNTJ9XgY3OuLS6VtyTZafNWX5atgiyMv8o0VTILrNs7ZW
	7PoqhM3YI7dErz6Z8vVqm7LSu1nMgvLRsc8flqGU/rm+S5okrjT29U6ruOY0taGFd7rKey38NVu
	YnPx8pLIRXvnJnw/uU/r+k6YCjiNDz5czg/k0Pu2Ezcwc4UU7tSNUZaeoFmEUIowicp5EnR1FVC
	pxI5P7Irm0hhh1DdslpNh93u2QVD/8OX1YA==
X-Received: by 2002:a05:6214:3209:b0:907:bf98:c8fe with SMTP id 6a1803df08f44-90c4b3b832amr82744506d6.23.1787059702681;
        Tue, 18 Aug 2026 06:28:22 -0700 (PDT)
X-Received: by 2002:a05:6214:3209:b0:907:bf98:c8fe with SMTP id 6a1803df08f44-90c4b3b832amr82743446d6.23.1787059701954;
        Tue, 18 Aug 2026 06:28:21 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4580f611sm32304636d6.6.2026.08.18.06.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:28:21 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 18:58:08 +0530
Subject: [PATCH v3 2/2] spi: qcom-geni: Add panic notifier to cancel and
 reset DMA during panic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-add-shutdown-and-panic-notifier-for-spi-v3-2-8b62c4bc2d21@oss.qualcomm.com>
References: <20260818-add-shutdown-and-panic-notifier-for-spi-v3-0-8b62c4bc2d21@oss.qualcomm.com>
In-Reply-To: <20260818-add-shutdown-and-panic-notifier-for-spi-v3-0-8b62c4bc2d21@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787059691; l=4545;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=BpLYbDTze5uFtkiCRqcEFWa/uhNMG9l7EwehucHfhME=;
 b=LWzceMtLaSx00PKV1NOaClTV6SVIcr+ol8WyWfyRqz+P3Md14Lcxe88mRt9e1rOLsaHVg7AkC
 KXAFeL3wo8aBclbdhwabWuT3a9B265E0sz5akh2ws3lQsGveno0TdsH
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: oVl_0FpTBmOISZztM-Le7HldyvdQ-hDL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5OSBTYWx0ZWRfX8h2rb7EPsiYb
 mfO2hneV0zc+oCtR6V29kZMMx+iNJXQ5yJdMLZrex+y4WrgvA/NLEwiktcGV6lNRQMXiHIhnUZT
 w3pQ+MxIYGJvO0vgJdIopNDwkryeFeY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5OSBTYWx0ZWRfX/rQgTshJ85za
 hDiJnzhOQRPpF7XLNb7mx+24vn+LcKh2s1+bO5Ybt1MzdgIOXM4ZyoNYXM/cjK/lE4uBT8AAUz2
 uGFgg4uo5QJGWF4Rt1pt8vk9QNjKtRwIEDoVJmI0V761KERqvVqjW4XF+hyqduFiVV4te0HOGbF
 9UH/3/FzSLEa+wU2uPyh1OEI9C7fMNdbPrHZyOPYQPS1gDclmjiIIHoxfPJz4Zf5cioFdqwq0p6
 vxbBD5GRdHshfQVdP7ml7WRRskUTIBduYmM02XFc9KjgR7SHYLnlCC16CYXeYJTFhZU4M9F5Kv6
 6R52zoBNL1oP7raczq5IigWJiIfJRA5OXar+W6/NLBaLNY0mvkGQeHwxTdCR6zaBT9bPDaDyEgQ
 IdSw2p/xPmmDTJbD0eWcYIgfgh/OS4+xrbs2QJ2eqUREfmrbmYe798DJt0G7+SAIyShV3oZSgpk
 0SCWMbzyhkvRimiN8yw==
X-Proofpoint-ORIG-GUID: oVl_0FpTBmOISZztM-Le7HldyvdQ-hDL
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a845df7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xoWfBlptTmbWqyQa1LgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180099

When a VM crashes with an active SPI DMA transfer in progress, the
SMMU raises context faults as the DMA engine continues to access
IOVAs that are invalidated when the VM's memory context is torn down.
These faults can affect other VMs sharing the same SMMU instance and
obscure the root cause of the crash.

Register a panic notifier that cancels (or aborts, if cancel doesn't
complete) the in-flight command and resets the TX/RX DMA FSMs, so the
DMA engine stops issuing transactions against invalidated IOVAs
before the system halts. For GPI DMA mode, the DMA channels are
terminated directly via dmaengine_terminate_async().

The notifier bails out early if the device is not runtime-active or
if there's no active GENI command, avoiding unnecessary register
accesses while the SE is clock-gated or idle.

Since panic notifiers run with IRQs and preemption disabled,
completion-based waits used by the regular error-handling path
(handle_se_timeout()) cannot be reused here. Instead, the relevant
status registers are polled directly with
readl_poll_timeout_atomic(), which is safe to call in this context.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 68 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index c65c1788325d..f272bd0cb640 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -12,8 +12,10 @@
 #include <linux/dma/qcom-gpi-dma.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/log2.h>
 #include <linux/module.h>
+#include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
@@ -115,6 +117,7 @@ struct spi_geni_master {
 	struct dma_chan *rx;
 	int cur_xfer_mode;
 	const struct geni_spi_desc *dev_data;
+	struct notifier_block panic_nb;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -1073,6 +1076,62 @@ static void spi_geni_shutdown(struct platform_device *pdev)
 	spi_controller_suspend(spi);
 }
 
+static int spi_geni_panic_notifier(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct spi_geni_master *mas = container_of(nb, struct spi_geni_master, panic_nb);
+	struct spi_controller *spi = dev_get_drvdata(mas->dev);
+	struct geni_se *se = &mas->se;
+	u32 val;
+
+	if (!pm_runtime_active(mas->dev))
+		return NOTIFY_OK;
+
+	if (mas->cur_xfer_mode == GENI_GPI_DMA) {
+		dmaengine_terminate_async(mas->tx);
+		dmaengine_terminate_async(mas->rx);
+		return NOTIFY_OK;
+	}
+
+	if (!(readl_relaxed(se->base + SE_GENI_STATUS) & M_GENI_CMD_ACTIVE))
+		return NOTIFY_OK;
+
+	if (!spi->target) {
+		geni_se_cancel_m_cmd(se);
+		if (!readl_poll_timeout_atomic(se->base + SE_GENI_M_IRQ_STATUS, val,
+					       val & M_CMD_CANCEL_EN, 10, 50000)) {
+			writel_relaxed(M_CMD_CANCEL_EN, se->base + SE_GENI_M_IRQ_CLEAR);
+			return NOTIFY_OK;
+		}
+	}
+
+	geni_se_abort_m_cmd(se);
+	if (!readl_poll_timeout_atomic(se->base + SE_GENI_M_IRQ_STATUS, val,
+				       val & M_CMD_ABORT_EN, 10, 50000))
+		writel_relaxed(M_CMD_ABORT_EN, se->base + SE_GENI_M_IRQ_CLEAR);
+
+	if (mas->cur_xfer_mode == GENI_SE_DMA) {
+		writel_relaxed(1, se->base + SE_DMA_TX_FSM_RST);
+		readl_poll_timeout_atomic(se->base + SE_DMA_TX_IRQ_STAT, val,
+					  val & TX_RESET_DONE, 10, 50000);
+		writel_relaxed(val, se->base + SE_DMA_TX_IRQ_CLR);
+
+		writel_relaxed(1, se->base + SE_DMA_RX_FSM_RST);
+		readl_poll_timeout_atomic(se->base + SE_DMA_RX_IRQ_STAT, val,
+					  val & RX_RESET_DONE, 10, 50000);
+		writel_relaxed(val, se->base + SE_DMA_RX_IRQ_CLR);
+	}
+
+	return NOTIFY_OK;
+}
+
+static void spi_geni_unregister_notifiers(void *data)
+{
+	struct spi_geni_master *mas = data;
+
+	atomic_notifier_chain_unregister(&panic_notifier_list, &mas->panic_nb);
+}
+
 static int spi_geni_probe(struct platform_device *pdev)
 {
 	int ret, irq;
@@ -1161,6 +1220,15 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	mas->panic_nb.notifier_call = spi_geni_panic_notifier;
+	ret = atomic_notifier_chain_register(&panic_notifier_list, &mas->panic_nb);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, spi_geni_unregister_notifiers, mas);
+	if (ret)
+		return ret;
+
 	return devm_spi_register_controller(dev, spi);
 }
 

-- 
2.34.1

