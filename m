Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F55364EAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640079; cv=none; b=YN5wdXVbuZCDwZXRsa7v0M6bHlr/VXEa9N+YOQ/ZHzLI/Vewo/t0LQPYbY2zg13VFWjMF9iPYmIf5WjjIZYAVa+rPQLmCNTUHfmhmRAB5rdI/WIEFzLUp037M3yZ2/EDEQrKB7N7mwqgXBW5XpIDBh9k2YnvQ9Cjf0vrePkcE6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640079; c=relaxed/simple;
	bh=0HO97leHp75Uk5lDK7e236r3uBIsuf5TqmqiuNpXoPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CQIsf8nfr5LelhFscp7WkwjLrya/LOTu7u3vh6yAJ6qBplA3PjXbo8xnkURDE3KOgnFMUL/UWMRGcsJC5i2+WIQfB4k6gSL/vua6BFZo5ZRlRXeBieDQOYfZcENsclfwdGpj8aujqCSZOl/bPziwskiuMqEQ5pfg/1QCesILxJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6Kn+zQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBJ7GrEb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6Kn+zQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBJ7GrEb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAQtLC2502688
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	En8rHhEFa2AQPtYmloWakD56oM4Ac1MosqTfK028sLE=; b=E6Kn+zQew6xbmfVS
	dnmqx3lXbUHKIamYHIqpOEaBzvTQKXd6YusVtQT0PFSNOW8twJ1lE3rW78t8VZ6A
	j4kbOsLqLpwwBPlTDJ+Kh/BkOQSRBEzM6baYa+oWh4nIb5Wugr4hnROdiO9P2SMc
	KERCBtmjJ1YthzP0ydGw1lJsISOsYIQpiHqimN2AVeNsUm6j8U7Qpw/0rxmnx7fc
	tVT9Fk0Pmj4OW5j7q1s23S0fz7U/obEh9OnnayyFDMo8KQGKXbFuMte7HOUQ84YH
	iauaKkWNGmXKJHLBIkgV53NFuL/e3hSvW77219VT7ts4sXHmYjEEaSjCvK2w/kej
	tWfQRQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsrxqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c19493ac2so8910991cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640075; x=1785244875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=En8rHhEFa2AQPtYmloWakD56oM4Ac1MosqTfK028sLE=;
        b=MBJ7GrEbXWK1WZslDhM/6B4w9h7HUziYhvp/xELYQpt5LSyO2BBjLQ0O2+x1W9wDXA
         UP8FAM/yRAvqXOvjXxvf7CFuy2YXcB7tm793Ti/S7JQ+BBfEE8H7PLFlglVHCEFhnFAZ
         tja5q2T2C9nae3ACrUpoiPFbmKefjGTNysR4rUjosCI8uWYZvP9N1IBNRA2JIus0u8o5
         PaNQKXy+WOUwFlrIHwJhuXJqnsW+tdjtPRKWfptNY6WdydVBzZpLHU7ilgzVru5Xxof5
         5zZ51r92B1xdIwwHzuqosi4Qvoi118L/HFBz9/EazpswfOMrkSko1DnbIg6TBCTl8OaK
         ojmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640075; x=1785244875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=En8rHhEFa2AQPtYmloWakD56oM4Ac1MosqTfK028sLE=;
        b=mo145ruOnYL2D0wgXUs3k2PsY/QBsgVxgI86Nxy0oWJ+vqrc2HIWtZD7jmx1LYmbX2
         SVxTo10bZQmILfihIFE2jbc+KWOC3JQ0dFC2D2Fi544Jy1A0X/OzjnJ7EJ3+0bTJqSOh
         1rGqtVs30WhcpLrH4Ca3fS+9aNSMhTAWykrxBdkR79/xnu7WD8EHVXgs31fbpu/fT0HR
         ovBhjxeI7ARZLbz0Sig0SmN6U2j2F/V147rtp7JmpahBrwaBYyOMGbFLLT7u2ZCp7bia
         fzZp1BQwkTA06y0JCxVD9cXFlnQ2p901zcQzCwCmIFbf3VMytzOaJ9oQVAlkSNQhH5qf
         y/QQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkQ3jbi9LTUSVFu+H0FTbmA9oeSBrWtLs1y7ys73GFVl+7DrrnNHljdmr2su87fBwpXsqKgr+x+fgttYb0@vger.kernel.org
X-Gm-Message-State: AOJu0YyD/avEKG/erCy922GoinJi+TrOZZS/iKA/nk768zPy+EJYsrNG
	wJVJPiLK3k9DXy7YUdAooksI+o+NToB7wBhn026oqa+y7VrpkSC2k1QjO/P5DRhr0uIdZaP2yO3
	MXiH9GG5IXj19ddB0EAJCb2eAxjXLMN+Dx1KtwyN9/O5+xMqfm78QbjDeQPXNg/wZs55kFSy8H2
	eH
X-Gm-Gg: AfdE7cnuabZ032WHmRolDpVJuiL1toql0I6KMASchyX1Z1bxyl0x87881vF/J5quLGb
	OJvzH6jrKa6UlICVVzHCNmInX3/eNQw98w3j8SkWp2boKShnuFkCcdBBMTmI6X+3oo4E8QIkZgh
	vuaW5JDXrc7J1XTq71Wpqzx4ssIJ3cUVKEaw/WERIDPlNuqgmU/u2tI9VQooh5vHLUcvdRmdXPS
	Vqz8TbR7dutrwU/zGmA+BAadhBYhpF2kyyw/Bpc/QA6k6ty24GKyKTI0pxY6VJglLIjQmk1GajD
	2PXnbJ97TxIcVDJ5w+6YIhYzZOleOUyscJF7Exk/1i20MSL3BHBD/oY41G8gxg0x3Qg51X4v5Iz
	YIu0nSjFHAJg3e5cvki6VWftL122XvIlyOC4TyPgCbqEgHPxkWWhS7IqFTklNNMcdMTKTEDA7IE
	R9PToQv6FtxaiMz8lKTwGY0k2OOkqnsP06DC8YxsUmWsjmubyCXUc=
X-Received: by 2002:a05:622a:aa83:20b0:526:f9e1:9e4a with SMTP id d75a77b69052e-526f9e1a225mr8883911cf.48.1784640074797;
        Tue, 21 Jul 2026 06:21:14 -0700 (PDT)
X-Received: by 2002:a05:622a:aa83:20b0:526:f9e1:9e4a with SMTP id d75a77b69052e-526f9e1a225mr8883681cf.48.1784640074384;
        Tue, 21 Jul 2026 06:21:14 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm598326066b.34.2026.07.21.06.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:21:13 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:21:09 +0200
Subject: [PATCH v2 2/4] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-camss-version-v2-2-b2440d99085a@oss.qualcomm.com>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
In-Reply-To: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: m7aiworljf_XZzvDHeBtY1SoM6MANW4X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX4lHDDNImV6KP
 9Z1CDTKTkFx78lNVOuu/skP5IDNDoVe/6kLg+MLJfJG6dVaz5ScC4dnkJTflaejrjPSWno9bYwc
 uZY0buXe6hEqyCQ8S89870LdYcVIp0s=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f724d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=6k50daf3fveMbYCwvhsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: m7aiworljf_XZzvDHeBtY1SoM6MANW4X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX31i2lZhWb9J8
 qg+tQy3Sw6yHkAWYXIQeN85TeBEqEQv5l4POYsRDPJ1uykrLaNe5eROOrEAq/CrT5pUrRWhb8I4
 F/9S3IXPP9/HfhRntkMQwF/DFWSrlZuYEJfDs7jrxrKDvfdH5zm+M3vc0ETGOTPspKMt1uKU0rj
 83d31MgciGm6FnFgI1Oh1OmNhgiZr8sMml825xR4slPBBefuI7U9X8BFEU23SPX58W1U/n8o2d5
 hfo6aBKxBITeCSf705EEuqxtVl6kWdGxBgOZ97/NvxFmHHiHqeZG3txBoAw5FvdLzdwbBfWPj0E
 agwZF35KsMYaxN8hli3ixW9IDCdNMn3qxnn5Z/D7BTw0KDjngHv1J/WwoK8vjtGLRLIv59/WkIt
 7Uz8sYj8+DwouWKOTLOgRlOcf6rWVpzsmNXSXu+hHd3iQEz1yDBaFJl/2uNO6MIU0WP7ED2oBJ8
 vqf/8PXvnvSLSjT+T+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210141

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb, ahb and axi clocks so they can be
managed automatically through the PM clock framework (they are part
of the camss-top group).

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 01a9d4f780fbe130554601481bed50eac5978bed..a87161f3d5524a6e40a7281e28787538613dd9cd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5591,6 +5591,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { "top_ahb", "ahb", "axi" },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1

