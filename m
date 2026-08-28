Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC8E1EB19B
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906648; cv=none; b=PVY/xx2tlxCQUivvm5gatEFvxfeLo48HZ2HqQlCQsSH5otBAnZ6+rp0KV46KmSDwbCuO9Utb2huWInFoaAwq7UjUMEg1qn8BkeiHPYX/0K0W/1gtpfvh84AoMGHlCYluWTTcvTRZnIFr6kOr1MzGY7kYHUmORUnp9z0Yw9QrBrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906648; c=relaxed/simple;
	bh=YgWcPqpc0Tw7AwiZ7DA7bpWlNDJxbNEfk70+YLHN3IM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5RJ17ElXbSNOx1uh8rPTyn6EDOn29eBJ1jUu4BDFihmxPSAuazlHpfUieuNFdFkYdLfGunpvBEf9oopRmqlR8rHiISb6HLT/P7Oc5K+v/PKyaKzTskjoTgFOhsq0q0VabVS5ZZKASahYGt7XOYLF4RZTV7EwLBJabGk7CRA4/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QD+XAuqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6xVhdxw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QD+XAuqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6xVhdxw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66ZRn1520544
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=; b=QD+XAuqqIWu0wKc4
	vfWTahr9L/A1sy/QyMSZMD5OOtWeRDd0sF2ZIt3cxc4yUh2Ph2BCYZz5bKjaw5Oq
	FOt8/Ly6sZROSCRWcRDU1fKxeLTumfxbkNDWGNvgA3RQJIDsdpeeMuZv3iIvL2Jc
	nQ7xdaUcW7ciyI82YponHEp64x30DN8xhGNRKWTywEP4aXmNNZZUAfIUoAzFL9rB
	i0lQft/mQ+HZ4mEIGtUsXWzllg2SgyccxiPGrva7z9rRj9dbtTJ9HBYOU8Hlxec5
	H9gd8e4QOWFQtFWD3aarmgEkWx3WFWYqUuccap6v1hIVnuNFqu2YqYyfZ7b6Qroi
	tXJIHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu8v0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:44:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f80c76e6so11842555ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787906645; x=1788511445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=;
        b=j6xVhdxwycAdr3JxBIgUjdN+JB75NW2O8hHcDQpUV/k7+ADqyrSEDr30TMG8AIxYCT
         65vfWzj26ytIIcDu00AH6/2ZTIDZTCIE1CnaI+WVZMatntgAQOyqYnvpztg9PllrsRRa
         5CtTzruqqog52IznbAOlZa5p3/fXCk2GcrpefLbZUuhWgdE2upjx9LeG3jGK2+pFIJM6
         qyEE443QLewwxmV3+JOcZRxmliMVLSf3YoEomf+UnIp2U64pRoLoVBMKLKUfioWzENfV
         Qkv2A/GJTDznn6ZBOjMZE9GzaIv6h2RkjuprsAok5eEcDLJoAJIjpjnRqvpsD0ODeFPp
         PVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906645; x=1788511445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=;
        b=ZMNR/SG0BRDxqLxm5s1hh5do8+6BKQ06kj1pSmA+Y6lCFXovUogMUq50M82plCndjS
         rXQxnMHZTWf0Xg/hrKHcTQ14foColEQkYyvuHpZQokCHrAQNszUMk+zxL/6Xv6PCvbDM
         uVWS6Nll0CkXCiYonZo1iE/vVwlQ/B8W/XSt1XPuIPPzlfoigO0NkYzAyqje+PEktRHD
         zE4MmedDXMKeJP97oXefeCwjjNXYn7VdNobe8t1IXjsDQN3OWkx4k0FIwJq6FbTTXIdj
         Ik1ocKnzpGpSppR9tXX2tj7xapAm+mhA9tGwyPvtkfmF29w5SHrcPmEBRO+YZTxC+Qcd
         qtRg==
X-Forwarded-Encrypted: i=1; AHgh+RqVKElVE8MDaj7qpc2X4dRzO7ksimaUDj9NA2rjaoCZJvXs3O4ou7sC14pDZcjvCLBOv+HdV1fIFkrzgFaz@vger.kernel.org
X-Gm-Message-State: AFuF++lIKH/WdtJCR9tNRcNOwL3MGljQQ27VADZ8LDpsmyJK2thi0Gde
	GCi8CALTax7rmrjnTbfrCcP6IyZd/0mx8roiYDRjkAaaKjJCyQFuCbh4dbcV4FghHaJx245LL99
	M5LSRd4PCu1jgIIKsJq7L0ujbhYIQDbVJwWbYgmr3GogffCxlB0Q2R6D5/lB5LGqqnNutwpvPls
	Uo
X-Gm-Gg: AR+sD11UGtCqT0TpU/6D3IaLEBNEhPPv6pn11T3ahirkqAyZNePDojlnvNLwQOTIlCS
	eiItH38tp36B/a5AI+fSx4m+9oINCEoKibK0Ag9NPAbH6izZnr8JvNrRIEIN3BUEugm6zvX6bqN
	8eZBEco7MKR8rko3LsoOYmPz2ubZDUFoK+s/iIgn1XpAjL4VjAkD5SL3Othc0x+P40zv9QXFLRb
	d0Q79lvYa3bJ8JNvk71VD+PuiMLj0j7WepyLOauy6KXwS3BOJMuKlrIHMzf14EglfRJbYaJNUmr
	hnFKGdrXULIr2mc02RkazEEmCJ/WKmY/PkZ85bGSKRNI2F+5KZBLqngXhYE4HCILTY7NudUifS0
	ixJCj1b6jT7hvJOuZ3rKHa/dvVQ1u8PE3lWE=
X-Received: by 2002:a17:903:13c7:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d74dee93acmr24598865ad.10.1787906644736;
        Fri, 28 Aug 2026 01:44:04 -0700 (PDT)
X-Received: by 2002:a17:903:13c7:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d74dee93acmr24597695ad.10.1787906644217;
        Fri, 28 Aug 2026 01:44:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784857sm3673459eec.3.2026.08.28.01.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:44:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:13:36 +0530
Subject: [PATCH v2 2/4] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-nord-v2-2-18bf59d19d6f@oss.qualcomm.com>
References: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
In-Reply-To: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
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
        linux-pci@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787906625; l=947;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YgWcPqpc0Tw7AwiZ7DA7bpWlNDJxbNEfk70+YLHN3IM=;
 b=6a9qQEeX3hsEP5/9IdXU63jKORwsf3AJ/9gEUD4IpThtQPlKw/iFS6R7s+vzE3mLD9N87U/U/
 cd63oTw9EKpD8l/xhrwVitROD1e91pXSmwuo3d7lBTFFNUMqWpYJpbO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a914a55 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ly1VyIkaSgMpB_u5KqwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: PVkRbWhd65d35YfDwtWgRH0BuUxJCcb8
X-Proofpoint-GUID: PVkRbWhd65d35YfDwtWgRH0BuUxJCcb8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NCBTYWx0ZWRfX/2UHK8nWbpU4
 exsH5en8tAo3a+f0nLGDBfpjUyfpwBfzNMdLxvFkdEP5ACoXqmVOTC9fmJk4Q4npIAvfNKcNsxO
 ZB9yJdj+vGQdVAxMrgUzwdfCoQm3WFM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NCBTYWx0ZWRfX1sQnwxbbfKU8
 vEvJeV6w716GNrZgU70uciU2fI1JwqKSBaE1krZdFP+j0IsVOz5zRIVDZgNj/VRZ+Vmxr+kKAAY
 cdZLEVhRC+4w9w36CNAkwqVQnoYJL71Qj/BdJmSoJU3BQCTeN/7ReRGCnyUZJ2HlyFyUsbDclov
 FfMVcqLCd+w7uBPnjujdJIwAvlL9cSZTFzPfxiWaPpj4kQ8sxgEfnOihz3aVgV2Ck34RivzShRs
 AJtUzs3B+0fJnLCCMobpiuwElTRxoUUdzRfdqBugYF16fcBcddQxpQn3pFDnkc+vmQaaDD4tE1A
 HUo0V5wenADOudjQWCiYHXmBQse+SthNwwS0gIJt6QDM682CmqB0cHIunSA0Ur+0NQzRqZiudBF
 YYwgsLXGr+X/9vT/Vb7YStR/sP+JyBLU9etsqsf0eu4VXk/9Np2354jPmBYzvRYasen1Xvc1tc5
 3fsEtFXpvifqJmjiJWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280074

Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
controller binding.

The Nord PCIe controller is compatible with the SA8775P PCIe
controller implementation and reuses the same binding definition.

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

