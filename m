Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE9F46A5E2
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 10:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368942; cv=none; b=G81FghpS9pH1nYyQE2JNYm5bNgs4awQ1loU6a6tClLK/CVOMkBROHPV6n33BJJflgCvb47n9V8S6m9z7u+PrtaaUT9RFW4KA53GtizIIyeSa8RqSsY/LI8EdlXB+yYK94kpgHjop20yPYs2vUiEl4hu3k5UcNLlOVKEzkNrLtPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368942; c=relaxed/simple;
	bh=psbWem1ZCCmNqyaQ80/h9KgNdtSx+SOb41pw5y5eoH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XL5WgDH7YC3p4SvXTbnrlAY81obxRwbloE92gaTJ8s41mw4jNrGZbRbjA2oJbjo2eMwYLjyArmQhI5gzf3AovtVPguyLSQzHavsW1QF7G7oaUHDtvf6CsklFYY/0afQbTJExu46axvJBi0QH9nBlYcFjwgBBGETURXv1YZj4wMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P//wiHC+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhG9JPw1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P//wiHC+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhG9JPw1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jR2P1873335
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 10:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iH+9GiDPpWneB28pB6GX8OAUsgwnjX/bKhO7+TO9WNE=; b=P//wiHC+IdUuYozE
	Uv6VxperqWIN7ARGW81JVcKKEtgX/UyTflDhn6bKX2dItLj2m5SS/3qCwOhOi8oR
	p5nl5GPP37JRBzEWxODW6QOhE9CP+sjyo/H3sC+VDZnGBg+vmrfA5zvvvAKg84Ni
	EhXlhJl2TFwfNLB+Ki6RjzKJRgDVzppLBax9NsUQzJjSKuUlxp21u/DukW+r7S6v
	z201Dd1Ighe0Th53ma/Bg6VWNVCCUntyyh/26sJ7ODLNftLvqxTO9TWBfRJ61Wgl
	X4RQoMFqCr6dY96QGzi5PAeFHZzbkWkERagMBH9nqyLTTH58ZMc2TzWMGQiWFm+e
	HIaJSQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rxnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 10:28:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88a1de72cf7so1699006b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 03:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791368929; x=1791973729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iH+9GiDPpWneB28pB6GX8OAUsgwnjX/bKhO7+TO9WNE=;
        b=QhG9JPw1gZ7/5Vr2Mtwy9gkZoxvpMlQu058NgxNN0nl0sD6hhtKydEbyfMDOVecYSi
         qZw02TnEOFChqQNNBzsOdojC2TByAOjnFvyD73+h7UdqXGjZ8pTypdmfaL8rYtacjp3G
         QUhaVycD6HHlAPWQFIzibZl8DrlbkqEKPBUZqwyIRUqP0lqjvBXKNvuVwyEu91o2fiLO
         fr7yiRzzUZh6sGl2DbYNYBCDDu8/3Dpd1WUjt2oFnxpO9sPFi6xv46mRXgpBlyKUYI9/
         lTS+MyJNXcHGMHDzBr0nbo/GUyIVeA1H9+G5Cyd3uwtpqnQcXDK1lcPJFgdtPWMryQGA
         saTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791368929; x=1791973729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iH+9GiDPpWneB28pB6GX8OAUsgwnjX/bKhO7+TO9WNE=;
        b=zNMicFZW6MXyEDdWI8xeNHx9dWu+YfD2DBNh7LZ5DV8czpTjX32ScanMrSPHVcH/9P
         rfd2kHCjJw7g/QsHH1Dkt1rTwYfLtSIwPG0qJIam6d1ZPpiMdOkg6DP9Gto/9/Ybfhq9
         GIV3Qxjhwslds3gNgFe1IsTx+RNXB/JlpX7ZnQ0nOF+B2hKOk2TzHnxaRXz222KsmihA
         ErIj0bPGNzjuOboHxdy625ZCzIe09NXDDe4FDTI8czmg5HwYXqFE9arvT9/KESjKTSuf
         5jkSWZkgI9jIuRU2SjdN3hmVd36xadYwk2/MAfJRRzfHAuCJQDlvARUJ9AVR/2SDdxJ9
         Zqlg==
X-Forwarded-Encrypted: i=1; AKwUvBy40Z5emB0gE9wrhU35fABMG3SwPbnpeOwplct2j5uwgDuQioq+7Q1Oa2YqwLOSHB3ows4u2tXhT0TcaZ8f@vger.kernel.org
X-Gm-Message-State: AFuF++lXs/feFggSDhT332bMKQoW/+gMaRzYl71CoymGEZJMOKZgCaoU
	dXFa8ZiYUIXA4pLA25y8/KA6AZ9Ndr8pzq6Tyfnmmv3dE+ztZ9pUSex/jNeIOdql7PWRPjOHSHb
	W7TwKU21EUQtPxJGduPX6wFVIpH5KvfSbl4yk7OKZxuTaVY8vhMEfOABq2F6684/5gwsT
X-Gm-Gg: AYBFou25r33RitXIILcvL9h/6iCa40f7Ua4WhrYBbNd892O+sBTlN+8J8/CLefYZm4u
	0BW7/v42g8V7XJeVQNiAM2SCvUWCjB2WZB9D/KMXY+B2JyRbNh2UFvAttGjJMjCMOmbd2g2+59x
	lCtF26zDALOV+yu21j0Gij/nhIddWp42TdEnAB3z+RRESyYJ5lgBlBWAHbMTI8n4fNVH82kQtzE
	cu6yvijNx0pk6tUTgaZtM2V+ljwRo1etk84tsl0lRsPT3MyApMc3DnYj8u64BR4mtwycTz8fkl1
	XrHEw7zE7nAzfmG8NdlP3wkmsimllj1XmIP4kPTt5Z2lMwsi9Q95khtv5+OKpXBf3/fbLFtto3k
	f6C4sbBcvzoaF9jtxx8SGMq9wvgsH9tdi
X-Received: by 2002:a05:6300:7105:b0:3e1:1abd:f560 with SMTP id adf61e73a8af0-3e11abdf5bemr2333410637.6.1791368929218;
        Wed, 07 Oct 2026 03:28:49 -0700 (PDT)
X-Received: by 2002:a05:6300:7105:b0:3e1:1abd:f560 with SMTP id adf61e73a8af0-3e11abdf5bemr2333396637.6.1791368928785;
        Wed, 07 Oct 2026 03:28:48 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a8cf2b69sm1221334a12.8.2026.10.07.03.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:28:48 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 15:51:18 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-glymur-dtfix-v4-2-31f7143e759b@oss.qualcomm.com>
References: <20261007-glymur-dtfix-v4-0-31f7143e759b@oss.qualcomm.com>
In-Reply-To: <20261007-glymur-dtfix-v4-0-31f7143e759b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791368909; l=2062;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=psbWem1ZCCmNqyaQ80/h9KgNdtSx+SOb41pw5y5eoH0=;
 b=UkA4SeYk56+28bkhECNF2TH6RB3spudF2pbqXEYYo7qD2cnHItHZRm0hxNzHrkYBStZum9idS
 L6nsVxg1BHbAsaTmPfDaV+kBTfnglyDTn7u5mfOXdzyIcJrkS3qTTzD
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX28QdT56Ll92P
 I+9r5CU93g8EFKr+T+jL+zOtCYSQE2ryHmlf0m4xqzX3XY920Ghosd/UrUXRL0QI9IcmvApOE2N
 rPHGW2uM5ec5Ymu09GJ3XenuaFTpbDY=
X-Proofpoint-ORIG-GUID: _2noSS2anR_-BFSGMOiZEj0Ge232nWZz
X-Proofpoint-GUID: _2noSS2anR_-BFSGMOiZEj0Ge232nWZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX+Hfy8PGk7ZiC
 ZGiOMn4eBnwmTSqXehAR7Srl8UaH5m1jGWyGDfrCXlgmxYpkigDHDCtpPPuUvOH5InNpCOqQ41V
 XQFfjzmbzawS5DC8q1fCxaiB6RcPTKuD+4uaxnC6gfS7L0INsxWw60nechp15JvAmDnktJeEoe1
 1bQINu79+8itey6usNlQrOgxqSXKL21tdYg3Scfhok2i1DOYnjCBcGqXivszAhy/vqVmHZ6AAko
 tPlNAldXYLLqxyuCFXN7inzdKyc2H3p94/p+qIwDa5AP0yT3d3QgClQyrvW3BbFH1jDbl1rm+aT
 1mWn9YF4oXFk35Kwws/lAQGXpqEWKOhDPyS9xd75p8YZlFqGSc+xvE0a7JaaROj1brfDCd5ZzPJ
 EBo+h4Uw9dl7XCMfBLJvI8Ju2h4BzCx55r1DrRfVHVtf2aAIpY7s5fXXOEtNrY3CmSWIXsamFyC
 52Mzq4UZTWnDTA1AmlA==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac61ee1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RYp5giNeBl3isHo28N0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

The reg value of a compute-cb node must match the SID (the lower
nibble of its IOMMU stream ID) it is associated with. In the cdsp
fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
14, which don't match their SIDs and leads to SMMU translation errors.
Fix the reg values, and rename the nodes accordingly.

Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..3219603372ce 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8471,9 +8471,9 @@ compute-cb@8 {
 
 					/* note: compute-cb@9 is secure */
 
-					compute-cb@10 {
+					compute-cb@c {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <12>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8481,9 +8481,9 @@ compute-cb@10 {
 						dma-coherent;
 					};
 
-					compute-cb@11 {
+					compute-cb@d {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <13>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8491,9 +8491,9 @@ compute-cb@11 {
 						dma-coherent;
 					};
 
-					compute-cb@12 {
+					compute-cb@e {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <14>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,

-- 
2.34.1

