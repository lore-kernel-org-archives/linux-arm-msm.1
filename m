Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4627440E8DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220538; cv=none; b=TzTz5WNj6/jk3BiW3xMK3IHRAKmUjKy7N5ihIQ2zRqr/LSGrWg0urnMkZDE17vzJR8kCtSEMspuaxDQzw8dDUbM4nl1tjG2cRPEx7pdpF0oqglqniAwvRo2fGxaBemYub2IiA2p6OVfx5Vv2u3ie2nXIdWwi/GGspFeXOioBdzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220538; c=relaxed/simple;
	bh=IwT34kSLVHjVkKs39Q3jyS4BIg0aB+2aavdEaDZRWWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5pkfmNZ/CHC54YRkYsTS3a0qoOOoMMB2/Kzkdc/AmIsdjvKh+xYNkjlJAVw4gE7dRoMHFikBowwT6v/u5fR7PbV7DKIJs65+3g16VQyeWTzdx1uGRQ+OevSxkKN7HYs/KPQoU48Z0ffD/FHzwoR5/2Mqpf0eVvPKi7Xrz5Jv0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoXp3nqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/FRU3Bp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoXp3nqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/FRU3Bp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PCxR2465321
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tM/0TSrpcoDvVWBg+pgYYRSW5nyeWcLn24KBJNgdwOg=; b=AoXp3nqeauyXk/tm
	QjgmHjRL6CBbXEVqkeJxDFdMF07xT3qcfwpSTWl4RwbGmxW0gSvpHdJquX9uWHzp
	b2NV94oPmC/3RSbG3Ybb/tgd/Fruq+HTdH/5UTTThSGmcJNLuzCWOe8J8EQS/qGE
	sAvAjWYaM29tJ1rIKC0RtQpWXPeA6xHWHo4/QfxWzVPw8DxJtU2oiKZjsyB9ETUt
	bToGrpMUlTBbb84vfb7+ALzAiuKvX/PDAdHI97iEXL8Mh4PMKU2IxjIe2REsTrTe
	6vl7PbXi+hv4+BfD+Yu4bRAfR3eW4SBLJQQx2AJMmv7wHv2ZV0kMWDHkp054+8Sk
	UUMeag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29gdar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9372b9db132so80401485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220526; x=1787825326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tM/0TSrpcoDvVWBg+pgYYRSW5nyeWcLn24KBJNgdwOg=;
        b=P/FRU3BpJpJ/fqOR2hmHxhmOZNKAiTdaXQ7X1rn5gRlSlKp3+MzUNN7gQjM9JwpYCu
         d8lWCpeHgd1nt9qvnrRBBYmzA5zZvzRiH253hKxOe5gamol6DjmZdEwTrTMFOXG8pELT
         j+fHpInQXec6xkG/ChSHb/dcPthBBsd4pQElI6Myzj8jsjYxq6b7v5lpEUrEtWiupdmi
         o/MCvi6Eo82/SvdhI0DkL9lTj6+5QICveWrFfl9ahqaT4nWxXsVWMMjW2N08vT4YwJTb
         j7kz4q446WaYeOucuRXtmz24hQiyGEYAFpvJairU7c6HLNEFkixxNTpmru/A0ZyCAjH2
         6s6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220526; x=1787825326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tM/0TSrpcoDvVWBg+pgYYRSW5nyeWcLn24KBJNgdwOg=;
        b=DNSAzw/jh2Mcyy2FXKS18tC6+PgVxFHguGqoF2g4sz7QTE34/xyF4x7kyUe8uk+VTf
         tTekGSsKdINCFv3kdxJDQtMLbKTjGB7BqHnux8qgy9EnvjTSbXQe/VtdF/Bws58MRuRl
         /kx+doSA8Y3obAK8uV5tNE5lYrsrGYzg3AggfxW9pragSrmlGvpy7MakwjyX4np03AtX
         o1wyIcvtsBC9J9tMYi/nOhCyYvZf17rT9R4i+BNQfrXFxs7HQ458l3FHP1bvMiCVxZg0
         K/pfcz5l3pWn2RItVs/33gbMuyScfZ0omLHaBAI9kGlq1QpBnqy1f7DaMEN6JjMyx6oJ
         Olgg==
X-Gm-Message-State: AOJu0Yy9SiFprwF7xlFwh63MFNFo1/BGspOT+j+GcbWJ0XURE24/eCDI
	npeOq+MZNEH3ps1ZJU5PPycUmYlMmNRmupf8kDAhhz0qGAM3QiDPXENTCmL4TlzFlY80KuTt/b8
	EEEfPwCglSbEMW3UcCSXCWVu+LUQFcDP4/IQUGeVKhRuA9+B/isuapiQyIAXngbhdCfZg
X-Gm-Gg: AR+sD12qdfMgaWgPsT4AnenlnmYSpzc/EF3p2KXgYlKBNfXCChEoHnWTsyY+mFtF5Wf
	gYobPdkAUdXF6BChl3q2MEZN9fU8c7myEF2NviGquU6lTlFv7VOLfXQ/FCa5ozGx3qfzKoNGb3/
	I5dZ9/+I0N44BaHu3EMzMLW9bR+ZsTce4ezkB7mQlrSowtub3Umo+7MrlErIOj0Khn+iTylr8b6
	Wt7dZcy2PaxKe6gMJBpvpfEzvELewcohFsqI3lRF6Z64XBf7pl8+r8o4XJjk/RWw39UDMXHWK7d
	tOLHrSON3brhqM7VU1xm1KrcccRW1CvyCJYCjFmBGfiOsbBH4Q0Vu50WaxlR3gfYQ6/uivI8bg7
	Kj2elDo1y
X-Received: by 2002:a05:620a:2810:b0:936:cae5:8b38 with SMTP id af79cd13be357-9371e25434cmr1098532785a.10.1787220525993;
        Thu, 20 Aug 2026 03:08:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2810:b0:936:cae5:8b38 with SMTP id af79cd13be357-9371e25434cmr1098527385a.10.1787220525486;
        Thu, 20 Aug 2026 03:08:45 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:07 +0300
Subject: [PATCH v2 04/16] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-4-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IwT34kSLVHjVkKs39Q3jyS4BIg0aB+2aavdEaDZRWWE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHn8i2H/qCpb37IaOqj1SPDcl1hr2n05+Sey
 WkRz2cd1qSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR5wAKCRAbX0TJAJUV
 VuVmD/9bSgs7EqSALYYs/hosX+iEhJG7KmYNXev73ujJ+ozySAX4gV8En8zu6Nhh8tSfV/5qPgx
 ODva9MX7bInj6Xp/r4MkTlC+JTIdrSodyVwGzpfoSWevN2SfUvg5le87xYIW9RlBWlrJSKl4OaS
 avn3HYRalwoHu//BNPx1U5BhikUhq1ZZJr3jY7bJYTxGZ1QXFs13ev5KfSLKTa73yYMUGpG/qz6
 YH6ws1b99LqFuHxsNRaOja+4funr9xtO6CwFbCr+KW0gHRXhrHFtVT9ydRjpQgOViFhqqUDTdXx
 bmORdmRP9eB5tt1o3FT7lfIhUadEbJg/tb0wRir2G2uKA8GdZP3IoOeYtGT4LhS3ZZiVlxgtBBP
 uwffzK5LgcjHSTc0TdIahIxrVooaNg4IdGjUnQqFX38iTlUrw8QUXZMUGXNdK00IFb5WdQGxf7v
 kY9xFMD/2Jb6hN9mAgwKECRYUoGytEV2E20g98P8Kh73OpNKC0/dx6RqOYvETxsDhG6bEYAqHx9
 e+GlAJng8aS2oCYnIM6akG92z/PX9pcGr5Z40y9svawStYEnwM+Z0W5HI9BTOFs2vKJZF/BWies
 7PGWI33qfXOaH3jgPvuy5fbhJ0JOvojkTxlAfwbnH+sIZ9+C1D14xDRAbfMWIAmTCaJlbZhlbWy
 szqr2B7ULAFfZYA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: lb6qJh0swR-CPVcA-Q56RBPDPks0RJ5_
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86d22f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXyOOwF56nl0yi
 5l2LM9pZoJKXwJ7CNtK1hecjQRuRvmG1/1tfUM0yjoNCS628OXaJSS+qE/cLdJbCH7L6UdUk2Gt
 oAw8vWoDT4ZaIrwlU10zRpt8qUVgHtkegsvc6BWvlHHDGNzvqIkSNa0cJJlLz7XruzLlb75+OpY
 jgng+pjgUkO5xAG3dNxFA2kByU1lNxhZkYtQWpAERgrCpHdacD75+PFKz5Kok/J5mJbOTteU1/O
 Yo1OgR6gw/jSt9MFEYbRWk2pDgBTEYkEg70RGsOZMjLe7dSo3Oo/bWXPmNk5DUgv4rv4lGFpV0c
 dZGe+OQO/HulCKckFnuQuY0USh9VAQ/VTKbVDw6e1u+z0sr3TCBNbtsGg94tnd48e8tbdsLSVer
 2fmXt0DyCff9vjaDREWGv3TpEKBf+AkA/ebEc7bCLetGYxXaY0Uav6tO02apTrDPGdqb/3mZW+x
 OhgbSvnV+KUmSy0Ezaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX/V/tiSQPHMX7
 O47PuHSSGfqPf0/cJKmcjXM+f/w9bDLJDNyP+1/pjmdl53kW4T1Hwm22a0V+sNN4egcSrHMxm4b
 KpecEHf3hkoEiS2qsUV9ZjqLvedg+0M=
X-Proofpoint-GUID: lb6qJh0swR-CPVcA-Q56RBPDPks0RJ5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..427ae9cf28c1 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3326,6 +3326,7 @@ static const struct qcom_cc_desc gcc_sm8550_desc = {
 	.resets = gcc_sm8550_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8550_resets),
 	.gdscs = gcc_sm8550_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8550_gdscs),
 };
 

-- 
2.54.0

