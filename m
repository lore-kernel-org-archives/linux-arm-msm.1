Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20177476681
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827959; cv=none; b=ULoIQPOM1OhBWXmmTfwgbKX3Zm3rePdsKnx9UvaQHh/XKIml1xRrK0uNksVA3qvehlzTrTr5C6FaW4QEmvC2hfLklwlNB2/AoG0fCdGoGTumI/6pDkREJDe8+Tc3yhrj4SMqe+4UmTk3WNIVPv3wtUbBK+gLSjUlxVVDgOWwX3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827959; c=relaxed/simple;
	bh=F1SX8R+lhqOi4ano2ky1Vc5NEivSYmzF+8Wowzs3a10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjdoJxJgogwq8K0gVKJ4cTSXwdzgfm/mkKmN1fxTEMdZQcV9MIVZR4tn72VRlEa+6BnH0kgYBELiHgxADk91A8ggP2KozxTqj1qOuEP5WA7P+JRV4rtOP9bB4hg1JPP/G7iWFFcqMqA63qupd4IH1VqG+qqjw5qANkDvoHmP47M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjREpiKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qxz96L4v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjREpiKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qxz96L4v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NHWYFk668868
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRzaEhhzfTHRPy/h0ZMbtNc+EC6pBkLN2AOePT3qqlg=; b=QjREpiKPTEkM9Mwa
	M7Ll6TzW3TzrN80TQ18y4sokuPHjL+PAJCRGlk1Xn27cckyasSLmP1PCkpAB+m0S
	tuHq61CdUKpNPl8FpF13l6QtHIDfO6xOvTjHYMVB/VqlIbmDQcZr0r/toBKeccIy
	8XthwMb6aFRg6DnzYwouY8mnJf30HhlpzSQWii1kOoIDZ8p5HISbTg5p61k5oWqz
	eZJiwXomqh5Q9wTZe+rzwa8rd+GgEQ8lygiOx0aXBgUO6cICp611hdRq52Xvsc/+
	7MI7WRSjSbpZqj0tVzijoiQlH72jNNwW9gqKTBFnnKkcAbL9OYEW7mXhYQzStEYV
	gAp2Yg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa181gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:32:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so1116873a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784827957; x=1785432757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRzaEhhzfTHRPy/h0ZMbtNc+EC6pBkLN2AOePT3qqlg=;
        b=Qxz96L4v820fIV5LZG+fWACn/sfms1JDJYDQxIkYPvf1gB6TIZYJV3WCzaMeCm/j/E
         na/Q8OJT0hCXM1CUZJZ3AxUI0doGGmhGM5DHlX4rAlhyKpWoBiLjwhQzSoDnrBGODx3x
         H33iJ9T57X90X/nFuWBSq73M2sw/Wb/41Rf8fI3/zJzRf7uw6pLE6fWn8SYu9fg8o+Ay
         iViLYf/09hPJp8vIhbbfuT7nwC4Y2nBDvl64cqNGi0COgnXTFhnMXxaTz1VF0GcVv9OO
         E3uKUD8PmXvlQmaq/DGM5Zf+gE9ip7856+NVKqu6rz4IOgKQxNTmJLCcRs+aCtpoUI7F
         vKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827957; x=1785432757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRzaEhhzfTHRPy/h0ZMbtNc+EC6pBkLN2AOePT3qqlg=;
        b=H4C5JkZDfWWvLMk0YQs2nc6Ou/QXzDVJ+vr2cVmB/JijZjKycwtPRlQr+nIz1iLAHF
         bQBCQyTgDdLZ9KhBtz5qFy9qlQ+xkABEXia0+CYOnjqn73qhqmQUmDUDUmDYaTgrDKnX
         l0LajjM0Gbt0lEknN8Ufu/ixQeEnR8OJHZ4cHqpoXxa3Ngx5msD345gcwbO7NZJKnAQX
         pGPi0bGyQnMd7D1dW1vWww8dqZEVWku3T4h65YS0+1rKwtdMbd+l5kWRsDp9NZWduSlk
         /CJuI3gdx8Am51VeIVCcT7ES8VCQXLKMIFBaDm3SJKG/jIZLvTfPMYqqXLGLXg7NloLe
         xp6Q==
X-Gm-Message-State: AOJu0YwZeSLyA4u4hJNgPCioRjk64w8XHuzCA8VP/dYQa6ALMfPMyzg6
	p21CIfnD5aen7fQC6kprZINV7NyY73ahtRohAepioI3t+2+7iZfLJ6Xcbq1tv1r4kITyCVtTdut
	vpK+PsK1bU7jWWbksovNwq3xzfP8NVEIcJWYQ0v4oV93MI0rgBtQa9FXvP/B1fc/6dR/C
X-Gm-Gg: AR+sD10atisvb0o5Tk6IVhGXnP2770ULiESBJzQw6A987DKxtETmBb0n4EqTv7HNdTN
	3yaRHCiukfRs42/H97Mi0B7qTMNyO7TsajZDy6D1wA+TWzLk0evyKtvoDVcAP0PMbia4PAp2clu
	76l7OlJjkfhrrq4aheLPkXfyGyAcFlINYVSQggjSpkXWosfwHrVGOwLwSovlpaRO7e3CoAFDA6n
	abu6I10opDETmEeSYXrpgWtZom2uPG6tOBzDWmd6oFGEbunhpJLnCGQenymScr5thRFkL6HGU5R
	vHx1H7dV+TPo3SD1JCCJXgkHFpSnzldI6PtzTQzuSOyCFKedcKqE3uDxi2G6ZoThqj3PlPxCHrG
	N724C0Z+8EzYr+dtJC9bVmtXfkutx6Ae4DQGxtHlO2JjsjIS4FiaXKdN7ln9UXrbpmki3Gw==
X-Received: by 2002:a05:6a21:6e84:b0:3bf:b60b:da95 with SMTP id adf61e73a8af0-3c44b21176cmr4500026637.60.1784827956796;
        Thu, 23 Jul 2026 10:32:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e84:b0:3bf:b60b:da95 with SMTP id adf61e73a8af0-3c44b21176cmr4499993637.60.1784827956356;
        Thu, 23 Jul 2026 10:32:36 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm26466497eec.30.2026.07.23.10.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:32:35 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 23:02:25 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: glymur: Fix properties of usb_hs
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-glymur-usb-fixes-v1-1-816357d5319c@oss.qualcomm.com>
References: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
In-Reply-To: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784827948; l=1339;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=F1SX8R+lhqOi4ano2ky1Vc5NEivSYmzF+8Wowzs3a10=;
 b=taUTuvkAHPdWWsNganRk6mmxkpDoT49O6jaSJFmG9bLzG/LeKJDlHqAtlGvBy7WWUeCQ2YM/b
 flDEC+Q7b9yDPCznrgjvUuZMVjXyxiWzDY3mKkEUawt6v4zz9nPn3tz
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: YWe90e8yNM0MEqw5ezbGUKJAe5IZY-oh
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a625035 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pM9bnS0DWLlDKGFgAYsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX9v1auQ4yohGt
 ZlZAUC5I2zoBJ3P3XSJD+0W1sBJtLA4BpQwNhu1kKSC7AsCVq/txA+9pr0M3mywo5SgO6WzDslb
 /4rrxp5uYFeslCx3cCHaJrJwytK90oJIDNmY2o1elodUQ8G1Edaag0kBQBU9+SIXMUHK+Vw+dun
 7k2Xv+LlzxGPMCxXTR6kD8TyXHisWljeFlH7tNN7XzHeWNhas7CRumILcmpsFky24a3wd2f5O2g
 H2W6MzSt0cdz5DZyQm44bmZoYnma84WzcdMGK9DjzmHoB1SeErwT6rsV7o1dt1fbGFqq7UtcMeG
 2nakMPhcm3+jlAR6lZjR2KoZRk4OfkXYD+rBemSaRzyb2P+eH+iEUiwfAiy9Zlx9qu3TdGwNtj4
 j6lWL4Q7QDjxbUfkc4fqSFz7j6yQCs4/K8PlmLMLib7YoqXgwtb6+7OeyV8lk3QdgpmVee1xB2a
 vrrjoScxZVcQmpUqeCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX1FVW6REy4zB1
 1CldkYXo0fcAr26CcnJ359xhF2jk4Z19wj/LPczeRXxYYPPUebEdTFtj8BKVzvFSRGRpmDh4Ctf
 gOvaQRDXQOh9bYkqj+PvSmRm79woMEY=
X-Proofpoint-GUID: YWe90e8yNM0MEqw5ezbGUKJAe5IZY-oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230170

The High-speed only controller is DRD capable. Hence move the dr_mode
property to platform DTS and mark the controller as role switch capable.

While at it, since its high-speed only controller, disable pipe clock
requirement.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index c12808abbfe1..7731b29857bb 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -1204,6 +1204,8 @@ &usb_1_qmpphy_out {
 };
 
 &usb_hs {
+	dr_mode = "host";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..b9eb0fe8e413 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4794,10 +4794,11 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
-			dr_mode = "host";
-
 			maximum-speed = "high-speed";
 
+			qcom,select-utmi-as-pipe-clk;
+			usb-role-switch;
+
 			status = "disabled";
 		};
 

-- 
2.34.1

