Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC516471274
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925955; cv=none; b=taob2h9mEpoqNleqRhgCl/i0elfiGpCeLKuEe8ze9Mr2fBSQ+jMPviNA/f1/WXPXdKB9W738Xm64KmAiPxjgOSXTB32dqXPP2OMmuAx8xbUyYoFJwaWKLArXpbwOrTt3Tg/j6fg1YzCYfB1gbOZKinMscxZNXrporBaseJ054sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925955; c=relaxed/simple;
	bh=EeF16pi+mi4MrG3xCJYn6dBjUeEQOGKe1hJEvO4CInQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGlxs6WkHizwBgokv4BkLQM5wRXVv/dYHsVaPTNoCVcW8SQ7tZY5JkbrfnyZSFBv7A2wFdvP3IpibRpuR66BcWxtOzRVIXM0jgE/qJrMR3LPJjvZBlJEqtVPG0D4LQlwvO53nRoaUHhd75VF6ML+qS1SFbxK7GxIZr+8dSSOr3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YFHpzKka; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0vGeoGU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YFHpzKka";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0vGeoGU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkict2058950
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmhrDxNyOpm5dxVHj/pvCHweAzjQ2d9SkvFDyUOoirE=; b=YFHpzKkaa3E8/9Pd
	mvvYDEvqlbhpLB/BaQB/3R4yvBsh4LF4PUxZ1UIuByxU1PLrT84D/obeYM8a9pVY
	AfGIHasA20nGKMRCiV0+DRrJ7nsv0rCB42XgHFih211cb4kRyvzz3VjrrqpTGU9h
	++rwQy5cOq6+UH4pV/6ngSZ9YN1Np5cCGuCE27P+g+Cni04VeU4i7/VCc69LXDVX
	qadgZcf8RGDdv1caZOsomM9vmk6grFWltVNdWL9Lki3f1kfe24AbWF8kU1QiOatq
	QFrFL0qLaqMWPjNTZxSRQSyjOWEntUvK3czUFhjuoadJyNYikFNywWxqzvxn2zcf
	WeQ6XA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9ra0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso9557241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925946; x=1788530746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rmhrDxNyOpm5dxVHj/pvCHweAzjQ2d9SkvFDyUOoirE=;
        b=C0vGeoGUTuAP2CqKAuhl9qC/xvYAM+k/cvl/O2hhSGFDNONhkGaDx3HHkHpKLQS+UC
         uuA7xHy3BKzmmkA/yOrKHIhj3GxOFzcdwjQkTtHmZYG6SOkhZ/tdIH/jgBPR9yr2h8Fo
         CGNLD1fE/c+/na1fwQjiwzxD20sYh6jnutxaSzeUVVBaG8f6/PMeI0IHE+koe7gEzip+
         gIvZMVSe+ZKEc9NkG3z/U5xP23LIpv9HUMiyxhn92ygAiI7IG3aNKF5RlW/A6EJ/AwMm
         zz2Gof4JXUb25qjooctpL7cCGQ6KojKUzPzXGcUh2wtzB6cL03+79J5eLRCIDQ9FbD+W
         D7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925946; x=1788530746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmhrDxNyOpm5dxVHj/pvCHweAzjQ2d9SkvFDyUOoirE=;
        b=IAkBXUgPDT/tvK2Y84SvUWWQFMFn8yapMZIOdxaZENUIlU1r0m+Y2aBFRNDq2Ou0iZ
         XgWCZw002m3a1VowLpChB8xBlMHgtGC0NTH4/hlYEAlPgYVZwAVMD/w5aO4FWcu56j3k
         P2ikXIwGdmHQEkpmOx6VMLvEtTWWFge1/5ulJBcjXHLGmfuqrYNFaQYj6Lbeekd4jS2B
         3134/TkkyH/FGPGUdnT5EPxY3jDceCq1tswEqHlFrExe9btHkcxaaXij33fufQTG9VEH
         HkBBf+oY7/fVgcKEBRVV4MmiQ24GZ8w0HHn0GBy2cSmVm1Kr+M5bKvK+LUqaeBI/YHWN
         AUuA==
X-Gm-Message-State: AFuF++lg+1Itm6Rn6lCxnShctuMY9gYlCIF11Glo6+q6983S3ruUIQFS
	AgXWZD/bwMeGxNJ9jemf49T3UhPSU3ScIYjVymbO7wnmRcNSRSD9E28S47wuUoiq2qws8rrmvNo
	MsXZuOEowTOSWdhl2lqp+ZNxg4B6h7YEKjMcUnexQxWC3RMyaOYE3PD/cF9ZQnqYogG1I
X-Gm-Gg: AR+sD1146sEeKzJ1shiSErHaP01CumMAhJpRr+gCtMa/t1kAOyodxm/5C4YWEWQeTB6
	hHwgxQ92Lm9M4HsBuf+IZuFy+4PFUd3fX+Z2am8Rl3kp2j0Wu5CNRn7A5JffYo4t2/0laDHSE++
	aY4F24ZvMegliZGlt7ZwBVutQs9RFBuvNpaQnAyoGziXJ6beYgoqtbmnCEsw46HRHaHvvYIFaqx
	3fguXN+/jlEgnOjaLYuVypUHfdtxS0BuP4WEnlcXDBIz0GFmStsKG/FIVdm2DmFJq34Cz7IH9+C
	kFN2teT/nSxqTA2y/UjN0ZfQOmziRwbAQtyOqYjiQ3HmrcrQ7Q7/F5WN5Lch4HV00ZaX1DsKWxc
	2KM8m/ZDW2CsjIu+mUIFuy58=
X-Received: by 2002:a05:6102:418d:b0:784:b9ec:913f with SMTP id ada2fe7eead31-785976f9c37mr1934613137.5.1787925946425;
        Fri, 28 Aug 2026 07:05:46 -0700 (PDT)
X-Received: by 2002:a05:6102:418d:b0:784:b9ec:913f with SMTP id ada2fe7eead31-785976f9c37mr1934576137.5.1787925945861;
        Fri, 28 Aug 2026 07:05:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:05 +0200
Subject: [PATCH RFC/DO NOT MERGE 07/12] drm/msm/hdmi: Split PHY init from
 power up
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-7-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5224;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EeF16pi+mi4MrG3xCJYn6dBjUeEQOGKe1hJEvO4CInQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWeY0F4zpiGRrHr4k4vy8acYL0aEDvRdcJsM
 q8uJV/TtBeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVngAKCRDBN2bmhouD
 163nD/wNRUgWgaKKVLTl8ic/9HOQfAidYeZ8FwzNIw6EPyozDOYUTZ299ogRgpP8YoSeDoMGMH0
 BrBDsRFqrgm7zJ8KWAxxqZER0NJO/YtrxTsTbyVbQk/vXRn/6gSdMb62vR3TJ+NtjXQ7QMdftHb
 TrChj4K0AX2XUYN9fHH3j9eW2Ml+5dfSXIxorqx6/gM7GJvckKU9460QFYaAW8Ero9rHMFKQvXJ
 MmSJoGsaucF91A+r/jjqOw4TUP9m+qLY6iYi890tmYd0G23j6gBG+yrCVBzJd1AbQYrQv+Bx3fP
 2Hejq3v5MorRUccfoETiRhoN7EKEBgapAHbeDaTDM5kNv2I6yZk8hZ//fAQrVo7KVn+EkeI3C6A
 EH/D4oxW9+N5sM+/UBNHw/GmWamZEE7jhuxVsV1u8ExQsGMPhcZ1oMK21LkZ7aOSe2iBex2beoq
 NeQ24BirEUVnplizn55C9e7x2YlThlim/LHxic4GBqn+qrZThDjRbCECA0zNRhwJrdBZUBKwJY3
 cb/NyzqSVLAdj1Gw+xkz/AyBsDcMW08/qQ8cyQKj5Nk9pMd3Y/y7kej6HLhhPrSWlz+XYuStn18
 QGbptvsvYZ+CH+N0H5b/I4KbcKJk7lVji6cA9uljB8bHJdp8gFinnCRYfZ//f1h14jbKFza6jsU
 FeRJ9aomrHGdEXQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a9195bb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bLpuhRjsJXUQVc1TveoA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX5mUQdnyGHVaT
 zAOjGkz+K9j2ftU6AhYwmJLrBFXgWt5AHhY3kas6jQCGQMWq4jGhHWB6OwXgYMcnZGsiXvDymyX
 K/zEnm33m7dvhCewPqQnZFoxgZaZD1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfXzc6GBRuYBSgJ
 e6N2oTU//zr4SioA4HSzJiymIRspxlmnZ1hWAlFalSU/eHNy7HH9g8RAiwcYDLmT5tjACCcGfY5
 ARbtWdoSe30djfPkhGsFzo6OSDD8rE2oInwrjEmCuMvQ++leri9NLThk1FPd0mrDqFs+GpIy9TJ
 UxDaneGxOIjjpTUTxc5kwYwmqrtmMMFN5SXI9f1zlS+zpKbSVk3vsoRsGpCZlpwY0Ln0jWATBmY
 QuEJSTp05WHUhqRD/lIemkGNhDiPV1PaCNI4gqMcA/3L9UECn1cIJRWJBEI5jKp9foSDSJbsD8l
 3QwbbArBBiPtyB0Ps39sXSpAhiZjFyjTCOSyC+o2eY2kaSYHqnHO8aLpCcvcAkncnTu7vESWFoE
 LsVtNNEJf8HUYtHJnInqdNpPhcBRO7coaGLFFJUcSp7NjukPMRlgdGPG9jJmY+0pmrMWLv7/L7l
 tNKLb9f8Lrc/AFP9awg==
X-Proofpoint-ORIG-GUID: 3DEMibpKDmvbnYlKJWcFB5fyZ0Dg9ZZt
X-Proofpoint-GUID: 3DEMibpKDmvbnYlKJWcFB5fyZ0Dg9ZZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

Future Eliza SoC HDMI PHY and HDMI block require certain clock
operations, like reparenting pixclok to HDMI PHY PLL, once PHY is
initialized.  Similarly to what is happening on Qualcomm MSM DSI blocks
since SM8750.

Rework and split the HDMI msm_hdmi_power_on() into smaller steps:

1. Leave untouched logic related to runtime PM (power on the domain).
   This is done only once, guarded by "if (hdmi->power_on) {" condition,

2. During every msm_hdmi_bridge_atomic_pre_enable(), initialize the HDMI
   PHY with new msm_hdmi_phy_init() as it was previously powered down.
   Currently no-op for all the PHYs,

3. Similarly, for every enable prepare and set rate of HDMI pixclock
   (extp_clk).  This will also reparent the pixclock to HDMI PHY PLL
   later and should happen after the HDMI PHY is initialized (point 2
   above).

Commit should have no practical impact on existing devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  4 ++++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 +++++++++++++++++++++++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    | 16 ++++++++++++++++
 3 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 436d4f9fe346..306b988bca72 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -151,6 +151,8 @@ enum hdmi_phy_type {
 
 struct hdmi_phy_cfg {
 	enum hdmi_phy_type type;
+	void (*init)(struct hdmi_phy *phy, unsigned long pixclock);
+	void (*deinit)(struct hdmi_phy *phy);
 	void (*powerup)(struct hdmi_phy *phy, unsigned long pixclock);
 	void (*powerdown)(struct hdmi_phy *phy);
 	const char * const *reg_names;
@@ -186,6 +188,8 @@ static inline u32 hdmi_phy_read(struct hdmi_phy *phy, u32 reg)
 
 int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy);
 void msm_hdmi_phy_resource_disable(struct hdmi_phy *phy);
+void msm_hdmi_phy_init(struct hdmi_phy *phy, unsigned long pixclock);
+void msm_hdmi_phy_deinit(struct hdmi_phy *phy);
 void msm_hdmi_phy_powerup(struct hdmi_phy *phy, unsigned long pixclock);
 void msm_hdmi_phy_powerdown(struct hdmi_phy *phy);
 void __init msm_hdmi_phy_driver_register(void);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index a5f891661ea3..d0e3b27644fe 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -14,14 +14,20 @@
 #include "hdmi.h"
 
 static void msm_hdmi_power_on(struct drm_bridge *bridge)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+
+	pm_runtime_resume_and_get(&hdmi->pdev->dev);
+}
+
+static void msm_hdmi_clk_prepare(struct drm_bridge *bridge)
 {
 	struct drm_device *dev = bridge->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	int ret;
 
-	pm_runtime_resume_and_get(&hdmi->pdev->dev);
-
 	if (hdmi->extp_clk) {
 		DBG("pixclock: %lu", hdmi->pixclock);
 		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
@@ -44,10 +50,16 @@ static void power_off(struct drm_bridge *bridge)
 	 */
 	mdelay(16 + 4);
 
+	pm_runtime_put(&hdmi->pdev->dev);
+}
+
+static void msm_hdmi_clk_unprepare(struct drm_bridge *bridge)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+
 	if (hdmi->extp_clk)
 		clk_disable_unprepare(hdmi->extp_clk);
-
-	pm_runtime_put(&hdmi->pdev->dev);
 }
 
 #define AVI_IFRAME_LINE_NUMBER 1
@@ -300,8 +312,14 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
+	msm_hdmi_phy_init(phy, hdmi->pixclock);
+	/*
+	 * Re-parent clocks and set rates once phy is properly initialized.
+	 * OTOH, TX DATA on the phy should not be enabled before clocks are
+	 * configured.
+	 */
+	msm_hdmi_clk_prepare(bridge);
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
-
 	msm_hdmi_set_mode(hdmi, true);
 
 	if (hdmi->hdcp_ctrl)
@@ -325,6 +343,8 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
 
 	msm_hdmi_phy_powerdown(phy);
+	msm_hdmi_clk_unprepare(bridge);
+	msm_hdmi_phy_deinit(phy);
 
 	if (hdmi->power_on) {
 		power_off(bridge);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index eb1088755cb3..8ce87d9adf74 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -94,6 +94,22 @@ void msm_hdmi_phy_resource_disable(struct hdmi_phy *phy)
 	pm_runtime_put_sync(dev);
 }
 
+void msm_hdmi_phy_init(struct hdmi_phy *phy, unsigned long pixclock)
+{
+	if (!phy || !phy->cfg->init)
+		return;
+
+	phy->cfg->init(phy, pixclock);
+}
+
+void msm_hdmi_phy_deinit(struct hdmi_phy *phy)
+{
+	if (!phy || !phy->cfg->deinit)
+		return;
+
+	phy->cfg->deinit(phy);
+}
+
 void msm_hdmi_phy_powerup(struct hdmi_phy *phy, unsigned long pixclock)
 {
 	if (!phy || !phy->cfg->powerup)

-- 
2.53.0

