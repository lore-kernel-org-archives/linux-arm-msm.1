Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618827;
	b=lroIf6QX+brDkImnRr/Dz8h1y+5w/MYVOTIaj9C34+Ndu16OXfV6/XuNatjKl2QwDMgO
	 U1xTMcm/MRAdou1DqTu9LUpRCz+Zyru9r8+CjdDaMzFH99FnPofotJwKXPUJmPZ0mgf8O
	 TbbtP/kvjaYXLlobWnn6Zqs1f66Po26gO9Cc3dmuYKQgpJHvQ0Cje96JpANMT0T4+XN/h
	 eUIxGMDEb7eSO+NUY1CkNdP+BWZaoSTh0LWRHTA4DlZQmbAJ4C7zDHrKcBlrONM3EzTUl
	 Qk23LQYxHUXBuDKrqVIhZBmhi83JlPxaT8Gadmp2Web7wjfGLpMi4GXoMJcMIUs+seg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=;
	b=2Wu+v0mYb7cBNnW9NawiTIu+EU2pRFt0DmZ1joOKrPv12C3ocdWJqRyduUpam8+6miav
	 vVAFuv1zbrVfGeQoPD7Wj8CJYPdccfFcKpXbQYzbBxogVeUS07t4VovrrCdn9+e849QZi
	 GWjaN3h3MtiOM9e0RHosDuOkCSrIfz7aQ7SlBcd/GOZszxPIiTrkJIhYP+KPgSWk3ssTZ
	 vrGwkrKYviMiCsyy7nD3xTFfUUco9J9XM+KcHXrFqgNXX8JI9kZKh8KStQXNJPRhInsSa
	 gtDsQ66jwcgOzaa/N6cDcKwZrKXVs5UtyxpwQL7NA9q4vpvz5lJf1P34jGmR1MxEmcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfRvvy5u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvdAK76H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF0D606A882
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF0D606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfRvvy5u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvdAK76H
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMbGig2846292
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=; b=MfRvvy5udeIsF5tF
	3WfsknUOJgROwcaqYZ51gTUfVRF83ZzENP1SQTu6QIT9mGbLrkAmwXK6t/NYiio4
	ukkxq1JemCuhMkKbsa/SkdLwZ2BbPI6Zlogo0OmnoU5m9tAES69AxTDHRSGmfMlU
	SFF9p/sNS/pa+CL/p+uGeggwPTBWa2COxe3EwEMsL7B6QFCaherap9tJpou278m7
	1Jz0iyfbWmsJGX1BDDyithUyT7ClYjVnr8p6IPj4akP6sY5o+QAYFdryP1jLTMsd
	ThK4a7PM3uFGQzevfeW39Pm4hf0fMdaNk/yVfgRlnNhyDoiw+ph51o7qSVd7MA05
	qNtSzA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bpaykv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1999331eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618824; x=1795223624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=;
        b=FvdAK76HKgoeTYLnVt7dx8KPiGUOQHYDP3CtAB068J+VpYo4yG2wMXlYEQ5xgwZayw
         m2Lbmn+99p1ekOtrq9OnVf7+2XlB6ZSSIVujSVXIkHAp+KCERK5/1D6Nsenh6MJBCOU+
         SbmYisF5aEagWZqGAMMGAUEb4vBQ7EsQB9Yh/LUHCO39PTNOXERgAgiOiUaCFl06TZsU
         yYL9OP2evl1nlM/m0tTwNbfLpC/WUH+ZQf4WoGe6wVHjyM4hajb4fgYDGGhM1uuGgsFc
         SNmo9+cY6QBdkvzsKiNt/9gdN1AqVSQ3ESBWQyxUE1bxeBLoQGHC9CIk0OrBqVSy9xVw
         pudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618824; x=1795223624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=;
        b=ZG8b0eKzD/O6QYgPbGRtb2oSVhIrQIJQ/ByegAXdMiCm/OQi4T0ugLq3MXMQAG9eAd
         azm9cuXGpTV7yea15RfhSALiiOBsnTvdzTj6naXdTPscz0/SMrc3imDf1k5ikja03WYB
         tjw5S6F4ejarHs9x2zYXUqTND/t8LjHaBfwGmyh8qvog5Ku8MikWmJ9C++VdNSHBO0T0
         aPCh2TMJO76iWx+v38qTcAB6KMgwrwTwKpHPI8dzh7QAwfDSZxPB4pi9D4GoolrYiFmm
         Fw+k1glIF2+sfD9Uwgp3yUS5u7iR6kl4cis3JSP/Et854MQJSfhhub4nAQii3DcmDoKQ
         KD8w==
X-Gm-Message-State: APuU4Z9I3TufhGtc06qGK1CJsJrecbTxIwbVZA2iNWvCwIU7gno0uWke
	QlTZBN2hMYyXIqiTnm8mQQK72L1BDbWyUiv7BBNGnhP9gUJ4tMgf1MGHsxyZ5GFfR/L2ctfbx/5
	2H6wipr0yIwe06BhYaK7kg8Puvh1i9sVEDJOqH1LABQVlSyf9N4LcPF6or1+SRQtKmNN8
X-Gm-Gg: AYBFou0QZXwACpSS1iInI+Uwp+fTJUmNSrPHmOXtCoorCR2VIk3m+OoKkx+810+cJQ/
	WeKBOIVKyGxxGPZwApKAeW6973AF31Ew4mKV4y+lC5FZEHekxcubnwl1Q6eOrXpYFox3JUZQIrI
	KVoBrK4buKkgenIqloOwvrK6QkbAewBJOGtUZOk1XP+mXeevdFaoXjkvjLwh/+lWbfHeay0jAhb
	RGjdGvP1q04/3jZEJFwtYW9EolbH+qTLsPjsRLkXdXD5h9uaLGYY7BK9PxiwVlOYAmll4FNft/4
	rF1rQ67Dxs6vdIzO8uQDL78BNCmFZER9RrnP0qThGlzl7smsifsI+UUHyMray5aBxlC4g3Lu+T8
	cjc4ZVwArzBQwuleq01lqkNe9y/3vPKeXVcc/iOKA5v3nfNyA4oZqCnE+HpbUfo26bql7iVAJu4
	0FJPSJzQpe
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr4045017eec.22.1794618824265;
        Fri, 13 Nov 2026 17:13:44 -0800 (PST)
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr4044989eec.22.1794618823719;
        Fri, 13 Nov 2026 17:13:43 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:43 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:07 +0530
Subject: [PATCH v3 5/6] arm64: qcom: monaco: Fix pcie1_phy compatible to
 list qcs8300 first
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
Message-Id: <20261114-monaco_ep-v3-5-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=1159;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zxS+46LvOuCqUZH6dROCss3FjAJ8EeURbIsga0w8/po=;
 b=zeu8POxTeEy82lD3VDgyQeiFY8IKN64oRX80O3Y4i+snxRCjKrU/EhOKhbIdETTKyhc7/Pz/V
 eJJ8oasipa7BNp0mxpXuIuLdaxZb7jk+NbLrDWPqjuna8HiTcKgWz4L
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af7b5c9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Qn42cR2sHdaWKmD6tFdXkVrz9YiXOJWV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX3rVoN+HWzEZH
 iE+B7Fv8nCuk8ZpwxXGeP7v39QQS2aIl30BWG+w9X6aSh/aRYK+EUrc9y+JHkzBB3rN1H8OarZJ
 rVoOIopgZebZwyIMATAffn6+9omZHSU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX7XFIbEDC6GBb
 Jw5QuzU2Ogv+z4Eh2KAII9X6dWVmrFClzYCmzZJ5avVZnzt0oETAK7jfcNPhRalJutxVtRIW1y5
 y5rSxPkfC3rbxf5Of5OBXqsUToe7MOloYEpLCNuOK+7p2Or6+xfnsg2EwdEioxU2E/7u7Hw3Vld
 KY2HLyrMJUQ2e5dKSsmF7xPd7N7NU3qZFDKyiysgUIIJnv161XBRP7F+ZfOAd9qftQCA8f9IKbW
 7JEWoRhuM/2vU2j1rc+LVoXk+enq+LFRwqHgGwQnbisLPuFmdKzpqYBrHzsRZPPrAWHlEitW+v9
 DlItWq0PdlkkL7swftJZBk4qP4hQBI6jt5xz+2jlb9xviYSGVzFuLFtL8mG3zr8h5dmlLUe0Ftg
 0P8GKv/P3bS8GFTMYFu1FbzT6XOwIIEIaGg7hTm80+MVxk4uRBaaDAKROmoY4u40i1N6CV51y4M
 y9BxA7JBIZQ4tv0YZbw==
X-Proofpoint-ORIG-GUID: Qn42cR2sHdaWKmD6tFdXkVrz9YiXOJWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140004

The existing pcie1_phy node only listed qcom,sa8775p-qmp-gen4x4-pcie-phy
compatible, since no QCS8300-specific compatible was documented for this
PHY at the time.

Now that qcom,qcs8300-qmp-gen4x4-pcie-phy is documented, list it first
with qcom,sa8775p-qmp-gen4x4-pcie-phy as its fallback, matching the
order used by the pcie0_ep and pcie1_ep nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..f27f0953ab9e 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2598,7 +2598,8 @@ pcieport1: pcie@0 {
 		};
 
 		pcie1_phy: phy@1c14000 {
-			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+			compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
+				     "qcom,sa8775p-qmp-gen4x4-pcie-phy";
 			reg = <0x0 0x01c14000 0x0 0x4000>;
 
 			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,

-- 
2.34.1

