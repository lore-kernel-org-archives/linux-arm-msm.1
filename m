Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4017E3C417F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289270; cv=none; b=WpRiSX25+NCvVQHQ62JXJ/KqBh6clWJKqmnXwydMV6iuwOkXPXnh3NZFGKLZ9wN6EBCEotHE/qiF6zOoeSPd41Ye+HP4yFsJMgLPaa+noe6FwjNrgzZPNzt5rsSKd/6O9eP1pz3eRrDOV61wQrCIoECYZ7xsW6mvB6gvofpQT4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289270; c=relaxed/simple;
	bh=JFGjLtrj1zZzYn/Ag3VBI/clEiJ4wT55tKa75dJeRuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QTdmee80qHyxqftjMTIOZ0iYYX+Q4GP7tJ4X7tk8sbNmijpEGJRSKysVKWs97WUiOgWe1PMTLJGCkHCOCSTeFDI9hP/qI9B9/CHT8iEBrnUOt70MQltXfLUwZLOLXKWIEqDpivXRF8+OG+4KJJRpKz6apWaPCEF6bbAfi8xTymw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FudbfHAo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QM3xYE+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FudbfHAo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QM3xYE+Y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASkBY1556199
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ayGOx5bR5XzD3m4opmyJF75sdfovMNMnHcpR7EtzxsM=; b=FudbfHAoVWtx0qJK
	t+OstdOYiZzUYOmeEv460bN798bEaO+laTY3YjcFcsempzIoyQTpfAzzioDQHV1s
	xKDjrwwLCYqNetxDxgv9y2coZOGGmxKVxFbkY2fGTuYdQR9tRbPaXdQMYGr5o2Iq
	5HYTFSc2BHlCX/rjrYV7cbM9HBydZKPKAVUyAbWvOwll1I6WlgX4pOwffwXA+XDO
	RS4AACpjAr5xZgSFH+5wGrZEKmzIgIy06ahzvlzAmtie8DpudhvLTdiihpTXYKro
	zGqWGfCRpHOKdfQHSf7bcCb62QCBadEPk1GKqVbsCOFrvtiF5+Xw3vin088yc4Q/
	996wtA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff8115j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so27052025ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289265; x=1784894065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayGOx5bR5XzD3m4opmyJF75sdfovMNMnHcpR7EtzxsM=;
        b=QM3xYE+Y8gM+LFxCYeXh+s4m9fT2SyxWbdnB3iEOlFdnlNTOyqmxDIEwBkC6jpIOn8
         je6XlVYNwy5S5U8Ogt+hGHXu0SynCaulWGLHpCL/PNrJl14NNg7TggWFBNVAqWBr1Uo6
         AL1d8uZifSOD4F3U6Xq5AbOwP2dPSTzwMsnZ8NKszfd9ihkKb2U57c/gQEq6lbIkQA8Z
         GEvLCdmO60tKzbki/tm9+bDnS8MutCh6VloHv6fe3eh/bO1mNmU4g1FyUALq5uwNuNHR
         htLzC1x2/Oni4IBL9f8dWJXV9kL0c5ogTcuyvtYe/dOXuwT4Robsts9EQ4G+hVrNiQs1
         1t+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289265; x=1784894065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayGOx5bR5XzD3m4opmyJF75sdfovMNMnHcpR7EtzxsM=;
        b=gF9ullDj5wlh2y24qGWIDHt/1J0SRuJa3sWpnLi4yykiPnyZSzjdAKDw6/1kziwrVx
         jCYuqkuK5njuJzLR4Mgr217DUl1izm4n+FWnohoNalob36700cPTGO5x0AhGpFyJ7zBn
         lObEv2zFIbsnziLdmR8M7vf3xQLiMP2fCKX7L4XD8vn6fS9/5zG/yiLDiJJoMxqDpWK6
         0eLWO0OrksGYdnqwuBww0CZzWH/LKF8BBTS34+dy8jwTVoCXqRp9XgvVfB3KKlj8CTW2
         BTehJpNekZB0vr9wJDClAra+hYJQZLxt7SPucW8yuQFrHvYUFnYjH/n9wCf+dASmAbtx
         ORzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIzX5Jt3D38RelnAllgj13DiWIBo/ixhimPP4lBW+8ZLQnUwveyiVhyo/muzcDcUII+f5/RunSYxoTBjDC@vger.kernel.org
X-Gm-Message-State: AOJu0YyiwfAOV8sUfpxCpEQ6rGW9bbziRWEogQV111p5eIM98UjhZrxR
	O4ZcK2xrR4KE1clijRCt0VMOJ5rrnFUcZmN4dmSQl/dvV0dlumOA1364AeQtND3IdJjRn8BeOYX
	SYEPUMa5mvqZjJyoi4u6Q7wDkGmHU+nwIFNrt1g1yLhMvetxm0kBVI5Nm5oC7dqsF89hG
X-Gm-Gg: AfdE7cmp/v6AeVI4cknXBdH2WIU/+TWxdiEqU9TgkcCnbxLTN2Ra6ae5N6rLMwkCzDT
	39KrvERWIHwVbVAL7Bd/fTn/dP3VgSeV8KT/l/xDjiq7FwdqGaL0cCCM/fgD2/EfCRIgusDDlRI
	w5vo1zIn6NWYU5ZgEM87VR7obHIb4Bf1MN99Y8a9iy+CdlwaPgHZN0iDS+nKF0r4ML5CkvJRwlm
	tVhY8Poc4gBLCIEP/ehlfpq8R6jAIzDvZEtNsWSLn0o1+wHzLVD21dCAg3a7TK+oyf4L+XL+CiU
	E39jSAzMvOeNn2Oi6QY7o/LljhRgBtrrZn0DQmEZIvLJksQ4YsgJMvatxLytLFrEqgfRpq1oMYB
	Wg4RR6DHZ9orsMleuH7KcNLAiCe55E9L6hPHh/gTLv0RFhqL7TDZVE3k+sp/JA2G8
X-Received: by 2002:a17:902:d501:b0:2c9:d8c5:d55d with SMTP id d9443c01a7336-2cf349bc5e1mr22316245ad.16.1784289264624;
        Fri, 17 Jul 2026 04:54:24 -0700 (PDT)
X-Received: by 2002:a17:902:d501:b0:2c9:d8c5:d55d with SMTP id d9443c01a7336-2cf349bc5e1mr22315915ad.16.1784289264217;
        Fri, 17 Jul 2026 04:54:24 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f12e0sm9481895ad.31.2026.07.17.04.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:54:23 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 04:54:09 -0700
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Add Glymur QCB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-glymur-qcb-v1-1-aaf1cff84aab@oss.qualcomm.com>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
In-Reply-To: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784289261; l=795;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=JFGjLtrj1zZzYn/Ag3VBI/clEiJ4wT55tKa75dJeRuw=;
 b=O4K0VfcphQoj6t0S34CLi0GaJK62+cErYHu2jC+Oe0oh0H0wo85A5u0vBOFtcF5GKZgo+E5Xk
 bYAhgt/V9N6DK0cRLCusXxBb2W5lO/xHO2qmS9/1eAegnzPo2f6Z4Hl
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a5a17f1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rhmdLvgBfCRuod5L2MIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Uai8i6YIFTh9HhaBlZqaXbpt8reUAc1d
X-Proofpoint-ORIG-GUID: Uai8i6YIFTh9HhaBlZqaXbpt8reUAc1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfX75SzVlXfS3Mp
 o3JF90zuiNAJBotiLefpuaa94hrkg6BlPz2ZEFyMdDHwRo6Fdss7wqNBVx1S9uspsNThA0I1F+F
 8A4E6EQQ5rHhTeST8RU3dqRJHAb99+Y4hc/bTjIFqWueFd1DRCV39kHDYUkovRlU7FXiDOHYxXA
 SoK+a89lZ3cM3D0ATJ5BBNb35q6LEIVAORWkSboNjUTnXwc3+EMvlwwav4C8qCxoMehXNxz0JLv
 thZL2K3qse+dt+3E2Fon4MJmVHAMBFzchLr5RAmQqO75ZnNvmklYJxmhXzKUrBqztAoX7vxSPIm
 GlnoraMb5xRQ7NZgR4KwaRHA3QmeBFs6KT/tJj9xGwZHxUlNkP+jYQhgY/9JQ7zBDL1P46NbQ8Z
 WCi39ypd1ZVpC06Dmq5r5hgePEvIbHhU6Dc6v+DXKQLEzxEMWNEjHTdv4gVgc50K2JEuxY64oDE
 L6ZfKD9wv8QpSZUuW8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfX2Ks27zXwlSwg
 CLVEbma0pHNqDLo/sa/Axiyl4DFZ5g3cW1i/vtGE2TpYKvjdDF3U3wY50f2lTMwvh+dtKDhJoW8
 X5PeHYvW84bdqfh/Leb0V4bkKKG/j+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170119

Document the Glymur QCB (Qualcomm Compute Board) board id, an open
form-factor Glymur board intended for compute bring-up and power/signal
measurement.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..0ca766f12147 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-crd
+              - qcom,glymur-qcb
           - const: qcom,glymur
 
       - items:

-- 
2.34.1

