Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458535;
	b=RPwbRjkrtFjKSfK+sHZ3r/amM6ZuN/vFc2WaUt6nQ/U1SY9KDGyX99vUBDR3Nvvsmp76
	 NNwt/F3hMdPWVU/UOLlDHq1fIPSjzSvfxYI0zEN8qHjuKyDxRjaeBvfCf+YgqtRoffjSv
	 98AyGiLVZEfc+nd3akfAMLUllIUzF9DIuLcwTffaTvpxFibhVO44dN9/uszUsrlUzom8I
	 FQtT7OdTt45UfXN6Q42WRXDCFICuPiQV0LoiS3V64X4he62bYBHB4kPugvMq9E1kket17
	 6ZGyuPSRUlQN/Q5K8No1j7xPO8tWROhKvHyQ0y0ZRbjtJrq6Cs13g4h988oe0JcWGUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mHv6aWy9+lFZys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=;
	b=Qz+2D69J+Rc2Usr8y+TauphAplh3Vw+Ni8iUzs/1YCW2VC5yiXpzPaGr/TDFSg9PBGNO
	 pL5UhgtQxFmdnG2dIrzc6OMvygBmslajb/jIeMZufajFCH6dyvFC3+X7CfDY5ACbtC2ul
	 fiuMq/s4UJ6viW6EIqjstMmgdoCie5HNdoAVnnWfg6V5iHH6gHzp2DWXuIVVKssUZTDxl
	 xhNQpa3rOnJV8Bkpkj2QWLnWC2lGrepTBZPCDHtdBD4rMtlju2kQS5TrcJblpx79cwP3w
	 HEeYshKPLPsgOn/wHI/XdgE/ZVpoPbvW8gyCxn7CwCsvQb49n2OQLIFgiXSlR/CuP7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HTazO0L/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ad7lawWC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9611606A6A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9611606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTazO0L/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ad7lawWC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGmfi3025333
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mHv6aWy9+lF
	Zys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=; b=HTazO0L/4xlBhQ6odS5L8MGOK+C
	arZ5a1Aqn1dfk+LQujZz99ozwUsdHsPLukuDsQr6wrsIecKVr+5fKGI6VYsWBoUu
	UElYVXk9/SVBbHthdoLfN8xTK2SDNJkV955aM3xkDV95tEisEOzbQ5olgOOLsEOV
	zEHvrF3mCX33gXStixKEBCDd6r27iUjLRxI6vu0yXJgSRMRscnmYS9sj8L+5Tx0/
	BUjzJtoxeaNMlt9SKPrSFDjQzUvwU9aS+Dk3h7mV/f80JiNj3DQfj0PSskNJv5pb
	f2M0cjOgMb5Tj3nBzN97dwyXlv9UZh/uni/ZfDmLAUcTwTDINm957Athp8w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pauy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5868259eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458533; x=1796063333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHv6aWy9+lFZys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=;
        b=ad7lawWCPxHl7Hs8uQeqfZBmzeiLC3sPBGvYokv2jwEcy61oekTUcposrd9mx8zNPq
         KUcshBSurYF7npYAxHkjiyBqX3OcBfUDdVpu57y574EC+HeiVsATcbrfjNhZEpqYpnGY
         IW4JRUzODEZc29wCnGKpzUmL6aAQ3UHOhpW6TitSLBPTRaE70VPjrubh+k72HdqAYT7x
         aItWWxWf2ShE6nXiKeAiBdbKxWSI7AEx+t/YE2Qvim518F59f57SpI1Hrg3HeRP5wQcZ
         9uu9yFGEzD1uCydUnvWEkQXwejbL5aLaLT9mWMxI+STqNrbxIiMFiJbDJ7/GECgO1bfB
         8teQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458533; x=1796063333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHv6aWy9+lFZys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=;
        b=lhUaWLKGWxzCgzemuxJK/hUGmIODR4FaARE7tSHHDam/Xlo3EzTeEw3aieA+6GIjAg
         PeFMX/4OoWRqeIzyOk4eOulH7vGxW6BHCs8FEqa24SkCxUEK3ic24GTiVkBbKdS7GMXP
         mCz4aD6+aqTzeiITWNE454jMwj18AaZqIIgO1HyHXL0Pljq2tDgHkDxUMDt6Owl/DoeZ
         zJD2qNlpaw8AhA4UTyFDr4o2AI4Kfqf9KIpqaYAi8wMrTy+6C4f3WB/Tla7BMGNaLGd5
         8VHXXnLXyZQNn1a6jPWtwhCcARz8co7o5MfJODabnDO1v8oyi2jkaQ2RdKpIGxCiqmNK
         Rzeg==
X-Gm-Message-State: APuU4Z9iuK/95hTbvJbMF8pXi6CYdcAG6lbJEkJ3LMFJKCqI6At/UzA2
	bfRpf/SHNCBjcvIyYMrlfzzjI1xljN3MXTmZyg3PUgLU4zytbhwZjLg5AnAq/0WytTN9zpZCexg
	1y1AjUm0IpqmPB4V3KbE5P6MLZToXOCBBxi7sSorZE3sOPdVcjO0zeXtxNjSwg80KMJ74
X-Gm-Gg: AZFdTZdAnK/ss0bra9NkR/m2BWJVT9zW4t6Ljk3uIOGKF8cfRrIJuJ0BN+dt04gS0bS
	+eEhX4TzPJJYtT/716TJH86KHE90hwZlNE5gxSxW4SgbgZU+awj81aM86fafHBw7imhyCEyUtWR
	J9SqIC5fLzDYOiWJ3cJ6K8owRB/AyoD47Tw7dLkQh3Kr8qmD7hGqbgTOljhYSUQvd1O+qYd3Gj4
	LEIY6wgWTShvX/zfbSvqUpkWLvLdmKtLZA9E3Pf6HxmoMGMIdLJ2bYLbANpP4ENwzoT9Pmg/yaI
	49TLZNv6mR34bPuKxO/7p+nfMc8zgspV5tQHYFrzMqiTw4T6k9AUEhbUKLviBK5GUZLgO84+/2B
	4x/TjAE7a1Yh68ENzLdCFUA2+gHHV68MTgNqtFZ/Ckvs+7YSd/Ym0El1tr2smPnh9F7/rJTHH1T
	yTek1UVugAFYwW7/C64UM81GPgBw==
X-Received: by 2002:a05:7300:a9c:b0:386:a8a1:9855 with SMTP id 5a478bee46e88-386a8a1ade6mr5145946eec.1.1795458533267;
        Mon, 23 Nov 2026 10:28:53 -0800 (PST)
X-Received: by 2002:a05:7300:a9c:b0:386:a8a1:9855 with SMTP id 5a478bee46e88-386a8a1ade6mr5145913eec.1.1795458532595;
        Mon, 23 Nov 2026 10:28:52 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:52 -0800 (PST)
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
Subject: [PATCH v10 3/7] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Mon, 23 Nov 2026 10:28:43 -0800
Message-Id: <20261123182847.143892-4-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-GUID: Xk6CaHE7jZ8_jgbo-Uo5emF5ETb7IyWc
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0485e6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OKkk4dbWoaB1VCfbt-4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXxEvGbnrcd41i
 f3Yqt4qzEZYvHB70QQUTmHlCfufulN9/Zn5SLHQ+IO4Iv4DevsDXUhw2zgSai5NThTQe4OaPftF
 eF6X5m/E1QOe7eqyHXn2mAFqJCByFCU=
X-Proofpoint-ORIG-GUID: Xk6CaHE7jZ8_jgbo-Uo5emF5ETb7IyWc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX3/81bWFijQJi
 ZMi4xX7iVg0jY2rvDKst075eHSrp8z6gmyDTLbT1CGSjWlfpe/KadQr/fs2Hwut7bldIr0Ud0f8
 EyIE9vJBBRdlxapiJBh575nwK6c9ZkhOdN8v7rRqh6s0UoQACo//2o04n2/8kkPA9P7eebBoWPl
 D0osa2g1jpFP0wIv2maGaoq7mUbezzWgkg25WgcmY3Qr6VDtofbED0n4kzKP8IxQmiz66jaM6eY
 VHW3sWIBQNUOULPywKy1nzbWHeIDccZNf3rfD0+X79KXRAhX/jrcpYmb0cYU/i4nTTcs6tT1R4d
 upUALFr6LorxtlRY8naSG/vPANewg1azYT7BQgzE5xWTT+RriIa4VwTC8wOlut5xxFI4SvMms/g
 fP4WH3GdyVe+3Hjx1A/3IydIEKUrl56mDTv8V7z5/aOEmLYMit3jvGyhlFz5sUR5Sdtbnx8MG4e
 KmZtiSSihIiYJlA4DVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

EUD hardware can support multiple High-Speed USB paths, each routed
through its own PHY. The active path is selected in hardware via the
EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
the High-Speed PHY associated with the active path. To support this
multi-path capability, the driver must manage PHY resources on a
per-path basis, ensuring that the PHY for the currently selected
path is properly initialized and powered.

This patch restructures the driver to implement per-path PHY management.
The driver now powers the appropriate PHY based on the selected and
enabled UTMI path, ensuring correct operation when EUD is enabled.

Historically, EUD appeared to work on single-path systems because the
USB controller kept the PHY initialized. However, EUD is designed to
operate independently of the USB controller and therefore requires
explicit PHY control for proper operation.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud |   3 +-
 drivers/usb/misc/qcom_eud.c                | 129 ++++++++++++++++++++-
 2 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index fb927a003596..f20b82b5a38a 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -20,7 +20,8 @@ Description:
 		  primary   - Primary USB port
 		  secondary - Secondary USB port
 
-		Writing any other value returns -EINVAL.
+		Writing any other value returns -EINVAL. Writing a port
+		not supported on the current platform returns -EOPNOTSUPP.
 
 		The attribute is writable only while EUD is disabled.
 		Writing it while EUD is enabled returns -EBUSY. Reading
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 3e4647acd5aa..037b074318a5 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,6 +11,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -40,26 +42,84 @@ static const char * const eud_port_names[] = {
 	"secondary",
 };
 
+struct eud_path {
+	struct eud_chip		*chip;
+	struct phy		*phy;
+	u8			num;
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
+	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	bool				phy_enabled;
 	u8				port_idx;
 };
 
+static int eud_phy_enable(struct eud_chip *chip)
+{
+	struct phy *phy;
+	int ret;
+
+	if (chip->phy_enabled)
+		return 0;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	ret = phy_init(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		return ret;
+	}
+
+	ret = phy_power_on(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		phy_exit(phy);
+		return ret;
+	}
+
+	chip->phy_enabled = true;
+
+	return 0;
+}
+
+static void eud_phy_disable(struct eud_chip *chip)
+{
+	struct phy *phy;
+
+	if (!chip->phy_enabled)
+		return;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	phy_power_off(phy);
+	phy_exit(phy);
+	chip->phy_enabled = false;
+}
+
 static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
-	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	ret = eud_phy_enable(priv);
 	if (ret)
 		return ret;
 
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret) {
+		eud_phy_disable(priv);
+		return ret;
+	}
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
@@ -76,6 +136,8 @@ static int disable_eud(struct eud_chip *priv)
 		return ret;
 
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
+	eud_phy_disable(priv);
+
 	return 0;
 }
 
@@ -131,6 +193,10 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	/* Check if the corresponding path is available */
+	if (!chip->paths[port])
+		return -EOPNOTSUPP;
+
 	/* Port selection must be done before enabling EUD */
 	if (chip->enabled)
 		return -EBUSY;
@@ -228,8 +294,54 @@ static void eud_role_switch_release(void *data)
 	usb_role_switch_put(chip->role_sw);
 }
 
+static int eud_init_path(struct eud_chip *chip, struct device_node *np)
+{
+	struct device_node *controller_node;
+	struct eud_path *path;
+	u32 path_num;
+	int ret;
+
+	ret = of_property_read_u32(np, "reg", &path_num);
+	if (ret) {
+		/* Legacy DT uses 'ports' node without 'reg' property; treat as path 0 */
+		if (of_node_name_eq(np, "ports"))
+			path_num = 0;
+		else
+			return dev_err_probe(chip->dev, ret, "unexpected child node '%s'\n",
+					     np->name);
+	}
+
+	if (path_num >= EUD_MAX_PORTS)
+		return dev_err_probe(chip->dev, -EINVAL, "invalid path number: %u (max %d)\n",
+				     path_num, EUD_MAX_PORTS - 1);
+
+	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return -ENOMEM;
+
+	path->chip = chip;
+	path->num = path_num;
+
+	controller_node = of_graph_get_remote_node(np, 0, -1);
+	if (!controller_node)
+		return dev_err_probe(chip->dev, -ENODEV,
+				     "failed to get controller node for path %u\n", path_num);
+
+	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
+	of_node_put(controller_node);
+
+	if (IS_ERR(path->phy))
+		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
+				     "failed to get PHY for path %d\n", path_num);
+
+	chip->paths[path_num] = path;
+
+	return 0;
+}
+
 static int eud_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct eud_chip *chip;
 	struct resource *res;
 	int ret;
@@ -258,7 +370,22 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	for_each_child_of_node_scoped(np, child) {
+		ret = eud_init_path(chip, child);
+		if (ret)
+			return ret;
+	}
+
+	/* Primary path is mandatory. Secondary is optional */
+	if (!chip->paths[0])
+		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
+
 	chip->port_idx = readl(chip->base + EUD_REG_PORT_SEL) & EUD_PORT_SEL_MASK;
+	if (!chip->paths[chip->port_idx]) {
+		dev_info(chip->dev, "secondary path not available, falling back to primary\n");
+		chip->port_idx = 0;
+		writel(chip->port_idx, chip->base + EUD_REG_PORT_SEL);
+	}
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
-- 
2.34.1

