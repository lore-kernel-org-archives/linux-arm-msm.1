Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5200597F58
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420775; cv=none; b=hJldB0UXyQ7Om3AmYvticpJfap2INeWFaByXvILdtLvGZsKvqi4rDTnimpLkfYeBUz1gowhZ/XmVXjrlw3B/6EbMnMSZPcCc3H62kYvUxVXA8a3IcSz+kAWBpolW/MdBINntA1Avladfwic9RcQRqnGPOewVmheVgLbqcITuWjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420775; c=relaxed/simple;
	bh=2h9UIOLonoKrDR56nbeC/nC3gznJkCFahloq+sP53xU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMMgOF08cPR6oyWzLbA4VR5CVJSrpmCes3ITeIPHcdJTBiGqvIuQhteSPa+XDdX2hye/2e+IvxvSyRqrfAVy/meBO3y5pd2m+Ecfj/orFNUIirJA10Tr94Ggh2KoFNaZC9oaG34IB/TfFNbT43GPyKptsSwXaENTbo5umWK9nMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OM36+XGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgsLjnIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OM36+XGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgsLjnIQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0nJL2081928
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sb69aQPpuRDPIxY/hTHIVb/r+8ocignrD35XzySTbJg=; b=OM36+XGb92Zv1aKx
	jkn4DkAPA8yjiR67WxcpgheEbDLJx0FXCoLYgSPOJN1QLjV076ATYbpam0nIOJZT
	2iawdUFQfQktICkzmegT/hIqhSQfX4efdzGpZq1uLI0dU3TKud0oTTBR50eaICC+
	AFzYL8IHVyvqeCG2rpLuDWI0hGExTS3PzZ68Hxtg/vWwDcFGbtu5VYA053KVzKrx
	quTzLtGWTPk2Fo1KRV3QNNYpfwJJRKMLOTOJhW+8KI2mUfZj7M2DaBm1FS7Fdagd
	I8sJ9L1APaM2VpgZddKcbo19y4z++pKeSyJJRvH2olBG6BLfOj2woB9DwCcJ+KCn
	IoOhhw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rhng2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so365878285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420772; x=1793025572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sb69aQPpuRDPIxY/hTHIVb/r+8ocignrD35XzySTbJg=;
        b=bgsLjnIQTBTVsrDfMb3jxVDWlYV+NnFTVB1FsVTFzKlA9M0tuDIxGZzaxs6U/I6P8o
         199KFafKooyRekKX9R0CVNRsIs4FDQ1dx82j8qyv0eeBZPoP/dKui9QJdkXCmtUF3+kZ
         LOrNDJNntc7MLOSlMYH+lMUrLbkNtlIitDXo/DlN9QV9WLtre50klYr2dlNmwDUylY1n
         gTz4U7M1tsiRcvCSsev6qqsH+rWrceQDyFIk4UCbCfwwcBBjOsSeiPOWxB+TXdpy16gx
         CrkOB9Jdn3EcxFlRY4Vc7VeMPHNCZJAgit1X947HYfYpW684Ur+T88BTJEIwThY/VGF2
         uaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420772; x=1793025572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sb69aQPpuRDPIxY/hTHIVb/r+8ocignrD35XzySTbJg=;
        b=R4rZAyV7V/ETPnSHFM9owTBLgvNNRPDv4GYJ+tjNR5lfSOiy2odb6P7E1CiMd0vHtU
         7EMbGuyjqwnlMlUnQ3pWYPGbtxjB2C8L+UsWFi1gDi7e9dgURgQVRNgqf6boOuiYlOyp
         JnyBTeGIs0mcJm9U35RyagRAbstCWzUroY0zFdzLeFGa6wQF0zQtGQQY4PCzEnPUHBY6
         GLYc1wYC27N+MNVmfYr1j/VrTuEQpTHtrzt5qecyLExvBmooHSY9V7ZeCABrzLr17vb+
         nA5sUyjGLXeIyNE1rVnkC0G0oKie1uUHK6F45oNSb8XM+6VcF3lbx47dxAuJXCYiBswQ
         ovsw==
X-Gm-Message-State: AFq9FYKoX4I4XFERYcmNEni15GjFwZdV4iEYMHrvWJ39fddK2X+226Qr
	FTF9odJFgpluM6VSJ1gJteIiTSTISi5D+Cd1jc2VoEvid+EdouSWqCSs9cEnnC19ocacHDrbTmb
	XyZXLJG03gmXcKKgKp9NVE6e0FZ4YyK0+nchjOVZ9H7ud3MB3nlHeOC+Cric5Y7ktq99f
X-Gm-Gg: AYBFou3HRbXETTjoyUtZl+0iJTtzSp3HsOcT66XFHVnk2+DPtwoKC2mvmby/WqyniUS
	NqlD2idYCyLfjzwx+Gp9Fpt66ruL3PvhuQcuiL4Wtw3STFjKPtBbL2GesG1mPEKUXcTv0Y1aFTL
	FRtv8PBTmxu7kPrLG/tMchblhie51bWIpm3iInpQqJ/d3TVpNSvOS3a7xew7/uDX1xBpfc/l3Hd
	nvBRrdkjFF+NBbaWrcdAHNSwrNdQfMceTZ5xRu8o9NUUCNf54tXD+YqV3aG6Oycig9SLgvZcF/Z
	xDoeZh4dsyaNVoQ0u9s23icVhanK7GjdP9l3JW+Xn6s6jZJSKvjDrBMO5e9pWOUmIKjRnjwYGQ7
	XzMahz1rKSmGywRaPp9rCnGWVsOTDlbcdeAFSBGXPndL3YmU5QmNCqzoEOhzZWz4DNRxFamVjBm
	PoAnQYt0a7XvDZ
X-Received: by 2002:a05:620a:461e:b0:939:13a7:70f0 with SMTP id af79cd13be357-93f29b761e7mr1412818685a.5.1792420772132;
        Mon, 19 Oct 2026 07:39:32 -0700 (PDT)
X-Received: by 2002:a05:620a:461e:b0:939:13a7:70f0 with SMTP id af79cd13be357-93f29b761e7mr1412805685a.5.1792420770865;
        Mon, 19 Oct 2026 07:39:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63aa17sm2033436e87.69.2026.10.19.07.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:39:20 +0300
Subject: [PATCH 2/3] soc: qcom: spm: don't clobber the SAW control
 registers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-fix-qcom-saw-v1-2-9c7ba3fc2493@oss.qualcomm.com>
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2h9UIOLonoKrDR56nbeC/nC3gznJkCFahloq+sP53xU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iuZr/aD81SWq8mJzMNHpjxVB55R04VWteNk0
 Y97uu0Gvg2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYrmQAKCRCLPIo+Aiko
 1YSIB/46ChAYMr0agN2qErsuiZmDmS6wBDy8ppemc89S/ayPCF4/hy3nbwq0aUYs3x1JYVrKYsl
 J4df7tFxk70DF7He4fpVJlyVnQ2CKhSildPAVt20Z6EyQc0ONLntuSpM5pej9GYDJHL55t0+kCX
 3ZlQVVxId9wK1TA8Pc9WM57f8X6gBw//XZejTX/yPYAf2eLvsjt3nhd2NoTaP88a9WXmPR2coPY
 YITKHv5xEo05JvGLP6IZwfFNJ8NcTIfKVPTSi/Jk4Xu3FLwFAXxAecn4txVWiqRH9CbBoTtVLG5
 mH/sbX088dBHy/cTiVinbuTTKP7LSBYhJ/cxA7iIb3Oze8RO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: TvnDEAXF_Qhy5BLG0bXDMIYQtOAkScHy
X-Proofpoint-GUID: TvnDEAXF_Qhy5BLG0bXDMIYQtOAkScHy
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad62ba5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lKJQq1FpCFxXXcX5SosA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX3J724G7SGJLb
 srXAxHOtqiUhTmwnMdxb1o+k2G/Qk1BcG05wkfd/49pbehAc/F3e34YCBZ2FghEAT66wTU5Ku/X
 Q1CCrZv1XeNu4u0DyXwudiPEpmU1pOM0BW8Hhekk1jxJWSdN0I4pC8GrvWN7VbsYd19Osjhi5He
 Vu+aq5ByxbPEmdF/0nyHGn3AeZ8Ae7SD4Op1QNrJqZlRp2PNvugmePND/ChkJomX4IcD+gREXs/
 coHREEQ6vgUYBkL7az/Co/LpFJqYwOU31B2Tw35QBpoNQ4uXeK3FREoG1F28opjW/c6MFF6aSV5
 Q9gpjwobJASktQUncsabb1i/RHUzs0SsynF1gKe/JsMfomakfWMJH2d9tS5hY70KpAzsdMXqWc4
 8w+bHSPEchzpZ8RoVg+ZIyhV/6elRH+UYRZx2fpfTnpBHrR/Olnwj6JMHlVVm/qige488UP7mZt
 s6PVPH/x+AEh3aysSmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX2Rxu7TxDKBYe
 Q2uhvrG/3qc6lMLNZeL0u2put5XOQt4ISYWVL7Q3oH574PEJx2LZBrFAehQcr17y8H0EbxCyr43
 yqbBx8njc6BFgT1M27zGiq9qeOZfRqY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190058

The SAWv4.1 and SAWv2.3 register tables have no sequence entry, so
probe copies the all-zero sequence buffer to offset 0 instead, wiping
the SPM_CTL, SPM_DLY and SAW_CFG values the boot firmware programmed.
On MSM8998 the firmware then still powers the gold cluster down once
its last CPU goes offline, but never brings it back: PSCI CPU_ON leaves
the first CPU pending and the SoC hangs or resets.

Only write the sequence when the SAW has a sequence entry, like the
other registers.

Fixes: 13e72c3e2261 ("soc: qcom: spm: Implement support for SAWv4.1, SDM630/660 L2 AVS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/spm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index d41c94d32b51..6f2f14eb9022 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -528,9 +528,11 @@ static int spm_dev_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, drv);
 
 	/* Write the SPM sequences first.. */
-	addr = drv->reg_base + drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY];
-	__iowrite32_copy(addr, drv->reg_data->seq,
-			ARRAY_SIZE(drv->reg_data->seq) / 4);
+	if (drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY]) {
+		addr = drv->reg_base + drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY];
+		__iowrite32_copy(addr, drv->reg_data->seq,
+				 ARRAY_SIZE(drv->reg_data->seq) / 4);
+	}
 
 	/*
 	 * ..and then the control registers.

-- 
2.47.3

