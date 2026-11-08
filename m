Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143964;
	b=e7g9TscRtrSjyJdGs4LTBx0BF07eScaNKf4C1qxOLVTxzkPRH8JSY3nGJVWn6FsHbTb+
	 rd851KT6Pb+XyUR3b6ZK+U24oa+OwaJysZcw90S3HRRCEelk2/5tBhQ1FkrQKdM3Ig9ip
	 ehhAugSFvzGT0k2jz0lLKmsH3fUf+Ew3DSu4hu9+o9soC1g2F9VsLf7SZL+iq4s1Ae5al
	 5EU3hrB8qtSEin9VSO9tKUZNkUYdGacT6AVQvseDzm6tV4zgqgx135AEG5PcgBrdzbPlv
	 8CFsF8SdchcW3CevyfBmVnreKA/3olLfhj5IuZYaSVbEIueU9OdHyPfbNoDPubPcUAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=;
	b=iMlQbiepJrjd/dhRJQNWpf7wzIEDWnV7lGWneahjPxpShREJxw9RU6nJEdRTOaE8ILc1
	 hepeUai0zOPHOe2/qviSAX6ZBq4JbldAtQpjxJWhH2XlI+YCnv3jx61GHhL8b1yig15IB
	 GRyJP9Pi1VjEEiGZXRdp7pf04FCMa8lK3M0VlBAteO2cBUyABMIjuaHk8v77o4EKX5EFh
	 JHYN7vtFxoeTiEWX+7Pzuyg2kZa/WFzVVdourL1f/XpKlZnQk/89XBsRaey2bF1lNuZZz
	 80EBTaQL6rNEUFdMr/JJHT28NbbI8xq1OrQ4+9fPNCXLNU23pw1NbZSLthJF6WZG2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJb+vQAK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cxvu3Xtz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712B5606A31C
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 13:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 712B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJb+vQAK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cxvu3Xtz
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AfltF2209025
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 13:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=; b=mJb+vQAK+qKuQ5vs
	Tsruf/KqugQbkXCuoGn/evxlOTchE1/QLQHwJBXXn169QltrYvv5wreM0ua0efwk
	T5vmFlSCSynprOjKS8/xdzHUiU7QlKIrfo/2D8c3wmvJvu3LTZ8hxQB0CESQYxBL
	nrBconEYbjucACCcu4HDt1c2eIVpbMpIeuU7/3IV5Pecj8MEJX0tHexTBS3vXBE5
	11422AiNv6kTlZXOBxwq7jyh/XhoocDCLOIFrmC9yyUXcEBTVI0vKCKXPl7HncCp
	RcNRA1cTFcz9PjZdJIuXdBVRgMWkacbLqVdWOJBWIBtwQO3Tvlmh+L40CsAB1ri7
	LI+zWg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf39xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:19:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso243096eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 05:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143963; x=1794748763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=;
        b=Cxvu3XtzGCc5/7HWJ+EPA3OtQIY8A3fLLHQYSqEj+71QrML4dlQOF9kVArEoWjoKWB
         sB+LwtbxvvAEc5BUmGulQTMN72JkfZr0iK4HK4YUia68tXXuaqLH4SzcbsVxl1hr4oxt
         Vnqs2gDFKsWTmFKMlDN1auQAvptr5KCMNAn5IpppmOOSvdMXIHCIlu/lMaTLG3VetO/d
         6c1rosYtouuYd1fPKtN9s06USdetZrBk56wcwuQo7lTtMBQjeTcvbAYo8pP3cl+9SdMF
         +WXA3Sea+85gB5vIVrHupEARO5WWcp+2T73hSQ30RRcx4cz7+soh2TzHxUC5l+ZiVHAb
         1fbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143963; x=1794748763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tycUGBo04V2tJ9M0m7P2ygrulrL8aOOxnCufNoWwtwQ=;
        b=XLHpDvarIUXFxMxVBttz1Ipxsuq4p5BPLjVO0sV3+InU3gfmHo3juWZgeLqJF8QuOo
         n7+jCuP+ZuXXe9zTVcrDvdbN2COQGZYPF9gVk3JV34o6/BBfBY8cYXEjPo8IonkyMZTn
         HCGDlg3xJffR9B7jkWL3HCf9rDymkr0cd0A1NQk1hgSZnZHGzjjlOg1+3I77VDgP2u69
         i2wY4lzztqbyzfW6UTHWPk5z0z2lVlxZkPAtd5yqSYC6OUVD+MW6Ht8UR9mFLBnF7EL/
         EryZsBehL4DRw3HEBLYvyKEoyaF28ZbxV2oYeGZkniC2v/omONfXokitFewuIe6LDaYH
         e2Tg==
X-Forwarded-Encrypted: i=1; AL+hErHPwf9Z2frsvvlaQ9niiKN2NXlIYk6ncg5rwfLQMnKWZp/wadUIzu0CRaMvQsZ7PLZFlfcUTH8TjZaiRioS@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cv8AeW1rrj6BEKFgiU4XRX4dPo03Iv8I+HK7mdyawq76x6NQY
	ujRI1GGzmsXNJgqj1UhZRRHo9UTycpg9+dqtLoKXz5HdnzgvgomQJNjAJJr3h2bgqY32D5zGkmJ
	TomOed9Dx5dqVCNiIh6HrXwCz0bjjy0qnlfDD4JKrDaxO04FB/iZnl/Jn2NSWR3H1XUBL
X-Gm-Gg: AYBFou1fY2raGdE8ziSKHzkHZSxpNK/8m1sbnj4OhxtlisWde7TFcnS/K50SqAGyNYs
	Frf0JTGjMZ3CpHmGqTj7Gz+Z+j78PTmNewYIXf6Ak7O92acS6ISEAWe08KqPW6WOLK46v2pOHbz
	3RKVXEnioDhWVqN2Co7LBnNekkxBspSufCWJweynJUBnyg2jStEPvpuhz3FUi6inOWAakTtIhRU
	/k4fshYEl6ROwRlQEXh/3/OeQBYUTxEbQFOtpUJMbNyS9czyyls/BLJL6KizbodEOP79KurFqlo
	ONDOIM9mwoKMMmwMseRIhwVFath0btfnLFW5Da11A4/XmC+Kbks1DykdRjigOSqtuEnyjKHRgeK
	+WTAQhyifT6bqfk6BaQpZXea95DnLeEdMCYhkJgaCqE2C3NOuH06tGUl/lWpn8g3+uQYZwm13s1
	x53ng=
X-Received: by 2002:a05:701b:260d:b0:1b3:90f4:499b with SMTP id a92af1059eb24-1b39fdada84mr1929517c88.0.1794143963074;
        Sun, 08 Nov 2026 05:19:23 -0800 (PST)
X-Received: by 2002:a05:701b:260d:b0:1b3:90f4:499b with SMTP id a92af1059eb24-1b39fdada84mr1929501c88.0.1794143962553;
        Sun, 08 Nov 2026 05:19:22 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:22 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:29 +0530
Subject: [PATCH v2 08/10] arm64: dts: qcom: qdu1000: Add support for TSCSS
 node
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-tscss-v2-8-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX3c50alnVNj1w
 ++RtanSqLhdz/BuwZUpHVzlO6yWK/ZRnuJMCnvwUeS9hhjboLnKserEDMsvTNeiAbnX7LWnZL/z
 jStbPs3viSMQyBuhkgypl+CWL9SdSXE=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af076db cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pCDFdeNEuqTB-y8mxvIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: opdZrThWicHMm1R34YYl6Zd0OcEApLMo
X-Proofpoint-ORIG-GUID: opdZrThWicHMm1R34YYl6Zd0OcEApLMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX4p3wTjzNBcjS
 do8pFUb/toe7+48Mk84HCdM7tEFg8e/V+8xjjvL8IyVPS0N5GiZ/N2PIlGyaWLoytqV7jJjvpUi
 hQnxIQdTAlvyG0XOui+57i0aTxZG4HlmVIqxS71CIesO6znzj3fhHpHxzv0Ph+z3+jbUZFom6YF
 P38qMRjuRj9olUzXGP8mRmm5FOWLlzykaNBztav00ceOW2NW1/ssJWMmtwQaOBGecVAtKBTJxTE
 QGuKIejUzIXKyuv5R/rCeUwxJdYfixd7u5NkKXrOcQF1AA7pfBvS2NoExSgN23h+KRl+h1g7vsX
 qglIUxIJFkCFPkqvkX+o+W/2rJYPRQpHnjgsQzJiG641CecWE8JpcMhptoH5rOkAETpTotELOmy
 7M/O3pFUB2zqLNu180/F0MFjjnQ9D0wEp4j2Ar6hzeuh0aQt/VyJuMF4cFXmZ93Kvs0ebmpicNk
 HWhH29tCvpN+GSXfybQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm QDU1000
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 3a25b5100836..0f4028c41b2f 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -877,6 +877,19 @@ system_noc: interconnect@1640000 {
 			#interconnect-cells = <2>;
 		};
 
+		ptp@1da0000 {
+			compatible = "qcom,qdu1000-tscss";
+			reg = <0x0 0x01da0000 0x0 0x2000>;
+			reg-names = "tsc";
+
+			clocks = <&gcc GCC_TSC_CFG_AHB_CLK>,
+				 <&gcc GCC_TSC_CNTR_CLK>,
+				 <&gcc GCC_TSC_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSC_CNTR_CLK>;
+			assigned-clock-rates = <500000000>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x1f40000 0x0 0x20000>;

-- 
2.34.1

