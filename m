Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A37C3D75C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538669; cv=none; b=jl5pAJDbRV/g6kDbZTSuOVvZMZ4QR3SFbpqyClse2zF89fJ++Hlp6DwYYejM2qlshh+f+V2rvZDeGIyxObSkHO3HPtUcRj2TaHLYGiDgeKE4+49wNBezRYN09Ocej5YkegrpsCFeAiShXikzdDOBvmfUDXq5dqYXzfD4iaz9RL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538669; c=relaxed/simple;
	bh=Q85aXDMwvbpzbdqQZSLnN+pKhKHeKEyGsGA98e+i4Hg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eGwTLuoByEfbzC4s1xkcncV4lnitNfdaIwl2C/h9RgUhYCrJ8dpf/Hblfe3hU1MNq0Nu6hD5dpBqaNmnNrNRLsOoGjNMrNI4ShI4jHGzN2u0kP1RO5wLdcvWUl3c9QXfpwWPTW/uPqqZyWYFWawcbdRyx2jsAz5k07e2NTU6wGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFPzLsee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bh9G9aWM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFPzLsee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bh9G9aWM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYlHs3680491
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 06:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i6NubhOqBeR4m4IZ+gOEWa
	U7x0g1qp2eT/RMv5Jw9Y4=; b=UFPzLseeIOAJq+Vja9kHL9KYBg6mDP98pw+Z5L
	FVD3SChuuaVEomK1FoYjLsxZn2qfB+DOjjJPeJx9cB6cKASft7IVjqyWTnWXDay0
	gFzvn3khV+e81OxXp4p0OLRujQLJ/4HgYZa7kF5HKa3jNrTaWzSt8ACq9NA9Uvm1
	udpmV5H+AzJHFx9/7AWc2upWv4K5zvB9XwibfMTLGc7kQ6L0GDQ+8Z42P0wJZf1/
	GVEFdWqe7xhmMZEivKPIVseZZvdqTs9P28J0GFWXtu0U2ZwGKySW1XQ90G3QkXm3
	xWSkEVZX9mMIbq1RGW/xTopm5WcrcElQCnQkCwtsDzYp9fQQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r9m9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 06:04:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso5542163a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 23:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538667; x=1790143467; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i6NubhOqBeR4m4IZ+gOEWaU7x0g1qp2eT/RMv5Jw9Y4=;
        b=Bh9G9aWMIpaZq9s4xddkURfXeeiAgAou7AmT7fhkQ3aexhzYhhLIFUMGwvFIegt7r4
         gl5NA2K7dJHYj0/nfodVJFAhgmzMuzC9G/PLYoTMk8dwuSzLugSgURnAk22XBwqjwNn8
         tUTiSfedwQPtvbva9D8WzmVmnvBCluHbm9S6Bl117xsP8VrtgT6STFqB5MD4GtTly3vi
         bQXnDqIhs+6jxVouWCbpr78lE4pN/EjruBsmtB4cUdXAZCXwQa6g/iU/RGPnVQg3NGLj
         ZcITdg5P9OpnsWk22SN7WAwKbCRrpk4dnZKFnbU2PVUst2xh1UD6MvSeq44BechxnyFl
         omSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538667; x=1790143467;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i6NubhOqBeR4m4IZ+gOEWaU7x0g1qp2eT/RMv5Jw9Y4=;
        b=JLKh9ftpvN/K12a1RKCXARI+lgSyMme09ln1HE/AUBItwAvGVwLk5TGOFwD1MjJ0gc
         Mm40lp1RGF3q+6h4NW+lqNG4Fw932a3HgRpEZ8aIcHvjD0lGZhxzMb3a/1vrmP/htKE8
         9SEIGTJFr188DJjtRvKAcAOgboiGJeNEpuu1nfknQjWSd5PrmNzv9E0isW8ws0KjOy0t
         Nr6Gm9KPa9+BBLKWvpRxVdAGW58nSKEgNu6T9WTraoLf+sZEy816eZMEtum3Hu816pRM
         UWSTTsTs+uNOKxs1IVMYyHQyXlVfokQW78cMWDursrEpXsXcxzTQkn4bM2L66QsabZqE
         Q5IQ==
X-Gm-Message-State: AFuF++m+7KqpC//g7tR8AT364JtcZuR1Hk5eBY7xlqE7TIyR3nF6bTMh
	pcIehWX3BOXXbyW0NB+6aOZVSzOWSyi+yyAvAPBpQdWWugdWQifpq4yNoBtDGVQiaO2rZbn/OKQ
	VZeGHvyJZxtAj5Ag4A9pzkqvvleMwC9DCqYgVYosmzAelauvezNdWtU3JHHpdeBM5D9zk
X-Gm-Gg: AYBFou0Xam0kxIS68WiT8sd1cn0SqaebbmYsFCUkmq+PFrK0Rwe3LxWkdhlWF6Jj04k
	+3A8ig6Sw2WVkqsY95Ki5OyaFAI+01m02PU+96CAEP6XJSYs8xClZ21xDScZHOOdA2AzQBpjnI1
	oHZWT0ZdC5rWys3pBM9BBCzThS6ltE/xHteNg6GJraJPILpYC7IoK0OCEZ50M2yx4P1Bo6ljJmF
	JSfs//M5yvLftHLx4GumCE5bnf2L4cI+6StFYG8+ylHpLvzTrF5YKDaAfctI3D+jSqVBGElphtj
	eArxCOcsW+t1zxq0LJhskqHNGwg29Uv5sL6ry+hxZgkGRyEBOR3aG4reJRwUoKZEkFUxo2NSwcF
	oR5zLGymWzQ71aK9DaysUjQC9Ht1ALlMWtjpf/sNycD2a9U8=
X-Received: by 2002:a17:90b:2f0c:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-39e1e308bddmr3723946a91.9.1789538666617;
        Tue, 15 Sep 2026 23:04:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0c:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-39e1e308bddmr3723876a91.9.1789538666197;
        Tue, 15 Sep 2026 23:04:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm4740083eec.2.2026.09.15.23.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:25 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH 0/4] PCI: qcom: Align PHY init sequence with HPG
Date: Tue, 15 Sep 2026 23:04:20 -0700
Message-Id: <20260915-align_pcie_init_sequence_0916-v1-0-0b2195836f30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGQxqmoC/yXMUQrCMBBF0a2U+TaQFBKpWxEJafqsIzLWTCtC6
 d4b9fNw4a6kKAylU7NSwZuVn1LhDg3lW5IRhodqam0bbOe8SQ8eJU6ZEVl4jorXAsmItQbjj85
 1NvVIPlB9TAVX/vz+58vfuvR35Pk7pW3bAQe4xpuBAAAA
X-Change-ID: 20260915-align_pcie_init_sequence_0916-571190abea56
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789538665; l=2301;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Q85aXDMwvbpzbdqQZSLnN+pKhKHeKEyGsGA98e+i4Hg=;
 b=VanMV8I3b6x/UKi8Pi0uPylqTjCwhgLHtLLspbcP88b+CZT1gM9u0udCt6lZrEVLqwiiDCt3u
 OIkB+RytzmiAGVjxv/dp8txVevQMPr4OSRhvgqLg1w87iUb4GxONhWv
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX/TeFahsawHP3
 F4xHzsA0+53VdR4tFM85b0ZFpSwPF7Bgyujs44Z7+nUrTc3Vuz40wOEh+KR5oGQ+ML06MuF/BAC
 MsnWf0cZgq6bUy6q51FbWoWyW1ES+48=
X-Proofpoint-GUID: RIA3N4VW1w6VmTbqZjqpQHWWdrEHAIqo
X-Proofpoint-ORIG-GUID: RIA3N4VW1w6VmTbqZjqpQHWWdrEHAIqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX8+BmMTAadX0u
 57XpC1C/UVopNsy8MO+xhr5t2Q1k64ZfcqNPJZXE5l/vfkcKrRP0DJdi/JSHZCgCGwGa7taTfMd
 Hy3Zp/h8RqtVHFgb85wTyFVtn64tZzSLiL1USci9zThkKXtJ2kVgEEY9JSxWb7yQgXKWFEQ1wlr
 cXpcN4tkgO4np+kOQMfeZsJ0jYTwp+3zzSSwBxR9iyWpEKf1p0h0uafVj/AIAxt9feJoYEg0E7e
 vpybVEdXM84p6EH/Oyrt8UzLShnKIyH1XfcgiGSArs9RKQWfPMwKH0WeuQkTs8NFVoXKO88tyTc
 BfpAwYq+I/igED9oScxdgy3r97wlXquZwcF1LpgvKqoUJtz14lNhQRPOLF3TYQ0SUXEnAwHAP8n
 mcgNmr5joY15/0Q9fGRQV4kRuP+URe2fyRIRtxdZHlr/0665Tapvh0C/uMmIpsRzqcRZeQF0tU0
 ThyP2ruhxRqY+Y69xjw==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aaa316b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Riq-LXKwlQ56QxmQOhoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160076

HPG requires the controller/PHY GDSCs to be powered up and all
clocks enabled, then the controller's reset and the PHY's reset
toggled together as one group, with PARF_DEVICE_TYPE set right
after. This series adds the callbacks needed on both sides to
realize that sequence: a phy_reset() call the controller makes as
part of its own reset, and matching phy_ops::init/phy_ops::reset on
the PHY side.

Patches 1-2 move phy_init()/phy_exit() into the RC and EP
controllers' own init/deinit paths, add a phy_reset() call grouped
with each controller's own reset, and move the PARF_DEVICE_TYPE
write to right after that reset group.

Patches 3-4 update the two PHY drivers these controllers can use
(phy-qcom-qmp-pcie[-multiphy].c) to implement phy_ops::init/reset,
matching phy_ops::power_on to what's left once
phy_ops::init/phy_ops::reset are pulled out.

phy_init()/phy_reset() are no-ops against a phy_ops without
phy_ops::init/phy_ops::reset, so patches 1-2 don't change behavior
on any platform by themselves; patches 3-4 are what actually change
the sequence for the platforms using those two PHY drivers. Other
PHY drivers this series doesn't touch (phy-qcom-qmp-pcie-msm8996.c,
phy-qcom-uniphy-pcie-28lp.c, phy-qcom-pcie2.c) are either unaffected
(no phy_ops::init/phy_ops::reset) or only see their
phy_init()/phy_exit() call site moved without a sequence change.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (4):
      PCI: qcom: Move PHY init and add PHY reset call to align with HPG
      PCI: qcom-ep: Move PHY init and drive PHY reset to align with HPG
      phy: qcom-qmp-pcie-multiphy: Split phy_ops into init/exit/reset/power_on
      phy: qcom-qmp-pcie: Split phy_ops into init/exit/reset/power_on

 drivers/pci/controller/dwc/pcie-qcom-ep.c         |  26 +--
 drivers/pci/controller/dwc/pcie-qcom.c            | 165 ++++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c |  94 ++++-------
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c          | 184 ++++++++++------------
 4 files changed, 257 insertions(+), 212 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260915-align_pcie_init_sequence_0916-571190abea56

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

