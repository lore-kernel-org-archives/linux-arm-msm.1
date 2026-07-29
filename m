Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA48383328
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292846; cv=none; b=OaEcFXBVJlk5/MYdgkeqrkCmfyE8wx6dGly4Xr4wHUt1hO3jIk4gxCKuPUbI6WNKzkHK+ClHbNcHbgjGaa7HTURiPl+x8/wDgOJGMclrg+bgeG1UF2/FU5zpx+SWyOTOLPdQohhxiCHEkU/3BknY4ByEjlMmxvXKujmTH8FbNVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292846; c=relaxed/simple;
	bh=8FPGCM/3nQl6Ae95OG1Sc2zmHY8E2bujtMRY1AVbem0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QwgrMa9j1RnZXfFeip9jnx49xEiJ+9dDz06C1JMWzfHBNdTnNgUzHiykaHkyZaR2y26ZQ8r5fcgj6X1OKDSYcwKLY+CvkKwCIzfDnHCpAITFpGpTfFBlAci3Sxqgqw/6710bad7vRYTPMI14eO0SxNtOOitMVsapcC03sY7Mah4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1jaBMxl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2VHCx1W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1jaBMxl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2VHCx1W"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1HOls498375
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IHeL0BsD0/dyUBTKXpeuMnDx9bMYhzFRhxErLeZxXHE=; b=R1jaBMxlRige+yVn
	7kxbpU3HfyRmDhaEDMBn40ds4GwF4VQ9ZpGO/JEk8OaPmxysTzNMCMrFG6f3XBOx
	JHlCdSNVQy8jLTlZ5rqVm8Jtlln6JUYjKLbu28vyYqi6YuvnGP7xDy2ujphQIwEG
	XWq+GFz5W9d02PUHGoFXJ+/a4UZbd+HXGMJbziKNDdSvxwSy/DUo7jrn0+Ij2yYH
	J27ZVH/886GCXP/XukYq9l56ilflZefwO8u8lKT8MoFkOqcKgpvNUREpqfYlellA
	BD/YOIx+v3rzyp9072VF9LryL78ewRequpGy/iYOboHqzM2cHQP1jVrfajP0pXRf
	j2LiVQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq10c9rw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca0ed258cso894645ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 19:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292842; x=1785897642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHeL0BsD0/dyUBTKXpeuMnDx9bMYhzFRhxErLeZxXHE=;
        b=J2VHCx1WSrBw1WGWuc8brzmTByaFdIbGOVtZa1rhr3tqQHYfJ0r8vD6aDl7lAHo0Og
         44nnE2BFo4nqVN/O0VxifzoUni31xscEQFQ3J0YHU7Z6KAeaNV+e+dqXXbkzk7GFnWfV
         FlooR6R7hBiWMb6vfiGfGT3AtfMqK0MG/QjGzyyQSJoamNMtfcmXq21heSjESMzhoEE+
         CTOH1sCtXO7D/C0MvHEIsGFwm0EOl6CY+FqRY8zNJ9eUm8WfluOjtJlSyi+A6jP9mu5N
         3KEge7bkB5PfZ9w9cdy8pJXYwJlfPko/0uZtg0lLwGaIW0ASOLBVjnP6EY2mlDZxAra6
         Zcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292842; x=1785897642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHeL0BsD0/dyUBTKXpeuMnDx9bMYhzFRhxErLeZxXHE=;
        b=qi+89llYPUR6mqVDoQYql8xdVxAPUuFv0l6u3BiEAg6M+Ms3qSGfhX8J3x62hHX1LB
         tOVXQy7z5Fc/U6AKGDQyCqZiZkQVZ6Pea8iQGMEU0n+a+CNsGPi21nNVuft39/aZbc3F
         WtSecE29+3mfaHnjHu0wWnjn+Yiyl4yIA64Qs8a+X5cfOfwlNtvwMOb5AeISkMqa7eCP
         +yHtkybSdgqVkrH1aJZArsOFh5IBtQUgosGN3l8LFXeubz/l9NajJ9wBNxjP3a4vrdwr
         7D6BROez/m1YCWOSdWPDt49ue9BeLgqsEmdeSkLFheVhA9LPfsEgpmzIC34POwMFwda8
         wIgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqy4XUVmsboLR40+TI0+VTsSZD+1SFIQfWTyppYyxku9zSrJcusKwUEuieRGbSQ+U8mfQ2C4H/VofK6rhxq@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ5kkYBL/sT4bcnsHw4BRy+SKydnt5WWumu+iXcZAtaL8GENLO
	gdJshFX5TebWC/LeCu+bYaKjAxJ3HRNNE7k38s7G5FQN9GaEg8zeUS0JsntOkeOQqxobi5shhDd
	qc2JRhxZ78I1OABILOHNMN5/2RwspOEIFKHTs2iyNGSZtRqDv4yaR3UTI4pXFqE2OJQn3
X-Gm-Gg: AR+sD12M8xtAHHd2NnK+549GYXpPEtbUJq7Rq8eaf8iMv/8NDnTGqM6V9LbXCiyvUJs
	U2Rx14MRN9Tk5J4xfCzplmpet0JfwxAyCoK8ZDeD579EF+xdbBY7a6s+KtsYOXcmvv/g6R8+8kk
	sVcozahYgoAd7f+hda1CGHHkv9BhLMho43EFnqeckmZrO3HTo9f+hkyk3uUoaZIR8syhkHWHtyL
	qO8eIbpEaX4mE53w5sW+o0gqXdo89nNhjuonPj4oJIGAJFV7lShY0KStOGAeojEmzatjByleEVj
	XZCIoO2KjiaaUG/YHEXM/FdtpWfFRSu+KKq9uJQCqB1Cz0skNunnIKb9TTz5+qAmxZtaLhqjnyr
	5HrvnisL5SZfYPj+IG3z343RS24iM4Uo8xETkGJtVKqdSEIxuwZM=
X-Received: by 2002:a17:903:2411:b0:2cf:7dfa:7f56 with SMTP id d9443c01a7336-2d015adf09fmr49172535ad.2.1785292842571;
        Tue, 28 Jul 2026 19:40:42 -0700 (PDT)
X-Received: by 2002:a17:903:2411:b0:2cf:7dfa:7f56 with SMTP id d9443c01a7336-2d015adf09fmr49172225ad.2.1785292842138;
        Tue, 28 Jul 2026 19:40:42 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc64c2sm4052694eec.19.2026.07.28.19.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:40:41 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:10:30 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: monaco: Add graph port/endpoint
 anchors to pcieport0 and uart2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-b4-monaco-evk-m2-v1-v2-2-0548e1dab760@oss.qualcomm.com>
References: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
In-Reply-To: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 9TAaUo2g5AWZi69HyM3Gj-uGN260aHDr
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a69682b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YQEAmTBiAzzqGyEmVFkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 9TAaUo2g5AWZi69HyM3Gj-uGN260aHDr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfXys11ain288Am
 RmfYUVW68QCnHM37/v+p0Nc9uiWFBF+4imwsraLFASiY/+eUkTGsMBErM3wDSJariSPGCOI4I77
 xB9d9Hkv6OH6SZywaT5RzJeQRJEG6js=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX10DbfPvb6+c8
 eITpEGlqLxSh0ZWnIVOsNw59iuVgRsR+1TvgsIZoCzLvd6R+awT6R63AwQL4EI7nkiODN0MHEht
 fHwY96Bft5LmvyvNTxC9wKXMZBteolHZTLFgEv4fxnCIhao9JJIVZp5JugEHj1TgVi23dadTxm4
 8Sc2whQGh0Hn2jmqL46lBVrpc58y02bEJS0f15roMD+P+pWC7rFG4coajpTozjOpiKuggLtAp0e
 9rb+dHDvD1lNxA9O87eoxOVhN85L7YFvNdiTfvBfOhxsrrW+KCBpmjDv8nNuXwvHxtKONivizbZ
 IYPVBoGOlry2wnIu75LHsND/vRUQa9cDhL9yMPihDXDH9piYf9QBmcEOxOfmmPtr2PNYTwfchmE
 w6RYncFJV+zqf3VOYI6tjSRQaDgPBauQ8eDvK/D0oNXIeU+xdtop/0PxXKCrQRWUa/cvoXxg8ji
 83DCyjPjWmJZVyLDRFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290019

Add empty graph port/endpoint nodes to pcieport0 and uart2 in monaco.dtsi
so that board files can reference the endpoint labels (pcieport0_ep,
uart2_ep) to describe connections to M.2 Key E connectors via
remote-endpoint overrides.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 438ccf6eba64..b17d41059e7c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -1184,6 +1184,10 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				status = "disabled";
+
+				port {
+					uart2_ep: endpoint {};
+				};
 			};
 
 			i2c3: i2c@98c000 {
@@ -2402,6 +2406,10 @@ pcieport0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie0_phy>;
+
+				port {
+					pcieport0_ep: endpoint {};
+				};
 			};
 		};
 

-- 
2.34.1

