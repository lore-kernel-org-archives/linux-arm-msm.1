Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595887;
	b=nRYcnHwfEoYnxF9atWIPq+Tmds2ROZFP6H6X4EauunqjXI6pDUHpGTsZUhzcQmGcSdgK
	 YQNJ+a9WbWERSbHOA8PzOWHexkC1aYYBemvaZHXZsOl8uoNoSAQgTeCpL2F49nA7SXYPt
	 xDwTRrZhWcR+Y65SNcolfz2XmA+l8b/ApoO3t2j1x1is2m4xC15hpkXx0MNRrgVrA0vLw
	 kqQxJFzUPbtYB8bEbdrYhKZWJeADAv3IL2/j/k8Ny7BTEYxr7/Q//9/rN+K2w2AGLK2bA
	 3EPP+44U59pp6U1YvaQy85AXKeizh94Izb5cT8tm4sx97RgEN2+8QAu/FPKB39909/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=;
	b=Pua1IlZtMKxY+E6eZu3xEisiWkZhor9OdqenR6sIJUVOGB5ADg3kGlWVM3yV2Ap7ffOt
	 YE8O4ux1hSbSgUu5fJzQtEh0CvGlQc9m4bYZRMii6KbaDWEq1DaEzDQCl4W4pkb6xtxje
	 ptwzZBndYF+paEkSd/lptaRIGbfZKvazJvormpovnfRzDPniPM0KQUgZcmpZ7sJ0nhAU7
	 8FMdJKDyYaNfZRjC9XRVaYKC1Shu57zN7ccePG3d6H3eEzomtgk3cK31wRtf9GZi07oru
	 593UVSx9KCDD6P0UPrppHpKTrtCshqNA/HeHYdrc3dV64iomlGeX/D6qjmrKv/yGUKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juMBFt5f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGaZpRcq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420D5606A33C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 420D5606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juMBFt5f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGaZpRcq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFmJ4518667
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=; b=juMBFt5fQg6G/ln9
	RkrfhmZCpWEYfGry4aXOj4/+pMiGw6UMNV/pX+x7BdIxsXxxbIZOyKvzH4/HT12z
	zFcBgJpDibSmsig15qm7ZJyPW0jtPmIJ1ZW4Y29pWbPHHrQusT4ViQTTSlOa7BNs
	JDSkcPiMEBa2DhxDA6WAes9SwVwQ24l9XGAW24OeqKH0xVXI0e4l8OzNzgn+YHz2
	EJLtDt4yQO+2PIU+rZVNpc5PnDjyfiOsAK7LlfllYuIFahPPL5XkSvLT42lQcAoN
	DVKH0drXCZPCOwEUfLATZUB+rVeylG2f57P0W4GkJg8gdEM/LsSS5QTjTK9dGr++
	7f1DQA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vrhjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:18:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1386189eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595884; x=1793200684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=;
        b=PGaZpRcqXf7bOVk5TZ33pEkFOXall/9cwrFmO0XTbzvP0A/R8QToeaq2AURw1GnatG
         yZxTvj6WcTPwL4k+OPRUStQyssbWY7u0yNgT/lFLqigvm2pmhquZ81PdgA5rg4CnvdgU
         DqG6XjL4tBwxiwiLqkCYPdacFkCjDj2Nx/aARlxnl1zF7cEm021+zMHje4OfNEcplKHS
         g1QAEybT+B0OOL3XtMBZjfnzxdeBxbEZVncj06WzZDrxiAy6M7uLpWd9m4lnZzYksCzT
         7CK5ntfrVxSW41TPOxXEG15i/n5RJqlOiuGdDtWQEPeIb4tgyaNKLlH+hO/iR55Lj20s
         FAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595884; x=1793200684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=;
        b=q2pAMWFtU8UYdodI2+xNJZM//LTDXiSUV9nFz1txTpZMEgxm+JB9hna4SJiFbvxv8s
         2IjUQ6Ck/RnzalZO/u6MqQ0EU5RCqkAs5tVyo9D2XH+EctneLnuh45/KbP2+xyYVTpQT
         1RJBaiEhtIOP61tU334MbUuf+MxBhFJRES4PUhyzQ/O2F8yCIQpHqsUq/o6csJLpftyw
         WHEc/TMf8XF44LybNGgFXbADLJ9/IH1F3YWvp7cQz2eIvCfyV5/zTfjAoNWAemV/Trl7
         YmvIUL2kdYwludkfKoTHNlwBHrH5KcR0dWL4yyvtzBXCzdxMqLjjGGaxybfmCLLmrVBl
         8bqw==
X-Gm-Message-State: AFq9FYJ40UdtQdzFM058t5isLAUMMBJUppmDWz/2jcZZ/JNljRsTcBvV
	Npxyrf41EiGESkU1ZRDugvn26nWWuUmyP1+VZjYTNj6mefh8Okh3q3lfl4I3Ic9cbGCbnD3YDip
	hnHR+hDTJFErIZNlbdkg2hr5idRssEiK7Fpbcng8ZJzzx+wxg11GnPDVRWHA39D/13771
X-Gm-Gg: AYBFou1zyZxB1cqjVh+ncT5N0Ww5SBVwnNlIAy24lcMmvgk+m2EHc5TyK5H28VyfVAe
	ZIrV3VWdd4aqYo2gb1bi2UGeH65QL3ngwQm0DvzyfdHwgN1AK6ku8UQuQqZZxTG4UkJaB1DF6+6
	W11lbBV/UCh4B3yVY2g6JP6FwBr9lwBGyPZLE4WP/ElCH+0SBZjU3A1n10SauYH7C6gLD7+o7j2
	ei9Gnwsz8ukGSHthlbBaEDiURBOP0BZFJ9f14njnCuPFZERFj27oJ95UsU4i+yXVR9LQLQBKwtu
	o4zwuaxZmBtMce7RF31ChsPJCymy91sDLQ3QWTOJSObCHjmlCI7WAVCNqxHhlLTu5AXfUWU1+ES
	PjNzopVus4z5+7BUZhdBhdkEK2aUF27Xm
X-Received: by 2002:a05:7301:d813:b0:360:f13a:ff0e with SMTP id 5a478bee46e88-3674d753a4cmr3341574eec.23.1792595884449;
        Wed, 21 Oct 2026 08:18:04 -0700 (PDT)
X-Received: by 2002:a05:7301:d813:b0:360:f13a:ff0e with SMTP id 5a478bee46e88-3674d753a4cmr3341545eec.23.1792595883840;
        Wed, 21 Oct 2026 08:18:03 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:18:03 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 20:47:29 +0530
Subject: [PATCH 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
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
Message-Id: <20261021-lyra-display-upstream-post-v1-5-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=673;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=PvJgpXbjwbKmN5hdDTOHLEi0wLguTf8dYpZBKf8nIB0=;
 b=QD7bkVOSV9SdvGpM2J2FTKAwcB/SWheGW/3C0KQYWHaSnIMXjLZrXgJmlttGvhy3Chng6xe3x
 7tOviLzTbojBgyDV6TwzXknfvvMOCGL9TJV8pOjb4Qeslv3iArQqBfr
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: IVfqbFVB1sE5ETIZYHypNvG1fnBW1HBB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX/NQXYoZ4czju
 SdQqOTSCZm8FJDQrv55gQgBsggr5F3BDei7rpuRjhD1Bf07tNSrmVaqgKqu2AFH5hySVnjx2pkb
 I3GKF2ZrOlRor/Si1NZEMoZNZ7G5CaY=
X-Proofpoint-GUID: IVfqbFVB1sE5ETIZYHypNvG1fnBW1HBB
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8d7ae cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX/j7rUtU9218z
 F8BDIU0EEqeb6kq78thNeQ62R4wlqFxaGduR3byqr+dPgPcFHFdLHPekXe+duKiwTma10cTvJ6E
 HIu3XC+znP224ysqQjAw4zASELfHSvTyo/F4Lk8YBQC2FsGDxJSFuAoBOQhYQKONuq/U0JLDqII
 DLD9MVUPNcRKzHaiRk4WuTLfESpO+UzTCDSjbzinfTPtNBxtBL1Xoj80WzYrWYjB1EO51KrXUKi
 x9sXi29G5v3FI3wZyaVNQkSaboRk/i+UOdV9VEnB9plvFpXz3I6Cbsl+tfS6UUtGG1tkCndTKVE
 cAIEiDJcvI6EDoD/JYpIeQOGhS5oECfKFMDXY8ucIwKO85qNk4IlHnJUMQSg/v3wrZ74PKI+qFJ
 9K4QHN4xhiWpGPuum9hPc1NYT3ixU6U/PsvH7E23oKOplHFPtK0Q26q3plIMlezi+/J20WsJruz
 7Kxdo4zGY5lU2DLRPxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Talos Lyra EVK LVDS panel overlay backlight.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..365a69470d13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1620,6 +1620,7 @@ CONFIG_PWM_ADP5585=m
 CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
+CONFIG_PWM_CLK=m
 CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_IMX27=m
 CONFIG_PWM_MEDIATEK=m

-- 
2.55.0

