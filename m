Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1208B43FD32
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768867; cv=none; b=hgiRxvXpw+ye3bsnx0O6NStq9HMAOfAwiFG2rM2jBNvBWaFY6Wl8eke806jxPPa+SvloH2S/bsMqS2Fg0rYiJEs1j5N6ugfMr/WVCi0ZV2oINVi9ai7PZ/MD1BVUprAx3HQ3KT5+fbSGAClGRXu3wO55lAQz8VQyagsnIOv+YhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768867; c=relaxed/simple;
	bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jd1ZGwbSHs5sk/81ph9mZ6fA104LDjYJHXe8qsI7L4mFqQk/R8h1CONzad1Ul/x6wW+DqS87R8ToC9uxgGzCHIXKJndxl/IcnAONTtzUPrKJacOkWmVZ3ZqXvYvooKIPnwAoDXP3xRFTC/WP1DVIUBzvC7kR5yeOE04O8BrI734=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=px5URFKS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BbSKij/b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="px5URFKS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BbSKij/b"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777M5g2838814
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=; b=px5URFKSWcpFG6By
	FmckY/GfcrBuDS1zDFI651u8zA7Tnoz/3uSRNgMyhqvk0GBsmxXbHVR7XcGGQQLK
	MQIr53YuDCbGaki8olRqLIb+M4fJ6H5ZEKqSApoDAgL1VkT97lB54z+wyuTrCk7V
	U7n/qeH9SNgEGlwz1M3VG8MAygO/eZ7cB56QZ99KZ3fWSv10G9T/WiYsUAOdhIxI
	LT90wKqspZ8kpcVhJEsUtsC8UXNFBC4/wISyffFH80Pqy9EYLc1eJt2TotH9CUV8
	Ty9rz6Po6hYLQYj0O2xWFStAWuzkfz9RuRbXQlv3EgaqDY7OB707oOhA4XYmZoYZ
	jkdAxg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuenw3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:14:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so4212922a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768864; x=1789373664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=BbSKij/bS9eobUSFryzRO/Nt42K9OcaVHU6r1hRV85yrUc49SB5etGMpuKrcSIND05
         0IQ1KwrmAI/RqqYe+S7QdwSpRCd/x8abMtnOLFEoaGp0IkxaDh9CfdSGUjECuZqKnp22
         TdgpEp7QtEsrdgoNsonGEWfmT1/3ccUp5nvmiosinkwfVyGhA8oQlHcK3dwH61pVB9FG
         FsflshnVuqhghENs17le7rCYVr1IZ0U3brJZ+7RUSQ+z+Qq86Afi75u8ADYtNVimgGNZ
         MLjzMDHaX5STcxlRELUem8iJCsGV/YW9WivP3NYOOpkN1ZzrbehRdw8YsDK23z9D63Wn
         e2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768864; x=1789373664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=WOOWaWtL+XTPeBMzCKOiiK3AWTzFjyUET64Hs3W00UmB+Kh1jObqjBLTtT6xkIxI3B
         4Pv0cdBxFBLmNW4UmOJthCRNxdhM9L6p9M/GtweBreNigoa3L28gJ5O4gq2sSjHIwN1q
         PjVE21KGh24djEdBAPpdWz2fqram6vpS9XdK0fQ1UJ6f/RBohXDvth6zVzfsXP9jDGem
         lQnlXysv0wT9C2tWlesRwwx5Q6lDJLG3176VMeuH/7vDKS7ek0Vatpb4cLHqRLM6b8Oe
         GGUYqD53yGv+qSLKVnsR8cdMEhZLQWy6Cb/jSVOIsxOaokzo9QTPUnoaNA1NF+Vy6QRZ
         OYlg==
X-Gm-Message-State: AFuF++nyiu1FJ10sTHdDKgJK5346XDKBRRsnR/szKxvWoMLU+ConVwrs
	SlaYrgCiWMcSh8zvnwjtxUq0McyziWFR8ummYL69iRtkyWqXVws+r+JehQmqCtBAsZ7nTffURJx
	xKRhYBbVvMsOsVCQBbEg28zT4iXzVFg9MO02cT6/AxmuIVjEh/A9U10suSYjUc5TJwfa5ZBY1+U
	vx
X-Gm-Gg: AYBFou1+SWYHZJnIDWIIX/d05GPpef46l1PAhASoSfGqL7xWLSMO5IlBPBQSm5xWBOv
	4VC9EiMN7C/Y6Y8eA0poSdzvs5dWWTbFvQnqbhMsQ663TQYV8emzPWRcSdBGQXe4oeINHt9bKLo
	8vMkkyanJerFgVM9uIsVrcRMS4PJ505JFrqFYWeunldyU9f3rdz6uHzRGJ7rqPEq+m9xsnzLtvH
	qJcGa2HsJLx3J63OqnbereJifbYA6/1I7OByngysd9AjSwVP/tHbHLnN8biOKaXc9ApY9rzlKC3
	ewDX5SUMojm2sbOzKxIH8x93Cn8IxCwvAVMtob38h2ZAZ8LQUPA/p5ohIZ6kgnaQ/m5S+jemvXf
	EjZ+8vclPQAHAuaUJTkls6MRSEoCitLQ=
X-Received: by 2002:a05:6a21:6e8d:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3da39fd290fmr33155515637.14.1788768864547;
        Mon, 07 Sep 2026 01:14:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8d:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3da39fd290fmr33155432637.14.1788768864089;
        Mon, 07 Sep 2026 01:14:24 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:14:23 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:43:40 +0530
Subject: [PATCH v2 4/6] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss-v2-4-75f7982dc983@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=1214;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
 b=YMrJpmRfjIqlMxMZFYjxewBlzaJz0yE8Svh+SnXsf50kXLlDnEh1boHaeMbt208cyIv0G7d47
 ca7rrOzp2d0DLI2LGy81N+OA4QSnH5JSZ7yqaSwj0NSx8tSH60m0tuC
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX/a3EIuM5Ya+a
 dhmzbDg7gZu6dC+RYwauoxD3WhmSPikWMcq1MTitIwLg851/i3N0fnyHfUqLtOHYDbgvSLeJUhv
 oLqZIzi8/auafJe69ssJ3oGPnA3ZkfndjYcnhSo1UDHk6CeGk5wWcHmTqeN8D36CnXBdViNdlsw
 TYJ8uBUnrKuPhB0zivcpFgACLDLtKW2EnBo3eP0pMT20fQGC6tBCDi0aCOx98dEIEjx6mcHF1sP
 gQmDSsvw9otje3dhZ8Sl5z/CrQ8a54Fbb4/Fl4XT3fV3MiIjl3Aw+bvcDQ6BPcvrilBZgAsCNAV
 VP6GyqsYM3ABeNQ0Qa9KXHPq83KU71Sh3L7W99inL4nEUNf0M8DOUI1wZ51WKCGfAM2Hz049dyo
 SUlXt6S/nBo6xHfiPNuAIYmqmcuogAlc6ljroe3v6Fqe7PtreRFatczHD/6TiiUT3XUJjX+LSUG
 DYWGI4tHEX2JM1libXA==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e7261 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xYyVevvQUQiUFKtwU9sA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: f0E9cNMFn4CrwJjIhX0HPbA8AzDWWGQc
X-Proofpoint-ORIG-GUID: f0E9cNMFn4CrwJjIhX0HPbA8AzDWWGQc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX80pOmmPUR7y1
 bVpyA6bXlwGc+ev07jmKefPyCAHpJEAbcrh4BRrEXytoqNjlGyNQI9eH72GG6xGQXpeyiWaApr7
 s7yIZqTuSMWrGpQNdwNsEC5bvusb/ek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070088

Glymur's camera subsystem hardware is a functional subset of X1E80100.
TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
three CSIPHY instances versus X1E80100's four.

qcom,x1e80100-camss is not used as a fallback compatible since it is
already claimed by its own binding schema, causing a duplicate
compatible warning in the DT schema checker.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..3585c63c45848793696fbdc3004ddc867a5f115c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5758,6 +5758,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

