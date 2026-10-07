Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E7646A5E4
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363661; cv=none; b=ZDQmY0JgdbF//nA+r4P0Mp6nl2XYej0gA+WFj3x6i27crGv7AxJXkgoaEea4i7PkwUkt8zrik4Xz8z3M+9ZdnpDIAzii4wnlsyrkp/lJu84cXon67JNRacIp6QjPQHrLwEd0L5WX8UD+vIi3YrSvmF/KkeDnkFqguCea9SWxXaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363661; c=relaxed/simple;
	bh=TfE1HXDmuMQX5LOFZmUlH2YF3CEUyGNIm/P5CWo2OHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nM5HGatlKWSAdFXp6GsaohqxaUv4qF1h0ttgJOFiPJxgj5OwnnLiENORHwj0Lxu8lKPcbRY4yZwj5iJTHXpSDdWqWRLHisgGPeUA6cIMk7O5JmB6MZ1jSogMmQ+Sk2KbDA8wKaekABZQu5/Wdd8d454bm4XZ9utz8oYsfEqVcNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nssRJQLd reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nssRJQLd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977ja033810962
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x4NhWmEecye
	fJPvH2GfE/phtWfDyt95THJZwcognhfg=; b=nssRJQLd6T9/ev1KeguEz0/9p9j
	NshJw9FaeDC1vtKNwt+ztf/kIbgENyEabMP5q5dCwM/hIxSpl29NuRr5JWjP2JCJ
	4FeuG7yuJvKyXXzYHSXCFiBzx8qFMCHokO6cLVkOYK+6zWrcp1nJfrjiu3TowzG9
	MX+NDJw1CAiZDL3Vqa2WCbNiMcOJamMzcujAQ4/y9LIZFCWJEFnyPDParPetj88b
	+F7ElRtPcwgTZpSX0jweAo76TmH1A9wz0l0Wi9YQXA5vp9ArCnDVhWogI/KbaNYD
	/KELTE90T51lhPvd0j1wQyTE1sHJA/t9qzlWt8svx+q/sVgVK00TqvBxJKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrrfwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:00:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so443398685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363656; x=1791968456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4NhWmEecyefJPvH2GfE/phtWfDyt95THJZwcognhfg=;
        b=qSpTU9Zg6DhriMTneDn/ZWv0R/NgFbACuCsSlzCD/nHPiUgfg7hxrL/4xNEDYgfD8t
         TcwVjrjVBmFUFZqG1Tyo0WDvnwej7WqPl6suijih3+WkkGpIrDesSwDFIz/l5XOm3JDB
         2JTtDIu8z2AoKOv4w0UeSv77UyDsH/A14pe4SZ7xoFuzLRcCvpEU48KnVPYhR+wEzKIc
         nwMet12skydRV6xRCK0ziKlTUWtfkhIhRU4RtB+w4M1+XVwFdO8dRtwFzgGwlyXlcmF9
         xYUPum14IgMHh9GyQVTdravIxHIHWA57LOQ2QWhOCCjYJE5jbcMjXxjQqpL6Sypb/Q4j
         6LRw==
X-Forwarded-Encrypted: i=1; AKwUvByOQfdN0VnczasZygXY8Mp35L0LSFSB19db3BF93dbeKErH7eS3K69YXY13yTr5E/bAUqF8Aj1aiuBnUuiY@vger.kernel.org
X-Gm-Message-State: AFuF++k8KPVxk+h2lCljNxNjQwrFOfRC+4pz+6Y6yMvI52blB20JiZL2
	K85HWuJUZIFeijjjrlkPyxw+wF26bZcatkg5kksCkJqLElTu5plg4Q8MH/MCN129fEonMI/qyhI
	vQ0NmPZPDLf6lHKBt6kwviN/JMnN3VUGQn7794SBmzR71tqFhkUgCGTMhqmYYhlpmP5S5
X-Gm-Gg: AYBFou0n5J1AFJs9p48q0brrO4Z1yE+3outqj02hQmGRqqJyQewV9ne1T7J+gMdYuaF
	ES17ZB0xGDxWLGcvFi1f7xmcSb7SLBfg98xJERBdzWMR6iVZOf5GJ3ImxdGUxnS7bclH15/4n6G
	rjTeVE6snmjrTXmKyLGWEzMSg+lmngaiAEUapaViIo4IywQdzuCi1IADqZBwEwRAANbJN3bArF9
	SK2+TjG15NOyQEcz+tSSQM6ndyJ1jQNOYh3uTHqplDhYOvkWau4iygtOfzL2+Ii7dvanusmCFnA
	lo6bzTNvgKHbMJ0+Tw1NDPFRnsJs37T+QQF6Fqph1rdNG2bpQuuAyU2ac/c=
X-Received: by 2002:a05:620a:6845:b0:93e:7540:7a24 with SMTP id af79cd13be357-93e9b7c5622mr302578585a.48.1791363655969;
        Wed, 07 Oct 2026 02:00:55 -0700 (PDT)
X-Received: by 2002:a05:620a:6845:b0:93e:7540:7a24 with SMTP id af79cd13be357-93e9b7c5622mr302570085a.48.1791363655311;
        Wed, 07 Oct 2026 02:00:55 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:00:54 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 02/45] dt-bindings: media: qcom,sm8250-camss: add pixel path variant
Date: Wed,  7 Oct 2026 11:59:58 +0300
Message-Id: <20261007090041.3732717-3-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac60a48 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=Wj6AohW_YgefuVwW1yUA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: omEJnNPGvryClZbjiahPX-pxQXWDoBU2
X-Proofpoint-GUID: omEJnNPGvryClZbjiahPX-pxQXWDoBU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX51YiKe+/pyYi
 NvEUBfzGUF7176o6LWj+AR2Gwkm8j3eAaBv63G/mTqTn9A0RrDdkGYtI7QrKWf5ST+jVLartLbt
 uZaTSmRm/7Vi8x8L2IOwIPOaaNtVk5os9LORI9RZxSBH9ojX9HvljMEA0EwNnmxZT55XdKZg2ho
 mwF743ByI1kcZb3wRs/IXHCV/F5fWz1ss4sP2KB/wvIk7g15vI7k+6Bqf1iga/ktXLlLcTugVKJ
 hPFv3Xw2zs+g9gW580GO9OjDGBBRW3c8+50Cq+2iZ+UJ1U8fkSnBcq0rIfe3jQKco4D3KV8PEEW
 APadsNOrBuetsRsZgmurnk0eXvHZGVgryu+aEgXVPIamp3dYnPHVUERaECbZoRFkH3otMmP6ZwG
 9ce8dTDVZvgbDs71bDeVRD9f+wuBNtRV2wNpvL7FFOqsfexe6oz4Tcevj+nxvHLdXAseQZ18fOM
 Sos8MJpreZv4WWucIOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXzC1dopXfSQoM
 C7PFVeCHOwRMLEHA6Fno58DLLa4ugnKWG4rduOjK0DjTO5hF/vB249O1C1EnPG/JyE0uLrVRaFA
 EgMkGpQj6CJJkE6dqS5zqvOb2ID2vcM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document the qcom,sm8250pix-camss compatible for CAMSS configurations
that use the IFE pixel path. It uses the existing CAMSS property
layout without additional properties.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-camss.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index a509d4bbcb4a..d561179be48c 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -14,7 +14,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,sm8250-camss
+    enum:
+      - qcom,sm8250-camss
+      - qcom,sm8250pix-camss
 
   clocks:
     minItems: 37
-- 
2.34.1

