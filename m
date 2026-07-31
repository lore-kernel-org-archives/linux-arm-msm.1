Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B23836BCCC
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478499; cv=none; b=WcBQivXFC+xf7OwgNM5c1d7+A3kWijZL8wmf5xHgrSWd5X2UGSZh02vHfnZeafFpXa9xe/XONNHpX3J2pLqN89ghm6iF336VUGzUTZ+8eRJQN8iTKPBbHlSr8AN5Cf5MhZLoS7ClsqjFK6XnxCL0kWJ/CfODw4/3dEeawh5jsZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478499; c=relaxed/simple;
	bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOZhn81O2e9eOy5OWUt6I2FaQYOGKVrF5XGKRB26igx1M4f1rrSAs52dyixCvHc3kgYyH3dcnMMXFuo0nxzS7WnhBUGk2xebeJzsCsciZI5YDQXz5dxPlbdaGeL/XUgqTMLtYan8cqAE4jb6i9oByxJf+yYequ65NiLR/uqsex8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkLR0aKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gv6KqldB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkLR0aKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gv6KqldB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V66JmL2637327
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=; b=NkLR0aKbHBJbWSkd
	epEzXWnKKZZ7rgq53C7kKaKv9IZa5szXalFAbQ7YmhSXaF7ePoSZP8F+Uw8GfbZ5
	+buhR1JionJBw26e2JtG77HkTGOjrn5sIcSPN+B9VZe/jYG8u/yVaRYVqnwHuYf9
	Qy7K+L5dt4vHvZTMyvjpF2qmysUAU5Xk0gkNosL7p/cKk2tBFKAJ9MsAdlESAAkU
	VRHxrzLdLW84ksbz2TWhsI5sEPIQOy8JcZvmBsIeaKgT0EL6Fq4cJqhrsd9GrHvp
	G9YT/dGqcJDj2ZRZILjI/XsGTlkoYxrvpHE1zjBWToqXP5g/l5gzjAlDubO11vci
	RE6lYA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp4y00w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1205418a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478497; x=1786083297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=gv6KqldB435Xextz11/WbJckbmnI0vcCtzMEI9aQLAcvkHgZdYW3xBPYG53/w9wtdF
         JW0sE6z9KHKbdLFoto4Hdp0bRRvXvRCUN5JMuSsCJfb0V+3Od5ACcQIt8QeUjDoIhykR
         MvVy8HA/0c/7c9vNN39avUaLGqDdmeF4z8zX6Odlg/Eu5Ad/EGqZLE+xmd2IusIth9SZ
         ymJ+dJFQAp6UsG/QWwQpj746W1xNN3VPMe5S9SmRTCyT2e3nMkJ5T7q+JxrbOi15urYJ
         jy7m1S5Ii8rLt2xYmIwtD6G5OX2UreToy+7G3uhV1lAJ70eTZaXUS2DwzE45H5rwR1MQ
         aqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478497; x=1786083297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=k7gaLMUybqZ9QH3l/0xy0sj7jkFuU7HeOPefMPrWsdOMCExDtqkRnCaLQ1lQ4ZgEqd
         JDvETnnDPYRUysKGFGm1ipnrIXqFnYxfxDFcBZiIGIrlDDcnfH63f8Cq9huXq8W2TtPA
         PCd/YUhxyZWWtxwwX8QjMZJkfc2MG3KHngiXXhEAtKRAyxKc0TIQNadaq/BQjf0HoT2y
         WiTTimqgOMs1/RBEZs/+hqJJf7T8XJOvAvM58dTg2y9pug4zTcJm5SDS43nU+hXB+/wB
         rMUAXaM6l3Cv9tbLnUDu9JoMTvycUKdSgXo0VYaJm1b505Ubbi7l/pJ3j+lWcNCa5xbx
         zeRg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8pcXJzLtPo6jMr6i2o7GqSSqJwNpr/4hvF7LkRv/t8O4+MeKAE6C4aozXzNLd+VQ9pCz8KLWLUsPdesTT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2bcW42wG+JoQFQIzZr/fsvGQ20FAVavRZSN4UH8cG5s0rd46L
	yDZOYIDywr0A5Gv2QpUecIU+VjaztMm8+ahZU3rr7CU/lQAZuXq0LgorwLnlgp2KvIgTTps/u+3
	SNLvFx5tZCQ86ddWJHMaDjEqmfJN0S2g9d3rRhGijnzWQ560WiBZXenAkl/ktTvl5eDle
X-Gm-Gg: AR+sD10iqHUvYCwh1gq0Pc+MolnIBxRnHMYJoVK7YslCZDARfAI1YiKvgX+5mol4SZV
	PKhDitSYBgfzSUw5yzrTqBEngMu+sRDnSV6CaOC9Zd1QL7p8HI1rz+cDLG8TUxZxZeK4Rg2pdq9
	fcGDia8LvEdKbPaDmr/FU0/Vu21eFavbnB+8SeO1mleCJ3+fX/CsnWk3s+baACQD4Tfvf6wZq9G
	yGteULaEfRJ9EznxjYroOs9qE4wcNnxo6c02YpiAALY0W3EWm2n8m1k51yiMKTF8lMHeU5CXAej
	mgPymSVFMOi0d5w6KRIUUy+mu1YGOfEpSmzABm5c7GaOr+YVysneaHcT3yxxZht4Vk+XKDE6uIk
	QnyosOL43Tv3rSAwn9h8vyogws8RlFJwGpC2+yulbcoO5TUvr7rJ3pKBMkTgLJGNC
X-Received: by 2002:a17:903:2c06:b0:2cf:b23a:3e68 with SMTP id d9443c01a7336-2d047e9cee5mr6443935ad.25.1785478496793;
        Thu, 30 Jul 2026 23:14:56 -0700 (PDT)
X-Received: by 2002:a17:903:2c06:b0:2cf:b23a:3e68 with SMTP id d9443c01a7336-2d047e9cee5mr6443605ad.25.1785478496338;
        Thu, 30 Jul 2026 23:14:56 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm719635ad.76.2026.07.30.23.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:14:56 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:14:41 -0700
Subject: [PATCH v4 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4-kalambo-crd-v4-5-e458f8b08114@oss.qualcomm.com>
References: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
In-Reply-To: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785478489; l=1205;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
 b=NMJ633lye0+QqfIMC2BHll+k35k+yOYUDlQcLNhrEoNYSzWvLwG5jW3M0qyJJQFabfnS6kkcx
 dGc2zQ5snb/BunZ0aajfVR3uWZkq2jtlGTbVCMsSHg6h+LxHNWUFU+Z
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=K44S2SWI c=1 sm=1 tr=0 ts=6a6c3d61 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: v-TlTG_6PlkiM9LSaGK2CVKwd_viKwjS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfX0gnm127bLSox
 Iztc/aBEts1C3venpQHxcXmBrMIrk4DyrF9W45cNMxx7dl2W6CKEUvW78dWYxTaq+MQ1vDb86gP
 fGnaIFXZJXz1GIdVIUGJHKA7t/+oC9M=
X-Proofpoint-GUID: v-TlTG_6PlkiM9LSaGK2CVKwd_viKwjS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfX3UDwlxWDyLAg
 m8h+Fy5Cr682DwdRBlp4UisNHCb5rwDZiGWmAGfX40P6V1PC/x1CUczM7uYj9/oji9bPAgdT574
 5d0fiv0A/vt2ozA9R8M70zMXBNsdoGgCwM2Q7zSB+bkJXxi0BhMgjmuZkORUIouTuYdROS4PRXb
 5qNwZRToG1u+Lefm+jFPSoNeFSqcSPOBuHfsupXuaO0qsL4usoZWf/WWvtkotnIokUGIzBtt8Bh
 qQD3PirGYm2fTIXCGHsfHqMHzbtnsKMBR1h8+L4pPtaQge2Ob8msJAeUNNfR2zM0FB+JJ6SDN6G
 gF+s5EycFFcSjdGos0Dbey3QrmosqxUUaFFZORIQx6F3sCH4UFwQzm79kBJ+0VU0RYVPJmIDpBR
 UVre5rE0QUMW9QA8U4GZ5K3f+9Z9Y8KCzYEUwQHwSwCVJF/caN/YozitIR1GKOcyv3CAxqn+HTK
 +ynXaXJdUoZPpbV7Udw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310041

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 0209a02c390f..c5f79210ad52 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -112,6 +112,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,eliza", .data = &ubwc_5_0_hbb15 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
+	{ .compatible = "qcom,kalambo", .data = &glymur_data },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },

-- 
2.34.1

