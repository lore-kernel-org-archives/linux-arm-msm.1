Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAAA3D5C1D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260751; cv=none; b=hjdqWDTVPHxqtHcELCMePAO/1IvuAXcHCTF7GmjmOjtR4vz+oc2F64FcwkOTFLGQ8bz+oa4q+6cO918zLchpbNMRKldqnMdLrU89p39FqRBm9chX/3m/aRhdmfG1QIZVRR1tiZTjZVKDpKFtcTRYeTMN+fc1mzXXY7l8Jr+rcQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260751; c=relaxed/simple;
	bh=FtLHHvBZP3IdOOc774WR4L7i+UG2wLsyAZrLBryavq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ublF97O1hHo15XvQ3f5rrarm5pwi0wYZbaeWOk/kra+BCdgfDOti+3qL3eEYkb1tbcZl+WEXnKqOUXP6KKNMJiagzOQdmF/4AW2eSP2GFkhil96i2cCG9txCvq5n654kLoijA/zomixzbdYfZJ/s8kLsseprSUKWdCKJa1AuT6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvwo2ANN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHrQ5FKv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvwo2ANN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHrQ5FKv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEchks2996738
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5nbKEu6f2VBQemGVqTJN/Rhxv0wawgQC71gUUGmCNw=; b=kvwo2ANNhS5WE6td
	vEyfITPqBV1DTzIsVmBdxmqbGFArDgj/qsr2V/iNCg1p76daH+nCcE2yVXYTKH+S
	K99p5SFfeA2JKHrCLMPmWXA1k3wbcit90iF6LF8306Ejh+qx0/KLjt2bupL47Cgx
	FjMJSkl5Vt67/L5cuv5dVgwlnvM6HFLNVQxD6xLF+18x8cZrYjuFJYTw9HEzJXSX
	+bce21Ioa+iX/7lNyUNddlqkCj0ZxE2ZR3zvPDH92umR9Pu5iSzMYi4RktST6NhN
	AW7DwNkyVW9HBvwjPM677rtSmJrn6V1krcwJd5kEy9Z/mJJXw2ugGa8juPJKBNTq
	SJ/v+Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjjx7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso200105a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260744; x=1785865544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5nbKEu6f2VBQemGVqTJN/Rhxv0wawgQC71gUUGmCNw=;
        b=YHrQ5FKvdDGOUMoFLNidOwe3hVPs7lyLy6LVgdfTpWZqHnbdo2y/SF6ysfyHmVDflN
         maJR7QgISUeUDjbfvavQh/koMSL9ZG86O4uZ3xJ5OP0BqceXeHFxDMZ+EAMwGDUmWNqY
         c8eim34jZNguQFI7PZ5BcEHI/vof2cnPaR2WdEtha3X4qbQ/I7k6s2J3N9I3MKrBNfa6
         KQ+17SWNIXf/3+h7Va2MSacbUXm49g5Agx1n602emHzo3vdM0XqDon30FjxmgUX0grbk
         9nQfMpvh1UaYX9tjeV4Bvk20pSzI2WPmXGzhkXB6Agw6sZ3/KhnUUtYr8hwe3qRQsN3I
         TbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260744; x=1785865544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5nbKEu6f2VBQemGVqTJN/Rhxv0wawgQC71gUUGmCNw=;
        b=o5ySMzHGbulzqkeT/8uEVv4PzXoqeuFFEaYBq0nn0Cb56Mv90fmQSDzvBQkXIC03/N
         K6FciSdAG3Uc/Z4sbsvmnz3dFmrQbpCVJimwG6GN2pdyXj/b428aWpKz3cOgvmO4FVQM
         50X6erouRSbej7mVWvjpVzbCN2hk6CCDRGt+VlOteY5dxD3Nacm3qggHs4Gao6c9gGlo
         3TAb7FFZKWD2XvmJ7BEiNWhBc0dRyX+oAq6/CuCz19hx8AlLw9TWON61cbfaXcOuxSk5
         qM7psw62mQ3fhsmGcMUQdHy87VbuTQ4LXXXGavlYO1ZNIKq8ATOZ48PTq2uFuGKmhwLP
         8Evw==
X-Gm-Message-State: AOJu0YzypNl6B/e0cdLXYDpFo/kKMCSthF+PaEyV1N1w9IoJcg0Th2U1
	UHdatY+/BBJCt8RgJbEXNpwos/Ykl6YytI/YA6foljg2QDFhCEcq8P2pLhGcIy2vigMJFyZL7EW
	va/FFKx0v44aJSQvPC5ianI1qY+zCVObnOPWHFzOocm8rTMa21encBVAs1w4cITfEYlFN
X-Gm-Gg: AR+sD10AOOI3qfwc+2Q2MpawoKxTCSPJF4e3X5qOyGp6mohyCi/1cnz66d7FqkOdjEV
	dOERQTcO7KS8NGI30xPc7LtU3C14Pyeak8rStosvMfFFOsYG2yW2n0Vg0T5j+D23Ga2QP0ib2Lc
	aPNLDP/VVRmj5hjCrEygMuvVNTbVXA2OLfGVd5HbWbOM6fNBs7TENm+4gK/uAg0WOXxoh6ncuaq
	4bY/1dfrd6kQBxL0wmOX3tbFp06dPEdFaGlmPFlo0R/15RUXw+Y7Sgxz230hAXje75eBOXtU442
	5eY6evShlAa0ST+79QE2lAkPWSABVB1KLdac0R12pHDBcFOw3Iqkdr5AYgMpps/jxWGSi99a1N1
	PB/f34JYYY9gYR1Vais+LPu24HGJbtaieBjfFEILsTVKMzfYfF7qRCYQxqIsGz+CV9isVckb7Ne
	VY4Rlatt4nOQce
X-Received: by 2002:a17:90b:1e48:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38f6a479f10mr3347995a91.19.1785260744486;
        Tue, 28 Jul 2026 10:45:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1e48:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38f6a479f10mr3347973a91.19.1785260744085;
        Tue, 28 Jul 2026 10:45:44 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:43 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:35 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: x1p42100-crd: Add qcom,tsens for EC
 fan thermal management
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-7-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=1142;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=FtLHHvBZP3IdOOc774WR4L7i+UG2wLsyAZrLBryavq0=;
 b=Ghx9jnGnxQm+67/x5HlgjMXg50hEUdmvmsMU78ID0xL877ZcuHdlsH7yZEg9D8+3IBpikTGrF
 fC/onsNLcxMAlOrJx8X5nxO8lJG+hZT7VBYYq/a1Xd+Sr/h3ZkRts7m
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: vn1dL6GeQxJ2syroF6VWswSh1W2c42FP
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a68eac9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=51hZXEhXtzUsyNNNMF0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfXzZUxzdYc4XPe
 7/o0P3fRQbhUSGX5yB/LyuAMAfzw8vptEj3z0+Va24SOa4be9DAd9c8rrB8IEYFIN/rnKTj0tJV
 6IDU76DMF6EAtf4FyGOazoaOFocuHp8=
X-Proofpoint-ORIG-GUID: vn1dL6GeQxJ2syroF6VWswSh1W2c42FP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX9+AM0JTQbsjj
 40mLAuW/dK7uaN2xjQ+PARDZacwhz0p+qr5VIxmR8jjCE71vaWI+Fw2wqqlT1P0V36mCT7xXyb8
 IBR6onLm6YNNo8uoCi/Rtmy7fiKgxsawPW85CZHtr2u8S1OwbH92THWnOexF2VcXnbwjkIiBsCh
 kgbGxphtvThKPXUZa7Md2Dnl/LeEdqu47vdc5OzsAvltCx6jbWUUyIcC1gR4nrsBWSnw5sljctg
 0b2avhqb6yuzSFhb6m6Vc0QBXAC8T4VIO6EGGe1QSNCHIvQ+5nZg+n8q5AF1Ne1dv7Nr2WC3gyy
 pIt0aPS7eQxbodTkRpU6dm/tO+XZBlpXV+WMiemz3Lsbllpo7BwMJoW5BvNisSrEoAvtal5LoMe
 iheA9aeLtm3CE67w65u9tzfUm9Vjotb1wR/Hf5iqvZXWhqxA6Zq0ZYp4DmdPvovF3g2jTFfB3Tg
 y9fHwxtUi2qaxYxRT6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280156

Add the qcom,tsens property to the embedded-controller node, pointing
at tsens2 and covering its first 11 sensor IDs (AOSS, NSP, GPU and
camera) whose readings are averaged to compute the SoC junction
temperature periodically reported to the EC for fan control.

The x1p42100 is a reduced part: purwa.dtsi disables tsens3 and deletes
the CPU cluster-2, CPUSS, AOSS and upper GPU thermal zones, remapping
the NSP, lower GPU and camera sensors onto tsens2. Only those sensors
are available to contribute to the SoC Tj average on this board.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
index 7ed4116b9590..b46b67c5e436 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
@@ -19,3 +19,9 @@ / {
 &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
+
+&i2c5 {
+	embedded-controller@76 {
+		qcom,tsens = <&tsens2 11>;
+	};
+};

-- 
2.34.1

