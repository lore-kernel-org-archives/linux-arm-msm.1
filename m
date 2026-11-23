Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430870;
	b=vYmGWbaNEvs1A+uWnrkOMXmh+am2yqIwANyjpbZdDcVM/5R/9u9SOeDxrvojmwTeKipw
	 7kBsDyWR0ZNIl6n3bzAQcmlauODbtOPXH65lM/KiA8Tet7AWLxFISW47s885dI2yAAq6t
	 rOgO897eJPHVq1xk9Pk1s87IQV79kt7k2jp8YRZQkzVloQykvATxla2PAMrvuyInPpIVp
	 Ai+/VA3Ny6fG8rW9jkXfMFdZXSGJRY/0QrBHqEHWTFzqMDaykTivU7tg/FNOGU1jFUILU
	 2U7enWtqWdmuf03OxtkLz88QBoVvMLtmSPr2TjsZ/2ZeDnm7+O0u4xAnzHOn9psWW7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
	b=f48Qou82kbXrFf8y19uePojmKLWuYCBdSNLPDDdU0QtyogAaeYhjbOhLilB8qD6YZlht
	 CwpUydu2Dm5RmfDz7uKkUanLvxU1UeSpI3H1a7gOAHiG6s+U4H4U+wZ4HWJso0/FpAVPw
	 8d8/+DGRMmNQLxmco75eydYIfsok4a2Q/L+r74ZPM+Lb33lvFfXiWNBr27dAfan1FrBaY
	 c8n80NJDG0vhJxtLZ0n+5gEgTkZfL28v3DtsDU4APC7/QL9AOUxl2DCLKuQlt7sE3DZh5
	 2XO4WLe8dybFOEZtyNz429dNrJqHNMDLsYToR36sm2JbHA21+vDrp4/bjgJwQdHA8Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ly9Q+0CR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K/Lf1EU8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28617606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28617606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ly9Q+0CR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/Lf1EU8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G6mX4095702
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pLDtqrroGwv
	OI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=; b=Ly9Q+0CR8Ggwndo3fOEmB9/BA6D
	8AwsQ4j479LV+4erEoWm4CykwVJDXMHnHjkugQFWalTMG+Jx/uY1BURVDe+aKFFl
	UQqQcpXcLPEPCLCwDS0Tehh1G5bV/29YXn9f8GqfEaQCifv4yyw0BkyZ+JPYlhuq
	nFcsJLJLJns1JAesbqxv5BOVZ01Mjzzqyf+ajVVUDhLa6ZN9gY6ixnGLxE2dUbCu
	uYfx/FCWeY4JmpLHAeuZmjzSf3Et60FeUfzvJbdrBuZ9qCJq1ubeDzil+ct03g37
	dtZbVQyuu6MWKAeEfvx9Xc12TbRnDGbmmNYoGlBeiZystJ/lRoW0GzzmKeg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7410he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:47:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b7614e9762so2202837b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430868; x=1796035668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
        b=K/Lf1EU89tt1abEp7rmYm2hmd1KyWknJeNMnsgvH+D4AbEd+l0PtGlnmsmDgv3rape
         /MkASRvxZ2OUAV7UEoPwOAYpPD36vlmd74USdGwBYbq4f7/BaWfn9zNyWNCFgABYRbpd
         yb0CMZBuIq1+6b+cNBQhPUBBfZTMUDO9cXnEjWzFYaPAuwAcbHewXnKDzHDfpHtKqHFy
         +/jSiN3QUGKOZc9J7R0H52wHlHgE9BHUFhYGaMeJy7rZbjUnQ7vceCU0JclMGfH14R6B
         4qIMZtrEyzBi55LaFL7XORHI8v6lS6awYUWoS00+kMplFr/k6kKb1qmh4K/oUH/ddUJ6
         xF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430868; x=1796035668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
        b=hHbPtfzt7UZVWortB4g/7DL6sJMBoLzIdDALOnGmmV/Pca4qAJwZgnMJFohQvIKv8K
         74DrqSAoyCJ0G2UVtJpyAxR0hyMWlVZnmr2k/srD8RgtVRbl8fdEsQvzogbopJfRTYMW
         R7c1365pQf5UrY5/dvRG/lIuQqd11aL+sRVzrREOTbkPL3iToatcodx+587t9MKSApoh
         hRAPc1Yd1q3gYT5Wzyy4tmY1kEC930vvX+Db0nQvAF1mxjQu/Dtrt4ijefXrHlnhYmwk
         oyvWxl6aJ0apDeFXYgO5UiLu21xzobsgZGg3D2wmHMyuMo4EXuCdTFTsTzAPllFMhIKA
         Q85A==
X-Forwarded-Encrypted: i=1; AL+hErEj0m2igoNtGAP1hCzoSsHJeCTXcYUVZ+ga1hNf4Klw3u2K3FVFHuMxn8FFMFnkmYNtx2xBoNpDS3BE6SdB@vger.kernel.org
X-Gm-Message-State: APuU4Z9DVRJ2QftQHzwDWoMF/+JTQzdakxcwxBvHZhyCPuPxGq4y6RIm
	jzqKQx98lyCcvLK9vH5Grix7T2sw9lj1bz4B2mQugKBaMaRgJJQ0QvHpzNqDYFq5a1K+KEWGAxk
	qEkHZ/NAnZJADZT9IVGwQYMOfxgI7mDbewO549R/eqfQqJOClIiv8igZ9Y32KVcwvRAii
X-Gm-Gg: AZFdTZcfF3uR9AidRWClXcjZXoTcaKoxTSkH85N1ZNIhE00l+MYh1iklsaf+R6esCpM
	mV5TcsomksG96rxquF4BThIpYFmUNfGmMVMiqfpzW5Kqmx893w4WPc4SPymeuDddvkR9r9/zuzc
	YuLcS+Zk2n88b1ugZLmKWqxrKbKRO0/KpGj8NI3+IjEzzRFwuHZhAuJjG8jdzaAlkVyB+7/Jf9K
	X81WjuIbT6Dpu25Xz0QEFVOPD2Pk1y48jKX8CBbePFm1rYYbOvqvHTEp/U33ePnlcO5HPrFycN/
	BzQAEb7xmc/YRx3UH4vmNrwtjQ97KmyLHp9hxGeGCVlCSETn3GL3gSnYX2phZiYJAksT1CJwp97
	1wYWautKm0sm4JOLNmCMZJOf5eLhxht9bSC0E6Vs4dFmHM9t9F7CN1SyV4aVJrJAYbmVoT9V+w0
	165Kwcbw==
X-Received: by 2002:a05:6a00:2da7:b0:898:e7e7:c0df with SMTP id d2e1a72fcca58-8c87cf2ad15mr8625597b3a.45.1795430868090;
        Mon, 23 Nov 2026 02:47:48 -0800 (PST)
X-Received: by 2002:a05:6a00:2da7:b0:898:e7e7:c0df with SMTP id d2e1a72fcca58-8c87cf2ad15mr8625582b3a.45.1795430867614;
        Mon, 23 Nov 2026 02:47:47 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:47 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 02/11] usb: dwc3: qcom: Disarm wakeup IRQs on system suspend without wakeup
Date: Mon, 23 Nov 2026 16:17:17 +0530
Message-Id: <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4vk2jpaZpZlpKM8Bd4heY_UeSVkwsw3F
X-Proofpoint-ORIG-GUID: 4vk2jpaZpZlpKM8Bd4heY_UeSVkwsw3F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX6AjjJX5zkvIm
 z56GixBf5CaJqHyLXsqWQjz23p7PuuPuSN2WmFMSE40lRT0FPO0iILayBuB6RGZJBQXfOOxEj8m
 4DCDf2lTm7rXM0JO/3BGOU5sa5JnB9U=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0419d5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=f_oCHbJux9u68P6T8RIA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXyHrbOm4BkUop
 kJCQsKUlcoz4kcXIub0TwIGrbVZDuqWTgxq2XCN5XLkXV3deonvuRhnS0xbaw7oVlmFiNR2rRq3
 wnCt7edVUuC6fmw9mfYaCvVb4oxkclmGmE3TZdELR+GaziA2GdJptQKStdvoQRA1/OZbNuY0ygU
 2XMJ0pGwzAMjhWGEn4E5yZc6Gufk6FUK/f6g0pXE4vjD2feBoFoLIVx+Ul0lCp/OWrY+XtO95x2
 GtfD1PiQmcdd1Lya1eTtI5am7m/hJuSeRer916EDUDvJk8weC9gHgI0OElBsZXo67apDSxCDkLf
 oFIhHNeTXdJ7UZF9x+u1lxzvo9fu0IfBss6wxluRHxtJ6lTIR1hvY0aLddWgz+7J6V6IbC9tJ/f
 ZebhvFoyniKEasFPjAiA3/utPxPDgbYnud8htleezj4rOOYX828Kx5m7nKBMEYn/X6wRXO0Dqh9
 2R8XvKdHPDygLOKP1/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

Runtime suspend always arms the wakeup interrupts in host mode, even if
the device is not wakeup capable. If the controller is still runtime
suspended when system suspend runs without wakeup enabled, the
interrupts stay armed as wakeup sources, so they can still wake the
system. System resume does not disarm them either, as it only does so
when wakeup is enabled, so they remain armed after resume and the next
runtime suspend arms them a second time.

Disarm them in system suspend when the controller is already runtime
suspended and wakeup is not enabled, so the state matches what a system
suspend without a preceding runtime suspend would have left.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 7a7225b900b3..18db19cf2065 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -350,8 +350,16 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 	u32 val;
 	int i, ret;
 
-	if (qcom->is_suspended)
+	if (qcom->is_suspended) {
+		/*
+		 * Runtime suspend arms the wakeup interrupts in host mode
+		 * regardless of the device wakeup setting. If system suspend
+		 * runs without wakeup, disarm them here, as resume will not.
+		 */
+		if (dwc3_qcom_is_host(qcom) && !wakeup)
+			dwc3_qcom_disable_interrupts(qcom);
 		return 0;
+	}
 
 	for (i = 0; i < qcom->num_ports; i++) {
 		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
-- 
2.34.1

