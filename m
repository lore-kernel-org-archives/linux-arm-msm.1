Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866371FDE31
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971604; cv=none; b=KlsE5L7PFDWPnXJWvLDm4ZhP8DTaAAMnaY/Na8nYuwyEnd1wzVKUc+lwRPgTlfUKo9R+tATQOLv85PybYRHzvBJEgDwonbsXD8h+I3/tALzuHn9/Nt76LKepGR0g6/DJp56amcguzTUTWSgib/lFKpkcuP7SFbxb1c+XbMJAnj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971604; c=relaxed/simple;
	bh=Gw3kKloXHhd5RaAIBqqm6LohQm4BxTM9Pt44ObqDInM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KX7gmHGQcfTza1ZEz9rLMtUdCbhD+zH3jK/YP62TjvU7A8Dsgfp7/rberaLSYECzM7UyhyZ4qAJFMyjA9MBO4/Z4Brr+dyf/PB8rNugcVnIRavfnVub8DCY0d5J53Oggw6Bu/F1+LxlUbPQrV259IbueXtdznquIHcJmVkCa3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AN27V5C9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmrA0Z+F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AN27V5C9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmrA0Z+F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Zew13490929
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cYeD1qFgi7PTbqTpFl3N0zbczvxdHg1te/yk4UXbYQ=; b=AN27V5C9eoTXuW9j
	qoWqnBpOgwgFiedzmEzQToIYx4Vc+8U+TCJn4/prJ+2LneSZwZm1wF7I0ENHApzI
	rioRQhE8gUlDPSrmV13OKaf6bbG3Yo6yYNEOgLNVAqYX2ePn7bxmTpM8BEAMs9XB
	QYm8JbbbS7WeFTkm7AhOUmMn53V+59rZOzAsuOSKK1AtHpsRY2SPYZVrn59fWMGA
	e0O8RaXZaKc6cou93DDdrhoh8pNev18dyhfrWB7dPNothfdZNWssaWi8vEyP+Xbm
	97D9/12qmdX/lDlPjAtSz08ej6kgx8EzFk3pIJ5JV5Ahlrz2wJ9lSDcA+X5xY34Z
	CCo8Gw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9vv4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so2312570a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 23:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971601; x=1790576401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cYeD1qFgi7PTbqTpFl3N0zbczvxdHg1te/yk4UXbYQ=;
        b=QmrA0Z+F0i7XJZyUTB2p7OPt3raNRA7++3JENpobV3+dW96BmJO8bGcvn6O++MA5by
         KNJ5mqNC4qBbY9S9cw8/XyPsEceZUeyqinBU2ptE5Jwme1GtyZgrev7+fSzaTF+QTQRD
         V617xKppDgWJi00NUvwYbMsVuPrxuk9QicHDp8SZWmPX5c1locaJETEmiTeyeRlbsC15
         2MzmALUdq/MamfagxaZaRk9oZ9o99js8jv8d34M8vrJBYjNOKVhUUI9pthhp4+BV7et6
         PQoRzd+BKcqFWWrMsuMofZBkpGynkAraLytakiClj/WDPNlp18PG7RpThG0DE/Eb41uW
         1GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971601; x=1790576401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cYeD1qFgi7PTbqTpFl3N0zbczvxdHg1te/yk4UXbYQ=;
        b=exkKD44BbvenoEhJY+Xodi0bN0uJSiz5weSg2F1bfs6hbpx7PiU0GVXcJ/vAZV/plp
         4v0+cl5dnOhhYZigjUQ67wWvIcqBjdvS6uXM18FD8O490p1W2VS38xaBQKMKJMoUS+8W
         fFBOdCoG3hz29QogwuGp5obbw1Y8qn3IS4QYF87NhgQxPZPLfaXvSanvJOoT3RAp+Od6
         1qG0WZgKb9WKTiBzTappJF7xP6+0bw22ZPASLKFH39mWSwRQRmm+mKsALEqZXHCUAjR8
         i7uuhXE5IqrwJ2QRn+iQwt1aquMqqnZAy7vI9mRKwx0c7s4Wre/YY4+bHEvOdc3XVOUa
         T35g==
X-Gm-Message-State: AFuF++kCOMEyOlMRGigEC/g6KUaggsWIFygMaRViBSbN4Q7d03BMbopu
	3uFW2EQeLczezfcOmTyZMmxSw9wq9IiTDsJmZIGvxKGtDsvKnsmXi9s7OR/bzP6TgyNS5m0YBGa
	L4vDkU4w8QxvIH205TP91xXaS2CXjiJmU67RPxI1JQ7X4zE8xJdLIiSBrqYFXz+8esS/o
X-Gm-Gg: AYBFou3fGm1WsACQKoNbOEfWi0GMiF5nxwPY5QN0QEQZ/fRDiWob2HWpoW14OjXFSix
	GsL0DXqY5KKi/t+HHfl1AQRpHU5cgbLjZ1MFV//p1Rqb6q4N0i3GGE7smweFGInpjUdhwdQODr6
	B5EfyhzmbaNyRiPRYCNhVrJn4yIZ9y1ftBTc5Q9FKalwnJNDpI3n2vMf2znX8RIhxeCapXTcuth
	frd+ioZm+iJTRVNwSRQXNVTigpkMXwsyUg6YKfD/24sSo6yOGhYX5IPFjQ931cDOLgEYykOVoqR
	3VtqEHhBNeHopZ0Dc4XY25N5YJtGvBjg4CYlt3KqUubMlLjzHGLGBurUuIGhTm3djsq7hS2JW8E
	2dvyy7r7kSHHyKLvZ5Tposhqx4fjlWEvmq26/7VlhVqYsVRj2WtXKiz4WaEN+a1BUWxeJZ81X2V
	jd3NSIN5iSoINPz6wd1HpLd1/K39ItJh8+HA==
X-Received: by 2002:a05:6a21:7484:b0:3dd:a9a9:396a with SMTP id adf61e73a8af0-3dda9a93b99mr5596884637.46.1789971600690;
        Sun, 20 Sep 2026 23:20:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:7484:b0:3dd:a9a9:396a with SMTP id adf61e73a8af0-3dda9a93b99mr5596862637.46.1789971600244;
        Sun, 20 Sep 2026 23:20:00 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:19:59 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:35 +0530
Subject: [PATCH 02/11] clk: qcom: ipq5332: add 24MHz rate for USB UTMI
 clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-2-d242e3d49648@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: B_Yf5mjWZRNgD20t0aHawNbphRrMVPqG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX/zS44aiNRynw
 GGRPCRF7irOMYatu6Sbm8YNOE8eVL/Tmc7gx/mWBS8tvi9JvecIrLPxLOA+m0gNT0Ip5e71fo8L
 sAMT69QnAkOkn7pc8NGwBVWmCpWFFjfHsGFI5bA74tXNyuqkHiT7/mzpiBpGTEHUssIor0D9R34
 qPRMD7iChu8KYBvV2Xdhm9AyhM1n5fq5EhiK+MgVNBMlWXFGJS5992SdcI65+hOxM0roi/tk1yQ
 I8pwK3AzrzjD0ussTa5N/87t/HVbi3GAghd23iOlsOU3H778BQR9uDNNW9MEuZXt9Ac4VcuwqBv
 y2yecwGhnyIAgJTzno08LdmT86lFWO9g+0RJVmWAH+Pk2sBttJFnRAJGW1QMdhg+whR1Ozv1bPS
 THk1JlAEBLufsBCNamEf+gFGaj+Gt0aMzlFMZFCLrmxrrlQEVGKzqP/ORaS7G2XgQ6Dzwde/MQS
 hFAGGZMTUylvIPAIOQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfXwrUfVLbLDdjL
 FwoY9+9OVQPu84LUroC/ghLZe/5ImERPF2hjJDjKFido+mVqcZMoaFLjq7l93omiJEB9RtnJuZc
 npNyU3QB4D+seKFdTi18j+abqrwOuvk=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6ab0cc91 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T_jLbkAMJ8GdCbUqRukA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: B_Yf5mjWZRNgD20t0aHawNbphRrMVPqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

The USB UTMI reference clock must operate at 24 MHz, as recommended
by the hardware team, for reliable USB operation.

Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
fails when the UTMI reference clock is not configured to the required
24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
the enumeration failure and ensure successful device detection.

Cc: stable@vger.kernel.org
Fixes: 3d89d52970fd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5332 SoC")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5332.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
index ecd9ebeed754..4625b447c235 100644
--- a/drivers/clk/qcom/gcc-ipq5332.c
+++ b/drivers/clk/qcom/gcc-ipq5332.c
@@ -1038,6 +1038,7 @@ static struct clk_rcg2 gcc_usb0_master_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_usb0_mock_utmi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
 	F(60000000, P_GPLL4_OUT_AUX, 10, 1, 2),
 	{ }
 };

-- 
2.34.1

