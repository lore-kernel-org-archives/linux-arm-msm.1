Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550517;
	b=MrxPfr+TH9RwSONO2jqkmi7iDE/V5XuSnyMQB/lhbrC9gU35+sqLETK2wIr5lnuiipiz
	 72MPSpvwnB30qSrV2ZCsEaqQ447D/sNUwj9h/XwiMa2a1KGsqRVWcj9daumj8gtcY6Xbn
	 tP+2cv/nED5LYjIhG3tvf/Ms8ZM3Uy2Dn5+rYgE3ZHcowoiW7hB8jBu4ixcO6ljccF1l7
	 F3eSj2P2KpXfC3jadvfhlLRsyvGN3/nKT/ayhYg24k7E02hdKvnZw58gyzT6D+x/2bJeH
	 yCQ5ILWAgqDm4D87QNTMe3mzB5LPrrKpb3EhIQ3k7ejTABmptMxvPs3R4cPcv2Bo5AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550517;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
	b=E6Yzf9rrLZSck0slK30vC2QdkGN6kuNN6hKGdpniV8DD+eit2THf7uNYFPayeOtz7Mtv
	 JM8SoNEAw3OX3OiIHnN6URP9DKhUyonkqXoTew/b/m5Q/6ldmRUqkFalGVc/vfrcW9tLm
	 0rQ0ssDS9KCPmfPAVSSisM8EpfDqtFl1OcCjSsI2gCtRPHjy7K1KHAFCoOqv5wyMZONZv
	 ezkIjl5dncjxSFwVZ4HIqsj5vmC+GsGCFpbXgHGVPbgH48FBKVvXu2XGUl/7pKkPYA96g
	 ffmfWjCL1bHuJjuWRRS3M7MCRokMPJUekk9obRU1EjA8T0chY8644Dr3l/NTAHU18eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxgJ7pYe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLEu2eo2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAA2606A685
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CAA2606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxgJ7pYe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLEu2eo2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXZB52132756
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=; b=WxgJ7pYe7a1NhCBD
	3RPzR2OHdYUWIS5BRV3ASd9SBJtUla9otD3oKx8Rfv7ZmXMWn5wMrWC+hzhMqeHN
	rDL3LST8DUaiCMJMLwHyw9wBgMJzLdgjCRaPd+8FZZVO6WF2zSwPh+PltM38iAbc
	cRVdPpj9Qvtocc7imwvdK7kXy47+nYBFgMSbiNZUeLuaq2qV4ZVDyGu0h+BMG34b
	djSFX6vFJaJHFZpNRAOqBeO4y/XLli4Xo3kNK0NUcaEgGRhJ5OAKLbzyf81x6XGe
	0Skyzl3FVkdBBRd4lN/Kj7lZwho+eyTE59HIU/bXUHeEEctJ9bHyPPHemd+65bBp
	y436Yw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b801yh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:56 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2ca26a454so174411137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550516; x=1796155316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
        b=KLEu2eo2VWV+zfB5v0/DQ6r5HvvxBS9v4O1t5cNjDxe/dSuCwJbymJgdpycgXvGT8O
         laYrXCxEmswibdJweEPn0D/85/ucz76TqvaNLzlRuKYEfEZQtnW7yxgEoMxY5tNP1ZuZ
         IG094R5cxYY9adxLtsi40A+7NXkhc9VS/54jSSqOQF6LLS8ofJWqcIKepFGHeqp/FD8x
         UCU9AjIBLKG6qI6Ig0swFsyiZBxRFxOisgGpexBvNKqYad6Git0ba6IPRTb0rFMtwC7c
         onKul2Gsu1SKL57d72auP8rkwMdeuKAVepMKBB6OjITKlAi0eIoZsJmnclhrl80jQosC
         Sk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550516; x=1796155316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
        b=OSFz5W8E8xrU6VPmrI+iu9UN0Xddo3/azf+KNmVAHw/IW284VqVqmsajWIr5AzvAtb
         KEoQDfNCJX4v1u3HD/mH0oaLZ9XMUpmI/M43I5q81pd3hw2tNqBZ+GqYRFwrbKijD6p0
         lgx1UCk2WaNg5iHGdUoOVx0hgMDBJRvM2Qmei4gLEFpuFNonRBLVAA+ngjZB28KAEAVD
         xc+2ay2FXf+n0GCjNB/+4AnfpATUMir8ISQTtt+f1+dDXZ12OQXG1Wl1uC1DR8m6sscc
         ogQ446zv2yXAVJhACI9KFLKmRdHHTogw3IyBvq7JSAHweWgDzF3KqLljcB61P2GzZuaI
         IZ0A==
X-Gm-Message-State: APuU4Z/ZPgnfWGcS2+26BRtywhBAbio5HGBb/Ee6HDYUXqYj2M3fVh3m
	DCgN4q7cFBK6RFTTIgv40NZ3a42CVlZR9WOFnc/JTi+vvX6CYHJbhoAxAvHQp8zgcsgyDCv6zr/
	5TisMteesxnx10SJX7IDN1mRPcNAdSAX2vDUe7eQ/WMzA1/7yXVRk9e7RcAYIRAjzgFkO
X-Gm-Gg: AZFdTZcHsnPM3LVH+1qrgEcGVZcRFME5im9VxOAs3xSCjRPsD1IV02zyj+ZdbcA2iwL
	UDDTZTCfCnQAq2MAIrt/VSEkdR7LMDkluycfDbssX3FUmmrBztKClqCvGLusAE81Fp1fJx2fiW1
	uaypkMhi73wY4nA0+yBXZmmVknj60LRuvgzrHJrkoI1g5ejEMZE8Io43j9OmxiGCsZ/lrxpZJYD
	lnb2DLf7g2SfdygLVadCiJo5rWklRO9BbfS44uVu3R0waYXiuBB+65NNJQ8P19X1bAk9RcaM6Rj
	+zbXZ066h46XJ3CdlhZR/dMdLzYAJRy0CM39P52j8m2S1cdg9YKIQRzQgmg3aO3NXgJRkV77qrS
	3opKYk0TqOWotT8BsjXa37WiCG/yJB7J4QiKXasuWg/19AABxgx98qHVaz/S3ZhkfIFWhnRFo5e
	bzFkr66sw=
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr9353309e0c.5.1795550515630;
        Tue, 24 Nov 2026 12:01:55 -0800 (PST)
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr9353247e0c.5.1795550515061;
        Tue, 24 Nov 2026 12:01:55 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:54 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:34 +0100
Subject: [PATCH RFC DNM 05/15] clk: qcom: gcc-glymur: Don't poll the status
 bit of some USB4 clocks
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-5-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2300;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=GmuoZNziZvPu1UlsqsifvQlY7SuM/U4EVYwsYPf4EdM=;
 b=GTjcW3B9vr7Iepca856fdLsOvmCpCMBNJCU1xy7eO8dKAHF60Cf3bzFsN4Z3SQoTNDUIH315P
 skO0DtYej3eAgai19OVL5aamY9nYLh2MmYMMnuwrsr1b1hs1Qu2gIJe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX5SdSuTFS0jyM
 ui/Jx4zPD2hivTp07bagCfA8Vvn6JsyhVdJ36giYFMspI9NbkngFWGMCDmzpQJcZX/B2ifk90U6
 8frNYRMqL+azwAaOHdaQsZnondqYXEruREXhGAKP8r5F7O/e3tVU2y7nZ9xJQXbet2kkEzcs2al
 85WIBoaU+c69W6feHIYCoN5etMrXnEpdtBmq/hsKNIloCdJbYV94ncgcYmbpeOHTo3IEdvK8zSA
 MKyzPvx68b5FUXeUnSyFlLUBvdaIdMNisIQLzeCvYG3+zVn70cNY/uh+R3HMVrKRA31sI+X9n9g
 ShLfWnbAnlvxA09sX9HZXQeHeeyQ0iLuuDG5g5bU508mNDSgS6sN7XA/TYioOhX+7OWfomvnYzG
 2qvEJJtNpA42QvXqg+8RzpUK5nE8CAcQOGfx//AzuqXis+hRwnPB4KkMW2MFfs/G8uhhSz6IjQ/
 YLcr1Sm8y25K+1n+Upg==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b05ed34 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=zk98c5D4pPYhsamE--UA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: ZTU1xQ8a1eqekdCxYAb5d1xy9xE0oOkN
X-Proofpoint-GUID: ZTU1xQ8a1eqekdCxYAb5d1xy9xE0oOkN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXxWaeSFGguA82
 wgZKQKymcU4TOWZzIeGJTd9zhh4DPk212JCJ+QZDu669UT9/hH2EQcq2stp9cXV71K+D2e8SNFe
 Pbj3wzr+EVI8n9xJXZmn0Fm+o04zVkQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

These clocks are PHY-sourced and their halt bits seem not to update
reliably. Ignore it to prevent spurious warnings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 186c779e30846fef5fbcf66d114d58389d72efa7..3323792929d9292db0fb28b116723dd054d6deec 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -6833,7 +6833,7 @@ static struct clk_branch gcc_usb4_0_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_rx0_clk = {
 	.halt_reg = 0x2b0c4,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0c4,
 		.enable_mask = BIT(0),
@@ -6851,7 +6851,7 @@ static struct clk_branch gcc_usb4_0_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_rx1_clk = {
 	.halt_reg = 0x2b0d8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0d8,
 		.enable_mask = BIT(0),
@@ -7068,7 +7068,7 @@ static struct clk_branch gcc_usb4_1_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_rx0_clk = {
 	.halt_reg = 0x2d0e8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2d0e8,
 		.enable_mask = BIT(0),
@@ -7086,7 +7086,7 @@ static struct clk_branch gcc_usb4_1_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_rx1_clk = {
 	.halt_reg = 0x2d0fc,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2d0fc,
 		.enable_mask = BIT(0),
@@ -7303,7 +7303,7 @@ static struct clk_branch gcc_usb4_2_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_rx0_clk = {
 	.halt_reg = 0xe00c8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0xe00c8,
 		.enable_mask = BIT(0),
@@ -7321,7 +7321,7 @@ static struct clk_branch gcc_usb4_2_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_rx1_clk = {
 	.halt_reg = 0xe00dc,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0xe00dc,
 		.enable_mask = BIT(0),

-- 
2.55.0

