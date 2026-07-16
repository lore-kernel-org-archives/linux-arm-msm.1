Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD47A3FA5EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199563; cv=none; b=s/VYMVsdm2uIPOdLG2HwEwI0py11w3Ir09TIazY7oBBJL7m5ZeCkDZZTssIXRD49aSDUsCTuq5plr8qARDLwuzJLfwhBRNWJpCmsBlybr7menLDjbcOcM2QH7RJ/pat6i/4Zk9cXgN+JCpIYX5RE5XSnUlRL5wbs6hR7A/YBkW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199563; c=relaxed/simple;
	bh=OUU7OK9YE9Jfb0AE2YieJ2I4YzAyP6IB1JzP3G2aLvY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PGGUcThZJZuHjr1bfXFlzvJRj/EjX3Ik/lD9tJtf0dn0NtMChl6MQJF8VPjzyTVunwcBb32v8LlacI19MeaXW7GP7uwODfM9Cs35LbGLs5Fv/DbVEA5dcP7GLfspxZJ0ZVqOfTQLdG0RkBn/cof8cFNAsazppy9QlwMB/cMUTs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQEBhhx0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJXUx7Ww; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQEBhhx0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJXUx7Ww"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9sFiw2498420
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PCcxVvvgE0szZTEQzG6Wmp
	gqiH35UZHZuwegW/aLEjg=; b=NQEBhhx0kZ0qkA343cScg2sTCLkehFkUJTpRsf
	QRzI59PSuoawp6YJqlRM8IqVs9Og2OzbM/J8iUMx8EoH4J6Si4Zl2XL65Dxo9nQ/
	t2U1nYbKs3c5HKfVe/K0Tf1cINeU6D33j6ydH5uupGaan8Bk88f/7OMse/h9+rMc
	4ce8b5Q6/B4Pp3S56Ah7ExgwUYJS3ptRl71lXlYsRvtsfDNS6hjUo9T71ME4Oqla
	di1DZs16cQulz5nvIAF09WiZsZzYKQMLv+m0830smYTRPBCq+cGQFBc1bOM01HmW
	Th2zfRfBbt2pfm4+ctm87TdKTAyOQHToWSGxufupJA2nanEA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu108udn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:59:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so85920905ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 03:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784199560; x=1784804360; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PCcxVvvgE0szZTEQzG6WmpgqiH35UZHZuwegW/aLEjg=;
        b=IJXUx7Wwcl76e7Hhb0HF6/zMyxA4/EPeIZ8qfTPdqoZgfMlCq7xCgUp4IhAfvDuVq0
         VfJ5R5Evmfqprlv3UQObp3ydvJ6R24mGap6oQokDpwJTOCL8Mm4e9HXnDk99JuJLWn8n
         uHluXp5ohGnUrV/8K+Fn2dUrfcrncV0To0YotikqIjDY+LCjGgRTxN1sAHldD3acqhJZ
         hfn83dCqF7avvrHYsyBJXS1rn8rS/zDGv0Defts94/rBb+fgcPMmR20/rZJ898nrzY4Y
         A6uEp5aMmGDYTc/vakmqpl+k+IuxF7aXuTy0mNPDhH93SfmwIOETdaq6A1iB9IyFB63c
         w5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199560; x=1784804360;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PCcxVvvgE0szZTEQzG6WmpgqiH35UZHZuwegW/aLEjg=;
        b=XxbSovHjTQNeywKZiBxY+5eteIgUMaT7U9Y6LRMar/RH5dGRDRRc/uzJ4UNbvaaLY2
         fboIw3oBbhjpI/jH2wlyT6vCFTuRKcIxMtdY9KCLRXIMT5zpNzIMgqNgMNIm77w3thaH
         G1TYNJESd+jSMnrmt4GLmQGG/NZXtnPvn6fhIKWXpwnCtD/peqQ3p7aH2UhIjMKlvK7j
         He4tlRJNO1dNz6P/Lp+ceqsceGmBWpEt3/Aip0JERI6lXSWOCVz0LLn6xzPB04ZFXQMt
         4SBBdqSeRGuO4wrRAvBN7wo6SIEaVT5JVKJ39McXG8emX+VoWXDq1XlNQiZF9vhH8obw
         woVg==
X-Forwarded-Encrypted: i=1; AHgh+RoAxXJsnKO7mSbVnFNCxuQYOpeJlA70fg6xCV215uoH/C9963TLZ60e+zEvFRoiJmUJawR8OXOr10M84Jdf@vger.kernel.org
X-Gm-Message-State: AOJu0YzlWXGZQT6u8iGfyVoZAW0cs6wJvnuSeElUJamVOjQsT8vaRKz0
	5HHfxyoKIqn4dy1JfuMXAcAlBC4MhF/iTIenYR5TGOhbJb6Uy/t7y++rEezE3BlZdOQ9gItstRi
	Kfw4hmSA+vgaf4UtDSdaVGa+5F+W/lLitvqvp8NGQZ7BEy1p3snl4EItV6aGqoMjpxmFG
X-Gm-Gg: AfdE7ckoBMqCqIokEe6Og7ymZ8ztha/6upO2TuG4Hvr6QyjUKH3igH1lcJZApz0dZeI
	hOjNHGjIroGessTSSp1/syC7ABhTHkruDCxrabNk2/nJe/HFZnpV/3bgKYD9/h6Bi9TbQKL/wZi
	25i/UbDFMK6P0mcdWS8vbaywhOMYtH8oKWG2K6E5ZJNzO2Tjs3S7gAmFxA2d0aht/M0liRk2ZQF
	thzhzAuhLOmv3y9+X6gj3qxmFfpe0ptHCjDWc1npQymywo2XhAYvbQwnG3C1Zcz83fKMNzwyFIZ
	9Bpeoi20Go2sCsFDXSQ2c4lc1H/3buX+Fz/zj6rHzzHR2P3R2TJs909ZoLCmWJik180Hy2ZDzVi
	mj6Ft2VEsIH0GQ9Bq5RSmDO0U
X-Received: by 2002:a05:6a20:6a0d:b0:3c3:9cf4:a982 with SMTP id adf61e73a8af0-3c39cf4ac17mr187300637.37.1784199559800;
        Thu, 16 Jul 2026 03:59:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0d:b0:3c3:9cf4:a982 with SMTP id adf61e73a8af0-3c39cf4ac17mr187268637.37.1784199559329;
        Thu, 16 Jul 2026 03:59:19 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432e848sm11175385c88.9.2026.07.16.03.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:59:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: nord: fix PHY pipe clock halt check and mux
 ops
Date: Thu, 16 Jul 2026 16:29:10 +0530
Message-Id: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH65WGoC/x3LWwqAIBBG4a3EPDegkgZtJXro8ltDYaIQQbT3p
 MePw3koIwkyddVDCZdkOUOBriuatzGsYFmKySjjVKsdTw2HMy0cJYLnY2cvNzLDGA3beuuUojL
 HhD+Utx/e9wMOKnhVaAAAAA==
X-Change-ID: 20260716-b4-nord-pipe-clk-fixes-e221e57f5600
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: nkzzAVUX5D0i5Wbz4boTnzPW_vsu323k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfXyaL7fpvmnMf3
 YXXA5z++EWEYoe16VAlqFHDW4OUW+lpqdKw9TlVMPN1kTKbtwTpQv4BECgaa9Cw3HBPjX+xFZkx
 CHRiFBJHnp/rvZSQh7NbC75TGeXuOZsFmwCy/OpQH+RNISaxen55X3HzHWK9UC2kyBBsqM2HwqP
 9jtVZqGQgUOfOyC2oJ6GgThoxbcm+jQ6YRV5KAJrvPFCKhTh5Vbm7Y49Trwv9DAIRebdGgJnnnb
 IE/ompnsVVjVfe+Vq5azTNQ6moalN7fSfvGr4O97OPPTKS7GwrzJwMzYHmaBARJp0KTVyX0noMc
 N8x+BbqMTGsC6lD76sfRvX+3r6MNyrz2KQL9WDI84cydVBJwwfVGIWvEI9ToOpSR8H09XvRbyni
 miQkF+SBxy9HG5LoCc6bCVrJnBfO574iYkGNc8aI9KAZvg05dbeh3iLg2nhciTPtEK97G7ZE4di
 GYGTfwhEwUw5JLCWg2A==
X-Proofpoint-GUID: nkzzAVUX5D0i5Wbz4boTnzPW_vsu323k
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a58b988 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bJPzdAgbT_gtugSychwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfX7ROjKmOHG5w8
 DoD+Rb/fhT/yfLJVsb/YcCYy0YtTzIxgXUeCruG+KcJf6hc04ZYRItxA78XIbRd8Big8v7xI6wj
 OQIvxTiF+kmXY5hjtOMrECFjmqzotAM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160112

Fix two PHY pipe clock issues in the Nord GCC/NE_GCC drivers: the
PCIe and USB3 pipe clock branches poll BRANCH_HALT_VOTED, which can
spuriously time out since the halt bit doesn't toggle reliably while
the PHY is down. The USB3 pipe clock source muxes use
clk_regmap_mux_closest_ops, which doesn't park on the reference clock
when disabled. Switch the branches to BRANCH_HALT_SKIP and convert
the muxes to clk_regmap_phy_mux_ops, matching existing conventions
elsewhere in the Qualcomm clock drivers.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      clk: qcom: nord: use BRANCH_HALT_SKIP for PHY pipe clocks
      clk: qcom: negcc-nord: use clk_regmap_phy_mux for USB3 pipe clock srcs

 drivers/clk/qcom/gcc-nord.c   |  8 +++----
 drivers/clk/qcom/negcc-nord.c | 53 ++++++++++++-------------------------------
 2 files changed, 18 insertions(+), 43 deletions(-)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-b4-nord-pipe-clk-fixes-e221e57f5600

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

