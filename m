Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D717D45A2AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920712; cv=none; b=RHHgkY+eLhTatEs2ZWFprdsZiyJ4fv3JiEwGkuybl1EVxelTvfvuCeumJamqVZDvNl8zJku/LenL08VLQUimnYugMm5U+1ZuP15GmRrV79k+BepSYCkxH4jKMCkCegbEzWkbBj/cjRofKWE5CYWL2v4x8ASBOVepg2d/FqI1GcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920712; c=relaxed/simple;
	bh=EgvnDUksmFTLSf5SJawv2fmDcsR/7eXrUK8gvnax7L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n53dlKqqQBPUOD83GMW2esZTWBGcSmbw9PPm19vw7KitXUW/v0D57cXy1YjK3v6xrfzj4wgnwLU3VV/xFxFEZxOifk+I+c6ivGln+bmDfLOA/qP9SOF1YOSes5Zcr5oNS2Li15dl53ABWXavJBiSoT7KDVDXFq5LtDLzYo0S5uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6TYltrn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjRTyPEP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6TYltrn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjRTyPEP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA8ArR3752206
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhRNRsbZM8eE6FMDqHz8J53GzZk8ooiSvy1QOXVGep4=; b=Q6TYltrnIngsXK00
	Ph9u8KlcyQh79V3LBVSaA6+y4ql2lb8NrlCrzK276KXKDXt0mEpFE9QcwbHdODNg
	z/tWYl5bhbU3e4EGjt3rHNuVCdMGamkNDg8R1lkVta9Qlf5HyKaDOZtZGarHcZ0t
	tacYlppaV5s87x2RptD7GIwuC3MIwwizoeYnSNn4HvQR2BgtxnUNB1ykppbtUJSg
	hrlSvAbKmAUDV2LXEiHkWwcDOcz1ozQDvARPMEV2dtW3gDunsLeqN0BYsiUtxiX7
	eC4IMV2cjVGDGsxu28JXXELof77gxhMz7VWNsQmYS0Raw2YKaShFvzk9s4uCsW2r
	Qt6vEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb8afggrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso17656291cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920702; x=1788525502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhRNRsbZM8eE6FMDqHz8J53GzZk8ooiSvy1QOXVGep4=;
        b=AjRTyPEP/+hyqNhGpJKUEP7GLbUuOdhYZhNSu6cKKBpY8wF+EjzUntajtaLoZiuH5p
         1fHm8H0PT/tLxwMZY7hpw0YV3ArNeeMydPyV7SFpBMfrZ/UdpR0EwXJ7wqBzGzNrPSKX
         JjSwjbgHI9QujnHrUvNmu/DD5IpVsKtfLrSrqaL62GJskvM0wyXhWOEOU56eX88w0wxE
         Qt3AWNqJR4w5EZxI8yFG7p07fjoKOedV0n46d27qBMf0Fq36AsPxfMJu2c2Q7JQHu1u+
         V/Mc9VGKwBCJelZBUSFh2kFsLNL+lRhpvH6ti+sHLViDbQG7yOpXx6iE75Z7h+L4x84l
         OZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920702; x=1788525502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhRNRsbZM8eE6FMDqHz8J53GzZk8ooiSvy1QOXVGep4=;
        b=iELsjOyni1xcfNMhUDGawsSCfLZaq+Rj+2b27ZWd5UbAcz1YI251UztUmhIq5LaILN
         ZV+u4yGYelHyIjywdU50jHY3Ruei5MZZ9+2W6Fwvubpf0lxPl5gayqKthr7dDqxwmo1B
         91GtBQvwmS7UfmAPEfHsPs6iW7uCPZIbBp0kGYCVxizlG0Sz1H/3lQHZug8pFi8UpYLg
         lv9KVvIhpAXYomL+pZVNePIuePXb3CndIAjZIVNe5wISpTidCjc+athV1kR5fZh7RKzR
         YIY13oms1WKejfN38Qg3DO8+V2UGG32ZXhrJwajc2706XK1ZPMWpLnAU334EpVuyPLyS
         0giw==
X-Forwarded-Encrypted: i=1; AHgh+RoBIiM9XG9bkEvXMFB762UAj+XtynN97lWLNYfS7iQlbkmmtyqQLOSmQGNC/rMO5KCmHEj2io80tdrQ4Onr@vger.kernel.org
X-Gm-Message-State: AFuF++ksR+DkIpwRjOTYv3f7M8UvZejPQLWgNZGiKobHkEkuykxJOG7V
	DjApeWDX7SGP3ARBw62ZNKVc+qFJ6iqvxrLe5kzv07NQMG/RThdaq3wZTaS1JU+K6oZD+yjpVhS
	EKv248nvY5ztXBJJmbWI9UnUdUXH85A2U5cBTXb7VbZyNrrHB5I/FxelmSxBenzn/zFYX
X-Gm-Gg: AR+sD123Zr7LR1KJcyoGWsHcamtJQhiaLS/xggWgn/5hpC0M9OT4VVIxjqztd7upBsU
	VqfMFlVxTvs3Sa8IewAr5FEESTU4WnGaeY1lkaImPEVR0SKXzUeMf+99ryyM/GaJ1DWipDLo02C
	ibKyNqV4R5AplglwpnJxedfPUFIu1UsLEx4vEt3RN17Af/+u85AaQWxYeWmxkIeFDZR4FtCePSg
	uWoadi2x/vI38AK3H4nWz9qOL11v/RNSmsrNx27gCeTCzqymRgEYbdcMkVOkBmPCpob7AdrgxkL
	VcRHgGYqyIyyT+a9EXyj8eblkjtqPJz7xdKn2DzNgoCEkPuHpH9zM7AOb6Bhd/RlxtJxCNi2iU2
	wt66jpGk=
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr33286321cf.23.1787920697077;
        Fri, 28 Aug 2026 05:38:17 -0700 (PDT)
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr33281691cf.23.1787920691863;
        Fri, 28 Aug 2026 05:38:11 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:38:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:30 +0300
Subject: [PATCH 11/11] arm64: dts: qcom: sc7180: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-11-1d6e0c2f5a69@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EgvnDUksmFTLSf5SJawv2fmDcsR/7eXrUK8gvnax7L0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEUffgxq9Sb1/B9R1By2e8YlbTxrnOECOgug
 G2mBQldXBaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBFAAKCRAbX0TJAJUV
 VmJbD/4iI/2xFABG3CvUSDkl7lktJjB9Wf5MbNhiTZTlLSOScRqfnZYRwWXd1rnGUA5Q0HNrbFQ
 Q7xcJfuvz4rqk3Q2KVoHamzph9AqWjfflJM8OJ/I7Ufp/3W6fjfIzhpfMa3pDXg+3jEuiqcw2ck
 yxupgVUUtu9yF0+9TrbGuCO9BstrwbCEzgaKuM5b5yAtgyIGcIomVBuiMkzCUhJXvRUNzAi54nb
 jOVtN4M8482VyjHdoJdfkyzP5k+6YNsIVkKXj9VZlmgteStLz9Td1GdVOfd4b3kXQC11qJf6qRV
 BcqWLBXVAtoK1RGZzFx3JNvnOV0FV2nnGMgLKIdQaw7oD7NiObcRF+5agKVZMw0+y45bQqyPJr5
 mlmI7HbvUhA775KZEZS5k0a7PbYbR6xc6SwFJpW+5aF9GlzzB5gscNVWDpizUqra/mCupOzXqwB
 cPBUh1mY12Fm8b5NsOZNHtMm839MW6mJQIRpVWyZPURFBLWT18grlCUhiIYRdqvO3P2VtlzcuCp
 HFIyc8vXjr/CtjK4A4vqjLBOfh+k7lTNc7MjIilEUEq6UyNQV4hGTmxJsS8fUhz98X+DyN1GVa/
 qpEC84zfgmaZB66FhmNMs0CdklLZkhtm68EX2jSCXq5T+eEyScc4H1WCye1TnwD9SXlfPtKICbx
 fqdd8qsUI65X59Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: FUn8eJg1chAaVMSWAuba7rNJ43EQWJF_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX6zkCbsCfAy8H
 iiSEqdFLtVcVEmcv8omkPAiCmuVmIYMb2UrzaQvqckIhvZvmNjUy84wRaNCpScA6hP9xGUhfjAI
 K+7XQCK+v3uwjC5/8tL3ILLQ6lbd0Zc=
X-Authority-Analysis: v=2.4 cv=IPoyzAvG c=1 sm=1 tr=0 ts=6a91813f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX9uy+niGndVqS
 0JAitJGXPMVqHv1/zaI6L1zSE1O8OTKTDYj8WL1BztVDnSbPk75+1aVaV/r5SSTKLkJvgWA0Zfm
 DWzMqJEkHlYAEfEAOlCVDzZoZxyiLUdpSJrKZR8aWbIGc1jxf+qIQe7PZ7nBHQ7JqpjNJcKMXnF
 R7b2QHtlyEErou1rWFuw3KyxEgs5dnLIXlMsxevTLcLYSvTPXfgBN2I7XF3JZWYR0/9/SeUaAGx
 rmWLGLq76XfoJ6WQwTf/X6M2aidfULyroWqsXCMD57EEry7yZNRQpF2myFCagT5/q7H2o/vynFa
 18AHh35GHFU91eRDCcRR6qNaYo4Q2t8/fGPbBL5qmHIaNWxHi4Ihb45+lxblxUWlMrP5FM7d0W+
 NmGK+ajkP2M72i6vcLFdSaL1Z3aWrTipIwmUmpnbIG9+a3pOAvyugCKqpki9FSmP5CmXsU+COdO
 LJ9hCKRQsOZTwGkEs2Q==
X-Proofpoint-ORIG-GUID: FUn8eJg1chAaVMSWAuba7rNJ43EQWJF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 7cd7271ac525 ("arm64: dts: qcom: sc7180: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 2 ++
 arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 70fbfb31d4a4..9aabecdc57cc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1611,6 +1611,8 @@ ice: crypto@1d90000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		ipa: ipa@1e40000 {
diff --git a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
index b9cff60efe6f..cb419a44ea4d 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
@@ -333,6 +333,10 @@ &dispcc {
 	status = "disabled";
 };
 
+&ice {
+	status = "okay";
+};
+
 &pm6150_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";

-- 
2.54.0

