Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B083769E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973540; cv=none; b=GqP/Keb6mHjytvK4XVpHvhPykZevw4w6g+vA8S+xP7AArdFyQBll4TYA8OIOBv4LZkiz0MQrTuj+CvvFAdzt7DpoVwnurV3+9HkKi+QozApWaJRHJz/4pWwC4O80yt/spPECNw6Q2s8RCVSTzGKdj28jFGQcUWCtErPg/pLKzyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973540; c=relaxed/simple;
	bh=fUNMC3JGXhbiq9Y6lFVg/e1xZgyALQ51mRBs5zUcqVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OcapYxUhGjc9t47xSXgxZlNvX5R6gX+JUMFqYjV54Xu0j06DWBTG7jS0rsBtZO3bfcQGC1PI1e9oYTEj+xAJbF1kStDBkJFNQNqHZ8if1qQ5extR87/jPgFs9/mcp3SSlQJqZnU/tBRrN/Tn9sj1VzfaH1Mv4iRd3ww4Tqs5jOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mz2jlQLa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8g3Iubp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mz2jlQLa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8g3Iubp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZRUe3490672
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=; b=Mz2jlQLa4MitRAzN
	o6M8FFA9Apdn7otmOjy1wkaqlS95thEvUQ59NLP7sSNqVNUiSV28gv86ZdstVogf
	7vMLDLsBOmIBYWqG2Y75Xl2zaFqNoMIIQN47Wp9J3nmVHMSY8GkTy+b6FrmR9krI
	Brdah4U8ibKssLiR1ns7yZUlAqOXGFwKrBO6g2mh7Ca//EBPpDmuxBpftEH6oJW3
	u2QIc6F8Mo3tNyTwmjHCmkUzh9osLjDkOgUP5IX+A6mZjebsGi9U6nSNBGpTX/3k
	M1q2xMB9bSaOFTIBi87QH59LqU3W4XI+1bQQOZdV248m1HZWCxBYzjPqeBU+x1fp
	mXDyMg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9w07p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:52:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1a439db36so2428328a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789973537; x=1790578337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=;
        b=Y8g3Iubps4/xlr8vSEkhYQDgzWw35QkKVHu+hYVebPeTQblB9kume7uzThsUTc5Vnl
         Kky+fi0uREYM414iph2MdJiMJufHSExn8e9+4Wiw1YZwgqVt4yAoRupOUoX2OagE3bj5
         szJAHnG7+K59Ew5JDux+wdGPCStWO+CK3/QGiNn2/ZXavnxU+AEFmXDrtdxu9JN8VzbI
         K2jHcrInstCKGJuw+mpnbP5FqEGhMP6RrPc3YtscNhvorDYVvVSsQGjOqIWHlht1IH+a
         vxnOpurfpBkP98uJMB9+V0zklJsSe1zoZMCkPasVIy6MYkkh3rYr5FEZ04kN+A8suENo
         pzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973537; x=1790578337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=;
        b=qsw+lLxRf44WzdbSzIrSf9RI9Xvs7KwO1138MmjqEMZMjKgxHRnQIIXNNM2ax0hS2w
         Aqa6x8ZeqID/lnzfeCfeN0rivMtaglyua4Zk7Zy/r8J70uZRiLNlbACwxhQNY3jGQ8xT
         +liyuAt+IEbBTqnlXbdsg052Yh323I8StaXs+klxk+TQsszFHsesQXWueN5yuz/J7LnH
         uhKGVFkx4bedTrJsoK/vj7XP57yE8frxcKYHXeARL5eDROZPfFt24nwQ1ztWuqP/TMD3
         NQXkX3axIQYPIcW9Km7Z3g94iHIJEOCmy17fYBZoro28+r+LfVjqjhDxiqCT+eAdQ/4X
         SlyA==
X-Gm-Message-State: AFuF++mqatxwVcCLIuDkjx2YPR1vTgmWGyZo87ro2vdXWjqAvmltiIaF
	GMgAlCb8r9pwXn6FpJ2vflZ7sVhxkewb4miAKdruFs4cBIU51CzhtYtSNeFggRiFXhPNqAfjzkl
	EJG2MUHMfOEQ+XeGDtHgfVxzXjn7gTr2+IZkwwfFZQK6bsi5ru02tIKchlORPKxWqb9YWMAkJsi
	NZ
X-Gm-Gg: AYBFou2MXCxCuw7n+KF4vRKZlmdWk/nxxPGTm3B+KoN5t/WGWi4Uci1Q/WCwctBwqN/
	Dk+N5NXhHawA2/vmP4TJC/n9gTQoL8y4IZACriwGNaGfqPCUFzxJZB3yyqk57doNgHmj3CnkSrA
	kn//LfpQXl6XAaVAqzOLhGtHosTdtic1THC794ulICYXsI5clBM6i6AKKjtpPMAeRjWeRyLXlBS
	qFGSLP4yjLLNst3vxIBMvS2ZQyJWj0ijZjk2eCIW6GY8ghfpj4JINFLY50hDMWR0JmS34cX6KBo
	AhnH8f/lrpB570vaZO7OdFNc3vusDtlRVDPcXgmwSEC9lGxVFYv/obkmPq1yHhoRozmKesyBZEY
	MC3duwPg+P3teETlCuibl2iChDN2o+xXsqezaviDC3kxJkfrHSbjCSLJ63MQSiEaNAlkMUYo3TJ
	iaqb3nu+YySC6C9nRhw+41VaOqD1y48N9Btg==
X-Received: by 2002:a05:6a20:4307:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3dd8c3fadabmr16962964637.3.1789973536994;
        Sun, 20 Sep 2026 23:52:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:4307:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3dd8c3fadabmr16962948637.3.1789973536618;
        Sun, 20 Sep 2026 23:52:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31342975c88.15.2026.09.20.23.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:52:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 12:21:52 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: add few more SOC IDs for
 IPQ5210 family
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq52xx_new_ids-v1-1-63d68a11bbff@oss.qualcomm.com>
References: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
In-Reply-To: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: N3vljuxAVGFVFipDvCTIQLE2KBZLK4-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfX/3n30scpjaT5
 qgtpuOixtIxIha4VnW0ZlbL3XWbqot739jJqxXLR8K9hrIL0JaMuLuFgX5YtxR3dq0YJf4ViMeq
 9gZNXnQ84K53a2zw/F/qPZVY2GsndF+T9sq2gG3k8kObZwEWHFQrx+ULs/bjglHVW7hR+5bmNp4
 n9HPLYRiC0SeDTbXUb6SJM7+SJA3Pvc+86MT4AdrDqPbxZlM4rtD2lY0cUvH8j0SmZwd9p5RcQp
 gDtkIZoF4s7LbK0IaNvNo5RVdPu03Y52RLULjcE+HVSHahq66tSu0pWLLDHTRlmi2IGsOCKc2Ca
 Gl8iX5pCMkCVJYS+GTfQfaMpVoN9jcpZiMBZpZlmcoEhMbOiQs+bw0IqunCIbv6PH1WiqaVx7Xy
 fDic01NF3pSgCuoVZTNJoH5FrObUrb1+568AJgAnp66sYzNONSRBzr1x58jyZ45wwcZssvxJbeQ
 5z0v1PFkfyIb7aSRD7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfX8ZPeCjFUnAcj
 R0FT5UrR2lP3i8t+M4yR9GpYl0spoCoQCkSUf2PKACAusPxK7ZlF/p8hZjCuwn3Ph9MIkbKFzyU
 m1HtQafVNXkBTx5e63A+qiBz7Hckv9U=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6ab0d421 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ieg599Pkg-FuY5gSfokA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: N3vljuxAVGFVFipDvCTIQLE2KBZLK4-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210097

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index b63e4a0b8e54..f251d4c75612 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -317,6 +317,8 @@
 #define QCOM_ID_IPQ9630			779
 #define QCOM_ID_IPQ9640			780
 #define QCOM_ID_IPQ9670			781
+#define QCOM_ID_QCF3211			801
+#define QCOM_ID_IPQ5211			802
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.34.1

