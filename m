Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422E6416843
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 19:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030505; cv=none; b=fOC62QE43nvX0v3Ngi+75vqMVwyFAnknRRA3RL3eJonhOF0Ynbg5w+BzNz3QJFbZLqS8iN6FlVvV0y7gs7RgISuFiWRGKwPI8i9/UwzJECXw6Y2Jkoi6UAS0C3JjKt2K3wodhv5IviiSyVr6E8Oa+qr8QgDenp+FlCwPxObT9Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030505; c=relaxed/simple;
	bh=jgf8SXZZdg8yn7G96UMAuhh5WZwvNapKXO0ftwAr1TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWlzemz+RGxkslFmjgwSqC0CELniRB5oH2PB+8rbzFKvOCIsdesSggdUUPQR2DTlbgfwXi2fSY6SlH74xCVnZD/4e76ICuKvWeYpLgtve/RXbSS2dLmLhU5jtn7e7/D/C2X+vdoRwZTHNKh6FVDU5RlwDTIUX/1FiIbg+4ekLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HbSyQa56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaTZgt70; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HbSyQa56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaTZgt70"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TH02M23026153
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 19:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=; b=HbSyQa56PdtVlPTg
	jg/ToFCpgXpQtkiGkjIrgirOdcmFMkNGR8rZzYrh5qHSDzdReOjbeB/32XqA5ObC
	QiTpGuzP82NhRG6ntkC5uJqFJe/7V9/w5+vrhM9JV0dK6VWT6jj68zZHOa1BBOsy
	G9mf6qlR3SmRTKBuzgsSmVSv9WzIVqfHYVorXrCQJaaR03K0eb7U1jc90tV18ash
	SIulReXMn40WYG5x1sN0OwvHnd7H8/H9vXaU/TDi9CTUu26wF9lisGQ6/KhjfGjM
	7dtNR6jf5C1O9qVxdakYtj1ZVS9sU56KSHDkVihMVYtgC/EQxmFjjM64XE0v7AhS
	ggodCw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfhmef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 19:08:23 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-85da2b96c35so35643417b3.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 12:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788030502; x=1788635302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=LaTZgt70a9PuCFmwz/uqM0PbZbcUK9v5dVeeV2cQ6alROFXiSMYOEmyEUzJZiy92Dv
         SbmB21NEYQOSmZrMTj+Wp1jC6CLv5jXU3yz8p5XZfLhllX/LUcx6UfKevdppy8KdIOV7
         g5cm0DTmqWCfpQ3HUrHgcovD7+rAm0A9Eolqx5LZq6QHZ/MFzcdbe0MjA5uiTXHQut64
         Kf+r/hPT0W1ssKzQJb4iEBA1feAeV6ghHMKc5ZKUe/jIxNMlBj1rjeeGqKvpnkrUmlV3
         spfbDy2fx6LJShUGfZJFFwdhttwpN2wNIaaJXltV8rjwXT85Oq9Q/oYZIA8AxRIGeihz
         SusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030502; x=1788635302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=kRwb11Q9KAF1vBE45rBlhQ0uooOYxy1tAjRGTjdvpqm3fzgA2cObjkPaLIyVglz4XB
         IVk5YxJ6NFDY5htxE52AeYg8R8XPlcBes3MYNblYu+oj2xMmuqTxosdVDLou1U5rijNR
         6slvDEt7HiCGGFbiijksnfeqIZHWk//OvOtsndUS6RB6dUhh+on3WONSwZZ85dpR2sFL
         XD5PorFhFfa8TOO9SGdKaJ0osCxanOQOxDzUJytNbob2/kCiOkEVCWEBFcIT2/T3pUsv
         x1j9dq4VCZ6+Q6U34EYV6yhTfosLeVuLVeXZK0yABqZlxp/eEGVR21dd26HAYaiVOa3m
         gxXA==
X-Gm-Message-State: AFuF++nf6KO3U1tCkqcUAZCwjqGQfCMnfpvBKY8wgvpQzWcsY1UTK760
	FDlPAhdPFXK03o9Xmc79ZgrdK48JXCJMy32MHU5d7lZRLbYQi5fAFd3G8hvRWbEyZmUQ32UOSxz
	YoaFP1vboGuFz3aCh9B/tSqUKM9PFgRDRKB2skl/eIDpdq8dxb5nshPYEawsPgTxN7YUZ
X-Gm-Gg: AYBFou1mwNRTNG0rJrXJjg1oBq24JS2hrFYHmYoYmqP4IG5D83gIJwroWGYqpMntItl
	O00x7DPrIjwfNyLK48dlLys4akYorEW/pmMNHWGiQ0RKgsWD+DQVgPPNc3S2WBE8dDAjAZye5AU
	cZwg8QMT7fRIKzzlwtmlap7sqsYNvqt5jEKaZRir1eP7IFMbJwx6W1TqalSB3Gawn0wvwV2JujE
	iUuvetKnjQsxSUs2/XO8GAKGPbuRljCSCkmfPjT9yLWjbej45WhlyYoyqHH7uVZQCAvCzfOkwiP
	4JSxIpdXDJnVkYM8u2EujaEYIZ1C56vNjcBVnqkW82Q/L0MzZWB0pcDNDzwu2HVV9csowmG9m02
	Byd3CWD+i9tyD5s7fTAWAYD/cbV4In5NqjekNzNvC8nFzdhbh
X-Received: by 2002:a05:690e:4513:10b0:66e:461c:428b with SMTP id 956f58d0204a3-66e55b8480bmr1983816d50.30.1788030502464;
        Sat, 29 Aug 2026 12:08:22 -0700 (PDT)
X-Received: by 2002:a05:690e:4513:10b0:66e:461c:428b with SMTP id 956f58d0204a3-66e55b8480bmr1983692d50.30.1788030497281;
        Sat, 29 Aug 2026 12:08:17 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:44f5:f599:5679:b5a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ecf1f6fsm3013945d50.13.2026.08.29.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:08:16 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 12:08:10 -0700
Subject: [PATCH v5 3/3] firmware: qcom: scm: Allow QSEECOM on HP EliteBook
 X G2q 14 AI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-glymur-send-v5-3-a11bdf6a4b66@oss.qualcomm.com>
References: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
In-Reply-To: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX5j2qN/llVLgD
 pevS/rrgH4dEfiV04qwjRn6dGKGSmNG0tN7zYyIqZ+WsdkN1OUJO015kF9mE2aT0arMw90DHW/m
 ragd/fLd9GlWw0PvBFAqvh8ocCEloouA+VFAhijCn8mHOEeef3l8xiGrh/rDzSOW7UGlL7H3GQU
 VCfshx4aCbuxoWktsXYrTx6JrHe98ep5K/BPUg4pd+rCXPwlxwSgEJEafV1ZCPw+RPnoJ1PEk6a
 lkhWoCTF5VYMzqg59CV+a8UmlG/qhntP+L7JhLBlgS5zOcbiH3XJ4s+ckky64NmOLD9zA8/xQU/
 mIcnWDy8U22gUtIqQ/FZ5mijIwjqos3ZjwWUXsl1ONJKL/hZ0SNK0PVLwMaDXZX/z45b6gqbYPV
 CnL0LuX61JoJ1+lcmFdWapvEzFLDWh+mgWamne0+MNLhJhzGvq2oFLjwsCo+esZyyrpVBer5zJE
 dv/5wy+cCh+ZNkFN9yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX4hHvzwFA7SqC
 /hE7jkKnbfRVVX+PzqUsHYxN0yl9ofs0tJAJU8f1Lb/Jjk78B9bySp9HnU3M0uS8HoNXEDGz/Tk
 gDfHari9L5F6UBXGiVKc7dr3WDGVAbA=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a932e27 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=UXNKUhSJZRFg4A5DIqMA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: pYJFEZP8EjPasar3FAc_bvu-EmU_S5Be
X-Proofpoint-ORIG-GUID: pYJFEZP8EjPasar3FAc_bvu-EmU_S5Be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290165

The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Without it the kernel reports "qseecom: untested machine, skipping" and
efivarfs is empty.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..c44c63e1c20d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2311,6 +2311,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
+	{ .compatible = "hp,elitebook-x-g2q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.50.1

