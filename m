Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18BE47F3B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246453; cv=none; b=H9nx0AdmFS1h+3wCLb7T0SenfIs6gWTCry4vReqXEJ0PyuFZ21m3avExj4ORbzPbVV70SFCAnjNxBgHkOkWV5hHI9tmF15U1XK3xAcJiZ/cjc9M/vdOBLRBUBJFrubjWACKT/A9ZjSNpRj9DzJFKfQR85peCw5fG8Y0zmzp27lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246453; c=relaxed/simple;
	bh=1MzmGv7pYEsIWvqeCUGVRjIwXDIaZi9bQoFCu0NoLrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMbJmlr9JVU++bRE/9sM5sPVbVaPtWDdKZX36kUcL1wYqcZfQ5g7LlJEQxM4Qq6HvrkrnG2qWz/oG5qk6UcUa6H9nCCdkjp02bYtK9o8u9+OWoG09r7fgMKjhGAAleg8ZHk3DPSs/JkbwdwFmiwmvaJy1n36y4oDHgcJZVb9d0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fpl7Evu5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzj3qJKU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fpl7Evu5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzj3qJKU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3XcR538609
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXvjJ7kXGR8I+uINFXE7o78uhrHa4ykQOrza9il/Dq0=; b=Fpl7Evu5G5ca0Evt
	fqzYDL1gzzcGAc7Jzs8gmqOJFdV67XWTxGS7nN7QeKs2/F6BETHtbmOilkfHc8h6
	eurG05wF5BgQjbx+bkD/t26qpbbjd7Ep+cHMn0+5DFKcNCjTMA1cnIbows5iVona
	1svCg91JMRwlwxp/htaW0qN/9CHIDrDsmnhmqX8Gr35BflBmTOub5KtkEUddKNCV
	sXlBo9HTIiDKcaNH6bzMcqM/mw4X65HMwH4xZYS0T22o/ucb5HR5W8/wtIfzqDsA
	A1Y69ETALYaL9FNFt1NHmnmOfMa2ncZOW/zdlqKrVVI61l9GZ7yBZAAxIwRivGTZ
	ZO2q2Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc84ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-912330dd4dbso13932946d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246449; x=1790851249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXvjJ7kXGR8I+uINFXE7o78uhrHa4ykQOrza9il/Dq0=;
        b=hzj3qJKU020WZPYFCd2aKWLpB+RlJ2xeCJ/O2Tmsu8SjBKI5lylHFZ2dmxBvZi0E1Y
         IMVzz3RRydw3kKT+59VSsMBkEOMr/VWE/+LKgEHiXDhP6U3dW0jPSXy/BPEP4GYHwoeu
         wy/oifzcrS2iTV+hPi6mqrsXqWJ75CGrSwNG497GlIoatbV7Rpc2Bzo+PshG6ToeLQvj
         wfPNwPUpjKV1oN+rSeNzY2d5VLWzIpDv7TwNiGPc3Hv8kB0dhrVAOkPtPAvcL0RBaAVl
         oMs1olsInDPCEnKzFV4m9kbyYjDfZ9qia4y9+WloeSwJL1MVYgFpQDaKtFjaOTYfK/Lu
         WptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246449; x=1790851249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXvjJ7kXGR8I+uINFXE7o78uhrHa4ykQOrza9il/Dq0=;
        b=P+OEZ5aowx9d1yEKG0pO/ei2RVRwJZgV15dgQD7gjBUPQlBI5Ov3J03xvizvJTyxPo
         N3WaxbfUI2EFkNlL2/HekLiznS/1dySt1F6NP3VaLKHb6f6m4NGQIS+i7GsWqv18vrW3
         ziHw3tQTVnzBCr8MqmDu95Ms/tg0/FzWjYro7myWbUj/nhqx82b3pk8rAD3JgL/RUuJ4
         hk5tirhloSPs4YtLwMVEPgEm5058NKEGbkjoxLO3g6zsSZq5fpXdS5eU9LrgZLBH5FXs
         F8TX/Ds6M0Hjg8BCC/JMjiCFj3wG+M1QKTn28k8iKIoIRIkfnABHgQmrCr0SuIYnQ9FT
         zSMg==
X-Gm-Message-State: AFuF++lKN8RhCuGTRyxJ4xLIxHeSkM7cDJb5+8zEhdSiTtd7iUkqHpRZ
	70k+lhLQTDHZ5btE12l/zlFrGQ6N4+FYbLc0NZao3ht1EUOSd1497aJ3q0DVmR7d318mjlg1aqQ
	hm0pQkoyBwRgedirqIInFoIeTSjE7zvjr2EGFGoOJInbkx3upvMtm4gOEyqH8nfNZeerD
X-Gm-Gg: AYBFou2C/yG2HFBVPvzDTK5CUdGt8nOR8fRkzq4Y4MNSCjTNUiOcRj2v8uyRyOERTRX
	DaK2uYX3DiJISTkp8RcWjniLzKMVJieQ9QmZwtS4fTIC4dawAXCE0vRS3RXgKJNjvhBs787MaEL
	CPfCmKZv5mS8HkmPTe+FWkEB1W7x5a29U6tns8RI2lwRUw+XESuzv+RQhpjfZAGEoUW0ypyuDi6
	kXBMNetuiKnrKDbIiMPrXmHqNAFDDI6W3dniBj4X1iitt9DDQhnlMh1cdRrIMr3IaL4fALJI6lM
	yQIa5Ll5qrDiA3fjICtRZdJ6Sr/wkZGnDWX6JwQpZzYjAG2riwxkvPGFhkofV+ppokYPmokfSNO
	FKiOAmpZf
X-Received: by 2002:a05:620a:8811:b0:93a:ea:b00e with SMTP id af79cd13be357-93c3676b6e7mr189296085a.30.1790246448535;
        Thu, 24 Sep 2026 03:40:48 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:93a:ea:b00e with SMTP id af79cd13be357-93c3676b6e7mr189291885a.30.1790246447965;
        Thu, 24 Sep 2026 03:40:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:30 +0300
Subject: [PATCH v5 14/42] clk: qcom: gcc-eliza: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-14-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1MzmGv7pYEsIWvqeCUGVRjIwXDIaZi9bQoFCu0NoLrc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3nRBTZM/XX2RyPm2MJxG/wgZ5erouVEa39m
 JbsAF7RhpeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT95wAKCRAbX0TJAJUV
 VhYKEADKuAmtbqwmNuZCpB1UZjtFV+oGg14tiZG0zd6QwWLOtnNEsPvlsrSbAnMdZrpZCwlo/Zb
 B4XmpNakB5/+Wl5DQJEbcuk7g8O5KkRuc6XSjhX6HxTVf4LPjpkkjPrY86clqJi1do9Mp7yNWnj
 H93jGPhbMdpXiA+FpxN2V+MbczLkiA+8GX7KaD1+a6jEs8+JcrbNWodXklomcaOfea57wWere63
 L8gQMc9U+mylF+gmBOXMRSTWRPVuSINGTrxd/MfGm6cG/dGX26pmNwapIiDnsLJCWbGHFxTJ2NE
 Vj2zVc3m5eJ1xVC5zTaZooLVBMZFUP0SuMxJLiro4HPTWqDKBAhyVMfuoTRgas8T8jUxXTDQZbR
 iEX7jP44xQNAB9TZWx3ZnLMz2MZFoATYVS4EZAYg4JJ4kPBz0GCNlMXQCLy87JTH4Ud08TCaF5H
 zx+0gtqvdnWv1FKmvUE06iHkgLDVg/KhuVt/YSG791y65kOfX4XtXuI27iIR3Ov+YdlSBhCoryh
 dmnM3taAKjE7mXWM9LihmPd454IznAEx8GlYh5usPcqYyRdkz0grnajGCJ+Fs+sNNqM1uupBOUM
 UiENGrqgWkHmCzJtSILUchrsu6+seMV4F2U7s7MWvM+BZR3IRdF4O9tCMI9hK+FWlUF9e+XSxKH
 ZHeqmwOxZN7jcvw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: U_LPkyBZMk0Tzi5S8FzhjUI2_2RRtYro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzToa9u0u3PLw
 uoT+4+aTQgBEoNHFfC1ZprMD6+lIXwNsPUwuRmk2LK4TY4WBMlIq4xwWT8UEd2YgBqHGP9HL4Wo
 GvmxCyj83wQ2RPl9Z1IkI65tfWNeX+RcbbdVr9eX+UmUiWYTHjT60EYZjawg8hQgFAMUhIoiGT6
 INTzyBsqOYZaVhI7G19gcGG+1kYEH+WclLrkB0iWegWNQUrI+L9s6p3/YEKoqBqUhBW43C0YufT
 o1Kj12V/dPjRjL3RmjRj28Jqavuu7iaOlnXu2kT5ZbWZTQU3tec79sR5OIQrFYbyOwaryiPLXW6
 7iUXg9z/XMb1hS4QYDe9/MHiq+YARRoPOpKhmK485zwSGHs5Raf/DfJ1Mm4jcYg1zhNeUSkgm2U
 S/aSG/apFSM0+qoIbz7C4X/vTFMvGjrjo0oSnH4M1GGLit+i34d0I1qEQWc3Hm3kTp7H7nGt7Ia
 1vKcfUXvsDTiLBfuLtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzlkP2cAA8jjP
 dF6RiOvMdYNMDdrbSTwbmdwxZ0QPvPJqP/21iN8y98n19gmS/eYke6BPA/LubogD20AnsM6txag
 DtU7lpg+tjJ+vwYkHaDL/Qhybzsz5pc=
X-Proofpoint-ORIG-GUID: U_LPkyBZMk0Tzi5S8FzhjUI2_2RRtYro
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab4fe31 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lgFvq8bPxKKT3kYZ0-wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: 6393a36fe184 ("clk: qcom: Add support for Global clock controller on Eliza")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index ee486c24fe66..064771726e9b 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3068,6 +3068,7 @@ static const struct qcom_cc_desc gcc_eliza_desc = {
 	.num_resets = ARRAY_SIZE(gcc_eliza_resets),
 	.gdscs = gcc_eliza_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_eliza_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_eliza_driver_data,
 };
 

-- 
2.54.0

