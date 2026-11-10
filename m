Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315484;
	b=tx2KQpBU0nAAzU4fHZVwM+4zGnr7MxPwzUhQIEVdtxzH/kCzbc888TDOt7Ji08omitAj
	 P2Dww5pCMXQT1rJ0FEyUvQa4zcvSYgLc0lVDKM/P0BjAguLryGvS159QN+dO7MJinSQ6L
	 IcGBnYEl/x7HfAoNXqoTeEyois+oTYTTmNhhnHak1m7StLfcNyYXS3/gMtccs5Ak4NcJS
	 6TTBDd7VSG0HrgQ/FnZArbIkcoVIu4Mi5wV+jipxv/tGOi6kJa7PkjpGTs+2E8FZ90usg
	 T0e6Vx9uycZ22g+tILjTLYSiu7QgGfOjtfs4+xudXUh8T71tmpFCdDyG7L3gviFh8Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=;
	b=IzXdqm/pgiYAiMQ8NfG2t3N3y2yEy0ZxRd6ANY3pv2CJMMHHWGeH38J1AAmvTAj17mF0
	 xAHApKVpjwd1sZPsQqPquonIlKMwdMB4Wo+RmXK8ig3xgIcTySGI+i5P6gQdpZy+MIm/4
	 g/fyQ1mzZgbtOR4p01mkT0UDee++7uZqoDpa7WyM58Nvc/892BvYQ4VxdbE7KG1FAtQ5q
	 kLlNv0HbjIVCWa1fmM+sBAVjjySS27Olv0xfMKuTV+OrzGv2Qe/Jcsw8CEWUkiBALJqgt
	 vRf6PEfkBYjqhS7i/DmKbC5wru02atHqKZObkowyxoNxvTE693uWTHDCgpDknLufaMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ej7q/biG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kStwgFTq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD67660A6F45
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 12:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD67660A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ej7q/biG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kStwgFTq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA7O04186876
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 12:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=; b=Ej7q/biGRMdxc/8K
	26SADomgPfH7/zN0Bz+Wg02ndgQG/eVGnlUb/1+O9MBiI2xSMNFpRDKvCJ1Wkwlc
	akY++Rr7krpNp2RHoZiyjXEveYh5wzbLhP9c3BZ25RnOQSNN7yUVbquuPeCuYozZ
	Iee1Gq+XFKbzFPtXW8qSG3VvQx9F/pejVtu1RoRrVeADRkGgzQ1VnYOCOcRNSizk
	uxLOZWwWHTyrnz2GKRt8ym+1y6uCNDVfV2y5UTZackoxfrkXZhT69aGDvQOkYX4D
	yQVN7CL5FiCQtp3UWLmQ1SKhHNT48+aADLE3G2zJfgVqNUzmdyC9LUmf8EKxTgmR
	hQVt9Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwgvfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 12:58:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so424129137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794315482; x=1794920282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=;
        b=kStwgFTqzUi8BGwIfr4Hp41RYzM6lGJhzucooM6jN9TN8xBOJANaUHdV/rppAhpOdH
         KUlgCJcfyV8in2osHrbly28MriK6tc4UXDxf+pgXUAzLvZMVsB0ZdR2F1Z9hwr6Dc/af
         s08mxm/LeDTIc+rmW4WSsQx/DtOFjXwe/GGFjlMLqy7fGMGm98izkBiFhhHIk2dSFE+6
         uXVVd5mQypVUEKNsZ6s7nXvqSVKlO06VnvxtH8JaMep3n90xD0lhW/s7Kmh+93+c7RR+
         ELraBqyXF0f5l4cdWJtI049TfCg+YnR2LWRviIRMVE6wTLpMhT5gmAjKvr5fYwyE8Skj
         x6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315482; x=1794920282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=;
        b=ZCZim/qDWMQfMeEC2XXcXVljHf5Bes1eXdh9kh+UREKFrgo4CPLEfxRoko+YADxfBA
         qfRObOaojvO7S2NJXLsgJrJPfszY56SKBV4zBGhmLIH1E05FhwOJcLbZ8VwhZCsHz6Es
         6HuJttwP/k9F11cNT9L54j6GDlSg5Cq15VHSMQlV8rh0sp3vEz1nwA8u+pUJeoaY3jde
         0WdeDBEywyUANw9hWwxQB251TpXCCERuO3wAdAyqf2mifbo1RCwyATIZ2rwBGT4kJsrm
         De38yTlJK+Za8OKK1hUqBsvFUtp5G8bDxTDhGyOIph61R4OOkASZw6wfOqH0wda4RWHJ
         xlKQ==
X-Gm-Message-State: APuU4Z9oIXQyO+PBFM/uIH40DdfB6sUCK5VAc48iFc4yMPxL9BJK0LFp
	7FRy/Y80fa2Bi9erKFR5YswyWoygxsfLlESYgTEjKGPCOAlhqxvm2DjCQdhti0O51IyDDLQ5EuA
	JzEWMAamDrRkj2sbtxU9+gWoaNkUeNXb3BBDKn0qcdkaZRUZMA9mn5AC/7CPrXeyRpyrs
X-Gm-Gg: AYBFou1GNWATIB9IcMBaxLDZkp2fe7pepDKGQKbLFcNZHXrtH0aqfVGqYcUaNimyXfl
	YyR1oxCrFPRhCrPZ62hj/Du/WPygccl3uZJx6cMGB7UofMCKAHCU2LFFZlkhX1bm7zDtHIaKbRf
	RWStuYhwN5YOmjBeaHoV1+X/i0tQ+bVYbcsT/xMHoKdNDxPPeMxTuVgsXw0sss/TG2zZxEbRsuU
	J8YqhQZWdrbDBcG2dfYdKn8RFXy1gJZOahhgkTls+6klnnQW7ZoU03IxJqSCwc3hy2KAXG8fOqi
	nURtPplxIJEyWpOnNPso/BOBN2r+UMFsZtb7rZ2cwzc9taffBt40m/k02MjVe/Xsi+5Rm+ZqB2R
	6pVctd5auttq6gGkHFD4oZ9XmsM/W/rADC5q5Xx272kXegRXot8NtRJqx/+6+FvY3zZYFJQ==
X-Received: by 2002:a05:6102:2b9c:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7d301ba38d7mr715652137.11.1794315482037;
        Tue, 10 Nov 2026 04:58:02 -0800 (PST)
X-Received: by 2002:a05:6102:2b9c:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7d301ba38d7mr715642137.11.1794315481593;
        Tue, 10 Nov 2026 04:58:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba35csm58422365e9.1.2026.11.10.04.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:58:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:57:42 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: msm8916: Disable disconnected DSI
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-display-msm-of-graph-v1-1-0f3106f817b4@oss.qualcomm.com>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
In-Reply-To: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3980;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=65njRLBqDnUyMSob9Dpyv+KJXmakPkOeCvlHFYhe1os=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8xTQbHWfK+D3i/RoxLJyMDJ7NZJC8pDAy4fvN
 hxuG2J5vXWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMU0AAKCRDBN2bmhouD
 19TrD/4m1pyWaPmrdxKPoimQkBa9g+ksohwgck9+Sol9aIyua4pkoOf52KzBj81zXbXkjzV3g8t
 Y1KRFZJQmYwpCgVlqL1195hs5em/cOz4hpqFxtqjSNvtop23nMswZ7Ipdr106yztLpwwUP01Uz9
 mmnA9byL3NZ0Y1iPybiQuTdkdu2ScRNZE3HEmlnzcJLh6s9ERkDG8OlrJHQ5ojrkAiq+PxndJ/r
 E6GiY/9AmbEtN6Mqz7TyxI1ODYE35KqESKdF/dxZTd5/jnw4pc7tnKKrETRuit+rOgcxCtIp3NI
 8XAYo7oiEzmeaeOQyoPm3dsq1mtjf7FJwa34nzQbwwf+vN8fMWZ1F+phcTdHHBZQTSGkZrruCMQ
 0wUSG6eW8+yJJOtSDTonlnnXtvVPi26mJWaBFtL0dRGnTfuX6Wl0Dl23rNdfKOOFuX0kyOuM3CG
 QZKPqTbj5B2TQxTEtrqXovvCMKmlpzRlv8ME9X/IQmN1FiF5nTF3nrxUa0Aw66Oi294bhM6UfY7
 R07DRV5vWuxcdmV2VP/PfGIOB/Uun91n3ePgK5a+WnyhSeHT/z0lYM6j9wJdMkUkB99RM2XSZtf
 XAEnx2X9wun9XCBv7tZ0JLHdojtUXdMpaztffXJcgSw1/VAJ1p7H1vfzVZHZkQ4F3wzYBtvpjjc
 cFle+ySOKTeKmzw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 9DvWPFfiMBkA9MZ-bxiypqQRHWFqFcM7
X-Proofpoint-ORIG-GUID: 9DvWPFfiMBkA9MZ-bxiypqQRHWFqFcM7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfXyVi90x7vti7E
 zE22i9ysyfowF1Ceimwxg5ENx50C6e6r1B3II9CX5gUovQjYfWZz5QeXFLGVWBJXxML5KWRK4Yx
 ZkiT0sruxE+MazA1jDEgq+jIE94Y3b0=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af314db cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NuhE5ioKuPUxyzsrWcsA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX3YqdIaQdgCIV
 YW4xIu6cWPfOvOIwmp9kJ3cz60XIUdBO7xmYXRJJEhsEkBBWj3++VIViUjmngLBUu5gx8WRZrbQ
 KICIscc7o6IoSMmu8tu4U85KEOqqj5hLvcSRw4P86wqi37Dn2Ynto8SYsP+dX30CnPqjCN6/s4H
 M5kdNvr/PCdrqjPMPNK3LptPvoqqSCrR2c9GqyP5EDf8bYCe+q+6TQ5l1DM6f0HUhuGIgXLUh5L
 2KjLA4C6SHbp9V5i6Tn87fq5NH4bzwLLWBZvGoJOZIM8S1p2qFZqcXzHzPwaA7D9A0CwGS3Wq6+
 wHRlwi/xre5QTrGsZVLl4YDqvueOouzyjclBI8zPfUj4aUV65R/bXXiWTXUBr3FOjpzdOaBq8Y0
 4JiJbBEGzeARkX3dVBM7JBPLx09Gi4IV33yz8OAYJqow4D5ImadXwWQEZt8FWZSi715Y0KY5dWO
 +h186UUQ9TPu4s3WQlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100051

MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS.  Linux MSM DRM
drivers will also fail the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
 5 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index 906d31f1ea21..d3adbc7406b7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -87,6 +87,8 @@ &clk_pwm {
 };
 
 &mdss_dsi0 {
+	status = "okay";
+
 	panel@0 {
 		reg = <0>;
 
@@ -109,6 +111,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &touchkey {
 	vcc-supply = <&reg_touch_key>;
 	vdd-supply = <&reg_key_led>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
index 5b34529b816c..fe333ed489b5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
@@ -133,6 +133,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,ltl101at01", "samsung,s6d7aa0";
 		reg = <0>;
@@ -154,6 +156,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-gt510";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
index 3d6d9dd3b8a8..85d1cae19a66 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
@@ -98,6 +98,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,lsl080al03", "samsung,s6d7aa0";
 		reg = <0>;
@@ -119,6 +121,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-a2015";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default &secondary_mic_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 71b5c98458ff..65de798201eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -337,6 +337,8 @@ &mdss_dsi0 {
 	pinctrl-0 = <&mdss_default>;
 	pinctrl-1 = <&mdss_sleep>;
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,s6e88a0-ams427ap24";
 		reg = <0>;
@@ -359,6 +361,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &mpss_mem {
 	reg = <0x0 0x86800000 0x0 0x5a00000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e39743e22043..7d351cd15f90 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1634,6 +1634,8 @@ mdss_dsi0: dsi@1a98000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1668,6 +1670,8 @@ mdss_dsi0_phy: phy@1a98300 {
 				clocks = <&gcc GCC_MDSS_AHB_CLK>,
 					 <&xo_board>;
 				clock-names = "iface", "ref";
+
+				status = "disabled";
 			};
 		};
 

-- 
2.53.0

