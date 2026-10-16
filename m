Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABDB3A9616
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129214; cv=none; b=TAnyPXCIU4M0eKHAH/YHGkuChCmSx8qRX2XR7r943YCLHNofy3XQnSJ+3wKL/pREOjjWFXbGl+tYdxwoFX+5KJPHNOo/AaSzrNxfSs1Jm/HfSDotqJEybJh2SGuknLJZCpyvK0+NZoivJQLllWGqdZ4zL0PQclhGB3bhHfH13Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129214; c=relaxed/simple;
	bh=lOl+AgLFVl+ybK4WG9cbTQOJi/XJ1LFnK4djym4h9sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7IYq8vKl4EbimyVahUHzrBvjQ2qGlGdcL8ulZ14odCZ6A2tQ3l6MaArj0k9KoGzd7JVRwA3ZvnGEr9+TBMwXodCHilnxOo+G1liCKs3xXMbZ2fsbHEoeBl4+MvVCuN2oVtn9ao/OpnW3Ow1kbsrFbfyjZ/IRtR5Ity5uiu1cjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJnmiKso; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSOgSJN3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJnmiKso";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSOgSJN3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FLnvxN2678468
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymEESyJ49OQsClKV3F7te9SCrhSJGIpbbzedDIlzEnA=; b=LJnmiKso7wNLCH8g
	/4Wb8EhBNjd7pDOx8TCRvNYM1pAgUKC8NFHPEhRmsgk2SAjtjGg0fZC6MmTUWN7I
	Fr26Dto+Q1PdDMS2LxPXM0x9eR7MReRykFZ2AaNsoOS7JQ8U+pK76/tCBjJNS4Zm
	z2mmqxvaWCI5WtYm8rkVMTRfInid1DKztD38DihD4fE5nHZoNGQwjuc2Q8P+OfYK
	BdRz8BwMwv7KRgAEAfDi79WdUGu28Fd6zSzUeZON91m+FIrvA56XrskWLKy+M2LE
	YGi18tgLabG9Cw6d3e6fkPxlSB67qhbJ38liQJIlV1707gJAiv1/jO+Mt8XC35cl
	mXZ4dA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tawmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:40:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso2837327eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 22:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792129211; x=1792734011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymEESyJ49OQsClKV3F7te9SCrhSJGIpbbzedDIlzEnA=;
        b=HSOgSJN3ccJ2b7DssM4DtBKqCRBzm9tImIHanc1qHvCXmpsNDFtovrtAU8f3eQt2Hs
         MlEM0sWD2t7fenEgWU7ibrBlyuijT362CmchLnS7sEt3JNOjQRKqQAPBYHJP24WZ8t3F
         4KuNfUBfh95UgN8FdeKSFldrT12Ti9RTYVanTsYURODSjLkrwD3Yz7Wf/k0rzPPFOClt
         h8T+rVVAhjJsQQk8AWKu0mjqOAWHBCJzDoiPyR+zzsnahWkst1OVRo53aXDsd/q5U9Db
         ODCapS1KIfElSvfVmHO9C5B3r17WEx9owmq/FVgAMHbTr/4Kyiv9FCVCVvVm1oz0Hjoa
         Fj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129211; x=1792734011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymEESyJ49OQsClKV3F7te9SCrhSJGIpbbzedDIlzEnA=;
        b=PlHlOwnLuH2QYd0JHpaiCKm6jqsKdciDTYU0BFrbb57o5KUt9JFLms1cXFlnPgFyHH
         m3QAdqBEl1J4d3d9k74ePfOHyLegH/oFZwra8QUDcmCkBlkEEiZ3fALX4J/1ukgtv6wk
         xurubbgZke/GqxdU4Yz71Bapd3GfrSRXAYKy3urCupO5YiAYzi9SwKesbDasJ/of1Se0
         XbpycVbFN7ISQCdw2gRQFSG6/KnNliBqKY2oVJYqhGTpTBQm1ukjeQhGubgcucQLyO/5
         r1fOGknQlP6W05D5t+tU7/vaftDpU/HvC515+3eiWTbdaIefaSJwnbRkDPd8VVvfkR4K
         IfbA==
X-Gm-Message-State: AFq9FYJ0uio8viwGH3Dq5DxdbNFDbnqzz2XoeathROhgVDdglPcoOa1P
	l0kyfmLtXWJFL4pabx4riK+9TLIyc32+E/4z0BtI4+JPWSKNB86P8+nD6b8SHDgEg6X6b1DcF9n
	lSHYW+rbZRc9QapVredWYNNWamTuY5LsLQMrTjeLXPvO1JsZpmcadozhy3EXkhCQdGIhk
X-Gm-Gg: AYBFou1FUwljzlC6hD2iAsPUV1HUcXf91Cu3h1RQFcMJ/nNaTf20xYuA9mM3EWaeIwk
	hncGiyOxKTCxQM/hDhJWYBUHFDNbwwt6wU3+Bl0NSi/eMRuGtSUuuk7OXDE65XxMjTsdEfEmAZO
	1gI9OfArnsKr0J9cdiQnxwTKkEePe02UQmeY+1nxIA84qGQCRBr+sLvEdCxlMAMdLnSemPoNIDe
	THnsRW/C2GRkZxhsQ4GXdL1X7sls+xyR2O06iV06SyVfW+64SBbpPjBHzhujOAdnC+whshtGMoQ
	YlM7YpczG2wex31AdAhG1fde/UVC0eebmiGgH+jYMlFMch3lu9ULtBAEtBqa0KTmlwi7GvVSq4Z
	42BqIoBr490+cQUt78V9fJq1P6Z4TughBEH2H
X-Received: by 2002:a05:7300:f814:b0:361:1dd6:531b with SMTP id 5a478bee46e88-3611dd661ccmr1899eec.26.1792129211054;
        Thu, 15 Oct 2026 22:40:11 -0700 (PDT)
X-Received: by 2002:a05:7300:f814:b0:361:1dd6:531b with SMTP id 5a478bee46e88-3611dd661ccmr1856eec.26.1792129210348;
        Thu, 15 Oct 2026 22:40:10 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm3811393eec.6.2026.10.15.22.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:40:09 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:09:55 +0530
Subject: [PATCH RFC 2/3] arm64: dts: qcom: nord: Enable SoCCP on RRD board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-nord-soccp-dt-v1-2-ee13aef55d8b@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
In-Reply-To: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: 14BLkbYrkhM3T4kd6fQyBDPk_-pUo8P5
X-Proofpoint-ORIG-GUID: 14BLkbYrkhM3T4kd6fQyBDPk_-pUo8P5
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1b8bc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hST0b9sF66eLrQ0HLjgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX4sRZl9B82Tbt
 s1LBiHkqe2q/3AbKQfNB0Nsf/gc731UWZynnU1nzUDD//pESflatl45W8Tr4OgqN3YndaENEZh+
 zKGiE+/tq8Mk5sWB4+coEQbqbmNnt4SHBT93k7b0VazdxRzrhWCySRD+ZQwkpJp1Gk+br7+l7Xl
 ugh/fLKrNSx80LzaInZXfRzXTIM5E8ir5zFfW4p2DhI2dhDrL/zyYf/ZjLaFBk3/Ttu8GHHgZk/
 2GmHpdJIGuOqfuojlZdt7JuNuCI9GYc1NHtX3h0jf4nuq8jPaXseuKHjQrV+d6qf/hBgfXRNNBf
 YSu5Vd/+f22/017rnnlBTMW0wcW4wjWOyvFiPe32FKyi9+HpctisTSOJQ8NqkYuLGyjXVzX/9Ym
 OmzvJiJYoIk0DJFD3e6J/96UIJsVbahjYMKa/0GPLfyBmvj7fo8KScPEGoLIkISbFUNR+Tb45Wi
 avkoYXe9tPR2Tc0Tilg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX915Ne/oq9Ijn
 dFUOyYIBMnjGbw8JCRGNsvITqudCPRO+DEne/6Fce5kl8nHKHpoa5Ltm6gEN5XORU0NYoqoVdmr
 108kLGoeZgP4nGEMzwzLR/OjUw773Ps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160022

Enable the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..9db94c3b0c91 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -434,6 +434,12 @@ &spi16 {
 	status = "okay";
 };
 
+&remoteproc_soccp{
+	firmware-name = "qcom/nord/soccp.mbn";
+
+	status = "okay";
+};
+
 &uart4 {
 	status = "okay";
 };

-- 
2.43.0

