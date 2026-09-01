Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C32E46EF69
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250941; cv=none; b=ZNcASku7RRD2ON7kuadIOVZsGTAFpgr2VJIpkcxbDiIU0f4kD/DO+E/4IsfsPXZRC/xJpdL9mOd6Yo0vEOHfm2WRQrFd09xfa7Ak/Ffl5kEu9M/ihai+72IjGF0UqXckmhHZ1BJJdYVIOyGxgLKTMbWb9lzoGruQ43FzvuVDy7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250941; c=relaxed/simple;
	bh=7W8dlflfJi7kPJgIimIv76RQuie08B7ma5y2MHYzck4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qI8Q98v9YbbIAWj3kXa//hv5oCez7r8hLYmDAOXdhlO0QS78cj07YyxWJ6tHNJNipWER9LOB734ZaElsy0q/uhtmEjro87xEPy9ETVkS4Vjb1R8vFVjF/A58deTpd+SOdBt0yvV1JbhNbW9ZpdH0zQY7GreLqu6aKEa0kNa8vzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDG52/su; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGe8EJs4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDG52/su";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGe8EJs4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179QvK2321978
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XfjaGFuOKCHKjsex9Rw6ZY
	sXxZt9KMZNWFnFOl9Q/U4=; b=QDG52/suVAej9blk5y+w4kfUmv/hjGUWxsLkEG
	eeOXa4TWBuqDBoilSSNPo0s0oGO/XRVpbEcNIst03yntvHQDDs8GRCT9S3Y0iPEu
	s6KU+oFIaXz+JQdkAY+1Dh4kDzYZSfr/jeRkLGKv4HeNtyUdXq//dd+hF935uaAV
	vEGwsAT57rNXymaqp62T5ClapGi1MIJnTezOhf51cOl3odjnO8A9aNwbCVTtKV+W
	XDK4d1gwFvPWFUDRgs4NQRmz0gaH+UbAmhwBeYC9gnUuvnCj9TJEmf9iZN0fmpbR
	khIiZpDOhkechrYcOLNspcIY5q4w7cjZfFQY7OGEvigr4GGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchaw4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:22:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so648508185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250939; x=1788855739; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XfjaGFuOKCHKjsex9Rw6ZYsXxZt9KMZNWFnFOl9Q/U4=;
        b=QGe8EJs4iNNc8FK2JLAwWuNPPXaJBnXHhEQ22ZWayfge0i3/D8d/BLU1Ws0yAjkZb7
         CMIUPf2sa0lfB0zTBBUemFlKjnPW+8rz1nJoLjfZq2Sib4xTkzaNSqfGqomvn5n8BF17
         mDf8J1kJoGQcDui3dCSwU2e0MjLsFozmKqZMmXXFEvJB3ifVYHbm6Or5i5UN+/XaZyN2
         Gtbq3AcShYvtfGRIoiuUJgELVSMRotW5xNhT+sjPV+kg1qyenVQysWg0+JTeyK2NSeda
         wfVvVVC3xRwE7n/cQcNpvtZpJ6dQPIPvpHGmShzZuLbyYLZmyQyIa24oK0dWBy7brkVW
         qhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250939; x=1788855739;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XfjaGFuOKCHKjsex9Rw6ZYsXxZt9KMZNWFnFOl9Q/U4=;
        b=NrBz7W1KcIA1esvFBeYyylZ/AY4W3jzIkYZTSK0FvFHyJl0sYApA4vVg7UPcpkj0qJ
         dINzp3a4GNpBx/ClnbK0/g0aqbZ4uExkJnq6dgGYQhrNpmzXDoqtn81e2hK5Rjy8564b
         nMp1a849KrGj5HyEIBoPovLNiaWfdxF4BYe4G0XDQRGq8ffH6Jo/Ua7uFob3iRxPxQY/
         CxBrLJhrtA1RtlaRLcVx7bx/iZ9f+guBDcSbSR+gKWxZMVmSYCkl9gJ5yGjdvzf5AKNQ
         xy2WY8YxbgU5ROOi9OLcvXsgZ9RewWoMx0iRpGDBqOmvXaNvoCK7S/cU5g4cWacCU1BW
         k22A==
X-Gm-Message-State: AFuF++kJAr86RJ+IsGs9wAbVVRIFTJINYOP8i0ySmU+fK1FyJ+HR6UKW
	P7lXh47Vmfd/5M4TgNnzlWCR2DYbc26QXJNglapQeC4QO9it3iMbP/CxM6u6AQQhUmbNwnXCVon
	ocuQ24G7OxqddAUt5jagChZVSQ7HBVMkn6ALDE7UKNZjvH1XeYrkPChytAsA8X94KMIoN
X-Gm-Gg: AR+sD101p0Xacr46JTj1mDpXySiL3oi0SC6byHOzLBR41oVhoU1gFh0KpN8alUGVsIF
	61TUZcOR7q+0SCVatTPEMxgeS1JxGk2AkQXOGwABRf7lZRnVR4rZua3OssiZeo/sqLBJvDh7lSh
	U01SVsIpYl+WIOC22gajAZGiBFZRuy8lnTpbPDIfJ4PXu/1CwUjB46v8ElqqAcM1dq+8qWkE3Wr
	gOmvjYEclGfuhZ6eLKxIxaktHEvmBwYD7YVHrZ3O5Hcy2saSA0f8inzg9HV1ZAIIleDbxwJZB6e
	QNSmdtus6k4AOOYol4i8T/Q8osLxP4Kldj01Hh0GvcQYixcHEl0JMhvLlaSWtAfrYjpAnf61VGa
	sy82Q/zdf
X-Received: by 2002:a05:620a:1293:b0:936:a5c3:512f with SMTP id af79cd13be357-939138df43fmr2927323685a.34.1788250938130;
        Tue, 01 Sep 2026 01:22:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1293:b0:936:a5c3:512f with SMTP id af79cd13be357-939138df43fmr2927304685a.34.1788250933137;
        Tue, 01 Sep 2026 01:22:13 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3b86dsm3273791f8f.11.2026.09.01.01.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:22:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:22:08 +0300
Subject: [PATCH] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC+LlmoC/yXMQQ6CMBAF0KuQWTtJWyKJXsW4KOULo1iwA8RIu
 LtVlm/zVlIkgdK5WClhEZUhZthDQaHzsQVLk03OuMqcjOVmUn6F4cno5eMZy4MRfd2D23Hm6li
 6YEsb4C3lY0y4yfv/X667da7vCNMvpW37AorSEtuBAAAA
X-Change-ID: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=989;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7W8dlflfJi7kPJgIimIv76RQuie08B7ma5y2MHYzck4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlosxYTLk4ej0pM1JeEv58+Oh6DoIUvt0gfQuM
 +bDrV6sfpSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaLMQAKCRAbX0TJAJUV
 VsjiEACGJf1Vvf7AKSuVXVZChgo58N97+FU1VkOOzO6dp756tauzrxzHEwRTv8+E1E+g2FCXfqW
 Ai0V8KzF2rjsG7YVxSSHRS2nhP1dpDlYUVN5UrLfkYgW1rv8SB+QOibQ9oxpnZsLKIyBO12+ByD
 x1nQBmCqajOdHXSgpCL9m1jhzwNDJGUNOJqvq+P9qVi7XSXKCTBuvy1LBDH1/PqXlNkEJs/aCjE
 TV/nq02ZpaKD+gwcrw3Hv9O4a1XlKUpjn2vw9sJlc6pkyKOqWoEa1H9uSC54JuEtX5pL8YHIk50
 QHcJLGeSzTwqacdKsmoy6/+k2W1gVVhS72h5awk7H4Iql5IY9yQ/o1SzMUZCq934cLCSm1TIefA
 ggXmRXwa+DRS7CNYRSfk+OL3xQrf+6KiOJOy/+l8KJMnJwAAb4W996vwd5cjpA02Q3j33pLoUi6
 vt049BuQ9OiwOI8FfVUIIJWIlvzJKHzOpyQIcNix/zJwKgXuDF+aZHs4dquMkIhjDiaO0JMe8zO
 aw/xACbrIkxnltr5EE8FwWXu1qJDLSGtsCSCC9qrhqod/ZX0/m68/zf1tyuFbzeblE4NvA056UO
 LhFgwP9mU7isa0qpGE/Kom7z4+TmEKDo2wHv3Mx6baPnTI5Bi8WoSkUduzgLVdAs3caLHuFYVz3
 cYCrroA93imGTjA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Z9dJYlf7d1YCpxfSKZ4cUZpALyUdtoEU
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a968b3b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MAnxEFDIZuXvlbMpwQgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Z9dJYlf7d1YCpxfSKZ4cUZpALyUdtoEU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MyBTYWx0ZWRfX9dBF/L92OZpp
 rDA0f7chHCt4DKDhh0v7QIrjxIyf6jqbKgCb+Z9eRY9kPC8DZTARkJT40iUTnI7VQkpFLJdaRuU
 78enGqzkX/sa3FYVsAbSUFYh7MsV3i0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MyBTYWx0ZWRfXwU3CnXLxoKmc
 RBIJNmp5ESzZG8pcAUFFJ2+BE913nbt4k93RE+z/1X8oVH9wi9i6DJ0kqOrwcwL4VWE3HV6jH8v
 wlooRx/krr/0xmi1TUJt2UAy17EAUo4u7nX2YovuNbqA8bzZl+dUxHx2KnWr/MunBnHtFZ8yQgZ
 jUEpkVEmRx8hZ8swCHHvPEo26dczeDvD/9QkoTPGc+cZskWmyUBWFtsLrmdy7J4ioagkjtPGQ5o
 GEjli+Z0PNynuqXbczlbAt6YC5kNnaRwbZ4Vnr0bOtx0Mv7nAmU9e6Qe3yCAc2M+TESB7TPvfEY
 +3+INRGId7zOofuBgEY7ApDmXAcPqY/95p5PLmImTJ/lRFu//nzyOUmuuXRx44vfoNPdKS39I34
 y2rGGj6UKpf92HXZ8MXXgN7V+/KuIyMvyT1DtA76indKt+brNWIUf37RBTe5TkH95RmXLKVRp+9
 SBCbKJpXxuJu9NxFpHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010073

Enable the Adreno A722 GPU on the Eliza CQS SoM board and provide the zap
shader firmware path.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..27831ea56d08 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -374,6 +374,14 @@ &pm7550ba_eusb2_repeater {
 	vdd3-supply = <&vreg_l17b>;
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen70e00_zap.mbn";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/eliza/adsp.mbn",
 			"qcom/eliza/adsp_dtb.mbn";

---
base-commit: 1c8fe8863780705aba77893fade65f728e82b67a
change-id: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

