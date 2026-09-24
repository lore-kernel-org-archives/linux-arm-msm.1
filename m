Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F4B28851F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 00:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211071; cv=none; b=YX0NM9UBdaPt0RNwWX60M4ayp+X4i2d+QERLWHrJ7V/PHyvldQO0c4Yis7c767avfNnxzMKkYKOmQDP7GhjqU7Xctrw0RNEh/f5tgdcBh3aKxfMyxTifBl6McRU1a9e/J7gByx2jQNnfkzcl9uRYhL0XPI8wIIATyDSmlAapyac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211071; c=relaxed/simple;
	bh=/rrkV8WwD6wGlIYmp0c0tjWAFwnDg3GXFLTLFF39vI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j58qss5sDGnSRHVFDDusZys74CwZ+Pk2dH86C35TF4WXXhQjmsiRrvrs8/G8gudytpJ77U4Zp66XEuxC6V52s2O+lgGJDzw8pibIJb4hsDYIVWISaPifRXWhPToytrsM1rdMlhc4Yn4cuOqCc5iRBZ3xwZhiNfm2auh5yFPP4LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNVgM/Wc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwq/PJ5X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNVgM/Wc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwq/PJ5X"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NNExrT333697
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 00:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0a+22tfORSkRjwYe1Qlzbr
	lWiAZZqL7pFYHmkOBtU7Y=; b=UNVgM/WcHrCwPiWEGwxYowaH6xwQ9qqiuC1Jel
	TisedVavCxTsH/v5Hddg9b/eJIQTyyULBneHZDE1bW5zH9CGsIAo3CKkkDMDaEaX
	cyampVdFe4h8XFvx7j0fgEoKV8zf1WodS71gt4LoU1PMTAvFReNfiyNdWxWuYEu3
	P5XEl40kGptSbgkT+W8Zv6eVera7BWDD0utttJClIOE2zf7rhuJAFNElmuYnatAY
	EiJtKqP5grBK/PoSiTzlTL3iGm1iZ48t8zWRNqJ15UuIe7yDqq0SeoCKUMWqhpWA
	5aJTY8v0i2UQBxz0v3dn1oESndXqB8Nyl1OdH2jbNP/X/exw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrr91hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 00:51:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530e0cb072eso23361671cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 17:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790211068; x=1790815868; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0a+22tfORSkRjwYe1QlzbrlWiAZZqL7pFYHmkOBtU7Y=;
        b=hwq/PJ5Xk5WHDMw1MGYwCyFG8PqN0jii2y/1NBhmZYAx1MP4wUWCnQ4iR0FzI6UR8y
         /vJfYuaZTcbAzFsuLDw0phkvFRdRY+vErFYYD0mJ8/AcbSGoKB7KQY7O5FHyFrapAAf5
         Js9dKi9+epZ/E0Wvfp+ZtwumsLjaeBxtj+Kh0Vr1VfuCEaiUhBODELXaLoLKA8+v8rEd
         TAq6OoPS/iCbU9GzDAyrNX3/cstl0MAPWn2lZ8uVU4dFdHFqX9G1hJba4owMUSBfySwX
         AWODko7AbO6opAXdlYUy7O6P7IpdPDav3QF1w3NwVyZSuq1czeUYLg3KepEQZozN7LYv
         lPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790211068; x=1790815868;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0a+22tfORSkRjwYe1QlzbrlWiAZZqL7pFYHmkOBtU7Y=;
        b=hagJwmRyEQmddZMf1zhAOOT3UkJxQbooXAPB9OaAXoMJ3kt5CSQ+rrgW96dDvkp2Fw
         gCjRApCiaymhMKMKt616InEzAoYePfYPoqTVRWwuADeFXpOvpmiUHkKYKu6shEzpdCWB
         1+4gCmHl1RRoqgB8aX1O+1/AbrhiVJ4BSDDe2Hc4sXFRRwm5nmlqdq1znP+6J2uYdv3h
         eDRaCJS9LGAFFr8vu7vNOXYwcCFxd/Alnf0saNsrCbJEHaIx41ieqihrI/CrLI6DzdGt
         qzXll38I+c177s5byC8sjSMZ/OTVZiK9NimcuYR1sE8AB47u832kOF2qkwvUAPOZDt7y
         jR3Q==
X-Gm-Message-State: AFuF++nYJqL3klgLdFJJQ/8fVmEnfz76XtiDE5QqUZaiwu5HHtfz/R9T
	TmkTUQNipECSEHaCvRp+Mg/ODCjJCUxeCrhS+hrFlGbrgxFd8bbuMIoS24VL7kzTK+Zkpbv83bJ
	62YbLrDe+YQQfsFcWDnDOl1tNdnSirOLeURwJsl1vRK+vKAW5b3YI3iBwSJ3myVk151Xq
X-Gm-Gg: AYBFou06RjCzVhDngF9pqOiowVKLO6p1HOoHz2LM/U3Si5KQHjEPuqFm4NApb1SY2hY
	0amaEcG8rAszQzT6N1fw9ShaEOmMlDXVBfBRx36v+tmXPjRva1/B1Z7Tpdt3NaRygFHlYZePgj5
	FFzabImaWWvTkeZe6GOTu9aWb0Dk8nzV9k3H6HzJMBZHxMDsnLLBc4hrgAUrN7TAyaDwfjmKx4o
	ot1GqgfeKME4Ff3d5z0rONAto4ZgtBgMWvniv59nD6ngWv4A9PqtwG6P8Y4ypDXnpJvEsAWz5mD
	9tO3o/VQfCk1IGwgf7ANFK+0VfUwrdIqreKSJAU2jRGUt92+pZXrbTScj3cryE+GonDJ8+j2Csk
	GNBXqZkX73acJdjR0FImS4RELi0OP9/qzhRfM2zE8WPOnEv5GpTEEofGynksq394nxR2OqE85GW
	M9MestAmv5B05D
X-Received: by 2002:a05:622a:4009:b0:51a:896c:9aae with SMTP id d75a77b69052e-532fea300e8mr1938931cf.13.1790211068192;
        Wed, 23 Sep 2026 17:51:08 -0700 (PDT)
X-Received: by 2002:a05:622a:4009:b0:51a:896c:9aae with SMTP id d75a77b69052e-532fea300e8mr1938541cf.13.1790211067715;
        Wed, 23 Sep 2026 17:51:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2b35csm2505211fa.13.2026.09.23.17.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 17:51:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 03:51:03 +0300
Subject: [PATCH] drm/msm/dsi/phy: power up the digital top before starting
 the 7nm PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dsi-7nm-pll-digtop-v1-1-c2b24c8e218d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPZztGoC/yXMTQ6CMBBA4auQWTtJHX5MuYpxUekAY6A0HTQmh
 LtbYfkt3ttAOQkrtMUGiT+isoSM66WAbnRhYBSfDWSoMZYq9Cp4CzPGaUIvw7pEtLa0RMZVdek
 ghzFxL99jen+c1vfzxd36P8G+/wA6MBwXdgAAAA==
X-Change-ID: 20260924-dsi-7nm-pll-digtop-9939220a453a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>, Val Packett <val@packett.cool>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3932;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/rrkV8WwD6wGlIYmp0c0tjWAFwnDg3GXFLTLFF39vI4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqtHP3jS5dTAye9chlkHIM1qeh1IkXuKqrFC/g2
 cXfBvyvrnSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCarRz9wAKCRCLPIo+Aiko
 1QqaB/sGXO3LlP7m1ZAGAUi3wIzzopQWuyTYWc4IB76CjH2V8u0QbQqO4yhwZYv1fLNaM0CAVgy
 1f9hccBHB3qgUG6xyJo+hGOUokXfy8xVHomwNwMlMB9hGppYEufmF3fWAMK2AhtVOeAA2slQute
 X04KhitFvx9bCQ8dFoGT1GXEmmyFxD1lY9uY3ba3NyS2q5UK9G4Yi+jKN0mVGrkIm2rlLOSorNw
 qYinDFX6/ykt0pVe/o6zi+xiTifqp0IlZJpeY+idz490MKmn5rdSHYwT619/eq8EqsCw88OnZbT
 3AqgpiIV9F/kNhanzaJeV4GWYrN0C2QoQ430MC6WrdJdqRkM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAwNSBTYWx0ZWRfX9SiEil1wSMje
 PiDcmejcsbqmGFWX3myf4wLe1vWDxasewR1Oi8Haq2SUeYqAl6OHnyoZWE8/URAAXuh7hYtmKI/
 Vnf0lWeepm9TkdfLXyGKlEg3apaBibj7gASMDLCy2ziOshzdY7dvR8CGp3mhVmAUBEMjDmhAn70
 3DxjkpdhT6Op7oTAOl2MGrA/UAl2MHkzRqdXpAOT1GXPBHeFXZOeDKQantCjwJQJcDj8UuHGsAF
 NeiUtdIB1KkLGZ0+rb/WhFRO49Pg2Ld+xwKtgEUA6aSTm1ZVRv4fV17B+eiW2vjdpX+reZ0duYg
 843ddSSMg9VqVcffyH9dyvVuWcdFwPEeYzNmyUDZ4IyuGwZsK+n0LLFnkGfRkivAjMSOQJ4mNKY
 oBi+1glfIYPDOR4qFJH/gYpetj2IGiwqcBBvuw1/eFNkXq97TI8GCxiwwvkGaqnbhSkHvszFv49
 rqFUFYvlcO30e8giLXQ==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab473fc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kzAWmSUG3xt2rQffrjIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAwNSBTYWx0ZWRfX8qPV2oubmNCO
 3E2/8ZuKAbyeDbXzyLbNVBZYWatdkKJFX1Lfwojk6TmUU9/A4hqf/AlDZdj+gAZoH1R83VyXCjE
 0oA1agRG//0FSgE2skVFHRExH0DnvBs=
X-Proofpoint-GUID: pCghRNsc6FAlVNdeYGT03hMrPqzHapWM
X-Proofpoint-ORIG-GUID: pCghRNsc6FAlVNdeYGT03hMrPqzHapWM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_08,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240005

dsi_pll_7nm_vco_prepare() de-asserts PLL_SHUTDOWNB and starts the PLL,
but leaves the PHY digital top powered down; only dsi_7nm_phy_enable()
sets DIGTOP_PWRDN_B.  The PLL cannot lock in that state.  This went
unnoticed for as long as the PLL was only ever prepared from the DSI
host's enable path, after the PHY had been enabled.

Since commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for
pixel clocks") the clock framework enables the PHY PLL on its own while
applying the DT's assigned-clock-parents from of_clk_set_defaults(), at
probe time, before the PHY has been touched.  The lock fails, the failed
enable leaves the pixel clock with an unbalanced enable count, and the
retries on every probe attempt stall the boot for tens of seconds:

  DSI PLL(0) lock failed, status=0x00000000
  PLL(0) lock failed
  dsi0_phy_pll_out_dsiclk already disabled
  WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0x244/0x24c
   clk_core_disable
   __clk_set_parent_after
   clk_core_set_parent_nolock
   clk_set_parent
   of_clk_set_defaults
   platform_probe

CMN_CTRL_0 reads 0x20 at the failing attempt: PLL_SHUTDOWNB set,
DIGTOP_PWRDN_B clear.  Setting DIGTOP_PWRDN_B alone makes the same PLL
lock, with no rate change and no other register touched.

Power up the digital top together with the PLL bias, and power it down
again with it.  The normal enable path is unaffected: dsi_7nm_phy_enable()
holds the bias reference and writes CMN_CTRL_0 in full anyway.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Fixes: acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel clocks")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Single fix for the DSI PLL lock failure and the clk_core_disable() WARN
seen at probe on SM8150/SM8250/SM8350/SC8180X since the dispcc-sm8250
pixel clock sources gained CLK_OPS_PARENT_ENABLE.  The clock framework
now enables the PHY PLL while applying assigned-clock-parents, before the
PHY driver has powered up the PHY's digital top, and the PLL cannot lock
without it.

Found by forcing the missing bit on a failing boot: CMN_CTRL_0 read 0x20
at the failed attempt, and setting DIGTOP_PWRDN_B alone made the same
PLL lock.  Verified on QRB5165 RB5 and SM8350 HDK with the current DTs,
and with the link clock sources moved into the driver; the fix is
independent of that series and makes it unnecessary as a fix.
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 5d805a797abd..7bacc1031187 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -413,7 +413,8 @@ static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
 	} /* else: == 0 */
 
 	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
-	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
+	data &= ~(DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
+		  DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB);
 	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
 	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
@@ -433,7 +434,8 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 	}
 
 	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
-	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
+	data |= DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
+		DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
 	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);

---
base-commit: a15fac810c76397ec9f62a6fc26c4d7ab6e238a7
change-id: 20260924-dsi-7nm-pll-digtop-9939220a453a

Best regards,
--  
With best wishes
Dmitry

