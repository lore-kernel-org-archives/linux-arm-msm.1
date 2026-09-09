Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764FC530E11
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951078; cv=none; b=osXnNB9dw1UJekL1UOhi3bUH0UMA3GPP1X/9DB0urFj3Nn6uq3Bd+ZKZDb/J+sgqT4ibW8S71Tfa3l7yWJCnMcMNQ5KMxVlSpgkhmYWxgs7NjYc4uiXKV+7DfPWFOQEc5wqxw654GVHpS4Px9k+EK08jAC07UZ/t72pu16YA+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951078; c=relaxed/simple;
	bh=O9f6hfp0eJOnXdSOlQWDVVs/akRlJJL7XlXjA7mu5GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0m1/2E9EOgBUtdSsDW+Fh/f9O2mXBbvgDgBSK3srPTU+vHrsp1ds5RJjIsw2cruVpC8A5TsiB8YNC3/Ni8t/FmGen6kV3LHL06EN+rm5j+TyJ8UTnh6vpWvdQ236Yx8TiBJe1O2771MSV3te9UywQRtY3zPKzyLqg6Db5kjn9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpPzIskl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DoRNpxJ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpPzIskl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DoRNpxJ8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689ASag42517942
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 10:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s3bU5CVGxsB
	pdkgDP4LaGaH4/EM25sITQmXcPZ7cZmg=; b=MpPzIskld4wNR1Cdu5P8xe6rK7W
	J+A8vcKQ2RUhqgdW0YzhYuPcpeKsy8VsesdWiUeeetwTZwfEfltTPdj0GTvDqnif
	8NlqUH4nGQOvltoxyu6UUb5/tHDzudTN+IIYJGSHm60mdfH+RWXctLK+mJ/sYOwl
	mdOkjDgIIqE+rJP3CPI1DXX+evHekV3V41hoToLF73HJebHNiXhAUMZOwv+dBtrH
	5FLDJBhsMoq6OYIQhRa1OPCNatBeuEzQHmKTOYDLmDD7MHLc/yyalO5IOTMZalnj
	im2OHKSnR1Vo8GuGv6KKHuBJk2BPEZDpPnVX0E7gsq5Ent0I7LFJXSg66hQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3n08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 10:51:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dff6253so36405775ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951076; x=1789555876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3bU5CVGxsBpdkgDP4LaGaH4/EM25sITQmXcPZ7cZmg=;
        b=DoRNpxJ8UYBfrTbAJdKIT6pcJVaXt4PE548Je3QT4itHQm8yOx/vUea2+NcRb7iHqI
         IffipotUAGAnIioIdXsMIBkRCmP8pwuoV/tmtsfGnlTUf7SOCoLfYsR/OBcxR9QjyONC
         l/vuEGZ7jJbtB8JX3YLSeIA3jqBt8u1E1t3G0X7qprVa97pM85090R1+QiP+9DwUs3+N
         4tOG01PKaVt0JNiha0eDpM+gF7z4LrCl/bYn5zm7Dgl9LFX4q6EmhKoDs2D/OzyVfLhh
         soucEeMRYkMKQQ6NgwxgGWML+4sbBLP8WP6aDm7NTm61CUFLw2p1EUKb4JpqXk+BspHX
         F6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951076; x=1789555876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s3bU5CVGxsBpdkgDP4LaGaH4/EM25sITQmXcPZ7cZmg=;
        b=RxFvgzJN6rVPryuyaP9xmcmtYC8OTmY2CYlVb5W5bJvj/wINEgnHpJFVbhsijG/J8D
         eXgu2zicIMGB6pxuDBwqd3RVFIWuYc1DFRB57Nr0ZW9oXwdXOFtl2Vt/aEEmxveqRmfa
         XIKwl1hl8JjSNoeaaM1ofmfG9L/vt58KGwZtlDur2qa+aKXzLS4VmKG1oK+kNQk+tdtN
         7cQP+86Z7t13RNIpvCF98RFfg7U+p+jTo/+aBMnCVl4VVxWRkWOVeByn/V9ofGPHH59w
         ytc+AhZNvDL9GHB6isE5RCP4NiwK+vIBQXEeck/CHaHRjLML0QXKnIiTS/u8c0Zqf2dc
         nbAg==
X-Gm-Message-State: AFuF++ma/2CzoOdQREjWm4YYyLCKxhJoiWmjWULVFsvEaKnsEcdz/Nat
	SJesdsaoLrBJmnCt8tyloOTNzfuDmi9LeBFyh55xoFLZKTeLvoJgwTtN5h3NAtsPilI/yiEgSDZ
	giryZyc0wory4ywgliZtyMWcizcJtymzznWT4e1KhCbBKMvDpsSh/WjnORrJT7Cy/59OX
X-Gm-Gg: AYBFou0Xu4Ex3AFnx7a9YDEbEHw24iKf9dOWpyil746CK+NYLL/qvzTL4ZyLZBcUErr
	EiuVle5Rg/aJcoA4QHIsOGVfeqF5eXsFOg4z1uLYyju6G7zQ4t7u1iviu3NmTrC9pD+TTM5mv24
	8Nh86pBnNR3p8RfkwqjrLIwJgcsThzYGuwOAlPwR1nwPKq9EdPYgHKjVVaRmiHBjl9s6uUfzROk
	Ymi3vbD0vYJInHJt1/MjLNlpkuBoMlqtYU1vpuvf2NKhLoVYJalbgIFXzbyXuv1r//Z6D72isu4
	WmRdr8cZYb1xrfswYp0W5bV+WbrFiUbp0zvzSnH5sjjQ6SStvdZoNFISqJxvmeVO6jguM0liKc/
	/rTa05LJh1bAK2Dp8icqnEytODo4=
X-Received: by 2002:a17:90b:538c:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39b087992ddmr41223156a91.22.1788951075734;
        Wed, 09 Sep 2026 03:51:15 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39b087992ddmr41223096a91.22.1788951075144;
        Wed, 09 Sep 2026 03:51:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434bb7d71fsm12084678c88.15.2026.09.09.03.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:51:14 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
Date: Wed,  9 Sep 2026 16:20:48 +0530
Message-ID: <20260909105049.1317985-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX/TW9q6/LL69o
 +d0fJvLMyxrugCgn2Nb+AKKbkdmyR6s1NjC/ig3N35kUaWcxHh2afU7xKUjdJ9ksrss7mLjhFBP
 ZM9xaVPTM3vliXvb7gRF93reKA1VV9aSPLccR38FHQJGSTw5xlvVPC3A8DAnsrU4mSWuUmgu3FX
 4LRobn9wLe1ctFlgsgXwEKktRJfvI9DF+Nygbkdd6Cz9B9AAk409yV7TuHm5w1E+dPhlz2eCbYc
 oFJugWPQPgLbG5uc0FWVDvpDASYMMnN0gBzWLCvH6s38LjmkhVqrQ48xYj/g4CgQLCzYFsWkxYz
 LIgG/2xeWNr4njqwTwMspc1dmb6wlTm+b/1GeUZN9ELVUnCSvafcJ3rKgfmkDF+fs5l2odLcegA
 JWxb0ePdanZP3kIUkSwp2iQav3ZY5JhmEBo1eh4948nXWD+qvsVitthLR1BxAK79UOAc+B8Ttjs
 4geFjnsQftGSD5KMIQA==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa13a24 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kGc2aUUJYeWwMdlnZD0A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: DNohyAx2hJhNLfIrpHrPJ9N9aLTFqffq
X-Proofpoint-ORIG-GUID: DNohyAx2hJhNLfIrpHrPJ9N9aLTFqffq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfXxPnT4XomziQD
 ogtEzORU3fjnkV9c9NDXaWFmuO9gjtmfYwKLI7ARVWN6uwpCnUzJ22DsXd1PsQOQ0WNbDA1yL3t
 /g90LgZqftPIu7G6JHheGlKnf+QBtvI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090120

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index c58e8a6c7fe1..cf57095cd49d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
+          - qcom,hawi-cdsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -40,7 +41,6 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
-              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
@@ -273,6 +273,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.55.0

