Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C843D6CB6
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396570; cv=none; b=WPEa1XxO7k1kQWR5PjcxeA0go4Q3obJl4KlKOzdEMjhfzwG8z2tHpjcIvBIvRuPhNkTl45u1TXamS58pzYGH6P7f9Iwz99hCjDMXfTB4pyfGXMhKkbRsCNBJa0DEV78aqoIcSxnfBJV3bVTVaVjCeNfzgscURXXezDegN+2L3Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396570; c=relaxed/simple;
	bh=JSOYkk1sGGaCjE3i0cw3Y06fiQPH0EUnCpLAagRRTWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=as956BE+QLJRUFYDsObUGv+bA1HP8ZiQwfC/PVYHQqadv5+VmE6geN9ObXtKrenM3Xu3usJhsvsEUqruF7wewRJ1ut5NL1SkFLBZLVa0IbSfOeStoKI4QHAFqHbAnpEWPacDDDKuUnIUKEU1x+AlL46wKYjO2NMnLzrkbRivN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2Lpjlat; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxHYYfhT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2Lpjlat";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxHYYfhT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Q2W1761282
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LfpYWv8mDIWbhQzeiTGiBs
	vb4f261tT/LiVuOxiQSgo=; b=Y2LpjlatsReSUn8Lmwvo8O+EjbNvE5LF10GMi2
	UgA1MQXx81/98OH7QrtcxVpelr8wzX/WiBRF1xgES4yQQELZXbRnw4KCLk7frFG0
	QYvB8aAFbZVxzwPmb/sXg7p9ELxKenlDhdHmn7sr11sDwcJKYqy6v03VaZyReqgP
	DnzDtkLRfblwSozDZ/TG8LAKhUR2mioEsUFTmMrjn4ztNE3PINugxpkSB+6u9/SI
	Ur7dvEvLOykq5Oo+6KOGeBc1cgxa5RUYxUdUeq3Lr9aAHMex4wltKd6y5bcplecO
	vGHjgAQY8sInHrGeWnkM7Iu/LnGZr29O4T2W9nwE9iurccMw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex94vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:36:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86bb318386dso1895831b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789396567; x=1790001367; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LfpYWv8mDIWbhQzeiTGiBsvb4f261tT/LiVuOxiQSgo=;
        b=dxHYYfhTxTLsFWaKhT49IGxIOfxBsJFJ6rSFZ/62l/VZfdLwUPw1bP2UAKZzyWFA2M
         SGSD3aYTCZawupKln8gDajpVbByIRJkfNTD9S3Ux/u/WIbEi6S6/WvvdNXXbYi8RYYKq
         sBQmWrSNXBEXfDEQjFg8A3GdI9I3dllBGxIS9P292Yaq3ou13knW255CYTYYDk2jXYeG
         LAUQGKLoB3WHlj5N9Fv12Z3c5mja5ilf1eWUb4R4Twwig+prXm9TNPBw7Cav5lC7SuGc
         R1I3XVJ0FGoxEjkQ/rEKjhWaIMLxQgaSCmwJB3B3HqYe9AHiB5bpwW2DJfP9AQbpnau9
         JKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396567; x=1790001367;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LfpYWv8mDIWbhQzeiTGiBsvb4f261tT/LiVuOxiQSgo=;
        b=MCRT2n2/UMtSvPyjrhGlHTSd8o6obtysXymPAm8YDJ9SOHQfeE0WmN4YVMkugndXE7
         yonbmHipvpDhDK+hf1v/p/Ve/btCw1t3Qte49OpiV6acGuTpnSpuezPq4wC93KRCFQGh
         TS/GvnQ/e3RFoZtXWgeFilT4kXeOEWrwZyBaVwID44WiTviGZBiVpDzK1Po0vMqSdbjT
         S+5lUGMmC1ZWsCvlztR1BxJMeij0HkNRJ2NJV5j+u2f+qRSPdiJj/t2DCYTEKjRQW4KC
         Lb5GELtS/Hp0bFTgg1DNviTk/4BkoRMXEpdft76N9iapcbFwFxP5DmC48sL7IKWl44/b
         hdkw==
X-Forwarded-Encrypted: i=1; AKwUvBxvigZjrS/VJo0brCIlKpwpKhquzodZ70q66bxYIJIXa2/Yzt3lhDCrG8kP1FOb2JGuz2QITGnAkJ3KjO2P@vger.kernel.org
X-Gm-Message-State: AFuF++lKi+xSN31jwMpcAUhXsrMU2Yvakp/icBtPbeQXgc3A0NZ2aZKi
	WOUA2r77p1O9c5Jsk/a0uYzVYKyX7a5B1IqaeliNpwAPaodlXfbGI/xvqmH6ksapkwgaT9Mr8/n
	y3925EpykEguEIY29EsXYMAJplnS1mJHkfkfcnr6yROZBkXHJEWFxcJhbvs33LE+q/Ztw
X-Gm-Gg: AYBFou133AfkqLgy60nzGsI/YQlullsgkj0L3MFOKdpoUQtgmRIEMk5fw3sAt7nl9jj
	QRJktcKBRfvebcX8fyIBkb1YBVcjVmui/cMVqXb37m4tDiOuomEBzY+bsJlkXxgK2SoaEH0uaoX
	uSqUhwPTO+xYJoG4Xbu2gH+9LUOG6RE6FfNj7XZofnF0uOVM4rxWJB+EOJfa5DOWcizPIWwoloA
	r2T2kJC9w/KO72N9WQZYT9twq4SNkP6uOXK8RXYgkckpfygMszmSL352CZVQoW7ejzPEQCVXJho
	fe2y1PsZF5wqfiGFLgqHgHlj3h7WilvZxEt9oqyovFBv8FXrGKXu81gNTXVtb4b3hGxAOpJgufi
	/2u4O8JrSl5SWzYkFdup1Qq1hbFwFBIzVYarh6hd0iIGm58e5YxISgsHZfBALAyMTP4DQ5w==
X-Received: by 2002:a05:6a20:918b:b0:3da:e7db:5afe with SMTP id adf61e73a8af0-3db405d3f9amr6924976637.14.1789396567138;
        Mon, 14 Sep 2026 07:36:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:918b:b0:3da:e7db:5afe with SMTP id adf61e73a8af0-3db405d3f9amr6924867637.14.1789396566556;
        Mon, 14 Sep 2026 07:36:06 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652ab37sm5247998a12.11.2026.09.14.07.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:36:06 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:05:58 +0530
Subject: [PATCH] usb: dwc3: qcom: Add support to skip phy management by USB
 core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-xhci-skip-phy-init-v1-1-9c46b31a5a39@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE0GqGoC/yXMQQrCMBBG4auUWTuQVAnUq4iLJpmaXyGGTCuV0
 rsbdfkt3ttIpUKUzt1GVV5QPHODPXQU0phvwojN1JvemcGeeE0BrA8ULunNyJg5mtH5ODhvjxO
 1sFSZsP6ml+vfuvi7hPl7on3/AJHu1+B2AAAA
X-Change-ID: 20260914-xhci-skip-phy-init-d0a6bd96b13f
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789396563; l=4556;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=JSOYkk1sGGaCjE3i0cw3Y06fiQPH0EUnCpLAagRRTWo=;
 b=8sWib0iVeloFYe7LoOk7asVkDiJUxtbXTvn2mXHdgC6Jf40Kp6XNjvgzz3/nLHcJ8OwjX0qsr
 aTrdpWVuUswAFrcpZ4vzvItE+kHwEgMiUMFbUn4NNFHYKqBmPE945TY
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwOSBTYWx0ZWRfX4tCg5b/9+fR7
 gpi/w+uI+Q/ARx2ctCWnojOM8Fu/iNruNfIUezRP/+2L27oe3Wevtfj3fWswarrBIqA+T7uv6cH
 VgOxuKsuSWUGVDGYruvYVEtHTFxaRnVujqe6aeRyFnTeSI2uhoALy1IsuwtKqNlO2yn5TEhrpcn
 0gplZ2+1W5BsG9lcSoYxJmLk3I+OMYefESypGOkd59k6rY1zkNLPM+1qioq7SKNuhLQEnysZICI
 G80V46Jpu29ui5+cdsV4P6S6AOyCJbw70eUyYQbaTnYnWZXPQUxTuXVwNS23k1UiQaw6ABdXq57
 9afAMMi6hv5+oPibC3J663EpibM5gVMLBrJ8/35Bog8NbFK22mJ6QEp51yR0e7cdiJ9oEjmz0Xv
 mr0th8TtkffO7GXRy0466kD7O/WGg1Jx7qHvPTSZD2CkZW/3Ed4XAkwYvjg8vEge5QaLZdyT0BF
 hdsoGyQWn+YSEZkVesQ==
X-Proofpoint-GUID: XiGA2tNhJZoT60CZr48vO-BHgfU3kE2m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwOSBTYWx0ZWRfX3dzF7hMEgvyP
 cQ0VnalkwSIf42fN6vRHtlFMFKtNiIkPHYxw9uy2tXhdwegUm/xF2Tccl2M7ErL6krB5lt+YgqE
 wBUw84mOvAWfYrp60cyU21g+AfDRwSU=
X-Proofpoint-ORIG-GUID: XiGA2tNhJZoT60CZr48vO-BHgfU3kE2m
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa80657 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ad8HgbVwfoR85nvhAlAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140209

DWC3 driver does manage phys itself sufficiently for Qualcomm platforms.
If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
exit is done only when roothub is being destroyed. Due to this, during
system suspend in host mode, although phy_exit is done by DWC3 core, the
init_count on phy is never down to zero since HCD core also did an init.
consequently causing phy's exit routine to not be called. Hence, add
support to skip phy management by USB core.

Some Exynos platforms still do rely on USB core for phy_calibrate calls,
hence disable USB core management for Qualcomm platforms only.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Initially, a patch was sent adding software_node properties [1]. But it
was causing a bootup issue as mentioned in [2]. Hence a revert was sent
to fix it [3]. This patch uses a different approach as opposed to adding
sofware node properties and was tested on sm8750 mtp.

[1]: https://lore.kernel.org/all/20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/cbb4ae94-7862-4d91-b01d-0d7f18d49a45@packett.cool/
[3]: https://lore.kernel.org/all/20260909-xhci-fixes-revert-v1-1-7cc97fa0f307@oss.qualcomm.com/
---
 drivers/usb/dwc3/core.c      | 3 +++
 drivers/usb/dwc3/core.h      | 1 +
 drivers/usb/dwc3/dwc3-qcom.c | 1 +
 drivers/usb/dwc3/glue.h      | 2 ++
 drivers/usb/dwc3/host.c      | 5 ++++-
 5 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..d9f4e4109abb 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1694,6 +1694,9 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 	if (properties->needs_full_reinit)
 		dwc->needs_full_reinit = true;
 
+	if (properties->skip_phy_init)
+		dwc->skip_phy_init = true;
+
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..b72869380933 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1420,6 +1420,7 @@ struct dwc3 {
 	unsigned		wakeup_configured:1;
 	unsigned		suspended:1;
 	unsigned		susphy_state:1;
+	unsigned		skip_phy_init:1;
 
 	u16			imod_interval;
 
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index e6b6beb38fcb..5387658dd38d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -738,6 +738,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	probe_data.res = &res;
 	probe_data.ignore_clocks_and_resets = true;
 	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+	probe_data.properties.skip_phy_init = true;
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)  {
 		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index d738e1739ae0..72c5593e657a 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -14,10 +14,12 @@
  * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
  * @needs_full_reinit: indicate the controller may not remain power during system
  *			pm and need full initialization
+ * @skip_phy_init: skip xHCI PHY initialization on host init
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
 	unsigned needs_full_reinit:1;
+	unsigned skip_phy_init:1;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..3fb8be8be590 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[6];
+	struct property_entry	props[7];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -174,6 +174,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (dwc->usb2_lpm_disable)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
 
+	if (dwc->skip_phy_init)
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk");
+
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
 	 * where Port Disable command doesn't work.

---
base-commit: 7f69cecb6098fada87b010c911aa736a5af8f679
change-id: 20260914-xhci-skip-phy-init-d0a6bd96b13f

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

