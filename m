Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22684B205A
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622180; cv=none; b=X5sG0c87IhA/5oxszWyu0QyxuejLMLHsAFK3vetPiIbGfS5hkgPphLIFEkXk3GbRRK0y0Uwq4bHJ6Ax69FB6w9GwQiP2E7Hb6MiBrbmk3f3fPG48ubA2BWrCzvizaKzLVyN1l2XNuGwT6E3dCRjN3QfQIWcTbFim38r18FxRozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622180; c=relaxed/simple;
	bh=GPrSCfl0Yj1JdV2FeMmFmQLmwm1cIxqJOqZ+rh98oHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4PltCxjFnbnJioV3gUGmvbWymdASyKNDFiTmRDcN3eA7TagnqkNpfTzrR0QQpBllR+ipiIQHk6GzhtyaqE55I93CS6pkPKq/bUN/GYCgw8zisLg5bigf/h5thiv8iQZN2BVYggcI4GBRA4TZsC77apstZCOrN2u9Vn+vQnGsYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNMvRxmL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENXkawxI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNMvRxmL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENXkawxI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685Egh662933604
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 15:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OYLz/v7Lr6tusPpXAKBs3opd3cEExdBka0TAqYd+6kA=; b=fNMvRxmL4WYPp1Nf
	jZAxHjZiO3kYlBn84wGxual14h3D/qeIJwKqLCBSspQaK2KQPW5qWvDMDuJJrlXN
	KmerJVA2bbybOAeSd5hz489emuX2Gx8755pRXBXaDNpV9/7DWGNT7V4FdMsV+9ND
	D7bkFQ7pB+2lRoK9Q2qig6+aWKT2s2bUvqljB4krBNNd2UlIMTmghNPYfjtIw/2w
	hlaXOo+Ov7bLUsNeURfNHbdZmn6f4C9y97dIPTWh+x4FB5Cpqj3ak2IDhPykDJX+
	TaejDrcUOJfdFD7jYTqKwRBaHQv/vqSvsAwg+QHF3NIqkidUqrEqGY0U6/soipeV
	MRDfIg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga371jf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 15:29:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so2504999a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788622177; x=1789226977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYLz/v7Lr6tusPpXAKBs3opd3cEExdBka0TAqYd+6kA=;
        b=ENXkawxIn69Mk9D24+KLMeoY+PF61lr1eDTUbqObsq58N7tzvdp/octiK7XRC7Jq8J
         mXhYeg2S/QZbd6C5NuFRbzbEQ234kGsXfLPvt2aiv4Jj0VWxjinwHyDdDllEgKs87Sln
         qBUMbNsaIoARrXrQ/oRzuUbuXXYjJELs1Aa232WzsNdyo8kJ99jzyFCeEUsVmXla+pzK
         56AdllEXnQf/W4MKItWyr9N/goltxUCISYIHR9VAyWSL50HoHx6uyAmrdFbKkT3PPb8N
         a7T9GEHwolBM9Tmf+OPHGo9aLWMSQTEGyPOR8SzAWfXGmy3woKS46x7V+zP0DH865VjV
         b1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622177; x=1789226977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYLz/v7Lr6tusPpXAKBs3opd3cEExdBka0TAqYd+6kA=;
        b=LPo9eXBtrXPFCB1OFJw0dN1LNM+Or1mccScKmDUTJYKkTNyA86yXkDsmx4Pvtg0nnd
         R8GBWOQDM1Q5RxZOlg2kKIE2ambf/hsG9DHb7Gia0xY+GWKZB3lEuQi6/p9Wim6hW/id
         093QW0Iso/O1adkVaImEU+JaXB8YHUICAL6PBiLvJAw5q1Cgw7tqo5iqct11q4WMH6di
         sDeTLvaMJIHlcKjxB/yuU5syDlDPgTN7fkEM936axPmMumo87rZQXWeG9eKuFy0w1MX2
         CmzJB4ntyoZ4afV47Xr6IGcHRWV0nRH4YMnICNG0M72T4tDSvK6HLS1d6T8APMSffSQ1
         S8dg==
X-Forwarded-Encrypted: i=1; AKwUvBwyFNBwSjz0h6IGdDzEIdPUBZyU/D1Ec/sp8MvWtG93Ev7mKew17TuHrfooTcsHoOA3M1U48HC9xpJ5jn5J@vger.kernel.org
X-Gm-Message-State: AFuF++nsFRgsK2hob48bK8ceyMO5dTUSJpQ+E4ZQv/g+Wqg9AQH2z+gp
	3aofVzevR5HfTJIXs/yLfoXbNQY6MrX0/7B/nbMBcGEezceVc97zEKTIb+sg6xOTBz264GIvWAM
	3Toiz2v8/cm8sYqXdG7mht8BGAFJD5iGhzx7P6Kg6ew8USyhGRMABn29hoiQjIVR+K2O4
X-Gm-Gg: AYBFou27XbKruleV14VfQjtrteUnOYir/QGLub6Pc8oAn8op5SFiSduYsVN0DFZk8tQ
	C6G1JN8y4FlvoOZN7odRWxtw5cOEz2nTWUzqguHT3LrNN3HUo9lN4QCCa2vH/1MIglbJJgIRLf8
	G/WUE4butkxeLxxjNo/maqeCV78bpw34651WaPqtHgSbz1z+Wc5M2cRs4xwPxlZcnmz3a8mSOqH
	SmVhLV6KaER8ElmWBXi/+tO+uPytfTV4Kmnt94ECO6BABglxvuYOnBP9HyvyNaZWjAtJU8RJSEo
	KpXYO7lKhg2TwZz9lZWReQ/69pXVg9XoePXqlWkAWaY8Xu7x2p6T7lLE5B1kxw+xZEp6iV4/oz8
	1wCxOT9ebdBXf+lr1uorO/SB6PF8MT6LZc1U0X1pkHFJFqHW/vmhLuOBQvXYge4wQTVpHPQ==
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr17826462a91.3.1788622176857;
        Sat, 05 Sep 2026 08:29:36 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr17826389a91.3.1788622176272;
        Sat, 05 Sep 2026 08:29:36 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm23592635eec.16.2026.09.05.08.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:29:35 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 20:59:08 +0530
Subject: [PATCH v7 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-eusb2-interrupt-v7-v7-4-820cf5377a70@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788622149; l=998;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=GPrSCfl0Yj1JdV2FeMmFmQLmwm1cIxqJOqZ+rh98oHs=;
 b=FPapLMim7Tuu2xVBDLSJ5NPTIkisSUpeapsgsPQC/tESB4TSoiya7Y9g0hnCJsq9IuL0xtZYA
 Gvtg1j8YxjhBuh2cdiwuWDugjf0l9VfapK0TJsXSae0+tSNc/4d5gmc
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: Lg8obcEMDtKN-vMemVnnf-ZVeHUN-twD
X-Proofpoint-ORIG-GUID: Lg8obcEMDtKN-vMemVnnf-ZVeHUN-twD
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9c3561 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=GXgYrK0FegosRrsl_UwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX8nN8iI1b0L87
 5gdJF7N4z/znkcbRpXASYvoKnKp7jvkZjnVcDA7WyjtVPiN4f+5FsxAsRMCuy0uFZOisZTlwRmr
 sCGcbvvm5a5GVsJVCuOvLMVoPTvOsLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX4hqNQ3kXvu4v
 +End1ctfEoPCRSfHs36PYmzXmT4yXZMpfUgdZ/xME293DTThc26s3B4znKNLmcunpF1DLf75P6z
 7jeeIahIuIcIdCIYwzfZPtC4pZAMLoiwK404T8ADbo3pIMMQlVGG+eJks2UQU3D6Tqyg2KsEd0G
 CRTEsXOXuYW8AogN1jdV4yPdysHhSbNjO8cP9bDE21GsVnJjUn3pytBm8ux1oF6f68GuK5c6MYv
 QeP68u5QJx4Y19ijEZWhBC+S5sfQnP/7YcaaBSrTzCFVawh46G691AMB8yW3WtwijSM76HR5gnu
 g9nGaMwqDZ5YmpoJnfyXj7yZeLUTsLSbtf5k6WBWSdrEgJqS/m7mpBQVxBNZMk+g714NdpyyOyT
 wO94pPIFF34a1w/tZxoUAit9jNi6D3CGsPvbyd6iCxW6VhH7LTjefnfJiElFaLjE2SApzREPeEy
 A2nbPZCRA8RiMAYxGBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050170

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 275df38256de..72fa71003fd9 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -277,6 +277,8 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->phy),
 				     "failed to create phy\n");
 
+	phy_set_type(phy->phy, PHY_TYPE_EUSB2);
+
 	ret = devm_regulator_bulk_get_const(dev, M31_EUSB_NUM_VREGS,
 					    m31_eusb_phy_vregs, &phy->vregs);
 	if (ret)

-- 
2.34.1

