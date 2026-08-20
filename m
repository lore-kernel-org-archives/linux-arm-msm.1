Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C153F3265
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220527; cv=none; b=tUTWZoyyvnY2cKD2ge2ztYccDaGg4Mn2lFVTxF9mVWfn/86dwUXEnayRahaDKOw6ZoBDINPFacHlAhRfR5DDG3+vsBz1rhGI/dCVQMtmk2ALF+UlOXl2ze5cm4H9HP6Nwx4s5xfgc5JXeGSD5MCmRuriGohFUAhwk+cPzp6Lzu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220527; c=relaxed/simple;
	bh=69EYmER/wRYHxroWVPhTseRMEty4J4R4DEbNjzgmx4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWWcR3s9mh39GAwjzOaA6+4xKjwW+bXmI0iaXzo+w0EOmIqRNJMn/1e4kw3SeCKScs7eOCFb5XA5ci/QApTqylLg8/pgx+t0L37sk/lPhEL0olXmauCQvkQecZdpVgD1ZnXnxIaojX2cI5SxOKzsfb5MJ9amvfnvbviNeCBxHwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiLFARs+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=glDiipKW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiLFARs+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="glDiipKW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PCjK2465314
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sdg2MSHTNk13HxMyEH57xxyluPn1SLLVt5f8MBbk3wE=; b=CiLFARs+j2VlQvRd
	8PK3mfDOrfhnwTGWnVFea/iFT32MFq8lXj0LhEXw4AljHtsd03NBKp7v3h9F/Wza
	6oo24Tg2AdCLLsk0hZX0Eb+5BesIUXTdIbHUzY0ry/Tacnk9tZ4WT6ckfTvAuIqa
	XtYF+0sdYtAqEjV2ili27h90havq6vHQeg1etzlOU7mv19+RUxyOcGC4jFk+eu0f
	34iTkgKZPGCL17hP1YW4GA1iW7n71uhyxYaXs+keroCU34i/w4B4IVY3V1SDV2yB
	jghJ/DIXqmThI/xPaxwsr8zZbR9gFGTbkLSDyZIEuQtW2JblZ7W+yqAqTHhvqyxp
	oi0xfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29gda8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so421678785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220518; x=1787825318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sdg2MSHTNk13HxMyEH57xxyluPn1SLLVt5f8MBbk3wE=;
        b=glDiipKWmJbxGTCeMXkooaTLIsJ/iuMIEe51MB46a7QBh6jfc0t6XUDU7TOfkV5zPz
         sTaY/w/ZrP8n3hWcdJf5n1yoeE3r5AX8PfvQAgfySjosyhwxttVIsxmI2FgYR5QPnsiF
         BFbG/QZmFRoAhv2OvAGjR8DwmhPrWBQgy1f06nFJtL4SFKD4vecsu1IbEFu601vzLf9W
         xi6u1uREMZWBvquK7UJYr15gdatUFQbdLLSZuuqD0ELr8ig/83nXBWV4dBkxmq4T97XK
         RuhYlahxVl5W0ZuftQQbru+v7malMfPIGc+YriA4dIwsJp83yHFisFE29dGKFWJAzvhz
         QJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220518; x=1787825318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sdg2MSHTNk13HxMyEH57xxyluPn1SLLVt5f8MBbk3wE=;
        b=FzmMLLQT6bwzs/G9uA6LtAzAGcuw2JYCGaGO7KFjhZRUEemKde3AfK0uO753ciw6kz
         Hetxl0iqgCZlGwgK9AY0LeekpzgDpfiF52B3LhrcRZM2sC3tDtyWA12SZ94eXzYYz7+J
         +qD0uY2gHqm3VW99X9/peWpj6+FLioazdyaiA9zDLeg8/VnMz8mdB6ivq0k1KVTsZDvT
         OPWwXU97+Abw6vxVSZgIt3Ws4weGwdsQ+GroYm3Bbx6LIACeaMn/mRy+50Q6iC3/goIB
         CnW0aVGju3ka0gLNzLFMV8V69I11pH81R4bp+txhCxleTccHAKLkgBq3OqDXlog7NPsj
         rDxQ==
X-Gm-Message-State: AOJu0Yy091J1hkwgLDqaJNAbNzB8M6yrhj9qT9S18skiQTEIxrZ3F+3b
	W+FbGQUHJRGp1wMZ+XQS6OqmvWL4Rt36CUHQB+LK0nuoa0scotZiELVk9q13+0Qt2/2hXFjk9dZ
	wHCL6C+0B09bjtv67VL264ejy6He1vaFy3ZwYskAik03VTTbkxJRgXqDCrSXv9fMU0DMqve7uEq
	tsu5kjBQ==
X-Gm-Gg: AR+sD1191LVbVhZyhzbSDeXGLuretH/q04iXF720a7YTm/LpTvdaegZ+L5HoZR6SLgu
	P4Nam1PqRF9gwMIfEsH+IlSqBq3n4eBf31omRba20YaahE/Z7ZsBBNWsDJgwHIACYqghMRojNZ9
	J/WBAZD7V3c1sD2/ElXLzhN9g7v5eCTedHbgxzcTIcp+86aSCneXmu5mQEN9eLOG8FafEvW+CB0
	UglT8IIysZcIBHKFqqDmI5HZFMtr8qebUBRB/EPxfm81ghXlWRiW0EGSEMNvV0XGaQ5jOWK2fa6
	F6jkL8iuUjhuhupfp+/87waowba+5WH8G1em8dQn2kCpnwsa+C1TN/4q0n8n/0/PLaFEIZYCe/u
	HD9XTy9wV
X-Received: by 2002:a05:620a:28c6:b0:930:f129:1a45 with SMTP id af79cd13be357-9371e2ccc34mr1085910385a.30.1787220518287;
        Thu, 20 Aug 2026 03:08:38 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:930:f129:1a45 with SMTP id af79cd13be357-9371e2ccc34mr1085904785a.30.1787220517788;
        Thu, 20 Aug 2026 03:08:37 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:04 +0300
Subject: [PATCH v2 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-1-e67ea30d8b7b@oss.qualcomm.com>
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
 bh=69EYmER/wRYHxroWVPhTseRMEty4J4R4DEbNjzgmx4M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHZ7BzeuiO0ZRPMYzN/OucaVTSTUcO/WQgmi
 ZW3tbSrFiaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR2QAKCRAbX0TJAJUV
 VvHdD/9JZRF6rbmu+efL1lo8dvTA+btyAIjEY2J4+o+f6ET/NM5IBWC4SeiFFM6Eu8Cjtkj4t5x
 lC4UYkJl9rKw3M4Hq2DOKZYNj843EZYHTqn2/n6Bf8lyoq5b+SK/87g7XUWwrBuaVpFEPSYnGGS
 /taOI3M5kzEkOGC881Yu8dbyd18ZopxfFPZ1aPYO6vSx1qgD4P7yy2eV+lwZc8wwYIrCkzoFJhW
 Pewu+3UOK3KCSb7DV2fsNKR4/8DrG9M4H+3csDWlQbKhmX/ZsZIvzgT0nmdYs4s5I97FzaBOqLX
 HdYKD1cTekO8D7bCqa3gWfg6GX1ldkW9Tl6ZS+1N1yd+RRCYmBTYdxiM/PFiz3dSuMNJR7KAmCe
 uG2l3whw68zbhLfRtk2xkv6CxbLPvtY6EbH5feeutXcAb4s0myxTme3uKnBCWwS1bUkOeJTTv2H
 SEJVV0p1t+6oDtKB/oU3V+edBctMU1Ksbj3ceDrGun1E2c1F3nbnOufixJIUvsVYGZjMUAoZ52Q
 wXGjOCngO+a96Devhj4juiGuXhNooOCgl6oyZyJ8FK2jZ5iTkaXnztVEHoJm88FkiSnqtz6yjxw
 aXFbmrfd9TEOMtFNSH9z+qnApzRgbGs68n+nwNZP4CoGKCTnqg9xc3Tx57vRTLXnmElLzbE5wye
 TatiTLP2Z9yS4Sw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: LWf2pPgA4LsY8BaBAZeh_kGblrwzKUOR
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86d227 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXwjZYemxxCrMZ
 LJH8QzNFA8uUS+9RR6dkcF7K7XtWPEfQH0dtnlkwxCPJyRB79leC+7GaHlX9cQ/zwjyRrERhRLy
 Ir84xSb1DdbWbct7ZSYjgXnTHWe2rv5MwdJIff3RP39+ZM/diF4z0CWSAn9bESUke1cRWyKDLx0
 FVjKWCMjQJucb9VG63D/EbXdXjGVjtgBBVjfoiWOwWPJdMUqf205vf5CFrOzV7Cw0HOINY0wBma
 n5L1WkkurRNfC6CjjsoEUIOQRFXmQwjDn7FDBAJHTZCnyo7Mv7afO5Rz3NK9SnhfVeKZWwHE0H0
 tQ5umWIXCE35nlP4PSWDv5FSG9gnt37e6T18JzwkyZIlLqzeqKV5JFtL/nZ9GdumevljurTXLmk
 Qd8EW5fAJjKjL6Q4za4+VMFDZ+rEhSgcDyPQoPrqQ/SOepKiSOIg2q3LgAyMqvB3ma/9hRyFmHp
 J2LMTlLz7IrFCFInJYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX4WV/OXsTVJDv
 dF58xKRgpVsbuWsLg2PyxLAEa8sZK843tyzrtm4Pym7P+598zqUs3hT+CO0Sm8KvtQ3J0giTcL5
 Wm3mjEaqsZS5q7/3LCfyYgM36OfJwek=
X-Proofpoint-GUID: LWf2pPgA4LsY8BaBAZeh_kGblrwzKUOR
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
 drivers/clk/qcom/gcc-sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 1c59d70e0f96..86c2be3804c1 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3618,6 +3618,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.resets = gcc_sm8250_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8250_resets),
 	.gdscs = gcc_sm8250_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8250_gdscs),
 };
 

-- 
2.54.0

