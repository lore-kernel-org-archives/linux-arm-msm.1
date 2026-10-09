Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264EB4E0B6F
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553851; cv=none; b=QvoAIVqkTaIQ1qDKCPuAMfWq5VOyzvhOy+NoQHveZWpw77iRI0g94PtPvv3rHKgRPeK51B19ZF9pHlefYNxRz5/tXkxFyr2KvNYyOq/wsSC5nuBZXuZZGhOif40Cvfwb9Q76aix/HWyBXMaVo1+TgkfqGjv5ErrJJtoMDZpqgP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553851; c=relaxed/simple;
	bh=jr8ZDL9Js04oomOhO0NZB0jV7LM0mrbtpIaO0j3ZEno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WEy8suU+1Tdce1G/ENFhCWvguo0SMpzaOom4Pb/pWelCIwq3n5xKcJgFE2ALlmQ7UqBo8kfTYnicmZwbejItdKDkWiUpVmdZorKtdhFs1UYkr+P7jt4uoN+wG/ePgLNiTYVEs8nMO5so7yPYM5qc6Pd0KPKxBkf+uxzWMvmhVmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ek3WM/0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrvcwdeV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ek3WM/0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrvcwdeV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKQDU1909115
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 13:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EAM10LpmPnMFzHR+16VWEfcHy7X7Am5wp02E4jq/DiQ=; b=ek3WM/0smn6rhpRB
	jaTh5o1ZTkH+Ew8feJJMfm/t9q7zR2DieZyt0guYYIVADUXmCHi1bUorq7HLPOby
	kX487CWzFJnj/zeoQ7I7V/M06dL0qp78NkqOWx4FwnSnJAv0IH0auv/NbUeQFWZ9
	lVA3lELwfoKWc8WgEvg0YZL5n0TkwC+v9OErphtn3sGiginwRLeBGDl65+QLRX4d
	/6Vu1bkvh0pWZL7aPIeUV8vYvtazIAP15TCKWlDCjx3Zixb2DeJ37Y8oojaLrDIl
	DR0bMu7yMfPygO3pK3DXJFwBymjWpaYgGOaYF2Y5kCo3I2OXKAaDFEi/IT0eUlnr
	xdGGxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6yk7gf37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 13:50:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e85f74c21aso1098215ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553849; x=1792158649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAM10LpmPnMFzHR+16VWEfcHy7X7Am5wp02E4jq/DiQ=;
        b=YrvcwdeVD9cK3xHuruq3b+mx61eJ+kt0frcYtPbmXZW6mPDZ7ehNNlvGcHUIJgN3CF
         JgWabUWhJ+oQXnljThWu5AchsZcGJPHq8ZKJGa8dIJa7IWFa2WoTAi62AU4IWe4QCwDZ
         ojH3eqfvpItUyn0WNy1K10IUQ5ire+4FL9Ye6veXs1kQSOh3Xm/iUkgnypWjms9ODiPA
         IJTwy+g97rceX/SaZ+PUDhx4fJRyrdAQbHC3HS1yrPfOK0slAQRybuCWfVsnfDpNj7y/
         B4VXJVmSrjJ/va6L1Y6U/Cakxg8gmoYjMcn4NVy79kEZIyEr+li+7nJATA1HR+/RJkyu
         /wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553849; x=1792158649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAM10LpmPnMFzHR+16VWEfcHy7X7Am5wp02E4jq/DiQ=;
        b=u+H8eGZ3kQv2kxiWsP57YDHst/H8hQuOax2SO7CeHwZ6eCJbBaZ81mCdh8bpo68u5Z
         NVaDTTDnwv45lkv3cVH8nlmbc7zfHRp4sYl9w7hIgYpr26PL0wtJEYWLfVu38SDPYGFA
         fuOrXgY+BQP21GZyzPVxSJtyUD3f2h4r3zmlreyhBT15V5hY/M5I6N3mwLBvh1KDFFUU
         yn5qz+YND7xWr8uhMS4FxKtZpJbLGBWGmxnWX6RouYm+KidX84G8/ECWlcslyt67XDBQ
         X2mmOLdWdlXZrMeCqvg/oT7WDw5GysevkErBGFC8fsnOW9q9LCTQBbbgy9ZvnnmJUtnh
         tGtQ==
X-Gm-Message-State: AFq9FYIHX4v1yEzmWg2Y1McVxu2O56Suqd6OYDtuj2dh4ZUMW4C2swmz
	iHdG3YqEJiuWZJobQC5n78yemT//7JdI8Sfp3DEIDOBQyABsCvUpttwOlCA9PBEvAZFKYL6N5i4
	rYv1S+UtFLA3mY5c4hbOsGcCqoBr/yQk8xqdmj0Q7eW56yoMAuT0RB59ky04bnfgDjTAT
X-Gm-Gg: AYBFou1SG2+mTES1nUUxqRYO11th9ZyW1zncEXYHykW5BA4qD4kcrOVpcfzX8LXrCs8
	++4kxu9d4eMxKFGIv2zqCxVx/RUc6w4Iq1yyw0rpxPNWgE383P2VtewgCYrl94iTgmpbNk/arQr
	5ikJs1GoBn5/LixpLMPZTXcFOYfOI9W51ylJULmNx0DgEQS0R86252wIMq9imtsLr2HzkRMc035
	s8wdjAvliAA1Ix1ckedh7tqJfedi0yVYj9RH/bbXS4L9fdsfiSjHv9RPzI4V8Id7MQekqZIRAw+
	g3Zv+nIavUH8pwCyGNtYxeGZGdnRxULwURSG9KaDSXvnA5NH1sBiZbApAEXk6GRZcJVkCFzcArF
	Lt0BS95lRqek4ICMwCnC3IpWGW1jURGRZ4BJHVyMgPdmIWv2FGRHCAgEd31mDvZSWkJEPl4I5Rx
	zQjXGnMh8GGwLEcPmtHfM7m+Ner0u02U2abz0=
X-Received: by 2002:a17:902:ea0a:b0:2e5:debe:cb50 with SMTP id d9443c01a7336-2e8403c47f5mr17143155ad.4.1791553848439;
        Fri, 09 Oct 2026 06:50:48 -0700 (PDT)
X-Received: by 2002:a17:902:ea0a:b0:2e5:debe:cb50 with SMTP id d9443c01a7336-2e8403c47f5mr17143025ad.4.1791553848012;
        Fri, 09 Oct 2026 06:50:48 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422c9944sm9574135ad.64.2026.10.09.06.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:50:47 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 19:20:31 +0530
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add IPQ9650 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-ipq9650_llcc-v1-1-572e40b18522@oss.qualcomm.com>
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
In-Reply-To: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6ac8f139 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OsHVNsnzEVu89lbPO3AA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 9e1cg6bK1SywdYlH8jQZM8MSBx7p5p3U
X-Proofpoint-ORIG-GUID: 9e1cg6bK1SywdYlH8jQZM8MSBx7p5p3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX6mBAhBrZ4pZi
 Dufyo/JX6NCBpkUoufIKfgGsVDFynymZt+cKyuigtm06v1ZMxGr7EehAw23Zz6WE3ze1dbCwXg7
 1NDIkOK5wD8WpXoR+A46cer4T1ryRahwgfGtkW0R310AocszrYxOZViACgqR35AoLQhxlpZAzzP
 oibpDyoS5pAu83fLTdsvhf5Q1bRwQjgGaHSOkfq9fpNl+A8K6eLTpLOAXGQQZIMizI7S1GZ9WM6
 a8L1falCWguuxYg1nFym1H/qjZnQjuDmJGOCEgKSx6GrPaQubbBCkDkSN/FCLPYNgjNANK0DjqO
 9b5VplpnS9iRStYYK5CVwLh3GmIPQ1WmBS8ZCRzmYxsatnNb76ZhIoEt3c5fSATIS0/Yzfd2c+N
 hnwxBFQyVnMJSl1zHvT7wQGYj/Z8OY2LbEHZGCFJyvNNmuIHNqh1n+D2Ix48VH3Vtu3qiiYz0f4
 hikMEyUfWaepujeGLJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX1vhBmXsCXFa1
 HK+wTw5jdr6g+Ya7lZEu5OisOGDhLvlRXBki4P/0GAoJWdsek4jJFVwAf4YF5ySwOpgkDU7tbC6
 vtKtpxlXuBiuDev8L5DV07SgO87pPlc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090055

Document the Last Level Cache Controller on IPQ9650. Similar to IPQ5424,
IPQ9650 does not have a broadcast region, since there is only one
instance of LLCC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 2141e5d4de63..3efe68b08d58 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,glymur-llcc
           - qcom,hawi-llcc
           - qcom,ipq5424-llcc
+          - qcom,ipq9650-llcc
           - qcom,kaanapali-llcc
           - qcom,nord-llcc
           - qcom,qcs615-llcc
@@ -91,6 +92,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq5424-llcc
+              - qcom,ipq9650-llcc
     then:
       properties:
         reg:

-- 
2.34.1

