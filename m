Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8796D39150E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827963; cv=none; b=VVCMEzV1Zuq8s0SniiIjdzLNw6Q65tI84QAyi4oRWDp9P/RQBnF3mQguVl3DfkXTIsQTTAnrXMkp6lSLtwP+hdjR92T7WnmLiT1Tw9RCc77ezK0py+CnJIvVypKFe4N1P/d9ZM5VyHToEEyAZFLDsHlJv8hiFCANm/jOKiPivcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827963; c=relaxed/simple;
	bh=Rb307hRb593uxGm5/db7vJI145JpiKZ6kz5lVmIoNUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCIYZuT+cHQf8rrH+lCneUY0sq/zUsNBqzDf16urlBRdUCYO//CPQ95JVLPwuSaaHaNtWkbdWxEbAnu953u7KGOayYDBZMFQy1dP3KZ/KTP7BpKyaNhfWMkLKO1hcXIaHdOpEIJAhtqrE8zrF7rfEKGeu2w4ThOEcm6wKDXSA/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtvnVuOk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfRZE9l4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtvnVuOk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfRZE9l4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NHW9Pj269683
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBINSf3ePH0vCV4OP0AaN57kC4vNoicTYH7Nd8Kcn8M=; b=YtvnVuOkHA+6O2RY
	49fEiIyiV3hfC4SKsJU+2CCVGGWs/QXqagjsogzXOPSrhjMNWGFNGKzjlGa0hb4E
	AaWEEqmWMJQDthjujONibpfBwMlccaM3YzEPLsFQyC7KFBNABJV/XuGp07Z8FVra
	pjtPDcSDBDkgfImg8t48BXx3m5+pyCQU/MVoDTloISuO0um8wUxqoVvd0tYNgXi2
	lowXYpNGUHS9Vu6EYvpbrxiW1+5hJJBIWy//7khYGuIZJBOzzxP/tUHahHyMWAwo
	Svh3yn+HWGMTkCN814yFB8W/Qi3MquXyvH0y7Ywzt+SEdSN/WI5C3V+HK2WhVtek
	jVwpxA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqajr128-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:32:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso541315a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784827961; x=1785432761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBINSf3ePH0vCV4OP0AaN57kC4vNoicTYH7Nd8Kcn8M=;
        b=FfRZE9l4UCkcOvLN0npXkKOpCTHIM5mtEGNYtx+tpmVXQnLvXqjvH7Chj03NNNSVvx
         XNn14OwQfnudppmfkwIVF3WGO4ztl6tAE/oT6s8q0ACzwmok1c0Gp3TZHzacL1vh2O3p
         U5R1pXvQmQERarGE6vG1ukvrRC09x0b7V72LnL5DrjYCe7h/VTRXyGS3wtU/t2p1KZQL
         Uvi5ZyRipGQX4FHXb8n/81gsLi7g6Lo448wXut6xFSaOlKTpJcQATYSRjt0N+FAmOLXY
         EABA/JKIk0fkdSiFwwV1YPaMKFFbT4bZ2zXoqDBUy89TWUflrarfQ3tcfZ/k+14hHvmy
         bgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827961; x=1785432761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBINSf3ePH0vCV4OP0AaN57kC4vNoicTYH7Nd8Kcn8M=;
        b=DBWltii7IXuQDPvP68Ns+sztrkL1Y6aZvfiBBvpGN0mwfob44X4ayCiTx5FLSM0+qJ
         yTE4v7RHUXZZ9liVdOk1pE5DoHjLnezX5ktahnrY3R1hz3JI1GAcBBAA8Zw1afGupomp
         PAYqYMqDZck6MO1zBYxFKF/2QHB84U2zgwF6KBkgz0EDyZak8Op/x4sw3h3dcpG7Tlsu
         rU25FRURSK4o+5EuoTb0PfiAVtwevAwf+OxePnf55QVpeBBM46z7xLLKaa+3kI0SmerR
         sQPYCbweu4oekMKPrR2An4u+P6WZU+A3OSeNn/+KwUBoHfxr03oe232o0npoM/oeBzgb
         62sw==
X-Gm-Message-State: AOJu0YxumvwiQkycV6HnBgIIGUbL/ql//8NZRmNzkBGrnITJFyGeb9mn
	RKAHR+QMRzClAWFiDVQCt7WpD77Xcm1HdusOg3MhHPQ0QOnxZt0or2FqNL6C0jjHVxfDfMQFZXq
	x6YBya89K+0JbHHrHuAvoImxzobpNfUoG0DhcoUR3B0ETjPhEN55Nlq84mzhBLB9Akv2l
X-Gm-Gg: AR+sD13pgxK4UP1kKUuoxl9z1qGCtLmc/j2DEGxwzq2C/UveTVzXSQ8E3Qk68BE5yef
	sQM1N/XQwNdgQPSoknA6r1+OTLikEsDtq18Jw8clvoBh7zJURrVX586A2RMQOCfH39bRKw0SqMS
	XgqsDuyk1vK0AV7P/P355iH/gmoLXyWV24xyfY4hV1DDaQ6cAsEcMY20rXnR62vZDW/TATMmAev
	JqIFlhdhyzWmDkYbc3DniJzMfv5FUYWDcPVhWIl+9sBtVDjt45+vbzVdnP8iAM3GdUWQ7d1icBZ
	/O4bUuluWQBkoOg0w5Yulf498My9/UvIpdlqxDN078dSutpYtoXTit2jLnD3Q+h1Qbu8W1omawK
	JRtHzeJFad7oAjP5AuMSnQtpzLgNx6QCmZ1ZAzAabRNwNFpKcGTO4ZNaH4ImEP0vQP7rOWw==
X-Received: by 2002:a05:6a20:db95:b0:3b3:ccd0:cf62 with SMTP id adf61e73a8af0-3c44cd1daffmr4297913637.36.1784827961142;
        Thu, 23 Jul 2026 10:32:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:db95:b0:3b3:ccd0:cf62 with SMTP id adf61e73a8af0-3c44cd1daffmr4297883637.36.1784827960698;
        Thu, 23 Jul 2026 10:32:40 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm26466497eec.30.2026.07.23.10.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:32:39 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 23:02:26 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: glymur: Configure USB controllers
 are wakeup-capable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-glymur-usb-fixes-v1-2-816357d5319c@oss.qualcomm.com>
References: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
In-Reply-To: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784827948; l=1309;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Rb307hRb593uxGm5/db7vJI145JpiKZ6kz5lVmIoNUY=;
 b=4XimRkGLsjVoDoY4pinoGp0+1kpQeRbxxWhOoXQ7P5coduPlkRV8Ni1KwF4d1yh+nV6lTOoj7
 qZKSIfHjoOLATTr2aREL7CnGVnr6RMZnExmq/LQiFg71slB6NBuq/NS
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=6a625039 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=207qiAQzmBhLk1W34nUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX1UCxRMkdpO8C
 68Gdg01lHgEVSarvNA7WcLTvGyWmK2xIR2XM9TZy9C+1onCwugwyOyo4q1xfPzGseVcLSThXcp+
 upfM006QK+q83/JF7l5jn4wxhWsy0EltJXA8Pk1H5MsdgsVqNv8fpaUcvvGr37isTlIyJCRvHGo
 lKzmbJeak5ntKZNyhVHjII1cJUIo4ZsB/JmOzSP8CxULmVqhtmTgbCYkngSMASr0N01g4iiwvCf
 9pSaXjVYUgAsyhJvssVQIz/8i3+nBXYtpmgOVCQzaDQb1l34nDwVwJtgdWN3sMvkdNTlnKqXrkv
 /Dnubg//CwFNUCQpldqNbOiAGLuTAy1EX1QEy1BNwlVUeXDSn4IU2Gvvzc5C8LXqYrqJsXO4jaF
 thbptzPfA26c0Z+1weAJB2LmNJC+4eKseY40JBDiQx5yd+gjv7eVnoI80sWZUOrJncftOXflFZ4
 VBYtqenxM0dnew1wOpw==
X-Proofpoint-GUID: hV3xQ_TnZepksVCSGtiR0tf3m3RAgfqP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX8/YHX+XtmMvW
 H+U6kCsS15qZAR2v1FVJW7oNTe2BKZR0Xdh8z+jEyAy/VwVPjg4u82eb2rsOesltOZuRB2oB2Xz
 2Avr3xlFNAAzqFfpHYfu38Om23VJNSs=
X-Proofpoint-ORIG-GUID: hV3xQ_TnZepksVCSGtiR0tf3m3RAgfqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230170

All USB controller on Glymur are wakeup-capable device. Add wakeup-source
property for each of them indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index b9eb0fe8e413..74692ac1a22b 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4559,6 +4559,7 @@ usb_0: usb@a600000 {
 			snps,dis_enblslpm_quirk;
 
 			usb-role-switch;
+			wakeup-source;
 
 			status = "disabled";
 
@@ -4634,6 +4635,7 @@ usb_1: usb@a800000 {
 			snps,dis_enblslpm_quirk;
 
 			usb-role-switch;
+			wakeup-source;
 
 			status = "disabled";
 
@@ -4709,6 +4711,7 @@ usb_2: usb@a000000 {
 			snps,dis_enblslpm_quirk;
 
 			usb-role-switch;
+			wakeup-source;
 
 			status = "disabled";
 
@@ -4798,6 +4801,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			qcom,select-utmi-as-pipe-clk;
 			usb-role-switch;
+			wakeup-source;
 
 			status = "disabled";
 		};
@@ -4869,6 +4873,7 @@ usb_mp: usb@a400000 {
 			snps,dis_enblslpm_quirk;
 
 			dr_mode = "host";
+			wakeup-source;
 
 			status = "disabled";
 		};

-- 
2.34.1

