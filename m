Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB3A357CE8
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969056; cv=none; b=Dmw+/bCWX2x8bnPUv9cculaWChaOHfduSjiE4hPlLcIddyk5GJAdJte/d+eD8ubaeNU/25Zx944rYRGdhbiqZq8G8q2iMSNGH5X02JFzs845J9b9UV4xch1054vU/kPAmaAewhFL5kNTDDxPALPEJFDLr0LVsfsnj9GGouCbqKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969056; c=relaxed/simple;
	bh=5BpZafnsEX7T5i/WZquEyzAEe3ckLbNCfbpYPY2ev+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5rJigI/fzewFf02BLaStYoqBOhhSGQKlrW/u09SKUW8axCj3X2/g/jyKbZc949FCF5pShRopOPR+JQuh8hE3MT/53hijG/H9fJpzeRc+IBr6LszuBlixJ7L6Cey0TpNCliFZtgzEw7Aommzz5WYhM8m4CbWxiqBc+HKRo9lByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeurDXbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISf+BSRI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeurDXbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISf+BSRI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z1Hl993273
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=; b=aeurDXbn/MsKIUKG
	x+nG9cEN0ZgZobOkB6vuCeShjXipCEBH1vPWSq0ivDZ/xJ9KPenoHJJ/ICEFKMBG
	IySns310qB+bTCbdDXdkI4FiIqQVGp9FUq3Pu2hrAdBmeGow1Hz9wNKe4HFjZ1Ey
	/Qmulusbd6X+4s8STAHipPsV7bpJLmD+2E4PTxdMuOipYos1SAQUsJuxqLUjk9dt
	gVi3f+HNGyaRVs5sfeif3kglnX/V+VORTWVovlPtD/N3O5hKI+Vo4RdDV1cLHH5s
	x1TPpXK6qBuHt4RpfGOfmqngIJpjERY7uYXBCIqx75zZ51hTjyb99/dQ3b+7xvQG
	Q2AyOQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v8s4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:37:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc52c77089bso3938547a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 22:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789969053; x=1790573853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=;
        b=ISf+BSRItVRC66ijWKexQLogOgi+dWbUCWNiK2HkO8Ut4LLB5U++76pM4EclBlZ0TK
         o59aEf617Ho+C02ZtaByTDQ38LaAX/5i5S2Iuz2z/Tki6xszOmZBjIbinMTnOFUZWOMH
         h5XLNJQfmIWz2HKZgN6lyzXf3V4JEDqW8i0aDg5640oKMYbNJtKfpbBEmGe/KUu7qk/s
         z0/jMe3GoPiB4J/bduQ+2g2SDgZTMZfm4R4XE/l+IG4JtsE5j3UA9Hx0VDJWtTYySeG9
         JdzMl0pUv6VDtjxxzLD/XXU/nmQ18jBvkHEKjK8TNyS7j9LH4WaSZybPy7gkQ4Os8Kmd
         ouRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789969053; x=1790573853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=;
        b=ia8NO1NOk8IdOOVCwdYpWYmkNpKsi9ZBq7F5r5wo6vDIp4O0f/c8YMWWmhVPOnclG7
         ka4zWpP5ZvylvBM5eL4bHrC5z8bhHWrZKqXvsTfefahTTeYu8S9RVQyFPMDqFyibSj2V
         LDkux7pD2awhmHH0ws9K24tA8/V16viCDSlM/vgcBMTW2WIDf3MTrUd6pV7lZnvs7Kn+
         qjTzPqGC20qxNLfeRMlZqx3QUk4z3L+6Tok8h43t7os9I0O0ue/61d7nERTj9KXqYAfl
         hTzSrNgtIBf1dHpx7EZi1zuaXHAJXj+FzRsNccpgBvoEzsJnnU37WxwRmWYxI5giCcpW
         jYuA==
X-Forwarded-Encrypted: i=1; AKwUvBycPHh3DhEaVvP99CtPPe1gb9nFB8yjxAU2/yML8V/RZbk7aH3HTnO0S1DnL8VccVzu3oQthAqt/tkHBCyh@vger.kernel.org
X-Gm-Message-State: AFuF++mm3B//6zxUL5MGx0Kh+m2bnTeo9vjg+i3Dxhb4TIti1JpU04JQ
	8FtwLp9hwcbkk/XMv8ObmDIuJElpKb0qb7d2PWbb5AEHShorUUtW7z8amrRcwAm2D7TStAJC3xB
	/UYmKrwYNhGNFyR5Dpw5bNVMCQY2kHRFWyFlS4pOS7w9RQ+iTE5XVQD9/PcwEb9qxCpVN
X-Gm-Gg: AYBFou0m/nfhBlYKyvW3XAUSmALz1CLzm65r0+6Q41A44EQ6EO0uK7VQY5+zt6TLb5R
	yAZglkxbVstgnKNApmYLqT/AwXpcTmQM0PwIdLHB/yLFcaKVTFPj5Tn1TpXw5+Yowx3BoD315gu
	AEHEF7SebzQk6JkqmK+E4RYMXfY8S7gTxfySkv6exuL0tqFi8av/batOa8dM/ETJzWWzAku3nsu
	RKcZ2j26Kh0Le/3OIsVuBz59u3X/i4CjPbWc7ILl2RWNS/OBO3s6uy6KFv+11GsqkDO2TbPmLjR
	N+NRrBeXJXdVFUiI1u0LCio718PhTcF75t30jlemFlFbjYXAS4mtF1VoBL3ZvFcGnwy/laM2C1Z
	tOqG9O2ddFBeVK1qNuO6dSKevCM3MiLjzyA==
X-Received: by 2002:a05:6a21:1f87:b0:3dd:a196:5397 with SMTP id adf61e73a8af0-3dda196546fmr10465700637.57.1789969053463;
        Sun, 20 Sep 2026 22:37:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f87:b0:3dd:a196:5397 with SMTP id adf61e73a8af0-3dda196546fmr10465682637.57.1789969053073;
        Sun, 20 Sep 2026 22:37:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55d45a6sm15054568c88.9.2026.09.20.22.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:37:32 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:07:10 +0530
Subject: [PATCH v4 2/6] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nord-v4-2-ed05c6e09240@oss.qualcomm.com>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
In-Reply-To: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789969033; l=1074;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5BpZafnsEX7T5i/WZquEyzAEe3ckLbNCfbpYPY2ev+A=;
 b=qPQQ33Qv1h2OpSHMvPj2DQlR2892pCG40LT8YpKZkA7jH2hgQunN5ZStmTproBsQ5lzbExt7N
 UP7aAnruBYRB7EelY2nyoVDQj4AKvIzAZKmTugIXGNa1KMKo9dwBH4h
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0c29e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: WKWz2KYtd2j--k151gg4PuGOD1PnoAV_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfX0s205sD/umMw
 h7d0STk/R22WxXque3buTOZNmHtM+38Xajs0qjHWElKbPVM+KzVFyK/KEDwecOGZJfqB5a40Mbu
 ZaSZxxhRiVdZJNjsUrAHgF543EggzsA=
X-Proofpoint-GUID: WKWz2KYtd2j--k151gg4PuGOD1PnoAV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfXzGnOvvnc4fBe
 u2FXDB0pz3kvj+WYQFYC3r/qSumXQ9+WybTp2gfj5peRG4EInBf2606Pqa6aycifIfToHTpGBQR
 W94sqLm38GdiJ7pHP21/KeGG3Vj9W6WJ4COgUbAQgDZyos/jQ/7Q8Dx5jb+UfCKFmGJUy8H8ASg
 ee98PShWucsIjNnJhv2mfX+3dRUXO5UcYizWOHJ4uUiL/Y631O7Db7j5ZTwPReENuTzKNmZvyEk
 iJaP2RFZBUZPV72HCBJlj1GnqOfp6Kyxxung394NowZAoosTohHlJqazZMmtSQtL+GREhu/gcJH
 w3fIhxDrkVgwxphpxKprOH+Xy0kEUwDYX/bRUI99VrF6L/f06/iVIkcGGt+gSzah3pYdrSGeyID
 fe6E+a9+F7MeGR1kZOrnQXFV3sh9vHmIU4+HAIgzbpymyeRGzZJccBsO+8PqOQH7FOa69oRb0vs
 icMUlctZqd7QZwpp+hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210078

Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
controller binding.

The Nord PCIe controller is compatible with the SA8775P PCIe
controller implementation and reuses the same binding definition.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
index 63630a814f28..b8ba2c4449b7 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sa8775p
       - items:
           - enum:
+              - qcom,nord-pcie
               - qcom,pcie-qcs8300
           - const: qcom,pcie-sa8775p
 

-- 
2.34.1

