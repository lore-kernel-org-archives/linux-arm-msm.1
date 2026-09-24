Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EE248C3FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246504; cv=none; b=eXXfbir8shUd6Jab8qkp4kEbhtImEPFT5KIiLjqK6T9mxNZdcsZnDBtTNnJ8otS0YK+rPmBlXJ1/5O+WIM81WyKLar+ti4RSu3Kr7p0d6OPizZ89wVNG6BRs/l/jDa99hJqFXjczxDPb6VJ8GpoXiiKT3PUOxrXeSiixaU2khsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246504; c=relaxed/simple;
	bh=ECGUwAnWWtrvRGIDrz2iEnixPBVwxwoICYkBOaREyUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H9Bay2SrrAZextdKW3OA3XTdw+9z4WSnUXhoNGefFl2G+JA2LO//KZAiOGOmb00Yake+DyaOPTUIX56OfVzeMRAIsgLLtl6/tbzRejgxu0ZLmtVmlTKm46omMEjZ30yXStoNZEDNnwCMM6QgFneyiILIIQ2joLODOzKcYuulfrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUSTNllb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExCSf/Ay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUSTNllb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExCSf/Ay"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PlKb1270581
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlLWpD2/COOnrjTBBzsyYlqJiJuOnZ+H6FYN8wIyv1Q=; b=SUSTNllbZ6Xu75RA
	W+7UF5e9nucLcJgDvwLbXSvo1yrf7NpdoZExvhtTnJP7svKXR9Wd+9GffRIPUd/N
	NPcAefiAVeZZBsAmS1WVGHfJ6mz5QAJQGBvfhBPGaIMO9Q4KdAVOJf/BPhCURQNY
	6J8Wlb/3gfjkV1Xuz/Nl1EOJ4/vldC3HuZ3gc/5woeHW3HaKsZfNnCOhjNBODlyP
	O5uvzLDF+7gKSAMG1yr/rj3VckBLp5ipQkcMzG0HwR3/4IvtERhet34TVH7BAO3e
	2n8PWOp0yEqCWwymify7DkH6ICbjxoaLYp0LMdDg+cQEgOFat/fQRgTeEl/Owfe3
	iQXIOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90ajxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a08ff8451so297785185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246500; x=1790851300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlLWpD2/COOnrjTBBzsyYlqJiJuOnZ+H6FYN8wIyv1Q=;
        b=ExCSf/AybPEoGo7bHSA3WjcT/7rlxxnigXwDeTyoLV0OcgRL94JvUYoPbd/Il6xQak
         9A3kiJhi8Pmjb60KbQ1Ggm4wufJ7PX3oL72MQMYtQsXjzh7mVbC2ak2x9YUG0n5MZ8IV
         8QAnFOYHdSZX6t9h91/AqEzbt5h/Eb/+iF0E65Y/KqO7aOihkPMgSEnL5RUl1OeO9nqh
         LEn2/T/M4c95qHzhyFEuRVoRC55xH8/4eydQNbyfu2l8OfT6SXb5wgsuMttokyOLPQG2
         wxcPuGr2vkGZXsF/YUfLkVjZoVdUUSJluLknWLOM4FuT8TpVm2phndMWyUKcCfFBQDPi
         GXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246500; x=1790851300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlLWpD2/COOnrjTBBzsyYlqJiJuOnZ+H6FYN8wIyv1Q=;
        b=T71FKn67nZ3jHxOwSc/0P51Z3BWuOXTJ1IKGqoiYjC3g3hBBK1JYMjCLFOaNAtCgH3
         U/dIj+RsoaNkydwJdA7XBIUmqKAqTuzd2Ba6s2rd0U1HwrkYU03p5jViWNCGpQiqFaFp
         y2U66Vx0CissPza0YrqXyDNkzvtTJCIPO9JJ1CL58TqtfkOwB/L/GEwyhGYvp2Ipkxlr
         bzoeKZNFvwzAn9Aeupz4I7fA3D/u04SxEm+9XogbWjjFh5uoEn0IRt2FVLAJsd+uq1QG
         CZAAQzJuq1HWf+qaCZcVONIIYC64N4Zw8nK/SjD6BWAoiA96hxmWxq7jcbVWnof3eDQX
         BUPw==
X-Gm-Message-State: AFuF++nC0zF+NDDvOhII+1A/A0SDjRzKxVD+tjvvL0MB2zVbWd+93ev4
	JHLCu12DA7j48gThJas2PJceoXbKgvs/Haw3DGjdvGeJlajw3L494eApfoZNGl7Cu4isMb2nsvv
	a0/ak8aDVoibKWvL623jIAmoBdfXrQbK1gS2fmnZuQedTQrBeDk+wYnOv/fL/goYcnatr
X-Gm-Gg: AYBFou0uHLn+Ca4YVcn+AfeEkB+974iWVFDOoK+qQCRNB58DzkRaHGN/GnpZcNJqItm
	6+ZvnLsCyN/vAO1fNwohM9PgLpVwZD05MGOiGBK2ZTLWWCxWer0ckK9oPAZ4bkbHjZQ99pqS4v0
	jC+Cv0john2UiwftqeTKgfBF7OVg6XfWDnVPlnhXc3iQkc1oTdVhS8zttyCYtuiIzvLScyE6WkZ
	RJZnXxGL5wBAXPmGe9l6768mcZkJDC2/Id8fxkbKBt5TFFbCjk6hTe4uv1oxYFgHqhO7nLBX2W1
	vACU4bSWVWGDWx0fetSe8InQYE5taRSql9Ek+zFr6y1vM6BvJdJQKjMDl9jVpVrUptiYYm1zIXp
	tKGHxSxbt
X-Received: by 2002:a05:620a:2720:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93c363bbc65mr234120685a.31.1790246499618;
        Thu, 24 Sep 2026 03:41:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2720:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93c363bbc65mr234115985a.31.1790246499066;
        Thu, 24 Sep 2026 03:41:39 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:48 +0300
Subject: [PATCH v5 32/42] arm64: dts: qcom: sdx75: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-32-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ECGUwAnWWtrvRGIDrz2iEnixPBVwxwoICYkBOaREyUo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP356Iagdvev0zM+0LMmfH7ZQNHsFAC5pl7S9
 vmsLSGFdSaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9+QAKCRAbX0TJAJUV
 VkEfD/4lQ/O4Nv3IFzjW5UAf/sv87/QaIqTAa8U71/vlIUNRS3pfxBcQE38GVxnhAmEe6vBo+AZ
 k8mMqFi0Dj56m7/p7JTceYw4ZtM1e9rohQ+3CpG3xAjmD+WX7lbilv+w4efpLWvE+V5v11kbewt
 X2DMnt5GCe7zkaKWlJjkdPfyfVxpvqct5Vhxdg7yVD+Vg8+hNgJTdgHySxDpW/talwrNbNaCwa9
 cjUg2lbhb3sQ8VN9GNov9UHrt1pRbXnSCdFMUCCAvMbcIQ9x7QpPSdVjlyUBKI9fYjlONs622iC
 glq+i0/Y4tVcCkLhGMaYojxzwlD9YnfYIoVioBVNAjSqaLklYpU6dYKAnHeTC282b+tpMyn/H3n
 lN+t0fjz8+rG5O4xIInDxQ8PZ3vW/WBRKaTURcxolr6Z1UnCJHszUc/b+cKsgMehiELQ4SQu/a0
 a/O16nqqDy+wNqIjtGnQS3wmEn5e9j9OaermbW+BPtBBo8jtPQw1w/CtcHevAOYXFOwstJ4YVvp
 6+K1XWRshYw3HmTIhkKrnfnTq/9maxszYJ4DKO5kgBfdnU3ZY6PPBWh06O13PugO/Qpvf7ZFmun
 ARXg4nZHqls5vzRh8cFToLcvjIVbgRAXmtQ+TeWU+a/dGd/InYptrLFYJVEK2RFoCDxZkfxjCXt
 345oIpTn5YqDJ9w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4L+YCbV1/PA9
 /FY3+0cD0+IWrY509IT4T5upNDjNLyL5y+qb7wyQP3Qwu0mcwxDl7Y0xJ5FWhyedDWYPCqVY7lW
 b0RR9H38QTAXkDeuI90I8i+/vZHdm5s=
X-Proofpoint-GUID: fIu7G4mMwvKTJJI-QiC0B5j9ssP8f7RF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2IvMD51WN9GV
 SGZHH7oAN1OFVLR2eCp1dJIV4Q2EPHVrp9cIMeTh4qY1mte0h6xyHMgBxDA5hlJVjPfm+QvXw84
 fL258U93vmXlkYBN04a/0DRHiTbprZFH7/80mPm+pIWUtnxdqY5BICMw85VumNFD4l7oPMCFf55
 /OSnxwm9j+idkbMhOsuG4Xz94rhYV7WCosirPqpdwybTFp0HvTkc+PTqLFCZ88IIhyQUoVPkKkr
 uEAW4YmhFHXEtLWrjKgRAmGiG/YE9+/xKZn01zN2ZWpoAPJIRFxyOlI5V35haHZ4xxSiFya4+lr
 qzEvREWS/LIWojerBT6kFyvLOMLh2c/w7QJYLn0ncZEhyBvN/7HEoU6xbGq2TH3L2PP5B2EhjjO
 eAWLFfLe5xwbBqSEt5/XjdwOYmn/rY6dYplMa4ZksVF6ma2Fgo/mpJb/D2K1t+cUaeVGkRubz63
 C7Mz1g3bPIDU6H7ds9A==
X-Proofpoint-ORIG-GUID: fIu7G4mMwvKTJJI-QiC0B5j9ssP8f7RF
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4fe64 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SDX75 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 81292850e531..c66f7bd9bf9a 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -486,6 +486,7 @@ gcc: clock-controller@80000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

