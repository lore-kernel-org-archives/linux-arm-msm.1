Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31622346E72
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 03:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726942; cv=none; b=UPowt3fQbjREpkp3xu5CwgsRAuWaMvWMLl6Aa3L2ApGIl87ByiRPizrl2inEGjOtzGyLjjVOwbM0kgtMC2K5VS5bPFT1fXfBee9M3xmMasgk5nhf4KxKwLNPIjM/73mwrHGs04ThTel3dJD8isXScaVDlwHk30UOhKYPPtgtorg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726942; c=relaxed/simple;
	bh=t/IOKpp8GUwDRLwyyvCcudNrEhONnWVPtje8/6Ie4I0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n0ATvOKwnuhzadXrHJN61tdGPRVf8Lii2J4ZZ5DbG4uXlR6+vDQJelf6f0XKgWbLIqB5CBL+wqW3REmyVpAlPj+SEbc1J8kj+407n7GjoFOSmVuTLflDHTHfYB5IxvArvk9OKZv43VlHlRg2RiZtULCoHLqUKhtZaZJnnNLrlno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gl2ElXTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDqClefx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl2ElXTb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDqClefx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVxhe3960718
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 03:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pWnZBTr/2nG
	NSYHs6XfsEPFm8fpS+X1zNeHDN3jDRwE=; b=Gl2ElXTb1rqwr5yVfvLzKuB3qr1
	50BRwGJjDJG9YAdJQGKdfH0aYesuaHj5kLmtOKQ1VRQvGWvjRFjJtynkswXgYBgI
	FF6cLnIjSvSwdkC/H6gyElDMRWdWz38kUT3nxMpVyVliu5WyfIzGKtmNEGE3UiSB
	lkwmOkKojYNKmfwSkpMTgM5gLO7wnlfP2aoppxVxehqgCapharji3KVbZQ/9D+CT
	uDrS/EiR9oFJCcxe/Dfp4CBwG6uGYtBqyr9/PboXMsHEBCQ3CH0l8rI2deJ737Vy
	UZG4ynPw4DA38MUHzZIRaLrIdQImW7qYfxzFKJnx9fEjVz8oNRYb96yhBvA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fah2s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:15:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso2857066a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 20:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726939; x=1786331739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWnZBTr/2nGNSYHs6XfsEPFm8fpS+X1zNeHDN3jDRwE=;
        b=RDqClefxOEhiTow+hAuF8u+wjtJIHnFqVtD9KR4MznIK6pXzJ6vEoYfQ/y78Wm+acE
         dSoFOmPA+/TJkRzkzLI5UambJtV3P0/2tNoQmyANWpTZueWDCMmFmqqsxa/n1FgsfBRZ
         MNScEjv9nae4rGDQpQDOlBIelMK0fvQloO5RZHNZxeV+NlhI147+GgssO9fc8fI3oLmU
         riHU/+lDDrkwE9sd+Ji1DA+mpjhNEpeil7RtLJjWn6kOzI5gnvY2WktguHkpA1aGcZRT
         F0TDuVp6VZclE4wTuFMZjaQWjP260QUmCxebYdqwNO320nMTzybApP+hNIzf3CVmcL5o
         ckPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726939; x=1786331739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pWnZBTr/2nGNSYHs6XfsEPFm8fpS+X1zNeHDN3jDRwE=;
        b=Z6RAn7EnX8gxCoJ2RM2oCYZGBv57mBbmSAx2mGmbjS5dWBgz0tlxyGf922zdUfZbyz
         B7LdS5JqBg6TXQ6jjUlx63wOuwLMpirZnfGVjwY9ED+jX60nsTpR1JDTV0y2sf1Q3BUA
         pOequJra7f4XWeYxyHUQIwTQpU/hyHwaiw0uo/qx4Kn2RY7HCos4dqKkxjeT+Ig0sInd
         VJPOFA4pkhFjGXwK8t5mFZdiTXEQfUeMsys8aUhHK+EsIx+s35X9slmW0eYmjHLEvfwH
         qNkLR2Etd7hpSxyxtAV8G2ABGfmkCjKkEiNb7IorzCriylcIbvM1FTy4od+hzYPWrVz/
         R9+w==
X-Gm-Message-State: AOJu0YyLcjZhWgxOiYyUE1m+g4WEMPZRBpJi59LjOB7UEVYYlukEb5T1
	DM7/FuS8GmCJcN4WdB3uPVe+JpKyQ9JfTNQNGo7Fdagn+Fpr4dvpvshTIjAsJc3VC1tbvK9KyQd
	23COY1AnE3gAVElZwlshLH7ZEEwLNR7bMzFVlncsTgUtNWNESROxjhjiUhxH9CBIZCspeElf68N
	OL
X-Gm-Gg: AR+sD13lawpJyhPKfL2T1thpWh3fk2o1kN6zwN8kE8/2DwmWyiUOdnGdoyPaNdMU3FS
	djY0Q1ZylKUwu7i+2IUi8+lq0hOUHhgV8t8FbEpLDzhe8iiZumjeD27Fi+5c67XNLvHSRU6GDZU
	FOQY/gpGyQck73zanp1/06+9C2cAmj6i5tAP4Amkk+NO+8Hg9Nj1mnHvJiSF/wj4YALjtz4hyqj
	Bfw5tfwowa6D/JOTYg1pqGNbvUyj13JivWlaI8o0zqnM5mOFkieY7ER9EhLaHUAq0sOkbJXjTEh
	KElMcY4SNYLl8jwX8n+r9OPiKkRFHOtwjV7IEv925m2eDnx3usb792iuCwlV/qWxd9HsJStDmz/
	kIPocYPsy3lOptm0FJuLiM+7KHMnQfnW+t8EE8JHSwhPT4kXRkFgDFw==
X-Received: by 2002:a05:6a20:7f89:b0:3c4:320a:737 with SMTP id adf61e73a8af0-3c91a7b7fadmr10394233637.16.1785726938662;
        Sun, 02 Aug 2026 20:15:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f89:b0:3c4:320a:737 with SMTP id adf61e73a8af0-3c91a7b7fadmr10394195637.16.1785726938219;
        Sun, 02 Aug 2026 20:15:38 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:37 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 2/9] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Sun,  2 Aug 2026 20:15:27 -0700
Message-Id: <20260803031534.2942628-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a7007db cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: kVSRQkIxUjhztmNQ0Ni4KVTOiJvbM0XI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX6QF1t+1GBY30
 wGiYy6F95tiQR83wESlbIcTrqUINWetUDjIg3008uv05w+VaZViA7LUZqnd3+5IWJpauLxSHgkK
 2Z6mu5vjLnu9xmz+aFRqeS/Pjh+UFLU=
X-Proofpoint-ORIG-GUID: kVSRQkIxUjhztmNQ0Ni4KVTOiJvbM0XI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfXxOei0MYzN0Wr
 5BTRo6w0R1QHFwMTEYrXkoWL/48RoW9BxqsrfWbCvYgQP8+k/qyNhVrOyMe78C2ttfBQTVX2OVH
 Jn1tDCKTwdN+dAxzMNpatGcVojSDJR6Q1M3zgNjS4QB5vgX/k41ybdR+VZF8vg9evzSkLQ78dO0
 mYj0POddvROQWwlMzfopChWmZIcQ7Pj8nl75/xMixDw5ESh64DQSAwTImSRGp+FcpVKy/oe9doL
 5uaap59+RXBbnyw0YCDM5/IOi95LF3qxGqMXOTJPN7euhKoVeSlDgjhJKjzzvKTjXz6bPY5IgAB
 aFAoazVNQ3B0Hsz9hIuvSFmcCn3Fq2CFSgqwKyXjBeFpCQ9pCIHnEE6dNKJcssMURWkjQLxMTKI
 lePqP6Csu5jfZIGUD3Wdv1fqtWb5xcyAw7NJyXGvJeNAVKGdmel97EqbZxa7gc/ywXt0RlyMUPW
 s4370w5re+y8jme5bdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030024

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
index 926419ca560f..25a6a8f110ec 100644
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

