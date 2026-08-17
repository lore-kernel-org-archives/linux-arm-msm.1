Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFBD429CEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973393; cv=none; b=AXaorrIhz4ofCeVPg+OLKTp5dxekTShVVLzHDf/twHBicYW/yOgzq8asxu96VRez0w5ME1wSZ8ICR51mSmofXrkCTmin2XPCWQ1tR7N7/5mTFFp/Yp4jcKb8yyqGqErhpW8sTgGkP5yBX0z5fzYCD14BmE2eC/YxFMSh/heJ2Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973393; c=relaxed/simple;
	bh=GPt/+g0W8tC0iVD5kNY/O5ZSzzM9gsljxYbDbetCEcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a3E9/cGPk6rCYZJMrOo010zlGW4cJNeWjOVhM1D+15pPznUnvLhcbg+N9TPWtNQkUz+cWmck6Wz7ARZQtAIkrwW/1d6KgtQh0bslRM9C8k4rLegGJ6RIJRkzUq6jTODEfHW3a2yMyZXRWeas2+J/weLZH77yvsu5M8HwjQc56Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVnjp+AP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVnjp+AP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5tk31994255
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hybkV52358BQAvsBiXpnCEIrDbK+YAq0h+qHa/Zwzhs=; b=NVnjp+AP9APvmrRp
	ZAQEoqu3eKbrhx30xQuPh2GYsmtJ4g9ob2IvNdlJEYoCpRxGATkgrdewi88ngWKL
	V/jveut0jVXwAYhjOQcdb0IR+iJieirHMqz057uJS8Nf5LkAlCd1CXvrU+HNmR+q
	DFaZq2k4LbvgcnKREZi/yIkY0oxJgko2IvqG1rm/P3oFHMNozSUuWlxQWFxvsrvX
	JB+WU8sQ1BBR+yA1NQnThvNf4FRr8VvihK4aepsRU/irXkqjUMRYfVdNjlQcbSbe
	YGwp4yru/NKOQg1fASXfAekMG5BNJpTu8xUG97hFjI+T70JznZR6RuvIJjkaFy/S
	MYYBvg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1h794-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67HDTm8t000839;
	Mon, 17 Aug 2026 13:29:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g2h6jamdw-1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:48 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67HDTl2r000796
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:47 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67HDTkmU000795;
	Mon, 17 Aug 2026 13:29:47 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 18:59:44 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: lemans: add PSCRR NVMEM recorder
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-pscrr-provider-v1-4-88a318c13d41@oss.qualcomm.com>
References: <20260817-pscrr-provider-v1-0-88a318c13d41@oss.qualcomm.com>
In-Reply-To: <20260817-pscrr-provider-v1-0-88a318c13d41@oss.qualcomm.com>
To: kernel@oss.qualcomm.com
Cc: avaneesh.dwivedi@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a830ccf cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MOLsqODhR6HaTkgyW3wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sc9cfor76ZJpguApnm3g-PiMqbrbouxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfX0yA9hvVnQ4dT
 cfNIkFK+WKWQGrN1gi0uIMRX6er5ERre6+AmlZEWj1m95zpFOhZiKDQ3Mdvgdq4Ci6Ia3E5C9jR
 ImWOdEp73AAH8uadF3iElx7FaQQZP4idrVXBTkpJbuUAr7QjHw93OLhhpCYBH8IpJG2ulkwUGqD
 Aa7zUM6BkH+VAA97hwEsyBpxlt1i88YiTLh7NCyi11VWYM8hra+EgtAtZQcx2x5wR2agblRQAy1
 uqrxF8e6eqQXKqTNUZOIAWXH2X3pC383UM5dCbMflzyLrwXUB7mnHYzlxSRvnYYlz6F8EhPRmgy
 FTU8j2F5LUhQMDFC7JmDPxutq/+lMHrjG4SDfV4CNt36tj7WiIhaNWdVjXe4HZphsAJ4BS7P0G/
 maMppYxmv4CvtdO7XaiQPjY9jiFtMVWx+1lx1hL+x5uOjB6t2/RjbzcUr5aLp4EdZfN8Pq1ktfz
 mYq7hqIuKUSy49TzhxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfX0Xg2BFAnMQrv
 5eSgvjpkaBo9wGeJyU3anfB9IZL7odsCFbQTJEFlAPiot/AI9Rpz0SEvaakoyXLIh+frdCT9eDn
 r/rdLMWmikeZ0fba8WHp3JXTXCtQU88=
X-Proofpoint-ORIG-GUID: sc9cfor76ZJpguApnm3g-PiMqbrbouxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170103

Add a one-byte NVMEM cell node in the SDAM to persist the power
state change reason across resets, and wire it to a pscrr-nvmem
recorder consumer node so the reason is recorded before
shutdown/reboot and read back on the next boot.

Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 500f715931aa..d75b75df870b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
@@ -97,6 +97,12 @@ reboot-mode {
 		mode-recovery = <0x01>;
 		mode-bootloader = <0x02>;
 	};
+
+	pscr-reason {
+		compatible = "pscrr-nvmem";
+		nvmem-cells = <&reboot_reason_persist>;
+		nvmem-cell-names = "pscr";
+	};
 };
 
 &spmi_bus {
@@ -186,6 +192,9 @@ reboot_reason: reboot-reason@48 {
 				reg = <0x48 0x1>;
 				bits = <1 7>;
 			};
+			reboot_reason_persist: reboot-reason-persist@49 {
+				reg = <0x49 0x1>;
+			};
 		};
 	};
 

-- 
2.34.1

