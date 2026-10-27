Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124527;
	b=43Tyq82cccie5eRDkf2X+ORS050wFcpA/dqPPd6N9b64ac15Vf1HM0gVN3isjTFbbC5V
	 9Caff98yVH0dF6y49bz13DgxX5rgm6xe58/qz3PD2XPVawYrSrDZR3Um+R9dg/OR8U9KQ
	 bXe62xGFLEqsjL3wKgjsvw5+dgdlKEJKIXaCI52OVdxXUMtojJkD3Q/Mo2qYs1lf5ddkZ
	 PXXEo1kZgr4yYd/vYLQ+vI///hqoGaZFATXzJmmEnJRDqy9gJn/uTr/l8YF38Yg1+i12b
	 g3tbAoT8FSy6F1hJB0ggNIZWn3D3yUW8Tg//wGguR17eSKhBkjG+9xs9s0q/FnRtGcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
	b=tVGcMPv2ikQaKisZwZiZYAx5svjXW93B8ErmOrG85CUWvptEtYkTN7HR9djfqhvmjVmh
	 aF3LUFPFU/XoX9Xqf3Swxje3A5z3bhk2YR5HSAGqB0/aFebnZZTLA1cm7RxtawdIA7kDJ
	 wd8dCSqxMwIa2cU3NRfk90rl3F9Ig1+AqYZ5geV2VptUf92XFUCSgQxPFZWBOjKeNBPaw
	 ijpttVUlZf3xwVQc7xNdRe7QPQYjHtocnvdXE5PD4HkUA39xr5ntG6ULHhMTBADoCGosD
	 sd/G/TzvGzu7KSjdjY3HDBUC6LKFkDVFgMI16XELL10/8WjYwmJ1Kue3G3bI+K/NWEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWq9MGrG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5ItdqCO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38A5606A324
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E38A5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWq9MGrG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5ItdqCO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RH03qq2463916
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=; b=MWq9MGrGHekRKODJ
	mzxuqkcgIkzutQUFtO3uw3hWZy5Utu+wADC90/n5qK5ydh7iQczljCYwGVwzZrQr
	G7FCLT4Y/vZqiPWOMlB9hGxwZ/ih8jB5j7TFU5k0jICg9yYtPnu3LJ2kspGQpev4
	wd2TYiWNfzVzDwXVeLySY3QA66DgjtED9tfcETTqZB3BvIBVGYkJ3bVyVhfnAY3+
	/v5BUymfcTvBHzaOG/Bf2daRDB8Mp+AICLxreyvKhtMjBn9H02YCxNYhvUWBCTpM
	6vU2ypOXNazANZ+ZDrBeTA4o0arhOnQyzxZu8khpjLNCw/VqQIoQZ5m6zLOFFiYQ
	sak3hw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5tqn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:08:45 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so292192c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793124525; x=1793729325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
        b=D5ItdqCOtKE0ryGGQAT3M20htsDuAKVnmOZvodn1iCbY97UkNVtAzmwZrM8oFH9Rx7
         j8Ei17sr2u4wqEmdYgmg1sG1fy0uAqYwApD/0bZIVCApu0nwJCEPxyUy6p+M6ZpBoBi8
         /UNpWq2yjUNm385lGdh78ZylSO/6QENpSOodCprdnlUrtyEzfFXfqma/NpA+A5hwqgEA
         DTIGDUHvC9GW+XIShjVGi3yV//H6B+KSKoy7DxFmTyysb3epOc/i5PWud0+++NWfc0nj
         FmgHHFopEumuYLJ5NNuCHsw2C9rlzahSuZ6VRHtClgmXHTTLc4XNDCrERKhkS+C2AmAw
         qTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124525; x=1793729325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
        b=cycT/wQ1P9Slklwo1WndeyL9QDSG1uWtDVD1O7l+GgRcWvQfFV51y3jFg6o0RRHw/L
         TCwdO1Aln7rEJD0PauOB+P3GROZUTrj/hOIRb6VAjNoHgFO1RFFzC/GZSrXNbtWafegZ
         zrEiF8d8cUjUv3y/I+yuuQ1WJ9IkEQ1pz5MNMpDzg/gKGBRP4k4rHZtd+UuzbuF5bd56
         glekIb8G12JaJ858cfQ2VvccpLK/iIS26zTdKbAYOLoBnL7L8K+vNXQvkH8ihssJHNOa
         UgfWq8ATfskvssDr61cg0Eq07SSWFh2VLFtd4+wjEiz4gB+A4/KhWvXlbW0BnEO83Zpo
         rWyw==
X-Forwarded-Encrypted: i=1; AKwUvBzTGOmd89zQlPn1rwOsN52u1mEFFu2VaLLUJGM7Tfvk7J1bhKPcZz83ohZ25KFOCnB+JBpAYWmbt9cr6ioK@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+qxfGgFjZ+WFakl3xU0IB/fPuJ5AhMwQRoK/NrRvMCDNXuyH1
	l/Dt105yN7foGpz/McKbKvpUry1nQkVc0v6eRwT/wmrL4aee+SwNDkLTExi5xwbVH0xpBabr2Hp
	c4tKK3taJ3YW7VsKerC2lGnzJcTA4Nxl9LJDlcmdzemwbSmyij2EUAhVo+pyyBmXVgfvE
X-Gm-Gg: AYBFou2jTXi3+LRURYcKh6TZqEes1xSlOhhFQX96B4L46h6L3MfotuB5MYSMbOma4St
	3ZpXKua+j2ayi+jMAeA18fh36ht8hA2Ltepfvg7394EY6dcOEDcHgaQIRE1xmnCJt67dv9tU482
	jCI+BNNM2IFbFbqDBZEoQBY5iEzXnKz4e3aBFEl/aYf66ZEFtYgDEkO4wPdcN3yMFFClkzGzRZy
	INTypvsxyQreKYi8aZlnAIpoL2fekn+fNQ2dP3yxuI7YeJi7mUEzAQ4mJQa3QLYtzy3XUqhx09Q
	A7eJ6m2pTpct1J0IaebAWHulw8SLY0HN7W1VHdtCsSOCBZ+zu5dRyIOhqzwD7Nz6Z29kjR1C4T2
	xyic8JSzfzIUNvzf68ARGz1x/ZelZQ+qXt2g4yBn7nWq5Ugt0ZJJfwWHlPQrHi+0mNM+gO7xnQQ
	==
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr27691c88.17.1793124524686;
        Tue, 27 Oct 2026 11:08:44 -0700 (PDT)
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr27613c88.17.1793124523711;
        Tue, 27 Oct 2026 11:08:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm39144463c88.9.2026.10.27.11.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:08:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:38:26 +0530
Subject: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
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
Message-Id: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX7ERncTI3pfqX
 eB6FMfYdzZuJpXoqvVbEkhE7EmibRX6E6qTOmSPFlS4cUkDc0kplYpkck14VYRatUWe4E8xmsSF
 ZGSedRSbiRgZcKNbKnfBqMU86cw2+eQ=
X-Proofpoint-ORIG-GUID: A11Yr8AJiaK9ZKDr337HqlHk7LwsZ6_D
X-Proofpoint-GUID: A11Yr8AJiaK9ZKDr337HqlHk7LwsZ6_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXw3IU+N2if6Nw
 GKH68g9c8Uo3O25wrEOrit4dmEmF4vs+HIpoxHqBMrBQ+XDsgMWkpde0wPehZmov/JvOzxfTJh/
 mfDLin/GFqynHaxpj0wKT01AJ9kdM/6ekrwbkoneRadHUu3/M0JcYyzzCAqgLHMKPF0bGhz0Qgq
 GmRwqyzpPX+HTL+v1nAxriCKVAaZ+N4uPQJuafhQ7AZXrs4ynWnEmPrS67JqPl6hUE9y7OS26JZ
 6vLgmENMN2MxLJbiJH3l2G6R+yUCw+9t8T4pLjcjQzsbcI8PG9gyqeB2ZQdZO8vCfXiEo0GwJBr
 oNT9KbIP1fiL6h6EQXXyAbvdFoixARJQkzgRvaf4r2iGAk3DNWmGCNzpIhFoxPdM4IXHV8Qmqof
 /aLr3Z8SPtopTHnJbp61a6nU1lVB1mivTKEKNLnESycq9ynIOU4xmb223xMm4VSZVP+vLNpbKCZ
 Zi1fzvwMOyrZgw0xNiw==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0e8ad cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=crv3FWtqC6gvpUHg9-wA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270072

zonda_pll_adjust_l_val() obtains the integer quotient of the requested
rate and parent rate in quotient, but writes the requested rate to L_VAL
when the fractional alpha value requires rounding.  This programs a
nonsensical integer divider.  For example, a 1.2 GHz rate with a 19.2 MHz
parent requires L = 63, but programs L = 1200000001.

Use quotient when calculating the rounded L value.

A GPT-assisted review reported this issue.

Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
Cc: stable@vger.kernel.org
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5f16bb55343a1d1136eb07f3c050f..9782fb062a58a26daf3e911ad23c5e1d805b0c38 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2271,7 +2271,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
 	quotient = rate;
 	remainder = do_div(quotient, prate);
 
-	*l = rate + (u32)(remainder * 2 >= prate);
+	*l = quotient + (u32)(remainder * 2 >= prate);
 }
 
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.34.1

