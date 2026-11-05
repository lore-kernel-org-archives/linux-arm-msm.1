Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877108;
	b=hj7DGmKS8P0k+AokUy8PMX/7tLzw0kngsesu2N/I3Ry7ZYxMooJRrKxCXzxX2e18AdaS
	 IE+anF68KG8/QgmTQ1GyL2+xTU8x29kD32a+LxO/heQoRp0UFCMbyk+6e1P4y+C6sR2ws
	 V7ZQKvI0kyZqck6ZSd0/QnVjXnTcZYsiHZr9z1vCTolpjHr6vgTmpexjFPHsl3RYhj1v8
	 OweO03+zQbdoA3J2NUcpx24QdCY13+d3e8Q1FqnKXTclFYARtOk3w5k0+t9ntijv79wWh
	 cMw5nbkhiZ5bKQ3hDBaBY/mAdKIW5B+eShesxUjsrDhGf3dOaefnDt+29RwO/wIiFmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UJTC+JRerMEIZGzXVfFC7iK2/khV6wuxurfu9NdaoBM=;
	b=EUf7UpB3j9HTk+Em7Jr5kn7/u4oxAsYZ2hrppT+TqW+nHLslelLLseMhl6yNI7SzLwED
	 N0+d7g02ERoGZgTS5V/OM6o8lTIYbWzshSyee62znmS1J90Bp7uQ1hQnPoN3XP5+zm3aO
	 LZWzEqLeIaOsoBkIcc6aWkiW58ypdrVYBKbQxllQM6edLuysjRCY9U6dCNgwx7aj8ymgc
	 4GAGrkujMi16cTUg475WRU+ZQn92OmLAMg+KerYzYxdmtbzSqyuc5WIEHEVs+nISTB4Uz
	 JRuey777R86KJHo+eSkIvkovFDkKywXJ+1efQHK2YF5K7Pcz1hyQZTNDUyEtAPd6G3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZr29nzc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONQ1ZZqU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDDF606A32F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BDDF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZr29nzc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONQ1ZZqU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tPki4084523
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 11:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJTC+JRerMEIZGzXVfFC7iK2/khV6wuxurfu9NdaoBM=; b=eZr29nzcoT3z6mpf
	zhDMrvmVUqwoxpzFHPn5DktkN7WZ1zjW153rBjPT++nUiPe2vU5AUMIKrK5+z7Dx
	JSVtjPFtS4yBmCdNGmtzBzG0irfNE6DZacQa+qW3M/OPzm7D7s2+LO34J8dKUzZt
	aFUHowR04eKYq/xVka9Mp4FlmRZGl0Fr8SJMXt8ged3QgJWNXOn451vfmuBpcilC
	4cB+pGFkRacC59m1eCIizsh80K1jIGPpmFXYxWsc/lRyRPeFBs1jD5qnwoKx1AsD
	fF9JSde0xNAkfZGjMfe0TdbjFpDtbgXHm7Kwmyj0HxFhCYnBauRUGXRldUzNu7wS
	l49j+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr9y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 11:11:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so218392785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 03:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877107; x=1794481907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJTC+JRerMEIZGzXVfFC7iK2/khV6wuxurfu9NdaoBM=;
        b=ONQ1ZZqUCHXD58u04cTB5vCbjYwqLsYVI3p5NGzyOhmiccdfRQF7h8fMAFDmhiQLL2
         GoS1i3yppEnLt1roua17e/sgpTYJ6a/LW1FQ1kJTQ7O1FhwpOsiRgHSEOvDM9J+sW/ZR
         DiV5LqUmzMOhnMlGeOWOMlXoJAjgCov0Lm7LtBQieSlptLoJj5lGmwkM0MNynodd8+Iq
         +sI5sHuNK0AgNS9vfsy+DN7vfmTRC6ZSFAhnGCmS93oplaBQpbZaJwheUno3gwrGcwGv
         xpNM5yQWlF3IGn0O5X5TI+T0G7d9TgAAz0NfdnWXPdd0KbU/EtQ09Ufx5gXIJu49L8ij
         RTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877107; x=1794481907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJTC+JRerMEIZGzXVfFC7iK2/khV6wuxurfu9NdaoBM=;
        b=aukiPS2p+QUs7X4IeYoh43NNyw4FU9HfxgeHqAmeoks4hsE7BeHjEvSGxqZ+UUqprh
         jekdCG40JPa6qpIX2mWmAq+81efeHCyJbTs+gJ0yjOOLcOMRVBrKRhHO+wgvJjAGqAAM
         /0YpmG7XvbUtN+XiCPIMIFqCMBfLJEyFMTcr7DmxRsgTkiXzaIxwxvjJIF/TjW6TQoLr
         J15eqxacJNYVY58YcYv2WMTwx1ivqF1fZQ7dM7bBNJr7XOkWJACoZPYxo9o/brGvbMRs
         45fm0ZdFO+Og3QjOk3nmurKbCwAhAzyIdQIucs4fPENxj7tpKwuguwcWqDMdFhneAaw7
         cVEg==
X-Forwarded-Encrypted: i=1; AKwUvBzbVZsAEYoauxn4GQdN/ixuPAXVhYUbrfi/HnOW80yE5XwAWiGzpSiTfd03DexvmbdUtHmEiafPuAU/GQmN@vger.kernel.org
X-Gm-Message-State: APuU4Z9L1I7A8MWms9kTMgpElWnJpqP6q27Ujzo0cotxYIII5EGIgF5S
	McJ1lj4n4NgENL3jwWUMeeimWYJbZkUaV+2cAPZhOMRsnQqm8XVqhkOEPQ5FHHbOqV4a4MEj4eL
	lITE6GllrTe5095NT0z8GTyVu15Nwo0GBFBA6mMj8CSIPj/z00/6x931W2KcLIqPo3LiP
X-Gm-Gg: AYBFou1/6cImgjHpX11urfbKNjHnXHJmNhf0332Ud6+nrg06xt8aTqROraUd1oRdyWI
	nFk10uEuVswh2jQAuK3jDDe/mQaW32Eak5MhWt5Me7V8dHGa0/3/2YMdyHcOr6oWm97baw45oHE
	QsWVLHI1Ox2wTRzdvRp3Xb4srbjgDWj2y3laUPlBmyczTKpJSdTeeN2M4WRCp5S18YvnjTr7KIE
	C9t/3Z2s3tkDyary/5ssFi/GWPSdZxoL+4MTJAAFTuIynfFKBMT35QF5q/h/WxYVYj+vTN8Kr02
	FhlZiS77pCmR7UK9vt5+ZxhrIOs6ZfXRIYw5H5cn9fDxJtjE109B1YPqr1Gu8kgsgZ5LczDKDj/
	wDtgAWkZCR38fEFSAU1GqT5rq9QYzZX/wyqbBVz02CktDjoyZLO3XFA84cy2XOKLNY22rhbnBsO
	BAI8tdC4ywAvEpCD3t8eYLXZU8v5OrHk/O10rnSwSw
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr3044613585a.56.1793877106601;
        Thu, 05 Nov 2026 03:11:46 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr3044608385a.56.1793877105968;
        Thu, 05 Nov 2026 03:11:45 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:45 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 19:11:01 +0800
Subject: [PATCH RFC 3/3] i2c: qcom-cci: Support the CCU output mux
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
Message-Id: <20261105-ccu-v1-3-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
In-Reply-To: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=4082;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=0Fgpwz3SQDHyUhRlUEIFbbEDDaZfQdLbmmNOfyqJ+NI=;
 b=YEvUVTUPuMY1/we+4fCKvKq9lfIf2BdKLFRArkIbb6oKdgc5OVq5MkqizBFK1UnH3T87uagqR
 JQw75XFP5BED152z8NXXnVxhKstgxmfbx2tdKQFMaeDvyOcEgz2SRx2
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfXyR5MEiuc0Nq0
 +IlqS4XX0Uy8aXK7KTpOVJuxnlI5L6Uy9FgVvEaGY+2NmbhPVZNsu5fZuhfQOISSJAX/OayJLN2
 /pef0+8wJm666vGgRpVTzzrO1hMcZde6j2sVYIdv7K9NFQvETnB52mNNpj/W0zT6xzHWVEA0ec/
 TiTv6g0gbtPV72bbccT/b7uHh9v5XzbR+cJv5lGZ19gixE+DLXvxoTHfUQN5+vAjlvHEJ/95XGY
 MIYRr55qOuLId/AgQfifZWNZF5Jg/7WrnA8Q0n7kSCYT31wrQ1Kz7F+eb2Uca3L8Y3WfrWCbZWu
 Q7YBqZ8JzvUn1IQTZrlPmGGVaol1TLlJiskyIl1hecIcBNfoFjA6Kw1Gs8ScwsX8wQLIyJDQMZk
 THt7vmMdiApYdUNQ3vEgdvzMGOG01KQVUX0+BiWm6wf56RkaZRDb4UzMSEaHx9ur5X//6hZ7f6s
 Gjdbaa7pMcPF2Py+5aA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX9WWjqMNFKS/I
 x/wVTZaNgt5ovKwptoTCX64W1NsXXzSaY12z4h0pY+ZpEDPfGgiIsojw0wg097BuzkEmQGVUB4K
 EIE3gRCrx0qWsK3OwCVstTjIgW9sCV4=
X-Proofpoint-ORIG-GUID: wKxXjAYq5X_h4tzN_XGCL0cu0n2IEy-D
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec6473 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mtkgQ_vjiMZ5qraaaqMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wKxXjAYq5X_h4tzN_XGCL0cu0n2IEy-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050044

On SoCs such as Nord, the CCIs are wrapped by a CCU. After reset, the
CCI I2C ports are routed to the CCU, and the CCU output mux must select
the CCI before any transfer can take place.

Get the mux register and bits from the optional qcom,ccu-mux-sel syscon
reference and select the CCI at probe and runtime resume, right after
enabling the CCI clocks and before the CCI is reset or configured, as
the mux register is not retained across power collapse.

The mux register is accessible only with the camera subsystem top power
domain and AHB clock enabled, both of which are CCI resources. The
syscon regmap serializes the accesses from multiple CCI instances.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/i2c/busses/Kconfig        |  1 +
 drivers/i2c/busses/i2c-qcom-cci.c | 42 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 275aaa7f35833f0b07ae13e88def21c3fbc6c787..63ba7314ee7c7cc57115e267a006cd058fe3e305 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1061,6 +1061,7 @@ config I2C_PXA_SLAVE
 config I2C_QCOM_CCI
 	tristate "Qualcomm Camera Control Interface"
 	depends on ARCH_QCOM || COMPILE_TEST
+	select MFD_SYSCON
 	select PM_OPP
 	help
 	  If you say yes to this option, support will be included for the
diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 76a5dedf659fb8396ca5df188143469977526505..0e2190cf3300b7da727fc798a1440f30fa73e28d 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -7,11 +7,13 @@
 #include <linux/i2c.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_opp.h>
+#include <linux/regmap.h>
 
 #define CCI_HW_VERSION				0x0
 #define CCI_RESET_CMD				0x004
@@ -137,9 +139,26 @@ struct cci {
 	struct clk_bulk_data *clocks;
 	int nclocks;
 	struct clk *cci_clk;
+	/* Optional CCU output mux, routing the I2C ports to the CCI */
+	struct regmap *ccu_mux;
+	u32 ccu_mux_reg;
+	u32 ccu_mux_mask;
 	struct cci_master master[NUM_MASTERS];
 };
 
+/*
+ * Hand the I2C ports over to the CCI. This has to be done with the CCI
+ * clocks enabled, which the mux register access needs, and before the CCI
+ * is reset or configured.
+ */
+static int cci_ccu_mux_select(struct cci *cci)
+{
+	if (!cci->ccu_mux)
+		return 0;
+
+	return regmap_set_bits(cci->ccu_mux, cci->ccu_mux_reg, cci->ccu_mux_mask);
+}
+
 static irqreturn_t cci_isr(int irq, void *dev)
 {
 	struct cci *cci = dev;
@@ -651,6 +670,12 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = cci_ccu_mux_select(cci);
+	if (ret) {
+		cci_disable_clocks(cci);
+		return ret;
+	}
+
 	return cci_init(cci);
 }
 
@@ -668,6 +693,7 @@ static int cci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct resource *r;
+	u32 mux_args[2];
 	struct cci *cci;
 	int ret, i;
 	u32 val;
@@ -730,6 +756,18 @@ static int cci_probe(struct platform_device *pdev)
 	if (IS_ERR(cci->base))
 		return PTR_ERR(cci->base);
 
+	cci->ccu_mux = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,ccu-mux-sel",
+							    2, mux_args);
+	if (IS_ERR(cci->ccu_mux)) {
+		ret = PTR_ERR(cci->ccu_mux);
+		if (ret != -ENOENT)
+			return dev_err_probe(dev, ret, "failed to get CCU mux\n");
+		cci->ccu_mux = NULL;
+	} else {
+		cci->ccu_mux_reg = mux_args[0];
+		cci->ccu_mux_mask = mux_args[1];
+	}
+
 	/* Clocks */
 
 	ret = devm_clk_bulk_get_all(dev, &cci->clocks);
@@ -761,6 +799,10 @@ static int cci_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = cci_ccu_mux_select(cci);
+	if (ret)
+		goto disable_clocks;
+
 	/* Interrupt */
 
 	ret = platform_get_irq(pdev, 0);

-- 
2.34.1

