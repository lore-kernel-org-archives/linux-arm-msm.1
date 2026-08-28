Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F04A417BFE
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920689; cv=none; b=eKY8gGlqqC4VRUqj6xmyCXBeyln5rWW/m5upAoP7wxX3RRrW3QeXLJwvk+SaHvc4TCmV9tXynUidLwIGZRl7mkHttNqgbcfshIpzQhsP5tSsN4/On++LCfQeSMj5gl07qbsRziOEhhazwtYvXnnnmCrsY5BNKZWOUTJUS3IcOTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920689; c=relaxed/simple;
	bh=is6Qiuvtglru2UusENwCSUsVVZ+vsE+6GeIb1ZRKfgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kojEKdym7/yluBju8dQzKkp8Rt+XE9bzFst2qfxY3TGw0XI97Jwf1/cZhG6kYXbfIT/Y4xNiDyakvPhtw8VOZMxv/5wo5dT7Z/TGkHDb3534tpWrwK8mfLlTY36dyBjcEszd44CsYkC+ob/FoD3T64o5/JrUt+88YzfURIOJ+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzBgTY+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0GNpLxJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzBgTY+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0GNpLxJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCb4231906653
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utgiEfXl4FIAOFXZb+WxREMZP2DN7dLpysdPjPzWV/A=; b=QzBgTY+xmx9Qaihg
	uSbmHFH2jx+H2T3rYz1IXTBL25B4AR7Ob8Lm8mYlv7fw4RE2nvd3mq6ls5gO03ue
	HIhdCtwj+b7ZbLnu3mixCSMOxajuekHy3VYC6YIjfeS+xmhjm2TA0sfKMQCEpReI
	IW2zjgq598vMg9SlDqvrCkas76enpUG8UKOH1FcWOx0a/GCIs9Af7bb9ZUCq5e6k
	lrepp+2lNGOP6Adrf2KbQ/Rp23J49Opuuh48gnF4thZUewy7Chnt0v5lgKsH33mW
	Bnh4kYaUGk0d7LxU4/ks3xEahwoRyzGTKrHkgp8J0U+8c9lBKX6eczkDbyTidC38
	+g6UNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9r03g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so24106081cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920674; x=1788525474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utgiEfXl4FIAOFXZb+WxREMZP2DN7dLpysdPjPzWV/A=;
        b=U0GNpLxJr2qQBrHopjETQaXKIy1DQqKo/Hg2a+GGATSnRkIIU5sThk2KQAYIkgItfQ
         DNtj4veQN5W9lwiFCKjy39ndR7v6V2CIPlrub5EkToYf66/6iTXHCknuy01SA3+QY1M5
         YVD3WhLZ6+AZvwrsbjmls5HiVRU2sjd/9/KVckpH73s84BWpFP12bG6G2ugDkfqKqk+t
         i2z6E9EVu6QkXghzTpB1+c1U0SvwHI9EhM9M03wsYPhSEDKS+oflS7SRbbkVWcAh0WgN
         c27MtRuhX1deMrew1mriH4WRpxtvDW4D6p3dbIFWA/CEp6HaM9+UNcCPJWraoKUqT8Fk
         bG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920674; x=1788525474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utgiEfXl4FIAOFXZb+WxREMZP2DN7dLpysdPjPzWV/A=;
        b=lIvmZgzZtEUkNzFKaSy0S2syz0/cNYla6/G6nu4N2zrfdBE5zAclm8QKTeQMyPz7kL
         fC6PKVY3i/QkulBOVGeeD3txEACZL9Qj5FDgMaMcVAxBFqQJdl6eGqH9ZzTntpeyWNXB
         yy3Y4zQQDGY1VbN7evbRUbVGSjGuiDnQ1Q97lI1X4ub9FNiietRzgYXh68L+JYZI6tFa
         mXP8Uzq56QxHSkNnFF6CmVaQYTSd+9lTvGNESXgHUJonaOma/tJTay+uDAYOGMMWD4Kg
         lHsBD9Ez7IZRMVfDWJUC79UWUOz6wOl2ErnLClqT1Ko4e/XwLt3NATUFpPkkrvV19Uc4
         PD3g==
X-Forwarded-Encrypted: i=1; AHgh+RpQYy7t3fYb3IkZ/ODUGdheDTIjW9L5ObJYm/hOHmsy3I3YC5rQQ2x8ft1MNdK+xe8zgKlg0jqe5Gd9nCa9@vger.kernel.org
X-Gm-Message-State: AFuF++l14UrnLMVQi3Vx6Wey848ixBtZIb0yreHv+rcHfWlwXvxe9dKD
	hM4noSjS389rPq0I7L54YhtmlCW94nd7R3FJRwbhw+51tf/Uvsgegu9g06ylCEdCZbxyiuMQ+FM
	AAPwdbeCEEA5kf6Veoq6pu27brDMJbxWrVBWI650/9JEHmP3EjY7bdL5mPN3axyj5/OMo
X-Gm-Gg: AR+sD133uCvfZhrFBGgRF+lJ4z0kFq7MrsnOif1bFDJbIxn46OxpjJ3PxzWBcBY3IHe
	BUB0DPB1akxlhfpt4Xun4qSAMUvxR9xa5clrhXowotcGc5ysWEy4WWwc2DvM7sf6yHAZTqZlFWq
	+vsNnAivXE/AYYWlLFGlc7nSjSbJEIGSNFuYtvzlUSfh27eFW+QEtUbFgySHtdz0C8CggROpCDh
	XroIknIQ7rdAEOzvtZ0tU4nZpUtJVdslNrNPv88LndHdTLUqcTwK99SgG41NoVAF/M3N/kZppKl
	6m5ASfsjvDc9h38cKUpXNG1t9EPyAyu7WeBdmtFCJsyLHi/gEuXJ0dS1xhGtrK9TBrT7JCFSDVK
	GLpDhK7M=
X-Received: by 2002:a05:622a:93:b0:52e:125b:9444 with SMTP id d75a77b69052e-52fa1d2d479mr162923971cf.17.1787920669146;
        Fri, 28 Aug 2026 05:37:49 -0700 (PDT)
X-Received: by 2002:a05:622a:93:b0:52e:125b:9444 with SMTP id d75a77b69052e-52fa1d2d479mr162923001cf.17.1787920668485;
        Fri, 28 Aug 2026 05:37:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:21 +0300
Subject: [PATCH 02/11] arm64: dts: qcom: sm8450: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-2-1d6e0c2f5a69@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=is6Qiuvtglru2UusENwCSUsVVZ+vsE+6GeIb1ZRKfgc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEL7XKJcgcWfdFQDMVzDX/Wo+Nx1d5EFLFle
 XAULskT1wmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBCwAKCRAbX0TJAJUV
 Vg1IEACOAvs1iPm6inUQ3JEMGrVR9bXiJWdCheogwIMTPYNA3DK+pT1WbLm9SMS79DJxDY19RMY
 dNvwhEHkymyim7p+jqbbEo+OVNGRxx2/0/PFpvRRHTlazCnDdMaQ36Q0hzjXM36KF+VXNq6POMh
 3i05/G7iN0Tm0rhUGmmefgY7zqyB2vzT2EfB1BTEZJNJnm7UOv85+fWc2uVMCp0wgiwHViKDEC1
 N9yB3V2uNcyMmrLoleu/5v5tkWM+vuv0tWoRKQBwmj6zWkqhmMMDvXzEpaFEz4nCq05/JkC13dB
 vMOUdf+ZGZtN8dV/DDmwYcbfOsJwYojM7oHX/Ek2KWeigSpVbup5Lg7zUSdQbYte3tFkppLuvDe
 bPXl67cnsgMGAPzHAZ8jTrdn1uknWu8GaOjGcmth66vRREGwpQjFvBWt5LYS1A8IAL3pWGfGevO
 v/XQOgybIOi+/YXMV/FM3nAcgcF5NY07gEqeqD9kFSJkPFrEI9M+M+grB2jCIYBM+XKb8wlNZyK
 bij2Ys0X1uXdAOnUZ4BJxnTre015YjM4cUG5px1aX0yAnOygxA+PQgM4fyxe4QacwJbvrlRAZUc
 CAaT0pdC8rUBVaXmONVEMa09Vd4CUJNs7s7fYHEduvsUr0I4CaydfB+GfICQLzIrvEzQHxBg2b1
 A9QBiQP9kORh7Pg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a918123 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX9vm/nr/d8S3b
 021RADriXryxUSFUMgWjwqZ57v1dhjg4ntX1dNj7f42FvsJeSnmzZs/jPDwnx3kZT6BmsW6xRpr
 pmfKU/1NCe+60BRfduCPPASlqO/BbSY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX8zeQ6YEUsKrz
 p14scFD/vv+h51BeOqNrFdEiZbYWiiTL6HUtEfJ5/ENBF5kPBmwE9npC7BVVM4IUetW+QgbxR//
 ibqwrwgCYKpHxnq0MdJ8gF08iaxFxl9B6FR8sAi6AlSGEAHdmjo4s4oKBQX0lX6otZegMDZBnKi
 nw8TMvE6B93gjpz3maf2B01a48LzKqtVQP0GJLYBt645b0TcEsDwTqN+AcgkPMPauBR+Hwxw1Mk
 bmnTmlMvVJBJnYpnyFf7EcFYVocMXI9n3MrDXcTPpjCEc4KDovUXRCCPtXQY4gpMZQrTjNcg2hf
 s1dp8avhc1JNpRMSWH7MJLmsg0MUrLZK3iIZ7noHRIMip1G11D4eWVMJtaic4mkTW1T6TyWUvtp
 SM6I4J3YLmXclYfEVVhViDBQoVummJYfmhHu12gHKUXwkUCg4AScsDrC3DKDN58lNwk/FFM4Vp7
 T4IEkV5Ga5xbJe+rrdA==
X-Proofpoint-ORIG-GUID: JkKONXSOE-zlj7WIjULMhepz-ffy52nV
X-Proofpoint-GUID: JkKONXSOE-zlj7WIjULMhepz-ffy52nV
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

Fixes: 3a5cb1ccbfb3 ("arm64: dts: qcom: sm8450: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 4ade28f40cae..424c06e88afa 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -713,6 +713,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 4993059483e9..cf054226fa24 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -414,6 +414,10 @@ &i2c5 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..6f9d5a87f1c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5370,6 +5370,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.54.0

