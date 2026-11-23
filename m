Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458538;
	b=cjJzy705lvRp35H9g+bkr7SJaZye1E34Ii7GgYxR9QjBPV/9od4uMwHtCYqgBSh1T/Lq
	 Vx2Z0kpB96TKEUABQUfcDOWDO4vVPfpkH/7xOa2n+PepViGG+M54rFf44VeHtqK1uO2QC
	 IMMrbPuybyTIJ38AF3ktKoZH0OddJuFniSIH3YbhpotlPgapijI6KdLbSCQu4/L3jmSTj
	 YZpPePoQP4ES+Lt7gA1OmYOtrq4n7d1Id6ecqTnB4f343pnWDzZbM2qkX+pPO230fkyDG
	 zzUV5Hb4LwtLXQRP6k2eb0M3tLj3KILw6skIyIbV8lACEsidR/nIA+3Cp2AVH5NjTDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/JIMNzd1d/PnQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=;
	b=Z78tW7FeQ5qBmkC/Rab2pC0TEfVFz0uj4+dJfQ6tW8RTnEiE+Kbmk7cO+mTvMcoCsvdN
	 tzKkK8vOWV3bvo2SDZ2dDLshsdXflq2TZycCM2F/aqhJfrZP73XPYM/ov+IbeBV6g6RD3
	 LotOWqcaNWWwMP+JgDG15RNipKQtJ2CqBAvQop4dUE+IiV2FqAhzfUwRgwjZOxLcCNfqM
	 OfQZS0RD7jDNTYl/6STKOyt4/Oz7L3MC9bTG8N4uZVf4KpRy4QxIwI9yiMnQRBpW44mrV
	 JO9tqoHeSIBFG4a8PXjT4XhzCzu8nzTlRC5n5hL0kOqFfbgoSgpYJddokPkFvaNS/8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ox9I/lp4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DQC7xS/x";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79B360A2621
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79B360A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ox9I/lp4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DQC7xS/x
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3N22769536
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/JIMNzd1d/P
	nQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=; b=Ox9I/lp4PWHFSxmIOZ+GxV80YH8
	7L99/xEhj0cdIP3C68Qaqbe/rqXO9+uEBnPJp3TyGRk+jlLHF0tgI79ttKvpKrSF
	iSAMOIS88CZG/K8DlfoOcb4FzijuTaS0JBnA/5CDuaC6dxezDfMv22+xwhFfqKmX
	rmm2ZEI7NceGgaPomiNnLZky5IZadDA+755q8QX2y0r5dPHmPFdVlEhCUTAegAwv
	EZBgokAVzZ+Dvpc+eSflfYhQt4cyPpmibAszRB36NRL5NGfpNqfBHJEDVF8mm4Cz
	yVwLKg2xHd7vDwsQHPQFP6Jxa1YMqMv7/cTKeUvIIPnYH4Ol19KhNoL9oLA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pattn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso4109840eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458536; x=1796063336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/JIMNzd1d/PnQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=;
        b=DQC7xS/x+nJkSt1CRm7PenkoecPy839RoppqceYIQnoIimLEqCohnmoi28DB9BIH8F
         BTlAYg8KZYr2zDLS2cWklIvJAvuhw9mpVefcvZ5YVqSro0NXT7o/FCuGjwxJ1XP7u3Xj
         JieNfJZoapqGRD2nQSk7Z3aXcIqH6XowSpQwvov/l+qxG2p4LeQBOq+iEaK5fbmzo6iZ
         VfKvIin/HvkAeQpIzelTLh5WYpkGxmw7P+ydOar+qk7bxJS1ONIha0VHxh9PQgYTc3E3
         Zp+1RROCvaRwzVSf7f3ytHJxVFUvKMh3kTqAax2SDpcMT11vEpSzXsaEV/yDDHcnGP4y
         WVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458536; x=1796063336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/JIMNzd1d/PnQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=;
        b=KYeas30HXWMK5OJWbyTzKNuPX5MjHIwouzU/5lgoYjae4lR7/D/b50piLgLAiSPzjB
         s+xjn/TjPyCqi9ZCDiceEzM9cKi6Wp5LMruEJM9WQJYaY5Wd5t68hXH77BQV7gb5UBQW
         w/OoBLNLo7LkADo/exlta5V8bO6YzaxcEd1pl0RdCO78z0/G3EjganPH98Dc5uxmvQQ6
         9U6pkbEeXkeuDKjvgZ8K90kpfeNYQob+4jsCXcYG7A9Eu2VZ5yYZCaRHRtOM5veJPFuh
         wpAtFPOq01ojVWnumbyzGZPrA9sWO+6bb3MUBMh/yLR96z1F+k9phP1EyEmMtGptEs+o
         yWEg==
X-Gm-Message-State: APuU4Z8tSvzfjJ7aVsJurmJ3IfbTE1CcpKcn+ub2j+k8zTmIAk998yIR
	YWf1BW7vt0WXeRW4eWVjGP4o1udBIJjhfyBMYWyZnzJk/ByY7rs0uf4rjyftgzNdBc+ZhBkq/Cm
	mBAo1X66/M+kevl/YezptsCs8PyUtKYQJuJ+Ft5T/zZ77YUze7JBKXH2hAJg2gphKA7FD
X-Gm-Gg: AZFdTZfGEUXNLwSFjaYXhN1IzG+VR57Ujbk9hwRLGXY8aQWxUxP9p34wqCbS0x5Cvx0
	b3j6RKeXEI/qzilaNn3q18CnLgmu2EQbjbtNTfgFi//IcJ8VpJPlCpgRlmOJjg8RHNEuuGh9D7Q
	j5SoUAEznxHF7m4+/zAhcs3a4l9s7CLTbKerIKOFQk1v0ZTBU+xTrFmi3BQWfOvWU8ePywhE6/w
	XOvx4tAr22vKgqH4UMaUdOM0SNZ0mU1nHLQoeBLGpE5Uive+PYb/ZvYgWc4z0JcOHYx8TuPjKQE
	WT3A61TOVD9rBmVX1ya648xTrzA1mQ0ag3iwPjGvJZNwfld6LHgYn7yGEOMecBVf/a392jVRdq3
	fojnFpqWnc4oV5sX8IlA6eq3bvKH769BbZmr4slW1LcFQZn0W4kzFQK+Sg4HA6onmOODn9U/N7v
	lFh+SUQmu0Z5fdneA9nxJFpm9YjA==
X-Received: by 2002:a05:7301:6405:b0:381:a3bb:f945 with SMTP id 5a478bee46e88-38570254ec3mr14795685eec.22.1795458536477;
        Mon, 23 Nov 2026 10:28:56 -0800 (PST)
X-Received: by 2002:a05:7301:6405:b0:381:a3bb:f945 with SMTP id 5a478bee46e88-38570254ec3mr14795656eec.22.1795458535965;
        Mon, 23 Nov 2026 10:28:55 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:55 -0800 (PST)
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
Subject: [PATCH v10 6/7] usb: misc: qcom_eud: add role-based EUD control
Date: Mon, 23 Nov 2026 10:28:46 -0800
Message-Id: <20261123182847.143892-7-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX/d5igdaOD96l
 wLBLRHiztQKIuHYy5SliIEqiHTT7yaojlAzBZRvjRsfrcceIDLcd9GtJGIhAW3jCqdlOyEY7S+X
 HkOeydJR1qmKceM5ex2CzuG0ErfEwh53ua6I4yoRA6CfW5l6QlwBh+AiLnLNVqEItB7Eb63E1Oc
 xzmMKd1RdhW7LHqrKAz0Moqmf7i1pI/kOUbPLw+G8Kz2DuHN0RcBJFx3TbHPh+Nu0bPidfV4KjQ
 uAoUxzPrwj9O/l/0/aIMTELb+LMUSNiy28RvGgQM6vtFcEWD3x22sTwxa3ERaUFIbS44jhTFH+V
 hFfvEkxSTG7vmXZDGyHTfNHw7vjTUVLCrDHy2mo2BKDOwDVNsuYPF6qkUGIMUYXEjnEPYia9Nfh
 DDA+DO0HIaNkxUZ1Cd2qFI/nG3a5qSb2ILWaw33YWUcW1HLbd3V3xJsmlscQnYMz9UUf17sy4iq
 pgbk4Mcja8zy/xDk35g==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0485e9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YKK-c5bBAu3nLoGgrlsA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: mDMaynPTqS8DqwttESBx2vOkUcwvdilU
X-Proofpoint-ORIG-GUID: mDMaynPTqS8DqwttESBx2vOkUcwvdilU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX6S7/97gpyHWA
 UZl/XaKW6zTcqbE5ua3thhimZpqxWAAFe12DMdto1YRu0YwiOpmCcmAcp8MF4kD9JHLKKHdqRnu
 HEWJGVRSDERt+k7csCpPISJZOAv8np0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

EUD functions by presenting itself as a USB device to the host PC and is
therefore only applicable when the port operates in device role. Keeping
EUD enabled in other roles provides no benefit and unnecessarily keeps
the associated PHY resources enabled. Furthermore, enabling EUD in host
role can cause the USB controller to misbehave because the EUD hub
supports only a single upstream-facing port.

Address this by treating EUD as usable only in device role. The
role-switch callback enables or disables EUD as the port enters or
leaves device role. A sysfs enable request made outside device role is
recorded and honored when the port subsequently switches to device role.
Additionally, synchronize EUD state management across different paths to
avoid races and maintain consistent hardware state.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 70 ++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 9f26231b6648..b434b0447613 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -15,6 +15,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/usb/role.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -57,6 +58,8 @@ struct eud_chip {
 	struct device			*dev;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
@@ -158,17 +161,33 @@ static ssize_t enable_store(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct eud_chip *chip = dev_get_drvdata(dev);
+	struct eud_path *path;
 	bool enable;
 	int ret;
 
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Skip operation if already in desired state */
 	if (chip->enabled == enable)
 		return count;
 
 	if (enable) {
+		path = chip->paths[chip->port_idx];
+
+		/*
+		 * If not yet in device role, honor the userspace request and defer
+		 * EUD enablement until the port transitions to device role in the
+		 * set_role callback.
+		 */
+		if (path->curr_role != USB_ROLE_DEVICE) {
+			dev_info(chip->dev, "Deferring EUD enable until port enters device mode\n");
+			chip->enabled = enable;
+			return count;
+		}
+
 		ret = enable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to enable eud\n");
@@ -206,6 +225,8 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Check if the corresponding path is available */
 	if (!chip->paths[port])
 		return -EOPNOTSUPP;
@@ -287,14 +308,18 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	struct eud_path *path;
 	int ret;
 
+	guard(mutex)(&chip->state_lock);
+
 	path = chip->paths[chip->port_idx];
 
-	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
-	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
-	if (ret)
-		dev_err(chip->dev, "failed to set role switch\n");
+	if (chip->enabled && path->curr_role == USB_ROLE_DEVICE) {
+		if (chip->usb_attached)
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
+		else
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		if (ret)
+			dev_err(chip->dev, "failed to set role switch\n");
+	}
 
 	/* set and clear vbus_int_clr[0] to clear interrupt */
 	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
@@ -306,7 +331,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct eud_path *path = usb_role_switch_get_drvdata(sw);
-	int ret;
+	struct eud_chip *chip = path->chip;
+	int ret = 0;
+
+	guard(mutex)(&chip->state_lock);
+
+	/*
+	 * EUD is usable only in device role. Power it down for every other
+	 * role to avoid keeping an unusable module 'ON'. chip->enabled
+	 * preserves user's sysfs configuration and is not modified across
+	 * role transitions.
+	 */
+	if (chip->enabled && path->num == chip->port_idx && role != path->curr_role) {
+		if (role == USB_ROLE_DEVICE)
+			ret = enable_eud(chip);
+		else if (path->curr_role == USB_ROLE_DEVICE)
+			ret = disable_eud(chip);
+
+		if (ret) {
+			dev_err(chip->dev, "failed to %s EUD for role %s: %d\n",
+				str_enable_disable(role == USB_ROLE_DEVICE),
+				usb_role_string(role), ret);
+			return ret;
+		}
+	}
 
 	/* curr_role tracks the role from EUD's point of view */
 	path->curr_role = role;
@@ -439,6 +487,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
@@ -485,8 +535,12 @@ static void eud_remove(struct platform_device *pdev)
 {
 	struct eud_chip *chip = platform_get_drvdata(pdev);
 
-	if (chip->enabled)
+	mutex_lock(&chip->state_lock);
+	if (chip->enabled) {
 		disable_eud(chip);
+		chip->enabled = false;
+	}
+	mutex_unlock(&chip->state_lock);
 
 	device_init_wakeup(&pdev->dev, false);
 	disable_irq_wake(chip->irq);
-- 
2.34.1

