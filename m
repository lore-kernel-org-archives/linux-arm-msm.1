Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DF7407CCC
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568324; cv=none; b=frui5WOaT8vcP+o8VXj7m+WMe9xF6iQEGg6bn8ijNRA8NLDclwqH73GP8nlOgepEMyT+scx5Xr6Asaw8SN8qnwv/RIztIGekN3Q5WHm1GyKj0iN+RYlIO8cZy0Pb2dCtROmgJ89qzQD9gTCwrUj/5zVcM0QikOJ5Zj0G2SdmcXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568324; c=relaxed/simple;
	bh=fvLJEoTbG7x7YjEzxCfSesZ/Qr9wwF7rbtjWeVqSHYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qfDidevAgRHq1BQ798dSNZh4gg7Y57Okh5XT65rDgdWcI9skXqNkbCcLEMWlm0kZj7hrJ6XTauvd3uUUZJerVk33Jes6I9I6xTIvJZLmSRc2CnYbJyszR7DKiSEtJH3US8+LajAVraNGXp9LkgWKi7Lps3ccf6KktAcfK78ov7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+6kORRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvuRXIgf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+6kORRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvuRXIgf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O997DR2547757
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+LIBYtIL0v8CM9/T+oWSwU
	EA64rVmEdJGaHGlR+XkR0=; b=K+6kORRUZFoLc2OhB0ZzgaV8qWxMuUbj0koF7h
	iasnGY4Yhtyh/3zOqlsqn13PR96TvGezGxhdwSM9zSG2mmKIRBT1hGssfPqwbspw
	N5V4271BLGGm3G8C8Qh55PC1EWPwolEZiF6lvAcJW/+7MYW7MEQT+pFJZ4EonOVK
	AUvZpRlpMI2IghSPtRrIOT01eQ21FhoRF+EtCJzh0XsWaR5v3xPxWFqe3vgc6Iyo
	Q4xxup6VLgLjKfim0eY0EmVBFDSrZfGqQx69vJsUI91O79tgvSjddD0JzFE9GJ11
	TIHN6RZQXpvUGxP9rR46qNVqs1622iN9pxv9DtiT3dB8vyog==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7j95e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:45:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486c3411c8so4340292b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 03:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787568321; x=1788173121; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+LIBYtIL0v8CM9/T+oWSwUEA64rVmEdJGaHGlR+XkR0=;
        b=SvuRXIgf6KYcyza7kuyrwSQ3e8y6p9z7AYDeb4lC/7Ryl18c0t8NTqeX0Jlbq/ebFS
         ch48WX/RCdok+tPKpBGm6bUmqL3FjzRDxUgHqXgm2jnncG+zPtF3lhCNw5eAH0zCQMPx
         M33xvIpuiijEsvJQwZP/g1SRtFF80jxLO1Qbnwj1qwsZ44sXOIASXd77ke99v3KjLMOg
         6kefsRciUv+FyT6VMWvTKw+/vbpUfhjCVd3cVzXE+y99CVaVt7gNbvX+J9qDaYlt76kR
         JSodQRjCzo4pcL0PgZBc2fNN46FVaLfzLSdCdmOdjniHM0F0ygEijzm4qJ889opiDnEE
         lnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787568321; x=1788173121;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+LIBYtIL0v8CM9/T+oWSwUEA64rVmEdJGaHGlR+XkR0=;
        b=IEnfTq2VSS8F3B5sqg+0UGUFkU+TpeoTXbMKpxFmIi3R+A9sjkkab/JS4s5cpotN1Q
         6dHruvQTVv4VLW6DBLrUCEyUd31uC2lkzZ1t1hPG8rK3qgKZNrIHCd4wRhnylChKikeC
         AJlcyvffvmKP2wbtgGxWC/pCrUQTjKfZrLHQZLZxIORr3Y/NUiZLO/eIIewMiefunR23
         jCe2ewRQrcsWZrdVsO7X+4hvqjxOIkJEuMHt0W9gvIewZE+wWd6LGE6cvVi+lki+cgjC
         K2pEs78Su2uo2gOwjnnwA6EklXfzVJJLk1Jk3zs5KHkb7D8w1JHrdTPl7xtlzea+ZUHE
         T2MQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfqDiLbajqJHZpnm32DU27iF+PbLtAv4ZgN4QP8mP6eDsGHDJxOPbv2w5/bEPD8FAgcgR3j84p5XIdy0/H@vger.kernel.org
X-Gm-Message-State: AFuF++lbOX1w/qGP+TV7af/6lPwzcTMF7MPC1kvoKhZI7ND7E2ggnrOB
	iprqTGbME3mVzsaXVuWj+AVj9tX9k+G2TsFYEE4SKPkEFfp9M8OeC8ZsFQgBIpF875ZouvriwOm
	H6P2P2HdkF/lQPyNVMUvhNgPZ2SUbhrwd6EzKl5pxfVUtlv/aNi44F37lqBVrMe203gRu
X-Gm-Gg: AR+sD11IFykSFiTfpawo7Cy1MdfyJ1W/hd3YitRKVm2tjxPjCR9eZw68zlFvHpBiyW4
	oRDLQkuoDyWPObDzknY4EEifM31+ivdbyL6S8Lq3hcuGIA6kNOmADHqXISB0EkhZspECMsApgKz
	KJ8kMp+FnWemrZIypGVK/RZdQyiExZogYOZThj231Ef1hE6B+bt1ULePWnrqtdPhjc1+qipcwku
	KPh1kX0zaW7YfGIczO0W03hRGqP/53OfHfqLW8gaBYy6RRKS3CAHdkiWKA4gAEl8uyRbdxiYRcG
	dTguv2EwIwHJPoK6HFAhu7bnXfz5v9legCAj8PNmPqtyqbI8ccO+SPl+0GraAELXpKOFjOdG3Su
	qhXm/Nx4iDLA6FeH9dwRa6a8+cVmdWZnblQ==
X-Received: by 2002:a05:6a00:bd03:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-8520ba55d99mr27055418b3a.14.1787568321140;
        Mon, 24 Aug 2026 03:45:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd03:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-8520ba55d99mr27055338b3a.14.1787568320609;
        Mon, 24 Aug 2026 03:45:20 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f1638aesm1779459b3a.57.2026.08.24.03.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:45:20 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:15:14 +0530
Subject: [PATCH] serial: qcom-geni: Drop unsafe rx_buf realloc from
 setup_fifos()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-drop-unsafe-rx-buf-realloc-from-setup-fifos-v1-1-52d231c840e1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALkgjGoC/yXNTQrCMBBA4auUWTsQg0rxKuIiPzMaqUmYaUqh9
 O5GXX6b9zZQkkQK12EDoSVpKrnjeBggPF1+EKbYDdbYixmtxSilYsvqmFBW9I1RyE1TCchS3qg
 0t4qcuChaP1ryJvhzPEEvViFO6+92u/+tzb8ozN8F7PsHmN9vlY8AAAA=
X-Change-ID: 20260822-drop-unsafe-rx-buf-realloc-from-setup-fifos-2b82eb0cb5d4
To: konrad.dybcio@oss.qualcomm.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Praveen Talari <ptalari@qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787568317; l=2427;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=fvLJEoTbG7x7YjEzxCfSesZ/Qr9wwF7rbtjWeVqSHYU=;
 b=5XZD6uUJOIi3z1M8HI842tmUvtNy4D+t2KQqUFSzPdF9Fkyv27L9pSBaoWU+tv15qij473Lm3
 nEIaAw39qjwAp7wnhcboynvBUetj7nF9bNzBWuXounf8hMj2ZBJlUNc
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c20c1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rO80i1saf4kzB67oEq4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4OSBTYWx0ZWRfX5ielR1IIFOYx
 I1oA11ijFH9yakmFjo4wyw8d6OX1LtXzIAb9tCidQI1FjH/ISQxOPKFRhk2fc2W3tPBY99YyWMV
 jfecqGMA2CMBL3kmX1dRhwRR3IKc4Lg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4OSBTYWx0ZWRfX1rWHQwS/9PgL
 cylohRhR0P+S+lShWmqXipaEEVhGNP+71/13yBMw21nX08Sss3dERxIMuzufNy+e+qTnhfSdYsm
 kl6f+LA0ZQ9iIExT9pgnZq72cMfOHz1QhHArwdlSvHpBqQ0uSyY5ByS6pXI3vexVqAwggjUL0dM
 afj4kXikihDgp2WCY/lhdt8sH16m/D9KaqkCdynPWM2lJ86oGfK2UX2xMtYuuwoYX5NUrW5m82g
 cClCF4s+OYBKCoOXvt8WWTjiG4SAPwZ/9Kz0TSrqSgmOp8IT21dy1Fq6ckNgTbsr/7fyrc3Zraz
 ix0rMbW0Vh2al5XAqvBzc00n8kKgeRhFnv4pkpDPP32j+kjtFKURUjuLU1TlLqZn0e8eyg+49t4
 f4+M6lWDuPv7lj5d8UPQzoR/NqOxH1HpXLJi4OF8M+AizEzm6L1BoR2kNX377BCkDX9++F36JNz
 ZtVUdcd98mb05ECVQHg==
X-Proofpoint-ORIG-GUID: a54CxoPYXVAixsobJbrJcROqcw1cRf0k
X-Proofpoint-GUID: a54CxoPYXVAixsobJbrJcROqcw1cRf0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240089

The RX buffer is allocated once during probe using a fixed DMA_RX_BUF_SIZE
and is DMA-mapped for the lifetime of the port. However, setup_fifos()
attempts to reallocate rx_buf whenever the reported RX FIFO depth changes.
Since the DMA mapping is not re-established after reallocation, the buffer
pointer may change while the DMA engine continues using the stale DMA
address. This can result in RX DMA targeting memory that no longer
corresponds to the active buffer, leading to invalid DMA accesses and
potential memory corruption.

The RX FIFO depth is unrelated to the size of rx_buf. The buffer is
allocated independently using DMA_RX_BUF_SIZE and all RX DMA paths consume
it at that fixed size. As such, resizing the buffer based on FIFO depth
changes provides no functional benefit.

Signed-off-by: Praveen Talari <ptalari@qualcomm.com>
---
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..75b2e0b77d05 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1291,7 +1291,6 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 static int setup_fifos(struct qcom_geni_serial_port *port)
 {
 	struct uart_port *uport;
-	u32 old_rx_fifo_depth = port->rx_fifo_depth;
 
 	uport = &port->uport;
 	port->tx_fifo_depth = geni_se_get_tx_fifo_depth(&port->se);
@@ -1300,19 +1299,6 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
 	uport->fifosize =
 		(port->tx_fifo_depth * port->tx_fifo_width) / BITS_PER_BYTE;
 
-	if (port->rx_buf && (old_rx_fifo_depth != port->rx_fifo_depth) && port->rx_fifo_depth) {
-		/*
-		 * Use krealloc rather than krealloc_array because rx_buf is
-		 * accessed as 1 byte entries as well as 4 byte entries so it's
-		 * not necessarily an array.
-		 */
-		port->rx_buf = devm_krealloc(uport->dev, port->rx_buf,
-					     port->rx_fifo_depth * sizeof(u32),
-					     GFP_KERNEL);
-		if (!port->rx_buf)
-			return -ENOMEM;
-	}
-
 	return 0;
 }
 

---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260822-drop-unsafe-rx-buf-realloc-from-setup-fifos-2b82eb0cb5d4

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

