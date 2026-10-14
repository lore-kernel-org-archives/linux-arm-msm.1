Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F740554089
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993418; cv=none; b=GRhEneumPFVpCIy29D7v6Nwb15eASM0BQpljUOSYwYGrvblpKkiAlUFBvWS/KlDifUQSh2hCVHAZtwXWptn5I+WAof2y3jQpct4xO/z9zH2Lx2ME1rrNAvG3DcsEd4RdDm7zKtox48PK41rDNq48NJwXFcDY6X8RS26w0rMIKXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993418; c=relaxed/simple;
	bh=tj/l1Z8D3QeZ5hX3y3HdO8/L7MlfV3oYPsAcQ/h95ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7GN4LaAeSLsHyeMpT2Bngl9aUEk+2BFvgG25Q8eOOIyBfAFDGQxjiGeF34ZvMlBEu7cAzLajFnCXXGqtSydjDxe6Z36tTO1HYuZzhpnsgCwLG9jMtcT/bkC7rNbeRWrsa+qM2MAr/ss4H5kH/ro9cjJcjg/DmeHFwPGeot/640=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahNsOuAr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNY5hqrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahNsOuAr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNY5hqrh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEabm8500271
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=; b=ahNsOuArNck9oUBA
	k7y6+41pWv7mHKW2P/C7Hp0xeEwaI9BzpicwJ3cIVmn4KLhfdI1S06Xj0puJc43r
	8c71y3nc6x6UCulfFoXoZIb+BhzfXhmk0sfNGYOjDNhfRsxS9SX8Bdtl2+2PC5wG
	c65T8yt3cjjPiucegDM2b8HEKzCgo9AgnxphaiGxHY03uJF+zlNGLcG0TbJVeO3+
	RYajGVYxyk4rchiAVRaiJt98ECrjEGJpY+V4klmfQqGQgjggkMiWtMO1Gh4LOWEv
	RVrWVvBaWeqgKSrP2tZ+IuUSoQ445yMqbec/B8LYCXflAA0KNR/7HqWsaaMA3xkb
	JBuY7w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf0msp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:56:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so588673a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993415; x=1792598215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=;
        b=VNY5hqrhW0+/O0ZZybkuqVB0HzP8WQN1/2KMEHaqqiP1qZ0VoPhMrCLHFN8fX+uwIO
         aNWDwzu+5WOlKhIIFH9Trh51KzK9gi4IfFkjnxrPtknhwf9EfszG8RMoD5ulTph52R52
         baR6/r/owvCjWuTpGXoLqZwJo7Xq3JPxZCLBLalnlTwHym3vMIGmM04RngstS5bramQ6
         SYCUQN2NzoMw9bAMFkYUbtWIvlb13KITFv9HmZK8Kp6PrCsD+wYoZQ56FOVzV+YGWKh8
         nSftO2t9QcclTtGzTecuQ5ROZyBSXoA2Z8qUHRttitU88w9FYcLA2p9JAP5BZ3ThJGYa
         lQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993415; x=1792598215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=;
        b=ycn+tcEaJJIgMTchMQu9+stOdbqH6Qw5k2l7adXShq9XkcxrelVr8gnPXJNL082j5F
         FMlqhGd8Rc9IfHBSIs9/RoyOIA1ZlY4nHMW0sqZ/QFo4kMzm7jPrRu1TsiYEOr2JZcce
         7jLkD2R9rq7Thk1otLUa70+/FkZJPsWp8gpefT17U9HzHKWzG2lZ0K9R+4hDIROD2ekX
         mg0WCa4H8IkY3QQYpdlOz7OezUdYP7R00J/QErb7TdkHbtac7hwaN+A5/c44FnPXRTSZ
         ldN3ziUfcSYbOOK2fIp1VdRPiqbAUK/NMUJ4THfVKUsJMXYzdRdoOIZ4KPaFmGjxTp9l
         AuXw==
X-Gm-Message-State: AFq9FYJ5wdswwMJ27CbZhkOj9QuxeiWtM0e2zN5DqsTIhL4W8JHziQZk
	SAgdxQy+auzpXR9GH+Ym6AfxJj+HCVyek6g2CRxJQF1eYRxiLroN3MhNV1PXBkR581kJwCirDoI
	uH47AC30ulqEQ9n4w7fBBvB4GIbtNke+XOpF9iJ39xmZ+UTQ8JCyUmGUFAbRB61wimCmD
X-Gm-Gg: AYBFou1As25xMTRFse4vynFykDH2N55m+7YOwmT6Alr7Z9Q5pllDAFiMSf9GIaolaV4
	6bQFl0lDVl3nz1Jic6XAR56CZHyXLJLmmG2yNyHfTMqQKGXzi3KTb5JXVWI/06lNYXIV6kVShSz
	FYz2n/4S1e8iLzCtEi5dylACrj9lB6Jlwfm/gaNOLa/rxVQ5J+2csVp//vMXRExzENmq9DT19+z
	DQMDUFFO/ckXCvKF3xnfauN0vJ7+DpxkdrtD2119svx/bB2CtH+l7tVh9JrxysTET9fKwYovtOr
	hLg/h0un0mRjfsm6IYaSr8KZ0SmSLSG8FtiooISnc8pLLArPxWs7FqE+7dHll9n7zq8sUUEgwrS
	u95diYrEWmcTT8A4YKdxVlGziaIkHKnVc9A==
X-Received: by 2002:a17:902:e88a:b0:2e2:d02d:a173 with SMTP id d9443c01a7336-2e842d030acmr162945315ad.49.1791993414859;
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
X-Received: by 2002:a17:902:e88a:b0:2e2:d02d:a173 with SMTP id d9443c01a7336-2e842d030acmr162945045ad.49.1791993414343;
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:26:19 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt to
 LLCC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-master-v1-4-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
In-Reply-To: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfXwSncG6rovjt6
 yyFR3R2ZjH/KQw7fs7+i6BIv10lz1arHfvJQNDsaArqxoEaHM3HMAqqGWRhRpcGYT2bcFPpJKBF
 UkeFCQMl6weNKBcxZJVNBBdid8Zz32sDSnPSYrbwrzfEOImZxUEqPFSSWvKKdLRJ5VXdI0phKq5
 KmYeNuaCj3N1F9L9AdYNiFPMmTS5T+Yej1kxif7cj8kH3wouTyGQv/vKxseJLeqwuFJ0BJQQmb4
 M0+bLSurV76RkeN4Gb0ppTGiNmZ3bzjVcicnFdpwvMxxTlRzsaV+ATCW5NfD7V6FyJG+mrGEGXP
 Hcu9d8fRoaEAF2e56VypIjXflKor/V3Y4um3/4/uw6ktNCeNiPz2raMOe1uKFrkzMMETvdkR9oz
 Ux4wfPQLmqSlgcmsfAmlxT1R8LQW1ENj0iKzlItwgdgMCUKh+/6DkWbLSCMIQ11tRDKPGr3TcK1
 7X0ZFbKpmyyAYZu7lwg==
X-Proofpoint-GUID: Qa4zfThrhktcadS0w1YtJUU9Ig5_v_8j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX2JXKSS0BFlKT
 LUbF1LVu9zn62UXgPsVG3pFFDOXQHNeA9uIcaPVC1JPNICH/6MEemRg07XehJXNJAOVVjQMTl5N
 Tm7zIYIXXUazfRWDsBSCBs3pwcgL7Xs=
X-Proofpoint-ORIG-GUID: Qa4zfThrhktcadS0w1YtJUU9Ig5_v_8j
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acfa647 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=E534aFlItmYAAoDkEE4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140063

Add a second interrupt for LCP/SRP DDR DRAM ECC reporting and
interrupt-names ("llcc-ecc", "llcc-lcp-ecc") to the Shikra LLCC node,
as required by the updated DT binding.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..ff572c003b39 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1108,7 +1108,9 @@ llcc: system-cache-controller@e00000 {
 			reg-names = "llcc0_base",
 				    "llcc1_base",
 				    "llcc_broadcast_base";
-			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "llcc-ecc", "llcc-lcp-ecc";
 		};
 
 		gcc: clock-controller@1400000 {

-- 
2.34.1

