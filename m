Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1867272803
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785911; cv=none; b=aUW0Un64FdlSEfT4i+cveWxEuiiohc40LiuilR0xe70rRWBfe1l1ACSZZ3FPSNKotU5AiKbB9OJGG655exD+Ck1VSY1KTdpEv3O1Fh3Jqp0SH9Ansz9W4dXrme1mkwYszHmG2tqZbnb4Nk2Chxgp5fLDwF251S2JZr/2iRSmV+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785911; c=relaxed/simple;
	bh=WXqvJM+D8J9+hqIXx80EQDblZxafQ7vdENgEXKGGLZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FM+9VWZ7nWSaZeHaa+WWrmjRZnJVlJ+3BaTdzm36ivhT+Ed0PBx30lP9Vf3SAr+mI8ZcJiXf2GezlWZkUquxv8av6X5hpMMAPRHgkXpjWBuxwk+TNMqXcVyb7/b+Ruim3VZRpcS7X4iU2CBDAA+ymRw8ERhOEsUAsrd65s1YAjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqTmWAiR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDMdRJC6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqTmWAiR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDMdRJC6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55w2a303172
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48nDiI03hrqB8u7ZOj3j4kE+m9ZExo0E95r8MhUaGIY=; b=UqTmWAiRWJoeQsRJ
	tmHcgl4q20mPydX+sXIT8RxNsCeyS4YqtKIMyVcBxMo1JorYLfreyHykSnSC5vE+
	KkHPsazU0seymLzC5KivBI3hlTe7KynpOxmoV2sgdedGh8sAnIvMBB5tnoZ9h3y5
	IO9jAnQpsFNObzTWE1Ou/kyQ+RcGBl04ZWh1lShBI7/7Gg8cE7ciaisw9hrjTdFu
	Ms3/9uH9/rGlHBchWvqln9qXnmTQ01TfA2BKzAhro2yBkCkrhbFF0WPCMxi2ropM
	KKM6NQa/jADcLKq9BFhNxRnip4C/vL7ocm2BQVAQJkKfZ+uXi5VQ4sk6cwCIj1yW
	oqP4Tg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dh7f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:18:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so1328673a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 23:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791785908; x=1792390708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48nDiI03hrqB8u7ZOj3j4kE+m9ZExo0E95r8MhUaGIY=;
        b=kDMdRJC6mqBGUP/FmY66eB24uMq/E+zyddHnRu2Z7WenZQeIcl9XtEntpWufjXznBp
         /qi31pqg0AbYPHEdsIU6UrWRVggNp7kFjaCmaJ+IUGcgMg8D4ng/UxY3zx5p0UFTTVhn
         bGh48b4Isonxw22pD6TyXAzuPhRsVrorPF8Lh7DKIhtssZNxrYuHpl8Jq55YTRm89SK1
         +Ci6ng9czkyJAFFD5dRpbLtLsDjyoB6j7xIUtrJ2UBDeWAA9kWWSqJPEuUqnsnLMtR6W
         JNPtTPM5L8ctflbxlLs49mDcCHCV6WNQZAG6+El/LFcdMqR83cG2BaRK9kSl7zxFbqqc
         NE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785908; x=1792390708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48nDiI03hrqB8u7ZOj3j4kE+m9ZExo0E95r8MhUaGIY=;
        b=EkjHWx8NVAarcaQROd539+6UQElvkEFUd3jCVWUP+7QHnz1StiPhyOa/TPMQ4oxbKh
         wyswKAYRz0mPTjwFJZ3rnLae7zLDs87vSDqfubqq3RUlB0gbTGyoBsPqA+mL6gsp7SU+
         2jq/vdobguTWjeR3ECgWy7cYn0U+TFGwGvAKJkBIK2o1nGDToJJjJwPtRRds4439nWc3
         xSHBpQTkt6L+pL+pus41x92DxrD5LcmkL+d07cJF/wD1TNyGpZi73pV+rB44/J8dDHg7
         phag3jjYNkfkr2nHJSZzVEu0h5uS1L8zOpDVmWIeJu7aWOpi1yFqVOxgUUDez5koihBP
         Idow==
X-Gm-Message-State: AFq9FYIn5rb9I88EYIPsgi4JhbfMccxTidO+oIuOMkdG88CoMq7wyK3K
	MlCpdRf/9wL+kRcYGOKDpumNZjvPf6KCH+N+2yTeNW/zLNZT6BB6WnEKPEFJdpDuOoc2T04XilN
	KlsmLaDEDYA3RgBnvCUnQpJb5TKCRsYJisxRMxeg3WxFxaCu/Wf8sv7FR3ZNX9kNStF4D
X-Gm-Gg: AYBFou0jeoc6JtZSk4avi2TZx6X3veYbN7mLCqNj6xtDR0w0fYRSyBLo/WdyAlcCwQN
	cN0kG9H6VDV72HO3/fhsa569aNifdAfKztJgZknQeqQS1XPiT5uNdsNZ/fuH9L2c0dPcwAy4rgx
	0Ct3RneJujhPf0ouyVcTuoLkH8WWngt9c8L6wzns5mFxfbcbCVDXrCBBNHq8m5TPCQfvM5myaqj
	UFQSSzPtjwMLHGYUKEDIUd8MEIRm7b3x1fg8/3wy2yds+4K7qEhqUe7NtmHcEdVcem94xBmosY0
	zCmopsuoh/OJGN0Up68f0C+JLqUlhw5KwbayoyeN3/PUepcZ9LMFD2X56hUMUBhBXhmdEYU7bq4
	4kyUK+b6lZBoKKPSrpbwq
X-Received: by 2002:a17:90b:3b84:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ab3a364f8bmr6096579a91.4.1791785907720;
        Sun, 11 Oct 2026 23:18:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3b84:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ab3a364f8bmr6096571a91.4.1791785907278;
        Sun, 11 Oct 2026 23:18:27 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm3770481a12.5.2026.10.11.23.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:18:26 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 11:46:26 +0530
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Talos Lyra EVK board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-talos-lyra-evk-v2-v2-1-dcc9316ebb59@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX0p5dLOJYqRyG
 yYyGiie5yEk28XSeTkijCKyc7RZThBzUEEVRSvg/NYmMH5S9+XEctpOIKX/HqFx9WLFV5T+mNd/
 JSRWrbqnK6uW+7JtIzvSv/2wCcCIA7ySePYUf5jlXd6tyZYgMjXIeskXzjDp8hSVasWoqSgvRO6
 27TvlMbRLV3eTBchlt14LYtVfppz7jpYbTEC4BDDU7G2P/+g7RNe6KqBPCuTb8K9Clat5497Ix4
 kmuly0Fth76OZoEaXkL+GcyBWOrlRfhh0Hpl2ZFpv3q25t7LKdELtYBQeEAnifTAyNNY0gpOVhb
 /WQoJ6lYOYZ9urKrr8HImRiF/+s5YGYz64MmPRrJZ2aAo1UcP8muSUwAVrm4sWI1xiKFwgoiLWu
 ZxkGblB8QGZHtEt5kBa8Ggx4J0zTNA8ISVUwvdk6XxrFYaGTw3uLzoWDhWIe74uW/SbgNbqXGLD
 wpIvIFs6aebOI61B3cQ==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acc7bb4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9mM5XA2LrqDQA0higt0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ezGc6Cuk-TzU4TXHv4Sj4OsYkhTawspX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfXxOSwXGxqr06l
 OQS9KAku7eXYSQrFrxMB8d1FRDb6ZmSDPmd1bl+ts1a6t3GtsiLt4K3NXhzO9zF8lBSgcjnKBgG
 K+n729EAPva1NTVD1TRZvJ/kVVC0LXU=
X-Proofpoint-ORIG-GUID: ezGc6Cuk-TzU4TXHv4Sj4OsYkhTawspX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120024

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
board, which pairs the Talos Lyra EVK SoM with a common carrier board.

Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..d0e30d6c1d4c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1089,6 +1089,7 @@ properties:
           - enum:
               - qcom,qcs615-ride
               - qcom,talos-evk
+              - qcom,talos-lyra-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 

-- 
2.43.0

