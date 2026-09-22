Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54C23E49ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051636; cv=none; b=Teyc/JJ21sBJPnkF0jnXCTcfcfNYFbuvCbiCB305wSpVjgSC8B/7c3hlEEJToNSJGEcMHnJJxILvUKH3Rc/y7X8+dMaTdRXjzggSTYEeKh9xbTMuF/MTnyzmb4cr4+PDALvHdE34WBKi3wXSSHka9S1DjbWhCW0Se5VikWphDmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051636; c=relaxed/simple;
	bh=+CrABi2X/StxEwnWst3mUt/1ibBP9K16D9ajzjNs1nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ah/nlwdWSQXsfLMFDFAHRj2RSLzBgtzN5Q7YIN6ePf0/iXtcLBxw9r1mjk+dHceqmv4J9AzlFVqC1QHzAz3vbyLT6qva+vY320UU4lAYI+ESREHsI1TxlT/sPaBQ+mB7b02UaX5mF9tMkeIKJBU0PJHKCyvmcTU/iI85E7eoXHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdK/lU/K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eajmPJay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdK/lU/K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eajmPJay"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00UDF3677615
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=; b=HdK/lU/KCvOIEeVB
	b8eXQ+pvxuQFs4/Fr2r9BmulpGXozcQQwxEsZZNsPVr0Cs6N5cW9rxH3AOgg/1Tk
	jp8AJsJ6a0o/PNKcUs0ptbqnt1ZK+Nup8jV0mMtIPMi4HzmUyVMNApvIIJOo5o0v
	uyPlB+0GyBiFTMV5jWdXVQHPCFCwSFLvOb2HH2/j5R8rZT71Yrq05VT1Y1ud0WSd
	oCdOo90e5egi6xAGcGCuncWz9cvM7o7TqQoBKKP9SzbZEgLhCygII7q3u0aBGFy5
	NAz3U1f2C/tOqo0jJSUEXXS4i2PUS+Ja2R+xOGD0yPyCgJeNb9HoQKDmWC/ftM0z
	FR1tvQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vjckt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:33:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b8088203so3208233a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 21:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051633; x=1790656433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=;
        b=eajmPJayqslaM8h7062zPfs2F7yDcfbH60Lsb3u7Zw9DuH9ToQqn3FrGNO3WVCqfbS
         1qloFmlhOn2J+2Z1iWc2LWhmToRijtqC2fL4YlQO4pigamWIrWvgPeozlkFhhcQ3BVut
         BkcPAQIJYPtkXDi8RRSbnhSPMjXhsbQiElqUTbYPpr7UQeEkY1tWAgp27zQtj/tzaZ8o
         m7K7bsLz5A0Na1Wl0OUzxB5yWwxIE6VBeqnuP6m7XwaCo13W16TSjBu+7qdZifKkIelU
         tF7jpPsuvw8vdLRkg674lmR8NWT1/N96rlq6dYZ05dSSlFTKIVxyPdXdO45dWo0Z8uda
         hb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051633; x=1790656433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=;
        b=l/1KyDUQLlvBBYq9iObazBoapd0TXUt4b4Z0cfECUTTnPf7eZuC5nUETAnNK4G/xpi
         4CPYIZ0KEjo4lrbQEM9+AVn9lNAIfyiirAMxD4aYX8a445Y8w+y1er6ubzUWB770Zhkh
         IWUtc1CX6+F6XjYZQFfHFZjQzqQhX29ZgGDXfWlD3Fl38MOicZgC4/GCGVI3P6ofd/Mq
         Q2QelmS+QFnQ73/tlHDPH7JdtVnsfNeMWkYRcHOKh/jaLHSNQeEkbUR+cCDBQrq8bH/X
         JgEFKgOSqwOwQoHWzf+Xa1qvYpYUhiHajnxz/Ga1TO97XxVhBrAJcikoOX1qoq3qt5g9
         hhOw==
X-Gm-Message-State: AFuF++lhNHHmLqOgY2/Vgk9mwQeqxWvamkEis3HHxGbuEV2lFdO+YBac
	peWgeoRnB4TnfcGVxPXTBwRS0zzkYuD4/Wqfo4i5inafVyfXTNvOxWxG/cAqPR5+IF50O7feWEI
	S+VSIAHZLZkqb1/RrfpNfaadOKgAblh7xNqaoqMVbVoxAB622uO1BZAGDHd+ECgzeIrva
X-Gm-Gg: AYBFou2cyA/s2MZ2aoA97SChQdUub8T60YS1dIdOFt6jqNwA2Mh4kESdme0LyvaiNmH
	Ltax8kbgaXLJ+qTpaSYcJhaFJeLBbAWScwosmhpv5aVs+L62E/8T3n8OcJRJoXHePyMqzc4u9rd
	H4enLbkveT3Gi5zbs0XyynkAIlcbOCN1y+ObuBX08xU0DRdtAz5ELi+tj99jzWH2pB0eq8RzKAa
	RgyToay/DV5k1GAgG+NmAqDz7ynYhRFy2rjAHKAy2CUQYto7je+3BM8d4PSaxUQsfonYYG7nJ0J
	4uIM0M9dHg5oJxmkISXXNnPO14CpNYDLD5vqEAaH8U6tFNI9SWKwMVA0Ew8f7aQuKLoUIAJYaZG
	4LhAyGpIgAzifsCicN5E8eXwuea8dx7Jp0xaSbgGlGdS6kkHfpCyh9w6p0jNy7ZELtjnQCn0hvZ
	8zcsLNfSi4snnF/VFnXFMqk2A4xFWx6+6qTxI=
X-Received: by 2002:a17:90b:530f:b0:39d:fcbe:c1ae with SMTP id 98e67ed59e1d1-39e54ff2f17mr19428377a91.23.1790051633400;
        Mon, 21 Sep 2026 21:33:53 -0700 (PDT)
X-Received: by 2002:a17:90b:530f:b0:39d:fcbe:c1ae with SMTP id 98e67ed59e1d1-39e54ff2f17mr19428342a91.23.1790051632870;
        Mon, 21 Sep 2026 21:33:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ad40sm1906375eec.12.2026.09.21.21.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:33:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:03:15 +0530
Subject: [PATCH v2 2/3] soc: qcom: socinfo: add few more SOC IDs for
 IPQ5210 family
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-ipq52xx_new_ids-v2-2-4b1a0f3d04b2@oss.qualcomm.com>
References: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
In-Reply-To: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX1PcabzOrdFPZ
 L+d5bNVHZ7lH/TNBJPVXJ6NblsduPGEye3iOTZP9/paS661AQwVbRfPiifUX3tM+GOlvk9rhsGA
 IGAXbAb4wnq4w4NMMsL+l71Zd86/OmU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX144lyeS669cz
 P50YscCr/pfhMo6KylJtBly0Mz/flO8q7SuPY1O8ycYHp7w7FcpTNmCmTsHpORX3epm7UulPKSd
 8pYw6Hpg6a8U86jwmKyozw00eBAYmp9hZYXgML/vGJRQ8ZB8jp0iOMst/Rxf1vgSu/SKoJ6N+JX
 iPC6ENCfg2Hd/+3ZAWWKI98PibfIhC+oQUPpThUeJ7TXMi5JHSJEOwPCBW9H23DbcFuXdlqnIh0
 Qct25W/LeQVe8KFklT2OiBBwxAgeA3OGFTeqXK2+Z3ZPrDi42oRis0YdXyz0ZZojALUIiWpVSdd
 xCD8EEZMRIhygc0cVz2smfSjdRHqnSsAfHCUemw93dK96gwGk4ev3l4B51jC3wBoYtWLZNhG7Fi
 STBLeqmhhUfNxREm+KNoCSAgnfpI0LMRLSJQT4kVzaojPWaPlPy0KZoZdeBnzy9u5TZA8hI5CSO
 ZbX9FLdv0HoT3cIGmPg==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab20532 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PP8aMIA6NNbLyI7UcOwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: vRRkBjATfP4mkWA-kvK8CABO7x-azy9V
X-Proofpoint-GUID: vRRkBjATfP4mkWA-kvK8CABO7x-azy9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220062

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63ee5cd561a2..4e7e14fe7231 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -558,6 +558,8 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ9630) },
 	{ qcom_board_id(IPQ9640) },
 	{ qcom_board_id(IPQ9670) },
+	{ qcom_board_id(QCF3211) },
+	{ qcom_board_id(IPQ5211) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)

-- 
2.34.1

