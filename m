Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316228;
	b=VSfXZ+/s63dQjHYKb9dm9Et3LjWdFAW0D8l+ZtxkftVrZRE2xCXt23y/1tzkMsLN5j/N
	 uljUG/2F02fH6kE4qfmTQEkkC6UwXLACP7FAvEfyzHD1jgIbSQeTO0Bux5bvieq+L39ii
	 wR1mSDoblox81gdfC+Kmc20ZWad3wmpr01fSKxogAhg2+Gy0VXvY7RnxelBlzXDifl0Ps
	 1+JPpt9fD4yqDdYaiHi55TzKxnyTKrO+Yo4/eOO3WEZ5aTbSQfM1jfL6eWYS2GU8y8eXx
	 Cxvps3xnL2nQWVGkG2WcmS2Mxl8NPINpt3FAf3tYrlWshlYQeKA6MKcDH4Q+HtHz3og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=;
	b=ozmD3MBjHnfENgmrcC6JX1HZH4x8MGJME6jzYG5dXKXF0gmOl5QD3PltFiw4h4uf2PLK
	 ob8aVs4ENagXKVtENgbopBM7svXKHkWJ8It3/hDsqfCte/VaQ03MaJmd3NpooiDh563WU
	 TqqW6HXX0Cin6chlsxOCJql85QqLNfVlOTe1/w37Ds8XsEt0K3sXaQoO29PCLx6RyniNG
	 TaaYVaZfA0hgDJMmAE3rC9Mo3/1aj/LXmmsy5IC4BcU7wZ6bZsZ1Aao9WLiC/CnJfz/BC
	 qyoQ4CLSje8Wr30qRQqe6TB+PhT7ZFI+HJd8G8fFBbOmQU4T2slFolGRXxa1upKAHNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYdFd5bs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q15uVlcL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AD4606A320
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8AD4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYdFd5bs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q15uVlcL
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM07vIZ2905469
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=; b=NYdFd5bseRzfCXzt
	d8aJg5vz4MYycLsLY6gJcUjcBbyln2NaS/SgvQPXbQialcB55FHjww2sBKAq8qia
	h6aDB9U+2/CtlVUTvFN/JRYgumvbLqkT90+rz/fxgMTgJDQQtk/twHMy7/ZEnMCI
	evtaU8xv69mJDERv0vsAW0ARveftu4lfJ45+IK9sOOQbWJv+Hqd2ez8FmLg0txCX
	R1kytBO2gZVh8iUOLTb2/2fliVmwqjRz5me772JxUQpkq257V4nwjrO31erueNVA
	IgTJy5ZM7g+5F5GOl9qso8DQyNxq5qOCoMgcH0+zgbs+ysVYmdQoVCnR5s4Kr+YH
	kviskQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310fau1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so3451133eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316226; x=1795921026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=;
        b=Q15uVlcLm5cpCufmEW3sKFe5N1CIRhPSwjIDmiacC/gDKBerPEvJyiJgWS98Slui18
         3hOrcCgLLYF2m3JV+jbEo9lvQ5x234avKvt3MRg3ubhyEL53lPtIvcElqJcYqwBm6FqZ
         9L6EgTr0sH7Wr1ShpzeqDm4FfThCnUBARn/8rS0HLFTmDzDywoIEjyhEhdgVcrbGyXK6
         3sn2jO9llAFgfooab7YKsdgx5hcl0HeQfBLi1eNV3uYnGzOxCxeU/AQxizGK885BMcyC
         Lh221FdWLk21ux+VHKrgojXqnoDY27cnt+DzMx1yuOiuHx6ml7BRXRmuJ9uVlyUUuXeZ
         8aqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316226; x=1795921026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=;
        b=BCi6rrwrlK2xlhlHUe7KktoWAJdZWv9A/h0A4Y+JA3afrZBpYA2Hzw6hGv/9570MxE
         xMiosfqHnFyR1hDB3PaEnl7scPKbtwiK+sTJ3jZScrsWVZUX9sukFRd3fhzBZTeISjyc
         bE7dQFDl7lFvz32UiiiwZ76UOKVRTYmr1kbG5kxdzMKiceqSCDQtBeVmoD4Li83ZqE7i
         jT3LipqPI2+GUb2NZGbSolp8Fyc79I3LVhuO5K6AI03FB1XzTk1/co5N7qtbtsvIUvTM
         MBz9X7W0Pozti2HZ+zzs/jLWUZstIBa+tY+h1ExNO2w6PXG13E5511C1Av77Y/7DbRLc
         EiJw==
X-Forwarded-Encrypted: i=1; AL+hErGCsdx3QxG21q77ivoP4yTTK4xpDW10r2/OXre7dP+2alVbBRoROrgH+lXPkKzGd+xVuSeBhjXtGtFoC2zB@vger.kernel.org
X-Gm-Message-State: APuU4Z83w4cUdRg/1oQNjK4KqBdubyA+AmsKHr8VsPpJNL3xHybkoU36
	3fXcj2LNVkoNnuBrNzsltIntQmX+Kva9y0Q/WJw2N0cq9bD7HHP00Cwn6ekbRw5KAu2aSnSlYsp
	s8P8w9a7k+ETV4h4Mte35TZTm5qd+91Hr7SZKFpr3USJQ8XYr6T3PGKKoDmwtgvVhtbUt
X-Gm-Gg: AZFdTZeZy6vMUVL5eFx8PBaYhviA6oA8jzeruQ4N1qdy1QfihYUKCqDlbiYVuYgWTuk
	nt+rBzlOi3u6R5iq8ypXBu7z+0W6kDNi+UCP/gMgNEhy273iDRUIeDNLCeG0tCKAn+3qG7IyppZ
	hZmZI3WsRxSzI7vgQSi+FSC0tL23DY9a5D0aPfYBxyTPkugu6Pla5u+XGtwHGddjkUNnK4Nj2PQ
	Xn+i23tKPw0meGFMp+HLvmY0ojzz9nIuQl1AzD+BLhZ10PsG3K8RIGvE3UtUNyevQcy24Ixpqwv
	E/tLR8N+NFDF3VGlGEggzQdSFaDwXhlphX0O3isgCvirRvY7HbZ2+Y+PyVO+stKTEdsm3fmGY4k
	Q32fgkvIlq28A49RBOJA4soCk+36q4/cVm7ncXnhgnaVaApXWv8bbK/n4+jVSG+7Wj1RGIZIR/H
	SafZ1m/1/l
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr5271994eec.6.1795316226434;
        Sat, 21 Nov 2026 18:57:06 -0800 (PST)
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr5271971eec.6.1795316225925;
        Sat, 21 Nov 2026 18:57:05 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:05 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:18 +0530
Subject: [PATCH 05/11] phy: qcom: qmp-pcie: Add PCIe endpoint mode support
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
Message-Id: <20261122-nord_ep-v1-5-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=3245;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9UVXub4tyfQyqAJ5iLairdqM1PlMxztFvo8mRpY4zlY=;
 b=/xrnyvXAlwvkroxvh1fh6Ne6gyQ24oDqJjVsXBGs8mljggskqwHJ8AW9eNpwHn3irT19BeiYT
 lqikiJvdKZZCrCsuPpUawQ1VpjJCazPuc8cDV0m8ITn42MGHDQw3421
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX4X5sqdMzPoDX
 3/TUJWLO80wDMND2dNquVaNW4+rqtUKIxneeFGnUHHtJJ8b5M3osj7AG3SE1HN2zMdluGnNMiMj
 Oca0PangCJnmmkIidHY0Q5x5n4gk+4ICAQ76w1B2a4sDO6tcNtqg1NosvCG7T2QPHSPA5KGV2Li
 6yMywhbXPhvSWmOzIh0x2H9ArprOLSHpo4mK1RsMt1Tat+MC4NBw+gF5jX0OoM/eyQ3R/JLKCI4
 aaMzOPPkYX44FZ5zpQ4EtA+Jux3oS+d3VPWWymEQtH13QuMIlA3wGPiVxmi3SSHD9sY+O1b0tFW
 h8o3i1aTMdWnKAsW1OvwWDl0BVaie37iysuAd2lgh7siKKaI+KWBh2iyNjNcusJYISJbAhAXla1
 u+VW2NgzE3dJuZ5GWAite+HT6mkNSsm9Ph2NNan7nQhlsMPp6KmnqdKKAx0wleXtmG8wPcWkH/q
 8+hJw5YUYPY2xmTl6Aw==
X-Proofpoint-ORIG-GUID: ndZW_1Az4EDgNUgwyw6ydvzs8d15pUzA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX7/sCXwMGBaQq
 9d9VaLlJlWYTjwS2YiUnRqKQSz9qbU8AUy4NfjPo33REYSS8Ngq7IaOZMoicXPBmZFjoxJxxAxN
 UmQkTZDWaY75MDa3KIffc/ufoHj5p44=
X-Proofpoint-GUID: ndZW_1Az4EDgNUgwyw6ydvzs8d15pUzA
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b025a03 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=n6AvfDos_TaM4Tq8RocA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

The register initialization sequence differs slightly between root
complex and endpoint mode. Add a .set_mode() op that records the
requested PCIe submode, and an optional per-config tbls_ep delta that is
applied as a second qmp_configure() pass over the pll_common/txrxz/pcs
blocks when the PHY was put into endpoint mode before power-on.

Configs that do not provide tbls_ep are unaffected and continue to
program only the root-complex tables.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
index ccdb7748a9e1..21cf6adf7d60 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy/pcie.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -89,6 +90,7 @@ struct qmp_phy_cfg_tbls {
 struct qmp_phy_cfg {
 	const struct qmp_pcie_offsets *offsets;
 	const struct qmp_phy_cfg_tbls tbls;
+	const struct qmp_phy_cfg_tbls *tbls_ep;
 	const struct qmp_phy_init_tbl * const *pll_tbls;
 	const int *pll_nums;
 	bool port_split;
@@ -121,6 +123,7 @@ struct qmp_pcie {
 	struct reset_control_bulk_data *nocsr_resets;
 	struct regulator_bulk_data *vregs;
 	struct device **pd_devs;
+	bool is_ep;
 };
 
 struct qmp_pcie_multiphy {
@@ -930,6 +933,7 @@ static void qmp_pcie_init_port_registers(struct qmp_pcie *qmp)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	const struct qmp_pcie_offsets *offs = cfg->offsets;
 	const struct qmp_phy_cfg_tbls *tbls = &cfg->tbls;
+	const struct qmp_phy_cfg_tbls *ep_tbls = qmp->is_ep ? cfg->tbls_ep : NULL;
 	int i;
 
 	for (i = 0; i < cfg->num_regs; i++) {
@@ -957,6 +961,15 @@ static void qmp_pcie_init_port_registers(struct qmp_pcie *qmp)
 		qmp_configure(qmp->dev, port + offs->pcs_lanez,
 			      tbls->pcs_lanez, tbls->pcs_lanez_num);
 
+		if (ep_tbls) {
+			qmp_configure(qmp->dev, port + offs->pll,
+				      ep_tbls->pll_common, ep_tbls->pll_common_num);
+			qmp_configure(qmp->dev, port + offs->txrxz,
+				      ep_tbls->txrxz, ep_tbls->txrxz_num);
+			qmp_configure(qmp->dev, port + offs->pcs,
+				      ep_tbls->pcs, ep_tbls->pcs_num);
+		}
+
 		if (cfg->port_split)
 			qmp_configure(qmp->dev, port + offs->txrxz,
 				      tbls->port_split_post_cfg, tbls->port_split_post_cfg_num);
@@ -1179,9 +1192,22 @@ static int qmp_pcie_disable(struct phy *phy)
 	return qmp_pcie_exit(phy);
 }
 
+static int qmp_pcie_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct qmp_pcie *qmp = phy_get_drvdata(phy);
+
+	if (mode != PHY_MODE_PCIE)
+		return -EINVAL;
+
+	qmp->is_ep = (submode == PHY_MODE_PCIE_EP);
+
+	return 0;
+}
+
 static const struct phy_ops qmp_pcie_phy_ops = {
 	.power_on	= qmp_pcie_enable,
 	.power_off	= qmp_pcie_disable,
+	.set_mode	= qmp_pcie_set_mode,
 	.owner		= THIS_MODULE,
 };
 

-- 
2.34.1

