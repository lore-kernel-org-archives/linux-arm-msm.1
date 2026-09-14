Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A384963B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390217; cv=none; b=rAfsxGOgmoU3jZKvhf8b8J7GVs+2ZfNg6o/rkZ9WVTKaapxRZI7k0D0c1A5vjJ+G7rH0oF9/7gIAzJkn18rD6XMkYwAx2UybyAjTRdPWKziZRv5g/YDk4yM+5F3ATE7LWOzckF7Ed9aPpHboGrK7t9q5kgoQNoINrtTPxf4vmGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390217; c=relaxed/simple;
	bh=gTast3d4XqcPgNd8hTEWoP39BKm5rck5V3njvbIRnKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLstl5NRMeoXWretEyGWLdDrMJgFvd2E6Bmf45jfC1l6+kdpSGh10hC1kKMGrLKChP3GgRiLohhzEc1VWX39IBdLHwTyCabnHsaqVTCir2qOflek1TvZx2pDtMgYEzYIwsMLp5iIxvuYmGa1wA6l5x2VZyQHdJfLuGZ+pW2NYUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZtnit52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eojoSJxY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZtnit52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eojoSJxY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmAOl377900
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=; b=HZtnit52VRo7SWbZ
	rpmusuJKTVcI+CaThtCMYeUGPNcsEtLK6VK5Yy4d9WxfhhfC6oPGeZ/bLNuxgwCU
	qfjI4mNY/kmlnwgiVTJiTLBzQjoAkJtLF7BVsTwhWI016480JyoMdm0tD3IwNT2G
	QMZR9lekBmzo/AZ3htWmXlyo7Zq2xETzTzcSZmv02QyZsSLT6U6evmyUIQ+9jOqL
	LBVB5MVUHT7gnsiQXbVyPrigY395BzuH10WH4VBLcPVyeINesgRR7b3ia1nMfhoR
	hB5U8BSItE0pMDPDfP0thmtwFt48N1JhueTVXqU15zT2R8KKJZ+DgKX8jpykIhoO
	hNw+AQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8qk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso577352385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390213; x=1789995013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=;
        b=eojoSJxYXVLyqai7CyKpqvUmdL/yojTCjIcj2y9i8tgJRACjSoW4Py5Ii15dI6cmde
         7n9BGQtEICEcoOsSPCdj2FXuIoF68ibkBHsjqyP5Uxch/Xn7n1tfsNnSJzjJY4gLOH12
         YK4xsMurK1i1shi2kIauEgYK6MjawyA+XVETQxZb0nY+Ke7l5F+IUhGaczNWIzE6ZiAS
         JDW27argZMnaDpiPMEnLc45d6+IVNz2BVmHAQ7/gcG6zYOrd32Msw51vGbv93DE6MYyc
         QrD1tExLlHlmkQwTWwVhMrjZPL9tSfqlHtBINFHBOExWIxhT/+Pr8lQ1jRTwM4x5OZtJ
         VTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390213; x=1789995013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=;
        b=nGjbOw7m6qEn1BIvAEvU6D2wFxS0Hc6e8OeQNNO1QQJgFu8R5c067snRue6W7C3o3f
         qG6w4R8S7GaoHpHKzAOjwBTifb9wuRRAk2kiNFrqXbB3+6+aFX/VKYtNmvNJX4FXXLtY
         DQH7XMZzNDVVFunCYvYwplqrA3G+dn0eNCvBku7FHoM4LryAoxxUVUH0fzeGoCEVSkxq
         1AFVvNo3g7YLlFh545wXwwSmATBH+ag3gkMolOb2ggyCrav180N5ChLJHFpcKs2eIGYo
         Z6cdV7gtjQE0E+VTP/apAEtxKMPtYTI6GfCYCWb7flp/Dua3Q8fjHLfjttOxqMAQdlWl
         oVpw==
X-Gm-Message-State: AFuF++kEpqNV026DOWjNkQ6Syo80MpYV/ylgyvQCoGTvwKPZxJ6HVBAg
	ujzEy2fIAEUHywtXk2/w2P0thuLG8GKGfkx4hqHzKUDZIckQdTJLm7xcmCuWwszmi7WqAka7R7P
	/VUc4QgWUk5nvSqH3/Gh4MPVdVzunhx/WY/FlNtGmyIKZKr4uFkaNSkV2TKHL2qJXhbWw
X-Gm-Gg: AYBFou3EqzvWZm1WoOabjAjeWptHOcjEz1MxGrKeDTgZ509LdGbqN73Akf33ddSpIhq
	u4656pYWdobtVrKioOcAl2GzEhL/5EEVzlUqmDEPw0L+b+aZMSr6CpBLkLWi0E2TaRTDOUcvR5D
	5/muf/sI098jD4GcfRxPE+7/LP+itWHnR958rpVt2+zVtjWBFIWgOk41Q7bMwGxLVbUE1S8edGH
	/Vvrwq/IERcLdNMYjwMzreI4XGjhArmzJgd+yqp+drZAdz1rnDiUhv98yci3jKjtPkKoRcdgKtr
	XkFO4Jt+KIJKJXpjSAy/fY4/sgzmzLTMnNd4tzfnLgbs1w1JSHq4HvxNMtZTE9zYEw8E1cK8kWi
	U8ObbMkWW
X-Received: by 2002:a05:620a:890e:b0:939:710:536c with SMTP id af79cd13be357-93a29a11d43mr287275285a.43.1789390212761;
        Mon, 14 Sep 2026 05:50:12 -0700 (PDT)
X-Received: by 2002:a05:620a:890e:b0:939:710:536c with SMTP id af79cd13be357-93a29a11d43mr287269985a.43.1789390212192;
        Mon, 14 Sep 2026 05:50:12 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:48 +0300
Subject: [PATCH v4 49/52] arm64: dts: qcom: sm8550: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-49-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z7OYuvF3UplZlyv1JMssE6t1xtbRosYS1px
 uCEVaMj4HSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs+wAKCRAbX0TJAJUV
 VpDSD/4l3wayyj1pgM47gTnFsSQYD3MQqHgoy8gRSXtvnevM7zqzxz2Wbl4bIgQ/Te6uzRUVQYt
 akq0nh2+VGfaFWVvWc3/x8mEpOVEv3oaegIsmmpQBJs43pcEaZTqW7qX1TYHh1Z5BWLiz2eaxdV
 IVYwsO9uT5UvSIeCK2Jj6kbMcryMmrSpYe8t0rOLuzFTwEic3Xc3cmVLsMj6S1K2ZcllpkdAy5C
 e/Cd72w1K49/MhJdZCbuq4gwNFSdhWzWQQEaFL+rCT9DKJknTS6Pl7XzL9YscLNoEKf8DyUEU4p
 w2gjYDnT3TNGU+P45KN1Av5Tcf9UQ9R9EbzMLUoLVCulc8R+/D45iWTEqzHFwGoF34iMD7fo/iN
 E9cdrmEvu/S4RAzdTQ3gPq4LXirqxmz2RbOMNyHnHD3FSvCCCYajUVdDaUFNgdojnB+5KjJQUS/
 J2oWbvsRS2xzAhqU23d7PWCuJSr7zU6pNaQXGbX0XYAoUMJEQ5ZE5IpXfKYxvxbmV8rbS/AWpXx
 XjRiMraOH1pP+yPSOCO/+FS/Bt6ZC5+W9EbxQBpOSAqQqFZIXhWUUK79izx5tffCmUA7irLqsVh
 93gixJABw2LxbY2W8yShi6cqVb2wveSuxEoeYS+b/sj2rFZ1d6euVDZgVVks7f45C5xdgJtrPIg
 sRPYeYriXD0JbhQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX4OIDP9RAQtdU
 DCHlB+8rgAePlxGj8owcfkwxjP4cqhgt4Bo2heMiMruQuCOs0ijzQkZvEDZq5OnA5Wel2wOzIT5
 UCBYaCc6YOnjq23EbXkIpayZ56NVQYk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX3md1fC9wQbDr
 oq5zAWFR+0zGJrQc6LBEC4qh06rJQo8kV/B0LC668hqkYPlADNimm1Lt11zPgv+bpjU+8nbu5pb
 2k8O1/zpUNqE30+Fd1TpMqUbZ2gBZ9i7TWEfEth+GD+2a1nsd8yxwD5rLP5AdtfyIYle6AWudws
 CuYYJf/q99egfixKJOcoVYcXaYGzrZLIYYpcKWjlzlVZ0hZxuetn5EvU2lpcorwGHn5S9Nl4P97
 C6ntEsi4heIpBah7bYfd8EyT7X5P5wpwir48Ss/6/hEQS4toe4m6jPELIunaXui6EzFYYVYcpvP
 xoWL1D0IE/OixAal6C6LqBL7WOKVo6ZKQGV+S0g3gjL+UqOa4RTaohD1/+7y7/lB6WEOPxPFfEx
 t465tiisuJQJWUnToELCxjNddSq2PWPJaF9/cIsDfL/jFoNi7BlappU2l0xawtHovmxqOrHJs8z
 Yzd2N2pmsL3bKgGmKiw==
X-Proofpoint-GUID: ccSvgIz06jv9GyIl2yzHSRaQU52TcGJm
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7ed85 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ccSvgIz06jv9GyIl2yzHSRaQU52TcGJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

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

