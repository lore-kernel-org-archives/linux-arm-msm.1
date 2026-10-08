Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD713644CF
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439705; cv=none; b=XMq1wK22NIvEazMqT3SXpY9Ud0FOs36Fokm1m3gaUmqarnXsFAFnqFpsima/k1rfQuB2hMLamCxYpBkspmy4DzJllLIGrI+Ncf0AVQSpPxIM672h4pwDXW5WBnqcuX8tdkVFtlM6qtLapunLUPjTXGHyF6dJLVp4AnpOvDaA6Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439705; c=relaxed/simple;
	bh=OvBSsjeHddzIYW5/U7fHCcXJOnMBDRCo9xRHfUjINSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UpmG5m3Dv5KAkkj3JREUpbDs1+HZFvcLsYvcVkdvMef4LO6wUiI6FUyXM/JiFfcD0LIyEB33CnvPz8g42Sed9NEv0GSiyJAm62YS7xYbyzIKqoylOcGnZT9eGAkuXNiSMtPy5Gip56Fzhe5iQoTAW/oiCuDSj/KcnbWMOAIOuCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avcGMy0c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FiZTqtbb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avcGMy0c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FiZTqtbb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BkMe2775613
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y51R7FYOnKPC3incbl52qZ
	dD/4ibI+72hlT2li/XIwI=; b=avcGMy0c0nbhNW5m2qCKFj8H9Vnz2bL5wf5LK6
	fkFLm7uEq0Xf+9z4E5n6QvKuS637aKy7hOZUcN3mKpERI9TkP+e1FG6X2lfXxFql
	wV4pprrSFfbyScSzXVErEwyP43g2ff8OSQ3OK/W0OcfLTiHYUjtYi3o6k7ivOVtP
	iiLCXU6aMwP7EO4IGnQvUnEuYhou2Ij6OadqxY57YZDWIcOKTrw7lVaeuK00L7Y8
	gRH700/khduL1tbY+TkagktvuaAZ1LgfvOP+8Mcj4qKFTMBTUFv4Sah0QOnRNKdw
	F2gUOwW2Z3VOleQCQgXsklTv1LB4MlIsJV9CSd037LIV8CBQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe69cys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:08:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f80c76e6so58017295ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439703; x=1792044503; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y51R7FYOnKPC3incbl52qZdD/4ibI+72hlT2li/XIwI=;
        b=FiZTqtbbZah1kfhAwACrj24IKqE00tJDC/rYSZ0BfSdodRKT0Q4YfYqWQjvVYEQo6/
         ppQuEgZ1xVvLL9kyuTlpIFU9qe+k3mFtmaSX9Z12kK5+fgXLQmzKaBUD++rHVj5hblLq
         0arAxnTxczf8l0Ebyh8Bgm6JJVnT0YrG3PRkB+eTs9isxIa+8d6zxyWB3LvRh3M1vUdX
         c9cKIOhvaGETwNJD+9tMp8RfSVYQ+S/wC7mupXDcU68kNqrgcW1Oz2SR2G9cAiIseZLs
         wLZFmims06uxBbL88fUL1NqiZAoFETV0i7ISO0QRPCilwQd0SzExuBbVB96iI/KdvJVE
         Hqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439703; x=1792044503;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y51R7FYOnKPC3incbl52qZdD/4ibI+72hlT2li/XIwI=;
        b=mS2/a7DpNDEapL1Xz7ZApcvjaydDLRIj+pZ7QX4YGIL8DJijLEb5t0bu+Lut3NW4ji
         aW3bSwMFAu2lmBk78LOxh+c9nVD+A/9mtzJ9oTo0VSaQ2GvASMh6/LHvq6vPTaMGCGMk
         acBWLunQyypmxMfA5YM35iqNxCUCskYDMzfxOl2rj7W1PogLapwJTDgtoXSmGPzcSAEP
         qPURVergg69QOLpT+gkT3/U2WMHXweRSwsHELQ8OmxW0BPvLBnxDiXLO35VZABvtxu8t
         qXbakAR6luMeay7qrofe53XXPc2T864VHOdv86xrfRgVz0uEuvdxkok52ZgtcHenjazv
         pshg==
X-Forwarded-Encrypted: i=1; AKwUvBx2eMYi1xmUfL0nDrRgXN19i9TQ5RNVzJPED+ER/4A821wwQCX9oC/mgFm5z01zWiHBo2bdpbtZ6daMlWB1@vger.kernel.org
X-Gm-Message-State: AFq9FYJNTZu7LZUG1DkkZsL881KAd7MJtrkU9TbDkTuVC/prX/FPJSrX
	W3KbNwFt/O6evn8m3Q3/FaM6IINNE2mM8RA91qQuI7BaHldxCHTOAbBK7kCoaSbgfmsiBOROBut
	6+ySo4KEOvEOVFUahMp0+BjBB/r+ZT/Np7a3nuO4Xfx4ZtAe+DbevPCgBCz0gpeJtdzze
X-Gm-Gg: AYBFou0hZAgIhWvatIODOvXuDdw0XZYKGeGL9UZblcJinAXIlLRLlQNpAs+QtJWafM7
	6stnUOuyn1MwVbYqa0VnfuJGq+H6/b+I3arZZnv/DxTtG1upR0mq3+Yjsq8z1v5Sw7xbOBBYGUz
	CFBSq11Dem68B3ZclES0wwvN0Vwq9AXuEcU5lsoKHZHoHOqTM0+Icx6hIXgTBT3g2dyuok47z2B
	NedP23naDvVLtDjdys2hwTNJIOjEZ5CZcIJOvQO8Tptu4L7JsvUxuNah6eIpb0U+wYdpKwMhMB2
	pWsg7ERiUz8haOjNh0OrGQ0F+jkVanMhpLzCPoT86ku4uvVZ8aPbBqfQ/bx35Y0HHFSlTiSEdYn
	0tYKpHIj0DAITm/O1RzTXKYRI0PFbCJdbIjMcshphRE1fAow57D7Ae6AVbsZ83A==
X-Received: by 2002:a17:903:40cf:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2e712d5cf3cmr15423545ad.36.1791439702718;
        Wed, 07 Oct 2026 23:08:22 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2e712d5cf3cmr15423355ad.36.1791439702190;
        Wed, 07 Oct 2026 23:08:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604720d99sm19992075ad.33.2026.10.07.23.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:08:21 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:08:05 +0800
Subject: [PATCH] arm64: dts: qcom: shikra: Mark tpdm_dcc device as failed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-remove_tpdm_dcc_device-v1-1-48574c6ae6c2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEUzx2oC/x3MQQqAIBBA0avErBOsqKSrREjOTDULLTQiiO6et
 PyL9x9IHIUTDMUDkS9JsoccVVkAbnNYWQnlhlrXXaW1UZH9frE9D/KWEC1lhKywcc64tiXTE2R
 8RF7k/sfj9L4fiQVH3GgAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791439698; l=1092;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=OvBSsjeHddzIYW5/U7fHCcXJOnMBDRCo9xRHfUjINSc=;
 b=FbcfslXNTzXknV01qw50WD3s4B2U204v08g1aO/+5gs15Pnr7YwpiRQVmvegk4lIq5OJH2jVv
 F/eDsD3piqfCMcP5Y92niP00yJpCG1Pl1tv3F9mQE6SR/4L8nLRsbTC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: BliODtFlxmV1kwDr4DnEK2ewXVZyRyYF
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac73357 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZSfK_JQ7yDpkEwMNKKcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: BliODtFlxmV1kwDr4DnEK2ewXVZyRyYF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX79TzmfcFMeWv
 t5bksHkhwYck5Zmj/Ir9Qfh38Znwyv1BZ5ruilnt8fk3ujDvUOdsnx6vVbPcF7u0DubT+V4BYOG
 LJFZEtzmQe5j3ceEdKnt4WEX93uAI9HX+hs0BvGL1axVu1n6+u+7nvKUzvkPcQnEj8E7R13i5ui
 vv0xESoEdcbJkYIMLBbhkEjrjun6jPd3J8eI3jxH2kXBOwtx9QwGkC1dO79LuRSo4JjAIJq54Ke
 e+BdV1gCK0JQismB7JQXU6GYctgkv5GbgokKXfED8NAGqvf1F205qYNIFVcFdfASZXY6RxQTbJd
 F5Mf6IMmUsmV55xmVGbK+B8S0AQRCb/afapQNybi8yoyR3f7g7ca3HiifngUnobx9Bn3IM22Cmi
 xbcw165JrvIX+Pr8HMRAxA9zpQVufH37s6kdmAdFOdGCS8anovo+2SXBvEbzfGS7iKtNfzSTv8S
 OWaN0Uo9m0VXElb/P7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXwpnBDGJ0H/CL
 IfgdLxrrW+O8N39lMuogChw5MtOUX/hCk9UyJiOhAPCyICGIdk9lkk07dckryfezUPLuH57RXVx
 d13G8yc8/H0bW5rgzspMlaUYw73dfeE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080024

The tpdm_dcc device cannot work properly on secure devices because its
required clock cannot be enabled due to a hardware issue. Mark the
node with status = "fail" to reflect this.

Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 205e70ce0748..13cd0f3ff416 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2875,6 +2875,12 @@ tpdm@8003000 {
 			label = "tpdm_dcc";
 			qcom,cmb-element-bits = <32>;
 
+			/*
+			 * Clock cannot be properly enabled on secure devices
+			 * due to a hardware issue
+			 */
+			status = "fail";
+
 			out-ports {
 				port {
 					tpdm_dcc_out: endpoint {

---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20261008-remove_tpdm_dcc_device-c3bb8b55d87d

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

