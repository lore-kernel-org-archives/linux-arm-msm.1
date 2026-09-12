Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F93EF0DC
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253590; cv=none; b=CNVn+aZDf6mA/2fH7RvXFYpkyEMWm3g3LkXnQ/ytueuISew18cffdJxaXX59Zsz4InvYTl67x+HJl2QaCN470Oa6Z6D4z+UomX4ndxi38TKdyZWXq8Q0ue+O97JgDapcV7c6Mc8ivrCjPMffXS+5yan4xbVyWRSO1SG96yI7gec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253590; c=relaxed/simple;
	bh=3WiTeifuqmMeArbH1dtfZ7piLUat0wFfmRGWAJmbbCI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BoyTrif/APSNyZSER6FJrO1k9TCsZBdlPTmWX64PPsWVV1HRzM7GusE817KX2rfLavWqMkgBrafBXd9M79dt/GTZUwNZQoakzMjZpjJkYhDEcUH9OOx0GQyEleqfwzqogUGgkvPZ9VPM60E7Ma60WJ1J9tsMO0RvM2PJxFhi76Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHnKbCvb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFAPlxw5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHnKbCvb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFAPlxw5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLnRO5816799
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=U2yiW6/w/O3
	YW3IoJI1OCamD5OwPHelC5r8nyjpV8WA=; b=LHnKbCvbc4kV9j7uaKOmM+o0uGh
	63M9osBslA+A3JwrhnUFtBp/gU/KKY1/HpwB2WXSqqDb72F8kwAvTBHIDqS1oUqY
	gVGU/kX7zBwH1BPSq66pWUnhI7QFLNZyw+L2ChKGCgcj86qBF5MnCRE2bex4LydG
	/QAbKJFPpXtMl801AxOxKy1aAsAD3fMaUl1nB3HyVn3sgtkQAnacF4BcbTKhRu/Q
	b+EYaZ36gNPZY7fQZtruis554+KEZpCoRS+3siwJyGCdTl0jq12xfsIVQ8BpdpQM
	XD0yB50qEodtk/2MDCMS34kF/TITSSLmkzV+xrOQVCpKST97tIT+LyPTuPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ca30a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso3748105a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253587; x=1789858387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2yiW6/w/O3YW3IoJI1OCamD5OwPHelC5r8nyjpV8WA=;
        b=jFAPlxw5cuN8oB1oTogTqwKwMK34/340R3n5UXsNufKY4zVPIdtt9wzyVf+eUOUMu0
         znIv9j2eSO//DGydBAeHf+enSTEjuoo5JHedWnnE9HONtK+zkqxmXJchQGkw6efWR1V8
         AgAKRp9plbgCJpBHq6Jym1mhN7xusZeOXj2Bskkj1z3Hj9bY3F9ePOX/KSUp5HqPA4I0
         4sX38ORwVqMf9OQYIzveFFHsGZ5crTDaVPvTgIfK4ZUO5T+ERIfaZ19adhP/dVlG0GKW
         ZU0Fe49/okDhVBbM48hosBDwCHYP3pvBoe163BZhxl11YldpMbemjH+QBbOstRqlAfoP
         J1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253587; x=1789858387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2yiW6/w/O3YW3IoJI1OCamD5OwPHelC5r8nyjpV8WA=;
        b=nV8OPGOoqiP4mJhqNaqrN2CinjcriyQCbySWE0H6oWbkMGz2Jm39ES5cmx+mkEeWgt
         yIRlbyDrgMpHs/N1hpQZlnJU825Ch/CClT13E4XGV7LE1FLo/qqx489E44D4m57OwWXr
         1eqrNw1popT9oL3gSytsSQfEtmrlWqu8bOOW6hV06jBoYnCt1i+dzvkz9tykWO4SgexW
         TJfVE5MayJFc6EkqJ9f9wAX22hftEJG0TSW5ifezyEyTzHAoZ8XUZutoi07npdBgC2aj
         IP5lIIluvnnI5bQQMC5AHHeqc7B008/Rv/gSFIVwjZv28jNpkuMoI+VabSrY2MKWzueN
         Kfvg==
X-Gm-Message-State: AFuF++khd8TUzuDL5Dy3LV3K1g2q72KuKPxvPDaffpfOkeUueGoH8RLT
	qu8L0djcIf4Cu7qyo9lQMXsygWfylJWtLRcFo0oMrIPX7gqP76hNXtgGHsD1b82DTShyr76vS8K
	GrrrHf2uhoo6nO1p+9cvTst1vQneBrZEl1YIYATW94QtLuHB4IKFxelMc36kG7THzWbsT
X-Gm-Gg: AYBFou3bqgZUqXPbaxnN5t+ih6W+fmmGQTBdMXek7iO8h+f5B45vR0tv15zA9HwgGfT
	Xviji6cD6PA2tuV2IVv4seMJX1TZLUrZXjSgyRU4U/sIwbbDNvxwWr6xsZqzQWvo/RUmf/kmMMq
	pU0PpO1J46UJYFYta30zQYAcj18ge6wsXqzXrJpf9gQLlg9BzWEe0sfHcXJ9NBwJF+BHi97oNPj
	8wEizwVRGAJY/bdvquZ1VjP5m2LtgitVM4bx25mab/tjB6qF+xyWFB2gzHtbL1ps6jJmFtm+yfC
	GwFJsU72INqnVbICZPfLxxNba442VDEmDxxNJ/NdMXhuUjfHhx9+iPq53i/tQDFalpyxDVVBLW2
	uxpncv2PHTYlK7H4ZZBogG8zU3dPhoE6MbnkcJEBunptj+0O0p6hO7g==
X-Received: by 2002:a17:90a:10d6:b0:39d:cbb1:c96f with SMTP id 98e67ed59e1d1-39dcbb1cadbmr2556068a91.18.1789253587029;
        Sat, 12 Sep 2026 15:53:07 -0700 (PDT)
X-Received: by 2002:a17:90a:10d6:b0:39d:cbb1:c96f with SMTP id 98e67ed59e1d1-39dcbb1cadbmr2556052a91.18.1789253586568;
        Sat, 12 Sep 2026 15:53:06 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:05 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v8 2/8] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Sat, 12 Sep 2026 15:52:55 -0700
Message-Id: <20260912225301.3396556-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfXxLxq0TSzSp28
 DZiA2/mFzSavqgl9FGwvnl5QfF72vRftEVPSu4yh2xQZ73s6e9l8omtdyNqU2EiQCmu3p+8O3Ow
 YuZ+ei/TR+LKo8JrqWe0C1T3Lc3cgZA=
X-Proofpoint-GUID: Bw_SrX5wPhWJlj9Ju8AR_Cmjp3rwE71F
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa5d7d3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Bw_SrX5wPhWJlj9Ju8AR_Cmjp3rwE71F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX5eoU6JT4K56e
 zHIPuAuippeK9teliy1tRfK1NutqPGe+5Nlz8Hwbbwhrrha4RLktujMvwPWF2luWJbOrMxVHQWd
 TP5PUu2aPyo6rmQ/dfKyvtFm38mJFh1pudo7L4/pz842sOkjirGo4Ekmef40wOdmo91iDQh0cUj
 hZz0QBCDCtM58yiipCTgIYbsU3qcGKjfFz17rJRwIh7/mjoadg4y2+LDxXfO6piJKYAJ1J4P5Of
 yKNkL60XW43oybmLaVf5KFWWLR9x7HIijqrCgebJbLVtkDHZyHOMPDFGVGM4v/c/DPXSiwctiFD
 XecInD1rbgK9Ms/uxWdkT/ALnJZYabBu4m1vSnPTQeZFKqTJo1XcKsfhs54J4FlCmZoZTMvfZeu
 5znB88wSDqTOoNJnB7d+Y2s+l/Zf6DzGr0OZgfgLTa1dZgpwyNbUBkHsAvj8cBMh3CfHwcldX4v
 cytYNtuylviG5RxfEvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120334

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 18 ++++++++++
 drivers/usb/misc/qcom_eud.c                | 39 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)

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
index a7b9ed4ac071..d32d382a311e 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,14 +23,22 @@
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
 
+static const char * const eud_port_names[] = {
+	"primary",
+	"secondary",
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
@@ -40,6 +48,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +113,38 @@ static ssize_t enable_store(struct device *dev,
 
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
-- 
2.34.1

