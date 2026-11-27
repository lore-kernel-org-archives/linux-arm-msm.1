Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779713;
	b=IhHN5vhG2/y7N6+rdTEQFizg3c+uV3Nld8isaeonRKgi82aT0bSqfRfjAptPxdaIfB9G
	 JGWz5NqetsZnCugG5YCzYZvwJGN69zLMFzY9TgBfhqvr65xTp5JdMa+5FFgt//Qjxq+WH
	 aVube2h0ACqNSwH39UAlM0JdZBDr3KjlFAY0fnypmnHfAA+7rAkL7izwWuRH9fV042Znt
	 HlIh4A4KayODrusmPNeOd1SbDCD2Utv3yHZ7a6b61HFG6da8eUCVN0pTqb7GxmjfP4jnO
	 /y/QuFP7Q+/qxkW3mb0INc0TxVgnjFcoChm0PsA5PBoioVFKOTb4vpY0jSpCaqxRN5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=;
	b=ILcHq9K9DxGVBnzS4x1dr/AiXreHrZF1FC9Em6Fl6gbCNP4dCiVOs0ZL8Oo3DPlDwlsE
	 /cnPVvkkv6ZMRuaoJoneIDhNIA0PT2YBq8nGyFnP4vHb1B+YLf3r3LqSErOJiljFCCIcF
	 Ld0/AJSl1P6Q3yawAfEFxkHNmGi7dlmoPejMpoDWowAP5g46EbtI3qJrL+Ac1kBmAaAoz
	 6r/tBCWdCCVDfr6rx0azARKumIaMrp01PqDSi+toKJnjVDeObp8TpciaLq7LW8AL0fUEL
	 6jsVodQGHyXk8PKUrDadJTz66IuJGW4JjOgE7L8MSvpmaRDYp9LjFzWDCTO6G55f/Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEI6PL0W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ4muU+E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B4B606A6B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B4B606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEI6PL0W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ4muU+E
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAsNPX3610396
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=; b=YEI6PL0WRgRqSSAN
	nSOL2duNrmiw6qAIfg8y+vWyvITyfNtDcPeAg2bf4mTfOdS+YzokLAx7cXfoJViV
	9ZJRP4uwRfFQHI3686ENV2iKwjhq+vh+j7ddQBrgXSCsrTYzwUEaEuOfZ7TIOfUu
	VwNAnvME7KlIOW610SYdAt7V4QUNk+oXDf079UXDwnFdr452ayo6Rkw/hQIm8Xut
	mp5UMy2xAHYOcA60ixiRH6VDFpGzwxDN+i2r8VhPo2Gqt2zDLX5QoohHpoOs7zfj
	fLaYjmB+mZg7IY/AC4OUE7v1/3Wi4OOujW9hvQ4+OOAditConMbVYosdKuzlyQCJ
	vxrxPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh9f0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:41:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961ed97d6so1323686185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779711; x=1796384511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=;
        b=iJ4muU+EVTr/3UFctMn21qV7TcpXv73+u/vfgLFw8wV1Jfh+P5Ko855PPJ5PN0I1nX
         z66+YuuQl9+TaKE7QzFm70+rGEFVit+7XE47yBDVVP7roe1PF/+Jxw3v2mLgNSOxg5RJ
         FC7XZF8LrzaPLdrvl6rE0cBYnDD/Kr616iWDj7E3iseXaJyT9KglclXI5O6k06xnBxbk
         VB48NJK33DppznyjbeUxHmvoVHaRTLbSkxa+5Igwpy9v1eliKKPKvog6U6m9WyHIF+eM
         QiXmr5LdiE5IewEg6IlERgoZ/dfTN1Ptvp0jW7cLHmXHlrwkY8q9wnNdD0PzIH2iQe4n
         QGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779711; x=1796384511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=;
        b=b6ZuSrb7iQQ/OcysSy+cxIokz+CVtv8f/SgzWKX4Wo/Ll8JGF7H/xl6Yc2Jdg9lB9h
         aJRJ9X/9IkbVK2VQAc3aemwege7C7YSoTxQ3x9CUg3HZsHCOC1ukqLhAj2fDpv/JU/7A
         bOuI5FqdrSjIVOApGDHVfijvzS1qelchYIZwS1Q/L3aaRGiYjOIIot5CUlu3MymbbI6K
         USn15x491Sf8ApllUftUin4BnsJihYpZ9k1Ngp8QW4j2hFtjWO+cL95JOMewjl30g7hQ
         EzRlCZcTgQPHXyRqEOowkPvK9lo5eUx1NLJjoogUqcGr1ZkA+6QaEj4fHfi86Joh3xPM
         2Ycg==
X-Gm-Message-State: APuU4Z9q7vLkWwIs/QdvRyfoYq/8LhImOp0551vsG1l/FFjYSTVMOnI7
	6R3mbpbKxaL7ey0TumhRByYgjPJfRvZRP8vvlYNbsCkFX8JdDeaU/oAidFqI5TQ1805vt6b23cV
	soXGQ3HpVBJa/KAzK7cOcFuqzpv1XBdlbUc2hycBt8+zO1MKZidgeabNIJE0HtHS6GZd1
X-Gm-Gg: AZFdTZc4LzBriZGrUeww8HDewjsy6jOTJZ/y7+CpQf7KtTLDWe11RLHgSPprGE5acZl
	sCU5sb1gbSTnlUD9+SKfNT35DtjLpozBGv57JTT9DaMtLHqxRHPHjlsOkPOuhH9SrmANfuAlcvB
	ymPVnUnXRp/fLuHUSSkU67EE3Kj6k4RKodByr8TqpsXWDioIDCT51SU1sMy5Mh/alPkxW9rbbhZ
	mjDItyR1NbMLU1W330LA0ah9Nxu+ADk3TyCS95JYBg2WS6J4q/mskIVfRP5xG2+MoSA7nBjw1UU
	lQJgNV7m2LSNAABsxiR1EUECTOBtnCOHy9S/0xhqSd6Mluc1T68PE6eDlxCNJmp3dG0nbzcI3Lx
	ZbmfBt3e/TPvZO8/0Sd1LQciPIKjCF4MUU2YyJa9YO2ZW2WcyOaDRLeskXhsWyHUk3BsGfZjpwx
	Eq/uvzjD/ChqUTTgLVHu+yhH/wwXArfbkqYjhWOK+CtPei2lifU5/qhMZXdt5B0S8=
X-Received: by 2002:a05:620a:2585:b0:949:7058:dbcb with SMTP id af79cd13be357-949b35723b2mr4487217385a.14.1795779711359;
        Fri, 27 Nov 2026 03:41:51 -0800 (PST)
X-Received: by 2002:a05:620a:2585:b0:949:7058:dbcb with SMTP id af79cd13be357-949b35723b2mr4487214085a.14.1795779710945;
        Fri, 27 Nov 2026 03:41:50 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:35 +0100
Subject: [PATCH 6/6] clk: qcom: rpmh: add RPMh clocks for Seca
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
Message-Id: <20261127-seca-clocks-v1-6-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=srAZ71NXEA0IeXVxC8c9c3eQfWsuz9Tj4jyzkaequpA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxxSP0JWM2StVqCxtvfPFlaMOs/L2o/OlqMZ
 mR/x8oJVqmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscQAKCRAFnS7L/zaE
 w9ZQEAC4Gvk2dIigG7Dz4jzmH0Uv6hw1GzUWCpyE9glv2ip51Q9rbPVxi0q5zVO4znmxCFRVon6
 LM/BxU+gSXqWWKtoMWDFDA/nwiWmyJAMZ3f4+H2gNXgY30E/6dGZI/j7/e9wdq/NjRRiXbNvCC/
 FYBfr4OO1Wz18wLZXNKUwGKNoPk2knWpaditAWjt3f6xMf9putbf4nnLzOQZffy7NcA3Qs5rN21
 O3AexhbML21qmDcsvp2HPpwGAPEbgkT4TuQJJWWfy4Lx5iW3YGW0M3TT2FvUFbTwRJLOlb63nTH
 Ds/inYG5oozQLrm0aY8JYZ6naD4iQwDlgLz/WhRUlVFgqF2Ri+uCZk4vVboeAuheE1xj9lIeFWu
 60se39Hr010mwsf3Hej/s9mbhCatTnyhQE0SKUPeF3VwbZSsbH8uJLkdqOpbYRzceefH3xXcKyE
 dm1gjlguio3Nr48khgIRUKxzv/TSK+LBN8pyUwMlRdKBKG8ZNvOIZtyUWlu1hxO6xuXFhMBZSxF
 rl1srOqaaWcRN46yFPYWwNX9w01sniQRfPeNEcYTUnlBm/NDkNzkbs0ZlpZ2iQw/EaWs9N/nc8U
 EAAshUn/eVD8UFo01MemAv4SemoJl/laGIqOd+iLRYyi/+qt464sz2QcQzo2S/hVnDawtYhXzpr
 g9KsRA3AihjvZIg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX/p1POwk+c7OU
 kjBnL81xNLQOL3n1i1WvxoCJKp9exfPCCgKDl2INKUJaNpebujUSKn5himt7F6apiLhIcHJ8o6V
 thZ7FgAEPM0r+8P3V6AQE/I3/090LR02S25+NLL2iB4Z2b6BD7J2OxsbM+cFKszmTDp5YnoTSld
 eEKY9F+TSkNQHoSn9xxHKUVjtoHQw0raCqlp5XYM25l/YxE45HePzJEvt3fTdc684WuDAqdmTdG
 lNJBrlW2ApKo67o7/REa98wMIGJDLbP0Wuln6Qnp6zd31KDS8YPdlS0P6t6G2WuZuLxA5HumFmR
 1xvyTBPlNECp9yDlmXrwPG5G0RJ0QNwpKBUNEIgGEjCy3daI2eOf/b7RWszaoIpgwOGduV1sKNy
 nYDfjDnjnJIEwoAsw3ljq0mBCI9zOByh1HUYZ7LYFvm91qFTDZCor0pnDZEG3XhgT++k/P0rZHm
 sILGD+bac4B0PxWmu5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX6a1ZFYCKPmGK
 U+K2+0Kv4Oj9kzeoIuq2UxTprSMEcDtPytI/N2xD+QpdNMwhU8ep5lioh6fpXObTuzs79JRT3Ak
 BmFPRVYlI+wsLwi1HbVZS1gUScgwhRQ=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b096c80 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=b_YBBtIZcKF_qvpD-3AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: MwznPJ6WZp0QqPYHievCkqp3rJhUE_s9
X-Proofpoint-ORIG-GUID: MwznPJ6WZp0QqPYHievCkqp3rJhUE_s9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270046

Add the RPMh clocks present on the Qualcomm Seca SoC.

Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 68640e5904a6484a37d48124f9d253d15c9602e7..178f39ca3aef8bfffcde2b7065884d1408eb24e1 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -994,6 +994,21 @@ static const struct clk_rpmh_desc clk_rpmh_nord = {
 	.num_clks = ARRAY_SIZE(nord_rpmh_clocks),
 };
 
+static struct clk_hw *seca_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a1.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a1_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a1.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a1_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_seca = {
+	.clks = seca_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(seca_rpmh_clocks),
+};
+
 static struct clk_hw *hawi_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1155,6 +1170,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
 	{ .compatible = "qcom,sdx65-rpmh-clk",  .data = &clk_rpmh_sdx65},
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
+	{ .compatible = "qcom,seca-rpmh-clk", .data = &clk_rpmh_seca},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
 	{ .compatible = "qcom,sm7250-rpmh-clk", .data = &clk_rpmh_sm7250},

-- 
2.47.3

