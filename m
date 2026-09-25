Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0097740DB3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316852; cv=none; b=sO0U3q3+s9BG/QMeR182bxViuz+n7xmvKl5OH3TDO639+RF1NZi9HzEGBLmvgBpApd4TgDSTmVV+qR21dUaQB1d9vUjCHjZy+FD5sL9aH0tMCx52sBWbh/3A6Pzmrw4FYklufiwOipJ7/DHgNxxPZ3zAYpfIkyx/uh+CB9i3Jus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316852; c=relaxed/simple;
	bh=N0OOnxapM5BVqS0QhcEoUV0huDI5emgXQOtYs55ziCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aAyLD/9YlvvQn8ACeuzg1NWGKPASRhwl1tf3AZT+5AqkZiHVc+ECjfq46ej9a8tam6P0rD3pk32djZ3Jgs0XXJ7AEF3UUNjQUFiT7ZweTnl2S18pdyWF2q/1VqvGQ0s5bfTLrKp9GsujQ+cWUBjPnDQK3Xbu+4w2Lv8MJHvMDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itV/Xc2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBoKYBBz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itV/Xc2O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBoKYBBz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J5X5756810
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDH76ytCDa4JSm1/Kre1+UeN1hcmafzcONYDPIdKbpM=; b=itV/Xc2OUeqwGC9f
	m4YdvsOk7656+khmB0PPENw8pBkqzdMIFCe5Hh1geC5apoe5p/m0q2vIw+lWzeDo
	t8xU/Cm8fuJDmtwQFE6LKNNDUBN+LdEShD9ClhWJWZLbUW80T/KGZ0w++ucVRE7R
	2HiB4Z38IHxRG6ERLoNnnH/mgaB//AUwwnSFm7s9tvzfomVUASscEK/M7Cmt+vYN
	g95X+Wy91hVGrLLzA8qZt8N+ln7x3yPXvzDtFMWwOfkdiVlcpOFxyOHCsHDkmDVH
	wyy/XBPSMg0VUp8JRODExgoZQlLz/DlOJ7k5pmTXBdOFKkyilZYMc8/fvFzfvVsW
	wqxc3A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq084ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:14:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313d1015161so1856752eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 23:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790316849; x=1790921649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDH76ytCDa4JSm1/Kre1+UeN1hcmafzcONYDPIdKbpM=;
        b=YBoKYBBzp/oykq0+W9ge2RqX4Y3h7dmadYhbK4q7d879a0uHrR2wMi1qoUTxcoq2tb
         rmU2Bj5JZ0OT/3h09ev3ttOjWjT6ZdDy3q8oIPR8Ych2+gZrtKBfcdrcPJ9tAKRgEdUc
         Yn8nBGJMPp0+FKyMURw7ekjWmuPluM4jWaDYRzZk7DmGpzTgJY8YRQOZYKh3bMcL8vw5
         yYOCs9CsdRpbI3fPC6hpGplEzr1VI6WJ3H4P7YOWpADIbsPfi/ZX7BuBzX5TiuqEmcfX
         cnkYZk31IIkL3iyqt7H0oJvos5GnEXpi9Pr8ILJ5ejwl89fLZKZj+sQ+iJ7yQsRxyh0s
         bhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316849; x=1790921649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDH76ytCDa4JSm1/Kre1+UeN1hcmafzcONYDPIdKbpM=;
        b=2z7N/tpdAW99sFFOd6AdSsXECXdj8JpYD2F/UNO+7KPLemypp1HL9ptp/Xgba7QrB8
         mbHaJ21y/gZp7OpDGdu4vRqwTUi8+XYtIMYRVSW3WgU0PO7zJlxRAWiqkh5m3Zk2+LhK
         uigNRV//dmr39ox1hA9VRmksGiSS/Qnqq68UoDzEZtVsMAzj5Dp2jKY/B8uBg0r/HB6L
         voFaYFX+W9dWeiXuMs4sfb0pwLY5FHr5bDkk+Me+FrH2X4OgSpabd2EpqvjRWAjEVVTr
         me0whkemJ1NxE/suKoL7WBhesJZVSFZXG6olK8YaJIzaOq+u588DJtZlOgiumRhQL+jS
         tofw==
X-Forwarded-Encrypted: i=1; AKwUvBzbzShvr/5Hm05UzVcdV7tXkMXun2VaQXU+S3800hT+rQueBCcbM574eeK20OA3rHTQO70vpEW6zikAWCI+@vger.kernel.org
X-Gm-Message-State: AFuF++kPbF54PzA7ONLpT9dl3CN+XJWWWfjVUMYSUT+jKN4gjeQJ1lGb
	QIuc4v2OdJtiu3L9BKfreRYaIYFX5t+ojsATepPfdAvm/bmfv2axRhPoAFEy/z2gRoE+bk60DcH
	C42ysjknLTqe3VFpLAG+BRTCu0VghW7R4vn8fLgNy2k9v0FMPtFqXzB4g7vgNPCLtEy/K
X-Gm-Gg: AYBFou2qWpkLCccvos5CzjWkTk41UM5gam+mpFgSdw64e5ANQvWWgxvN4I6qHV5Fz5O
	W+iXhAUjYeMk8u2C7Y75XkKLDIXjWtOk/qvX8yHWBwJ9QilJNQrjSY7rPFmxKHIwFX+EKIslBFa
	Y8FN9IhK0fxTRmgGMoGkYPieoBhHqkmZNIeQAOcVAHRZCs3sOdVVYz+sBxXfjGPV/EHLLOdfHKD
	NcYRxVaDgl2AthHA+XyjHV0OlWdDvOyEu/exiXPIoCg6RwJxDelqU7Vd5+6BQaGgrwzP0kiypp7
	tLrg3rThuwM1ZyNxvkk5iYHqKgewkx4ZjV8WbM71imtrKGePRywjw4CWaq9EgfVlgCZ5/sZFr6C
	3cwk8qZVRczexUsU67x5iwJK5Kab4
X-Received: by 2002:a05:7300:a21e:b0:341:cbb8:3c0a with SMTP id 5a478bee46e88-341cbb83dd6mr573156eec.0.1790316848353;
        Thu, 24 Sep 2026 23:14:08 -0700 (PDT)
X-Received: by 2002:a05:7300:a21e:b0:341:cbb8:3c0a with SMTP id 5a478bee46e88-341cbb83dd6mr573123eec.0.1790316847633;
        Thu, 24 Sep 2026 23:14:07 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm3381039eec.26.2026.09.24.23.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:14:07 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:43:35 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Add WCN clock to Bluetooth
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-bt-wcn-clk-enable-v1-2-30bee88c4de4@oss.qualcomm.com>
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
In-Reply-To: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790316831; l=1435;
 i=yepuri.siddu@oss.qualcomm.com; s=20260603; h=from:subject:message-id;
 bh=N0OOnxapM5BVqS0QhcEoUV0huDI5emgXQOtYs55ziCs=;
 b=qgv2xkw7Prwdx7QeTw1JEJI1qxL9krj+1XW2HC4Jd7ADQ9Y/REcXaFmuvm0/Dc/zeytlEAhHm
 HfYlXhF65tmAeK8hXzY8k/pI8F6gK+BD8rsr6QEb84yY4kB+7gNAUdd
X-Developer-Key: i=yepuri.siddu@oss.qualcomm.com; a=ed25519;
 pk=ldEQwkUmctxwDtIVURg3xvXfzZavX8decqpk/pVLQZg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX6dhJP1X/FSnA
 P2DSBSIfudIzzFtP3qpHqSrm+rSOu2j0WeZdaCnhkQXA4H7KmPo51AQNEtW01hxQJ9CQXehO7YC
 64gd6uGHFeL2AWXgSZ/jcz1jizZmAhQ=
X-Proofpoint-GUID: Dep7i6Wykuek2ie8BE1Vwy2y2ov2LSzG
X-Proofpoint-ORIG-GUID: Dep7i6Wykuek2ie8BE1Vwy2y2ov2LSzG
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab61131 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GHRrtK_Kqm7Fu9zWAW4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfXxI6W+3BMIMb5
 zG8J0U9Or9lgAoIXHZYyefQ/cEtkJ59i6GbP3ntUCLw5fjjKPwjwiaQ8q3VqC/sIfR6IgvMDl0Q
 klQFh2GXUurKDS4SwYwPjbkpS5Uhb9HhdmJ24kXUQ22zqyrPHfzrxo9JPT9ow6DZQi2EBoyg9xR
 nRT5El2+xleKNZCErHs6n/rUlyGPlTFMLH1keTMYO1rXYD+qu1TT/VXGUPHaM+f1gNeOZeiemCm
 yvr00c6WG0Zmva4PWqNklHjj9QN4T1JtSsWkkXWUx3T+tbrZVxR1WqGINlXLrbLXjpWtT3HPptc
 72sg9W5Tkd2RnIfzk1Ht4nifSEwEG/WJKjdW3qhZxTaDKIzqgvVWER4uNaj0DAWPW0n9NYjeLOo
 0wtwt098X4Fp7lrATdwGGKzPwiW55pFCGPOaQb8b71vyoPzvCxczPDLnJ27jR4YVU02MpKrmTxL
 qK3T2QquBViNVVtfxBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250024

With RPMCC proxy vote removal, the Bluetooth node must explicitly
declare its WCN clock dependency so the hci_qca driver can vote for
it during BT power on/off via the pwrseq path.

CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses RPM_SMD_RF_CLK1,
reflecting the WCN clock assignments on each board variant.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..4e03e459c7c1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -220,6 +220,8 @@ bluetooth {
 		vddxo-supply = <&vreg_pmu_xo>;
 		vddrf-supply = <&vreg_pmu_rf>;
 		vddch0-supply = <&vreg_pmu_ch0>;
+
+		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..227283ab74a8 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -242,6 +242,8 @@ bluetooth {
 		vddxo-supply = <&vreg_pmu_xo>;
 		vddrf-supply = <&vreg_pmu_rf>;
 		vddch0-supply = <&vreg_pmu_ch0>;
+
+		clocks = <&rpmcc RPM_SMD_RF_CLK1>;
 	};
 };
 

-- 
2.34.1

