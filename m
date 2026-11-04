Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801036;
	b=Fl9fO0sYWjdF802pzSwDWm6IJnt8b+sdITaMFGgRjkgZrIsPfb5jZk/US2WGPx0WHEM1
	 b8uhBhq6dOidAIBtHlmpR5zg4tqsxyxAGQDr/FWOdgrBZjRdYdftTrvGGahHLdUkJLMgq
	 Q6EtY+NZ54ulIMsY5OuJ2pICDgi/PWlyISjQWieb1TsmJNjNQGEzY3u+pqWMVjo0XGih0
	 JKcwCWjbyeqhbXdGWPDL6Zs5HRY2Q1OygJTrpiKIZ3zwGhY2vFCnQJKzvdbvr/PZ1OLfQ
	 3fg0/uIzGRlvgenKZuGrSjM46UdVWgh2Hz9kne91SFCrBMUZk6S9ilbWkJVt38tHZwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=;
	b=spBYvMhH6lg5mRcj+4NusZdjN4gBrrJE21NK35PZkpMR/XblcwWcFqpZRLY3v9Ezhiuf
	 1WmpCUywV6LFNYzWhcXDe0gP+xZUjvTUMq45eGMnKj55eVIu8DRFJ6FrbIEX4Zb1aQgFL
	 ONhncSg2O2yJtGdHmeJJPxhDHv3knIINilOPKFJzcr7Vc+vbz1l2On4sYZjMQxEnlbBG6
	 GO1cwOFTjEqc81RBqKnqM3Py06zAHRXTBoHjR8VyYL80TWe3oRk99Rg4ESxJtGHZVJlie
	 f2KDygGTm/sexIyQqc22plyFX1qwiXHeiEoELBCv0n1W6Qxbrnw339M/bbs6NOAqaQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LXZTo5Km;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XTgjxl4z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AE9606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 14:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AE9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LXZTo5Km;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XTgjxl4z
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZtsB119357
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 14:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=; b=LXZTo5Km0A0vFqq/
	6Y0PXUM0Hds2e/I3T65N3lXnTV4dtiiwmrFv53Q0UGQFgNTpetWIXSjLUNQDOF8A
	U24XwMAd5TktWstO1bXssbRUiD5P8EqL4zRpHJLeYnrgpxiHA5Vb8leJv9MxPDCK
	aO52Ogw66FVaX5Zyj2raKE1G4k9rKzm9AyWHJSx7qRZtq5zB0vbIxMEcVxOTKCiz
	X9mvA9T0F6W4Jsjo/p9T8NNzY2tfc0I8S1gLHmTgdgFaYzr1JnTUitx67Qx7fEVi
	BoqbLzPB294eYHUCZ+43cBruXROBIvjzOdV9wQm2iAdFI9jP7wh2QuHbMBz/tpoi
	7bYnjw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0aap3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 14:03:55 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1acbaf81bebso1080220c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 06:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801034; x=1794405834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=;
        b=XTgjxl4zEAdTMHED6e3/u+guzv7MyqQd3DHa3fThWi/kxKh/DEVKBgrebwJE81Wv/r
         9z422YHosgGQxbU5GZcgJkRs/y/N4UJOoksjebSQ2HIMYa7kNqtFTiDt7/F9lnecT7Ws
         wrPVpkqydj/K9Xz/jqwFqVkRFNGosxVGh1iGccyWlS+/nfBs3W2NyIYIDM2+cw8ZGaO5
         YEht0B7E+pzIrsKEvhurOYnz693FFUCheCr2+NriALq3Mubs2OoV3BBT65qW+5JZ9dgl
         RiW+37hJdDGzc2K2UJOJUjIz52gTpcpceBRd4u1tPgq5vWLfN0zXzO3774uM47jhUZUk
         t7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801034; x=1794405834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=;
        b=VeJnaaj4CUeDy6qZEZiNtFg39oyuWNgUKebK6VNCnfLy5gT7EW8OC0xAsc2XefWtU5
         pS5XjP3jwh44pLNKXtmebM1PFyZP54HT2ZDfGNdfWHNfz7Kstb3oHSPehRcurlgTvbFL
         TQQTngnFH5bdvAkv4/EoMR65nq+GJaISfU35+JwriwnIYvghlVb4UzrZm4YDRqn8VeNe
         xKZfXBS/q9hABFg07QVk1250QLnivSAgJphi5w3O5Q3wcHCSgzFDJ7JNvYzmPDfV0P3q
         dvhJmUeE4gA1SE9bBLMJMJ5LQW9zqvQHI+ubDMxnZUeiAxxlYpNuCxP1lLc92unohnEV
         4TGg==
X-Gm-Message-State: APuU4Z9ZZ0ysQsrqH97mSI/BF0ex/DLR0Ib/h0mYEAgtZLRRN74EVRKe
	TKKrQoSQF4wrAN+vw90/y8exS0qO2XOxy6tMJJqhF2BVTJavPsROy9GVOlD1U2T2H0HUz3QiHnk
	ZFku31dercDcstNVodSfkrp2msglW9t7RKKOtiAKfn9xt9x1jeRCSnvGaKmZI3DgCuy/H
X-Gm-Gg: AYBFou2GQliW5D1yrnMXBdBr1V5UoCdIpyjrT9SOtvvlt9I8zq0jRtXKupw542IR7cG
	5/lSVqdswFTkFwRahOAzdFh8YohUqml1n+1oOUCuRbkMZVTHqqZgFnhDT1WjDvEmkQvzcw498XK
	qK2hM/QfR2bUF+OnLI4DqfP+Po8MYscaMLKUIXsH+8OHcqURtLeBBczJLtjUfCZWkO77zHD02vb
	uQuYFA7kIxayDihmvDlOtmhEuS4rTW66eQUSLBJ/vWtfpioNTtaHKZSx5AZCVoHuZXxYi8l24OY
	6GOH1viL7MvyIPIHOHy5oVxXl4+ldj5ArzUg8/IHI28s0OcfJHCxRStDRsPudzMMuKeAN03FjuE
	1bZoaqMJ+QxRnIS2HlDZzm1IyKt1x8ZPNLo1PV4KbFitz3t70xr1/FZIF2lCpEXP2
X-Received: by 2002:a05:7022:2522:b0:185:b157:f271 with SMTP id a92af1059eb24-1ac5d2c58cfmr31477049c88.23.1793801034078;
        Wed, 04 Nov 2026 06:03:54 -0800 (PST)
X-Received: by 2002:a05:7022:2522:b0:185:b157:f271 with SMTP id a92af1059eb24-1ac5d2c58cfmr31476972c88.23.1793801033221;
        Wed, 04 Nov 2026 06:03:53 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm10195570c88.15.2026.11.04.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:03:52 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 19:33:31 +0530
Subject: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
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
Message-Id: <20261104-shikra-el2-v4-2-97e7019debff@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
In-Reply-To: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801016; l=1307;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=tZFCvJe/8G5jFqrkaVvLL0DEwVk4n8owAXxd9ixY1mU=;
 b=aj7l4WZ/ua7uRIhw2ZClbEQ/r0H3bWDdM907xuipcHIouOyKlUFKqPDaWRHN2rw8XHqySaFry
 4lB6ADRbfqtC7te1ZkCTCyzGCXfZCcEeUh4qjMtnRIuzm7+0r/CSccT
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX6agXAfQhcwmG
 KVfZXUkXaL+t/noqG3kdfV4G1+nFFRt8F1Wz+vuAYCYTJCmJoioVgPGqj1UXGzqqW0UzFSYIf0n
 BKM34ZUdSiww1u4aXOk9/t4rpsfuT2s=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb3b4b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bxtqQOLgvJ2GUwSKSRMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: BVCWzwxS9MprtpQeyOFsgN4yxL3ep209
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX+Jgb94tPeEH1
 jMUuiM9s39A6NcoQ/DQZ2+UOXZQTrrU5TaCL+/zJMsFg2VX0P8hoEdWGDom+MJEFWZDhC5M9VHA
 8xk2QA2mfUxXFtSVkrSIuplMqmlr4SUSrvSaHfFm7sw9z2PRBs5dNlxcAc4ZWBuWGWEIr7V1crs
 q++cIRPZbpX8Og6mV/wPeSMiU4lLHb6Qa3MnZa4Rn/PUUlnanePOYdgoV1zJrCmab8xeh1URVQ0
 sSzRCC7qM2d3L6gyk5B4wpgAXuH/G0VKe0TDM4ke8c1Fk9UUKrvvcP49eEdVHR+nk7zIhQsLAS2
 m4htNuL7CQ9upl+JMObnSqgR+VH2b73M4/bre8I31HMBPIFlDQ2V4Y+8VDoLSATjAItk9NjfutX
 +JJVfljfyFA5pTXxFp1R3EYV0bQnXt7DQ3t0TEaFrbJRiaQmQhFV2+iXETn0fTnzJ46KV7+b531
 hJUJFcUkG1vwn8s/2UA==
X-Proofpoint-ORIG-GUID: BVCWzwxS9MprtpQeyOFsgN4yxL3ep209
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Add iommus constraints for Shikra PAS compatible:
- qcom,shikra-cdsp-pas: maxItems: 1
- qcom,shikra-lpaicp-pas: minItems: 3, maxItems: 3

CDSP uses single IOMMU stream, while LPAICP firmware uses three.
These are needed to describe the firmware streams when Linux boots
at EL2 without the hypervisor.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..8c8a7616d478 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -112,6 +112,8 @@ allOf:
           maxItems: 1
         firmware-name:
           maxItems: 1
+        iommus:
+          maxItems: 1
         power-domains:
           items:
             - description: CX power domain
@@ -134,6 +136,9 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          minItems: 3
+          maxItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

