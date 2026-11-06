Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956900;
	b=eVkKSlz18+qv1V0+bfPjeAWAbCjK7q/13e//hOeoaLZL5LpS/M30vmsxLbto71f9coUB
	 IjmWjAtPdWyX5awsXKnczp/gSQSYoJI/Zf9IvkoxSKAGoJHNeme4QQrmOSL+d2f57oal0
	 Suea1bVEKu3TvXUMSB3K6DtRlagBMm7L9aDJG547Q07v3GHDQy0jPvnIn4SFwh2YYruRq
	 nNTYx4dCWVTGBkTl8CXSvFSCRkdUtRFcXffOfIn/04nZLorYYHSOnbcrugLQN7yZHgREx
	 tzmR6dgARQyNsYEJwgOri6hhuSinY6swj3bmPSvH0Wz+IhM+bH18rorf9HkrnBnPGzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=;
	b=4q95niW6fef7s1zxWeE/oI6cjXBydrCVdL8womfes2u5C+vZvxhxoBosGQKfltXfLoHX
	 OZ7GasdtfmerfhofDlYEWbXiO0dx4w1/ebAagiDlObPpdb0R9L59v5yPZ0kkkMxgvHwll
	 pn2ULvSfPI0mFADYTfzf8z5e2dsFSr+EdVB0WPCdcbfFk+50EwAFmYY4h4O0f/mLs8mcn
	 oL9LQCM14Lk5wvanqUcih9rwY+XXGS6J3/4KNerYmEEARLZsWiQ8NV97jy37WYGGLfbdX
	 P59R6ROK/kfB6PvjxFd16bwoKPDQ8TUUbx3tZv44Y7g88TbM/4GediL/cNgrstML1lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bvR65mQq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PQrjFSYe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504FF606A334
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 504FF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bvR65mQq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PQrjFSYe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R3ZC129026
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=; b=bvR65mQqcln0yVQd
	oZRk47zerB1kOC8k1e779bDptbL3O+WP2Ft94Vc23/rOrZ9xfT6iOSksOoWXcxVU
	4AD5PIwgD5lVexJUuWzqAmPkHv0jDaDNy8zVjc8EiXctd/qtWfODL7Ayq9/pKaxg
	Lpx5M7YXFnAl6qaW2DELZ8HSdhXOherNGe36ETtsSqBZoopjl0pS0pe0a5srtFcs
	Zzk8i8UI4GRLaxW3uTaczA7FwpapFkM+wAkXjmXlT11cpcRl6GlSL3Syxyver1PF
	mdKBmMzW1nsOmRgt1MZ7itGej6EV4aJEn9j7JprtE7fVE8ztDI8SF6tYQL2yszZ+
	DHuN2g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9t3fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:21:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36cec75d8caso646515eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956899; x=1794561699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=;
        b=PQrjFSYeGXsE0PI+OByUVaPY+nkILvr7VieS2rV04u2jmaJElxI2TuIgobPpuNqCus
         DFhyZNlMBQAsKS+nHjupcNl7Zgf0ZVFTMwtkuW9JSxK1SE+ZYzQw21hrRUuqDbvGNc/u
         8zZzpEIlQTnraANo1rYtRpSHNvoCpsNJq9zSGFj+qtAu3M7o76+dlraeC034fZ36n6XW
         DvbnEmaSa4H7GcJ7ysDP7MqgHCz2rH35t6ogHBjKKkLInFUoFSOhHPM2QAsMdRYdFd8h
         GNXdWSAkXMSa3HWH6eis+l5b/6OYmyqe7jSCN8xmJW/ufsf8pfUMjvzi3SNVWmD4/263
         cePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956899; x=1794561699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=;
        b=t2IsQNEJq0KH4w6UyBSn5/BXTwWQoddJKzE7dQbZJYLD2z1g4CbI0M5MHxa7ep8R2p
         gNg3sejEMmTatKBKeGVAFqkXSqPqGYoA4ipKeRGm6iLLqNCN75mVKj15N1EaSl1dIleE
         kEXneAtN5yZ1D32rEMU0CuA4ZGWqdaEmcD87zDLCcyfr4OyV4Z6Af8+xe9OtnFsNkks+
         MjPuh4oLrAvclLPaEVXDeegfkIm6vkD7+wTttmYPhWQi/PxcLds6Z1BJKF2nnZz8W1PE
         A4oCTVvIX2XRlsnKQg8HClxUX0psnuUYmnumfC7UOGyLjaJsZJciTAcZnyr1E1l0YLB2
         rdvg==
X-Gm-Message-State: APuU4Z/g3d/RnU/oHgC5nTi5o2xGU/ULnn2dOygz5Zq0u6lM5cuCqbQb
	Tmh5SR/jJg/7yn8liEKDmIMvGWsizxgCkZ3kqcm9doPh0JjnJ6gRZevu5Sz1nL5kmOg+xDJdET8
	mRqxSHg40o6UWmR35dn5wozt+mtlmTZMUDNVeyDfun9ue1HYOcpgLmrmoV7h1pqxEp0gu
X-Gm-Gg: AYBFou2GKUvdBJffdrNrPtRQZfm4qBz8jqH23XE2AbZ0KXOBz7DEzcZWWOEFX03w8Pg
	GRJdxVeUkO0fwqnEiUUycGCTU7/bTAp87EEi8rp1kR2G/TTXQXqZ8WJVz5cw4jTWB8Dm8RHTv05
	FVdJb+F/bn+vTvfaouotiSMRZUibmbmPa6524460iPhLEAMlU2psSvhtYQtowJIMwvO0sK+TOuG
	+ySEobmuyHK6ZCn4yqQyS0shM4F/ZV9zYCW19UMxM2mNFI0nYWEL3K+sR+dEIEDRDEc8wqMrF2W
	Tlpvri2ioivLhYh2XzpNIE8hW++jFPvbes0ecvh4iWYG4Fl2bNha5rpWb24+OLV/qxjV0IsI2ix
	8gfGJKdrii0qg6GelB9aZDw26g6gEufjLD5Lxk89xm6gS+DgJwQTuNFfzRL+zYWr1ntVsC6KH9U
	kcNNDDq/19G9Umpl4WQTVFtiHAe/ekNNgkGfpc4wvn0a20PYBAlpjNSJpVsjkQzuIW7ieSaCsTZ
	9J3fQ==
X-Received: by 2002:a05:7301:b82:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36de5f700bbmr7371000eec.6.1793956898820;
        Fri, 06 Nov 2026 01:21:38 -0800 (PST)
X-Received: by 2002:a05:7301:b82:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36de5f700bbmr7370963eec.6.1793956898292;
        Fri, 06 Nov 2026 01:21:38 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:37 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:56 +0530
Subject: [PATCH v8 07/11] arm64: dts: qcom: ipq5210: Enable download mode
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
Message-Id: <20261106-08-dts-v8-7-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXx/tLgH6x+cjZ
 lFB5HfPnGxTmAyRttoY9LkXH18YgqcserIQ91TPigIiDPPrDUCfBE+7sRP85BPp50QkXT0llzXI
 BwjlThh8wPNxmkLEPr+ACE/Qiy/E3c4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX+w0cm42rHGFT
 d9RjiLtyvxt1vqeT4kH/1MnZ2b2q5LOm8CVRqCV69t2maBVBdYWxLWQ8gUDuhr2UVzPOnajZJpO
 wp4+LgW+wwJH3m7zuj0RCbFfWg6CLTXBuSEKYq/UXQlx06UcD5Rg4M+5aIXtfLWZDcUrzkk+QuZ
 Oe/Y7Q97QFZXy0T4xt/FnBe75P2O/AgTWT4hTLr4dxk6TGAWGiT3aupyK7BpVNK9HOefdeNiHLg
 V3p5wa5DnluwPLWIsmlp11CPitWlZ/TXScrKlnYQ+TUvRqnpXtXN5QKQ3HidIDsz8D5vOLgRIuJ
 63At7AOnEBltVo37wbfSRcyb/IvOjELjIi5wdECn+NGD6EgIScAD1ca+87hSxjM80KIHvROC48M
 fal3kS6bqgdh3+QlPuYW7Ek3p5NpRogwZ7o3sCEOP5fM/WzaaJf6s22odVt1UCqrWhm/WyWgClP
 tNDn4uemLJQAjXRwnkg==
X-Proofpoint-ORIG-GUID: 1PknVZTqHWdaF_hQvhjfwwLGMUgDYG4z
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed9c23 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 1PknVZTqHWdaF_hQvhjfwwLGMUgDYG4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Enable the support for download mode to collect the crashdumps if
system crashes, to debug crashes extensively.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 705d7ed48713..de3504395c48 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -108,6 +108,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -400,6 +401,11 @@ tcsr_mutex: hwlock@1905000 {
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

