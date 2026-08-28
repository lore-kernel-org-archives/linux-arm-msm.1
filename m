Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB8244E675
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920710; cv=none; b=MEgZm8ZdoUZhbGHazmkoCHbW3lb6qIpEkF3e2fSEjimCLW2DonPQCfWhJY4flwFieCPlp5xYVSPak3ntMBm3FB5PDEdvrVBByWGhMZPSeBDjiJgxgWC5fjevsvErnaNkGBVfPjQ7TM5ORczXQ8diWc6XhOVS0w1ta/nH7JU+iXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920710; c=relaxed/simple;
	bh=zuOlkz0pOCNT/GiaY5MrppwVUHwtw1Sb2NzG5lI5mdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAs01/0mKdirRi4xe8jwGBKmEOTfkj7j5HK+PQFU7oHFWHtgxOPVwViXYMkMsCeW5afEywmjwQSvhw0MieL1wW4GEbwSYYzjKn7EZSDzdfrQd9xGdL0jCpN89Yjy+cniZJXBJDVNmTl+sK8j+BtjG0i8ylHgF/ArzZE9UPv1ing=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1RSb3qH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feRfIdkV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1RSb3qH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feRfIdkV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA830l3064260
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJwdJ7nWOixJVF6VkFy7FyrvOiCvaX1T+cB5raNhPXM=; b=F1RSb3qHSOb0Q5+O
	KWOovrMpJEhdVJldoANyMFD/P/RmB8K46JWaGi+BhSCvFXA2T1bhXvIYNS/of8Gm
	OkrvUJgy4/9hjZrrH3HqnDx3xutPAWYyPtNIihprgFlnBOLME3FjUYeM8MfLDjfa
	8LPt4Ie9OcN19+OeoRSe9cUj1rxcxa63sqo1veV/ozjqabx2SxyQg6taNKpgcRLD
	CRmJFVTGZQS/4lSnmTd4z5WeIznTNx+KWDbztx0bm9P+KnP1n3KQNHEuzlKI4Ybp
	QfdLbIB0OEvJNPmRT8JKWQUFxBUB7QN+z2auBoSDT0DcoMKvqfz2l1c3LzBLsEqo
	SV8TtA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n1na2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ee59064d2so16277131cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920696; x=1788525496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJwdJ7nWOixJVF6VkFy7FyrvOiCvaX1T+cB5raNhPXM=;
        b=feRfIdkVoCMn/ZKYpqj5qq6eJYIL3IvJRZkMcIyEu/K6B5wXBTSSZc/QeL3Z1P99T9
         /V7NqA8PgkcgW8NN2SOzkNeCOZi0QNe+HP5gDa1rY1lrvAk5zkNKIgm41A5/qHxzb9Pt
         7LNkhL0K01gPeXm3n22PODId6KHX0Dd0nV3UUpvI8CX3yg5H7w2l7y/6B7izlNXKDO4a
         gB0WE/T1l5prOhzEPWNcOUM5HQcpoooPXBHxf2qF2OtYDP2js4Y9FaNj5EIDWT8gQ2Pl
         yZcsfwq1EUpLky+VGpazr0h0scYDubGShkUag3GAmR68yYcd4Ud/QkF1cfLRH4fEyg2V
         gRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920696; x=1788525496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJwdJ7nWOixJVF6VkFy7FyrvOiCvaX1T+cB5raNhPXM=;
        b=I9NrYQHAMA4RTaOLia0sOFu8TJx+EszrpqL3Aay2qgFvRZGtcEfx7gt4sp2o+KUqZ0
         XgJtGhVF8i6WjqR+oBxdfiQa2o8vJ1Immo6aOyXScb8gYlD/avecCMXcDEUUNVn4XxPv
         NTqPqSYqHyZME6AyXqh/I/D4+GMsjjSBKOZywAGQHaXOUZDtbaESPaNUF2iaTf2YNnTg
         /ItmFmJN5bzeCZsE/AioJMeT9qVNwX9KCe1XcEZo99ieDO4j/FMCDyXRSCAYGvcvI3/v
         Y3IcmtjN2cADKkQPAUNImlAr91TKLxgVmCsmT/cGK49oOL2Oei4/ocaOpwTFv6aiYtq5
         2DFg==
X-Forwarded-Encrypted: i=1; AHgh+RpJvKvkjEFrpNaFPEDAIi3gtLB5D32w6GtWgLXboNyka4Ex8ijMgNT8ki47KVhRmgGUbuxyda/SSu3pvcyF@vger.kernel.org
X-Gm-Message-State: AFuF++lTMoW8v5mbBHJOcXezytnQ0K6Mo1NEFwa9cg1j4o8tTbxX6Fwu
	iySGhIS1NVIEX+Tgv7U75l4tRT8h13ONToRItqMIv5YOvLpu9K7/Tb/irWFHJ0Y7zmdoqqzfpCD
	gUnppBzhFoJisarYdwJenRh5iU273qlCQcodK19R72PpjLwRLTHqi8c6Xesa984PQnk3g
X-Gm-Gg: AR+sD13ipwll9nB8fkKlGcIDC46aU92PfoRpkPKidQohgBhdpgu0VzlJGzND/PD2CTe
	yXgrvZnqrqksDnKlSpdPmX4qaMVT0Kwjdet3RT1NnOk3tJOaE4jof5qMsSePWecK1SaETYDuVKS
	fvgDMT7poe6wo0ogVTcaNE+ZvIpT5cLAKyaVrBmUiUSKYVdUav1fIy0wOiRqCSWQTyOBhYOD9ch
	BBciRo845+x+3oHwlMLXpb/4FmJPmKBRTbQCp6uOhVxFkjeqqChc8SyvGCOh3oXXujjLSyyE0zz
	UWuj/SRlxjX9SWCQHDSj+VSTkAjwrnCbhZsEqYOxXTdgdJCoRudxajZY73j/hpeAqa61MEVSIrW
	l7Y8KWEA=
X-Received: by 2002:a05:622a:11c5:b0:52e:25b3:6b0b with SMTP id d75a77b69052e-52fa1d2afecmr144978551cf.16.1787920690752;
        Fri, 28 Aug 2026 05:38:10 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:52e:25b3:6b0b with SMTP id d75a77b69052e-52fa1d2afecmr144977311cf.16.1787920689742;
        Fri, 28 Aug 2026 05:38:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:38:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:29 +0300
Subject: [PATCH 10/11] arm64: dts: qcom: monaco: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-10-1d6e0c2f5a69@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zuOlkz0pOCNT/GiaY5MrppwVUHwtw1Sb2NzG5lI5mdU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYETuHnzmSeqH5oSOrACC1P21s2yyNGO5Comb
 PYewZzYCEqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBEwAKCRAbX0TJAJUV
 VmHmEADIlKSvouwK3KckDYDIDTwAfY8+nW++iYPSyiDYlaYjNIcEcztiKAUdl/cDVm9Jd6TfEDN
 avcBywATRtdWkYl7osyVwLmJSH5SBKJTN/o49PXTPHBSFVFwbUt+cPJx0HgIBBKcPW2MTO49gRw
 2GOVWSQ1eJd/Lg73wyIw0MDmHU4+ZzQJU9rPvaMH3H/bYoF8/OhBncX5MLC8OmPQAyw3YbrpRIO
 piuQ6FULhsVzh17U6EZTqYBY+8BO8yR4merelYTT28WB38M9qNp1l3DuYHy2VlzEFwSb1Bw84u+
 yts0Aq8yieBH4mk9SvR1tHtcOdTRgfwJC8UiYhj+v4sokoDPtuGWHbOVjXjRVWEpIUJ2WHQTk9e
 1pn97i7VV4Xod/v793M65o0GJjMzjhzCV9hv8sCgsbtOtxSe/IsT80Mv/ZwLRm+h2e0VkVp8ox1
 Ghz0EvzUFwCdZ4ZDna0RZtQ8yEf6U1diOXTCjMSPEuie/dlvWsAuGFvEowCquSz4f5xtsnZ9gFK
 vNnm139Qm2L8WhWGSavz2RnZrfocqgmKnsQVhaTLaHsLasN74mIjnN5thQktK+eac5woAVPmS3z
 H/Hq4KZMHSewqOsH7N1L4NIDJTM96sTfla4S8qSWUwuv7StgZbBn7h4TpWo6UNKVEdD0VzrsdBu
 hx6fwTesHhefPfA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a918138 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: SaPPeGDl4E55ys_VQ6u99aRX5qWs6Mea
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX1ez6eK224tJJ
 lavih/wheUvOAMn8lAkFqlkuhM7KOaDfeTjbnGZ94ALVKypVezpiq2gUL1FTBVypiQRp4BlZwaN
 6ZGckKhswe4w13l4bV3lmiuvCwL6G5s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX6CFd2Jhr8OAi
 rfOUPmVKkIezOexHwr+a3KuQdJ+Xvt2viNjBCjFfVUgTI1yOJD113pNTPSVV+0D9EEEmgQlNLV+
 VfkkzIUQDaos94O6wCTUyTgbGsRnlDMlXeyjusuAafezP1kj/IRn/2ByqJByvw+TypW3CWBd0pK
 Cj/LfCefWOHehpBK5xD160qo66wdvmDP8wXowT+7lziWl2Nw4PKeIBsPAznkTgzwXTf9LTja17L
 QgWDJBxvi7eKQRngd4j1u6NIKLGyfNNPN9dEsaBcGs11cK1tTmo1tBOZXeiP0WcARxB12I+W41t
 0TY8v394HHbUmtwHJ/rk6mm8Z90mh7hz9cVxal6p7wmhXjEyNHDnFnyTOAsbEIur39ejaZ/EFH6
 ZR3Jfs2j/bWFXv8F4SUZVJCiy2x1UMNkamZMma3gGdkGYoqXuq/3QF4LUHPe2+svbaPC2Z9l6tL
 NOPrRDEvk/eq1t/GC4Q==
X-Proofpoint-GUID: SaPPeGDl4E55ys_VQ6u99aRX5qWs6Mea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 68d5d9701a7a ("arm64: dts: qcom: monaco: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 4 ++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 ++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..25980c003a49 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -585,6 +585,10 @@ expander6: gpio@3e {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &iris {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..e9b807df4a8b 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2723,6 +2723,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		crypto: crypto@1dfa000 {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..fbe36a3fc47b 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -569,6 +569,10 @@ dsi2dp_bridge_out: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &pmm8650au_1_gpios {
 	usb2_en: usb2-en-state {
 		pins = "gpio7";

-- 
2.54.0

