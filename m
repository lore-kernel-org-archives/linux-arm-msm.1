Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801C386C21
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846131; cv=none; b=O9Lb5iUbkBcyTQcghVjWiDn1hMBz2MtdeZPSrDI8f6p9KHPaq5N8g/fXoF4jP0k14wReDNxveYsfD7lvAwsvXBFkgcgNbz49Vb7zhaOX7fubFItL8cO7Hd/l6XPzM204y0AkAcaEqG9bQ0hq8ZyCCVvPU8kltTfvKx8u1TngYPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846131; c=relaxed/simple;
	bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNtfYRzkAQv9r0ZY8vnyewzv76cW/MlSqyhJVugRvpb6a+qJBiqr41S5HJG8wvqQnh+4flrDJilC35vIQIEkgBwBvznDo8FRWfb5d0uXu+zD+YoyXbJ+7mKlGBMvO6eBDahzcgy3mId+UXuRk5MP9tKT6OLTOQFLNBa9ODLSdws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAAUl82q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PU7SXvOz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAAUl82q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PU7SXvOz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CDAY3034177
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 12:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=; b=dAAUl82qvTMLaRjz
	rHWWQg6Ohag6FUBaFyLIaHzlH7MWJmsVaWFZrvctlZMXhm7obqO1ntQN+md1mAc5
	lJuPhG1thi3ntgDRLe2+uragNwXEcbgOV7JbtQquDHpNmMP0lfZZSblOENs3IkUE
	30vij0xlQ+ErRopmnFTv8qeWwWscT9SOG/r2COlUy0cic3PXhdqD+G5Se7je4B8v
	vp/g0mvYQejLLz/ZoX/ADb5dnc/QSUAaIADPMo2qfHc4R/purUmU2ws4857lyF/5
	7rX9YGEwpslEAp/GImfBvmx6CfkrEJV+16G3Kw1AAVtoW4sB/a8J1gTlhWi3yD/4
	tmOlNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3qm84r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 12:22:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso445367185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 05:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846128; x=1786450928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=PU7SXvOz6gXZZct81Q9+VqeMUsWkDNrQEr+eWbcZZ0WeybxHcYTq8CCDGTCk1LTQNk
         qv8RuK0/QYC0zlMzU1RA7Hd5PgbOQFeXSXOwc0Sbn6Gji0yKBsyhN9ilJ1V5+2pTgEcF
         6iUezMVczTRD1xk0AHv0eJFVGbxtmCOZNfF2l/OC3i827V9whD4IkNr4uP7MszCPx8th
         OwhK6dX4fKlac+5aHHT5diAgrMqbFOmj3lN/hkq3wcsd0ebBKi/LPTvpNC+rM8sbPS0b
         dBLtjfwf/n/lppg+74DQkbh0RQnNA7xPEJhSY0rEArVIOjKseVcaR2hf0KRPN7bwpxE8
         W2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846128; x=1786450928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=O0BBYDA0NbnzM3E6NTn4d8Hz/L8N483bZ1Gv4uV+Zaosf6x7Ij1qUmwxfGzLMs4XMB
         76XTmIGWE+ZIgauHOKKdYKM77NLsDyBfpWv4FatT5QChIdcQles9KmHaSSE0WXMc/Blw
         z6uC2LB9yD5AGs53kS864u99LnyrPJWM76FB9PameZyQrLd/jDH4TKJdiIPhZw2sHtNp
         P/dALaiPed450S/6pP4ElbbHXxPyVLqCZgMLBYKYpK8DsJFvOm72Znh4yoyeSi2ARI9J
         BND5g+TXEJlx3dgt5eoF/7/14u1OkozhK582VQp+tSLpjiWIcqNA1sEqOIOw3FwbpIi/
         cBPA==
X-Gm-Message-State: AOJu0Yw/moCF/FYzwD4vyOH9j7ZZ5NkR0nZPq24CqT+onAbLZcyt5lPo
	p2kOfF1n8U1IxlLMn1Ub9fG0HCbMf+HTegrPb/V2EBYRhi1zWmR9xRJXt0MFZOxw871HG95bPPC
	MD0p8F2dEAKViyu66rxCgcqaYZkC6jqefuQkILPMSb98wY5RJUxVV/JtVGlF0ncChpJ8T5Ab60T
	82HnI=
X-Gm-Gg: AR+sD10Ab27ru0DksUYcM6TbhTdsDu4eutYwqdaKYRkz1+JiQkTxAzO0vJ02lJ6l4sC
	QMNARU0jD0/RutTYG81W0zhY5qUmgQNsJxydHpVlyXZu4C/gtSYtTPPvU8ZlzYmX1KxyvvYtA9J
	59LUoK7iQmayQ6G7Qxo/W81DEdCCRuDEXus+hSx2UVLJRAN6Sj1evofbAEerKaWbrV85ODaAa/x
	wKQ/rJVvr3W4yKklcWqjNvcIQH1adUrCEZxrF1Gl3G+qQQ5kutxOJjBCj4ebuAWtv6THuVvLGpY
	myb0vgictUYtLt2nokhkO46ujVyvnchb7G5uN80rGJoXYHB5Vmsh0YqMh5w2AFv8t9kyxy7jFm8
	CeJH+Lcg=
X-Received: by 2002:a05:622a:1e0e:b0:528:3b9d:2c7a with SMTP id d75a77b69052e-52b567784cbmr263837961cf.21.1785846127901;
        Tue, 04 Aug 2026 05:22:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0e:b0:528:3b9d:2c7a with SMTP id d75a77b69052e-52b567784cbmr263837511cf.21.1785846127326;
        Tue, 04 Aug 2026 05:22:07 -0700 (PDT)
Received: from hackbox.lan ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cf404sm42940134f8f.1.2026.08.04.05.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:22:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 15:21:42 +0300
Subject: [PATCH v4 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-dts-qcom-eliza-add-cdsp-v4-3-fa593983e486@oss.qualcomm.com>
References: <20260804-dts-qcom-eliza-add-cdsp-v4-0-fa593983e486@oss.qualcomm.com>
In-Reply-To: <20260804-dts-qcom-eliza-add-cdsp-v4-0-fa593983e486@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqcdljeoFq9W0KTssF8ylgJlXzERbtqo09GVKl1
 xFq/0z8FLSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCanHZYwAKCRAbX0TJAJUV
 Vg3aD/9JU6mZFg2m2G9y0kHRO8DnlTcBdO06XOpQza1Kg2SPpwjlaXVFefbczDYetL1rvUWtQ8l
 aio53el3n1o3GmJyCZBuUAeM+e8ScQig65vY8N2IZo5hvxFI1U9cMogP6hhIvNOS+2tClS5qTBe
 FASeh1IfMd7tZBMrGYH4Zwo7wrWPtyJf3O2Z2/rstwYJvxC2esaGl+7dXQUW8ZahcdzIMy4AsDR
 WGCwiVg+ar7aZFSBm746Wt0trOZZt0glDU7ERC5TcSkLtbm3HXdZfwZHjL5Uk0zFNmiS0qhKihe
 Y0deWwSdxc2gD3FPDy3q7PcZ6nfjK5vh1sV4saB0wDDyyxYm/JUd7HNjaQ2JOgn5fgtmh5Z+q+j
 P8WN4Uqwu85sYUUG/7srf1pT5fttxzuHZNY/U7eci2lrg7TKeRcBN3EyOcn1jMApvnhS4B1ahR3
 AZjbcAc4XFMXrxZJVawODQaDDBQ4uHzFo5+rHTqCLBfJ1mJC7XyHEwF65eJLsR8otODJHE64AP2
 3ADYy00o78a9Y/IZiVlUkNCjZRV/jyr/aYpTAqcLrzUvZWuyyucuIhrTovs6INOB8KyMyjKnD9z
 VI3zcrBJOu2jNpuAVbn+rrryOWn8hiQFrvr745zuxG68vOxbfDtqVFyvtc8D1ZS3ay5sDqIaHLq
 cH41PAsPSI2a0Ug==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: j-wdDqqvWhL2FDBHrfGdDddWAiRE6siL
X-Proofpoint-ORIG-GUID: j-wdDqqvWhL2FDBHrfGdDddWAiRE6siL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX9CFcSxYaAYXB
 nIOEDHfeM5Seq50nwZCfkfVaek1TZC4HsHBasLkZZ5YJNvXRfOETOCLpnFVD1DN48T7alceG1I7
 GvB02HuNoeKtWsze5+HvBuk2sIc5w2MuFtQ8lyDApLYOUcETB/6y9puLQrNeAVxj2HLAUWwgr5x
 U+qmxsoFmv/EQC038+2Pl4WY5B/0sgvVbw1x088gvIybTkyl2Sfgw8xe7pk74MQbQ2ASkIRiN6v
 9xDiHwW/UPe/EHex+91gU96OtIZqBXVuXoXKug1u+N7XQSFi+ls6WkZYL4ombrAMAOD3jgyHOgz
 py5ml1oCf/aRmQL3CDf+flKfEjL2mFRerbYec1I/RqSJLq/TpHErrp0mCVjNT+4zzaYTWfkM/VC
 nbJPlvE67gG6vowHIzLvfV5xOrWJbKDA2MUYpvb7UxZYXeB5CPtj1YUZUFFRCz1unSqltcYxGgh
 MhNip+C+oU+xUHnA7zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX8Kj3rLZSVPXO
 csffFr1JEW21784lKekXB8wBw2s6xPYUqGBXD8lgtTpH5X3azb6AoW2vzNQxP1yKdTkd+sIrMkA
 wbHJ1SZfvT3E/UMBx3myTb1BBIl5lk0=
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a71d971 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gskBRPyYVKVSocykC0cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040099

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..c55947f52123 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -381,6 +381,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&vreg_l12b>;
 	vqmmc-supply = <&vreg_l1d>;

-- 
2.54.0

