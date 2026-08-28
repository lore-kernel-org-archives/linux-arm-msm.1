Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FEC44C661
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920695; cv=none; b=KYdHSMJKE5AvMOgrp3J6HpA39NQg++Jfk5S6IFTaGOXb6aA1NgweZUBW3QPUQJyA7whXFNvKPkPcTZFC6i9H0hd1GJnTkbbY0iP9kYI0RZDurCqJINuf5IDrIdAwuX42aBel0m8mEQ24HdKJm0Xm7jsx4yFieH64QlVFycwRarY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920695; c=relaxed/simple;
	bh=Fw9JFrbWkU5UPBGhv7YWEEZRzQdgkL2hA40UBz8DY7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpAMVQGfpEazmjqNU7BmsHFlxoM01qPD7iwLjKl4skwA0ZsfTeHnBsYDp+rY3PkovYbCWiHHRkXb7AVlEwl8mG2iu+ZKe4dGCIduV2QKURvkuM76+naXYfHnptWfnTfgmKlQzHcTstoXAS0hjiESrZ+xfEe/VseWqWn8BJe0uIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxqFc5HQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8tzVSiD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxqFc5HQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8tzVSiD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCaxeG1906526
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4lM1+q6xXZoGijlC7/W+owk7IWDOUyfeWxzVS/EqWs=; b=lxqFc5HQrT0BBLhZ
	yAW97D6hF0bmnCyRhYWY6K5t/8rfWuKA43CXm1WEpnx2EOt2yHc0TcquIAbKqVS+
	umSOSYe3I4OnZcVq7yjM4utOjUcLd5Qf8PN4w5CcU/xfZCfgGYCEobBLycDbANZ7
	CPYocQQKpggNZ0HJrWE8aIK9OsdVtyo5+V9VCvMFLjn2eB4VTWqb7rEEDijUIA07
	uIb8DdCUsn0asU6cuhNNoiWe8CCXC5yzRygYvwj/BDzrfFxo+tW/Ezl46VsXrTL0
	7dDirgtMuPOJq+xskWSKpb7U8mvfqHoJ4Tk4BWqjuPF7RcTSpnsTczdSX1se07Sn
	QBjw9w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9r03t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c8da50f8dso19644286d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920677; x=1788525477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4lM1+q6xXZoGijlC7/W+owk7IWDOUyfeWxzVS/EqWs=;
        b=P8tzVSiDlmoGRYMt/ZQ5fgsdfLjQoKMZD7YKk0Bcrjv+7JGp58YIyDpgIjUli4gqbi
         aE2gPXItNXbtcR9R/wOrSURs2kasHgtSmH2/StozngX4myWxdK4VCYT3WG1vkw3R9QaD
         mSDITgtFmUAFfL0MZPEBbfnMK1kAioJaum0ikW0Kvpwll+N8EbL8bDmu1OoADKt6cqFm
         Ol6IRRUpoqKacX8DfvI1owxB5lrtoGmrCZvi+jyq1/e/6CU3VKzfPKsI7pou+9oD53AV
         3DfBX5iBwCjU0eR8/G9qgIf/tkUfg9B9Px6Tv0EWIgeJNtiZvBnonLMT9IeRb4CTrzgX
         dEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920677; x=1788525477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4lM1+q6xXZoGijlC7/W+owk7IWDOUyfeWxzVS/EqWs=;
        b=ZX4VpVdg84TC1jfE7K0ItP07/wWxSz/20tTj7m++3uB3cHLx4izAJagfsFLUklEeiO
         Mi0cqEJ3VujlKEiw2HbyTAe9xRmH48o3IDIvrMdCjCwc+ayAlWtU5v4ihTuL3rilSY5h
         CNlXy67w3xDn8b5B/B6sdkxPyX9PELvAPLQoj5WaxvcI6SwL4tlXyTBHpY21G5H0iy/F
         BUGHhEBUhaR7Ho1KRZhB68iZ5y7iqSIfqpf58goFB0B5Y4ty+TcSeFCt2W4UlHo5HtJY
         mouhIbVywqIQqRc84ZE01euCMZG2PVMdWSO2yaCKkqib5wrwfZgLukfvB32Fs2I/oAEW
         Oc/w==
X-Forwarded-Encrypted: i=1; AHgh+Rp31Ut79Zr6tLa+lOws9IPenEDU9lscTjSWNqYDEk4448sS4CWLmKeotPIGVw5IbpbNsZtdWG4lJTbOG04R@vger.kernel.org
X-Gm-Message-State: AFuF++mQYzvG7d+/pKnsJwhreNZgIM4qhj+7k3n+tl5ajhFIsyJ3PsTh
	icJFjJfssg/FnJmeyHXfwIhQjpCwm3YdLhtZZ8ev5YwiOWBhGvjbFynidJRqt6xB/um/R13gItI
	rAWkKeoe5bzpvp4/6hNe31eE0998PGE9OtFM7KfVnZS/qaP6vvY2ILOfEZvGX3wSSG0rJ
X-Gm-Gg: AR+sD11XQF4VR8kcHMet/h7oE2w+XKgkm7O6POrtKLUsJ3yU2XmdjQOznuwGiAgsawi
	YZa8tguJDUa5Xfoip6gWHCucliSWysa19J7WCkOaxPbBfZPvJ2MoZ6MNdD3Q7G4a6GsXgYPxX02
	i1lLHKtORvpa+UJGUamfOFLyszJfHPCEMaFmcsPJbtTRsDZpOfZsI+YEvomQAKHPX3Fm7rB+KOh
	AXvud1cIGHxj2bEpe1H0ZPQwlUprl4EWc26M5VS/l2axYlNceHJ1Fl7tAUEEvKRlpvEx/YjkgK/
	cXcSl9srssPpXzZDTiPyH7RhZpX5ba64886qXb7/GthkLzvJ1Ca1jlB5Esn0xjZQIb6l3FF3UFx
	dyU3avc4=
X-Received: by 2002:a05:622a:1a82:b0:52f:aaa7:af7d with SMTP id d75a77b69052e-52fb9429a87mr71740701cf.15.1787920677342;
        Fri, 28 Aug 2026 05:37:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1a82:b0:52f:aaa7:af7d with SMTP id d75a77b69052e-52fb9429a87mr71739921cf.15.1787920676815;
        Fri, 28 Aug 2026 05:37:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:24 +0300
Subject: [PATCH 05/11] arm64: dts: qcom: eliza: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-5-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fw9JFrbWkU5UPBGhv7YWEEZRzQdgkL2hA40UBz8DY7E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEOa0GGzS2UQA+XHN9t8KTpN8DyflOMJ8R6z
 18T2wkA+OSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBDgAKCRAbX0TJAJUV
 VudiD/9S+eliGJcIdBcOR1X9zZusDWQve6TOgMu9oDKZUrqe/2hJlhsVY4fLmlpwDPfTtQMw38X
 0oc6OYbeTnwJwTJRVS+RIrYL5BzFtxhGsqZPTZ4mEm4XSpw6O+D0vl1uKZx2W8A3m9r/R7nCfDb
 D+lWRJxXt8zEPYn3ACf/i+k6qsBRShrEuwfUK+/DS1bQ242m+n4FNRIu+44f5CXKnuq4UXWDR28
 wkRZQKAhiGBUGz7g3jF2YJYdJakzZYElcv9aVvSJZQeWWWxaLhpzZpq3MmsrUjplnCXWU+SFnxd
 dlIUPF4u3/ZXog0oHIXd13OvKDfii5BfRovEwZgbalMyAwz3h++KlJ37HfiwDyNmZGnQEpwa6hT
 tdonax47qtZrPgY0ZjBZPDl9XBAcbITKshoH4TUlgJ3zGJDLJ1aQT1gtFIMMh1d5Mhl1pS23/m6
 Z1UjJjjWJDibnFkMmKa9xEmSHi5p4tESvWVUGoHhb3MCCHEp0hXrhZ8Dg1/8iGPi+UlvDQx06RV
 9uUhN0hU8/hN6D946IUZ0GPkMBMVNv7Ql97bSrTLQ7BQo9Dk3xjPH+8kelrR/FvU/1CsMd+lnAT
 yGGunAdXDxUCAYeZy7n9hnYHuvMN3Y9sQVfdmc7likUyVTglqncN5vlFcnabIyLI0EwwyujkLEC
 Qf5nQi3O5dmTyuw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a918126 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX/OCnG+QVTSfr
 9PZPxToUe+KkvVfyS1U0mNWznQLnb2PCthRDWh5S1UzqA5DlD++LY9qdv0Y+F9QglezyfHoxATR
 A7wqe3gwdfky2hHiWm1vMR7I6+1XvPA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX33eHBVCCvLDw
 627Vy5uGZQs+CnLeVXFNcMCKp1o48PW41o+YBJcvKQiyOdlFiATsG63Cc0gsjJTdvGbugYAtqe5
 1jSpwXllXLcLnW5hxWPh8+mRXYqBBoYtfUJocrdIiuZ1xaRc+P2r6a1oXLMm9DPuwCWb/G2fYuX
 uUJNmJJT0kPsLQl2zDdddyUKGu5cCGAMyJRng+EIqI3xYmaEbKBUMl5DhwUtuFYEleVPHPhDt8s
 aF3+aTHqtkw+UgI0xs88KZdwdKD59W0zSffvfpYZ3yLwEz+paku0OQRbunJI7nMPsXOdz99qcE8
 EEgMcACTH6O4tHJMDNmeyNcsfUPWokJ/2TehxZTI2s2Cu4VRVUNHVhkjnKSlwaMZlFz/5qrvV9o
 /C3oXQiD6FooElTYwbd8gWwJQpYdT6KaLHc/lp944alLWQSzkh2JmPNX8v4lG9VxU6JI85SjIzo
 8rcqWopWOQaDu0SWzUA==
X-Proofpoint-ORIG-GUID: J6JG_zI5EViUSDmdf_uSpdUGEsIfzK0P
X-Proofpoint-GUID: J6JG_zI5EViUSDmdf_uSpdUGEsIfzK0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 90825ab392ac ("arm64: dts: qcom: eliza: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 868ae6c34830..4cba8fbbc1da 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -422,6 +422,10 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73..52c4c28d1b7f 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1926,6 +1926,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.54.0

