Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430896;
	b=XvGbeg5MyQtfiDUVO64J3jTzGQ5cpHqCEIr/YVfbK+/dJg7nU7tv2WuGnJL1H3p8bPCd
	 mo9ang08tzv5GOFsUPn7Y+QgS9baR1TK6XU7pi5yJvEwJmCkr+KL7L8RHo6EhgdLaI1gi
	 KBH1oW/zKi7wokO0ohoIk8FRgycMG3p4dmmgJNZmX/qyEcIpK5HCvuCQwYr96GRl4t1gX
	 9IMkgMoqBt9MuIO2bhtG+aWrnI1CzY8xLO2cXHh3kDQ9AJWKxNuqijrASR65tRZUPkrxq
	 1KBaTp/QK542ED97MuQxDipZvigeSTSPdzvL5jYiBZ19ik5egFKxCGuj4sNveY+r7DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QOYaHjGVRR2LuMMDwaEhbCvoOCASM7ZGhh2OvRzMn5k=;
	b=jNE8mvBjGZRnBz0ZUInvzl281OYy0PuRmWpvfHtjnON58GVsIbzoskN3cLnp99uFUMag
	 DkqSVuy72mqI/X9WZd8FmosJWS4dM9KIJoEa2aXR+WBwgHAkQzcy5cQ5/qRYe/f6j/9fF
	 eS3CkUyrbZQVhNXCQRlc9iW6F8xXcUiiZIpIhyTrgwuo+wubkXDjKz0/jrns/08SAfe5o
	 Qav6l9+MdBGpylZmkIoIhHM+rgzjUOBEYcoPOO/IEnfglZyRdiywTZGKo15lag2+pCOfB
	 /Ti9EbWIqZJv6SS238ybBVt12lwWsgqpkEAU0se6F8hnw74fcfs7o5JLZgXAO3RHhzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VBx0qFi1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aOMVC+Mu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EC5606A681
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9EC5606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VBx0qFi1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aOMVC+Mu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G6me4095702
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QOYaHjGVRR2
	LuMMDwaEhbCvoOCASM7ZGhh2OvRzMn5k=; b=VBx0qFi1PSo6JkEwDtwo+6P5KAB
	MnIZW7RFxeYUuGnvmpbVBQX0wIuR4u/1TkQMV55cc2Qw5Xzn9Peha+R/IIMBNW3h
	reKmrJRz72CmIppAcjqW9lPOrCE2BpuNc52KNCihIsi7yHyicegy/ppk4vm5KzDK
	8vuVXmlFCg2uwQvlYDlaKxogZQaa3wm1B8CSFF1dNib1gY+CFrxYp5Il6dv9JLMn
	Qmdf5mdi1Mx/pww0jW18MlYp8RcdUu6lkAZKNds4NxeA94pontFFRGSX8F5Itcw3
	+kFpI7A19Lj7dkCM6uclQVMZNS81FDGqHa8pZ16R2CWsa4Z91SOaSXwLzGg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7410kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so3059952a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430893; x=1796035693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QOYaHjGVRR2LuMMDwaEhbCvoOCASM7ZGhh2OvRzMn5k=;
        b=aOMVC+Mu+aA2Wiz58a11zzmuPd8ZQrafsDJ0pUu5p9fpTWmHOcw2CWprKumyGpJuoV
         Cv9wECpOZNCjRMwbMMDR7pSY7NzY0wfRpbFK7TympEDT9wfEiAmA18iqvA/FVMkH8pT9
         BmMwYKZdt9dYp4ghlE90zfzkyJXZWytzeWZTfToSlYk8wheYowJnTJB+qf0WGxzUze97
         ZMaIH0Vh/7e2EvVTxSmt24w365WYYuXjt+15loh6r5OIhScqEChsC7eh1IH0zMLVVTGr
         cYF+mAXhr9FWYhHaGqqKosTJoG8vHq8yVpGWWJHYApIKe6SGMj4DyDDycR+wf4TWCDJT
         OUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430893; x=1796035693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QOYaHjGVRR2LuMMDwaEhbCvoOCASM7ZGhh2OvRzMn5k=;
        b=LEUQDjbt82C+eGV2Cb0wEqQCAxSXY7emE1nD9yt9DevKMR9dZMdADA9YvwaZcAt7kg
         DqhENrc+GkbpCFKr58N76Mv7AmtYMMWth36QyjVL+iamc5hOzsr8VcOc+YzSYgimMhBG
         bdXyjz0QnXn+wNoW70/d0ktZgZo5e14GEwDiee7/B2hLoJ+/XDOMikC3/v1w10jAHQH6
         j2gbGM8lUe5Mgl50D3UShJarNplLKcQXdyTSXhZEBFprzxHF7VMVYMsvKFX4IAlEi9Cg
         S+/49LeSYlePJ9ydRBQsughf7ePrD9YNxVupDVuvo9bTqYTdDCtBgjaevsEmkTL71bG3
         4wEQ==
X-Forwarded-Encrypted: i=1; AL+hErHqZl8OJ7HDwRFZJIEIfH0v4C949jZYH0Au9/MxWjKUzorGrGQOGWkc5QbJ0fzVeOAcXDOTJmF1tR700a67@vger.kernel.org
X-Gm-Message-State: APuU4Z8WYXiTErAm4n3+isxesEogyXKE/ls36fULLYNMqiIJZ7W+n911
	tT5+suesgfFUS618TtZm17/uN8pTztqaqPqiC/ZxJ5e5lodwBM8LLSjwipkGS3GXce6iZXfWsPk
	sXvpBBMfoAK+MhejZsNXjHAFnyCAB9FGLO4XY3GSh+7wIG/csvPbW7oAtyGMu/Fa1q9hb
X-Gm-Gg: AZFdTZcbMf/dUJmFt5kHK9KAVk7oyAa2r8etAo4Oq5QlSUIrdWPiItic1QIzuhWXmHk
	ZmBcn6+v+X/Sqj94izaB66BoQ8lwfx6K5d4RPoUY1z5kdV9vxOXtcC7tZCnpGn4l5Dlt4GSbAHl
	3Y0NMKR37V490jj+VI6oaTVz2hh1BtHwA2tbWKhxB7zngVrGZt0EpIfWHU0Y63Jot9puYhIjtGp
	U8EL9vBaehHKqdEPfjanTsizxkbvxOJdol9uzW2sgOk8GyCxFm4nHQCymugXL0x7wS/HRM+VkeP
	z/t9pk2mJ2vUOupwl0Cad1A/Kjqd3eLvVg5DTrDhxzJW35dkCKo1pG3mPFGEU+FnUbWI3URNMeY
	dBbzpJjbIuurI08GoIMJnjkeKGP5SLTsJrk2hgefJ9R3bp32ide+9fpFHJAmnM7lX+bWAQ6jg4/
	Y6QndEqg==
X-Received: by 2002:a05:6372:a70f:b0:400:27cc:c397 with SMTP id adf61e73a8af0-4014e35c5b0mr9104953637.58.1795430892762;
        Mon, 23 Nov 2026 02:48:12 -0800 (PST)
X-Received: by 2002:a05:6372:a70f:b0:400:27cc:c397 with SMTP id adf61e73a8af0-4014e35c5b0mr9104942637.58.1795430892288;
        Mon, 23 Nov 2026 02:48:12 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:12 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 06/11] usb: dwc3: Support resetting the xHCI host on system resume
Date: Mon, 23 Nov 2026 16:17:21 +0530
Message-Id: <20261123104727.1539149-7-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-GUID: CcwC2dkeYUbKOTk_m5Bd9jAENuhRIFDp
X-Proofpoint-ORIG-GUID: CcwC2dkeYUbKOTk_m5Bd9jAENuhRIFDp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX6d7B7rJWDdsn
 vsxmLP68FQ8hAdD62sCg4jTqGJcsAmb7O0NrnHk3mfDilwMCnEBffa2+YbyvlRe+NuujB5kl5DM
 fTCzRtnxRAE6IToiyO+e5akkUY/8XIA=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0419ed cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=e6LMTAtCX0aBvBRyVwYA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX7XGJGqV24480
 ylFfnF3/nGgacGd4Bha1U8A379sz9/goHopzD/QGA/I6s36UCFoI5amswTbfQuaeDyF4PYzPpgO
 KvO3hZvGc63o2Hjz/wPDlngopt9jNy1zn3//xEeVxpKsWNuHrNBFg6w+E6MAZF7zq4Uf0rjE6Jy
 6OWkLvOWRD2fnLaGiv1IGU5tUL5jIW6S9YKP50+4Q9eISUalRd1xHmjQWlyAIYS0mSAHKHX9flt
 GLFsAUbgBXbSZA8XspuylBhaX+YaJQhkGlZGK5wg3QvbdnNKX+FQJW1DInbZVLmsT99AHpNrwXN
 9VBPgol1PFKQDyop/XVhuRdTDdn2/HKXNjxK89OJJJi1ZCugq36VCjdjKgCCqimjK3bNzAiNji8
 rE68MgSzXcJVQ6U3isaef9AgGQi3Lo+ZUoVH9txP7MTisJUZu1KubO/fXzbt6jDjkzC1xd/9JX1
 /Pc6SgoZ8GjmS85o7uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

Some platforms power the controller down during system suspend, which
leaves the xHCI host in a state that needs a full reset on resume.
xhci-plat can already be told to do that with the
"xhci-reset-on-resume-quirk" device property, which sets
XHCI_RESET_ON_RESUME.

Add an xhci_reset_on_resume field to struct dwc3_properties so that a
glue driver can request it, and pass it on to the xhci-plat device as
that property when the host is created.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 3 +++
 drivers/usb/dwc3/core.h | 3 +++
 drivers/usb/dwc3/glue.h | 2 ++
 drivers/usb/dwc3/host.c | 5 ++++-
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index d9f4e4109abb..d782d5ef9c57 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1697,6 +1697,9 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 	if (properties->skip_phy_init)
 		dwc->skip_phy_init = true;
 
+	if (properties->xhci_reset_on_resume)
+		dwc->xhci_reset_on_resume = true;
+
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1c8d441ea9f8..3cbe4eeb0a5a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1177,6 +1177,7 @@ struct dwc3_glue_ops {
  *	3	- Reserved
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @dis_split_quirk: set to disable split boundary.
+ * @xhci_reset_on_resume: set to reset the xHCI host controller on system resume.
  * @enable_usb2_transceiver_delay: Set to insert a delay before the
  *			assertion of the TxValid signal during a HS Chirp.
  * @sys_wakeup: set if the device may do system wakeup.
@@ -1433,6 +1434,8 @@ struct dwc3 {
 	unsigned		dis_metastability_quirk:1;
 
 	unsigned		dis_split_quirk:1;
+	unsigned		xhci_reset_on_resume:1;
+
 	unsigned		enable_usb2_transceiver_delay:1;
 	unsigned		async_callbacks:1;
 	unsigned		sys_wakeup:1;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index 72c5593e657a..028a4f8a4fac 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -15,11 +15,13 @@
  * @needs_full_reinit: indicate the controller may not remain power during system
  *			pm and need full initialization
  * @skip_phy_init: skip xHCI PHY initialization on host init
+ * @xhci_reset_on_resume: reset the xHCI host controller on system resume
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
 	unsigned needs_full_reinit:1;
 	unsigned skip_phy_init:1;
+	unsigned xhci_reset_on_resume:1;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 3fb8be8be590..a9c81def13c2 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[7];
+	struct property_entry	props[9];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -177,6 +177,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (dwc->skip_phy_init)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk");
 
+	if (dwc->xhci_reset_on_resume)
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-reset-on-resume-quirk");
+
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
 	 * where Port Disable command doesn't work.
-- 
2.34.1

