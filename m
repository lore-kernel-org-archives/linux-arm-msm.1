Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2A1339390
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132624; cv=none; b=FKT/9Fk/olqyNxT3uRQlhNMPCHJWzNUumJ0EKMljk4pto2PtknHM4vSbL+1dUSUDl5XozSsQ1nR7td3O+JIZPmJAy4tUVknNLBtm4lQRW8qjTmUkdWd2xPTk9Dta6MDBidBLVAgvXw1w26bOR6Y6M0R4Gl+k3gC6JyIZoxn7KI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132624; c=relaxed/simple;
	bh=WTQqvgd5qbzY9TUSBvUH2oDxa2Jq+JX02wLUEi1lOPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXaSdFs/5BoT62rSQXZ4G9D4sLbD6gCLo+XVMk00QSfSsjofS6NfSkB9uRhfkvWUQ46RZfPZySfJx8mmpxsfdv09MU4OmEcFEL+1qDn2I9H2T4i8vjmsd8Gw47qUcjwM3typFGv1BDTxYXd53Jt1KoXcsaltf1eKsPM9XaYjeHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3eizn/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJ6ZeoMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3eizn/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJ6ZeoMd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G6Hk7I2678111
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJHfsFVJSJ7+ACt1yGwBSr/SsVtOFErQhNFKlR3rnGI=; b=C3eizn/ftp5Npt00
	0alqYppoxsqeQGUUnymowE0Qb7fUkpeqlboJRQqeoWgTm6JoJnvcjI0iSmP0kRck
	a3tGTkZ2qlYMKyv9XbA8akMQgTACcTJVnIL6XN0UitrC44FJPP4paShEA2gHsSrq
	mMJTFHRZJlmtJaIgHFSYgxnumUlyjpZFiwMVb4o1P5dDeBTx8A/vZhoW6HsShvgw
	uQ+bq1haNbPCpe1p1FXAncScNq+DGCaWT74rj95NK++Vrsd6fK2kTxONZ00RqYwu
	09KISOk7ZKy63ofusDFWar9jwjgpAqMbiGSHBdqqwh3mlC935DZKfRrLZtzmmxxC
	yeBNWw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tb4bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:37:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso5590936a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 23:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792132621; x=1792737421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJHfsFVJSJ7+ACt1yGwBSr/SsVtOFErQhNFKlR3rnGI=;
        b=cJ6ZeoMd068KbLEZSHHtEBx/6lJ4GVO+k8L4sgIeL2VmXxF+UgNnaEfTCQhRbmovuJ
         A9m1+wJ7nYwccFW89BQW5ozgQy/abC1HFRJB12ixVZjXkJGI9JC/NHxv/3mWc7Ftpg1a
         wCso2Y7GIoJ+Nq/TVFZjvEyvwAzZP+P074Qy9mZBhCyhyzAyxpUClJsiVwbxBH+ISpcc
         ymHxkZATQjRhso2uZhMiRP97Vym0BjLueC0Hndy6DH2dsvnxuZ4Bd2q1cqv1QZOKnS4U
         YBWB1oqCCLVxcIWy5Ah5xbk246E7P+5gLbRsKG3GlP1NwU65+MBmgjBVaO4nz9pYmuzW
         Wpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132621; x=1792737421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJHfsFVJSJ7+ACt1yGwBSr/SsVtOFErQhNFKlR3rnGI=;
        b=nAIICGvieAkqJwMWPdIFiZRCk0TR5w20UMDVrq4uIm5WUCrLSaqHyJDtpC/Bu3PSH/
         uSqCh3tLr4z2Rwu84J8rP6z6DdMCynmPMWYJkCOEW6TUvrhGDKDSOmAk2ETFHdvxGwex
         2/51DUeZ25wcFxAsrqX2QfdduDTbWxrWzao4Xb+mIixG5emvDlveQS5/f3kfAdROiU1g
         hGwOjQIBAPjWNRQABXANPWWMqhccsQ7XlK3hTu+6XVE4dsO79Bs2qGrb6NONyOX9OPTp
         Fh6hLHMAoJhSRTfEip9HqZ08RPDx1C8qz5xeR5wBN3K3iQ4FwGq3smpqOtYHM9f5cC16
         x/Vg==
X-Forwarded-Encrypted: i=1; AKwUvBzT2hFQ8inQSpepn7gjd3tGEiFbRg+LSdTEY70T3VJj5LOlgpf49pttmcxSWALSC+6oMZMPaTZMjtQU/CcI@vger.kernel.org
X-Gm-Message-State: AFq9FYK/5++k0c3FGnowyLmnQ1ybFdR5Pg8S9kfT6XQbeMv+KV9QLV5l
	+JVMKElKtijcK2S9dJZzJ1z8aruz2Hs5T55TJm5lTqAGyXY40y5KI4IPiD3gpVlMBlH22IkNWQr
	8Ix+M2YqDOH5haCzYQb3EKSDr55gclRVAivUoTXqaDX6KAzRu8rHS7IYpIP6/bSnNdAQB
X-Gm-Gg: AYBFou0nSiDOnALH+zIWCdS94Pb/kgMg7fcVeyjvcoNbbpbWvyIrp9Hd/p9AXJMJm9N
	ImpN9zjQonZApM0Je/ot35Q5a/NEE92QrB4Q28jCcoLVX0CrN25mnCw9ebAqV03ItV5B3RSwqRi
	ZUa+drCVnj26ol+f8+vofE9HFBL/euQVSNSC+LtzIoosL+l34e1DLLgCxVcj1GvnBWuUjj/MiG6
	lE2kT3wb3+gFKuecjguetjFfu+MNUIKezqEd484xgtaVBaPQbWlOvxcVngtX3yWoMoGREiNGk+N
	uH/czIKr/nO2NpRaDaNT9ocadQZjCwC+Q+ePKMhOAsV3VvFO+vZGREZUve50XhMuaqJK6GPoxUD
	bsuB+OhWGf+dnP6SpdHb45G7alxesXHM=
X-Received: by 2002:a17:90b:3cd0:b0:3ac:7377:fd4b with SMTP id 98e67ed59e1d1-3ac73780774mr6795831a91.45.1792132621330;
        Thu, 15 Oct 2026 23:37:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3cd0:b0:3ac:7377:fd4b with SMTP id 98e67ed59e1d1-3ac73780774mr6795818a91.45.1792132620784;
        Thu, 15 Oct 2026 23:37:00 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1e1esm2703298a91.1.2026.10.15.23.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:37:00 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:06:46 +0530
Subject: [PATCH v5 1/2] dt-bindings: misc: qcom,fastrpc: Allow hex digits
 in compute-cb node names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-glymur-dtfix-v5-1-f56a8b94b4a9@oss.qualcomm.com>
References: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
In-Reply-To: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792132608; l=1379;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=WTQqvgd5qbzY9TUSBvUH2oDxa2Jq+JX02wLUEi1lOPE=;
 b=Mrc9IOZWEdpsXnqQNzy20+D0ruDEPXdge5U634vqEFW/HR+Ap3DGPiVwYsvFOtQdBfRLWY4DE
 GaUdeR/eXxwBviLDC0RB45dDWECj6K4dLSB3+VS/R9t6s59ZRwVTuu4
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-GUID: 9xBNR9GfdFzu4Dq-0Q4ADj6Jgsb3XM6A
X-Proofpoint-ORIG-GUID: 9xBNR9GfdFzu4Dq-0Q4ADj6Jgsb3XM6A
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1c60e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=C3F15k_13UMA7PaxDcEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfX5ovHOy8XSE/W
 5jh7+4f677WeypExYFQm+tRzhoU+WCh3/gLm2C8uAUCkfXDyaYGfyB67eVKppxLJTgyAdwXZWxo
 UTCzp2SzApoOqI8DhSdKkENCr+GVKhQ/OMY0Kqz64sxCnLxZORVMZBhTiXQBEDHv2NZL1Lz0c4x
 UznHC882WlJfXW7/yq4wb2/5ov8hAIyrzON2CX+8Xdiu6uAU1Kt1RJREtSzaxVLtuZ788b2QIjU
 xUZhk6CQVrjof1MABftncLNyUeiiLruksv4ovD6EPUAqAZupACormMGJqWIl69QfwymvvKgnGbk
 oGqEinDxZ/WrzNvtYVZG0wc/KIrFJp77xImIitJ5PIcr5pBJGzrtS+FyBMpAfhDkwLwNoo+ShBj
 fCYX4Vi0Ixu33aNw1yxiIpRx5jTZapxgUMgKkz8bI/chORO78jD5V3znWEIRNokDSzweVUnhsgk
 xOmxnKiEu4eo+s6hx8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfX9bcaX+XVxsit
 kPP4Y+BhJERXvucAtj3NmRu+HkKg5+eBFY0z8ut0VXpUr5xFABCoUSB2rvGh42DOs6Lzl4TF59T
 AJEs4gNbRNtQ2DHKPWRdf/doFId/UiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160026

The patternProperties key for compute-cb subnodes used [0-9]* which
only matches decimal digits. However, per DTS convention, node unit
addresses must be the lowercase hexadecimal representation of the reg
value. For compute-cb nodes with reg values >= 10 (e.g. 12, 13, 14),
the correct node names are compute-cb@c, compute-cb@d, compute-cb@e
respectively, which are not matched by the current pattern.

Extend the pattern to [0-9a-f]+ to allow lowercase hex digits, making
it consistent with DTS unit address conventions. Also change * to +
to require at least one digit in the unit address.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..d9444f452585 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -79,7 +79,7 @@ properties:
     const: 0
 
 patternProperties:
-  "(compute-)?cb@[0-9]*$":
+  "(compute-)?cb@[0-9a-f]+$":
     type: object
 
     description: >

-- 
2.34.1

