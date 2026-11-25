Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595929;
	b=4JTBMjPAu9ovcRT/9H7/edG+l2tL4PN5pAi+kmb27joxbn479yNXriK1ZGwZPzxqFQJ4
	 wCzlM6cvkPjlKzdlEID0XXrx5fdsARTVMQ4QK++59bbtS0N6y8okbu3/dKPbdTzDux/kr
	 Ez21UCBNiZRiftul3rE0Rz61PjI/xS0hd0reXdDU/fLdBknN7bWnWd260LdjtjZ5Nrrvy
	 ZEb6VgNU21CsBX6dz0F6jeFFyjijRHLwyu0RsmcIYGRQFKlX6Z993JyI2H80uCDuJrcGq
	 isETNWa2fYim57bU4VTpzSca8yzw4HaWW2c6uDJ7qb4kQreJ43S3vYdLCOnJmBeHpDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=;
	b=Kd0sddTaa/Ok7ZalMqcBsuJn92+v3vLBwN7d68wtOJ4opkGcvbSbDOzByNRjLLjEBRNQ
	 bBv/IuIKFhg28b1SrjMIJc1DCEwuu2EfAZGcoQrpGLI8GerOx3qsQtHPkwm/LG+Us5N9i
	 nIeB15SVRNa1Qc/L0079s4XCVKEOQabwXo6Sj72i5RGUkpkm0ZfUPw4/PnDS4DSMYYcSh
	 jGSwhZNM6ak3W9V2Tj8dUgI/xcRT7p2rVdAuRMBAZS+PHsfufm5MiEwzOkZizSlsYV4wB
	 jILUclyAhvFgfLddhGpsdDf2yqqX9Yfcz2xzBm2ni8a6YJHFBwdvamnQ0XQlfthjvrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gngjxp3P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZKAEUFf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D40606A33B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D40606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gngjxp3P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZKAEUFf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68oxr3261144
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=; b=Gngjxp3PJowqgNgu
	auXqnVG8/uwmMf0U2uo8olYknrgD6XhklCgf1HS6PgYZ5LJ+/n9MGI90saEr+rY0
	fIBmzqI1Kk+ZXNk5yiuao+DcxJtpnozHE2oSfPRr4zHJIUQ7SMYn6tMePzkhlGah
	kUe5ObDItTf1HyWdMgg5G64/YHiekwN4Cz1l/I4v+ZjixaouTF6a8WmLaYJKaq49
	YMA/tJwhNvi2T9TjBFOFPOX2iMRiT+wiOG08MJmWyfVHsEwQc5fSVOX2kzs6LpKr
	Pe5wTmdXVNMxUU2cDzOBYqgy6ZDP1Hsg1Pt2wsLB2FU0gImyBTFAh8fmSfOMyJr/
	QFQprQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egsb9sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:38:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9493e89d4f9so793575585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595927; x=1796200727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=;
        b=GZKAEUFfjXOwZFZPaETFMGkQ49oQflksnCxiORt1HM3IazPiT84xCRC/z61scIRSzr
         lM9rnSfzAmhcO7QBtayLTGhc8pghwDAfZwvvcC/UCYeJuz+Z5yGiQRWASV7YiovWyZZZ
         c5c8tJJmhxuwX+XzIkL938zasbP/9ZFAEPXJkEN8hLllCSXGGSaVlnyZt/woIGShrvLK
         o5OEXrZfi3TRrmIlTGG6FqyHfi1Nq+xJ9tFS1Yq7C8DDRiUezrEzjsUp590ek6Xa3YyB
         CS6YvAXrG4joBW1gU0sYVw1HlybPV8hs31RjFzxXzWTlGF4S0D1Xw/+JPyEy0JMZws9I
         Nm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595927; x=1796200727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=;
        b=yzfqhTtxuP0jhoG5mP1QIs3izA9fsxSItyoRT5LtF13buadEHbHknrSuyN2K8E7uVV
         zDDejNqS04aaPv40KDeZV3i4Y/l0jvqOieQHflg4Dp+OD/lhb7+2XBRs9FtdR6X+plNM
         +xrbUwFC3hdT+RXVgPkgmNi4LrRntLRTXgAY7S76Trv/f3v0x1tSLzjr4Bpyz//1FvJY
         XVnOjS/KlXuuYLXH/i2XFlxe7+nRzZVXa2c3bzaJdASg0i0WnuPNknwN08uGRs9Vp6pC
         eTTv8fXs8OTUBtoV7bUas4PQ3vK86DROse1B/XbM+sIvDQUmMKsR2O5GbAdyIg+7TYBa
         UULw==
X-Forwarded-Encrypted: i=1; AL+hErGjwVMQc087H6iYBM+sLuw5e0ttcN6nrwUKwJ8fFlChqoWJJKjOzqUK4uCcSs+AMu8/yMx2WkVxOfGEXVd+@vger.kernel.org
X-Gm-Message-State: APuU4Z9cfHXebV0hehZZuaH2eWeh/LNBkJDCHnahp520cFvAHObQukqU
	tfR1wq5BnvTnX1FgbNto8lD9hmkDU79vgosAce8h9LyUw+wwHl6IdV+6PkGIiWQcgfrRwONKdqS
	gJTbglvAsl/umbLwh+VLpSwLfr6AosXPVnO9U/C5L9LyUBw/deM3ue2v58o4nFDFMObKS
X-Gm-Gg: AZFdTZdSYMqQ/EBGRbgctevdcXmjiNXmscutLq5dyHCAxJEEw5e692O0ilzdybKYW84
	TKqfHIfwZGhvZFdcymFQCCt3gV/1jJdEtZtwBTXONUxYp5Gu2cVy7JT6JHhYKZFIG5wvYxUaVwP
	6g9TTXgHI3KEXMFjaqL0Gpf73lSg0ezamd27J1+VW2ZuZGTGx8CUn3dteEQvCYAK35u76fuEcVl
	EeixEJbEKusDHn9xMuOr8Ad/7SZ7mcF6BY0id0HABkLlP0N7e5wWP/GlolF9hY4LOkgdic7dzcn
	KpGpcjyGnt2DsNbRuyw59NjlGDasSqKpgwZnb/TIWYd+Tf5ZxmKkvdkD6XsUyi57nKakGdpd1FV
	jEfUv/5bjcLLddibBSNtAsNbTy6vI04bXIjvxtdQo/6EoUu8po8oeVRwgznkltqu41QZRnusAii
	MR7x3udeac0bY6Q41WdzUxqlrEaXJ8oM8SqZpUDO1PIy9DXmRIvbFzjUYo6pJeYs+z4sJeFPYGs
	5gCAMdQ+2Ri2ySF7knRi8F6A/Ap
X-Received: by 2002:a05:620a:29ce:b0:949:8bd1:15d with SMTP id af79cd13be357-949ba9b3e0bmr3209293585a.26.1795595926731;
        Wed, 25 Nov 2026 00:38:46 -0800 (PST)
X-Received: by 2002:a05:620a:29ce:b0:949:8bd1:15d with SMTP id af79cd13be357-949ba9b3e0bmr3209289985a.26.1795595926240;
        Wed, 25 Nov 2026 00:38:46 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm24626021f8f.15.2026.11.25.00.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 09:38:41 +0100
Subject: [PATCH v2 2/2] media: qcom: camss: vfe-340: Skip the register
 update when queuing a buffer
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
Message-Id: <20261125-tfe-fix-irq-v2-2-29dfa0955927@oss.qualcomm.com>
References: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
In-Reply-To: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXwMbHJmltt8+d
 DByKf/xmp8orLaLR7XBg2CTjjUv3UcK67Vy408dnuf9CqJ0VFnSGqzc/2j4roa9+7j6tOeVZ0q5
 dA/LQpy35HEZT9rZ5Iymde9sg6xAydngovVAn3L4y5HuDVEQ/8YfYWluUDdTAv8c/7RwmeMrXrK
 VTARw4eaP7it0rkcyzV67bZP1dMD0Bdcgoog4mxmamka0ZjbrpQRGjRk5XrI4HV4rrs4dVpBTyE
 9X613p75cpvuOT2bK/EvISjX1Fk7Q4ByWBkTj2PPoR3jD2d+Bz8UUxfifqRt9FhaZobkcN/2BZo
 xGx2k5h4Pwsptzly7NXC3n9a82GyGUiSXwy5GwuGB4zAM99Zp5b20aBw9nYxWM5ElBJi4Prpt2R
 apPkhcQaM+ZKUfPdsSLJ6oFtzM5Xx/iMEBLM9NlKwhnSTgDDIcu2syyrYN3RqMBpdt+wJTZtIz2
 3hrjPJ2DSoY+735lt4Q==
X-Proofpoint-GUID: JGLGYRFIf37aSLMr0YW6dYNXxZ-Kyd1i
X-Proofpoint-ORIG-GUID: JGLGYRFIf37aSLMr0YW6dYNXxZ-Kyd1i
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b069e97 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=6k50daf3fveMbYCwvhsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX9YH8/ex2IqBz
 ZUHWbgmpLmsU4xuKVVpEsk/nsp7zew+vlCPM6jwmvr83+NzNGf0hhvKQVzduA0Pf4BDuVGpLioS
 0iP1Pu8QlZ96IaZ7tNOVOSCb2tYtJlI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250034

The TFE bus image address register is a FIFO, not a shadow register, an
address pushed by vfe_wm_update() is picked up by the hardware on its
own, with no register update needed to latch it.

The register update issued for every queued buffer therefore costs an
extra RUP_DONE interrupt on top of the BUF_DONE one, for no effect.

Implement addr_update() as a no-op so that vfe_buf_addr_latch() stops
falling back to reg_update() for this generation. The register update
done at stream-on is unaffected, and streaming now takes a single
interrupt per frame.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-340.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 2526d568686db06a233f0aabe4bc176e4c440ea5..560acec0e0297a4bbe862fc71411b792841a7623 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -365,7 +365,18 @@ static void vfe_reg_update_clear(struct vfe_device *vfe, enum vfe_line_id line_i
 	vfe->reg_update &= ~BIT(__line_to_iface(line_id));
 }
 
+static void vfe_addr_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	/*
+	 * The TFE bus image address is a FIFO and not a shadow register, so an
+	 * address pushed by vfe_wm_update() is consumed by the hardware on its
+	 * own. Latching it with a register update would only cost an extra
+	 * RUP_DONE interrupt per buffer.
+	 */
+}
+
 const struct vfe_hw_ops vfe_ops_340 = {
+	.addr_update = vfe_addr_update,
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,

-- 
2.34.1

