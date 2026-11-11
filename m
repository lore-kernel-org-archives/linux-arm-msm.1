Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382309;
	b=t0jm9dMPBpklkPB63UptXvc1r8RvIEZUkMgX1jmbA2hL78Y5asxY8OV15P+UaYzSLeKW
	 b3BOn7JCMf7FlWD4PJhW3cP7OCZogvlwXEBk/B9c5DDDtljLTSTzH6/HcO8h5xXhbafDa
	 6cgna1V9BWYbn0NUuZuixkLz/jIZu4tENKC+x4M8KUwvVNHQpjPN2Y0LwishxQ0vaEfvU
	 TZs2rBMXqBbG5zKDOpNLqE64LMFLEAmseE5J3Y1X/1thIIc2U0blszgzXvGpkf2zPSy7l
	 1bd5zsfH6S/VkscH9hXfuH8F9wxMVd+sUgEiC2xb7G6SUFMsbaZoMsirw6K/BTay91g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NcNvvo3woIB0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=;
	b=fxOdBycSzYBLuFAdp54tHtxn/sTu7a4vkHoKz42Wwk8D0X4BQNYNPkjt7hwgl5C7aGPA
	 OwHNuJYsDIJXhuAJZeyrmbBPc8jkkRscJteZ6AL8/S+hZTb0A2OIa7WpS807uZKyPn6pW
	 TKno+lA2/H8OmMW7dt5b7l2qJULKSWx2LQs2J+hXiCL9+f0nvD8cPWgpzpih+Ke3TpRpD
	 x/PYsaoaFoBkvUeB6o3vVbjxPuDdoXRIUt5ckvHfR+l3VFHuq4WI6qHK94/UgsXVlPzXp
	 GUoxyxcwzArjSRGc5VzQE/6y8JYHqf0Rqg84lkOSnWGczhTpuayQhoqdpt8cUSUYiIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zn2bEpI4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CrfnqRwr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636A860A262C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636A860A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zn2bEpI4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CrfnqRwr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KaDD2021354
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NcNvvo3woIB
	0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=; b=Zn2bEpI4cWALr6LQdp3Thd+FyIg
	3kSdtDhN2872o9bSZR8npyUQ7pu2BpRIwiVsRELHSGHHin/yuC5xWk7br6wAGBuq
	YOwscxtgnnV1leLBCez48H9tsc5VMJb22MNPMeg1nphxenla64OLjzG/PfAkzLuj
	RNJ2JXEFpGOCRr1KQy3TU9gRY3OxiX4e7ltLWF1//Oz0nYYfZpPXHI7nTMAKGpFi
	CDb+bN+aT3K7FHStQyv6yS9dS7cvrcuaOcHOonjWza5BEeBQw+XaHAWYNC53M0kX
	ucwfJbB4IrQFsGCEbzVvvj0rZvFvaFKVZXxZhXAn5zwQ3UqxjkuEJV367kg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pvbs1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:31:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so5078027eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382307; x=1794987107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcNvvo3woIB0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=;
        b=CrfnqRwr4WeietlPIRltHIYEfPDJ/MS9JSCyi+HONJ9inaT3rvWo7CYOFlRLReHb6v
         BonvyhiDjsSUJKcwPjUt+VSXeh3tJ2naDrSAxZx3FzXCs/tlkkLgTdjBktlyFFLGKd0l
         DvnzSpKgyYB6gu6rFhsJsy6/ONbcB3lb5FVX/+OkbXJZsvNp9vUErHdSxGrzy4XOemUm
         sQ43LeUiGrux4NafSN3Y5nPPydzKOVn/9NB8SWMAbwFc3GNwTitkVlDft378MG1ITvDM
         vi1P7uO88PMAKcU9FxGQWybeP/W5w3Lf5U2bYWQ6+lN6uAuJQgVU25FrEmsvK7dFSpAg
         SnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382307; x=1794987107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NcNvvo3woIB0oWQpL6j7la8H5u0j7QZwDyKdlDHI+3g=;
        b=srW9NxOPLlDJ1YyIVCa1xnNfLzzG3Ug/KRi3ppZVBc4n+mAVMN2v40JkEXxoKrm0ak
         HADJ8xYuZJZ+F5eKIvfxKTAUp5kfXxfU1dL/4KK7HnSZCA+t9R3dBA0EjT7m90VwICsj
         2FlNmIa7YtzRBUrwLLqKG+gPMr3Dm5uhcwSxR6fVg79rprxntBBLINNzToGrUZgTU1qj
         9JxGpFEGiRTC5sxWgWeX7+yaCecuVCVPqR25XiBsb9dL12MAleuqvEs7K0VNsvEZbCCb
         qmUXsajwOLvY/seNRAx0weBzyknbJw8B+5tkVQOvHNfoUX8RVxcXH0WbRG4ExbMgN2Ix
         +WRA==
X-Forwarded-Encrypted: i=1; AL+hErGAwa0O1tIWRhcXFkww4Hd/+IIvbP8lKmJgRlf8oEKoaJuiB9aMRmjXe6zeIRiylN8BCzVhxkafhjxLKOoa@vger.kernel.org
X-Gm-Message-State: APuU4Z9equl9FqqoYYKHySv+C5a3aOIa7rMexBlxgBXj2uwebO8iJMf8
	U5A6u8cNbdl6NFFgLxbbBIhtdRb4drqDcO2zejNyFg1yrqSLV6T/q2Wj3RjxvfVByGijrzf/gXA
	oCC7T4b57rJXM6vZxcBaYCixdaj9+R54QxP9fK0HusiZzCZMcWdsH7XXhPeYlVZEKesqp
X-Gm-Gg: AYBFou0wzFpiMw0SgIvpIaXa8IsBVcPa2pA1bD/N5tWbCe5ES6ELCUg/z2u/E3yzftr
	FCB4Pz6U2KZ/tGbC9oGTjQlGpaH8qNge/0KuyZKbOcrwMfqmDp8csU9ciXzhCFIrHv/k67NcQjy
	Pndtffla4iZpEABEmL3zw/OMzRCd08PxADHknQdk2Qdq8JDSe8hEge89LWNlFu1Tax99MtlsP+/
	LhpKKDENI2Un/xv7JTU2oWnY2ZXGTuxs3Po/C6efIC6/8+ehwNw4/1rIyhku6hvVgf52M7xDFI/
	QuWTFaBCFvQFWS2A6CxX9ZGy92V0LKMAadS5+fy8tb2tPhOWzfGVIMKU2NHxuhNac2nVN9Z3aLA
	p931NCT77CtJlu9p84/O2NrfwUh/4r4CXf9psR2F9o4G5GOqeDX2Sw/j6dyZdHbJVarmDMAzwEA
	riDEbd9E99cG4SJPkWTl5liImSfwgYiLOm
X-Received: by 2002:a05:7022:d99:b0:163:a197:722d with SMTP id a92af1059eb24-1b3c023c7e7mr1663362c88.4.1794382306249;
        Tue, 10 Nov 2026 23:31:46 -0800 (PST)
X-Received: by 2002:a05:7022:d99:b0:163:a197:722d with SMTP id a92af1059eb24-1b3c023c7e7mr1663332c88.4.1794382305578;
        Tue, 10 Nov 2026 23:31:45 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:45 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 2/5] arm64: dts: qcom: nord: Add gpr node
Date: Wed, 11 Nov 2026 15:31:18 +0800
Message-ID: <20261111073121.3707030-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af419e3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=LQeRsTducJ9VbTWhBPQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: E5pYqDpfgGjUnKvZeAFLClfytzaqzvNe
X-Proofpoint-GUID: E5pYqDpfgGjUnKvZeAFLClfytzaqzvNe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX34ETICg1RlHx
 IKwjK+ubTVu6XErw64Q3YJiO9KCLSnre6kB+qFblT02BaPFUiKo0vJQ1gsH9iYCmDIuA3en/v1m
 2Kvi8Ntd+Rzd7FozUdr+b+1Uvi2HeNI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX7c53IMNrixNh
 rbMm2wLcpCHNvc8EE/qW3yzm2Y91CoFKItGS52MyTckyf4EUIKfOAKoKXKvVuASXeNNEYnfw8H+
 p4f8VW5rAYGLPZP8vjt9su2bw+/obw627UdyS2Slx4F6wSwaPAasDMMl+a6Hcviw3UlJSjYO90j
 R5zP2pFcVhTYIJ4q/ljjUWRtZ7pJbDdLpp0adYT/Fv4QCvvby5yqGq1QnvmnMR5xzha6F5/qJnX
 +nz2gRQv8u6cUkwzr/RUSZBss/hN/DpvYh6gr9cFQTpfWl0spR4s6ytiEtw1KsnWreJ5xQWB+T8
 8ltjlqoRuz6mR0j500bkoHhVTM42KxHXcD5tmKtpcGWwslcNtwObQbJlioS+QiDNNYkcGisRv8B
 Kkx1+U2QWMjvftQoQBmFk6yfwcpL/7wPBwAfz8iSpMFpvSkg2iM9Gw02OR4Z68TBwxmCNbXAqE9
 q4c8P0TJP6Ycr35StKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110029

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the GPR (Generic Packet Router) node to the Nord SoC DTSI along
with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
audio services. These nodes are required by the Q6APM audio stack to
route audio packets between the application processor and the DSP.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4..c17a8a83e371 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 #include "nord-ipcc.h"
 
@@ -1799,6 +1800,45 @@ compute-cb@6 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu_0 0x09e1 0x0400>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.43.0

