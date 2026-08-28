Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD8240F749
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915653; cv=none; b=Jm01XT2uWGawS+3yD7qMec4basiFeCLePHqPVhhN90lUqRZHij9LTQBPfcFDD7lUTZM67xVUyN4L0L5R2YLyia9ipONvyoOXtFfh3JqINYEBjKiNJs/NnAD8nBhY6LudnP3QUVBEdVU+7UBDVChFfERyVxLei/Nmp5oCN5iBFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915653; c=relaxed/simple;
	bh=x+iLPxSxz/4dz/phQxlkbvpBWoeB/hI/TAcfJpKaygk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Sayfd6swOS3+G8aprfkKhViAJSCQENQmBH8tvr3lhJziRRfJEte7S0PeOuyXo+lEw58z+IVUdIxBT5Vgng5yXvGeJYVqp2QD+eYsM3AmJTuDzR21IUz2TwSjPDlm/DlbTkqJchBA984GdGuSRgCRLd/w8x6sMApxdVCVC7VqxRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TflBbp9h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBDCsML8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TflBbp9h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBDCsML8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7kUw3306371
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WIBvrWmy2BOm4AoI0nXroK
	GVyOJUm/0pcRzlfNy+yzw=; b=TflBbp9huvEDVAqatSXEiwCMLO3kwGRqES4v7R
	StBDPPexKaUQXjzAqq9U0ZNTdOmg+sq6ElZHxRphKj0GH8ba1Q1dKAHSsOVDgzks
	S+ghGKyvPnPI+gU7SiKvEkpKHLDQ6AWUmVCjpS7EPSi7tb8ykEv2AFGjV5ySobyK
	7TKB4EsARfE9RaRoONRaYqE0rEt859F/aNR5ygs2cV8U2Oqni+O29vUUrezMUiYh
	ttPixIXj1SFYL0swIqB3MuNkiL7d32VKeIkmBuscQLb0jOzHX8ztB+3ymrJUYM/N
	809AqGANq97Tqbl8pY93+QyHbyXuTvmHvPWuw3rikVjO58Kg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42p9avr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:14:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so1542242a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 04:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787915651; x=1788520451; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WIBvrWmy2BOm4AoI0nXroKGVyOJUm/0pcRzlfNy+yzw=;
        b=FBDCsML81bkkclWoEFSgFymIZ/RLnfSU4fdUBJAggSGCxy/ZtEZf9VuDIsM135bBTw
         z0nckeLXKaaB6x77wH5JVc+3lINDZnbunelLjFKw4n6UgMOmB0P/ttQ69cGShkxfYdiW
         VUU74FDIhWT6KR7zSyTlWrooS55XwFvHqwhCYSbtVv4AAfOnjTPCoyw2TO3vPf8iGEjh
         m7qSVXb0zIMybJTHhfcYxAHmQ/Qzr9qkqKahxHEFXYjYM3kvv0Z3TGqutRLJpa/L3+gB
         na73GvNdtDkQUOq6/kfKiqFGaM1RyccXJvDgSyl4Dr2OJovc2KWae/taTcEonXCGsAE1
         JEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787915651; x=1788520451;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WIBvrWmy2BOm4AoI0nXroKGVyOJUm/0pcRzlfNy+yzw=;
        b=CW5E/fP3zonZ6aJjxu6OHxTKCjNbBD9l1V9zxnTcvb0gAZ7DJ8sruVllv0AWR2WezC
         1pPz5HhiV5kdu4M1UUxjYtVtxcHU5jInpYdaPn+dvGmu7xKpOWtrvAtqw/PrFkE/WqTO
         Uu9oszbS3WOgc5aO+p+uaN7TYq15UPdaXU43KrJD+8mqhNxpVJ9pwMNq9ajsv/QA1RR7
         GAUhjbP7MFi+M4IblPIxbAiT8BFbfa+TzjT7bm2rG/VvkRoaONhb0l8bmhNNcjQHgqbw
         zXw6AZ9yI7AgzX+66BAZNPfOjgaU0DqZTF+tzXh5WuJC1afnjaXyMwNatQOmoB5Tv+hS
         gnVQ==
X-Gm-Message-State: AFuF++kLyC032l+e4c6SVDwFx37dwn9ypjGIeoH/ayloqrQ3shAoSjRm
	gHEl9j9xvIbKpCY+OaWk3qvulmq77NiNxD7wg1/SRbqZHo7D1pX+9bS979C16Z4kAOMA5r7IJZa
	wRErpphwgBZ6Gz2zkL4zgEV9WsUO76D7LkJma5KwRmxjq8KFztcCa/NBqwKXW1MfAydxn
X-Gm-Gg: AR+sD12hTB0MABE2AciZh+iSkLgDLbIR2pfP5SbsYnTl+Ksf9T4IwEnGQHH5w4BotAc
	kktD4z+eamUh7F+OhttNKT5EaRDZb0kxHr4I4qqDulv9nCLgePeWpySu1tW4lVWrmgWCuTcxP/E
	VpD9BRr/OholOi/+PIRlR5WOfihsw0FLJM0UT3oG8oymVIPrsdrzfgq+yLqzrf5juQK6k/L7JCX
	bxn+Cugkb/ezwSEafJDvT1sOZlD5dio3YPCXWlj4gtOTMu/shKzwTdpbX2ea/gDFmffuNR4Ovio
	iVWiTot/Kl8UtIzbkuOPBwN3tVxi4c0+iKwuxyZl9zpyLtP8hfTqkCDkgmh3y04PHsHsJGEfory
	p0QFkWE8tTnLg8baK1NYqjMCxHJ0U2ZM6EgI=
X-Received: by 2002:a17:90b:2e48:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-396d0feda32mr11941889a91.15.1787915645981;
        Fri, 28 Aug 2026 04:14:05 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-396d0feda32mr11941782a91.15.1787915645493;
        Fri, 28 Aug 2026 04:14:05 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f99585csm4470475eec.21.2026.08.28.04.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 04:14:05 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:44:00 +0530
Subject: [PATCH v1] serial: qcom-geni: Fix port_ida handling for console
 and probe errors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-master-v1-1-1f8afa5f82c2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHdtkWoC/yWM3QpFQBRGX0Xf9ZkaQxpeRedisLGVn2YjJe9uc
 LlWq3VCyDMJiuiEp52F5ylA/ItQ927qSHETGEabTFtj1ehkJa8SsjqrXJLmpkGIF08tH++oxB7
 j/znZqoHq9Tngum5V3hVObgAAAA==
X-Change-ID: 20260828-master-3e806ba3492d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787915642; l=2062;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=x+iLPxSxz/4dz/phQxlkbvpBWoeB/hI/TAcfJpKaygk=;
 b=l7McKXL3kWYdep3cqPWgXqVW4mDDzQjkGdLTSUBajRJRky9ly0fkrSdf0jrUhSDYZxkG+xqlZ
 hmnBdbwXQWuCC6Uy7bikIxHThAARl+GtoUeCDHElU93uto/RmXPpy56
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-ORIG-GUID: YHIjJ7jI95aB8aiVeF2zTobV5ZGTML0e
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a916d83 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=W6L3oTFDJPfymd7k00EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: YHIjJ7jI95aB8aiVeF2zTobV5ZGTML0e
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA5NiBTYWx0ZWRfX60wEzvfvel65
 BItkg/GTwBXjbw+RaIcRrAAhWShyHxDxoVjqx55jeTVyb6mv/v/qLNYlcglUZ8Mt2NmLyDbB+j6
 jXBf+teXd70hpkCFvTISZvRP2X1qglg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA5NiBTYWx0ZWRfX8PyGB/M2nVr2
 IzGEliuYtsahH2YZsGuAGuRowAUPSBPwU9rmroeozjy0j0z8Wy4tpH/SJuPTWw5E2JHAVNjU069
 a/Y5RutH9CsxTuAb8g2bAbWT9o5jwgKZF01BDC8iRLXKOBSYMfnW8TPB5sv8EztMNuiiQtjgyAd
 rqBg8lt4+zaoh2GIcEWAjaQpUBfX+4z/p7lpZanNVNjJt1sJ94tm1u4g5gnNZlOPh2CVPoc8UEq
 4tC3iv0IhJ/DEWaQEDtHNFe30ymBC3Ed/McjfZ+LuL/xBPiZ4B5/jY/30eVtWBpLU393CHUZOS0
 KfKuyYlFpnoAvdMIEJLmmqIe8Ys0uXvNx2n0o0mC9EzGPMIs/T79Nse4H8UaMuuIhajAB6TRedE
 dtCTRoHJZAxlsFv2/UJNh9CQUvEcNhbxZ1PwfR9NEC5GD2ciWTcj1NAd5frCDbgC3B5mkoDRqxy
 d+ZrFTnnbsTHFmDwfkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280096

The console port uses a fixed line number and is not allocated from
port_ida. However, qcom_geni_serial_remove() unconditionally frees the
line number for all ports, including the console port.

Skip ida_free() for console ports so that only IDs allocated from
port_ida are returned.

Also release allocated IDs from the common probe error path. Currently,
IDs are freed only on the wake-IRQ failure path, causing leaks when
probe fails after a successful allocation. Move the ida_free() call to
the common error path and guard it for console ports.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..3bfe597d2c83 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1979,7 +1979,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 						port->wakeup_irq);
 		if (ret) {
 			device_init_wakeup(&pdev->dev, false);
-			ida_free(&port_ida, uport->line);
 			goto error;
 		}
 	}
@@ -2003,6 +2002,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	return 0;
 
 error:
+	if (!data->console)
+		ida_free(&port_ida, uport->line);
 	if (port->rx_dma_addr) {
 		dma_unmap_single(pdev->dev.parent, port->rx_dma_addr,
 				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
@@ -2024,7 +2025,8 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	irq_work_sync(&port->tx_kick);
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-	ida_free(&port_ida, uport->line);
+	if (!port->dev_data->console)
+		ida_free(&port_ida, uport->line);
 	uart_remove_one_port(drv, &port->uport);
 
 	if (port->rx_dma_addr) {

---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260828-master-3e806ba3492d

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

