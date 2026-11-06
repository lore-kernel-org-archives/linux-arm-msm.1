Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975370;
	b=t5FVEWH+KMdGsmUMySZ6vPo0/pbMovSVqf/dMXoJqVEB6WKipNG70rorMfpSZXjEQIgC
	 VYuhiOJ0HCSIpWJ+RSCPXsfpby8Jx1KfnmPlftcBWbfmVfCaW0OnouV+ENsqeVG5B1idm
	 M0ctCQleNmeHsVl6wDce/r7gA697QQhX8YIujlkmJkakI6HCtumNhAKp5WWS1gpmHl+4U
	 jJugDioRP0UPepigH/bYD4ryQxPRvyI9iFQpkGPr3ViZtoeiuycetiz74OW4HG+iwDRjp
	 kqKD2JN+woD77xMXp1TAbLxswTX2dCmB6cQx8oM4DF/3x0VtZVPp7w4+qsxcxZNlRmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7vmHHHIhGLLZArBpIpsBA+MrbOxXbqqJ8LMqN1WNGoQ=;
	b=BoQQoag6esyDxMVFHfPrurEydccir4UdWYKLSny9HZiUfQ3SNnX2Jj9EY1+oIxAk1nvG
	 UCOKrvGZRpTc9fW5yvVD4ZaoDMePogRVio0FKQwkDV0sDWShl9KrSd6NCJWjbaMbFYtiy
	 rZiNvCBiYG2m6LNvQftPDB0KmX31ggZ0y+eRAwsAD8ShWj75yyg2jOJIMf6gOqXbFCvyM
	 uUqRZ9livhqQHZ6exBjHXqdW0FbxW1OJWgsbjqaMyyiysVx4nYTHmt3YybkpoO+VScmK7
	 S/PgPpewmXewbCxUW6EDNajqilebNBzFZ7XInDIVfsa9zl1QNvFbMe4LsGuZOofDc0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eEDpkHpT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTxI33Zy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA048606A339
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 14:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA048606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eEDpkHpT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTxI33Zy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQMuC635313
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 14:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vmHHHIhGLLZArBpIpsBA+MrbOxXbqqJ8LMqN1WNGoQ=; b=eEDpkHpT49QTAIFi
	IHpOeC6yO7P0M2r/iExGAYcj7vzw13WUBwmH2Soc+w2rTLJpR5pWxlHmiJjqnCkb
	/n7jcp3R/7+efyrUoyXdluIvKEhUZg1U07+VaRitJJ99NSB0Osj2ZQXrm2OuuD7+
	rOpAQL/1krZGyVRxq5NZIVgW7gIClQXMGLI4YOhWq5UiGogCh+B2zS1iIn+fj3YP
	dIn+9KSVbr1ZVUJQV1Ghr8uezy2Xgv5j/g4BW7xioDmei4E8TRUrLTW9dFk8fXsU
	XiLszCtJbJk9fvpovu6KbhjgTbHVxI/EpC9wCaGReNBtlPBJbYhHfScVrk1cijmu
	+NarqQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pau4up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 14:29:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a086ed8980so533048b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793975368; x=1794580168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vmHHHIhGLLZArBpIpsBA+MrbOxXbqqJ8LMqN1WNGoQ=;
        b=MTxI33ZyUj2miqSjkwnriAQj2iDcDQ3yptODCLwtM7gZT4yIlIF40w6+qgPLwAFK+R
         s+E/UNEA/F5kewvc5wk6lh4UzsPGJzGDarC4GgBA/Tg7QpmL+0jACwotO/zCTvO0I0Q3
         NEAe+ha57AlokWrSptgH/yYwBEnPFaJ0NfS7MvFHfwWo5Qatn4s0ndonhxEWuIufL2qh
         cQI1JaNr9pyWcNTtW7RWkpjB6WxJZ+e/URe2W2MhVmAvJhZNT78/qzte1teswWeyIiUg
         FtuWckgX3ehDVjHGjkk/aFulmNd8u5opDzyscNdYgrdPRWiycmAirBDF6XCk2gEslFb2
         5aSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975368; x=1794580168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vmHHHIhGLLZArBpIpsBA+MrbOxXbqqJ8LMqN1WNGoQ=;
        b=BkLpwh7T6NfT6fflGzvIKO2hrT3CjJAKzkGsy4dsE+V8WquyWXyPrHihNNfjnwr5SO
         sTNR3jzABDuAhN3VAQssVk1+3RZQKzGu0ufREKE5i076jJLxbeQ4gPxMvIfXAmGjKkcU
         AxMLodQZs1Sg5qTXoKkaF9yvyqfL3epaTcBlqbZAumFgROzyXvorfJ2SkaQTzQ1Gtafg
         aOC9rDeu/sRFg3fQgM5QQ++3Qe1HtKs2q/PnK68K3sugFJjpwCT1Sft1HVczXvTzQsAh
         nZmHT6IcouyC/IM0JGgM0NnxYWVV1Qp45V+4N1E9QERFokPyjA+qdf8Cnl68f7dr0YQk
         HblA==
X-Forwarded-Encrypted: i=1; AKwUvBwgK0o1NNj/5jeFzrJXrC968oveJ83ljARZe4C2YwCaIsBRoCUIuQdinG2cjPPVybSaFqh2BG7V7TkVgsGl@vger.kernel.org
X-Gm-Message-State: APuU4Z+VWhk9HFGXmOjjpcjngEhsvn6s9r2JeYTuPljl9kyN2PDwNI8B
	IDz7oInaYCsw8L2oc60YjB3v5SIsTLkvQVBpFI8yzFY8Va6P/Jj5t2sz9ZUmMIl0NYUMadHlicC
	Ryhj2pt8DIT/mFyCGn/cTiW5h2x011KrHgIffbPJifPsw3M+t3ifV0arMQtGT6y6izxcI
X-Gm-Gg: AYBFou2i4SucOrE1p0fEbQ3UKhjq1Dcwy64lXRQChhRqfNmnQDzzCEarVkQVE6ZpOcD
	uzgzzDRHlHzBC3yzrxjp+J2QRgVpzGspFMYp/lx7dmWEsZTFkZg3xKkbylW0067hny6pvuEAeCT
	xnGrmUgvz20W7pquLalL5x4CP3hgiQVU+tgGE8e7R1IugQ03xQJHowNgHqeleRarwujOAs5bWkV
	elasbg11XtPG9WGnsdkHc0qNwnhKd2GEVZMynVdn2fcZjNhFLi1BpEXXkkoaUYMP52VfivJhfD9
	5Sq4i+wFmBzNXcKa+zupLAvLyUiVllSk7afmzJ/LUtj5zT/gqyMN4KfxpRJ3dGUrx/l+EWDB5RO
	fLjnKQPRUjbaFi6t2q9xo4cIBnaBEBHiG/rsFtjeH2mi7R/1LqmvOAvRV2+VMm7cQRtRRNtyg4O
	kjHHSOyQ==
X-Received: by 2002:a05:6a00:a226:b0:89f:2b65:2a1 with SMTP id d2e1a72fcca58-8b37ac9e896mr1857688b3a.8.1793975367696;
        Fri, 06 Nov 2026 06:29:27 -0800 (PST)
X-Received: by 2002:a05:6a00:a226:b0:89f:2b65:2a1 with SMTP id d2e1a72fcca58-8b37ac9e896mr1857668b3a.8.1793975367052;
        Fri, 06 Nov 2026 06:29:27 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0161sm690244b3a.26.2026.11.06.06.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:29:26 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 19:59:16 +0530
Subject: [PATCH v2 1/2] i2c: qcom-geni: Add shutdown callback to quiesce
 hardware on reboot
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
Message-Id: <20261106-add-shutdown-and-panic-notifier-for-i2c-v2-1-d3011344fee8@oss.qualcomm.com>
References: <20261106-add-shutdown-and-panic-notifier-for-i2c-v2-0-d3011344fee8@oss.qualcomm.com>
In-Reply-To: <20261106-add-shutdown-and-panic-notifier-for-i2c-v2-0-d3011344fee8@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793975360; l=3516;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=hRy4QXtTf2tMCZvfoq+ui5IjC6XD/IxzXIrA2TDPPZY=;
 b=Sl0GfULmLBGOhXk/jGilqw1s4SmGQJyqlOiznx84U8i/gtsWmM4C6+ZIexx8EgxkygSg5hr81
 9GgwxnuX8+sDshWQwUCEvlUOWHY3H7SVE8mTxxTTiU1CN++oo+FJRtk
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX5uMjzWglw5Wz
 UyraU17bzLhVzAkb8yWdSC5ihlfau1LemttxLGlP2n6RW9CZz9YosCFPYI1ddIAsKXnImfhnQCm
 6fp3NiCnWQnXMjNd1Ph9QBXvg3fvEoLIlh0NNc/PBJxCnMeil5FvnbLXcV3vrYtVZ/3PZGq1a2L
 L3ziMoUtLtk7ioKXeIdNz20DkiT3941gvkOy+ihwASayhCiFzQDQ+9nTmdmTS+Ugl8LwVtRu1yU
 g9Nl1uK97RzxjIx2/sRKZ8nu2X50ho9I3yRunhM9mIiwSOfixSelLKLNEleBbndqLIigK+Bjvh9
 CipAfwpFxY6/hmxP7SEXfa8P8cVOGBMroEZcS0YLuQx1Mvwd14Xd6H8F/4Jzbdylrigv2nfVR81
 nY6wbDD6AY73CqARuvmsGzYJ1N0pDivGDyonxgqexajW3s5UbaXewhYBKCuWnD94+94E5K+vQF2
 n+7cyb35pEDpR9O2E6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX6p4WlY4vkJ0D
 qW7LmpyJQ+TZkYlOLciZ59/Y57Vl6cTqfzfU9VGAo7cJN7h9mpLB39l8nb0T9Zvlo5Tklpnhdtq
 xXAtgRqWEhG20B6tHAzjFL+9N/+HCFc=
X-Proofpoint-GUID: iI35_Yq1477hX7D6gnvaEiddn1spOrbD
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aede448 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jy3MxQloX0jDNi3JzIsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: iI35_Yq1477hX7D6gnvaEiddn1spOrbD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060057

During system reboot, an active I2C transfer can leave the GENI Serial
Engine in an indeterminate state. On VM-based platforms, if a DMA
transfer is in progress when the VM is shut down, the SMMU can raise
context faults as the DMA engine continues to access IOVAs that have
already been invalidated during VM teardown.

Add a geni_i2c_quiesce() helper that cancels/aborts any in-progress
GENI or GPI DMA transfer and resets the TX/RX FSMs, and call it from a
new shutdown callback before the system resets. This prevents both
hardware state corruption on reboot and SMMU faults during VM
shutdown. dmaengine_terminate_async() is used unconditionally so the
helper is also safe to call from atomic contexts such as a panic
notifier.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 56 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..79707095bbbd 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -13,6 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -1034,6 +1035,58 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
+static void geni_i2c_quiesce(struct geni_i2c_dev *gi2c)
+{
+	void __iomem *base = gi2c->se.base;
+	u32 val;
+	int ret;
+
+	/* Make client i2c transfers start failing */
+	i2c_mark_adapter_suspended(&gi2c->adap);
+
+	if (!pm_runtime_active(gi2c->se.dev))
+		return;
+
+	if (gi2c->gpi_mode) {
+		dmaengine_terminate_async(gi2c->tx_c);
+		dmaengine_terminate_async(gi2c->rx_c);
+		return;
+	}
+
+	if (!(readl_relaxed(base + SE_GENI_STATUS) & M_GENI_CMD_ACTIVE))
+		return;
+
+	geni_se_cancel_m_cmd(&gi2c->se);
+
+	if (!readl_poll_timeout_atomic(base + SE_GENI_M_IRQ_STATUS, val,
+				       val & M_CMD_CANCEL_EN, 10, 200000)) {
+		writel_relaxed(M_CMD_CANCEL_EN, base + SE_GENI_M_IRQ_CLEAR);
+		return;
+	}
+
+	geni_se_abort_m_cmd(&gi2c->se);
+
+	if (!readl_poll_timeout_atomic(base + SE_GENI_M_IRQ_STATUS, val,
+				       val & M_CMD_ABORT_EN, 10, 200000))
+		writel_relaxed(M_CMD_ABORT_EN, base + SE_GENI_M_IRQ_CLEAR);
+
+	if (readl_relaxed(base + SE_GENI_DMA_MODE_EN)) {
+		writel_relaxed(1, base + SE_DMA_TX_FSM_RST);
+		ret = readl_poll_timeout_atomic(base + SE_DMA_TX_IRQ_STAT, val,
+						val & TX_RESET_DONE, 10, 50000);
+		if (ret)
+			dev_err(gi2c->se.dev, "Timeout resetting TX DMA FSM\n");
+		writel_relaxed(val, base + SE_DMA_TX_IRQ_CLR);
+
+		writel_relaxed(1, base + SE_DMA_RX_FSM_RST);
+		ret = readl_poll_timeout_atomic(base + SE_DMA_RX_IRQ_STAT, val,
+						val & RX_RESET_DONE, 10, 50000);
+		if (ret)
+			dev_err(gi2c->se.dev, "Timeout resetting RX DMA FSM\n");
+		writel_relaxed(val, base + SE_DMA_RX_IRQ_CLR);
+	}
+}
+
 static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 {
 	u32 proto, tx_depth;
@@ -1209,8 +1262,7 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
 
-	/* Make client i2c transfers start failing */
-	i2c_mark_adapter_suspended(&gi2c->adap);
+	geni_i2c_quiesce(gi2c);
 }
 
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)

-- 
2.34.1

