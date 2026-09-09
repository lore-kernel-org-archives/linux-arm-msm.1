Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E335437FD
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954529; cv=none; b=ouMKjw/B+8dzX08lqZIjaB01gGFjjSSITwnYXCFsXrR5/F+aWI7X4TI8+Q7XFcT7SInxsKuzeh3Oqil64ubpGFx+P4NjuWEmsMpRBwqouRoCgRMN3uvs79scXFB2iGQn5gK3RQB2cH/Ky50xzrpA8b8XYCuqanRrim/q6BGrqCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954529; c=relaxed/simple;
	bh=9ql4uJf+bmo1nNNjIE6D+tbj4KJVSk+Obl363fXcddg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mfzn1VzZFQNvuBATiqcJ5NDMo4kLd1KnUfB1D5snbiY3KIKCp6DEOyIni4mN1G63Yy3Lh0ih/7y2SnLHDdMYNdwjuD9IAwnrzRUyQ9zUUQO6rJgJy1PhSYaRadMmc162bfIgGsYZ6/Tal2gdbdtlyOtuU4664Zb+KUNv0VhUCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGjfqDix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7HV/TQW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGjfqDix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7HV/TQW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU691599687
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ptw7PO2IxZi34/R9TCTZRFlXTJ7+L0nCUhyqPDnhdQ=; b=bGjfqDix/tOmRuCp
	DwiVFyVxJU9onH08g6OhyrXvMKY9ZeLHlA3xj68GqzeUVgsCDENmta2l7Je7ut7P
	NULOt96MDkIrpGqfG0kN1wAwTWhPVvCmyeUECZuCFVR2xjQz2wDFglxpRVfEyS+e
	tJX7heNcIMTEWi8OkTmdJBem08Dhsk8jC/jNH/c7Ac39TECUN9Msm8kAslHyxTgU
	31UBEPN2z1S5kB3SuxzfPPsUSg+hJN7dxxuPAiGTmekNjALwWtoqXQx/1ehChCV9
	XYmPscY8Qr5SvdMN2giVIXVSs332mR12pshk9Zo1EXvCie7xV2E6uRfmGEA86IPp
	ErzrDg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1sbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:48:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dc92350888so14943055ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954527; x=1789559327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ptw7PO2IxZi34/R9TCTZRFlXTJ7+L0nCUhyqPDnhdQ=;
        b=L7HV/TQWDwhsrLkYCRO4r9MtFljvhY6x+mPf60/Eam93o/qu+fhFfD5LwO729j92XR
         7K0kaszydbE9MkxoZoCA4wSRzuzLov+sjF4bvhaj1FyeOBi2JQN72DZgqPWHLu1HROpQ
         sQH1DAZHBs9wky97GlH8JGreu0TdPVRgnQkvFeb75BUFu42tTjAtyXUZNNkz9mGK6kBq
         fNH+ISkkEoaPKa5wb9nKBcg2ppbW8DBfTGeubGQpG9mQYbpN2ltV83Dqj5d/vvLxJ4/1
         1QO/YGZlXA3Db9+bSpNEYvD9U8AS97KFOr0ij4uWigi4g4FCb/kvUbWjrTDIu1UCarr8
         J5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954527; x=1789559327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ptw7PO2IxZi34/R9TCTZRFlXTJ7+L0nCUhyqPDnhdQ=;
        b=LNxkECjIz7PW+eQzKJHReVwXjF7dYqgGUOn2/Uq7cnENbicPxqbx8YjiFt+Qqe0SKo
         Pz4798rXsEcwaTnouaGwZJHd1HB27FRFEK0D7lmDI3Uatk08SldLaPqyuzWlyNfYdGB0
         GBIRwPgYzJ7zW9lkHHFR+z9WUOPvZUebTv9VfkUK1YcPFfc5EvV1WNpecPsdzUspgxIq
         LRb6y6OiOC6dlZNmRIpY5ParWwXubgihRo1NN/2ttRcQQAvZTn1R7PtTWWBfhmPi9lTI
         pobA5/NB9eLJ1w63BBngfMlmMKq2TPUNKksrkEve/hDRxFMuHoe1o4iHaqw8rgG9E0D6
         c66w==
X-Forwarded-Encrypted: i=1; AKwUvBxuAkQHz4ATMlZoteb9lLFS9kHkQN+IqLC4aYKCiUYTYVDHwiSH1zRMSQcDhbplytZc6G7S1DjdKuL9JOOe@vger.kernel.org
X-Gm-Message-State: AFuF++kD9DPf7NQCURHNQYHI6nN4lVonpWxuvo1XYBzE6vrY9qFuD6oD
	oq0uCKaIenOo/modVDBkn5R+uFqRB1v89xSNfUhKlJpexCCAZJioyucwBkzA2biI8GTMYbJ75Us
	uzXGMPtcQf/iuMztX1USuEF3aG5V079fvN0Fv1QMY0Afqydhk0m6jNA7uUDg6SzWKYfek
X-Gm-Gg: AYBFou19f/JPtuL8PgMxG70dRlOjVQ20M0gS3C6sH+Btjgkn2Ai8orcW++HaVAfW/40
	0f6NRfvxW7BJ/VpL1Egu0JCEavXZF4EvSGnTBapKyRoRieIJ4Z/WwHxNoRgN7zVrzhWbjZErFy9
	60cJ8bsUHo7TSVeASkZxzuIWzvFuzwndkYBKU9rWgDtKEWcsPgLeHAdRgW+49sMgwyC0xNvs9It
	hgdjayWjcPCPl+JfyHETaP0OEQCFuKPdOmjYM49O74XaseSILEX8yvHk4gZ3oK+KsTu1mGy4Pdd
	kzNqly+1Lz7Z4k052I3MUwRGRcl4+HoJKxv8JcfaN5IVF10PFldVwhE0zfr2ilLc5M3bXZUa2jH
	b62bV6MqSwtamkToyoGTJiykMzAxA4qU7L0I=
X-Received: by 2002:a17:90b:4d82:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39d70b1c7demr451390a91.19.1788954526464;
        Wed, 09 Sep 2026 04:48:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4d82:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39d70b1c7demr451338a91.19.1788954525966;
        Wed, 09 Sep 2026 04:48:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm50156857eec.21.2026.09.09.04.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:48:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 17:18:17 +0530
Subject: [PATCH v3 2/5] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-nord-v3-2-b0a82721c547@oss.qualcomm.com>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
In-Reply-To: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, shengchao.guo@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788954507; l=1017;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9ql4uJf+bmo1nNNjIE6D+tbj4KJVSk+Obl363fXcddg=;
 b=tHX0LCb+5Wt1So4bJXxbiVPpqbP2gOaAqHp8Cg3P+pLnlwY8fy6UkI5XFgrfp7cKloLGT8Qan
 L8Q6S80Gq8LCUIq/jcybPpijg2GnFOynErCs3iFo128QGtDJjWYRbka
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa1479f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ly1VyIkaSgMpB_u5KqwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX6bCNMUSxNf4G
 lmfgNxpK33KkIzfpH+egXxye7LEishDcEoJEx5fY24zYmOgJcAh7C52rdyYutbpJYPSUR+fs/qr
 Krxm5R1D+4vbJogtSIm5Tdj4InzdXMzmTtN4Pz0JuBjNUY+18Is23oZYQADCzAcyVnx3FQ0RXXv
 KyOdWp5K/SK6CHg+B5fjGBW04WyHTiP7FhHMAXOEOu/pVgm+3V8wGNpqYAorZHfuQk0cfRtbDs6
 QbEeRGhUmBXaPz14IktznwbxoE/chGXTV9U0hkEFdGnXUAcMdntWUDccEZi3QEdleWYygHspEPq
 MKG5sM7priPUpk7caJzR3dMNJqFt+IoqiGocypQW5rvj8GhJF6tYDepT8NOP0jvBabXAI2Ho55i
 Cw7DPneqMBUmlhJs1bJcOFDLKf07v2s4BdVAqiaAJkHgrh3p6heD/LD/mI4RBpusvetK7jLfQyj
 hHFg+VyOYgWngxSut4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX161vOaLTsJ+q
 OPC1+mOrlDhfKdFYrxORSHAxGxNciptAgL4AFxYNXBmZo1R5klp+gwAAd+/Vm4Q8auJQciNYPmD
 1l9YnHD7Bhu+g2Gf/O6yvR9IAHx614g=
X-Proofpoint-ORIG-GUID: AcmDMIEamKUb9vKjvncEMuTmrNsTgGJr
X-Proofpoint-GUID: AcmDMIEamKUb9vKjvncEMuTmrNsTgGJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
controller binding.

The Nord PCIe controller is compatible with the SA8775P PCIe
controller implementation and reuses the same binding definition.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

