Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702167;
	b=Dbb0Y4XVdc7mdpVH0Yy/n6qFJQH0y10xWKzI7x3eLwb856SIQnlPfFbGSxdTnakoRqth
	 i2X/VtqeEKIMdwTPJFjmUivPJo1nkXEF7I5Hxs3cXHVSAS0VVpXxi68EiSxPrgz6Htlh5
	 ZB7wSWSCM7393Y5TP9/8p6xaBfKjHwiYZ+1i3bPLb6p02piyWObiHjF7AispGGm+6uWhp
	 ekgybGp9vWwbqd2Ry97gj9ge13bCNSJI7J3JIA+OsLoJlLCj4pyIAlFrhE8rnuVBGWRnY
	 EZMD4Ae8k6BziWhUXWaJfEg7+Q3oGO3w3ZhX7UaKdNyuyxPNCqQAVFBmpFK1H+yr2aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yF0ZWdpj5Pv27R79H4400qc2xDr80hGmdAVzUXIJw4w=;
	b=upaOBU2lx19oJiiJugyMOAe3J0KUh8fpvjDcvYPYnKX4A9yGidcmmo8SVm+bSh2dIGHN
	 7Cr+Z1aoDeTqHq6h/i5AHW+BcRuNDJVyzKmtz17tzsS46iQGuCycYpn4FOYBA2/rwlgD5
	 7heHpq592IFxReXT+sJgfoQW3cd2jDBfzhqlZgj6AhTaOt6dSK9aKT/xqhTVUCpzocYOk
	 wKmRrFtbuDzHQ/szp0I9k/b2n7yhAR4aaGvqPjnTq53172tbJtCFL8XmqrbGAFk3W4F2D
	 AYUItoENOkSZjODCmX+YFXz2BzsCwSCK/glzSilZf4bIO+T7i3Ne8YdNwKcu1MIW3Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ec2W3F5R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJg9Gxm2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE326071533
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 10:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE326071533
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ec2W3F5R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJg9Gxm2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AA17l3130976
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 10:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yF0ZWdpj5Pv27R79H4400qc2xDr80hGmdAVzUXIJw4w=; b=Ec2W3F5RyrB1AN3+
	ezsFHivj/nmeOlonKuA10UKWUpVRGeqYisRkCVh0w767kEGA/V5CR4HXj4SSEkaM
	K6uLAc1I2SELy+HvSNhfDaRs5ru/BJuYcVeu+GQIco4HuMpSpGegnNAXYI33skF5
	78ZevwGfBpHwghw4ULbDtkf41/3UiQLqD5Ib323BsH4J0HsL9BmsAVyVfL9eqk02
	VFvrUMeOwZo8reIWbDNRV+vQanzrP9hPdKVFUCom4MzwHzm2RauH8fVziFcw2XrH
	Mlfkra2FLk88DMVMtxmpd/yxCWpvMwQofb+sq6UX2TI7uMh5c/QOg0IUadNWSpdd
	lniZxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cs97y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:36:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943e8ff02d0so355931085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 02:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702165; x=1794306965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yF0ZWdpj5Pv27R79H4400qc2xDr80hGmdAVzUXIJw4w=;
        b=YJg9Gxm2mDAVNcRkBZ7Gkj4YcfcdheZ6H8+24sU+ag+rcrawWZv6HYtS8BNS3tzMKY
         9A+fFEbF8qR5DF20Fa32OBkGG8LoWdtxq3zUfKXvlERcBjLmn8E3i0yXLUkTu7dCIu3C
         qAVToP0P5FH/Aul3KHLTv6ICCdkgBSP15Y9RdaugvTv6tigkG5yQJyLkLUgv9h4LQmhJ
         o7F3/cu1x714By73e5Ynu7UUOzVUU6vHm0qKqEE3+v6MRYiT8PQVPThwzF2D8aSrrtV+
         jHoNA/MY8nNVKdveWGCXG7P8+6QfJKkYGCzU0tEx6buSBjCHB76wuz75VJVIAsi+gyUr
         8/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702165; x=1794306965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yF0ZWdpj5Pv27R79H4400qc2xDr80hGmdAVzUXIJw4w=;
        b=Vfgu7951s88XBkdlMOODOFM+2KzQ8v7VSD68pT5BzpPbvhyzNZdmGD+ZNjE4foAxth
         fiFY4ZCFgFu/hGDKMfU48E+H0thnRZJqIlye2+BwSQR0EkpoMyfRF5GzrgHKV0Uj5uS2
         x3wNwp28qE0jrvVaCVLD2bfvP9nC9bokb1Eyo69Oc61V5gyCVWa7cUGgqC1+oyizyYcA
         c0dLtu0HmKMbitcVYytfny3XnNUq3uMPJ3cpF3ca//4fLuDj/BK2vl8RPe8ET00CERrd
         e6vnke9pet3QXjNGgTU2w9RGYTjztJd7tfoOM11StvDtMA4PTkG8Di8W9lmigARoehjX
         xx2Q==
X-Gm-Message-State: APuU4Z/a4vKq+WwDgd0wFUGsRNABzFYBY2a2YAfPOhHHHIpp9DJbrbHI
	x0NG+t/9FcMwE6I2mePKJpB+1I66xeyg/5p7HUzdg+qWfX0bJHRYiQjPGjzmJ0EAVn31Xo+PyTl
	8vzOptCVPneT2SswumGmcJLp1LScfmW8X1CoVDPTEjvtIXqpnH+EsShd5cCBTjIbbe73d
X-Gm-Gg: AYBFou2xOTQz7IKmC5KoeQUuK1aiqt58UEfLhcSajL0A5peIpLq1MEYo1Ek5UG/suWA
	7W/pO2ofb2tvIzwgytCvATEGxw5XlvUrkp5DHJ/oZ+c+jkuNKiyWHiCVOW5/5dLFJcbMZlqdXja
	6Co2D9Cr9LgsciSQZt4Qgzg1hI1BbB5eHZ0nEgKcSijp8mDI1ds9O0fqz8RVph8WfTk4NRDWNFj
	+F74GOZG2xTdc2w4O9RysI09CTURDwxIBi22Xb94MLni7hUwo2jOlul+5dghCWqrYIi0ZlNVqoI
	TaJT3yuA5Bkv5ESxQGs64cRJZ90HKr05M0wBYnJNNbykpSdg2N3UzJh6wzb4LKq3sS9b0AU587a
	NhEQfU7+ucye+CpO+OcyGgBUUNRxClem2KHKPF5XDZeKVRWgmqVdXsosXs2Ga6LW1mjOMiUYzOO
	6dKw==
X-Received: by 2002:a05:620a:261a:b0:93f:32c5:69b0 with SMTP id af79cd13be357-94421778129mr1966768985a.60.1793702165237;
        Tue, 03 Nov 2026 02:36:05 -0800 (PST)
X-Received: by 2002:a05:620a:261a:b0:93f:32c5:69b0 with SMTP id af79cd13be357-94421778129mr1966766685a.60.1793702164689;
        Tue, 03 Nov 2026 02:36:04 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm55210015e9.1.2026.11.03.02.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:36:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 11:35:53 +0100
Subject: [PATCH v18 2/2] phy: qcom: add the SGMII SerDes PHY driver for
 SCMI systems
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
Message-Id: <20261103-sa8255p-eth-phy-v18-2-b00cc2fa0404@oss.qualcomm.com>
References: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
In-Reply-To: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5486;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=61whbJ6roe6jnMO29YpKZScWJ7Pcy+oOdtoc98Zj+oM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6bkOCsrgGZK5hRB/SuHx+7t/Xl4LqOwWHcWqd
 vyTyiiDIUyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaum5DgAKCRAFnS7L/zaE
 w1PVD/0RMe5hYZbOrd8PyebzfNISPAVLFOoXfPpYKD1HPqGZVhlECZY5VIYAmxljdMEyVWB0/TL
 BU4gXFW5PjhjMM7ZUHVVPv41/BXTvrhR5/Hk3wYkT0heCA8s6vaoOIMdQGd2w8rq37dvxwy7fVH
 RZYvcEdGxJQXp7Jrcuc5MXoZ8nvGKlAyK2wYJ+eRb+7zHBt2yLhDLR28CJP5oXGsgavuNteQoPC
 hNeSbpoQy3gpwv6b30GEuUOsDz7C9TjQHYWlDlfH7tPxaqf+IdaxuEPI/7Aa+MtsmMZbRnTj8pB
 7CiG6NwUYg2X6w/Sq5YOQ4EL9tCDZfCnDqaeEb6Ve6hOvE0Nno9y+S6g4uQSIMxQwtBIJmk8gTA
 Amxjn8vlXdt74U1+FtoSZnv1r419c7rw/SKSJqGoohkDLXFvlsjpQJIhAcZ20L+uWQaTJhP7+JL
 cge2JWPpv1wYncX+i4MMvdQLIB1sE8bTLBM9f+WvzfRZam5BPIPkD3wGe6SSGxDw6I1+ONtVgK4
 ER2kZUHCa3aD9gOsp+Tru7WQhSKZYta1FAnsOHTVFoxZVVZJRP2wxWBaouZR2LV+9D9Wu4cvM+T
 GEExXhjP7LeKOLL8So7J5xuVGYw70y5F/nQbU9lRa0Rs6xDlb7nc4i1tL55g2P4xbRgJPBIc2Jj
 VIqc/UeVH8j5yOw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9b915 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hTw9fJJfFBl441PWpkgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 67X6y-DJ_ZcB3r_zPl17iwTAUwtXHkLh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX1HWWZ1zxcgOH
 CoYRW/xm7nvAWLWENCiG4H4WQPunC59hydeLBxcmV6R5f+ONEsIQlscZGD1C3VFL1uN0Yjb0DRz
 zWDyAw+vkG2tmTnWPRv+EM7m7F1tRqXSDhg3MWDbABijD+KgyzchrkTLBSc57Va3q0ibh1/qD+Y
 Zc1iPSUVQcvVmiZsE7LjhgFgHdzod/SGFBaknSpQxBlNZ8EZ5IxpfG+K9KVHDD780hqu3KJ7Az1
 7yE8xjstq5lXWHglBesVyAfeRCX8h1mC3c9lpAWEQSZQ2o5242lXpU7NXLP4rQr/iOX7B1L2Ir7
 slsFWUD50CZFAJdPvx8AO0Ysli3iIVlqR/ml8ifzptryMV95C99Z8hZr8hZ30gghAaIc+z4cZe/
 2+Vet0RHtOsWiX16H8wKbSs9Cq+1hhHxMZzD+pAlTDu1KH6izLxhDLxLmfc3c5xvo/PeLdpSsWE
 PFGLwqJicvwMfm4FNQQ==
X-Proofpoint-GUID: 67X6y-DJ_ZcB3r_zPl17iwTAUwtXHkLh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX7wzsKB31eyLh
 JV1ekQ+1W3c9X09CcoB8VB4gI9oDH72MzRujcsD8qeugyUyloIZC66lgrjYDR91CFt5IgbDXAa7
 c4849BVhU+gadZXhlZTGvlagKqxQZD0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030042

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code. The OPP table is added by
the SCMI DVFS perf power domain driver after being fetched from the
firmware.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  11 +++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 113 +++++++++++++++++++++++++
 3 files changed, 125 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 44a805361e35d..2486720b9ffc8 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -260,3 +260,14 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on PM_GENERIC_DOMAINS
+	depends on PM_OPP
+	select GENERIC_PHY
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 4b5e6640a6faa..41f192c9f4182 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -31,3 +31,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000..81bed5702bc17
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/device-id/of.h>
+#include <linux/ethtool.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct device *dev = phy->dev.parent;
+	unsigned int level;
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	level = (submode == PHY_INTERFACE_MODE_2500BASEX) ? SPEED_2500 : SPEED_1000;
+
+	return dev_pm_opp_set_level(dev, level);
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_drop_level(void *data)
+{
+	struct device *dev = data;
+
+	dev_pm_opp_set_opp(dev, NULL);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	ret = dev_pm_opp_get_opp_count(dev);
+	if (ret <= 0)
+		return dev_err_probe(dev, ret ?: -ENODEV,
+				     "no performance levels available\n");
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_drop_level, dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3

