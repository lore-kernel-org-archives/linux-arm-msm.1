Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621674;
	b=ogSKxBXxNc5QO2RlzmbRpQUaW8fOBOUH6QUAnooBqeOQBXhHPXdfIMism2mMZPkkUPRp
	 xJHd4gJscoNGGvfolH6If5tWdq+HS/bW7mWTdo+hto6Qa3lG/FojyyFSwbnSjzLBDNlxR
	 xzQkRl4sl3nOUoPmk2xMWBAr26UOLIZ7As3gk9HMRLeocZPlKNtsUondaSfWipQ+KMpFc
	 lPy588kY/uKpqausMOTBVvqmJKxxdSCnftg9TgstlrAlqVfvLQaK2X1xH01x53r2+36Mv
	 s+OxSyHj4/lqfhoX5u2EGcQR4K9+qfv9lt9b5lsFoyVFyNDky8RGw9svLAv90aS5EaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oEZrtAfgbltww7CIk7QptQLjgCWmm65T14CEUlIyEjE=;
	b=FvmBMS3cF6IyjHUg2VwffhF5KLMzwUf1BHYBd19dprbk8mzg3Sjyb2doKnPkqyUaeBZr
	 s83/kQKdUQAPgO1MJY0EuZ4Yehatmvj9c4nlHGqbEnnEeW76rIFErN9yRs0noH8rsKWdG
	 jPmKZ3Hn1d4CFOm5bkOGD7SPCiiO+y+lJPM88/DxX21dAEgXDQG4Tp2MaWgXHRKNkAcxw
	 Tw0XGFZF5jmtNtu6NMrZpZ0n1IyQNwq37JPuuQuGwECuaW+c9vRkf3KJB4PHjSNwSbcHH
	 zQqLoE+3e7AIj/qWWoJuo8xOZcHoKkKVCWeGqe5dCeP1POsxt6oqiZq9ELO+AQ0xUlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IX5Lf9fW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SPbNLetp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396EC606A333
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396EC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IX5Lf9fW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SPbNLetp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE1xxcX2174702
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEZrtAfgbltww7CIk7QptQLjgCWmm65T14CEUlIyEjE=; b=IX5Lf9fWLbAeSkOE
	mnPfLjMR/F4m0wh35OJV+M96uRsSpn/4G2heO/VBJvfA/s/Yeo5wMCqcUUFaFfxR
	SU0RpSDgVcguDuiUEMTFqt/qUQp2lRD7XeXGp8IJRR2aNLQHsaFxpVfAebWopToK
	6X232dCiPSQOta0U+GXiH8d8XN2Iis7awYQ2orfylWeVpVqn1xBvWP6Jy4XiARJV
	2s+tiQ6FOTjMk8UmiCTTuy1rJMb5LEzEAevhTxMZsgIyklbg2ybh+AVLRVDk5h2s
	6vSjrcTz6DXh9R92O/KVhjSGR8o+4La/7vjXvuG8vuRddhjQlSwTON667+GVqRdk
	GunDEg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxdwwg2hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so1756140c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794621672; x=1795226472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEZrtAfgbltww7CIk7QptQLjgCWmm65T14CEUlIyEjE=;
        b=SPbNLetpLhgu3bSbnlvXAMrtcbH4AYKKvIPHMmZa6hUbeqDN+IJoSxkFSFr7WbQhrb
         x0F0WmMwYfCe8CvfsftSUvKh6ldgQ5ztjBwj8uZJSyVSOqCoaFvSXMYU+W5vThf3tzGG
         jdXeDFOwSs4L+SHyZcIASbvhJ01YUGIqJXWECicLSdr6K8Dy5VdHxZqVgPvClyXRBGgu
         7VNtlS3k4bJNLXe1sFhk77jXQcdX8aA4aFuyK1q4WjcA9AoBwJEtUf7hGlAYW4CS0wyU
         eR7Bcd2T9i2Gk8b+HEpugmfHe/A3Cw+mLNU8v60131XtS+EE08SWJ+sUaFTAdz0dFUBx
         cLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621672; x=1795226472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEZrtAfgbltww7CIk7QptQLjgCWmm65T14CEUlIyEjE=;
        b=rsdigESuWodLvuV+swFqjcFli1LDqcSFIHiDzJmTEpgbZHG2+j7hoYEBD8L9hSyI62
         wkOn9XNjqSrNI47dDQU5PNQ3DBp8YUbCQ8tJSPaHJ9E5ChMApyN/JHzx3zGtxLK9gFNE
         I7GddT/gOjPBzRj4p02NLev9qb/G+8K7JuGeCTM8FkY/8zgaR44rsyx4Qvi9OnLPEIff
         oHvTJnY1pWx1TCZaPQJHpyGXNBHb4k8wHTYDryiFtF7w0C+phFU5gY/FHwJg9mjlh4ix
         GVxAwRsekHPaR2Zi/6LhTl3SzrrukVHEo9GXTZh8iOhlUiIlPCflZXUfGs4BLT3OVFKE
         Oang==
X-Forwarded-Encrypted: i=1; AL+hErE9HwkKt2fHqk2m1oYu58D/aYdhL5NZojUeWP66CTnF1WoOyv6qdeie6G0EhSkckTQbZ5qoTAOCwP3WETo9@vger.kernel.org
X-Gm-Message-State: APuU4Z+cxeqMwc6lQx7fEhbPronKYRFju3Z/axoJLN7QZsgDH59BU0wT
	Q7ZqWtlISTCXobYOVr4p9m40apsHL5gCdqtZAovopPpl0dp3rwSi97LjOHifxEdTKzwQCiIPxBW
	qdudsWlBZcOpJg5WhaIw7AGUyIOkrXMi7jc07E5GwpP9bEnVfMrplWyxpoRcKyagg//sG
X-Gm-Gg: AYBFou2FG6KpyHJg3XhbO5V2DQFn9+UaYgtPgNYO6k6KbYy5dBmMsMIziCvP2DpoVyJ
	Esor72h55ayTlYfItUOim0JeE+vJHIVON50MamJLZmWfd3uKKiVkhNdHNy3e/j+j1hRQCnce+OG
	ZZlM1CFNmj1yE3p19CmC0PLc2Q2FEejTRM4bKPrEGAGNV8vwBVQRZluoPfAqf5ZXoKqJDZ3rmhE
	3j0lRv1qKF3+bD5h4rlAe2+bksH7y2VRo/WxvXY5nNfDrb0K1p1lH8U7ohpgnBDpaNIoKXkXlhS
	dwYPBvLu1OtQqYcosPrI/OjrqRdiDxrAVO46ZxdETk+6DzZxAFUUQBdWrK2gT9jyNPw1WHVsJer
	dks/cZ1cnPnVWsl56EmNJDMXMsH25OVkaiS6ud4p4J1R/zs9sWbJjd5aDK3XrgeLKiWEo8WuUM2
	nHpuJSBRCz
X-Received: by 2002:a05:7022:1305:b0:1ab:aaf3:389d with SMTP id a92af1059eb24-1b50308b44emr3961432c88.1.1794621672042;
        Fri, 13 Nov 2026 18:01:12 -0800 (PST)
X-Received: by 2002:a05:7022:1305:b0:1ab:aaf3:389d with SMTP id a92af1059eb24-1b50308b44emr3961398c88.1.1794621671385;
        Fri, 13 Nov 2026 18:01:11 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm9952742c88.7.2026.11.13.18.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:01:11 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 07:30:53 +0530
Subject: [PATCH v9 3/4] PCI: dwc: Add dw_pcie_mask_msi() to mask chained
 MSI without freeing domain
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
Message-Id: <20261114-shutdown-v9-3-5430c9f242ed@oss.qualcomm.com>
References: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
In-Reply-To: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794621655; l=3587;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=dlM+4DysSk4XqxuJ4iHr8Yg0JS+rtikUaX5y0PL4/vg=;
 b=wJJ6jTRxeXwNTqLf5s48GZ84+hGD5tlQsx4lrdnL0EgUrvAFzBC5oZFPToY5dV5Z4FTWqgYPc
 FtdAuCFmumlDvB+v+3izgm0ETSQ0HlCVqXShvK0/0l01b9U7qXdMtFp
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: O2zcYyNZmxnUqpz3R3hxY22LYJOePFfB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfXzYat7LQxc6wn
 URhhrMf5XO1f7LmPjlrtpWvkDdA6lAyvf67k+Zg1+VYyGARDDBm5LQBPUmdYp1wI0jdBbopM7iZ
 7qpuaiMiOGdQgh9OMXFFHEXBH65WjKQ=
X-Authority-Analysis: v=2.4 cv=eb+o7LEH c=1 sm=1 tr=0 ts=6af7c0e9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=H8WLNgnoBSHn1WVVwwcA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: O2zcYyNZmxnUqpz3R3hxY22LYJOePFfB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfX3rOvACUr6o2P
 E7AYXEWghyWJM3mtmVRCYM5LdA64MCkexI/p4Rs0eoJizsU/VN3Jpia3dbSWpQ0nu9We2NY23mP
 GpSy/YPDLxVExjAv3NMzkvLM7xsCmtKTpKR1q+e5m+XLH9l4r4KfW/+H0iy00XeEVQbf9LSk6Ti
 n3TJ0w19ZD1vkGMnSsDklihA8D5siogUqxuDRXh7lJKFlSMpfIbA5rjyQP8LxwkeAReR0rDkv8t
 oveONRneZQqS0A7Q5ftwgBgoSFHGvJvPHgDIDYz0q/cm5gSZCa+yoNfohbuVR9R4df7Gbo5/hzv
 ueLyaSudOTOgcvVPm67lOEWay6qIyTuouBXBgV7O8fzny7gKttkP8yU4s9pH+sLz2dv0ft/s7UL
 iWbR+kI7eiKnQRicTij9Uoab8hUipwh7XplyLAYb34O4e7mJ9261Miwua1zWvAbkexW86yGsh9J
 eHcNz0Ftqlc+gI3Indg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140007

dw_pcie_free_msi() detaches the chained MSI handler(s) and then removes
the MSI IRQ domain via irq_domain_remove(). That is correct for the
dw_pcie_host_deinit() teardown path, where PCI devices have already been
removed and no MSI mappings remain.

It is not safe to call from the shutdown()/reboot path. device_shutdown()
does not remove PCI devices or tear down their per-device child MSI
domains, so endpoint drivers that do not free their MSI vectors in a
shutdown callback leave live MSI descriptors parented to the domain.
Removing the domain there orphans those descriptors and leaves dangling
references to freed memory: during a subsequent kexec CPU teardown, IRQ
migration walks irq_data->parent_data and can dereference the freed
msi_irq_domain.

Add dw_pcie_mask_msi(), which only disables the controller's chained MSI
parent interrupt line(s) to stop further MSI delivery, leaving the IRQ
domain and the downstream MSI mappings intact. This gives the shutdown
path a way to silence MSIs before clocks/power are cut without the
teardown side effects of dw_pcie_free_msi().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 22 ++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h      |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 0837bb9e67e0..7f0126c5336b 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -240,6 +240,28 @@ void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_free_msi);
 
+/**
+ * dw_pcie_mask_msi - Mask the chained MSI parent interrupt(s)
+ * @pp: DWC PCIe RP private data
+ *
+ * Disable the controller's chained MSI interrupt line(s) to stop further
+ * MSI delivery, while leaving the MSI IRQ domain and the MSI mappings held
+ * by downstream devices intact. Unlike dw_pcie_free_msi(), this does not
+ * remove the IRQ domain, so it is safe to call from the shutdown()/reboot
+ * path where PCI devices are not removed and their MSI descriptors must not
+ * be orphaned.
+ */
+void dw_pcie_mask_msi(struct dw_pcie_rp *pp)
+{
+	u32 ctrl;
+
+	for (ctrl = 0; ctrl < MAX_MSI_CTRLS; ctrl++) {
+		if (pp->msi_irq[ctrl] > 0)
+			disable_irq(pp->msi_irq[ctrl]);
+	}
+}
+EXPORT_SYMBOL_GPL(dw_pcie_mask_msi);
+
 void dw_pcie_msi_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f774fc6d2a24..677e5423c5e4 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -908,6 +908,7 @@ void dw_handle_msi_irq(struct dw_pcie_rp *pp);
 void dw_pcie_msi_init(struct dw_pcie_rp *pp);
 int dw_pcie_msi_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_free_msi(struct dw_pcie_rp *pp);
+void dw_pcie_mask_msi(struct dw_pcie_rp *pp);
 int dw_pcie_setup_rc(struct dw_pcie_rp *pp);
 int dw_pcie_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_host_deinit(struct dw_pcie_rp *pp);
@@ -938,6 +939,9 @@ static inline int dw_pcie_msi_host_init(struct dw_pcie_rp *pp)
 static inline void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 { }
 
+static inline void dw_pcie_mask_msi(struct dw_pcie_rp *pp)
+{ }
+
 static inline int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 {
 	return 0;

-- 
2.34.1

