Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF90494A18
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246519; cv=none; b=q2ZMpIWH7zklyEIf5nAqt6XpEjmJtbZh2XuDxSRiwpaw/wd4hRHanyXZnLMAb2zWHp4IPdbuwD/mRjo9Ac3NqR/I5dngIVDllSnqL9XJ30GggUm/pEJWGr5cEl8Xhp7y0QMV/uibjm6tIHbi0IApP1zo0xROTns5/1BFc7qoQ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246519; c=relaxed/simple;
	bh=gTast3d4XqcPgNd8hTEWoP39BKm5rck5V3njvbIRnKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qk2kVyFqc8OpmxI6IFrhwegI+m0+43c976lQxaL1m1wJBql8SXc+eOUBFJ4CzL1gt4REqBdQWoBLFB/MLr70RoQFuyhrXUBOfyEGMYctYAtJSZeOTMSJrkBs+blnWPn5imig9oeRdgz+U2CPSoeoainWkwKNfpu7YbZ5r8Brz7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEnoTllk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1yeDyt8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEnoTllk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1yeDyt8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PMZN2919251
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=; b=TEnoTllkj+Uyv9WR
	0Y/rK3JWlr/OZsPDATbw17xoxIA2lv0b8tS0Z36S6mnDITa6YeLSj3v+/Ddo7ic4
	qIYDsTr8/c1qJzhHRfHu9mztEsRG4OZZqf8f/kD2VIPkqhanTAlY+vxv1dvcS0gt
	Yt0eNoWBvat/jvhh9TuTuCq8cenQNKlypdQcNk3kXRclDWJ9vZnKdeLwRhkmm5GS
	jFMirL2X81CjKib1UpQrX3ZIy8Bt5eA6fka5wi+BVQuTEX+GaB1kqeYtIu/2Lf7v
	MWVwtRijKAR3qsxHXuesybHvrNHDxHfDTKa8Rrc85ZzqEzRcs3qkRddEO9NAg/bQ
	asaO9g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuj4j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91043af01d9so34617906d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246516; x=1790851316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=;
        b=Z1yeDyt8iMIKm42IyTbYU/LXmTNMndXSC2otcpdzyaXktSuf6MooQ5jO9Hh+ZbDriN
         HGqdQa1kjZBW1IwkPo51Uciy3XZwUpSUCC7A3CTUxjTmv94srwF5RbqsI17PKEHgxbdl
         ryE+lRnltIWh8eq+u5bGw46HXtQo/tbK31GUngRUrF10piLxiaou+TZ0nu9r+kU2SI/N
         F0yOhYcPDNVCJaoPmPnH3m2jebH9NkXw/ltddsraxva4fLOzLwff+l1Ame3woLucIdkb
         fvAI6DjJhn8b0IESOOMtCXWxszce1i74GygNz/vK+aO3EPhKc32Xg5KvcvN9fFNRlShW
         Y/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246516; x=1790851316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=;
        b=pRn7OFHMoIw4M/h4tzDyL/R2zcqtlUbggFBrtNXBaD9W/Tn3uX2BG7s5ibD/xvbzWr
         CTv6eR3sIkbSxCmbas4emg5w3eoGMfJ0hqX4m26spUNVXfbPVDKENSpzWiioXV0BMzHf
         7efV6Z3GYb1tWcg6sK+aNVHKZt5Ci8XQGHtIT7FCaIdUQsRuxWk0lWB0Zk1QotCb0S6O
         FjkKq/2U952daWuoXAN6uWexgXpLOuhSmRxTUIDsWAUJKa42f5T5oGbUO7hbmARh0eC6
         /k/l2ZLVOZqWCaMW8t/EyZp10ISayYfPfIiph6/5qtPLIUW+iWtOHqyW2JU+5nbjb8vd
         gFwQ==
X-Gm-Message-State: AFuF++n/sFt8rTYORtG47BO4wMrA2PVSO73WzrEIHtBSp0tGAPNSAPvJ
	t0GnC4pD8inV6A78eJREjRP9x5ezk7lHWZr53wps662Ck+evGIqw4bhHAFHVFCzqvq8EqMlVipk
	q40WtMEOF+O/MdgTVZAbnttqgNMBEKMdJnNwjUrGjTboTbPmbN8U+bZjgtk6LY25JEmc5
X-Gm-Gg: AYBFou0KPI/HSzdwELBUP7/QBMiWwkNpRThHBgmiFvOLHSG+nmGaQGhbILWMGGzGpAv
	7PdFinz42qmdW5e33qvjUnMcBXWXwpu8LbiFbD8zPqq23fXEwXjRebHIZKVZvyvgS3IXyA1Vp9B
	/4rcjioS40SEY7CO5uJ/XYtN+5sNrU9JEQXlePvywMLy8NXzEPpx3jI1MAO6EawY1YBNs9q8i7/
	/6xuzzRyLxT9ymQzxuza3fastkZJBaozYl+b1Lc1r/bxMTvY28z4zadr0i56yYBGqmKrMOQtzvN
	pQp+Xo/nCESxvZSfrcPEDVZmPlcLckt+2N5u/JBLkPjEmXA4S6LQo8jl0a/CvJlPGyC8GnNKXxf
	66uNizk3M
X-Received: by 2002:a05:620a:708a:b0:93c:2110:14cb with SMTP id af79cd13be357-93c363d3c70mr226895585a.46.1790246515984;
        Thu, 24 Sep 2026 03:41:55 -0700 (PDT)
X-Received: by 2002:a05:620a:708a:b0:93c:2110:14cb with SMTP id af79cd13be357-93c363d3c70mr226892985a.46.1790246515452;
        Thu, 24 Sep 2026 03:41:55 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:55 +0300
Subject: [PATCH v5 39/42] arm64: dts: qcom: sm8550: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-39-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gTast3d4XqcPgNd8hTEWoP39BKm5rck5V3njvbIRnKE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3/qqHrWUcAxuohzr/xNHzMvJzTuWLm6pe1C
 NQ/Fuo+EN+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/wAKCRAbX0TJAJUV
 ViNOEACzQBlw1ReZ99LPaZPpKi5CQxJf7bOX9nPJJHFmDz533OP6jYUwDoUSu2kTiFwi4TB2gGJ
 ey37t+x8fymJBxpYKwNHm7haLRS9be/s2+vsfMfQHBlfGT3WpHX28TagYUR2nf9BnkP1Vnua6wC
 HnByk2K0idNsWgdvRsE6Cy0xOqAEktJutJd9EdjoQIYBF/U6+NJisTQlRjeVmcvzWripHWgnxK6
 kTEomd+JcGmBJPW/3+6WDiori+Ha/XWhLWY8wvsf8yYEKcqJjMhuga5Mio89Lz37sVmChbx4LtY
 M9XWdUp9KY7981GnSKhYFoJiL5kQyrogBeTxCVh8xHcsXMUwpUDR9FTzpk0Qw6F9gXE7EF8ysbG
 Dqo0sAeaugzdnC53fPFWhP8FExJYkx7RfzcR2eCXsK5g0TTEYMibRwyW7rn4ip5sTsxSU05dIYG
 bn7wdlqo9Sh/dpCYJPpY2Lt5vt30qo4DIUBOTOwTLK8mWK9xquHttBiYnYQ4+vs0leLk4Y6y2Ah
 LrhjjaA+NbYZvc5RBOLEcntXHNFbkQxAQSN6DzR15cz20t8NQhfrvtt4mNfJSo/yM+YTRR9xKEn
 vxMvqtxxMNDLaK/RZpqkQo9vJeehaL+UrMcKA9aSlimqkSGwCrqCpndPmYF8WnWaG2VnLXuUneh
 MU5+/4dl3CEYh9g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX8h9aMuicoXKM
 ZkxcmSfCr4ubB75Gz3pncziqRvFFvCV1LLj9FiRkJDeuid0KDYwLmtlXsw06nNhj7kboVka8Gti
 Iq2l5vg8tcA85gY2YZgG09lvuBgKUOM=
X-Proofpoint-ORIG-GUID: ltnkW_WNVXrt7GZ8RhpNwk3VGygfgEWt
X-Proofpoint-GUID: ltnkW_WNVXrt7GZ8RhpNwk3VGygfgEWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+nmxmkGCsL0I
 JV9X5Y8q5qGteSQE4KqT4UfmjBykChmb6YbGGFTAO4vOLkGbwPpSfVaakOq1ZiSEEKlbf9551OQ
 TGpAUZwqfJ3FIAESQESQE5LrNC90pJTsT2Y0QF91qIYjcfILpxImzYRh//3W3kGSbw9Cx4LOQg1
 koP+pV21vPhTN2Q29O7x4d5c79wPRIGgVpTZs5fF/FLhJGfkkhE7Ade/5ZYC5OK8KBDUS1QIUSA
 /rrR07+AwWg+Zv1plHrbajmXdCvuYXpPy0QHGJSVarV0O9i+ZdLj0s+CTFayLgJ85puPOSx4NDa
 gwZEpbcZlZUN13GrhWL0sW1LYtepgtRtnuQKJRFkYHS9iId3dhytuQIllvXuLjYSBDOU58DkM5q
 1YKWf87zACC3XUJ6xYdvX6sInVsqAJ6i8THnHWV6nhUQK31vQpm0GS3/3zK6bB17iqWDtSLjXl/
 hDjd57unJiS1V/HYXDQ==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4fe75 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SM8550 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 23604436add3..9e60836f4064 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1194,6 +1194,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

