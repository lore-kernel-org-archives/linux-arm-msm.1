Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA314779A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465165; cv=none; b=s9uFKw3AqqqPDrUkTllbQmK5pG48VYiYDBe1K3bT0VLSTLPEljL1yp7DCyj63hhyIpiv6J93dFfUPh58z7cdnPi9nry8r/gEYlarube8V/rdkkZH67CpAOIzJNy9O3wzzwd4mh58noNB0K5KpJsF093r4jcn5v6DXs6mVc9bNfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465165; c=relaxed/simple;
	bh=hzhTHbbuhlaLXp1NMcukmmnntT/l3IaAz30Dj5qvjZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRPpUX9xVoK/JXKw6HmNMdWoTWx/0JpRHZBTmYf8r89LroxQaj5jhlvkzonmZFt9vVCcy9HYbfRkBkVerTNMLcJ0SjWo6cpwymHub44wnnfkjou0n9cPr3jLqz9rqTj9A0xhA60PCVcZO9zuxfQ3XGw6pcqy7/ovsK+QUlnQXcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GA9/zt99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5jY3nrg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GA9/zt99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5jY3nrg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z2844048761
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f5Zjmw6qUFD
	CsBfmlr6XY1L1oGfIgEXoh02cSpUE4f8=; b=GA9/zt99H7aeh13ApRGUM4FGjJ2
	qUaBNUbUpwFNeASf3rYgOLSzaiFMIkOtPUXVoKv7J1V+URsnLF4T6QoC8nzVxrCg
	U7W68T6jbnw752MWatIrWAjtxyRft1XU7+XAzmztnlI2/t13HdqcSzwjQ26brU8Y
	qs9mbmgnWh3xUA9l3hsRRaY+pV4PCQ5MfDL4dvEufIXvZ+NZsVEVcPe70UGGO+6p
	eyscnjxs2D30h1VQCs0EVuNUpQ0sKmubdGUyMEsan2va8eIuhKyLggy8Mhv1qOv4
	xysNphh7+QOLubDhWtuBPthT1seuBxTYZQU09isOKGaZsFJYClvnoEKWQ2w==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea13cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:39:20 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4566537e644so6506627fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465160; x=1790069960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5Zjmw6qUFDCsBfmlr6XY1L1oGfIgEXoh02cSpUE4f8=;
        b=D5jY3nrgSgVl+6ML/jOAbkMN6DlFfJpBEob2Of8FmxTZCn8P+o3CXn3cTZv7FSQ8uU
         UA3R7KqhvUMTe4Jdx6G3xfFT+hA15nyZVPtdVmA5olyJ86w4u1z9uC4lDKOGFAq+88+I
         nmKlOfhhhclrhkmAPDw9rrOqisvKQSFNN+nH5UPtblvMTsygwosstn8VuPrbrA9g7gSo
         loN/Ey+XHVJJfX57rzorXA9gISE/s2q17mQDYs4uowPPPAYrfvdHELC41YUyYRjy47yB
         jU/nTAckqC3jYrvKg+XX2VwBMO2wvef0Z6331MvhTGesZmuyxtIvKx57Cto+cJkEQ4QD
         0TYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465160; x=1790069960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5Zjmw6qUFDCsBfmlr6XY1L1oGfIgEXoh02cSpUE4f8=;
        b=v4ygru+4B6eyo0Fj/yFm5Yt8QWm0oge8rORW2eOny/Yh/k3wPgcnlNB7/qS2llWhuJ
         SCDY3IiTdFW4J/6PrvS2Fs7jPhAaox/cbbTvs4vlmE0LrJ9PO9aJIylSQcQ4+TB1IFHg
         pE9pxKGiqiVOsWFDvw6VqYq4q6JHNLszIeJ9SyOpxuYzfoeyVKBcyoqX1h9DWsUDhhCQ
         hf8ZJhmUZbvx25IKj2da8/WXdN/hdJBD+SvKX7iq76vZzoghF0bMtfCrF5HdBQwBv2iA
         9/23EHyksd9wgritDEskILpk3rzfEvcvFCVQglOQ/iJtKTpkqaoT+Jtoo5qEEtaSYUM8
         SOjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlOLRLtEq7wSuyw5CuJs+/Yqcfu2h03/uoEsR9xYj7ALJlGUt6W+7H2JAXu5HHMPdvbct8pGkyjhXdp09N@vger.kernel.org
X-Gm-Message-State: AFuF++ktZ+NUxrxdpGhEmhR6tM1PPlc7u4Di13fCgM2TwUJt4nuu5V5+
	HskhicTctvTtn3xDImycidUQNZ8LP6h321k34LME9O5+F/ktEAlC6RPG94tG0scq5VrMd5GIomn
	zr0Kao//wYUhbRpEexcErSMlnYZEaEzHaoAlARyJr/Mos82J4t+5pE4MxHdu6Y6eFbfAO
X-Gm-Gg: AYBFou2mYFZTwsIluci/KrCJnIwVOlWq5v32bhAsrDc5RKBIN3tKT1fro0rMk6m+/6i
	2l4uS+CSUM0i4LFagHGLDF1i7+aRANiW2IL0y9UoxOE9UxARLgZ5KvxL2d7Mp0OQB1AE9BlAgo0
	5X7SxEiKZziUOOw0KfhJAJBDMA2MTAVufBHedhimq9DJ/mnr2P5EwptlUKnogdmget+/Bsjs/sL
	ZFwg4/dlF1T58YxM79bjyzHJpKdF1EV5UWdKbZuBvZaGJiLtRiSj2tM/cr0GSjTwoIbN6aCHg0/
	z1B9T4KJLHWIYq2zRl38YlkY4R7A3SlihyC+XQ03QSkZCfiWslL1QGVBqBr2ovpC1scPa0+2W2T
	a3S1h3cPSRQPajyihBqZWeuZFBlBZakkI26zTPss8TINUSOIDa0049L1+3q5xPctNVauN1wb8pk
	3dXzPSBl0D84l0YRiltCRWfg==
X-Received: by 2002:a4a:e841:0:b0:6b9:740a:290e with SMTP id 006d021491bc7-6c542d27db7mr4193343eaf.65.1789465159851;
        Tue, 15 Sep 2026 02:39:19 -0700 (PDT)
X-Received: by 2002:a4a:e841:0:b0:6b9:740a:290e with SMTP id 006d021491bc7-6c542d27db7mr4193259eaf.65.1789465157287;
        Tue, 15 Sep 2026 02:39:17 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm30325876c88.2.2026.09.15.02.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:39:16 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH v2] mailbox: qcom-cpucp: read mbox hardware register using readq()
Date: Tue, 15 Sep 2026 15:09:10 +0530
Message-ID: <20260915093910.2487018-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7527e6c7-82ad-48f1-8329-5b9222c347e4@oss.qualcomm.com>
References: <7527e6c7-82ad-48f1-8329-5b9222c347e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -EqQHxp2m1r3LtzxEFomB4GbaGUTJvmX
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa91248 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zVvgFSUyQItoBg7ASCAA:9 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: -EqQHxp2m1r3LtzxEFomB4GbaGUTJvmX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX4jiQ3KXrRSKg
 UCMV+5HmZrHl6lZVpLs0ktD2mVvle+em1eMhILgJPvF5posfYO2LD0cdFdpdzkSQv86/KVhGLHM
 DR9PPEEg99QpQEMC1qkOO1yOTnfW89c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfXxivoJZltZwgP
 H7ts2K+fx5juMpc0pIXlWyvjDFSYQrQ8cnXqg6NuNIYu2dMEf1X4wOI92X/UnmAyZcctKVrIFSE
 AktY2ueTpcsI7GdG8sPp7fuiMT6dUtSiE8uipWFTfRqp9gRSeWU9rFI5DAH/GR0TlslQawWc+ON
 Cw9+AFvWRLjmvR1pfBmNoaARliJ5QrIBv0IBHcMkXYC8guh05TP2/RQARReiD0AF9T5UuKypqlF
 IsEh9Bgu5wZ6A96fiPT/DL0BkCMcMoeb1dPAkIhhQFNMXsAhNFuVsgznOMAXrgLFZeutZCOEV+N
 eGkPBD+hblbwLzw1dyouqucUKoo0eLO14VpIQsDuNILhUxjZcdCmq3U5QRFObB05/dhPHoD4AN2
 KgvdSQYgjW9cdaht86/3MA2FsVD5GsedwBTkFUQQeCtRPufhEI2ym8V53y+7JKG3BTlYmZybqve
 Lfi2GNE2lvZGMa6LjRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150137

Mailbox hardware registers are 64 bit wide, but the interrupt handler
currently reads only 32 bits with readl() at 0x4 offset (upper 32
bits). This does not return the correct value expected by PDP log
driver. Reading the register with readq() at the base address
returns the correct value expected.

Use readq() to access the 64-bit register and pass the correct value
to the mailbox client.

Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
v2:
- Expanded the commit message to explain why this change is required.
 drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index 7ffc40acea9b..f56a05149281 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
 	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
 
 	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
-		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
+		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
 		struct mbox_chan *chan = &cpucp->chans[i];
 		unsigned long flags;
 
-- 
2.43.0

