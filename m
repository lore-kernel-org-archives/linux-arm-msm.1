Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699238;
	b=WAE64ayGEI/eWmHdpgBSOcR9jy5UO5EQ6DN/2VcGsxlbXSqWoQOwmgSP39DabqCw3o6J
	 WXR14RFrnCW86bNbHZY44i4SeJut5JuVDg3oNJ91Y27OeHqFfC5pqaOfKfVB7nPoVuCKX
	 o7QkVCUBCbW6xSfwvHhwMqIk5ODNAcLxvyIMOx4956IBFs4xJ/+Zbze5W4b7iLzn0dsef
	 3P0T5EMJV91iZ9A/UE5WzRHUBuJWuMmWykxWNRUhxy/2i5eNqrozIjq/AL93BEhAaatol
	 6N5bni/hHwWJq22Ot8fGoBlXbqOQatb2KhZjb1sqdyCPM00L2LzluZlq3436B9uEH4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0n0HkzJNtdQjaMLzn2VLaFHeZeyP5LsybYLDB5MJ+Gw=;
	b=q1Ms3uPW8MJKg0g1RnCRqmJZ81tyT281rxQ0kODVBlT9ccSl04h6CkErhdDOnjC1B/aW
	 64F+m3Q3vCzBXI82q5j7mOgfBZc60kc2ehJiyFvJ9HJVAWt/LxwiF9XZjpv4I9Wn6zwMr
	 4EcIT4rWMbJcpH3vXTC/rpQdAsqxququXQDpO8sZoWR13lMXHOqbfhiUn3GI0odZjuEOO
	 hvPWt1+7JZ8EAHMACNOTVPKmzjvBBCFt+PCDkVzchiBww6EwFCngVz2Nzn2Ez7V045oK2
	 Cg4GkRDU/lSA2IQpoIjOXdiqcqPOTQSdbx956Ezf5JtcMOGMl9LSiYmRIBnPiGIITKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnNNbhwT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jONS5vnE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E5606D827
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E0E5606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnNNbhwT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jONS5vnE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38A4ZE4002807
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0n0HkzJNtdQjaMLzn2VLaF
	HeZeyP5LsybYLDB5MJ+Gw=; b=GnNNbhwTN83iXiav3DX1K5/quVWHfT4D2wx1kf
	Uh1ZktXs2MF1/xeuTrRQVXzlht+LfOY7OZyYFctJCaD3j5AbGentLrNqYKWrfJF0
	Lu5ZUxIu5DOLd4KIN59UeUOVum+scx9YYyT+SuP0ad5ekY/mzqKO14wfdO6mbRwl
	Gz7n9wNDtOaxat16zS+UJhzlxQE4mY/BYi9UlgWSFDoOPS1cKUF3/5cDXVC2VRVA
	Cylv0lzMsNOVo/Q9KgUu8sJIuY8p2TsNGE4H/v4BDPFIcj+MrmHQ+Jz6OBetgrBR
	16TjekVmnGMX5CB+TRKZctpw0124hRzCB/CFzYdLRYMxiFTA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ek38r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:47:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9905fc56b60so332861241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699236; x=1794304036; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0n0HkzJNtdQjaMLzn2VLaFHeZeyP5LsybYLDB5MJ+Gw=;
        b=jONS5vnEp9hUF1cE56MVN33U/Q6k+9zuYs5++dT4IKO7X0w9n9hl+TGTrJi8Mn3nar
         YsnPMhCMqB1jhye4sqjLLH32Uc+G3pmOOtvAihiGo3XP/gifCFIhGpkotYuq3/CDA61A
         hPqogvLMvnhc//LkIhH9Os2zh8+IsjvTbQmo4chvypvd0GXcJ2Cv9flFPO2PPwUrR4Gt
         4wf9ZRiIlY2ccF20CF4oq23atQyipZkoY70Uaw3xYzMP/7wY7YWIB6vYXzw8s610KTa5
         J1qidPgV7bgaOAQZLOYuOa8/xaXBNZF1zX6UIupBTTRz8qRfS4Qosy5B7I+c3dKF+nc/
         aylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699236; x=1794304036;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0n0HkzJNtdQjaMLzn2VLaFHeZeyP5LsybYLDB5MJ+Gw=;
        b=yQq+yBFTZ6mmfw9VSm91lPoaoUGMPtGtUUcvXdiMYQlvGcYrYIJfnmvzFRyn+tkPnK
         zx3/ySG20fzwuclO700TvPNZDqbVcNkJ5E83zBdHs9Btxt8t/4/xmr7hc28zRNYThnCQ
         WSISekjsL6uGenrAwgNao9f+TJIRRzCjaOyNNsiFsqj6QsLMKHZkCleEPgMPZ3DBl5OG
         98g1wxmS63DHv5qjiHEGBwMq5qWTu1KlQ/rsnycg8d709WN/C9C0UsCI7VkMClt9k/jV
         c1VdRlqgZsi3XCqW/3G41+s73luEhojWMTXIrlvDhZKNBAu6wk/bb2FvdAGN58HMvXf6
         FRWg==
X-Forwarded-Encrypted: i=1; AKwUvBz8BdH3LkmseuG9kxv14NKOlojgImJKWHc9AGqdmGzck15LsWiReuMNh84IyHrkF4PYGXtCpwxcuCjheWhr@vger.kernel.org
X-Gm-Message-State: APuU4Z/vGBaX7Sliw1EbSOhFKyhEsCShSOZHsSPssfUx3JXvPowUFHca
	fHSQ8CBAIcLrNxBc0n/h3Jt798azAOBzeh1oSaBT7O1TKX4lNzbrgdJPBOeIbMtN8uzPzKZWoO1
	+l32LsQNlfe2NqGxgtD9e+wXZUS+u3fYSRpZtKUOzzhcewQ88oJwit42lr6Hu/tl0wQXQ
X-Gm-Gg: AYBFou26UlqijCsqqYvsOGhQBWmQw3apyn3vC3nvampW2iCYduUis0/rvw/0RpZajcT
	JASqyEa8dyVKCQP6u1zEdcOqQJg0CWupidNvZqu2+jtCvnxleIouvVXHEeH18KbqQ2sEUh7Gpzw
	70hmYuHAiXQDn+GTGPYD5zjQHZ7cbVNCmz2BCyuYG/N/XeSrzHY8LyX7x3isaNpe1xIl8JEXbt2
	a25q3o3evZOWObEVmIy4TFLo1+l7ruzIvGV1x0ZDPMy5LMlCJ7vFfuUdodlVkAwJu9iUU1OGBMa
	211wm6RGPFROtgMzLOzx8cqUPxDtGImjazasqrY7oZZNIemebh4djDknb7qiiiaZTnIKTvDg4cs
	yv0gUpQ6ubuKrvMidsybKqKapIISp/exfOHeZmFSlKvze1jHjiOkCAOBSrw==
X-Received: by 2002:a05:6102:e07:b0:7b3:9d2e:c1a2 with SMTP id ada2fe7eead31-7d0543af600mr4596924137.42.1793699235982;
        Tue, 03 Nov 2026 01:47:15 -0800 (PST)
X-Received: by 2002:a05:6102:e07:b0:7b3:9d2e:c1a2 with SMTP id ada2fe7eead31-7d0543af600mr4596907137.42.1793699235236;
        Tue, 03 Nov 2026 01:47:15 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm24018477f8f.49.2026.11.03.01.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:47:14 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 11:47:12 +0200
Subject: [PATCH RFT] clk: qcom: clk-alpha-pll: Fix the rate of Zonda PLLs
 with a negative alpha
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
Message-Id: <20261103-clk-qcom-zonda-signed-alpha-v1-1-31559b3b872f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ+t6WoC/yXMMQ7CMAxA0atUnrHUpKiKOAAHQGwVg0lMayhJi
 QEhqt6dAOP/w5tBOQsrbKoZMj9FJcUSZlWBHyj2jBJKg61ta0xt0Y8XvPl0xXeKgVCljxyQxmk
 gbBq3bsm44CxBEabMJ3n99A522z0c/lMfxzP7+9eFZfkAEGXSDIQAAAA=
X-Change-ID: 20261102-clk-qcom-zonda-signed-alpha-33846a18d82a
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3378;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NGjlwTJr3xwIbJKj95ykRuhiH5GJEDrsyfPMCsr8X3E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6a2gjBxk7B7wjkjrGxO/bK1L4lQ+jBG2DyEZu
 eXrsveEt+KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaumtoAAKCRAbX0TJAJUV
 VnnRD/9lIFtvtsyDSD/kQEokY+dGlPYj2iqAVCVKzzr617qc4qDQOm03wA/LZgfQBbl6+giZ43J
 fCHjSSBjsNN2o9VexxUrGBJzay6vKXgTlKpTCHI6eLhcnCU+Iv3F4PExEi8J1Xfrw6ky2MZHPz7
 K8ioprMG16ZAZU7+GHXlIPwDL7XLbwCrYhFjrQJxIHlTskOIs/E8scQYyO+cT5SF+IHbHV0m4wj
 niQ8ppNimue/p/J3pz5xqSbtOcbFi38p0EMm0YcVxChfrYApaasq8jBO0+yer1MGKBnTs3gms09
 fQw3Hdbw+JUyKrTD1OCA8IhWin5x3wV99xgYX3n/0GX+6n9LhqyYTibrdC9IfyVKhiuCG68AWzF
 53M+m3AB4QJzZT7yWPvKnhPAJ+wWKS06G1gVh4dZTh1bJa8790ZigcIYVRrlh6zfXRqezEDxx0x
 yNljpW4/slcUpB3i4evioPFyZW8vYe0uNyxScnmRf5vZP9ikCchGi6S9azdBoRgTrX1GO1tGxnY
 KAUn5g9D40mTF+SOevLulS0/y6SJQLG9Rw+b6lYsyu3IKganh4aAIeJG70+RWistYFRoPNfeSfC
 btGCmWebNhbPOb3qvM4XJr7/j+M+l581E10K/VbhbBm/rTeC37pbI6RnMnn8KNxDGPryCTAspHc
 UViKTt4mchLGogA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX/PCfhymRUN/r
 4VsMBFhbQ6DLn37uR4t92BFmK39mB0KcOeR8zy/ivaHU3owBNIdjYmgHtOG66V+skqJDwUoykpN
 vNZbLC/oHWPZPL/XR/TIf52EOdIFiTFYrVA8YyBC/jCsAIuLG7GoCu+4lHAXb8XUkRH6o3w6zk/
 1QMNQjYyHZ17Iieg7HMDjNi9FGgVNCP7ErqhrwTg26jYK+oVxLbFXJJfH18fzib2RB9vtW92P2c
 zwssNaQuIJJqolTfUYSsiJzqlcHZ963vea2EqIn2Wt+qpYpPXo5plVzVGY5SCPocgRKi7MXRkin
 hkjkd03LMLMG0325gpoOiR1RmisSCJWp0+Cgamr0Y9Uz+1Hrgv3Hj7ZuqDmS9jHWukBA8GoyPPY
 ZUGkoHs7j60YcJMD1p/Y68KSh16L4AauZqkuogRhEnOiF6WFvEY2uFd5NzQmI10atiiVMmUJtvb
 jwXvEqGTG9ryOvewVdg==
X-Proofpoint-ORIG-GUID: G72W2yzNEhnIkxtZ3g8DUotIvwcK-fre
X-Proofpoint-GUID: G72W2yzNEhnIkxtZ3g8DUotIvwcK-fre
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9ada5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HIFZfxgX9pW5VpyTZ0YA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX1lpHfme6HlQD
 Tc6kHhh33PbMbYHiJT+a2xJgcbWII6b+iQ93GYqDaY7J2el0DXi2tQhiP2wTQwqTjAnbp02iqa9
 2p4i0WuNByVAEonY64Kbq5AIdqh4XvI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038

The alpha value of the Zonda and Regera PLLs is a signed fraction.
clk_zonda_pll_set_rate() accounts for that by programming L one higher
whenever the alpha value has its MSB set, but both PLL types use
clk_trion_pll_recalc_rate(), which takes the alpha value as unsigned.
For such a configuration, the rate reported to the clock framework, and
so to all the children of the PLL, is higher than the actual one by the
parent rate.

Add a recalc_rate operation for these PLLs that takes the sign of the
alpha value into account.

Fixes: f21b6bfecc27 ("clk: qcom: clk-alpha-pll: add support for zonda pll")
Fixes: 0c31f6a3ab7f ("clk: qcom: clk-alpha-pll: Add support for Regera PLL ops")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-17339f1f-7afb-40a5-96cd-70361917e0f2
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Tested on the X1E80100 CRD, which boots without new warnings, but does
not exercise this change: the registers of gpu_cc_pll0 read as zero
while the GX domain is off, so its rate is reported as 0 either way.

Prepared with help from an LLM-based assistant.
---
 drivers/clk/qcom/clk-alpha-pll.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5..59fe8fde81c2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2274,6 +2274,32 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
 	*l = rate + (u32)(remainder * 2 >= prate);
 }
 
+static unsigned long
+clk_zonda_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l, frac, alpha_width = pll_alpha_width(pll);
+
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	if (regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac))
+		return 0;
+
+	/*
+	 * The alpha value is signed, so with its MSB set, it is a negative
+	 * fraction and L is one more than the integer part of the multiplier.
+	 * See zonda_pll_adjust_l_val().
+	 */
+	if (frac & PLL_ALPHA_MSB) {
+		if (!l)
+			return 0;
+		l--;
+	}
+
+	return alpha_pll_calc_rate(parent_rate, l, frac, alpha_width);
+}
+
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long prate)
 {
@@ -2322,7 +2348,7 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 	.enable = clk_zonda_pll_enable,
 	.disable = clk_zonda_pll_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
-	.recalc_rate = clk_trion_pll_recalc_rate,
+	.recalc_rate = clk_zonda_pll_recalc_rate,
 	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_zonda_pll_set_rate,
 };
@@ -2998,7 +3024,7 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
 	.enable = clk_zonda_pll_enable,
 	.disable = clk_zonda_pll_disable,
 	.is_enabled = clk_alpha_pll_is_enabled,
-	.recalc_rate = clk_trion_pll_recalc_rate,
+	.recalc_rate = clk_zonda_pll_recalc_rate,
 	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_zonda_pll_set_rate,
 };

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261102-clk-qcom-zonda-signed-alpha-33846a18d82a

Best regards,
--  

Abel

