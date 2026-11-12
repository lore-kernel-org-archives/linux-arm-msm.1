Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458218;
	b=RtaqcuObnvtp3S0zWeOvIPk0fzKHfUZh8hEuExFqbZr7OSJ44dcXb/Ok4dXJ5X09qdyO
	 x/Rn4xpkvzMxMYOvyoa+s1FkS0upWIZi1txBZ90cuDQSmoSKntadwOgrjZFNBJ3LQS2Pz
	 eLe9+Scz5PzHRLjRdY/iV0R7DZ2PIOk0+lhXptwqOHML6iX002gBNPcBlWcwojFJaG58h
	 7ga5MLJVPhiksb6MUSSEeTmvek2NYDDm2Z/zL8OkTpVF8ECIaFMq0zCum0JyoIFBGAmcv
	 hvC4/9HfI3dUW95oiRorCDqtL9OC9TYRC0+ypb01JaSWz8cMMJ8bqZDs985a5FRBblQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DdPTSI1F/iSJVwr/1+LHG0Mawz+wkpy3MXahzotT/ig=;
	b=Ym18gxgTuz3DsK3OQK9tY3JAyrpayLui/f4496DgFuHRG9KAnWtjuGMMfmm+P+iPHs2J
	 yW9pypQOBr+U48sETHZ+qnYhhqtzJwZm5mPQty6U75c8gb4e13yxPOa3JuydnAjo+3OP0
	 dEM9SX1NwNakCoYAmmKS6i20g2CRoudWCGTBZdou+9TIgKNsO3fdNExuhF/+omkjCKl1u
	 DbJcBC6OtMQZvllOUyuObv7HH2TKhMdzw5R6fvQXBmqZvYdPmJebJjttPS1zmcdoFTHPj
	 nd+qHWehI3gVsPi1Kqez0V2vBDkn0y9skU2gjFx0Y5d7BEACncApWP/3hf5HJ21dstA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RMYCQSTr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGGMt5qK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27625606F8B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27625606F8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RMYCQSTr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGGMt5qK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZOnQ4092378
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DdPTSI1F/iSJVwr/1+LHG0Mawz+wkpy3MXahzotT/ig=; b=RMYCQSTrRz9EAJvD
	2aQWz++tt+b8+61hrx4SvHOEi0IxiSjG+e+X6LFEm/wlRZ1MF5+CePsSu1alJzPV
	WMSWbz91ggISuWM63UZItN8a+MOjUvs7ww15qEpEGa8ClUYSLaf6BLSbwwz3/p37
	hoW2xOVrfv8XbafRgl8Rhn0nalW+XwIn8MtX3SlIq0nUQV52FOhI/NiDyeWPKguy
	5zeV/+nJWDcyQs8BGyQMAISzkurhNlrTBFvFfwx230uyVUwXvwdkLhY7gx8zRJCp
	ouj3GZa/BKWDWyebbFkOfKFk9kQT83BaSdI8X474QiZQDRCbx/Kk5XIjJiYVfro9
	X5cy3w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8h6qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36ecd5db581so984049eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458216; x=1795063016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdPTSI1F/iSJVwr/1+LHG0Mawz+wkpy3MXahzotT/ig=;
        b=AGGMt5qKonzerkdKYjkcvheRgcaicLNswPDB7ZEjKYZNdYTd8/kIEWgDyGs5ptYgKq
         Juag3EjhEnX/SWKKUQCtZBdzbEChXli/wCMSBVf0KyuFpO2Kk4kKoS8WRS7OvCt9MH06
         E9pm8eogh79gxuyZQcGZSvADTRmTCDOgUGCGHlaQBjLMB73II8GjXFBvifDbul/oYPMR
         BysaFA7hfB0h52ky84keZTAZPN76dOAtJOmsJ7c8eVno12TCay91RWIO1LHL8QcxbsQ5
         CBDVP72hrCicNj4yvRTaVnii+qyo1JO1DYHfMb5OvKA25PhlVBbl/Lo0HtshmyGZ1JK0
         nk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458216; x=1795063016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdPTSI1F/iSJVwr/1+LHG0Mawz+wkpy3MXahzotT/ig=;
        b=SKDWl0ozT36UnWpToug/iPFWN61Fo1t8OpTTmJTe439ryO48KoreKuRR00RKqZ8tYA
         LzqmBljwZss5s0ePegPkw5z7p5ecf51Ma7NicNdYw0/saGZiE7WRxovAcbkBW+pSy6So
         JvPJDt1VbUCYqprJTTotCNZVbow6UU5Abfm6AkfeCoIOudXd7DaLaoeeY964zh+5fc+N
         k0tTPNjqjiEhm219fSHKORNIAikS/3HDPKw2c/1Ck8iSbebgqmBxAUxsSek+VDgVmMMq
         Je4QbbvbV/bmlkr30TCueluqdwfdWg7X1fMR6tn7i5VQY19rE5jV/coDyZMhzWuhOIEi
         8vqw==
X-Gm-Message-State: APuU4Z+2P1H6rwLDEFJaON4sjxAw+MCYQKEnTlbpJpIB81ifVKbZIu3s
	Th8OlKyG7PkYtlBpihKXZhdwMs6rwnXeAXWYWEbQwPM3ciYi3DojuS1R9TrBKua3PG2NZVY4+zN
	OvMo5E2W8hPE9wd/OPFvGZgxKnBBFyHbFRLz4eATxXSw+STUf0fB1I/kIWN+0Dxxo15kv
X-Gm-Gg: AYBFou29it2xlYuaU5CCkOae7Y0EJNZ0jaRBa3pWLU8XmLnK6uw0AN3HEW9O+QdCrTt
	0NWwdjNM8qyRGsgWynlmARFfbRSOqh4BpbNwqpa/NJ72Df0+GfS1Mhruq+2WHyTz5hEUNyUAVSZ
	KYisGtEcKwMb0BUvbwa4jFW4vSRsStATvId/QoKdhWsbkD/VTuiqU2QalmYamXW0DCatvG+emE/
	fcEXMHHxYUJJMYvF2ECZKuZdO154dPnSNo3w5dgcvoakHorEj2iXVXUsEvN2Tl7i6SRBGcKbMo9
	H/3riwwiCKYQeCq8ozilbWK2RnolYEe9PYs7ev94QaTOfoJt4uQjfWSr5WQg3imUNeJyd7Z0bEp
	CL1lV9GB/PoTrzKJMvia/DJOCXvVFnO+3Z5QhNmfB4kv02of0lWKzzAMtudv/fDnXJgDyn2jPiZ
	lPRTiCNUvFkpzUaYFj5Hn0EXVaI5VKjLUj3imov/gw/8gnMdRhTpjMUhrfdPlOobFFdO8MPJmTm
	rbLSn0=
X-Received: by 2002:a05:693c:2582:b0:378:314:4042 with SMTP id 5a478bee46e88-37803144bbdmr1158208eec.14.1794458216226;
        Wed, 11 Nov 2026 20:36:56 -0800 (PST)
X-Received: by 2002:a05:693c:2582:b0:378:314:4042 with SMTP id 5a478bee46e88-37803144bbdmr1158191eec.14.1794458215674;
        Wed, 11 Nov 2026 20:36:55 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:55 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:26 +0530
Subject: [PATCH v9 07/11] arm64: dts: qcom: ipq5210: Enable download mode
 support
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
Message-Id: <20261112-08-dts-v9-7-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX/11XqLbnWmxJ
 MW7byL+I3CqxAnSfuR+Zjxjb9+QyXkmXGc1jxtsw5+wicvXHnU3BpDe8EsbE2QJdIK6Mbapxjbv
 AOnyI46h6gO8F7bNS36qnvBzxWAAn8Y=
X-Proofpoint-GUID: xcam3uXoIhWkl7Qr__xO7RHUMZFcYVoH
X-Proofpoint-ORIG-GUID: xcam3uXoIhWkl7Qr__xO7RHUMZFcYVoH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX73WBHZ5tLqmT
 HQMuLJ/Fxartv7jT17fQkFJLjK5lUmx37O3f5C8d70yQc9XTI0hNFaIhV79fMUIKJwOLbQbddDW
 i0N/2Ok8LmWJQx7lKkfrGNbqGJwqiMunPblzzc1QukWGfFh6gnggoMVnN44cHqT6LN/37eVc2hq
 GCKuPeqtobZRmwPSNxVdFcrb4o4l2WjSSc+5/HCM3YuqGYFKvC6YmsikxqyZTvI0TSdsgthH8j+
 dpbDXbvjVIuwO9W1bacSE8UXbkUnH3RxFwdoj/In0MLJj82ewSuCnlVl9WQkbOtN/FMB1GGl4wY
 y9M6vj0nXM8lRCrvO6OpPajOvjSE/F/45QDhgQCJEMB/OaKggtU7dNHILbQB40I9ljQ3oYShecO
 fY5R9sQMRMhHUupxzL3IIIlNfppXkfsqbz83/xa/x9gKWYTN8lWWSqJTQEicX8gbacOaauXFddK
 S06NEzVJJaBA84BZbyA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af54269 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Enable the support for download mode to collect the crashdumps if
system crashes, to debug crashes extensively.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 267255d2980a..aa1045f20ed2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -121,6 +121,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -425,6 +426,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5210", "syscon";
+			reg = <0x0 0x01937000 0x0 0x2b000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

