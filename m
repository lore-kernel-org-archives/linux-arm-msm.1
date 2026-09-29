Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4454EB862
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717725; cv=none; b=MTxy4ranokdGBqg1RNtT7h4yh6EX8t4EzV6NA30RYe9yuGFmrEl23fmUZJx3dz3eHjZ3Xo3H+Im0JKsZ15vGraUUg3ZbaXjr0n8Bx3lEJ06mjKVW/7mNeDm9fajwhrKh+QwcP1qrjAFDotTex3vLUqUuFldPK6nRrhncx8t27pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717725; c=relaxed/simple;
	bh=RgpScOi/jTx0NmjvnxrAqWvzEjBwpYvY7JrWqQ+DP7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mXVY2AqhHrevCGkUBo1xkL4L8/WBZuYKGJpVSbZj9PiRhWq49fsd4dxhm1c4tgID/H5GHBMMUg+I93VVbT7ZArDTaWto/z6rv9AhfgCkV3TUiYJzHQhm+YDCEtFdRe/njTeNH3y+Isfyj6B0JT+97SqmqNcQNlxApSXB8+kZei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tr0V8xdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLUPJMH0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tr0V8xdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLUPJMH0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THbGOo3842772
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HnypzRX9jY9
	YKeCtZsbOHSIQENZPHY0b36j/Ve8BaVM=; b=Tr0V8xdmtftva82Ku4YcQA70YF/
	viSju3XE6Us2hF3qrm8mWeVR5ytd9tEB5oWY3AeBBSTb2zwu/PSt8Ex/4fihdSTH
	wnqLzMhiW1v6a9lszQN1T57CXidFXJ6a1EHbxSSTZHvSpFJ7XLroPENyEPSWPs0K
	I7rhBB2kbs46zQZTByJdLY83USgDOVItt6zJ9V7ZRBLBWAJrSGcOIS89RqkFctul
	ECmTPNk7qiMa6YD1F8fffPUuBLZRYwk0ggGMP0HLMNalYliqD9ZURXvajf+4uCpU
	Hq1PBPwc24E8JOnKxy2KBnMvXvBXkgEUqz5nWIFz9/57SNYC8cehHagkjKQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0vb1xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34318e88ba2so3599309eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717719; x=1791322519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnypzRX9jY9YKeCtZsbOHSIQENZPHY0b36j/Ve8BaVM=;
        b=VLUPJMH0LzW8FD/rGkms++yok41/xxbDQZbr5qIiHhiHHc5Qj2ksVacxN3OH51GKuB
         8XSlscvlf0SY6RgI9Z6k5ZZkKtf93TiyqGs7AXhbf4t2/pceZbkm+z3PwNz8WApDnSYX
         wvVCirRb7mCuD8qrBPHxuqEUl7Ydm1DogHVGHuT8wyUSy7+cBCZZuYBI+XOo54M48B+l
         9egs70Z9V3xgKhJs8MCS74uy7d03brPfYDZ1Usa2krJGJchz3VKTjX73GkHgir48NvWn
         yPrtNOk17Xem7y0/oIfMedXEP/3g027MwTF4SLn7IW7l5aGQ+x15q7DxuzW1QH/qp0yu
         8nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717719; x=1791322519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnypzRX9jY9YKeCtZsbOHSIQENZPHY0b36j/Ve8BaVM=;
        b=OEnfsd4VONeqC4rIZEvs1FtlxgHQgifLoBxJZ7VwzTODw6aKc5HbiOaFf0xNrO9Vw1
         MAPllI/QMFidsHhbAbsxcgfqYq/oe5jYjLDi9OC9Of+lsw1zI2qlvEm+gDhty+Z+l54z
         wlk+PxfJrUUJAmmxniUCqUOFjIHzuo//08rAYT9BlFgONG6+NjrKDpSnnMdYFtuxYk3J
         1YD9ar5y0kjQFo5rTQge5Ad94R9a6Pj4tE0vACiKcPOWge1MkxVrFpUljztIvpUrfJ9Q
         dcCAwFXwp07z9VHUnitGYumvQNy6mDlFZoRI40xr4bJewK8kKl3q4Tv/C5VJgZ+NATu0
         Q5Cw==
X-Gm-Message-State: AFq9FYJHNEjp5h6zKm0yd6gfN1NL4rTTgAc9coRict+jV2WXG2L+Uw+i
	26lvLR4h2+ZGI2XYvPvEaKEFo3OAZ/jsJUYU/OKuwptibn56vpL8BoBMDID/Ui9aTs/lpUsjCRO
	Sf8VIyQbw+j0Cx/WdPU3JAVkbFwVykv+sdyt/h5uJoeQbF3hvYPfUJwbMC2vE1WLfM+zK
X-Gm-Gg: AYBFou3QEzWf28ExbqfAjV7c/XK9o7HNoqkvtGYodFUeotESV1vjPo7wao1EWYGzU/8
	D5fKsg87Ksa+C2865evJn6R7mdTQmFS/Qsm1mbR+or8GBZMFn7pukLL9Uk73Ir6Q9xYOkvVm8X5
	kBCQU2pz5y9nr6TRNPXL2iaW0sJhybDrwrlZgE5IavIA9m6Uxao++M1IbZBrXB8eTiXOi/gy2HE
	5LV0zVMcSgdFq46DsxT64jwLtnE3ye99OyKfg63S+UyQEjdGW34WZfKIWdLwUqf0OuY8LpCaF9N
	G8cC7FXPf5sA17LRbrEsfP5+TOu8gplsOkaQTuBfcc9cd2DuH+F9dR1/JxTsOa2kAuF3D+P+OYB
	vZsz5T8y/lt/2MeEW9e27v6rKBCUIJL3/KX+JrTtrV2rWZkllatzR
X-Received: by 2002:a05:7301:2105:b0:343:8d77:1d97 with SMTP id 5a478bee46e88-34c676d038emr622129eec.39.1790717718613;
        Tue, 29 Sep 2026 14:35:18 -0700 (PDT)
X-Received: by 2002:a05:7301:2105:b0:343:8d77:1d97 with SMTP id 5a478bee46e88-34c676d038emr622093eec.39.1790717717924;
        Tue, 29 Sep 2026 14:35:17 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:16 -0700 (PDT)
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
Subject: [PATCH v9 2/8] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Tue, 29 Sep 2026 14:35:07 -0700
Message-Id: <20260929213513.2401005-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5gAGHRDQmfGg58--YbL83EfKeqhPtA5c
X-Proofpoint-GUID: 5gAGHRDQmfGg58--YbL83EfKeqhPtA5c
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abc2f17 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX6V1VT3rAOJVN
 Hr53SjlNfNKCqxoysQEKu5QkrarrQsXnSChhNZGDfSmP40+rjqKAo8cZvPMxb1sQ6XsIx3FHT6f
 DXp+XLX3U22YgRY/vdQy2IHYyNJbC1yYASomMxeZf9ejg/TS5WPG4A8UsEESQzMiWLHy0DlbuiX
 n+dTDYqRQobQ2vO/Isr35dLPo7AzYMVjbGJCsU3geqDM6M4szG2LkhTefLCVVxuO5CiWJ7SI/YF
 DFzxuK63IeLohQHDiJomcwpCpht9rLDHYR9Lt3JlVKtPujUDyufmqDkVkxZUtI8vD9AlBzXoSv4
 rnQDNsQFaObTAv4uUuAN5ya6hDjf/6SWKJABoW9fPrl4yofygp4UCKWG67ylmjk6MVZ8yyv0EWk
 IyuZ/tsdoXY6eCc9jgijtxKJrBh+f9V+/Go6DATV8dd1GOd8kPRdoaahLZPJGWAW+6HPgH9O2y7
 3AUk5HDLlRHfbcUDwIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX1Gs0yfRJ19vW
 RM9hs5eC+98x+zE3jBqrHr8i/DcOAYNuuyqOpP08cWSeVvjtmKmULJT1bnauALXQHNGAP8PPbmL
 AyJL8aVbEL4eeP7Gv4dbIVVr1kEMbk8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

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
index a7b9ed4ac071..fa640e88c88b 100644
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

