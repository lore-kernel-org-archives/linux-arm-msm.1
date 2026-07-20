Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30A6434E29
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560097; cv=none; b=T2j1a1laNJbsKHTPysiPb6ds751lWiieonNAoMpTErNciofSbTSj96eVdDtqEBw6tEVMwZvFx5ZyPOFrFCLMOP0uVo+CTVL6eLmN0isbOzGBF1bzGjuf8EPEGkrraIoZP/ONoeKdwgTvZPQ/zI+oCrhhzW4hWd9ZyKgS9pQmToA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560097; c=relaxed/simple;
	bh=SJjTUHlMNzbHbPh8w/YzLyeDEVKL94o5fz6ILL/JKb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eelLLR2wvMw9+qxdPMw2vN982LmkEE6NB+M6ARVweq/0LTeWU7tn2hd3Lr1s2gThl3kIBdi3wMVLDAhBEq4RABX4JUV+78vdbUwMF4WemJdG7MDlMjdqf5Z4zcGhfpAU3qqO5aKTYSpTVbFTYsKgUuyi/CyREcxJWlbvcoDymjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/H2T4UN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQhu4NRM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/H2T4UN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQhu4NRM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqt1f2852645
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gv/Mc9YDpHV0q4uPifKaSiGmnLmBmYxDgZHdP91zT1w=; b=P/H2T4UNdai7dGPg
	xo2Nz2ouGJ/6JYJmvQvi8o485UHwhToTkOUfB987jlyY8SNwCo8cb5wYr1JfSDX8
	BrjsiKOBXmyb+JOunPaWL4jDXcvJ3MYMeFibSbhmjpp36GbspvWkiYz4Dt+urLHG
	ZGffhTZQ4dSkp3+nBsvyJwh9SFK71H/GpVOAje3zZ9DwtbAoxEMGRLgeM5Jk1xQ4
	ehtbTTr21fpQIXtJ780Jg9GlDShRwm5jgeBCdWJG77i9CrszPpE1N8hXv+9ZQvIe
	FF6NJUd4rOlRYEv2sqbAHxG0Z12sDCm2ZUpuZMFP+TthPbPHY3S7OQQZOjIfoWOO
	XKL7iA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgysa4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:08:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso6175074a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784560094; x=1785164894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gv/Mc9YDpHV0q4uPifKaSiGmnLmBmYxDgZHdP91zT1w=;
        b=EQhu4NRM80w1uiwUb4m61THXqwqjhFPYyb1KEtgvv3qSqFKJozxf/ioLV8NnzzZxct
         X/e4/S//2uRb3ymr1oXnQSjQ12Oo3fJhPQXzuhWc7GwiTYt2YoooVxJakWrdeBB5FsAV
         RQDGszdmMjjVPIuk+Se1HE/6hlZm9ZdnCg5rDfOZbghcAdAprOKDXarSwwckD9krYILK
         01j2OtAmws0bscs5NRx832ck6V6T3FiZG3mxhFhCiGnEZjdFReuKrarsh8rA3M9zrEpp
         kaVAz7e5d1FdVznWJ0bhYHXAsUOVJifKb4o4/UDOaAWxZYbPek6dxlv3H8lYWvdI8k7J
         UKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560094; x=1785164894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv/Mc9YDpHV0q4uPifKaSiGmnLmBmYxDgZHdP91zT1w=;
        b=P1Oad7EATcK8YxRVWOWaK6RhrzcvKGT/MywLQaVULJuFbZJMoYAZ1uTUNg+z5jc/xe
         /aR09jIL9vOrZdST6UjFzGCpC1IUw/GrVvsJktvjgIKC/Pb8wAQ8EfSh7Zm/FxRuTtDI
         db1Akqcst4jTR1XjXpOzyQ6L5wdWKJ1mkhMSA2T0P6FtMHW8FPoX/mhLKyOrS/FMkFv3
         ovnSXx57kJwesxw1nhyuXoF/y3V37IcOAWQ9iPAqWpA9a/M4K2qowbDJ6+gXIuIBcibk
         yR8HxeF+kDT9hSGfIEeEvBpHzcTWTl5vRPAWmHpXRNCH//KWZRrlDFDVrUrq+efMCfqS
         Lm/g==
X-Gm-Message-State: AOJu0YzR85Ou/KQs3O3V5Gve18YOHVKOMGghJj/HpWoLyumkqnhGyy6/
	lk9Sm9l4o7ba4eRn+7/IS1scQCI83SExDJTnEY9dNMi1GGThXVgsqxBk9di6MD5IAhyckJZvdbQ
	rLrAdZnUaHMcKF1pzomdG0goel6VmdQKbNC6YHnROuRa2rCUfxSq/MDOcKOyjm8084eCA
X-Gm-Gg: AR+sD13n5VuvrW+CMMCSHuw3z5kJ//onFjR88Z8yRvzbS8zAx0eejVaYcuYG8hLYXo8
	3PPCU8KcG/sC+t9UHqPaaPA2s12Cyt6PdgXefGJYSgbbUhbpcM1sDHvIeQT0X/xNeKXPOT5/8+4
	Y+UoV8RRn0qeSgDvhSq+AnK9nAz1ZXjDOfyF5cqjsxQyFVe9TSpQWHnKybDVf9Tad5yKcJg/sOw
	wVC7lJjR+FmYT7NSu83bkJ+n8/sQubj83NEbOK9tFGUCivynXoGYSWkZkF1FsbFZNlyb7UxBAAl
	OdUgWKcgU85sdr6XrpDNZ38PKTmUy1MfXoLOO/Kcq3jLx2eelZ6UjW+fRqYkCkkJn4jDwi2BM98
	pqrz+iIL9abCOVndfDq/2KhM7q3KklspmOA==
X-Received: by 2002:a17:90a:d64d:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38e75f3c7b8mr6126666a91.7.1784560093465;
        Mon, 20 Jul 2026 08:08:13 -0700 (PDT)
X-Received: by 2002:a17:90a:d64d:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38e75f3c7b8mr6126607a91.7.1784560092842;
        Mon, 20 Jul 2026 08:08:12 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7856411a91.5.2026.07.20.08.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:08:12 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 20:37:50 +0530
Subject: [PATCH 2/3] serial: qcom-geni: Use resources helper APIs in
 runtime PM functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-reuse_common_geni_framework_helpers-v1-2-c3330ab9b982@oss.qualcomm.com>
References: <20260720-reuse_common_geni_framework_helpers-v1-0-c3330ab9b982@oss.qualcomm.com>
In-Reply-To: <20260720-reuse_common_geni_framework_helpers-v1-0-c3330ab9b982@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com,
        mukesh.savaliya@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784560081; l=4419;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=SJjTUHlMNzbHbPh8w/YzLyeDEVKL94o5fz6ILL/JKb0=;
 b=OyhGjbHRDyoNgr0J2oh/rCDVPJa4GFtpCjveUX/ghuyX3X2p7aOqFKHSPRaYsFpiRt/G6SmGP
 /5ERsA+2iEjBIn49DiaH8yixwQA/xzRuh2Ol2ZcpUE7zaTF8TpK6K7N
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfX7FEkZaOgE9sA
 IFFZCxuV2ttUQX+lZeAmpz3ospA9mZb5JXHcW4mow2iH4Chz9uLWH01A/xLfYdG0S9/MvmsaLqU
 sKHNre85cVjxeo20UqFzs0RSESLI6GU=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e39de cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sJIhbiIXeOZG86cfmoMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: SuJ14fh0It9Wg5WODHO3oTW9WkPCkGm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfXw+DSK1Bt0DpK
 sjFs43fTTC6R2d6b6tY3Q5VCxBFaGe8vUtUFxu5rL6xS6HNWPRwPdPJgQ9RX/0uKzlDAuP7/d6J
 bWRcnGEODokS1gUNC/P0vXUI1dGzJF2u7qbcmiSY7JkI0z2VY3G6HZ4vqjevuJK5yb225kB+qKn
 5ECE+JNll6ENwyMeVRN3SrrsSw3vyDaqE1XsiEer7vThuOkxyO07f9ag6iVfij3stGDsbCRd/cy
 ZIySldGY+QRj+C4UFMwTD3IrOrLjZb/Qp7tV+RjhfRs86v33G84cWLKfvTq+LBbQ+oo/pfiAsUI
 mHBC7eqorJP0jY5bRHUdr+sFsTVafDK3Ys9j18svRH+duJIrL+sulCbBV9AAEzj/u/HZNOUd7E2
 AxkHyQBxncwlVfru358AIneee6MvL8uMgVBXDgdjtCFgL4Pur6L4+ZhTWh3FpHG5V5bbKph04ng
 OVNpslJTiA4gVjJXo3w==
X-Proofpoint-GUID: SuJ14fh0It9Wg5WODHO3oTW9WkPCkGm5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200167

To manage GENI serial engine resources during runtime power
management, drivers currently need to call functions for ICC, clock,
and SE resource operations in both suspend and resume paths, resulting
in code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 72 +++++++++--------------------------
 1 file changed, 18 insertions(+), 54 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 4f34eef15598..17735c940541 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -115,7 +115,8 @@ struct qcom_geni_device_data {
 	enum geni_se_xfer_mode mode;
 	int (*resources_init)(struct geni_se *se);
 	int (*set_rate)(struct uart_port *uport, unsigned int baud);
-	int (*power_state)(struct uart_port *uport, bool state);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
 };
 
 struct qcom_geni_private_data {
@@ -1658,47 +1659,6 @@ static struct uart_driver qcom_geni_uart_driver = {
 	.nr = CONFIG_SERIAL_QCOM_GENI_UART_PORTS,
 };
 
-static int geni_serial_resources_on(struct uart_port *uport)
-{
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
-	int ret;
-
-	ret = geni_icc_enable(&port->se);
-	if (ret)
-		return ret;
-
-	ret = geni_se_resources_on(&port->se);
-	if (ret) {
-		geni_icc_disable(&port->se);
-		return ret;
-	}
-
-	if (port->clk_rate)
-		dev_pm_opp_set_rate(uport->dev, port->clk_rate);
-
-	return 0;
-}
-
-static int geni_serial_resources_off(struct uart_port *uport)
-{
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
-	int ret;
-
-	dev_pm_opp_set_rate(uport->dev, 0);
-	ret = geni_se_resources_off(&port->se);
-	if (ret)
-		return ret;
-
-	geni_icc_disable(&port->se);
-
-	return 0;
-}
-
-static int geni_serial_resource_state(struct uart_port *uport, bool power_on)
-{
-	return power_on ? geni_serial_resources_on(uport) : geni_serial_resources_off(uport);
-}
-
 static void qcom_geni_serial_pm(struct uart_port *uport,
 		unsigned int new_state, unsigned int old_state)
 {
@@ -1964,25 +1924,27 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
-	struct uart_port *uport = &port->uport;
-	int ret = 0;
 
-	if (port->dev_data->power_state)
-		ret = port->dev_data->power_state(uport, false);
-
-	return ret;
+	return port->dev_data->power_off ?
+	       port->dev_data->power_off(&port->se) : 0;
 }
 
 static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
-	int ret = 0;
+	int ret;
+
+	if (port->dev_data->power_on) {
+		ret = port->dev_data->power_on(&port->se);
+		if (ret)
+			return ret;
+	}
 
-	if (port->dev_data->power_state)
-		ret = port->dev_data->power_state(uport, true);
+	if (port->se.has_opp && port->clk_rate)
+		return dev_pm_opp_set_rate(uport->dev, port->clk_rate);
 
-	return ret;
+	return 0;
 }
 
 static int qcom_geni_serial_suspend(struct device *dev)
@@ -2040,7 +2002,8 @@ static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_resources_init,
 	.set_rate = geni_serial_set_rate,
-	.power_state = geni_serial_resource_state,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
@@ -2056,7 +2019,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_resources_init,
 	.set_rate = geni_serial_set_rate,
-	.power_state = geni_serial_resource_state,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {

-- 
2.34.1

