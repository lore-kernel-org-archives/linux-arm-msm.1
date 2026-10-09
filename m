Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869F53B38AD
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 04:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519394; cv=none; b=SkycMm65HO/XOdmt0yoq5eRQ6LhpBc04Cpcyx9dY1Dqx0/wDzPIqwcRvmO9Fgf2tqxjOxao8aYmehUQPh5q2z4/l4555r9gqHP8MVwuBcKWVzCw6kayI9owz1kVPOriGM/1x22hP1Yxg+Lg0TCcsOSICSYB8WdzXPZCSG7+u73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519394; c=relaxed/simple;
	bh=GQVlKxGxMPVwtr4Y0DevBtLScZlMT124U1PfUHtcSdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UQ6nr93o91eIn34V3WquEis92AuIuSvPvOw8Ngr7plWT3Ah7fT0SBbFES75DrjvwPraUdHfmVkTBw+//2IyFNjNzY60Bs2rwPALwya+U9TELEOtTSH93NWNENsNgIzfoKi9aiaZFNdbVKUW6CsPek94EiwhEIk3QQ4ctIXijePc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IeMs0p/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lnx14Zz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IeMs0p/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lnx14Zz4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HPGs3768962
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 04:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aIXAEh55bTztXEvBWB9p1a
	kMVE9s1YNf7x5A3tBH300=; b=IeMs0p/xsVin4lfc+1qzpAi4VGXk1HHHNB8e4w
	YC3M+MRg00gri4KE84NmPClIybW6w4rlvU+qCSRlvo+c1OWoFnwHJqXwDcdROC3u
	ksmPoEB7pyfx8AxjmGt6nSTRoGhE+qPoRcSF+QtrG4u/URS1IA2RIS897R61lCIe
	eIxssFggUSicALqYkWPMuFjCx8X5gQAWFgvkBsK9md5b6PI5SzzJ+0WclUZdfAqk
	8KkBkveYZZjpB9NOFTCG1CB8X5sERHO5chSoPseugd63DJXM1cpS87WOsZpsiSaV
	fzne7RosNnL7Vj7YNNPX79UpEvIYrObGL00EQPBU2LKbsQig==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu1t69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 04:16:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-155a75f91e1so4744799c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 21:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791519379; x=1792124179; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aIXAEh55bTztXEvBWB9p1akMVE9s1YNf7x5A3tBH300=;
        b=Lnx14Zz4sz5Jn3tSw5zEASSDhZoPRrw9+EW7a6j1xUoHbNemuj48uiOEkbztd5jomf
         W5FMBuQqoZZ8KkYPYEJM/MAKSfCXTMBW2yDOS2fJfV1f0UAnwMUEgkP8BDbzpd/b1CpW
         zsEJNqPmetgbaF7Nb0zs2Yc/sdU1uB/i0KG7ECqL4DhZq/ILcuXMyEQppZ6oOGel84uB
         iNjKQ7AbzQMfOj+m/Ftg+wpKujIctHQ3lNzStbfPJsWP+S3swDjhb8kfGIxAoGI7alEe
         cb7QWpI+dkxAHKpXydTo5IwoZIIgFIcA/G4y7BwbaJ/YBVCgQWNwP7CCTACj/dE3eTZO
         neNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791519379; x=1792124179;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aIXAEh55bTztXEvBWB9p1akMVE9s1YNf7x5A3tBH300=;
        b=gRm3rJxDv0Dag+xIOfsnENnhCB28WyVbBbwWfOPFU2dxOfz8r8exoFV16bS/ISr2Fs
         GNRs8kgoviNJTaLQv5sPRWra9ikMrL21J1WCNeb9S84lUMCi4gqpeNpsyFfC1OHogY/O
         KYawDevBPgwyltY9tkwn7CNuMbOgGFrNkXI3IeqHgs1tBsv2IDjXg/zcw/9v9FtvDyie
         lgp8Kf8wH5Z6mxb2UngFF4CR9XCxpKwH4ZUb5d9l6Fdvp/ajdYIbHdCUhepL5cWwpkqV
         zk4ZOVHgXj6wPjt4MIfQO2kdNA61qtyVuGQA4kDgoo4ipwrLR3VpvLy5gc0jn1Wj/it9
         hP3Q==
X-Gm-Message-State: AFuF++mRgRhg3nvPXvhPexDArvbM5+E3bkAwZciD/yP5AKvPTQYmX+BH
	Oa12tzrHDiZmhQmov2sW6dNyWBqD1okLAwlHdZhbk+IamM87v4nhJi3zHo2rhdhKMlyczopUVnT
	Fhyre4syXicoKEXtEoRTxrAoD1s5zeQAkO5UBofD0DYDsMRYdoGeQlccWNYcuyXnXlUQe
X-Gm-Gg: AYBFou09ygPzqAoVmzpZrGEWryxUK7m2wBsmsK0rToY2bYv3jqL5nsuG0ghtfhVULn2
	uTPa0bOXlW92kUpXDKZ38U42nzIMycOIDIxJ2zrDnn2nwPQUJGYEIOa6VNb2o+HfJk4KzQY+CYY
	TbQbNAN4p3YWAw162JAVoOnA0Ru6GCSdUtC9bqwHwkbL3I8zcilJNsQmRKA4W379ZyV1ZJ27wnk
	YjaUyDFOexfJn9raOb53eo069IbgKBsz55ADH2757Pg/ciP46FN/qmwsDUNHWcbqcKM3fptPT8k
	AmGhzzUMLRvFb2gUyLY54XTLkmWXRn4ZC7ailGrCKgfaj1dUiTqXTPw/I+nHRAwi6BkccNPwnsq
	iO37Pc/oyOUwVmwCv75WCQodxqXAhDcY=
X-Received: by 2002:a05:701b:424f:20b0:149:f2b3:efcb with SMTP id a92af1059eb24-16a12070956mr1211035c88.14.1791519378860;
        Thu, 08 Oct 2026 21:16:18 -0700 (PDT)
X-Received: by 2002:a05:701b:424f:20b0:149:f2b3:efcb with SMTP id a92af1059eb24-16a12070956mr1211007c88.14.1791519378352;
        Thu, 08 Oct 2026 21:16:18 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm2528238c88.4.2026.10.08.21.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:16:17 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 09:45:59 +0530
Subject: [PATCH] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH5qyGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNL3bz8ohTd4pTkZN3knGxdwyQj4zST1CQTQ3NzJaCegqLUtMwKsHn
 RsbW1AEmVdYhfAAAA
X-Change-ID: 20261009-nord-sdcc-clk-1b23f4eb4177
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfX9DtQOibPRnYd
 jMl1F9OytEQoJm1+rqeHxm5N3ZQo9QZiB0uWVTA7+NNFsoVVXcNIYhkYDLA7hoJdTYyfOfOPX2D
 embYIhTyOTGmPUmhdvo0TREqeIKjakLyTtPo8/dRatksypGBlSo/8GTABT6/Priy9Z/wme9lyg2
 wx7eGDW7g4x/sZhZvTDI0zOJK5OynXMiGnIZQKI4HiGzqifoxMR2DsZkhXsCbO3mK0QPlrYXvK1
 xmdzAHLs14cBeue1AEtKfPfj7CsVmj0plwTz2xmmiXfqcb6Me1LTKNLElwGus0DKotSz5XYGKRa
 D/OaOHtyPPUa62DFvPl3anjT5xXNAVQU1QHI4mFCSzR84DN+6u4XV2qeBchCpoGQmarwHWJY2CJ
 kxQqD1h25xqo36+E/cRc0iMa7SS09QixVbXVAcyro4tp3sRORFZL6GAVsDvaFYfoAp2J2DB1VN5
 7yMXwVk6ZQWxFw1baMA==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac86a93 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=o3hcfxW_DcXKSnDgckwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: ODEmNabvaT_t1l4QVf_Hpx4ZI-faK7w4
X-Proofpoint-ORIG-GUID: ODEmNabvaT_t1l4QVf_Hpx4ZI-faK7w4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfXyoDhxoQ2ey1J
 preIkE/VllZ9kCJD/p80Xr7bacL4P6BdSjnllfsbldIeEQ8oC1x/h3XXVc6jgeqAiOKzuc5LcAa
 rQR5rlwMeqWrLX0el9++Ux1UawYJb7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090016

Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
the additional clock rates required on the Nord platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 68ce4d6278baa5888b277fb34a135d7e5beb789a..a72fce70de45ced4635e7091140e63b5148decfc 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -436,6 +436,11 @@ static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src = {
 };
 
 static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] = {
+	F(144000, P_BI_TCXO, 16, 3, 25),
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(20000000, P_NE_GCC_GPLL0_OUT_MAIN, 30, 0, 0),
+	F(25000000, P_NE_GCC_GPLL0_OUT_MAIN, 24, 0, 0),
 	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
 	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
 	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),

---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261009-nord-sdcc-clk-1b23f4eb4177

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

