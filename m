Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26BA47FB0D
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203150; cv=none; b=IobRinrJlvore80LeFaa1sr2C2SpsEKGMzUsVfj7lfv+iStj3Fj+el0Lc8ds+XV0E6XGK5Yt+fccrfLOOwtBV3PdXLgPhpM0WQVzaTdSEashMRidoHZUFHcDitBd4rFOpePhJMltUwOusNEvn/Uf1YQkdkpFNIiRL0VxQv5a4hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203150; c=relaxed/simple;
	bh=kmbCNHlSHkRmbcwH+fso4E+YrXZBoY+nLg9DHtkfQ04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5C7uMm0youwIsJXWgiEWPVSCay250B7Ef7wyuBkERwOQeH60WE3LcYz7k4+iRogJkC+2Q+H/QuiOfR2MzCPzqeRYEXE9nr8+fakQg8IBsmWXy89bJiLhuT54U69DcKzzsxDJ7v56xjQ+mqO9fM48oA5h2oJgaQ7yiOfPYYlBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhbvQA7k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2sUSCBh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhbvQA7k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2sUSCBh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFRMW2366079
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=; b=WhbvQA7k6MPbvR1H
	iTw0Z+Li9Y6zIe6AXh7cwGjYCQ2qej7Bg/ebIVGH8un+bcKP/qzq3sdF/hKWiEYa
	XTGunCpVZy651e/3Nmb2ML7FAGWtcIB+7IVPw4Sv3t9y1sRw4fYV9rXNDA2VNm6g
	YK+g1IZYP+XGvkhNCH2R8j+LOl7jC7+fWkGfjUs7vV32ZsM/vBt3AZLZLnmsJRNP
	j63DCr7zK12PmSYbn0IypozRW9pPOKFqTdngQQwOSWJs2GACr0yKhOWqlo75P1it
	itpWQO6HltJT+wkYENCIxnF0xeRYuNYmmBTAn6hWpM1PfV9yyEaUEx3jcza/8zvP
	IdPYYw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvrcym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:25:47 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-80a4a17618dso3597661a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203147; x=1791807947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=;
        b=a2sUSCBhHfGxZFnJekoCxhT3DFtIN2tUB320/sFTAzUPxw1tM43JmjYrusONnQ5+d9
         YAaI8rCK4U+arqMwa7bb6rQgoMFOYTnQp++ByLr6+mDJQDNg6JnaRoKEr0rzbfB/mkoR
         m5nW/TeGb+badmXxX+pML5xrX21USHhSz6JltCb3r3ZxEBIHjSeGFTb/p/YEQyI+Xuzy
         0AKu+IPSlzN+vuD1dzLPFx9TfSVNKqdG94ScPbVlEcrfdVyIrGFDjZ/bx8ukr16Z8NTm
         Sh0M8vvLQyAKNAkWIcUIaF9Nuy78cE9fvnh2Njzbod9phd1GvQKAQsUVqBFlpTA8HRlJ
         HYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203147; x=1791807947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=;
        b=VrzNWm3qrOuswjgq4l73QI8G1vIQ9cykIS1GU6V8ioPVtuwUeXC3hZAcLt8PV3NQMp
         3X/wb5g+/0OtAkxrCOe/sgTWlX49K40zJnx/1gDPGF/HbTPIfxR6ADxQG95y9pN9/74J
         3XU8uyKvZz6fw9Pv8CRfZStoqaofWkVmM9be2q5o/5f+0Itg8nJfEXkWYuAETTK8XTnC
         hSQTBaX+YhSXzEoRq0Zpz7L8uiSXfRTggE9Hp4CzIO5xvIlopoTSP7Wd2anTXkjEs+1h
         44CZlSwimijqG8+SxvwNYu9aRCqjB3Zxh4IOXGazAXVsxMN+Zb3PCJTR6lu7pzSLpxC9
         hAHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKi7Pxuc3kvdT142HrPZOBseaiS6xW5Lgipv/XVaqAu1LJIvkobs5EtX+9gjY2KYk7qYN6SZA4YnZj0WfE@vger.kernel.org
X-Gm-Message-State: AFuF++m41b0886c3DvVytpMkIefrif1GYnsSrTGocL3vpilUj6WPb9jY
	NsM+y7t3yX199ZRttg/wIySjJXdS223heX+AEY28ycaXsbPYdIKjWx0RI4QjKzMi1K5956beNwH
	AoJYi8ED9hFj0h8VsHsjIU/CCa5Q4zAMgbBwEAWaSr+5PpCjbEXuWU76abN5GyzsKB7S9
X-Gm-Gg: AYBFou0OHuz8eUoR8kvENA/bKHSmGxVIOZtcElQCC+ngyy70pZuZeLuuG59pTS2qtn7
	puuw7vXZRFkWgDgIquzghDoFARtGVky80CZJQoWq+VFG6bFB4ElQKNuC7H08pi+rZZiQBeHrScJ
	lGmxZq9D/OaPdSqBDJmxSEVvBuv/ct+K2YxKJ1ENFXAL1UuEsBwcEXun7jMSQT9eqX3OSQHIH/b
	n9TQptLV58+HSP5mvrvSwBWxXGZZpJ3yZRGPCv1/e+LFJTvaqbxIM4rK3l4njgTqCdvUDtCcdwD
	yC/202Aa6hrT3dYccwceE77RrXbJZx3d42LnKNsQP25npc0p434H/MHA5Ihudom4PeZTF+aObQv
	3VuuC7NMP7L+kRZ8kFDmkMSkJGf4x1kTnkg==
X-Received: by 2002:a9d:6e0d:0:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-821171abb97mr7685976a34.0.1791203146854;
        Mon, 05 Oct 2026 05:25:46 -0700 (PDT)
X-Received: by 2002:a9d:6e0d:0:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-821171abb97mr7685950a34.0.1791203146398;
        Mon, 05 Oct 2026 05:25:46 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:44 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:10 +0530
Subject: [PATCH v4 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1199;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=kmbCNHlSHkRmbcwH+fso4E+YrXZBoY+nLg9DHtkfQ04=;
 b=2YmvEU04ZjJsOIe7WGR/kTsTv42jYKJlGrvC3JtJUxoGdnXBz8gCE1n1MBhRmG+M+ECTXHo/Z
 pMXGg9n45SEAI3uBuJ265mAcdNWfIkl0nL2D0C1+cy2LRvedZ734RQ/
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac3974b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: IxMWP0mu_D93AnmFgnwXQt2sIB5hk3kH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX+I5/noLZ/Igm
 q+f5K0tq106uo9m8LRba4b6QXSqICJRokbfeI6G6yVLMdvwY5vMvpKKsePF/q7trw9l5hAh4Euj
 HhopcXkmVLkcK6XGOBiYyMTwmgT1oAC5IdGwh3kZXk8zjxXXy5BiyaIAK+06E2sEe6KSeIWxPqV
 k6wAF50DRkHPbgjAY5uHDbOh7jl4ykdd/ypB4hjsxklXr6IQHqKhWzTJ69UFCvTXDa0vMRtVs1P
 WhDK9tqcNvhNKJNNmd7ExJZy/zYnth+Y5kgLppNAYZCS/25U9wAn2r4iGEROjkcXp2NgIReNIKE
 l4nIo5ZJ7WFOQqm4ytIYBcT9KROitkuCKpkMrxUa1fbFjUfgLExQswCP2IVnh3j18DJbtFEs9Lc
 XmSE7oCbz2y0KeeC71MGQEmz4sXEBn2knGraKUTjPMBw/f4Cxy7poG7iKTbhxbauCY1ktq4egPo
 yKv0/pydHqk1QZr/Oaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX7rFo0FFwoho4
 O9fudSZ6J62beYDu4FvA57HdqRWUt6gU+/GsP1SDio2vdIkK1NP0JcuCLg4etg/6Ft+4YkaPzCs
 oVqEvJYSdDcmDnJRKQXiNPI1l1UE4Ds=
X-Proofpoint-ORIG-GUID: IxMWP0mu_D93AnmFgnwXQt2sIB5hk3kH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..5635ed350f38 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,17 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

