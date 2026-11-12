Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478563;
	b=fy8fTbjs2XZofRReCpIV+4NIB4ZGss4csHo4iJyLvjXHVyUjBGzt5ixZvfLfoi+3jopF
	 +4rVla8q5BwMkP0K6TX45JhtZd9zeTajG6qOBiL3zqLq6+Jz6kUvY+zxjLhl4AkaKwTmm
	 qiqsmbjMf1txYXd6R27MsnXRiwvjki+5jo094hUDnPYefrusidxR6L9sqfRQzf71Ndbc8
	 djccqmC5wj7UUiO00KD7c32ICqbbZeO2qeZ209zcZNLAyScadewBDIvf31+lwtywvX0Dz
	 hXc7+LXca8LXzZs844N99VBx/O9+R8+oWiysg2O1kSAH2CKKf6syX8c/ryozRYRJo4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478563;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hnpC1o4w+tOv95d2csXSbIs144vrlpYd+10v5+15MJM=;
	b=3g50p3Ji0XAnTrOzvu531Zxuew7/lHvjZhsAbL1VWnk8PRNWIMwaBcN28RYECeN9IxUG
	 PBUIUjyK0pa2R7B+jrJkAYtCyxg2EwjiXRDxrv4rJub+4xzLa+7HD5qf/K7AyND6ygulg
	 HNY84HmjPStzkV1dVXMqSBbp1O/urPXMw3a9aRBFTxKZ3BpihShziIL0V2D0WgDXPUsfY
	 acb+lDsCZGbmmbbW4GlUXatmsNAPeKvmZH6IMSu0trLHm0swH29z3rCdTo9l5u/j1TSI5
	 kprMN7lNfNLp9JblMFLHYoEeVWeJlDwxYO2IARt8mZu++t8xujY6IwDiKsnT9gdMzhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZ2jUCMi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0ZBCHmk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC69606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC69606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZ2jUCMi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0ZBCHmk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC92rYp1475435
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnpC1o4w+tOv95d2csXSbIs144vrlpYd+10v5+15MJM=; b=NZ2jUCMiHpSqqMx6
	zlYsMBe4yryxiEmUOxgaAidd6FJWGTieuc+L6GVydo8BBcAeKKXxYhxiphp2qxCC
	ZT5aSfLUQyEgqOa+FxU+37WESK87eivItemtJu4bGeHh2XXVAYkq+84HFcHW0lJV
	CTRnxlhQN5puNUYN5R4rSoWhqTAy5VN+l/Fl20PdyPltEv73uGxLZO9WZhksqh/w
	DXBcToxupO4ZqTooLp4cjUHzw/HLipafsP2QW+fycch2FFdH0CMtDRqEOontvkKz
	0YT+rOW+BpcHl3F579u4UOTtjDZKM6oJCjRm1Wjbp0oM+K0VBKlbjQvHA4HteyMJ
	XWJW7w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymuvkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:16:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b69d1f2a18so638333b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478561; x=1795083361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnpC1o4w+tOv95d2csXSbIs144vrlpYd+10v5+15MJM=;
        b=H0ZBCHmk0/QxuIvjkpXsOa804Mt4sCI1hqAJP18TbTFIyNg3PJzG6KzJmK4tANRggo
         VXH0f1UBaGEmvDxTGsASzIVMCeH8Etc0y1iNSpDlG5IxTNtLUuldVtXGhYDQ0ul0L1o8
         PVomst+bumxNtbAsOlstB8WB6X6Ha8Zgz0OVUthhmIQKKlsfgyRdLtBJ6o3TPz/+187m
         tmJHzGigDwdwNM/IUAcV4VY2E6Fit3cwletbjCM6Ct6tc1bvSiuCAhlrnMNG5vBf6az5
         R2H7NvN82lKsf2vaXeXp+Y9Uj9m8hKir/Zfx6pi0nxuEOeZRxVHp/UE6q4C0tuqc1Iqw
         sKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478561; x=1795083361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnpC1o4w+tOv95d2csXSbIs144vrlpYd+10v5+15MJM=;
        b=GwHdYLaLKJ8omvHTFfCq9231SqlgwsVCiaVbVNOA0FhVhlQafPPPdLOp/f7QJN3yy+
         dwNr0Ut4yVKh+6BV+SMFakRexX4JE4KFVoFJlp48BLCU9iu//yiTeITN/EJ9/IF5nT1E
         28YXdmh0gY4rbjUwavIlQUbpxq8nAA8ic+WarLGhtP5wujhppN0hanVa5wX/EIlmqCkg
         ecNPqyahCubAy419h/h4RMyEvoi1ccxHu7vBP90MCor+vpMT2t5W+ZrytHX0wuqNXReH
         A8Ij7l5BcdrPfTfe9q8TDSTrq0Iiu1W33ZByau1kD/V8d9Zvcryf1LnU3RnX5raVf4IW
         eKew==
X-Forwarded-Encrypted: i=1; AL+hErH5Nkb312Nmw5Nq9vIANWDLvVuj44t8aoP47a/RytEwI/b6DjO7qcTah0heNGq+ICIJ5D6GMXkx/b8vnzwl@vger.kernel.org
X-Gm-Message-State: APuU4Z/qvRSXWbIt06G2AGpBsFnWgUMpqq8AghR//LO1D0VoXIhdbgmg
	bsLRvyYNqFAhxIlYouXc+rtCzNDtXqLXbTGsnxg07kpSbWOW0AvRNBQp1YvndtOPtpEKry+7RtP
	WZCjQOMd6/Bilw0eGnejgpW6JOsGAgQBJJLxyKZEYEz0/HxdHjwAHFviPpcbSTuyF9FX5
X-Gm-Gg: AYBFou29AWMzKW4aY4P5mamfjjTo+DPrDuV4LejPbdEu9xk35grIXbfMcWT9ciOwc1z
	wUoHVVweF0cQB5qTAFfmoBJ0ybHu86jRqwBmkARvWvhTgHPl7T9p3cHDgQF4zo2uwkKpaiRf0b1
	pEzixKTY9uy9ogHjNTU2lhbf2vAeSOEUKS1uj/COlZ0+M+kAKcd3uDX+U2V0EDnwGtc/Q7JkNYH
	dergv+TVt5HLnrQqNAz2X6n9yuBH5pNkGFqyAMyAEDSrCbjUfa2X6k+iJaO5stHqPELUum2Y9jK
	bS146YhGjRuoHSbnUGk45TLGfdkfZ2RB9q1N6h8CoZGXYvHl+PjkF026ewoSC7U2SaZQKXuyi3o
	6q1hlaHdezS7FxPySntt7v2Jay3SfgjBmwRgXdMNElRcnFQg+Vk/FDEB3v6XTeNT//NZkk2SBAy
	O9
X-Received: by 2002:a05:6a00:10c9:b0:886:490b:f1d2 with SMTP id d2e1a72fcca58-8bd5d258143mr1421618b3a.23.1794478561023;
        Thu, 12 Nov 2026 02:16:01 -0800 (PST)
X-Received: by 2002:a05:6a00:10c9:b0:886:490b:f1d2 with SMTP id d2e1a72fcca58-8bd5d258143mr1421596b3a.23.1794478560481;
        Thu, 12 Nov 2026 02:16:00 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:16:00 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:45:35 +0530
Subject: [PATCH 2/4] drm/bridge: Add a driver for the Parade PS195
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
Message-Id: <20261112-mahua-hdmi-v1-2-b463d7b1dd7e@oss.qualcomm.com>
References: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
In-Reply-To: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=8398;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Ev1YoXF6RmFg1bXBqI4pX+IenS+MD6ysl7ouGSoK85M=;
 b=bKmVS912mH3Zn5le0h7vNkNM7Ei1aVg0ZHVin3dKBPU6VFYoYmw4pUVNvFhRRTsjZhnZ79H8o
 LtwTg4KW2UZA9PJ+ZxjrUNYa2tFjqVWPo7YMWv/KS8qu3VDxDjYc/Qq
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: icnoxi1B74XVtyTNtFpUo1FUP3xJP9k1
X-Proofpoint-ORIG-GUID: icnoxi1B74XVtyTNtFpUo1FUP3xJP9k1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX0gO1RDBnOVye
 P6rROwXQL7vZ8PNSCMMsh3mcc4C2p8CaO4TEgKsMXv6xcr8PN207FltjMxx7xkwXxJYWpsAv9cx
 Ukk3/wspCEn7SbnvBEp019i0wacuD0pZGg81C59ZVmJjdfoIAAz6EUJ/ZOD87Vs6q4CxTxnjk69
 dOJxAVKO6AMy3pE+IcVVIAIqJ/TViAemRaJGTTfkfDtTDo4vLCTUrRL2YlRTV74DmCV0WJS9WDg
 25KjKL9UzNF5Zst0jcD49aLydLxiE5CFNF7v6p8EMe29b3Prb0AJXSbaglmCe3lk99vxdVnhtPj
 kHpN5MQBYN6UJ9k2elK6Z/JRTYEkujHFrnq/f/I6CdMg9GfakeexHJ3JLc6gewNWM6mTUDz9eNQ
 ELI0EP+W4tvqDns/jZiyMx2PSlVVBPMbRFnFhY90c1mW2Y7Dd/DjMvSoAJfI2JHT2thsPt8wtyQ
 RK/1D7ms+WYQ8zwlxhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX4nJ4pNVWqVVY
 cNeiEEGshh0X9d1BRoUZkHju4bryYVjdCK8oAGdRS6PBwLGk4mqkUoeW+3LCqE7cVSDGp4B9upp
 0/ZK+JO+Gpx75SUdOuydLvK4qHywuiA=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af591e2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8 a=_PMkZo2J1_9kd9osg98A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

The Parade PS195 is a DisplayPort to HDMI converter that runs firmware
from external SPI flash. Add a platform bridge driver to sequence its
power supplies and optional reset GPIO.

Keep the bridge powered for AUX and HPD handling between modesets. Use
late suspend and early resume to order power transitions around the
display controller.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 MAINTAINERS                           |   1 +
 drivers/gpu/drm/bridge/Kconfig        |  10 ++
 drivers/gpu/drm/bridge/Makefile       |   1 +
 drivers/gpu/drm/bridge/parade-ps195.c | 197 ++++++++++++++++++++++++++++++++++
 4 files changed, 209 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e1db88ec1c9..cd83b47d9f85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8586,6 +8586,7 @@ M:	Mahadevan P <mahadevan.p@oss.qualcomm.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
+F:	drivers/gpu/drm/bridge/parade-ps195.c
 
 DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
 R:	Douglas Anderson <dianders@chromium.org>
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c7da6b02d7b6..abb1aa36ce3d 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -273,6 +273,16 @@ config DRM_OF_DISPLAY_MODE_BRIDGE
 	  It exists for compatibility with legacy display mode parsing, in order
 	  to conform to the panel-bridge framework.
 
+config DRM_PARADE_PS195
+	tristate "Parade PS195 DisplayPort to HDMI converter"
+	depends on OF && REGULATOR
+	select DRM_KMS_HELPER
+	help
+	  Enable support for the Parade PS195 DisplayPort to HDMI converter.
+	  Its firmware handles the display protocol; this driver controls
+	  the power supplies and reset input.
+	  When built as a module, the module is called parade-ps195.
+
 config DRM_PARADE_PS8622
 	tristate "Parade eDP/LVDS bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 15cc821d85b7..425722c7becb 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v
 obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) += microchip-lvds.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_OF_DISPLAY_MODE_BRIDGE) += of-display-mode-bridge.o
+obj-$(CONFIG_DRM_PARADE_PS195) += parade-ps195.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
 obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
 obj-$(CONFIG_DRM_SAMSUNG_DSIM) += samsung-dsim.o
diff --git a/drivers/gpu/drm/bridge/parade-ps195.c b/drivers/gpu/drm/bridge/parade-ps195.c
new file mode 100644
index 000000000000..beddb23c38ae
--- /dev/null
+++ b/drivers/gpu/drm/bridge/parade-ps195.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Parade PS195 DisplayPort to HDMI protocol converter
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+
+/* Enable the supplies in this order and disable them in reverse. */
+static const char * const ps195_supply_names[] = {
+	"vdd09",
+	"vdd12",
+	"vdd33",
+};
+
+struct ps195 {
+	struct drm_bridge bridge;
+	struct device *dev;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ps195_supply_names)];
+	struct gpio_desc *reset_gpio;
+	bool powered;
+};
+
+static void ps195_disable_supplies(struct ps195 *ps195, unsigned int count)
+{
+	int ret;
+
+	while (count) {
+		count--;
+		ret = regulator_disable(ps195->supplies[count].consumer);
+		if (ret)
+			dev_err(ps195->dev, "Failed to disable %s: %d\n",
+				ps195->supplies[count].supply, ret);
+
+		/* Allow discharge before disabling the next rail. */
+		if (count)
+			usleep_range(1000, 2000);
+	}
+}
+
+static void ps195_power_off(struct ps195 *ps195)
+{
+	if (!ps195->powered)
+		return;
+
+	gpiod_set_value_cansleep(ps195->reset_gpio, 1);
+	ps195_disable_supplies(ps195, ARRAY_SIZE(ps195->supplies));
+	ps195->powered = false;
+}
+
+static int ps195_power_on(struct ps195 *ps195)
+{
+	unsigned int i;
+	int ret;
+
+	if (ps195->powered)
+		return 0;
+
+	gpiod_set_value_cansleep(ps195->reset_gpio, 1);
+	for (i = 0; i < ARRAY_SIZE(ps195->supplies); i++) {
+		ret = regulator_enable(ps195->supplies[i].consumer);
+		if (ret) {
+			dev_err(ps195->dev, "Failed to enable %s: %d\n",
+				ps195->supplies[i].supply, ret);
+			goto err_disable;
+		}
+
+		/* Allow the rail to settle before continuing. */
+		usleep_range(2000, 3000);
+	}
+
+	gpiod_set_value_cansleep(ps195->reset_gpio, 0);
+	ps195->powered = true;
+
+	return 0;
+
+err_disable:
+	ps195_disable_supplies(ps195, i);
+	return ret;
+}
+
+static void ps195_power_off_action(void *data)
+{
+	ps195_power_off(data);
+}
+
+static int ps195_suspend(struct device *dev)
+{
+	ps195_power_off(dev_get_drvdata(dev));
+	return 0;
+}
+
+static int ps195_resume(struct device *dev)
+{
+	return ps195_power_on(dev_get_drvdata(dev));
+}
+
+static const struct dev_pm_ops ps195_pm_ops = {
+	/* Keep AUX and HPD available until the display controller suspends. */
+	LATE_SYSTEM_SLEEP_PM_OPS(ps195_suspend, ps195_resume)
+};
+
+static int ps195_bridge_attach(struct drm_bridge *bridge,
+			       struct drm_encoder *encoder,
+			       enum drm_bridge_attach_flags flags)
+{
+	return drm_bridge_attach(encoder, bridge->next_bridge, bridge, flags);
+}
+
+static const struct drm_bridge_funcs ps195_bridge_funcs = {
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.attach = ps195_bridge_attach,
+};
+
+static int ps195_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ps195 *ps195;
+	unsigned int i;
+	int ret;
+
+	ps195 = devm_drm_bridge_alloc(dev, struct ps195, bridge,
+				      &ps195_bridge_funcs);
+	if (IS_ERR(ps195))
+		return PTR_ERR(ps195);
+
+	ps195->dev = dev;
+	platform_set_drvdata(pdev, ps195);
+
+	ps195->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, -1);
+	if (IS_ERR(ps195->bridge.next_bridge))
+		return dev_err_probe(dev, PTR_ERR(ps195->bridge.next_bridge),
+				     "Failed to get output bridge\n");
+
+	for (i = 0; i < ARRAY_SIZE(ps195->supplies); i++)
+		ps195->supplies[i].supply = ps195_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ps195->supplies),
+				      ps195->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get supplies\n");
+
+	ps195->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ps195->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ps195->reset_gpio),
+				     "Failed to get reset GPIO\n");
+
+	ret = devm_add_action_or_reset(dev, ps195_power_off_action, ps195);
+	if (ret)
+		return ret;
+
+	/*
+	 * Firmware drives DP HPD and services AUX, including EDID reads,
+	 * before a modeset. Keep the bridge powered while the system is
+	 * awake, including when no monitor is connected.
+	 */
+	ret = ps195_power_on(ps195);
+	if (ret)
+		return ret;
+
+	ps195->bridge.of_node = dev->of_node;
+	ps195->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+
+	return devm_drm_bridge_add(dev, &ps195->bridge);
+}
+
+static const struct of_device_id ps195_of_match[] = {
+	{ .compatible = "parade,ps195" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ps195_of_match);
+
+static struct platform_driver ps195_driver = {
+	.probe = ps195_probe,
+	.driver = {
+		.name = "parade-ps195",
+		.of_match_table = ps195_of_match,
+		.pm = pm_sleep_ptr(&ps195_pm_ops),
+	},
+};
+module_platform_driver(ps195_driver);
+
+MODULE_AUTHOR("Mahadevan P <mahadevan.p@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Parade PS195 DisplayPort to HDMI bridge driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

