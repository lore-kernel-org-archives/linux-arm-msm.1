Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180146;
	b=e06va3A4bu2CF6sdzyCTLOEtZziJ/JB/mz+68f+hlczK1MjncCRahewfbx4BqagY4FCn
	 uPX1wcN4OH93AaXdDi1VS0EF2dEMpELYZM2qPS47zZojNFmmCHKO6j7+N86fEL+KGEabX
	 CxrBDXQcS6JlIywHg7ByMzmMQaJ+EAqL5BGZEFWoMun77Zu7cNTdUMhixr3veZPQDokrF
	 useY85vGm1PKX+1TTZ2oh1jXcoFpqurtAj+5zlPp9SxC4cg7Rb+jicO1VrqDwY7eG/gP3
	 uwIGIGEuFX5EAmmumS0Uaas9BjqNUAlgp3RUPwUeAyuxc1kqAgiohHKFUDFhUwTzRig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hGs8USrteTCnFgTKJDdRh8wPVgKar+hqcdnXt1kAxFo=;
	b=sTYEF4IFIczkj+/0dCSPBh2gZnqSYXDaqVZd1OJpip4zdOzJp7I3OjTzftbCeJ+IPsFv
	 NVeG3FjixcHrobFWijIljBZb5co/imRCMWcWsbgvi2xWmNSIw9n8dfu43qY+VbkfeyDg8
	 mhOD4YafLjeRuokocKGJvu7eMoD9vInR6r7XSgD5qvxY0LxtWiwbDsCU7w4+nLp6/dXxI
	 iPYq2DKm+acgCA/RCnoSFUS2aTSA/Vegmrw1tNV5NZIvPY2SjQgxiqu/XWwzSzTK4iOzV
	 IjjN7Qocd1bhZ/BCcdKJCWuM0vLjKnFTtz8b70DcnP38GHMX7ii1r1+o2HXnS6tQIHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hiruiy6K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0+7hSUx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E5A606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E5A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hiruiy6K;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0+7hSUx
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K9xC1642886
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hGs8USrteTCnFgTKJDdRh8
	wPVgKar+hqcdnXt1kAxFo=; b=Hiruiy6KYkekflFte1OntuldCqpqM7L/itqkxY
	CkeekEj9xGTeu5Grz0XlY0x2PEEId+Tp+m38AI1iVuR2p2k6ld6o/xPHiGnWfR6V
	35OrAoUB61bY3jaT6XFvqBe1KVJLgzi1L7kkiqdzvPNChguNKj4Eoky6FKSYnqpp
	2rAkDemEN7fygzAiusW9aeQtnM6DLCTQip9+LA+xOOuG+WqDT6LVepmOPLaSPBP0
	zCfcSWhwUmkkiBazRMV9xtbrj4qjZF6yQiZizFNR56XZ9j72kTi7eRmLHOp2AhjF
	xUffWjlseRnJB/VadQlqN6TsiShQy3TnuQm9C9/dKhggyHvw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpubra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:35:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so709822a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180145; x=1793784945; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hGs8USrteTCnFgTKJDdRh8wPVgKar+hqcdnXt1kAxFo=;
        b=A0+7hSUxUfyJBF23Vhz199WgIwSJXxOI+Fq5eMfiqe5i5/6Z+ImDBQSRMbNJDZsUa+
         CPSDVykCAA5i05RpdF4WIKDk+TglnArkalpfDLFNRlNvdg3jHRyYL6GsQSZs38i7NreA
         pnn2tkFqGXmW9ySSmSAmpgYgQY4/khfViJYSXv+qeIuE4YCcwRcqETdvR/ef5jkL6A2c
         nQjWmrpkyluSrdjWj6hFeh2iHV8lU3LAfS2l/pPrnq3f0E0CO5SQW0y6DqJwTZdlmH79
         OE8xcKBSJHvvnp2OLmB8/42LnqNSbSWk8bXUFGmO5cwU6VfWYKNCCCaecFxwyJy2hY5P
         3E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180145; x=1793784945;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hGs8USrteTCnFgTKJDdRh8wPVgKar+hqcdnXt1kAxFo=;
        b=S9ML6KUQ+0UWKTELhaguF7IiJjwJUsfzkgg86uHo3InXgM7f7STdJrS+Opg/ZPxe6c
         ov3p4vIHbt9F99RJp8YNigWVLMi7LcAkNnzpcR+aeepLZSue6Bz3I0kz7VYByOesHE66
         2N2NA+l85kQ43a8SSGcjzEjm7Dk1IiGGFT4DxRrs1Uioge8OSe2GvuCtSyp1GmaBadCl
         kPSEeqpXa2T89GFdYPFMXbqma9zVJDTF8xtCHoLXbeD0M+zXJ+DFy2W4gEKKMODCanJZ
         KlX9LB4QhfekjOSrWt8doXTb+fNe/iCBby6aMeVOSOJ3rtIImN6eFBVdzppNXpgezq1Q
         rpsg==
X-Forwarded-Encrypted: i=1; AKwUvBzQs/Y2iZc2nqWlovNeuxzIbt6LHXwEITWyYEDz3oiPpx2/IIYH1SfeiIdS7iTgKGzW9aaL9+4ld5iW5ufS@vger.kernel.org
X-Gm-Message-State: AFq9FYLcSEMzRwBwFmdwUlJZ3Ng2YoH0OAl/n0lkqCteo3eWJIPnwVAr
	T7IIUscKUdxJDRWZ+e0dRwJLZ9WmX7wJxMHkVPq1UooNm9gFzQRRPVrnrzXwgxqio1vb39R1l85
	It5IUvM0xRkTT9j6bHllvGRBf5Ad996hlGG3oLZyKwYTyDVCKWlwQMvalWAPp4kG2H9Erqo1d4Q
	Tu
X-Gm-Gg: AYBFou2XBRBgIHfHHMBRJ+IwDwDxA3j6xhTdKG4uSL1Vm7ifCs+RqF31b4DdAqzDD6T
	X9yG8o2ekhxXjE4YcFIbS8lRU8YeCkmXxV+fKwEWap8l/S7mZmkxSdVzMlaMeBa0TauzvFhRfie
	Rmzc1krsXflbuoPGOjIBMs4FGnHVLKNfBb1zjQHZtOhZnO8xzLO6GKXujOUWe5bPrMKAf2AE3La
	DbqKQOlehWB3/31ToRZ3yXWcgkDg1ic1rkcbX9ceeb68QQJ+6ivBmsaHzghaYaXyP9bbzqDESjh
	D9FhRF+JYysso+Dwz5g3BpiQm6FbPpntI0PPHhMISR3i6Afun3YFFJZxXQj8SB0/MPWimbTgQSQ
	8vYwMm36qlwgU/bCmtmVi7DDqsPWzm8opZsLe0CSCSmCNTzF3jdOpoLjXvn/5pP9Pk6Zy/KWm
X-Received: by 2002:a17:90b:2887:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3ae580ff5a8mr1265558a91.27.1793180144532;
        Wed, 28 Oct 2026 02:35:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2887:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3ae580ff5a8mr1265536a91.27.1793180144058;
        Wed, 28 Oct 2026 02:35:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a5d3fccsm2255502a91.15.2026.10.28.02.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:35:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:05:32 +0530
Subject: [PATCH] clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOPB4WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3fTk5Pj0nMrc0qL4guTMVN0kY4tEA0tzA3Nz4xQloK6CotS0zAq
 widGxtbUAwWXGqmEAAAA=
X-Change-ID: 20261028-gcc_glymur_pcie-b38a0970773d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX9EIC7w8ui/A4
 lhhaU3pYZmKfPPucdM8NlZpbx99g4LYArCXuCq7PgBak9PdctAMPrGkJ31mHcUDaDti/K261srK
 hAvUYyDp58X6H35DQzDDFvab6IQ6YrEp2ERtXqmWewjP//+kvqLRLr93hnMGAAdf/qGsLYIadWS
 ltaf7OdDu/l4cwZivxE9xT6lFHP9nIZNREK5czY2c3Y4A7jd9seREmihg9MZsU0VlOrWd0ePlWM
 QUfkR+uV61jjKD0RysbaC61pEJJFP85PGc96IboAO1pyipS6fGo7GATnq3QwiIW7RfB/5QmZY4a
 zv+5AXtiYlHCmIlFRFI+IHHnnoqB6qO53Ca7WUTZxWqYEaGcS1lSAXIRaeqmiCJOd4/aS6PfZzQ
 2cXMhYK1c4WRnJxDoMlR/9UITDaptJbXxfkwI6X8hfM2tyP+b3LVCalyZ1JDE7iweRheUFmXx3T
 6rqWjFIXD1s+P8tgMiA==
X-Proofpoint-ORIG-GUID: zbVI_orK_cDVY5As1cnhYDfSjLc3tXij
X-Proofpoint-GUID: zbVI_orK_cDVY5As1cnhYDfSjLc3tXij
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX3iNv5MK+1hJD
 90y1to4pCBQxAUJkLa1H3aS5GLwjhL7Qg+E2hdWqjRUxKDBifPaQHkJrS+6xnMEWFtUaHT6fHSL
 j9fIrQNK9hYFGpcslLY7/4KyMu/4++o=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1c1f1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=h9jb8CZW5PYlqcvXSHoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038

The PCIe GDSCs can be shared with other masters and should use the APCS
collapse-vote register when updating the power state.

This is also needed to disable power domains that boot firmware enabled
through the vote register.

Describe the collapse-vote register and mask for every PCIe and PCIe PHY
GDSC.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index be18a555fe314a41e5335ce8cc100ae8ed226ccb..11be8fa7c7de7c26cc3f69279cc3d5608bbb89a7 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -7581,6 +7581,8 @@ static struct gdsc gcc_pcie_0_tunnel_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(2),
 	.pd = {
 		.name = "gcc_pcie_0_tunnel_gdsc",
 	},
@@ -7593,6 +7595,8 @@ static struct gdsc gcc_pcie_1_tunnel_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(1),
 	.pd = {
 		.name = "gcc_pcie_1_tunnel_gdsc",
 	},
@@ -7605,6 +7609,8 @@ static struct gdsc gcc_pcie_2_tunnel_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(3),
 	.pd = {
 		.name = "gcc_pcie_2_tunnel_gdsc",
 	},
@@ -7617,6 +7623,8 @@ static struct gdsc gcc_pcie_3a_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(4),
 	.pd = {
 		.name = "gcc_pcie_3a_gdsc",
 	},
@@ -7629,6 +7637,8 @@ static struct gdsc gcc_pcie_3a_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(5),
 	.pd = {
 		.name = "gcc_pcie_3a_phy_gdsc",
 	},
@@ -7641,6 +7651,8 @@ static struct gdsc gcc_pcie_3b_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(6),
 	.pd = {
 		.name = "gcc_pcie_3b_gdsc",
 	},
@@ -7653,6 +7665,8 @@ static struct gdsc gcc_pcie_3b_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(7),
 	.pd = {
 		.name = "gcc_pcie_3b_phy_gdsc",
 	},
@@ -7665,6 +7679,8 @@ static struct gdsc gcc_pcie_4_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(10),
 	.pd = {
 		.name = "gcc_pcie_4_gdsc",
 	},
@@ -7677,6 +7693,8 @@ static struct gdsc gcc_pcie_4_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(11),
 	.pd = {
 		.name = "gcc_pcie_4_phy_gdsc",
 	},
@@ -7689,6 +7707,8 @@ static struct gdsc gcc_pcie_5_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(8),
 	.pd = {
 		.name = "gcc_pcie_5_gdsc",
 	},
@@ -7701,6 +7721,8 @@ static struct gdsc gcc_pcie_5_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(9),
 	.pd = {
 		.name = "gcc_pcie_5_phy_gdsc",
 	},
@@ -7713,6 +7735,8 @@ static struct gdsc gcc_pcie_6_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(12),
 	.pd = {
 		.name = "gcc_pcie_6_gdsc",
 	},
@@ -7725,6 +7749,8 @@ static struct gdsc gcc_pcie_6_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(13),
 	.pd = {
 		.name = "gcc_pcie_6_phy_gdsc",
 	},

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261028-gcc_glymur_pcie-b38a0970773d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

