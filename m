Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0E43C1D62
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161193; cv=none; b=aI4u6qwI8SweAG6q7Qq/AKvkSXvt/sxh4NvIKbELyOzraG4tDRi+72AipRjeH/oTtI5Sewu3KMlivFlc7lD1C8Cf81W3l2gPVXVq0E6hV4/iGBbDri3JH28Ut/WNtSLm/TpiOzUmaWoLzUo5le+V/VhMts0RzO512pLRs6lSeQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161193; c=relaxed/simple;
	bh=GecsPtDzBCsWNuDkEsU+ZgpETbYSghfoMtZfgts9qAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAhCXJhcuMOwybjx4vumJYmiItLtKqit9MmanxnN27OxjDlVzV9yFb4Q16HSj6QxXXNysjKQWVIpG7qQgdwwUJ0Hp+BdvMYes/9JZ0XZfdkVuedyI3sxMlxsW2HH5uG+EuWaMJcKQfJqqV0BBZ/G3YTg36gdrOOAnjzxVD4BtrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cb+W6Ypv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDXIIedV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cb+W6Ypv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDXIIedV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52THf2617673
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=; b=cb+W6YpvtF5y3yAX
	6rv+oXd/Q+wYrFm2Yws/rl/HK2EjfIoPbxBJtMqDwQ+JCI732Mfj8v5dJIT6Uxcb
	9HQgyQrV7Kr1TEn514xea1pMVxR7b+LRX/Nv8oWaRKszT7aArUrkQx6p4ur/AmsO
	fS51NXhrRC8itp+FNwS75r939xLjcCMl+Lrao09ZCUmh6IJ6vEi6Yk+8YSEcXNEZ
	oiWRDeWJeH1COoI7yOKlO3PxoTz6o2s8NLZrw5YPIKDN1cG1g23tHhxBkEf4u9xZ
	w89shjs6k9ZouofbOPUZlGPCuaRGsA4kHuvY5oI2qj4Xq0n9uW7m0wWcq38W4wdW
	oezlqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2n5pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:26:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso5835336a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 00:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161191; x=1788765991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=;
        b=EDXIIedVfKqKQixsOyKIAoF0BZ6YjtUg2z6HLJKTDwsaNSuPCQkmEyhI2rtm1LL1SH
         e6lM2JW3ydC3KblbnAF2sny5wXuVGh7aLOYYo1LHPjckjGxgmV0w+KR4o8oIVnXv/mq5
         PY9HVPi3VT0EMSLGsVzHJOninPOH20SG8HrfTUHId8no3Jo+2gW3YDTn7GqmZKOolCMd
         N9XHRE8vfXiNXP6k1Fw5P9dxCTHApijLai+Kl20geJl7QIyjMSoyzU1yp+6cmhqXjosS
         vqipFcfwXk3cZgK9JsHgb9uwlvoKdmUpymM+emxRYdUCDdMOJiTPXqpVizlp4KYAdRam
         d56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161191; x=1788765991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=;
        b=VgzpzuKCv7+/+39IPt2jfxfRw2EzD89b0ca3JcGSU+B4pjF8EPJmsmcq/ho7HOoA/r
         /hDmoSaeyczOteLKSvS5HNwWpMw5jlFWiHh0Q2BrVQI8/pm4amcezcBINoxN5ljOQA2h
         J28QvmRdL3OKfF0lTvYth2SJ7f3+MOXOAh7zjxLxDKSfr7YoXf0ZgrLxu+48gE2Zg0wQ
         KtudmTCV8YY34Pi7NO0QU9ud6yQq02zJWipus4A0gmOwFeOC5/DLl3uJCQsjn17vkhWs
         3wxT1cISFmN4NiAaC3iXYRAi/FIAQ/h6nnoWfuFmUBrkdRyZM6F9HifDzt80ZRhFh1Ti
         cO7A==
X-Gm-Message-State: AFuF++n2wi5nWIwrO9iQZwAXIM/yxTY3IrGwax0lY+w13uuUdSFICF+J
	SWhu9A7rdi3mspAQrnuR5sEbjPuCa0IVaAt58+iBmbEFkFOxaGI5xFJawwI0YGcvGUEe0WzfPC3
	aqshHQPd9sxfmao5F0E2qTv6r6sbtnpQkfS75zEcNxb8Jx9fDRGPA9W4Q0QK1oLClvAeU
X-Gm-Gg: AYBFou361ozsFSIg7Vvcj5fOEt3z0mIi9aXff4Hysq24HcTAhLJH5WzhaJcxhSXa4KL
	/vTlxgclJJjvHbxlynixge6kEiGlkXUTGFELOdGUy4C3gRwZTtz8M2gnOYSjMFeaJdmINgq1dIb
	ki5CxfNuY7QmBN+fQ9aZZQpts+Ry3amF9YcF1BxTls/ACJTQ+3vwSr3T9zOBt8VuC3mlCTQAqrK
	Urtrk1gxbypTO0unLSuEO5C1G1WV+ySixvKmAulq2VaCmUIg6zLsgR/G6prkHBuOP9zSdNyJ25D
	6Mw/GEjhHki4oI2aWD8/xvdt8BY9mwx3DtyqkdWtghwbpuNridR3m6+U0sfUUr3JfCyR+pKWGOb
	+Bhz23ltEKlxt5ijTT3jSbGQDcK4e65xHL7PI
X-Received: by 2002:a17:90b:1a90:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-396d0f8e80cmr34398745a91.10.1788161190470;
        Mon, 31 Aug 2026 00:26:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1a90:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-396d0f8e80cmr34398691a91.10.1788161189996;
        Mon, 31 Aug 2026 00:26:29 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm31327059eec.14.2026.08.31.00.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:26:29 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:56:03 +0530
Subject: [PATCH v2 3/5] PCI: qcom: Add support for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-shikra-upstream-v2-3-406661d75afa@oss.qualcomm.com>
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
In-Reply-To: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788161164; l=854;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=GecsPtDzBCsWNuDkEsU+ZgpETbYSghfoMtZfgts9qAA=;
 b=55ch1aG1G4LspPpgrm0K7D/1FVbflwomwl/UnDiUlC25zvssra1xrNLuTowwVyhnQIx1T7i3y
 BD5Bn6bEEdKCCwrq2EXn6BNFfR1UIiPZkXZLQs7q6LSnHDVPq6rJGyE
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-ORIG-GUID: sC-cRcpH5OmtJ2RQBh4_B7c9WxNdzLx7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX3iS0Giy3Em9o
 LB5zMjV8E+Rs3K+HwN+DFK6yASlTWEsPoLMMaRLlAahiozZayTf5fESqSS77ssP23GOvugq7dcX
 zgNKnzAkDOKXKNmroNzTt4jjO1o8nEGS56sogBpZkurSWb7RbBpc4vpHELP81XhWTEC/1MCwsUL
 VEv1vN8A9K97y6xfbw8xKbYjS/9bqovMLOcdk55YIRMgdGWviLnuvQabEjVdUBztyltwvlV0dHt
 gcn4678dtrKJBZy6xsFa13PYkI4X/9s/15AV7+pmIzkF5eals20wMix2gkp3o+NdnqqpXjv/8lD
 0PdrjQYf58wBQArqroJd/14DpqAZQWPrvr3V8K6Np0xc2LYmr1ohXlYG4Qa3UWHqBDvuD7f1hBr
 t4npzzmmvkb0eJ2Tpz49oD+7g6PwM+D11En3YPa7Q8wOkrqLUNJiIwAkGFgUqoEyKYv+p8FKnbl
 eRE50YeticzX4OvaAXg==
X-Proofpoint-GUID: sC-cRcpH5OmtJ2RQBh4_B7c9WxNdzLx7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX2T9MHnUwZOIp
 yt+vgDX4UklWYHs5DHd4W32YDKoRWAYtD7tYIi6+ooLpSFZlh2k0aUF0kGANnJPfFGlI/Af+3qu
 v+ANePGwkOjKd4HRi0uQN1GnMgG2Kbc=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a952ca7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sKgv3_SsqRtbfYgyWx4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310063

Add support for the single PCIe controller on Shikra platform
which is capable of Gen2x1 operation.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..19daadee65f7 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2309,6 +2309,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
+	{ .compatible = "qcom,shikra-pcie", .data = &cfg_1_9_0 },
 	{ }
 };
 

-- 
2.43.0

