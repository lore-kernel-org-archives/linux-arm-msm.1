Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719643;
	b=faiUbV/+eRAiVwbQym9u2DVficpJANQq7oS4BnRh4pcM+TR7TAOjSugi23sXJWCezgCx
	 SUcyx4869iT+5pJQCdZ+vioLsD+Pwm32FYokhl/9mYyNYsX2DvhDjgnocLusdiJMyQ0fm
	 5/B3EsNIlu63I4A162gAyTivp8ns7pN0ZOURrSJZNtLSwcLN1Hp30uxfJbnCdt7Opxcz9
	 Gbp9h5WivvO977Yt6TKYg6OlV17ZDqCbsyxkio5mC0nnBvyeCXuVYNlqZqtkZZXXy1oat
	 VgTybiYQM1itGV4H7D0r71FdRYdvNbfo/2EkjpHwisSeNJgX7FKSDYQUtPbeoG2KmYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hvrwhli92ejef29utqXfTUqutjxeG4jEb3yA0cFFYgg=;
	b=dfMuDQTNgh1LQNhzDFo0ygUfAzaRAN0S4alklH11NGriItPtJR/Q/rIYUupyce7tY/JO
	 x61zWI4YNta67+Bzsd2+5V9h6LHFRLGIL5ftydKVwdL8GAy1FsvUEcW5MnxMYx2bV+y8F
	 16aqYhOtKLGObBtgHtJeeUrp3h+olGkZswKnB1qAXJj5v63lPAFAIRByTU20N2z/oYdaX
	 BBMH/ijfwSaRoIaoJm8d0X3DYde0jB/B/sXB+MjM1SXSX+Z3OLr5knrqgeEgku7Zvxzx5
	 0GiC5VppCywCUShZ8uTs4aJX9YPzK4gz6QJU2kd3BRxkxuh9Rv/nliI7PJI7j/wVL3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jw0solnT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Czdx1CmR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC96606A336
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC96606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jw0solnT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Czdx1CmR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFtrTN2834946
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvrwhli92ejef29utqXfTUqutjxeG4jEb3yA0cFFYgg=; b=Jw0solnT9tHTJG48
	ebAXfqFbT21zSh21dXuPa6qRGXWuVgCQtUvHbEoY36XHk7PzdwzB2lAWD26Tol/+
	W/YQEwXa/v6TurRAyTh5LQzIVBtOWPw11bfzQLf58HIzH5zwAAtVqbujbsVu/FVv
	1TF8QUQBjkVaiB5bjvyzgBTOrTi6EXPODeFDwvhSWvoM6srvPeDhYuo0TfDD8De6
	+huDY3Dt6ZP/ex5s3sminFpI8/HsGpUxhn08L9kNZTmk35NxzdLYM1OFczCKNH9A
	CttlR/S1Svd6Y2YnejfSdWkm4pDk7cLHjKZJYhI3TBoJt3GfqJGRydQp6iKQAw5y
	YbvhLA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqgu43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:00:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so7776812c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719631; x=1796324431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvrwhli92ejef29utqXfTUqutjxeG4jEb3yA0cFFYgg=;
        b=Czdx1CmRbWri4oJ+TnaysS+SSAeCNiyDP2jS2NmG5uq1DyNwqAEgvWS72O6o0ouBlL
         GQrvsT8Tb7n+58lQmcA3iIm7Fj11Tvs8AYP1soXU0yTppAi7L9SMQ9I1c3319yHghKWt
         vX8ljRkhdkJ0vLlAVXyuz5RPZh0LnV9zUT4nrHdNIIOmULCl/2vrLsltS3qgJfOmkKnh
         ma5NCySIcjVFAE6i3jG/kq18EN0lH/O8ARm/dl76uKwONeZIouhjpNA1BBOb0CD06+wD
         wOgCqzqGtP/MN4Q4m3qFG6rkTQ1HOZyDs20vhtTFllZH7jmS9hWJ2cJg4p26PARyPRNs
         zZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719631; x=1796324431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvrwhli92ejef29utqXfTUqutjxeG4jEb3yA0cFFYgg=;
        b=S3PbVfTZ8OzhFUrAa83subQhzppwv/9NTd7X0P6O/XT6jJN/2HyeYIGt3UZsKqG0uG
         eKPVjCrjpu1wjpTgks0oGoyXuoavT5j4vUmKbYO7QCEqEF/Fh3V2SUjm2L7/s7m/RdHf
         GQiu5Z44oZndCHSOcSu2A2ebWwYbhJWsrz0f2ht4AMRlh1vjhE36+qFT5KTxPe/DbJPk
         L8u6Vgiq/JjX9yJGo6DSxA8Az7kIcgHdXWt8+tsvkDNuqOp+XPxstYMlqO2HEyb4H/Cv
         wUQkyr0Fb9McvplWG1JmwXjTW0dZdZmrHvLW5/gEegipNQhNpiapYR2XjQfQ13BPXo99
         7Irw==
X-Forwarded-Encrypted: i=1; AL+hErG++KZ2Kp2gqjTwvi1qtNGstDCJ3HUcgegUvvNaJeVsY35DdVfzjdJTwHGhHr5dlYbVBv4QAFtE+hGl8Q8U@vger.kernel.org
X-Gm-Message-State: APuU4Z8KaL8cY1lB9naBVJtPBRB82hC/nWdc4Abaa1H4OPPMbRU4bUUM
	pxbwNAcupl8st7tcrKO8PdKGZ+Y89dIkrmmC/XOaZpoPyYFonr9obDfHaZbc15zpJz3K56+r98S
	fmnim6aJuaLb05AoPQ2l2wteELqdy0EuqK80nRd4WhAwudDhpujGORMtGzNzMs1Lt6mzF
X-Gm-Gg: AZFdTZfj9SSpeta5MghZOHOuXju/6YJTNOKpa0WmDaNtShg3cMB/beBj4Mt2M37Mlmo
	zJbY1MYbaz5C2KF1tOmUhBQGXbbPzJIqZuuaGMZvI16eBrB/l/K8a/z4nPJL8L1nphPdbZu6BZP
	iPH63dHNgsdKfqOZfjOPXorBMHKB2WRizHA58Xu4Mlyflaup6iRGXIG4ntXLVgFtXCyHN2CrWnf
	epxVCZyUHZsr/Wrbi0ZVpDpi09mBm+IGCsp8pj/u6d1beTvkawoVXKy+GmhiidnMJ5jJb/XGutt
	AV0kuv7pt+qXwMJ0MK6Tia6VN4FDYavUbSLAoAuFX2i0jXZdjwOjvcmu5dZ6viqfHDy816ujqz4
	hBnQ76k2hBFvy+FNdQWr4Dpm/uMdyk7bvyx17azqjrJUlx2FqV51sG5EJkAWkFFtP0pk7fg5cCJ
	qvjjQA
X-Received: by 2002:a05:701b:4553:10b0:169:9f67:a91b with SMTP id a92af1059eb24-1b5568650aamr20546593c88.12.1795719631160;
        Thu, 26 Nov 2026 11:00:31 -0800 (PST)
X-Received: by 2002:a05:701b:4553:10b0:169:9f67:a91b with SMTP id a92af1059eb24-1b5568650aamr20546547c88.12.1795719630593;
        Thu, 26 Nov 2026 11:00:30 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.11.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:30 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:15 +0530
Subject: [PATCH 7/8] phy: qcom: usb: Keep the PHY GDSC ON during host bus
 suspend
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-7-485a08ffdc6f@oss.qualcomm.com>
References: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
In-Reply-To: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: TjyyJpWlWlnFnc6NnAt3WMFsRQFcQr1k
X-Proofpoint-ORIG-GUID: TjyyJpWlWlnFnc6NnAt3WMFsRQFcQr1k
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b0881cf cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-5rFW9DF29b7OOe1maEA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX/+25q66znmrA
 9c3GmRv5XGlDLFonaU2UujTdDlwH/Pba+dU0iYC843d/SOqbAsCN0I2jYabW9/Y18b49ID/ok9n
 uHiSRlvkbkGJImD8FnThxYEC2UYiAhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX7OLUGPJCzH2/
 0ibVQSUa6uDm9gnmd4kuwfY8t0PfSfGEJlYZWqoGfyqabRlFwXqjA86fQ/kxNEnFB+pN7w0qb70
 lW+/5/h6sbkCxx3w4KR2iRF0mr4Q3m4ZBpe+tkP/YzY666sDfmk8Na3l3G4bb80Ptbyiv+q1Nce
 VESxsHy0oHcFlQgEiesMWgMSqvxfomHYbQCqB+BdJfNqRvKpV6T9eZB29g+lp+QsoA3y0Q1syBZ
 e9yttKjRNdV98VAbRrvIl2BwFDarmeE+NCP7X8pYG4MIAGONcs9s3Ti0x+FNQtimzKkAW2DRGw2
 i+MgZQ9o6uGQN/5Tcmnfja8XuvCApMVuEP0/X9T88fAbxYRNyJ1Nd2DDtO1GobFzG8BcjMoXt+s
 87PMADXnsWv3baF1bHK4YW/2BLc2e8eblYJ+iRVLEesZXbNJBLW7L3oZYtMkOnXjSy239+XMzMy
 rto8pjniRDzTpNxesVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

From: Prashanth K <prashanth.k@oss.qualcomm.com>

Keep the PHY GDSC ON while the PHY is runtime suspended in host mode,
so that PHY can resume without losing PHY state.  Allow it to turn off
when init_count is zero, or when set_hwmode_dev() isn't supported.
This allows PHY to consume lesser power when nothing is connected.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index cd1ebe707bbe4ce790f964956391c561d2d1e223..20f64ffe4d3bdb283ce6185c94dbe021f4ec3d3c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -15,6 +15,7 @@
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -1506,6 +1507,9 @@ struct qmp_phy_cfg {
 
 	/* Offset from PCS to PCS_USB region */
 	unsigned int pcs_usb_offset;
+
+	/* true, if GDSC must stay enabled while this PHY is in use across suspend */
+	bool toggle_gdsc;
 };
 
 struct qmp_usb {
@@ -1956,6 +1960,7 @@ static const struct qmp_phy_cfg glymur_usb3_uniphy_cfg = {
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= qmp_v7_usb3phy_regs_layout,
+	.toggle_gdsc		= true,
 };
 
 static int qmp_usb_serdes_init(struct qmp_usb *qmp)
@@ -2197,14 +2202,24 @@ static void qmp_usb_disable_autonomous_mode(struct qmp_usb *qmp)
 static int __maybe_unused qmp_usb_runtime_suspend(struct device *dev)
 {
 	struct qmp_usb *qmp = dev_get_drvdata(dev);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
+	dev_pm_genpd_set_hwmode(dev, false);
+
 	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
 
+	/*
+	 * Keep the PHY GDSC ON during suspend, so that phy can resume
+	 * without losing its state after host mode bus suspend.
+	 */
+	if (cfg->toggle_gdsc)
+		dev_pm_genpd_set_hwmode(dev, true);
+
 	qmp_usb_enable_autonomous_mode(qmp);
 
 	clk_disable_unprepare(qmp->pipe_clk);

-- 
2.56.0

