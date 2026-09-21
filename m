Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C09336894D
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971610; cv=none; b=i5NFPxNJ1VNxx4dZjt1QH50AVQEiOAh0JhC/GuEXEWXknUakiyC2/HOaRe0TK5dPcRKBoYnlpnEHnQSmg0Utd37udyWmuooroOdr12I0u78N7tNio3anVm0Yh/yaIG1znmACKwMLi4WBVJ+73feZLG0ID8mDHwxJxdaCAzitdhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971610; c=relaxed/simple;
	bh=nub8YchaXe+fEs7vARMi1DJduhsG6p4g9wlPVkeXOik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFQD3hf3z6LfejffT4+lNSOp4kp1BCAoZJvqsFZ+5OVGJlXbt+0sWFvTg6md8S2DXjt5Q6cqNdcO0xa7MF1dqhDLk5Gc2vsXyIh8GcG9iZhwudVfCGj5d2Tx2dJI7nQMDLhHGu07j4oKzY0Ej5IoMDNawEPnoWxsa4wbBVwAxFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbLFOLgS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYi+DQu1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbLFOLgS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYi+DQu1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZNbg2888367
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mUv4XNsYY7RWg/oB9/eJvRwSDlNc6B92miYnzdDmack=; b=UbLFOLgS8rjw6YAb
	jwHQoLNsga5DeNrRWQgQ8MrdIQMcgn40m+iWRW/5XMccD5lkH/LVrs8R2dPpRcxd
	Ga7ixO5JsvRigkrIr0ms583AIk0IY/g+DU1F3NtQ+Sflu1lXmj9fOQM3UceUUFKO
	Z4gGovv+xURURecGryr0RM5PiwVZZEz9j0AWkXMWVnjexU8PmLDMbm2hZQGDi2LW
	ECqjq2N7T49t4fijc6KLBH57tKaCrTxzGAYHPKwtDl2mgu61anhKWXqwjyDfI1al
	SOsrklJj4xB05m6ovrVYgvEuEBkZ6kDDTsG3tqKZyDw+29uvw5K0Jboivpeh+dOp
	UvKiuA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq7996cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1651454a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 23:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971608; x=1790576408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUv4XNsYY7RWg/oB9/eJvRwSDlNc6B92miYnzdDmack=;
        b=TYi+DQu1TOaf5GjM6n6xAp7+VlpEKkwdFQUBpmP753FbmPMsYX+vg17hsqrexYHdqd
         IcS9p0QRioPDaw8s7tk5chVHbRvs4omOp7wHHtIzpvJalI6/NSKEsJuvsJLKN2gq0Lu7
         lG8IZjcle+7EfUPN4xe3r+uUhRleNju/ecQc1SP+5+1Lwxr1hhbWN3aOeux1FsnZd2zB
         Csbl8UgZmBczbs3R++13lyRvihycBbj2Ggsdqj5AiAjX2Bqd6I9+8beOFHPyRgz5EGQr
         2+m1ATf8GxejeUl7Px4XfoqAWJehNRLIpCTFw7eyQmbRcw/NIQQ1Ss8SmClnceTARgSv
         Z6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971608; x=1790576408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUv4XNsYY7RWg/oB9/eJvRwSDlNc6B92miYnzdDmack=;
        b=Q0CxAsyYDAjFZ2NavwT3GOiDXZzyaudoWRJloFgfOESSGe0RrBlHb8a8lru9Mhxs9o
         lnHMKk75elaLoKYo8QvYDRFE8ECWlfXnEIp+FXXPO+q9zsEKMWuKUG7t7Cxnpq88jRU2
         pkriBpLVNRtsTNd6mDbeOGPtC8C7yj+c1UmRa/MyrgpMcxLkYDov81msVLFUa0HsxmY0
         jZfCRvMtZAWgKg5v/uyTc/K6WIsTxPbTxJAkxoGTxdvd4WiKQlE5cXKhdvJzY9/Cftl4
         mItr1JtcnA1jq76TzW3GXjdvyFsejwo351XfzQAXUDzjCmZtMT5ZQkLP9KuUPJNhhVyI
         Kp9A==
X-Gm-Message-State: AFuF++naf4FtZMey3AmDCSp/YDF64q2lKtqc944YUCjxX2NxmGg2LhRp
	0L/AtojcjZMAC/H5jJR06PpzJo4AreSjgqOrlZL3NO2ECQZSBzGAkxO3nOpfWFJSfLI3BbCnwyc
	96UJB96C1C+MhSjgZXgykPaxfCQSHWH/FAsr+KL/9F/b0D7T4caR/XIwnVcgl6/7/wfHV
X-Gm-Gg: AYBFou0401fL+h9eRazo5ivpjLuVdA+3KpbtYVIsw+KsmeGKp9fdtxjoF/TBF4ltwfp
	nsKpAdiA+6kx6a8HmyPGXVwhYNvcYKxxSbThbnuOjaxM2JSrLntbutQ3mwKDX4rn+xLoloBYG40
	TAnBevOjtOhgcaYYmNEOaISKTnC73aof2QLuc+Dp5orou5HOaK9d2woCpb964u9QBi6BWoS0Qnq
	0USYTICcssTDsmxuH744IN/b8EZU7v+mM7/vkV+BrssJbTe3d0x93H0Zs7LsDN0PHZibQi3AdIt
	2ixdWmB749KASTIHGxECF5HmtKdMs17+BicyldapUmtJ24jtWWqgL1eJrcOs2EEpmK/qsvNWZMi
	BEiznidgVbVvrnUZMREvXD8ikgypbWKnakORAqHqds8ZYj1j/HdMir7MVNRxgmBy9c6LHwi+UOJ
	I0ElsFZvPvLl2aqHjGe3WKNDsTlpwDfReuPw==
X-Received: by 2002:a05:6a20:cd95:b0:3dd:85a9:55b6 with SMTP id adf61e73a8af0-3dd8c5d2212mr15954733637.33.1789971607719;
        Sun, 20 Sep 2026 23:20:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:cd95:b0:3dd:85a9:55b6 with SMTP id adf61e73a8af0-3dd8c5d2212mr15954699637.33.1789971607300;
        Sun, 20 Sep 2026 23:20:07 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:06 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:36 +0530
Subject: [PATCH 03/11] clk: qcom: ipq5210: add 24MHz rate for USB UTMI
 clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-3-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab0cc98 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T_jLbkAMJ8GdCbUqRukA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX0o5/llDVPkSP
 cgBIJ7DtuDuUw4gvnUaT0f+xKxm7jP0yh5AE/Elnvj1i40aRSPOtRNFrhCQlp5XKpE6H/GNiLwh
 g4AGF7dtUMUbaM78/Mrwt8UW3JwCQAw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfXyZj1fPiAaA/R
 +LE0u2SaxX+J/tTlGTsTWywqT2hktLVy4HM17eCIrt5jcgwYc/eI95XbAGmxJzPItW7Kbm2T2UU
 Bp+39f5Rjegf93cJ9QEH+hRh+cZ+g+/MrFhP2/vEJestNiIkPWD0SraTGp2bwajrYMgeIf6S+SY
 RNZ0vM6Wrca6WV3lnFjVU9R7BT6UqHYtRztjflV4rmse6FRyZAuMetE2VK7+cn+tXJ56RN9g1of
 Ae9lYIUOmRa2eLKHDRlwjJWCi9o70Nv1vf/VMUkIvBSZV1GBot8sOlMPtrIt/Aq+YwI8X4wqnnv
 JrXjWTlEvZmMX5JNIf4rLgDZecalVyEm7o4ziCWMc9z1qmMCLa+32KFpXAVqizK1x6HpCQrzvSU
 yYstAsPvMAxoAsjqJF7q+xi9HYsPicJyMkeZUEspu8pGpJ0W21+h1IGwYLqDfhQk81wFJz6CJKm
 ag8Lq9+oB5lY4iW3aFA==
X-Proofpoint-ORIG-GUID: AYZhd5LVCIzKNuLchOYyTTxazvY75bgd
X-Proofpoint-GUID: AYZhd5LVCIzKNuLchOYyTTxazvY75bgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

The USB UTMI reference clock must operate at 24 MHz, as recommended
by the hardware team, for reliable USB operation.

Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
fails when the UTMI reference clock is not configured to the required
24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
the enumeration failure and ensure successful device detection.

Cc: stable@vger.kernel.org
Fixes: 844be6e24afd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq5210.c b/drivers/clk/qcom/gcc-ipq5210.c
index 3a786a21bdff..76adfa8bf2ad 100644
--- a/drivers/clk/qcom/gcc-ipq5210.c
+++ b/drivers/clk/qcom/gcc-ipq5210.c
@@ -716,6 +716,7 @@ static struct clk_rcg2 gcc_usb0_master_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_usb0_mock_utmi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
 	F(60000000, P_GPLL4_OUT_AUX, 10, 1, 2),
 	{ }
 };

-- 
2.34.1

