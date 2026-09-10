Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A014494838
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049331; cv=none; b=kdkAaU/rA1SFBZ7V+O+Z3vTJQ7k5QrruGuKonIx6q+oB4kICqiBGCVbk3iLml1bKvF75qHQtG4zjoWMgsD/y5IqXRShr2VJOCA1bnDP/fT/DpKsryu1z/OXYH+awqh2aIpzFg/cpuHhenECCaJ6MaiZ0EC2r/8yBOx2s/Plo5jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049331; c=relaxed/simple;
	bh=PJp7at6YbmABjQssQHHtns6pe+hmMVd0Nnzb//pLNGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lX4le51/9h9N/SDkbWjgHcQHB7cPGVTy8VlU0aPDNlHvoRwP7CLqet5BY0LC6T2d9PfgqNjO1jDnNaW0r2cSfISlvbe0jSMhIxRHh1X2AhpvGWUIg7pTZs96FsotoTlE2GPnkxS1dTQe2GWElUBJ6WPs4RzGycmtKmM1n+mngKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIOO4oHB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A597FpSj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIOO4oHB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A597FpSj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7q6j245338
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 14:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xsa+f+27jsxypSSVPRpVMM
	g/ju4l/7cO2PJaOMBUNws=; b=NIOO4oHBcIOSEwcH1CMpjqjIFnwbS4Tz5CqtIQ
	5T1GEaxyl9UVtXKwKzitUiRK4FKyca8kxEgM8A2h5s3Opzhu8kIw/HNM4CzxBwXw
	rfc+kbnAYvhF7LoNjpYfF+Wa/5f+nMydlPxOKf+HU/YbviuWVBlkSQgjtVQyhwa9
	UuIwFKg/SyVCaxwQ48EhNucnbVT6kIU9iP8hBwDz3vzCSvCztGiIQkMLF5ZqlC1p
	Z0jllnxuIa+5bSOJAaqYEUk3Blm+hhAM7AQpG1Xo23/psM0Y0s9CG20szoYO05vi
	cRCftKkPqdubeXX0C5FKZ08+ZL2ebekXDR8X/Iw5aNcXcOBw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfm998-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 14:08:47 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6bf7ab47124so906872eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789049326; x=1789654126; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xsa+f+27jsxypSSVPRpVMMg/ju4l/7cO2PJaOMBUNws=;
        b=A597FpSj69HQ3Jd64jZWnr7EXJ6hj9htfyMU1kTnnixT4Fn86FRwLv5KMlm68LBhS3
         4hnYGh8PUiXUh6r1gqzagyG1D6WLTu8EUL0gj3lDZKY6uPvTzz8hGQ5rbjkA0dTa6QIS
         5j6HMHL/bNf4lAmuXvLywd5j8txskkE4+CCE4QI0Lb+OS+CVdVkOPwZnKsSqeHaFrSSY
         9GM4nbxlhF4jD+L+RZLtJMkST4Zo1MsDXrjSk3Soi+9j4SMw1vOXYzuawj1o1ZIvJJ9p
         whDt1ODphPLzfG4snXh4855Pgx1QhiGV8z8UMwaGGCEBEYcS05sp+0Iigw+HLwI5aUHB
         2zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049326; x=1789654126;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xsa+f+27jsxypSSVPRpVMMg/ju4l/7cO2PJaOMBUNws=;
        b=WZZdulA5CEFF5YhYc+KWzKqd4POnkhm8FwVF/AXpdhBxWa9fxbieZ/zH/iRnXIOrvh
         IpxXhRzn7Isel9mhqjbl7eCHm6yrNx49X0COXh6BeAGoQX8Z2ZC9Qpodx9IbnulD7rqY
         FswxBIZmHw3jMkUJaO99BgppXsGOD34j939cOdgkhdg3CwJ7XyFjZCUzxHEm/uMIX9GY
         Bzm5Ub6UxY9L9XubOAzcPiPlddxsqr55C/RY5A8D3C7RyPUsauEs6BGHnpco9DDjssLJ
         gKskq2hFBf1NGTscs/pB5VQDY3A5+0iR9+Njy6VpoEs5m0uFvCDshGUCBxHqoRXu1CFp
         6K7A==
X-Gm-Message-State: AFuF++lmhyNK2T6lOr7qmaicJrLnq0tZ+GDODqwJYydHtgRb3dZemJAG
	Gfks3etfbCkgpNrWCveyxNivft9iiwpZcRU4mtWEpuhMIggRFxTFz9mEhbMfexRlYYEqPT8b53u
	H+itFq1GdI2GzG9Tj2NkPFAAeW/6BHg6HChb/osorhVi+TXrV7HTRkz25kwa1XckFopijvNoWQ9
	3a
X-Gm-Gg: AYBFou3KqaspTduDWULqyELTWB6krjROfomsEyUNiEupTwRLYX8OHEIQ97dv/MozJzZ
	+VLJ5uH5AJXInuBvxMI4ehyBmbiwcoiN6Yb29SOhHbqHsDerO1Dpfo+EfLdil6h3h0ZbYdUBF2O
	q1juMR2YI5a3XzDBLeohl2ZJFhWusALz1UPE65dkj4oRBPD4MwRwaFweODPvS18FPbWRLTEPvcR
	zt/qsPZojGcBLw8NPkCJKUpcx/+LBJ0ytzEW4MpKSPZWh2SF4bG1Ha6hxjGquemj4pXK3dncycB
	fVUMKdmLG7vJkEAZJWDZBETPTiczhpRA2oBl3/72tcfCaerDS+NFrGOJ2WxLIwt+4vU9iZUA82i
	ipzcyDg==
X-Received: by 2002:a05:6820:812:b0:6be:4eb3:e1be with SMTP id 006d021491bc7-6be4eb3ed98mr5956680eaf.39.1789049326409;
        Thu, 10 Sep 2026 07:08:46 -0700 (PDT)
X-Received: by 2002:a05:6820:812:b0:6be:4eb3:e1be with SMTP id 006d021491bc7-6be4eb3ed98mr5956622eaf.39.1789049325769;
        Thu, 10 Sep 2026 07:08:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c494basm69712295e9.12.2026.09.10.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:08:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 17:08:35 +0300
Subject: [PATCH v3] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-dts-qcom-eliza-evk-enable-gpu-v3-1-806bf0fc51de@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOK5omoC/43Oyw6CMBAF0F8hXTuEDq/gyv8wLtoyQJV3oVEJ/
 27BjQsT3UxykztnZmGGRk2GHb2FjWS10V3rQnjwmKpEWxLo3GWGASZBFnDIJwOD6hqgWj8FkL0
 BtULWBGU/QxKHqHjIFQnOnNGPVOj77p8v72xmeSU1bejWqLSZuvGxP2D51vv3luXAQaQqLCSmM
 qLs1BnjD7Oo3Urju8G2kxY/UfyFokNjLqMYRZQEAr+g67q+AJpAGEA4AQAA
X-Change-ID: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJp7at6YbmABjQssQHHtns6pe+hmMVd0Nnzb//pLNGo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqornmBIN7oAX3fVfYgFv0vXR0ZXLqJyBqphYi4
 UaQeo0N90SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqK55gAKCRAbX0TJAJUV
 VhFQD/0eyDEQSNWpja7ldWoi9sap4iQuBgCTYeeOgUrlRSKbfOYW8NO9m35fcHkCDM2om2qIVWQ
 6w6e9/srQRV1LbaWfUxsK488G+22jlSQ8QWyQPqW2FrgeKthdUS8csvLZbVKOo2sVn04I9/ccAp
 YCylwhOhQjARXVmGWdPRao2+LJld8NI8NJssRoBcdj8H9dJdxko7VKNn1y/ljr9uFhzF9T5QTam
 cIZO2fP/0FDRhGIEoklEHE2voMJVUd6K8gFD2Vedbrd3T+RnXmAxL2KLQCDg238loqgVOtd8kfS
 iRkwpd/IAttyVU70UX9KhAeEOYbslwzHfEtV/fQD8CWjLcu5cSZbX6bBtmezwZ8jdHUdDPiq16R
 +aXfOapWKDxvBRHrGjJKOvf+ejBFJ+kCzVJnffR7YFuAf1Z1vRJqy8sraS7cNPtsGoYvyaylhpJ
 wmFN7KzZwe8uwqiH1CQi80ve/GwEKPzlkYSPa/HUaQi/MDuFCecTWWdP35ICr5aQ/qZqUYOcgXf
 cq8hSI+zKafNhAilwxZVVQA8aG3M7GUqcAg5Z9ROpprIvFT8LRs/DihG0CPa7ElcD+vhdCNhOBh
 dZXUXj192hyv0wpel1uMnpwgtdA7blNyLYnDYG339XAZ4DCEux1zY12fLDE5FTGA1TQF/0vW6S9
 f2SyQMVlrgMMaEw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3MCBTYWx0ZWRfX8fb0Bkor71Gt
 Gp8jKxOGt2QvlaRE9++JeIrVsn7XogLgk1z5wiFoFE+N/tLNwFQMZWCkU+T5Bc+XBkFxEtleO5X
 jZO61TAPICN3eFZCQpivEf5buuybA+s=
X-Proofpoint-ORIG-GUID: U8cgbC2Ld2K0peQVwCV6Zvyw5ZKdRk7B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3MCBTYWx0ZWRfXyVnDe4wXHHvP
 gBZZDi7+QMvQCbvICMC4R8EDv7a9g8nGKh0TOQqcdMyDcsk1ItsQ7JrRkgHQQo1mNPLWjkK1Ics
 6JhSg6qHVF/rUytgGRPA9HJLC79PTBpM3YTpqxVVUV0BhCFq/nY9ymu0Klm0jmjYv6YmlgKjTbT
 bu/nSzK8YwRPHItfd4kuG8JwpNfWriPp14+UEGadVOH07MRl1ZDGNLXFrkaaJdgdcaK0rU6xSjS
 O6vxpyv0G2bhZBe6zDPA9PJc4rueo1fcESEafUktdreLXP5Kz7DWLP1ITeQccaFi59RvLv28x97
 DvzsX7yHwzsgWAGsFRuCJR84ox4YuBhN039YVN+4HtgkajZk5fM9aUO7jhnYu8EI7J/f6zJ3xe6
 JqHWxI7jcz7XhOnm5avEKzvHt4yE5oEa/1San6J5sEJQkVu/kNVryt4KPFt5zRWJLqB/SlcQb4o
 pcUW6RcMgsB5xpd64Mw==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2b9ef cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=cfKdWksii-jdlWvcsasA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: U8cgbC2Ld2K0peQVwCV6Zvyw5ZKdRk7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100170

Enable the Adreno 722 GPU on the Eliza CQS SoM board and provide the zap
shader firmware path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260909.
- Moved the nodes in proper place, to preserve alphabetical order.
- Link to v2: https://patch.msgid.link/20260902-dts-qcom-eliza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260901.
- Picked up Konrad's R-b tag.
- Reworded commit message as Konrad suggested.
- Fixed the zap shader firmware filename.
- Link to v1: https://patch.msgid.link/20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..fc2d419cfc09 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -369,6 +369,14 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen71700_zap.mbn";
+};
+
 &pm7550ba_eusb2_repeater {
 	vdd18-supply = <&vreg_l7b>;
 	vdd3-supply = <&vreg_l17b>;

---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

