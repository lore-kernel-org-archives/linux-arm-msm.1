Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956471;
	b=oOKIRMRn00f6P3MzzkHYAJTixh4ergn+3wpq0RqFi6XWHe4VqIliA+CdeM3EZTm4ucTc
	 unzX9bwIobptZgjDocJjT9fEp9mYTxc+YGx1Wuk86se3UW5+V3xrlCUZK9PojAX7rCyHK
	 HeHw0EbQGwQjhdQUsxaJag/LJj20sz/0Wk1Hr261kuBTDVGJ76/AmnhnH3Kw7OxpoXOle
	 25GZN9WVHwp/i2MrUoPgNIP4XuvBVX44/WoGtMu/7kdnshKs0qtEyfBRFzwooFQX6NGhE
	 jfKvdsN2Bo6CsE2hRe703R6ELk85fYrRs7MaTzdiQIwN+amgCWAu/jshW4nLOgiFSeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=;
	b=ZTVPBCny4KEWVL4tRxAXy0loLCnvmAU+98IKz7MbkLf0VMvPUaEeUIuzm69/YV8TMhnj
	 pfcd351bIMRkgcYF+3JqB/HcK8zlXS9jZp9xhWh2JD+6zdvlh5XHss3KKNc7YvAKZYP7U
	 JrfBr0EYFKKoPMHcmIQWPD2N7VdvX9o4SNEjHYWbkGb4kp8fpvvs+QcQbRB+C+QGPyfgy
	 5cHP9mIJvcmng/egmWa6J9gYvvrPlPWE1Q7cpRCf40ylPDeUWlE/MRWnvqQo/H6w3NNXt
	 hFvK+ddAuHhb50bOfnIrjSFIDFo22eHSvWzLcDm2dE9r7mQ8/ZJ8yc7ywu1H/EJ1ZqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IG6ynn4M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FokxlMrB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875EE606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 875EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IG6ynn4M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FokxlMrB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMf3f21958259
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=; b=IG6ynn4MfORNEa8i
	XJ7nyp7/PSx00XDLozkwGJINbGUMdPwCV+pXCJWRIWt+TsbOydlIT7Dk8YAcvJ3e
	XxnfGAxnF1pHN5x7GbuV0kQsuMYEsQp5F9DfsJ2wPb4/N8mnwjm6LWX8EK3VgYyM
	g0MvMCfQdsPePuGeCuUPDRvwpdMr8pWHLWko96mlHQeMpclPd90+KxJ5FnzGCFVs
	2F0271fpw6lrohvi82PoDOSLs+XH03VMWkpYMy/srrujEySvw4dhQKzwbbfqb8gW
	22WShGo8oAqo3KBnsGt39x+pv+nUJYRhpay5kZVlw8VqpCvDPUpHajfWx3/9pJbd
	yJTKSg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv982ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:01:09 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b63b9665so239341c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956468; x=1795561268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=;
        b=FokxlMrBZbZaCJq0g8KFfdtemnjJdkHBo1+3yVozv6R1YWFJPpae93m/XlHY8HOYcW
         t8fsdbz5Emai2z1fKz2oJa1th3HxlHryk2xsGiDOCr74csUS1BbqUAf8uc4eB94odBTP
         1CBHNtgTmwKc9ybgX+BiXYMBkwCwXs2pzsbH5L8RxRi67tiF5re44cjGuErTY1W3YJhd
         HDUt65/4Oi11oFrS9Fvry5oTzzdIR5lMWZjg4pBGObNIu7bbxYVEOfLCAQvqZYRuZQ32
         pm6j3qcKKf/RMdeSS79S4cciFclkamELir3zuu6TpmferVPW2S2F0C+UFkKK280Y6ZE1
         j/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956468; x=1795561268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=;
        b=EclO8VKhmd33lzE/GeDfP/drLtDCR87td7I+w/KuGbaPbZ0StbKRNEwM+KhOXVh70a
         TCxTdbWXTd3M9UxYypxZfUcUog+fhdt+B16t0Jp8lrA+VGKWDlzEOJ/1Vl5F9IXXwwOs
         H+0aZDYyXURHAPthigo60EVWh0AJ3P+nIT1ugAU9mTR0uHH0mm/VxCfCV/3Thepnh9sY
         +b+YVKiceJlvbJMjJTLiFNAWc1hEcLOpR8B6Zkss9Sr0KS/wcIZIpshstzTzDvz/hlam
         KUD7hQADwxgj+s05dKUnnrjDc1VrTmPStJUIYIj1+HZf6vatHVVIhwogqihLFZ834Msz
         gSZQ==
X-Gm-Message-State: APuU4Z9/reIdEOhJbHkj+djYkegO6jP2+yXIIgfyHYkg46sD8xxtbmaY
	eswcwyZFMQ25D8cymv7RFWstoQnSNcYg7lRLRrBHfwHZ/o44N2LCWYQthUN8gVBy5s5tN9XPU35
	GsWo0tzCMkmKm93gRDqI7l/baYn11Lp0owNVCmHG35HKSZ//ypbEUwF+HVc5m753lKG8s
X-Gm-Gg: AYBFou1lKXSDNcC73A151nanfdu5pi2s+HVohedl7fOTHpWZHQet6PkHXFrkX/DV954
	c7MOM9JmRgke4bm/NlaSIQjYYnKqqYMJH3x1RhToOkbEYU68RJSWLl1FPyjt/0yuR/cg3tPyjhm
	13WWucxRu7pd+xtwtvIiC3638cIWR80s2sHzSAGDIoScw9CoUNvj1FX+26OCbdS/6j1olSDelxS
	oQgPpj1+3k8u+FMDyn8pOGaTX1lyN4TzqG9cRHs6UaQ+g/xEjMH1NSYN+7RcoD9iYA7GphKpMLk
	ZVbsovCLJ7dkbh6ZpHMG9W8lJybGRnp3+OuSeyVsktJPioBEJ2KXIHsqqqf0foR53E4e9wn2VUS
	cH1N1O9+on1gPNyzHb0j42qIk75duZlJZuLM843+8ry2FjxUdetLjDxL4gG+qZON8Djpk31osZQ
	==
X-Received: by 2002:a05:7022:1408:b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b543d3cc31mr799568c88.32.1794956468080;
        Tue, 17 Nov 2026 15:01:08 -0800 (PST)
X-Received: by 2002:a05:7022:1408:b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b543d3cc31mr799517c88.32.1794956467368;
        Tue, 17 Nov 2026 15:01:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:01:06 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:08 +0530
Subject: [PATCH v2 5/5] arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU
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
Message-Id: <20261118-nord-gpu1-v2-5-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=813;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PC/6atmGOO+qaJdXSQTumHCgKU+rZftW+u9k7tGoypM=;
 b=81oJm0yeVzyC+ZdQ8YeQRpGgoqhdFgmG7SzEXxTKhIsLI1fCeKTL9ePwIANNm8mrrw7xegEy3
 9ec6KAziGSTA7y956YGzjhQFN7vKgoYnCfCMxA2xM5oEu1cy/MU2psi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfXw3pxW7daLsxV
 0c3uUojgYyoA3TjZhqHORoVpsR7swH0PwTsxXHoX33j2SlidDXQb4KuJ3Nba8TXnef1K9xvy+8b
 3l+0l+ma0FOxUPpyn4cq7Z4UDDc2wKM=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afcdcb5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfXzptTpdlERgCT
 Tj1u+t6SMU907pW1lig3fAg07iZXc5JQNy3mGMk0aLnCoj2m/GakTQFOVYIv+9d8DzKUeHtS2LT
 HFA0guJqBDD2xiPvvHdJKxa9VukChIDbg/1n49v3eZkKARdrajFrf29DmhzJbtxKL+B1vruJI/Z
 n4Uzmvm1BJ7G3+5W4wJI/HlNr0nx3OAkCuabuDIFAzfDWJGUinFJyPtZp0ZhyrBpXEnYPyuGI/3
 kMU259Yqhu9QL1yr4v/0UQm2KY/iw8/NiFEDwiIYeAV+FeXDljlx5I0pGrJ9GA3r6h7qlwkhiq0
 yDuoyVRQz0u5NUtyjTUD6p/5aCzoHFqv05kkc/emgh8wXHAyYAPLcJlDzjkSrLqzSDKD1U/gLEA
 /L0lJkU/X/RwuqJX6Z5BTAkGp+cVNOBjzIl3eJPqgOX4kYcWhZEgnygvw+TxCSKdeNrIamts2H9
 cjkInx1fa6J/MRHmVGQ==
X-Proofpoint-ORIG-GUID: wR-ecomH5AaurIAtnktisDAPuTsj0QZv
X-Proofpoint-GUID: wR-ecomH5AaurIAtnktisDAPuTsj0QZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Enable the Adreno 753 GPU on the Nord RRD board and provide the
firmware path for its zap shader.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..51e5ef927b7c 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -366,6 +366,18 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&gmu_0 {
+	status = "okay";
+};
+
+&gpu_0 {
+	status = "okay";
+};
+
+&gpu_0_zap_shader {
+	firmware-name = "qcom/nord/gen71300_zap.mbn";
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 

-- 
2.55.0

