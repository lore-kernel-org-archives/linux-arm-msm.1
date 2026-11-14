Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618816;
	b=rd60IrTFyEXgC1z0SDj0xzyZ/hXFSKvjsq120fkg6ft7aMIALScJSCcHQaIktuFpVtp6
	 pPs1XuYMMUEjtD314WGJN+WxrAXcI7LCPjbr3HXicwNTyqXQV8cE15O1lC0/Dk4zL72Yh
	 ccdsEmvmjROrVtUux7+fIVsQ+W9Pez8/LbTwR86OX3b0y8F+ETKzrbhL81PcsUzo84Zdc
	 OT4w1DGPafhIKxEPk7vP1Z/xHrgi26nECoJ6GDjmjsfhDFH6dh21GpNr0k0UnDQaRO/a1
	 EdNMFJX9I+SYRFirOI1jQAo1dAOb4SzzBXnafsbViYfrRA+5wYKw0n/9eAgKp5a92gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TxCWY6OFXWbMrHGugnDJmZJ+Wq439bzrPo48chVSUZU=;
	b=zT7pnPG3qiViuY/U1E8kSGRzpi0PmLs18xPRZ+EC+FuODQdDhWD/RK+QzGZVIiTygUK7
	 6E1vk5/C0+xHgmqwb1fsOBxYwmevoIpsce9uC3wXywTVXjaGYn8bbs/lOm5I72r4LygDE
	 09WViywhF+9lCgQ7KK04O17qwtmLqgH+35u27Zr36/5yRFzWDKoEbfS+D5FyW4mq3QVNy
	 3bHG3DC9jjyT/YV5DgemT2YJ9FUhJ9RtyYn+LUvYd0NUQHaYWDi2aXNa/kzByNz3Swqz/
	 oMJ5CQB2AwUvzUnCiQt714iNsoTZACN7XOvFh5OJUKoXEhSQ3NEzBLPc/Fpz9PHbO2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1qlu8p1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TnVGgN47;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFB8606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACFB8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1qlu8p1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TnVGgN47
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMb8fX2193244
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxCWY6OFXWbMrHGugnDJmZJ+Wq439bzrPo48chVSUZU=; b=d1qlu8p1o1DY647y
	jea3uHx6xTLorAOvqHlI0SYMi/tyb1zZ9uhhbz6EC/OQAxmvqpSsCOfa9UauLR42
	Csi1PTDFWhqT+Oh4gFmTBtmnj5aLpXOJISk5dFtyDbJukJoAZyF+3uoUaS1Ky276
	IuzU77h/OGF72czc/REW+BOQ/9E4k1yWINEXiLe8MwGtbUIoMDD7qsFxmNqZ0KHY
	sNnF8KJSNAkvNLR7aJnDVpGj3XThjfMU4c1nWNKqg99sdfiCgiWc4vWc/t6hXQq3
	GCIgm8YAkROI4EvAtvgAu/17dMH/QcorQDKqxlWGIkTFZQ6wL+E1D0zlwYhg8kvC
	kIJ3Nw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx87ds76e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-378722fd4a3so1823913eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618814; x=1795223614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxCWY6OFXWbMrHGugnDJmZJ+Wq439bzrPo48chVSUZU=;
        b=TnVGgN47AxCH91S5Ya1i4xxAOgqsxtJLbpM1QNtudOKiHx4wBtnqo8x24WKfW20Ox/
         225CLNXRMVRzTzr/4R5mAnCWbCF1xB3VOAoUQiUZubjvwzJ//H5qDoTJsWAuI9spj+ER
         mpgPQ3OWMDvtTBtnhK0ePmIPK+YK8KOHnzWppyT2VwGov6KeD94r6S6ih1mPza9492no
         sRBC3S2Y3mXVketGVTbsC968kAA1taMJf6WhbkUc2EOdSENda/VKhCJqDFPkGfwxFClG
         F9QiOtKS2iLITwvI2wp5wlz+txCYMdy1f4zZFVWCymcP5KD6Y+H4cYKiSt7iIDAUtmYf
         OzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618814; x=1795223614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxCWY6OFXWbMrHGugnDJmZJ+Wq439bzrPo48chVSUZU=;
        b=wRpdNxEKv9FQMmoHlBSB/mKzVBLyJOq4eCRSZL/m6T0eAS3rNCJQY67rEDjpDiDnFB
         bs5vX4WKvWLPPcygTrLw9+vEdFqqWF3CA/A0lcKPhAPihoxyblPPwf36mv9+dIRKGlO0
         Vy3uzfIUa20MQmxdtcX+WWcq1BWQlVJjhs592VCijbuVcwmyUsq8j7udN+wSet+0LhVx
         wfxW20lyVWGXrUkMHguyjDh58eW/6RBdawRrDEVumBk+8Ejot9+JRUt8bpR7p8IOX4cN
         korXIqI6b2MSJmy0CFLisvhX5tJ7hYsP2G3/e1zrbJfiLVzqRbDdzvzF1NDbWNiFn2id
         JvHQ==
X-Gm-Message-State: APuU4Z8PesL/R7RNlfzYypySo7F2X3Tlvxkyth0ezX5XaiG7xq5fdPeb
	omEohiy+aged5GaMJVwf2UFlZgXRpeIxbcormfkCuXOBHeNdPUneNK/zD2fmL6Ppfro9XI5fjSg
	d+UCqEVnl5GuzklIQRd2zaxIQzUNvU+A0T/swJspKCOEzHp4duyrQhHM7yZB9jusheObK
X-Gm-Gg: AYBFou1YeDDm0AuQZJFvZd+lkcHjeOob07xTW59FSLn4nUf4F9pIoa5HqguRkTwEMxk
	7MgmqRwip9bXN/xZA0MunWXAAJBHjKn7Tv9TIC+cq40jThWSShGKgH+pct7FBlA/SFIyrXnzvsD
	XGXqXBMHfwWbmteEkVVtijBghQXyDJOUidwXLpuH2sZNzznJfwYtYsklymbtihCX8Rh70wMH6Tt
	h6DK4MmRxUYzZyuJnl3CN5T8UYMOidX+PPZ6yhoj8J3eymHeSN3InECQeJjoXXZvUtWMb4Bco2T
	cuK4psPTLCZS+X+aSy9wNJxv7kfZzZKVLA0GW6QZCaXkWQi+dwaqeVP7gPuDS5WgDinxgBcbxid
	q4XnqVD9bdrsJAgXDCsaijlo575d6zekAm14ng1aFrzfXa/B+Y9T30kCUEKbHHV4ZAw0v6OlPlP
	W0J79WcGGN
X-Received: by 2002:a05:7301:4e47:b0:369:f18f:3492 with SMTP id 5a478bee46e88-379676faa4emr3592404eec.35.1794618813402;
        Fri, 13 Nov 2026 17:13:33 -0800 (PST)
X-Received: by 2002:a05:7301:4e47:b0:369:f18f:3492 with SMTP id 5a478bee46e88-379676faa4emr3592383eec.35.1794618812803;
        Fri, 13 Nov 2026 17:13:32 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:05 +0530
Subject: [PATCH v3 3/6] phy: qcom: qmp-pcie: Add endpoint PHY configuration
 for QCS8300
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
Message-Id: <20261114-monaco_ep-v3-3-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=7367;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=6P2rHDD2paXxwUsB7btdznjPG7HHP3wYChRROQFfdL4=;
 b=68TPHctOo56k3h9sY00pNKX678IpPjao5c8BMrk0SYJBa6y2j6NNZE/QZAMsqPwbEhf/v9q+w
 Au+pwKEwdznATiGRqSR3J3d1mKQ1iJRahz14660u7vXkmN7bzelU++j
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfXzZOYjxrgxYLn
 orr6bZmIC/X/8jfhjtm1SaxqigpldwPNd9AZGI4txrTRcXI2hPo6BvyJiXXZbxIj003BHAK8TXk
 uKzvpKxcuZe1aJbsN+Or3+ctibtCw+svOHHQWE2DhIaRl/FLoYBLt1R/rq+Z62k4m8+1dUX9Vt3
 46EkI/t1b9lQwdxZQjMjKynXH++AoKA83ItS2Ug6sgTRIWg7IaxnkxHTXelnR8z0BwV9eJtOE52
 ibb/fe0Qy/wX79GBH3Diy43HuC4fYQvJJOabkLVhDQHNA/VA9pawijxeBM6zRMpr0b95yPnfMUf
 k0QW4Ya4cfHrO+cxhpyykiq5AEUfRNRK/PabcWXYBJWLpqTO9ncScx8GIdWjzjGdROCZM1ICQzR
 KkT4z1MbQ2JDKGYL1ik9xLzG3qQfx65s9wEQPWNrYMLVrX9qA/Tz3DDpPw03MGgtJu9eOjoX69x
 QILgZ7Ja7t3UR1RM9QQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX6UccY5U6MDQP
 XWF2TolKA+1r728gt8i7GfC6n+aJjUDdbOm83K5bi9gioJwrvXm5v6RsP9Wd/xpY1NjT5rOtWXU
 +tvpEEZENos5MyxbT2v5V/ejjlZWhYE=
X-Proofpoint-GUID: aESMohySBNB7dyh69CY2nR6uGB-w3i6s
X-Authority-Analysis: v=2.4 cv=BusIUoX5 c=1 sm=1 tr=0 ts=6af7b5be cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eLJRkEBLYn0i9-GjmtoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: aESMohySBNB7dyh69CY2nR6uGB-w3i6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140004

Monaco supports PCIe Endpoint mode on both PCIe controllers. Reuse
the existing SA8775P Endpoint PHY programming for the 16 GT/s x2 PHY and
add a new 16 GT/s x4 Endpoint PHY configuration with the required RX
tuning parameters. The new RX tuning sequence is common to both RC and EP
modes.

This allows both Monaco PCIe controllers to operate reliably in
Endpoint mode.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 105 +++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index b9fe3ce94227..170bc4d790ff 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1231,6 +1231,58 @@ static const struct qmp_phy_init_tbl qcs8300_qmp_gen4x2_pcie_rx_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2, 0x1f),
 };
 
+static const struct qmp_phy_init_tbl qcs8300_qmp_gen4x4_pcie_rx_alt_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_0_1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_2_3, 0x37),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_DAC_ENABLE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_GM_CAL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_PHPRE_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x7c),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_IDAC_SAOFFSET, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH1_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH1_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH2_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH2_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH3_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH3_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH4_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH5_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH6_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_Q_PI_INTRINSIC_BIAS_RATE32, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B0, 0x9b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B1, 0xb0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B3, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B4, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B5, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B6, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B0, 0x9b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B1, 0xb6),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B2, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B3, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B4, 0x43),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B5, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B6, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B0, 0xf3),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B1, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B2, 0xee),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B3, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B4, 0x83),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B5, 0xf9),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B6, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE3, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_SO_GAIN_RATE3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_PI_CONTROLS, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x08),
+};
+
 static const struct qmp_phy_init_tbl sdm845_qmp_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -4595,6 +4647,56 @@ static const struct qmp_phy_cfg qcs8300_qmp_gen4x2_pciephy_cfg = {
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
 	},
 
+	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl,
+		.serdes_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl),
+		.pcs_misc	= sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl),
+		.pcs		= sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl),
+	},
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v5_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
+static const struct qmp_phy_cfg qcs8300_qmp_gen4x4_pciephy_cfg = {
+	.lanes = 4,
+	.offsets		= &qmp_pcie_offsets_v5_30,
+
+	.tbls = {
+		.serdes		= sa8775p_qmp_gen4x4_pcie_serdes_alt_tbl,
+		.serdes_num		= ARRAY_SIZE(sa8775p_qmp_gen4x4_pcie_serdes_alt_tbl),
+		.tx		= sa8775p_qmp_gen4_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_tx_tbl),
+		.rx		= qcs8300_qmp_gen4x4_pcie_rx_alt_tbl,
+		.rx_num		= ARRAY_SIZE(qcs8300_qmp_gen4x4_pcie_rx_alt_tbl),
+		.pcs		= sa8775p_qmp_gen4_pcie_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_alt_tbl),
+		.pcs_misc	= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
+	},
+
+	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sa8775p_qmp_gen4x4_pcie_rc_serdes_alt_tbl,
+		.serdes_num	= ARRAY_SIZE(sa8775p_qmp_gen4x4_pcie_rc_serdes_alt_tbl),
+		.pcs_misc	= sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
+	},
+
+	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl,
+		.serdes_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl),
+		.pcs_misc	= sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl),
+	},
+
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -6448,6 +6550,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcs8300-qmp-gen4x2-pcie-phy",
 		.data = &qcs8300_qmp_gen4x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
+		.data = &qcs8300_qmp_gen4x4_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy",
 		.data = &sa8775p_qmp_gen4x2_pciephy_cfg,

-- 
2.34.1

