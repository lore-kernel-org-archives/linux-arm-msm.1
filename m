Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82EC4A1DEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047042; cv=none; b=In4K8FCV37+YLb84aOB9ffbkHovK65isSMKAGvd9zx4HiWFxImToXw62uZNFjvyVWKpb/C9C3C9VqIy2v/VQ71kTacMxjemguOMrOtK/FZkLEVQe9CXUwiz4jfMdgEvA1J8l73+bXRgcuq4RnKNGZ6fIwqPgj18jWz/ZXGebGkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047042; c=relaxed/simple;
	bh=8m8oDVp4ME+DQ6ixjSPY+Z2pZIlSEBVd6fCv5YKhCT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5+rwqBJM6h76xWVJINrsz2MhS1grjsKHVUthhKePlZqk/yC1J6vmCcnB6M200v7EUFH4QN/CKkIq/8BlbNL6WUa9ZtZmtfy+yT73qh8CByhml+tEguZqdQsNq71/npu4GQ/OD4RTpkbskaM5t0Gcev4jHUazt0p/yx7LBlRIP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhggUduX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OLsKd/KH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhggUduX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OLsKd/KH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7vTQ1440988
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MrwRG8wRbUEcQ2VNpdUktqMkDeFTUSahcchNIS/G6As=; b=dhggUduXrOuqT61Q
	EYWtykJxrOAppd59DEKSmUj9FzRwVuACmqoikFCyAK81uihiW8WfmNn9adsu55XP
	noV7K8gB4f9KAdbcj1ZP4xBUmrV/3YT4njjStzEXOaJHpWr1YouL0nOzIssDBGOu
	JmHyszWLdOYESw3KhFFm9hObbAoqzob8BrDfWDMT/I0Jr3qgewEvapTP9Cv1Otab
	/muZfTDy0WGghGTZu7+V3GXvEcu654CyjDXRGhGp5WJAPxup+1NpGC4F01mnYTGf
	44CMBu/9TQKOqGcIZ8MRPfP170JMOxdbDyL/qpRt5gv/rYzWU7djvb3SW8a3BHhj
	NY5sUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvsf5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so2005272a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047039; x=1789651839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MrwRG8wRbUEcQ2VNpdUktqMkDeFTUSahcchNIS/G6As=;
        b=OLsKd/KHMsPlbC6mWTZ8hm6rgSsmHOPa+94oaxBEiU9THwoNJm0SwO3dXZNQZk5oq9
         KOVBlemTgwkW+c3JPojfIMin7sVEp5KYdQKJo6NjQ1Fwj7mx4upOhfvYsgPjUQ/xCJyq
         Kvsqhyb1xhdmuOz9Vll8/TT7d+vJNUAt1KZzPLqwOmYcdXNl2hSTnD5vVwfFff0oXLsx
         X6zqmrV7O94Ep+b6e9v1Iy3ZVO3Uj/8oIrJD3TEZrP4CFGsW27dfFppcuH54RRqi1e+X
         CvXF9ondK47pCItpgagBiqOxgPmqcyuIDrauUInt1F2HUXJxsSVBKSUx08wWpp7od0CP
         WFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047039; x=1789651839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrwRG8wRbUEcQ2VNpdUktqMkDeFTUSahcchNIS/G6As=;
        b=GEMgr/ZnZwfSdWrG5x9jed7Ry2fmt9rDQGaATyHtpv3ZiYqGY4+dcCNo+WHDpvFXi2
         4LG1xpVpU2/qsZ/g0hj+V+8WDgl2kxP5MaGrcYdn/gt9W3KjRsnCPtBnouQ/FHA7PWvg
         n4d9B+r5zGNUrOyxUGUCvOFbXMzAKV97sg/UHscYVysmREW/EYbN55GbuKvc2+Xww1c9
         TxrOsG8ufWvaGTuqMVigd80012cZhrG1noPIQyE7gAu8cnOV3x0xTfQgZgmySfk4af8v
         q8xhvxSY6ObwXnh8vX6q/U3mb8WYQ1bhXWTebgRvU2E0QYzPaaQeVaoaqQlESwqlRAmZ
         BLZw==
X-Forwarded-Encrypted: i=1; AKwUvBwXbjcUZwRxSv1ZmzRGW//dYUoRIDTKEKnnQgV3Hsv1ENUnzkDD3kyEeCcyyOvqUX7+XlTJbbWzyAz1WQlS@vger.kernel.org
X-Gm-Message-State: AFuF++nI4GG+vb7pllqdAvh6PQ/LHhpv8H/46Kvj5WXQE0/qs/61Mdip
	lRMdfk7OBy6kG3vBFIm8YqNOEjVuxFGcBxIGgX8dtqOx8YJQswi/huH5Vq5JDtJYVyOwz9y0Tcd
	EA6j5fJihcAT7NkcI6euDpXf+kHvMvaQy4N5FWoqZjmU3TGxKWLPuOhOt+GexLA6BZSjA
X-Gm-Gg: AYBFou1KkSWaQdjEa5w+r8d0X6443Zswh9ZTa7sNebto7Rf7Xs2VAIP54oa/f+LtEOb
	9BJZg7s5/QtkHWdTlUsQq9uJ5ab7CdP4LaSXA817ZWlEJgn/lmQFFYZLrBL8L4efshHGqCHCWME
	EyPJAmFgntYnVNQmlAB4mhpU31lDzDR4QWqy3W2RIFpwbdPu3p2Zc9gGFGMebi4/pkHx+FS/Vls
	VWEynn/xhFWMEKk5J+6EyeXEOxAFBOTOshtX5VrrLQxYf8zJg8oehX7XOSUt5HCZx2kB7ztxatS
	DuvN7SXIL+ZNzLBqS+qa3qVn+PcYW9C4UVAJDBD4I6zSU0F+wgWmZaczNodSc3nSjvdAB41qZHW
	sDukEQgdw+wkfcH7LTScpk3IRBgcimCtifL4=
X-Received: by 2002:a17:90b:2d0b:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-39d77914f7emr5807664a91.3.1789047038692;
        Thu, 10 Sep 2026 06:30:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-39d77914f7emr5807613a91.3.1789047038074;
        Thu, 10 Sep 2026 06:30:38 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:10 +0530
Subject: [PATCH 21/34] arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-21-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1534;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8m8oDVp4ME+DQ6ixjSPY+Z2pZIlSEBVd6fCv5YKhCT8=;
 b=NPN4FXoAkAitrK1GlczUgFD1S354IFzABZijwGlt9zgWYBaFCqb+ntMYu/pcW+tURPW1qoWse
 1fUEYjSlhRvBSsURB8/mTsUR82L2aK9Ux0jtXa/OoOdgirv4EKjsPYh
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2b0ff cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX3LQ6h3/mxkdQ
 TIDhOAq3dFejHj9E52+kN8ln0WkVlI5erGF5jO3hFLl+cEuosiBXa2q/loMkKXifQMdyrpqueGH
 MlH+2qqUkQJOTZpxO5Y7LoCGT4mE78y0nAG9T1xSTVGXzFyKJ4QL97/V7GWE3ABjsrsH+zARpW+
 bZBOcxgFAHA3LsQ8iufeQxLiXjvGFePlTwqL/ljnEYRae5RZR6klSY5vlmuSIal5RJFwx2fZw8x
 OxUBNQvfeIbYkiM6FlNuvjzWsPUBs26ouoOilfuG4dSDYGJHnRiUy0R/B8mL+yxuQjeadJPHNDG
 HyUqh8juNgRlfvswkogXu+ToEXHQ+a+H4l5bRyWYrO3PW8tJ7P8QZnm/jl/u9NDaXMvf3Y2NBKL
 zDawLYyV8lr3pQTDrnNIqO3UIhzeHwbsa9lSMg3GxyFddHcIKBOSv+X1WTdYrBD4rmzU9WNQvUa
 Dhe/+ijPntsX+FLOVAg==
X-Proofpoint-ORIG-GUID: DlxEEpiXrGr2JLIIiX-1sbSWr7qa1tTN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX27jc/2GWRHAd
 NHo335OBreBvoYimFShYTovxYVPiMpwUFkvnDu3+EfzJeKKjl1+KF7c58TUpqpF9Pnkt3i+2jSI
 gvdMsA6Fa0SSRTP/oqnrTankt4bjzhU=
X-Proofpoint-GUID: DlxEEpiXrGr2JLIIiX-1sbSWr7qa1tTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys, phy-names, and perst-gpios from the controller to
pcie0_port0, adding a label to this node to allow board-level
overrides, and renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 5038d0009c1a..0782ee1cde05 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -928,8 +928,6 @@ pcie0: pcie@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			num-lanes = <1>;
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
 			status = "disabled";
 
 			ranges = <0x01000000 0x0 0x00000000 0x1b200000 0x0 0x100000>,
@@ -969,13 +967,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 			iommu-map = <0x100 &anoc1_smmu 0x1480 1>;
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

