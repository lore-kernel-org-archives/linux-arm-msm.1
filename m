Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E056C480941
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246461; cv=none; b=BlBG6yRTElQD/1m5aAibifHbegG93DW1OkxImx+YvsZsTyycFi+6xTPRu/u30z50gnI2zZTgOovmBOsXW5GzCZnkJ0y9l4wzj9kijQsv8IrdrAth+uGkBXmU5cKB/Y4IiVv/RokGmd01AqWqOfij6UpT8eDx/tKiiCQHISmQyqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246461; c=relaxed/simple;
	bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvPbRShM7QjrC0akAMzhtbyYWHOt22XdcxC7yTppsOzaHtF4cTI0DnW/EMK+UP3t182GxDAD/8fJTTtrBrUZjkFPMmS+Dp0aU99M+pNSNdy6Ut2GlnAYkOAXBCyiBiB3g7eFtR2ia6sUrSo3j+oOO3qR0UZ4cCND9nhEEpbG2cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfJlkB40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMnXFiaK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfJlkB40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMnXFiaK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1Ows2857954
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=; b=gfJlkB405b++OL5N
	op6WolJSASwZhA7khx0c9jVI3MwYSB4FFeiqpxG4RRVc1f18cjtDUS5ljzYRnsBW
	VOVEhgGzMdtceodX3CRBuwCBxm0yppmTjLI/rHUMKsXf4ztDGTXqqaGhrLdAB3/O
	AIa8nlctt+CfYBLWwsQFxQTO+kn/q1RCOvvkXNywIEbspac9V4pFUtx6mNQD2UC6
	tUwOAxB9lXZdeS4XQbY64qV9zfm1GuaXIqOXJ1MDi452NIZxVJHZ+4QnmXjyrlwJ
	8SoUfBzOVwW0stqETVSGH0uAyRS9/jgRnrwvVDrBd38nR0xZ//BsJvAC9eM0HIgB
	CUWJsg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag58d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91258c6ee64so15628996d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246458; x=1790851258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=gMnXFiaKHJ8+zB+yjrau1fqCw2V5dwz7dCDDW5E5Kk0yHlkyxP7cq6tkXAgn44883t
         StUZyMb5g/2k+/aD7PwRpWQXd+gYfUkV+0pqNwjnPMr2KIKQ33zl20RZSjefglYGgwba
         mZ2XakWVSZ3O/HGBkm9yuhAtWJVY5w0a9yVDTIGeYh4DTYqbpHbtrS2Plsb3oELPWp/2
         zzFvoSIRJDBIFAUxrSDPqpxVxeY/D2B6Cybe5Mc6Y/e3/OlDWnXJzhzEnfN2YB/p6Jfq
         dR2ItQhBBmaIUREGJ4aQjyse+pEZRAOhsN1CSHszoUsCH+qJBzPamD2eRtNxx/73wE3h
         Oruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246458; x=1790851258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=q/Y9pJpBEGETzGSsxHCyyLE1HkpFypwiLjXY5dcHk08d8CqFnMdZRLYIMLA+dP0YzB
         WLsA1GZjpcjfTPbeYbBNQkyJM5+uOpL9HswicDAl1j5EzdaWirxzw7NZ05J8PY++8yEH
         Sq0+T1d4jdALkh2rnPVRAw7onWkE7ZpKBOxfSIETwjuLd7XZI2DKC1h/zQY8eM0qUHeI
         fruxRCp+I6GOo+qV1RquymieixBtoIpre84iA28vNLh5dev1FtxLJdhoCWse6SpDUL/m
         O7ZZbBquRCPZ+StVJ2K0ffodVmBHdfU8fOC6na2rdB9pZuiZn47AuIi7bixeBxq1dT+C
         s9XA==
X-Gm-Message-State: AFuF++lLpgF9V4d4V5NzEOb6mvmWLeoco7vL+Fq4Yz1p+b5fVAjlqLph
	EZTKJkv/O50Cg3+v+pOWEXf6YzIDRa8J9fbe0FB770OFGMO4WN+zVhmNbkzFsWkK4e3yGBli22z
	XoImgDPDO/m8PgFIhmOOcmwPRaOKmXnXWhnzYrMPtDjnZm3vV5wcFMzlS+aiencCcwFEX
X-Gm-Gg: AYBFou1qbsfPBuY3EUTcaTaG8tjSOTiaKWxeqbOdFz2DdK5nR018W0S+1h7Drxra6Df
	/4NeADpFrNk9yd0B2n9bWnHu2t+6N3iRXs4YkexQBLaTyJ2Nb6037Q8cuyjhKHA1JMSLIrktHt/
	K3EP9ijxMtATHbm5eHeOvAdoukH97+NUMCOdIzP7N8SiMzslGQdaIV8qt10Mro8ZxV/LSntxJEy
	jTSWQwBp/YgqB3nJ85ZyDzVXwelupM2yxBXFLczt8RLFbFPBAcawjNYS0F9SfELcjJ/K/lcUYGx
	v0GKLpqUVPluk3xgIIDYK/5w40ygOhYsDP/dLonEUa1y20hWD/fIv0Cmerh4ULhacQiWR6/tLHE
	xvVMAiFHT
X-Received: by 2002:a05:620a:2584:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93c36654ff1mr207735985a.8.1790246456958;
        Thu, 24 Sep 2026 03:40:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2584:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93c36654ff1mr207732285a.8.1790246456397;
        Thu, 24 Sep 2026 03:40:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:33 +0300
Subject: [PATCH v5 17/42] clk: qcom: gcc-sa8775p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-17-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3qwI9XIIYy6eZAKKx1jQOfULxdTshmcpiCV
 29TYHy4G3mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT96gAKCRAbX0TJAJUV
 VvzbD/4xw6e9Uo9c0purWmAoVYIptLOFvt++YDlJURkP1uCtjQxzJPvdaRCxuB1eh9yBJWVd5JD
 SgcWHuXoPoju9nTdu4smidfgRtFIKM/Rnfbsp4mTgib59WNANbBSjjb+g8klF0/on39AAWI3iCH
 CqRFLFPcbCfog/mt0O7RDwmNLzUrtcZe3wOp3/JjMJ3AN2fPC9ItmNQIwssAIdGgkG01bF7WHuO
 e3hIWHYxpO6rbuouIPU8wVkmnjZPnEQiOHjVRJuFSRfCnWpohmi+k4fkf82cxsah86m3k3M8mun
 2hsCacZQwhJnAsHQiO9sLvkljYiihjKoRBtDobVMboVAyKHhR6eQi1WuViDJ2VOialwj1Z08Xwg
 SKmbHiHzFiQS+Uj8yh/VchEyUpLWjSqUf5OHMb8TENmtykf2Y85ZbY5ny8PHVJXigmWiATqtbYi
 q8YcX5E0OO/slWeI3uYEyEOwkTpCxmTGq0NdEiarD6pE7F6Klg5zkfjNt6YZWFfKkMWC1QuWh5S
 dlICZ4bcZQWKNZaMx8fykCwsYDfB4pjcov8CTZGxn27QvFigLO83uwYkpFvxTR+jLAqtXAXrlv+
 i8i6kN6APOXIJxTJ5d+mZNLBPQQYXwTsRbcxKbw2tiZRgLDAQH+5oXgZLO4ot4P7qV+sZ7YAmZV
 6L2cX8mY56/LSPA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzSbqhVbQo2Dw
 l95webPkrN7XSgINBhL/kGUhLjdlFewAU4ND+VEalSMYtscHDw9Locl5jqqfGZPOE6KVhJvJHmJ
 Stf6DSIReLVwAdA+9dA/a/Vaf0uRomQiQvWLiDWp00os5wcoYEuBTxphZ7m13PqPbkRYgp/M5AG
 4qRGiPi+kTFEMGDm+ajPrRWRSjG3fu7/z5BNx/dFg/g3K40WfDCNWOF+FqHK+flrJzEZWJgmtZT
 V5MwVpB62RLPz16pEfz1w0i0tYPbvJ+/e7p4R9ONeZPFriFRokm3RVUGrg6aLStGTe/foNu899I
 zNR/Q52kgtcSisbd+osTL8w1bpjPJHCCekejObiD4vgmHS6U8y0auhCgoz85h0dywrr5j8A4loR
 I6sqteG0nUpKVI+jH6felJ/cyk6G2ZBVVMNmF0xJDhkCxY02ADpHDHTfv3MqRj4DQWrO5lJWXSR
 pwtNVs74V1n5qJqXq7g==
X-Proofpoint-ORIG-GUID: ZDqDT0VhTpQNL6HIsqnt9cKTbVHV03NN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXz2sCtgXVH9Jw
 Cy71IiZqR/RqUfae2U0X/xNCI4+XtQOadMeomlT+YOxlJ41+Cf64unx0Rgz62Xgru8p5CEVEmiN
 OCmeWbMqOL4eOYW7fqT/+WjIbN6OlL4=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe3a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ZDqDT0VhTpQNL6HIsqnt9cKTbVHV03NN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index dca316decd0e..2f867596bbc5 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4652,6 +4652,7 @@ static const struct qcom_cc_desc gcc_sa8775p_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sa8775p_resets),
 	.gdscs = gcc_sa8775p_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sa8775p_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sa8775p_match_table[] = {

-- 
2.54.0

