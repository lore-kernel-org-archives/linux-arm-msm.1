Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2726C442B0F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804111; cv=none; b=nkMGQZwy25cBlhqz6z+gj4gavvzVdsDLn6sDZU7/kfqhd13sA9RHMNc/sGpW2E4NMVA5vo56R00LMGBDLoKROJDRyPLyweecG1Y/hWMCOywhRswrryDTcdA868grveX/PN4cQmKaKHI0r9wik4KxsInvqGHhoyNgRJLFNNT6BOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804111; c=relaxed/simple;
	bh=SkWYEA8SWQOC9OQOzgvWGRyQB24DxeCGK0FItA5xjH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZC5K+FLmSM7qlaVuNZL8xzQti0fsNBaDHfhL+/92rhmjGGVvofPQoG6o58ljQcxQDs97zjlaS4p53VhJYIWCEpjnzywyBs6tqgE+0zEXmVvXF6FwtIRmzmS/JCMtFKG16Yu+qFyNl+v/yErmhnkJAnbXQDl2jBhCBqWYbDNYxuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anMlLd37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmPtAbjX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anMlLd37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmPtAbjX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qaao3668011
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AD10OMBFOQHaMcw6UwRxqD
	mekzrLtYWRebhPYOowu6Y=; b=anMlLd37mid5ExCK+KH1SuPVUuxyHfR5c9z2bT
	6XSxCm4Q9lYtpHlfO15Md6jEkXS5W29kALNDEY5bf6a6FgckqTodElM2FGRRWi0Y
	D2esQGzidnfybUzovkCZQlLyFGtNc9VJkR52hvH6Abgt+I52BFoMpTzjI/Dz93JV
	sVc4j6UJoX6cvrs5uSaa7yDfQN6h7bx86CLSWQGwcjj8wrCYXgzILjLq+T54K6tQ
	jc+psuTsoWSRAECU52P7kBQG7drqGPVZrnLRkhzZkX1lTDj/ALMBiVbQq44FKGHq
	hxWubA0ZBIL/1fMCYwoKuoOs0uk+uM4jarNS+oqsC74MpLxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc2tsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:55:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso942424b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804107; x=1785408907; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AD10OMBFOQHaMcw6UwRxqDmekzrLtYWRebhPYOowu6Y=;
        b=dmPtAbjXTfDuJ3f/AIgEHZgf3SISKHDvekf3xgzUYe5PtIUjM4/Rgwiyerqx9VoUSb
         BDnbLVbWVW2ba2ZpYcMn5ZM0R0DvABKDqrohv5HQRhmmqUcsBGENz/WFtylApuzQg+8a
         9ClXvbg+kBL+zgXnW91pNMpvdul5/xaJahp5uGBvJtq/HRpOAJcE/djHc8P4RRjz5WGC
         LGSfzoIU3W1rdvQX9Z+BeMSSrmtzk5EsRfELFpgewYxyxFT9/azESgqoHJeYkLqfsAfx
         7jUYzPgAzIPXjCyBcdFUu/OM00e0IES1XAmmmVUmT2VCsGvEoj5MHkplpSgxd58cV33O
         NqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804107; x=1785408907;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AD10OMBFOQHaMcw6UwRxqDmekzrLtYWRebhPYOowu6Y=;
        b=NtomhKWqvZkDb0Y07ebsslCCHs+fA6LliMRPhoOQyIaJit0N07mW8cKq39eY3LzDdD
         Qs3DCTAldrhtatTcKPVbtckEyQn205RIdVVCVQgoV3EFobqFNpbIFHIoqRP9SxBUhNiD
         v8i26im3oBNofzsQL0h13Kr9W8nZnpGTyVAdXZurG/hONxHsr4XGZ09bQE4LU02xKgxK
         X0fQvfVsxwJuyngBJ3fVDYqAwYwUvYhPboP0xJBGarnM6FMAK8P0YBt7AIFUj7AoMMR2
         MMS6BTxzdQya2moh1t9w2sF+iJtXmFPBVfnswyck14/iLiTjLBpjpZq4MlPZC+iui5Yo
         b00A==
X-Gm-Message-State: AOJu0YwV7tRnhTo3cs3H+qQ3u9rkLe+5egifI21UokLRcPPIEtNFvtKF
	IxPWvW6vkaoQTSatNdDt26HQNjExCmgjRoDKHc6u8oBlBdpofrj3JAUWgHBVzuzcDXsU9NpjwVl
	oNsQEFgNcU57zoanbPLV6iEyKFxIjxJjFJaO0cD2tTFI2W99g/ko8ujgBnwmG7fNJ3Fx8
X-Gm-Gg: AR+sD10T/NjyQcO9l1RBsn9NM8VRItOVOP650UP70nZGQQHuAgZEtdKzocF1JAPfuGs
	9SMQ+CuWCij47CAt3g7c3N39gz904hA4TILpWdPO4mPongeh6Vjkxv/bcJFfORGRM5QvCm6+0IK
	8JA67bGp7Crdr6pnScOfCv8JS7zN357mw4UUo2uO772db/NJshq+dNWGrZ+FY6FAjloq7WJ/w9N
	QVlAbpNtfu5uO1IsZMyEgLx96g+xJ6h9xn3N3n3sqlSf1IkSH7559XHhNtAhien5Zf0hR8YBLW4
	oVFUhyDa9I6+hmOG/Ex+zxjMbXxgAcTZ+82xdFyW4eVU3QAD5d8LKCkk/+sTAVw1gYSPwCsjSCb
	YUJgGQKmFYUhnWcunR9654xg5BGHsT6NApWUr4WG/PZS9mXhkE5N8umhHcJL4XV3fBMopDg==
X-Received: by 2002:a05:6a00:3913:b0:848:57f3:8f8f with SMTP id d2e1a72fcca58-84e2c204c5bmr3091704b3a.51.1784804106922;
        Thu, 23 Jul 2026 03:55:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:3913:b0:848:57f3:8f8f with SMTP id d2e1a72fcca58-84e2c204c5bmr3091675b3a.51.1784804106386;
        Thu, 23 Jul 2026 03:55:06 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17577790sm2874124b3a.34.2026.07.23.03.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:55:05 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:24:56 +0530
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
Message-Id: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAADzYWoC/yXMQQrCQAxG4auUrA1kRqjiVcTFNI36WxjrpFWh9
 O6OuvwW7y3kVmBOh2ahYk847rkibBrSa8oXY/TVFCW2sovC/Uu37ANGRsbEjxllYA1BLJm0+6R
 U07HYGe/f9nj62+fuZjp9X7SuH4Foqd94AAAA
X-Change-ID: 20260720-dwc3-skip-init-quirk-c110eae068ac
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784804103; l=2268;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=SkWYEA8SWQOC9OQOzgvWGRyQB24DxeCGK0FItA5xjH0=;
 b=tTFRl7YH/JoNmp2YcwmhP0DfaQ2+MKf+PW2O7gayXkGea7oFP/xiI7aR0IJrRJIHoURi6DLxj
 TSk8JfDWEJZBK8gvRROBDwh8Iw68z7j89eZTMuD9XKIhR5JmpoAcFmT
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: X7My6oAXblm5ZHuEZI6Xa8An92hkUSja
X-Proofpoint-GUID: X7My6oAXblm5ZHuEZI6Xa8An92hkUSja
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfXzPUrdanI94Jc
 xtd6qVDekzqSy7viOYQ+mPxozVQci9HBQLIMoO1V5Hm3nJoDrwE1hFklds2d6POnplAIKVG9xX8
 H3ytr8J+jquKVnr+nfX4hhg5Tc/uklY=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a61f30b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=TPm-v2h5D2wtuVy3nSYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfXxOjuOFVoo39o
 NUB/QDelvp3nq9Nk1vH8eiiuWfI75hb3G4kayvqicLMXxb84aLJe5gcQuJSdfBXNSoRV0mVljh9
 7U0YjN5MszheyAPw6HftNRbM1Idh5ME1+cNRksfQ8S32fsOq+96Y7jQo0mDMQDwtNFaMv7X++Xr
 5zXjylkt6f5dkHkkET6qJSMHEo5GDTNQWtOvTgim9BBfL1msn2JmbttxpSUDk2o3yg1/UtIY/Vt
 49Bd5xy8Ktz1bRtQ3VZOKzECjGAp8ABT8dxrrj63dpBJATCJlVpJ4LRMI4oNT/q5FjpxxnxCPDL
 e3q/A2fYycOERJocx3/RbdVnlj+VokyI4rFAG4NJ2z0Q6AYxvrgzClSvxr7De7opc9YfXVzyJnl
 rEhyd5OcaML1orEx3LaxxMcSks5IsR9vVWoyy0ye4r6UUdVTNw7/YrI9p0hfi8GxZ+xqVhUFcvY
 JZyhTj6vRkTBNERyWXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230107

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
Link to PHY calibrate handling for Exynos platforms:
https://lore.kernel.org/all/20190829053028.32438-1-m.szyprowski@samsung.com/
---
 drivers/usb/dwc3/dwc3-qcom.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..ba26e61df915 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -19,6 +19,7 @@
 #include <linux/iopoll.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
+#include <linux/property.h>
 #include "core.h"
 #include "glue.h"
 
@@ -419,6 +420,16 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int dwc3_qcom_set_swnode(struct device *dev)
+{
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
+		{}
+	};
+
+	return device_create_managed_software_node(dev, props, NULL);
+}
+
 static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
 {
 	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
@@ -683,6 +694,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
+	ret = dwc3_qcom_set_swnode(dev);
+	if (ret)
+		goto clk_disable;
+
 	qcom->mode = usb_get_dr_mode(dev);
 
 	if (qcom->mode == USB_DR_MODE_HOST) {

---
base-commit: 80574c40598aedbc1751c528e414d7e224bc6313
change-id: 20260720-dwc3-skip-init-quirk-c110eae068ac

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

