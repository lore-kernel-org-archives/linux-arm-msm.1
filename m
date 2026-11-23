Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458533;
	b=gKKspe+RbI3zoDvPTb1/FgC4qzpKEiwsxt7bTGSCHS0etI049O1VngUsnErCKo2XFZjX
	 Sujwx8CKQ3go92ckhZM5yoD+ryOIO6sc5rRVTsdxpqCQHWC/GObWcKyZab1ba8UedQx83
	 7v5s0AmwRmPeut3FOy9U+8OEI8gUQu6xUjkYwaeiJTNybWf86IZ1zfIkXhxL577SfXFYR
	 4BlkrRJLx9Q4XbTalv2b9KamYyICe2FOs8bjgwb15C6s5NTc3S7bZ0093LGCLGsNtxu9H
	 EQVhUGux4LgETZptSvgPLfuTwmWzEjgy4jH+St9jq6ZIyiFaREkF7esb0t4jaQVzlLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
	b=RQTlmRsgeEWPNh/Ua0piSNohsvKqfRYPXa4w5kxBS96p38W+Vfx1ZlvEZppyODVBizF8
	 4GlLM2BS1frVDPNzsRApBoVVxiaTpXYaERaGWaZatvtZ+MDgwTxPXpRPiGEBlmkhxYQxB
	 EH6tBs7sJzgTCe1CBGWOFZNffwf9WqQhLQVmRzg/LEYPoa9rJjyJkiPY6JzfqwMCEscD8
	 5nK5rnCwdUvtkMxizsw7z6ChluR0C2hB5shtD8HdBkmgouFtO3tz+QxTRKoShlMFQomGq
	 thgyR6lf/v62L9gA8CRHsKGTWLIdiLDwJIMY27xD5P7DVgpStMU+dLF1a2CpoUJSQnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgmcNHRw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVfKytR7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED4606A68C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84ED4606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgmcNHRw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVfKytR7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnCH1861204
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lq2ckgeFeyG
	4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=; b=QgmcNHRwOTYFltbEnU8CT6eWZm4
	WXkbo1fYHF5B6WuTtNV2ePmUKqi/DuCVN3/pVec9kVHtH65Mc+wbqHnDno2lAZmz
	hoYYCMciPSTtJ2ZV44G+YejYZKwrGjjc/0rPGuDm9MlAF+Xmfe+CdG7mkSMresh+
	1YHX5ztPz6VE8AMXQU7/G7JXDePrPCDcUe+0UD4Ajd62YKiPFuswrEC53TSj1W6T
	zBSyB/dF7BO88Ucssq62fXRYMNeRNSafS/CrAFcdBtyyqu6OtoMW2Z4Ztddvd+x/
	sg8dcebxjggFGd1GnTBiDla8MUhhRinwCf4bGrNoC0EANF5WXcRmqAmnIkA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2tat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386177b0516so9766170eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458532; x=1796063332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
        b=PVfKytR7uyik7EOhP3PMKvv2wSoWbchKb7P5srh9XzqXBy+D4JROiV7AP/Eaf6zJXk
         d+ac3+FpunoRRZ+FYoRUEvDqQTTbe+/4NeWVNbMNpSGUq+xTtQvLBhmd4b4iT/ssPRHa
         LUeGqC0NKd7OmsbhunKBDGznH3+3Jzi8pAy9lkyDC/qyf93ZcRAq80q28fvlHNIwf22L
         C0qTc6RkUVoWuHIal+Inm+yS4CaElGhhnFSDrjX4VCPvFduVdfk5qk43kb9Ytr0FkVik
         QbkJVcjLJJ7d/LQUnqNGzPvejSF4txn6besl++DXs+Is6yz7OgzjSAiGWLBINy9RYJQg
         1TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458532; x=1796063332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
        b=bjvYNtbP5QYhKmQIlDflvmqgzC0qQZs/cR9iS6gtnSZGaWtMOPRiTDVBFDMJMyhtpD
         Tn5+iMfb3kfHCV78lTYdBgxJpZRz1IurMgLVAib6Tn3quLDaazW0Ef3i8ISw1PUAXMu3
         67mrv/u/PM3g096z3fjw9e1cTAQx/Nkk/4WUO4eqUmMej9ft7aJ/n7y3uhB8pBU9BXJQ
         SPc8R4DQx/njNwiAPhYqeNf2YYp6NN3Ovx16Zz9sI3pZeNQmanWLqhb5MKuD/qYMoskS
         fmB8q0G04IAiyIXBBNMrq3084JEWznJEso26DZR64DRVhX+19m6OyR60OK9THUy/OsGv
         KyvA==
X-Gm-Message-State: APuU4Z/NTmXVpGyFX3YgVeoeWhO2ytAj1kutwY16f/6sXA1S0pO0sEe4
	deAmFxpuy38P/cxcZdaHtJfwRdYAvTsMjTzW4GNSfQXohDettXH6EMbj54Umftxx5Nwlbe/WDZ3
	Tv5mIJndFmfBpjDgdnA8HaStsrduFylEgwnquUx7Jy/WFVx30geA2Le9ckjvalPW2+IBe
X-Gm-Gg: AZFdTZc3zA8tCPz3EPnIb+ILF6yWIuY9hsYYIAlvLNQ3Y8IuQRsSSaaNOARn7BSfw9k
	Kvou58FRbqQQwzCTiScRDetvdODo23NCbq/BYNHbac17kitJtUq+8lm2QkzK+ol4127JHMaWmpA
	S4HCcsHizO8zfh1poeRSZEOs30NhHlrOMPk9oV7k7Nr6aAp3yGQ1WWgHOTJGqA7kF0ba0QGZyCh
	qdDBbI2d5MfpL8Dg+Jixv5dByxbFmp58aamO2+h27mC/qOb29j4yHr/0RjxswRZH11WWwPgoXQ7
	VLsbV51L6hbWWg8F+mSsW7QA7ky7WVgqiSET94IBMmZUM0TII14nT0VixitKUNU1GH8Mh2eON/d
	zs98ZN9FPE8BCBrZGQ2aaAMC42fpcfxJJK8lASF/UrO+ywq8PBYE8Jz8NWcuHUa7a6k0Dgj6f47
	/rbCra6I/jMF2zby/L+xjGY5YzRg==
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr17643554eec.23.1795458532083;
        Mon, 23 Nov 2026 10:28:52 -0800 (PST)
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr17643507eec.23.1795458531488;
        Mon, 23 Nov 2026 10:28:51 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:50 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 2/7] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Mon, 23 Nov 2026 10:28:42 -0800
Message-Id: <20261123182847.143892-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX0V9RalmVRq9e
 DGMx8NqE700bFZEq4UaOTjGxsvatbk4ZnhI07Tj+1wz44NWsC8B2+DpxGu4DDxl6HLm1c3tT6d4
 I7r9dz/iCRNzbI7xXE2M25VC5DawQ5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXxPhyXi7iFZXJ
 BfFbru9TdvxP8ITbwePKvM6eyNJnKgxXI+ZDRExFlgxX2oM7po4SHkYPUem2uPMeCTdNObuGZeB
 6a08EcQtrGfjKn/8N3cSkl1k/CaQtB1HqaEzUGMuTgg9ukplwmCmRo/4eRdv8jVA4eyMFopeNy4
 Eo5TSIWM0byIdbxpNZV0xsW7jxNXvodXfSLmwktORHQ9Kw0c3fDNO5fGc4Dh1xy9VHKuFlntDg9
 D+zcY1VUqV12aEGYTkpHIureC4pQfK1jsbH+ZchPi3dYpqX3CNNIlmaF+VmAfJ9z2Bc9iT2296f
 ihUS15+dD2JKlbts21hRzXHc8e6R9oBrnu8s/9MWmawNfF8MMfu3fMC18CUyhex5kpj1CYjBWlL
 7ejBcA+3iuUsK5MS04Ed9e9Pb1/B7Tq/snT8A8PIwnrgqG0NMDrinR0iPjXZmE8W4+7ts6KmRj0
 Hdb6vBQd7Ra1xmOBBhA==
X-Proofpoint-ORIG-GUID: zKn2jG1mKwfeCapYg6zVOrH9D0_uFatv
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0485e4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: zKn2jG1mKwfeCapYg6zVOrH9D0_uFatv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 18 ++++++++++
 drivers/usb/misc/qcom_eud.c                | 42 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index 2bab0db2d2f0..fb927a003596 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -7,3 +7,21 @@ Description:
 		EUD based on a 1 or a 0 value. By enabling EUD,
 		the user is able to activate the mini-usb hub of
 		EUD for debug and trace capabilities.
+
+What:		/sys/bus/platform/drivers/qcom_eud/.../port
+Date:		January 2026
+Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
+Description:
+		Selects which USB port the Embedded USB Debugger (EUD)
+		is mapped to on platforms providing multiple High-Speed
+		USB ports.
+
+		Valid values:
+		  primary   - Primary USB port
+		  secondary - Secondary USB port
+
+		Writing any other value returns -EINVAL.
+
+		The attribute is writable only while EUD is disabled.
+		Writing it while EUD is enabled returns -EBUSY. Reading
+		the attribute returns the currently selected USB port.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 73f9fac22e19..3e4647acd5aa 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,13 +23,22 @@
 #define EUD_REG_VBUS_INT_CLR	0x0080
 #define EUD_REG_CSR_EUD_EN	0x1014
 #define EUD_REG_SW_ATTACH_DET	0x1018
+#define EUD_REG_PORT_SEL	0x1028
 #define EUD_REG_EUD_EN2		0x0000
 
+#define EUD_MAX_PORTS		2
+
 #define EUD_ENABLE		BIT(0)
 #define EUD_INT_PET_EUD		BIT(0)
 #define EUD_INT_VBUS		BIT(2)
 #define EUD_INT_SAFE_MODE	BIT(4)
 #define EUD_INT_ALL		(EUD_INT_VBUS | EUD_INT_SAFE_MODE)
+#define EUD_PORT_SEL_MASK	BIT(0)
+
+static const char * const eud_port_names[] = {
+	"primary",
+	"secondary",
+};
 
 struct eud_chip {
 	struct device			*dev;
@@ -40,6 +49,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +114,38 @@ static ssize_t enable_store(struct device *dev,
 
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t port_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", eud_port_names[chip->port_idx]);
+}
+
+static ssize_t port_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+	int port;
+
+	port = sysfs_match_string(eud_port_names, buf);
+	if (port < 0)
+		return port;
+
+	/* Port selection must be done before enabling EUD */
+	if (chip->enabled)
+		return -EBUSY;
+
+	writel(port, chip->base + EUD_REG_PORT_SEL);
+	chip->port_idx = port;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(port);
+
 static struct attribute *eud_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_port.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(eud);
@@ -218,6 +258,8 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	chip->port_idx = readl(chip->base + EUD_REG_PORT_SEL) & EUD_PORT_SEL_MASK;
+
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;
-- 
2.34.1

