Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF80043BDD6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803179; cv=none; b=D/4QoMvRKs8XLIkRlp2pn+bvELJeJgRHDZz2++//NULNgNILsVusTWEjjTCFsbmv9yZn3AfCaYyUzF1CDVzqwVsGvFd5D7xpTnycKJGPU8D4TBVu0WtqDfkNcJOEDNyuYGSw6O7V9q9HWxgB96qXwhxZ2q8i6mv4yh44dWDx/dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803179; c=relaxed/simple;
	bh=+Zv4CGvsEwVRxTh7LHS2d+Bik8zXMnDWJl/2GkpwVKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6VckzCPbsuaR+TKxilg4xMi+cWad7EUjX1Zp36xdiJ7WhBDbtIB3y1dxmMgbCJYlFtemL4kjQHx2XPqkxvfJLo5nHOWLqNWh83pFTiUlIyE6OyPHKXJoHL18RHHaPexw0gUHJL0BBrd2gR25jvSivCKdPE5nEhYN2CHEkCwXRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNL9jcO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGFARXtu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNL9jcO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGFARXtu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWfZ3044686
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aPdTvyrfAeY8tLRF62Qw0SmrtSQciU0vjFIr1X70y/8=; b=kNL9jcO/abWK3K7Q
	SwTbvBuBitPuOxbGBZwtJRE+Ws+TLXO+6kRk3nf+SbnUvoYJpabJuKr9kcyz95kB
	3sis5OAwwu80jQAfQ3oYRey9Ntx9fcJSqUxZ8GfbWWAGKoUfINUcLnZBNRsqPkPZ
	MJj9d44o4ARh1kiQdWYPL1UxXtfOwqGXnG8eJsVukZSFclq012Ht13E6OxPVNl2x
	afsF6YOkV0HnlXJzTCudFEwVCogKnflEaTVMAbXmy32RvT/l46XYew4oUH7tqVN+
	LOAocJnPegQGBmW0t54EdCBs2S341mZ79/Py2b0XjE/ZgqbjQk5AEDD8DsPeFpfv
	M7XQ9A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq8nkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so699430b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803176; x=1785407976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPdTvyrfAeY8tLRF62Qw0SmrtSQciU0vjFIr1X70y/8=;
        b=SGFARXtu/QI7UufIkfJs5kKjqANAPSkVzdo5Q2TXcqNuKRlLJLQUwHLcSE0x4XIPRj
         IWzPnYoYkJ33lFDerk2L2iRzuXlEs2GMn8ZQ/XQEkzem/v2AR9DTbJ0S35u3uD1J/JZ6
         Qb9gVjfsaDfofIHhxIEWpLGOwvmATrCm2CwtCF8OJBOygyUHDc1x0CdJwx6VytGhQHUb
         Ct3MIxHexS4cT+sIuoJgfRxhU9XVedMv2WEbzT5AA/7nTZlgHnDKIb1wcQfUryXjIeQ6
         lLOM4e9HRbPlK/3RaEQyro7mpN22Wby7A7s7xzef+9jtwdVMyIKTXHBnB3oXZTtDoNoe
         MuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803176; x=1785407976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPdTvyrfAeY8tLRF62Qw0SmrtSQciU0vjFIr1X70y/8=;
        b=BW2HOqVQu6CGJb9Ym+1WuQQMS89vFDm+rUj9+0dpFK7xiZcdQBw3WvYO9P3/daG7iN
         gr4MTeITePMtahP5sRpUJslKM2r4mdFVwDdREslNryk9j9HxTF8LtfuoIzYsSXb3WLpF
         QFitq7fqc3lbeO0S2gGwz4h/LpvS55pW5neHmnkVxGXFBX3E5FKtIsQQ17wMRupYvBTs
         aDGc5/WmiOvLhGLOTQ9W0GHzpcOiWep1YZ15hoFl1hLb0qZcPKfkDON/xuYbKVKCjklN
         efkWiH3Q3VwqVtMfNnYH8n+Ax2bU+Zj2P2H/duqR1693PYte54smdWGoG0YkEVOiuRVO
         QTaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSSdNuUOYg469aj92HgapqHYrCEu4bFmAEp5gOc1dbzT5Ag/16zNuLCSVo4LZz8j9iNIjVC7N3p0CzHuJ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8pbcj98/315P8zNqnGnHIIjjbU8r2OriNYKS076RzrTWKihuN
	L7WnTkHTQ1OpgX2QrFw89GNK+guujrmrEgiOw1NZBloKdCYjbDsJcpLVCf4CFNeR6+AmMkiKQet
	7L7uUhSy52nYxCZ8700yJVDHq/nEGkM7bkLOtLopO1j7HcLgx8bmDwzLMbD9LJJjv1UrZ
X-Gm-Gg: AR+sD11UIqry6Um3soi+zsf5HS+bfhM7VvmgA5v6+q/u9nRsQbkqSSjoBT8nUFYHav1
	jiOS+cqDLpVGGTUm/qUfZ0qd4U6lrUWtnUwQjEZkUMdoED4YE3Jk7B6WO72Dc6TloEgyCJm8cWB
	/zevxoebyduxucimtXnMRNaSZx2takiAWsMWT/h5kv5kBREmqVbmhlfGRirSU64hKNPzABiWhp0
	PdWqX+UA7E15RjVUVHxSBfeugLOZujdPNF9y3MM4PcU7c4cU5myMhq69E2fGzURFwR008aB0hdT
	WwD1H6nfq30uXlxtYPHk8zYP+rsyPm5hjUL+x+2nhWEKLx/1unPl2rdXePP/nm+T28FLFpdOpG1
	nyZJSX2wLjC3tg+NiOklBy15a56alSx70WKJBEl1/PZTq7KPZT6bp3KH7CVqUIrWxl/NWRQ==
X-Received: by 2002:a05:6a00:399d:b0:84a:2e5f:d69c with SMTP id d2e1a72fcca58-84e2b8ae108mr2936148b3a.32.1784803175746;
        Thu, 23 Jul 2026 03:39:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:399d:b0:84a:2e5f:d69c with SMTP id d2e1a72fcca58-84e2b8ae108mr2936117b3a.32.1784803175304;
        Thu, 23 Jul 2026 03:39:35 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm2864469b3a.60.2026.07.23.03.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:39:34 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:09:07 +0530
Subject: [PATCH v5 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-eusb2-int-handling-v5-v5-4-f32ea6c1a318@oss.qualcomm.com>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784803149; l=1138;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=+Zv4CGvsEwVRxTh7LHS2d+Bik8zXMnDWJl/2GkpwVKY=;
 b=kpXWOHzEV0ps/x7U6iHzNioQi1il2m5TOacoHA+Sr7NbyRzj20jsREw/IEx6YV107lmQcevgX
 fHlnHs8AKGFC7lZMDbV6KmoR35YMvbdcDUy2jfQMj2vLlRB3JRCTqNb
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX5vye/7cqFT9X
 jXtp19KQJj9XmT+XDDA3lc+Fdy3CnZg36O/x5XPyfq/Bjk7VPKRKYSIWnnRMz1/FZBv8Gw81Jmq
 JdJwxcsEjDNnaI15TRbIKR35s4o9Y/U=
X-Proofpoint-ORIG-GUID: UjQq17VrWnoQDjJcepfabTrjDiO-Irph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX+h4V+1rsH6cN
 LIDypuo80r143mGxIrJIpNOOmaV8QN4EAa0gEHeigcQNrhqBiGoJlkptrBqLOlNwxAnGN26EoHx
 3eVV0K0vErmXuSHpA1Ycm0sUkgrbV3NqSj9R+jXhhyVSmGwfL/aIUwIiC2oJ4AVKskZwwBoZxW5
 4DABSNnzttWgy2uw9Ekrr+y5RteaYve6vQV6DNw/J4WfO8YZ6Ol8JZ2lV4D4Gpch7JLHGjRB7ZH
 vfOp1CnKH06LleNsos3zQKorW1GGScLx6o49OG3Yuo/6zbkUjTICK5RLEDjJoL/Nv6NMJWsHEn4
 cGJvNwkQoTe7PQpfsgigdYyWm4dhQ51HUSsjAJT9d3pOYcS6kKruGx1JOyq6LTDWJWD8yGpE+Fs
 DOltMFR6ljz4LyS9MoUWbztDpHWrVJFFIWHPwBXYbWk4m6JI4L7o+vR6SwlD1EuyjZmeGTtocBO
 6ZccncQ1bHP+CeFX8vg==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61ef68 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eH_FKzx8O6utXoIrfkcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: UjQq17VrWnoQDjJcepfabTrjDiO-Irph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 0bec8657149c..158c3a55ba56 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -16,6 +16,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include <dt-bindings/phy/phy.h>
+
 #include <linux/regulator/consumer.h>
 
 #define USB_PHY_UTMI_CTRL0		(0x3c)
@@ -277,6 +279,8 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->phy),
 				     "failed to create phy\n");
 
+	phy_set_type(phy->phy, PHY_TYPE_EUSB2);
+
 	ret = devm_regulator_bulk_get_const(dev, M31_EUSB_NUM_VREGS,
 					    m31_eusb_phy_vregs, &phy->vregs);
 	if (ret)

-- 
2.34.1

