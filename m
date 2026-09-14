Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C4647F3D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390134; cv=none; b=EDwrsVtOG0xEoyD59OIPq8lGv6e7UGL/s6+Xdi1kxiohFJy4bjKjzmMeCLTwhtTL38qDrqycsYOJPmqkE+rCWKNkWft8npanXe0rqGgLf/YfLDQVfxnp6C3VjF5kLakHAdbLxUelg+Vu0XhKAUcUdPPa6IFzxF5twLzkAcFHY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390134; c=relaxed/simple;
	bh=7uWaiOYG6E0w9tRAZQPw4yJvrzhGulLN3j7SoMA1qvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PO77f16kffAgPkF3+Wc/v2LirFRRUP2mDdHXtLb1ts2BuBjkpqEW4FD12fp6+jHpJ4UN4AKtmjTgDtIIEiwzB93PfITsBCloWvpi/0xoZ3fVacbEgymBqYa8jxPPSvYDuvF0MqpDzE5Kkbl7bVBDSHuJdUsu1yZbhe33/9f+xRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1MuJGJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSPvCRXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1MuJGJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CSPvCRXH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlvuP3860371
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TABm0P3UMKNtQarNWziPpf5uHr62vIw/jx+cW+tqSy0=; b=D1MuJGJ/cAR4k6sH
	FXrmtMp+uFWPfZJ+BlkztBJML1ouqiRv3/RKklF6YGVanx1u+Y8udtrYf6wjEJ1k
	GzLiyOfabZUDt0gVjnRcoAtQt+O95tK0BsjgW8cNBkdL74AzNfAYyehiBidA1PrJ
	OF89Yg7EVYyxX1TZCdBDW/Xeygj/6lngoWTCOHOM0BmTpthcCLERlWvTbuMyLlLZ
	ltEphN7bcqu/EJ7Bx7ttWUV9ynxZb+0bFe86iXcaVb0oEHNM8a10+rlwB/OHhrld
	wmzul3AFAMX3AqQaT6XWoVmr2bmg8BFQps8cgHQCwOwSpRnLh09RMbsjQ33hh0+D
	STpX2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f11c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso577062485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390131; x=1789994931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TABm0P3UMKNtQarNWziPpf5uHr62vIw/jx+cW+tqSy0=;
        b=CSPvCRXH7nQmwolklj/F11a2O8NP6o1Nv5uohcceU7tKMaiMg8c+qZ3C8O8htiAj/6
         5PUXCfcyWBukS9k45d/Pky4tl/syNuzPNnluNaXyq3siCHk7E21LCboG8j+9EZ3b3/OZ
         XXh5ZkAIXiT7smPOG/9WgXeIuU98ZkOiySdPImUNgiNySk0mijokNiCwZZ0XbUlFnW6K
         EEzRnJB9d8P4doqfFomqplPMFrG/k/XSojT/+ltgi8eS5hjW8VoSXV1bnybV9p+0SGHi
         c2D+CiQQSxNQCHxxwpbKdZuKDgJj2mONGHRzoDvhSG76QSKo+XYqkNg7S5tRT1f6RGbu
         YZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390131; x=1789994931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TABm0P3UMKNtQarNWziPpf5uHr62vIw/jx+cW+tqSy0=;
        b=KSmg1KwcoPSKSnbmEkiFIJxEkHyxFMlJ7qrx3w81pjIfPtoQmxCSU+buAA47a1p3pk
         FmKI0hnXug+N8u4XrfpKB7kSe/6qMXvwiv0GhuTcO+brsKgoyu3p6gQ/Q81F08s1itYX
         c9D5ib2/3fLo/phyJdKI75GjDRTXXm+aieYY9mO04njku6zI7AE5NARq/zrWtnXS1vtL
         ri2LARf7FkgQJKFT+JMWJice0jPgjEDV2Lb8iWMJ6H/qOT3XguZB1u0JxLvpz+h+skxF
         B6YEl+2RUsRjZ1rnRUV4VnhJ34UiniCRsIr2BO4Lw8FI7HtqKu+THO5HKJkSbiWrosyi
         F6Zg==
X-Gm-Message-State: AFuF++kjbtSZpmVnZuk92b2LA9L1G6aRwRy9P4cV4A5qFVgPacYwaKs0
	d2IJJPyKQrCFrSTP1Krk7JxS059soXduq1m4whPf+nH5/b/TCNmCUh3isx8SxOa6DRf1p8OC7ij
	uv4jYieME/UhwwaD+FldF8oG7f8sbghL8xU4lIxha2nn084rjaeALNRVae57W9LiiJiF5
X-Gm-Gg: AYBFou0jJkoWsbS16y4YLdsfm60n6SzJZVb/dkOcr0eaU0lJUmai7On+PggR/RHKxlu
	a/vta4UtiA5b5den9zNHLQN49ZBa3sJ2Xmr9lbatFM+QJ2Tuj6joJUkO4Zag3OI1Uyf6sCyTfoV
	h1otWYMoMUYPYiGLJLbBUou7KzFHTTQ8t0iIyHuynkdc/NXdx72maGhJLaM4RmBuZykuFeQFcRH
	zuZEPL/+FPjhDH9RpdrsbqfvkkcYJNq7OVsU+usZIhtOLt6ZphPDWU+GioB7tuHJIxTgXm9+Yfp
	Yg4ptt81eCQG2POY8PAzC+WauiZaYRN2M5mJX4KOlRLIrzEm9zC55QNcNpr7in7eBZ6VddAzw6+
	wSXwTYJxy
X-Received: by 2002:a05:620a:6018:b0:939:a3a0:9a70 with SMTP id af79cd13be357-93a2977b613mr340031885a.18.1789390130577;
        Mon, 14 Sep 2026 05:48:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:a3a0:9a70 with SMTP id af79cd13be357-93a2977b613mr340023585a.18.1789390129961;
        Mon, 14 Sep 2026 05:48:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:17 +0300
Subject: [PATCH v4 18/52] clk: qcom: gcc-qcs8300: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-18-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7uWaiOYG6E0w9tRAZQPw4yJvrzhGulLN3j7SoMA1qvo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zdZsNx/PDW2lCqmpHi0CSNev1YP3XOie01K
 JBWpPDJgz+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs3QAKCRAbX0TJAJUV
 VmeoEACEdRNATcX2Q0MZuUF+S/hD8hQR/a0U1YqC3iIZ9ZdIpkafNdPa7i0QsKobDrT7yGVhjvx
 nz8Ozlmiweta9FSvB2I4OdKAO52nZZSjYUSRPOt5D5+SVog8LXm9zpX3ZgB6tHr7GewppMuM/uF
 RPLOY3ueyiPQT7rrV04X+//NPhorsBJS+u+ajUltnhMVKjeXekbdCvtLfa2UhFmNh8oEKtLzgMF
 5IAQxCYcAZQGv25uZfZDGlw/Cx96mIRPrLGU9Fwd4PtK9ijvCUhE5TSIiHeIizrMo04ehJwOfYk
 poNdmX55Jaa4raKX/Gwa3hKeK5Fv/L8/epZa4wq92fBzN96uilfvnkDkszZy/2tvL8LY99C91m6
 auT9yTX+nV8kDGL+5Bn9A1f9Eg/h/FedY/mcpS9zrXlP18XZgM3pCZoFnf13LGY0R3Z1Sw2tqFI
 DUHR5Y5WwuU7EjD8d7t3a509U+obrQEk6pU2i1R8dvzoiEJeaiqpxqlA9EQriLO7QL4s7qEzF8Y
 ePmAZ1BDdP6reSrv4K9vsbaCXQy2Xc+ggk3MelCFYQbP5V3l8HQSkNtDW8urCN5F0c0EWVtgQu1
 DPM5dfv7besxpveAVkM1k4nNblOgT5TkhbRnOESJGM7P45awutEGGgviUFy3IsnIza+n6w9s+Zg
 vxbe+Sd2mecK4MQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: TL2e5QhOTiOkxG16KWinOCvT5jhpx4dW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXyPyvl/PyAfbO
 Ngx6dw2z5VsmssijHJqplWnKE3p+OzJxEGDWgE35lKgcdJm02tEagrE+m5iLHrEOK1JRypJSGKM
 iRG+AMqw9JtnbzDPE8SqgFdQe0xFEAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXzjK1t6iR9LMj
 UoUyxHgEei6EFukzqcznbouufXMbH0ZdmfNBsU8ecPpwAB72zgJBIKnt+Q+DOaV3VNmSm/ERRvN
 Brs+Z9nMxOLZKWl0m31GyRW0dthOrpBbGKWNq/AszkXKerxlhENDel6SYb83orKhQX0FcjT+7YE
 bd6f8QCNQt0+wNG88upV6BI2PHM7jm5//H/T3ReDA7wcKGDcBntvoj3GWoOMw5kZG03Q9XG42OD
 44BJ0+FDBAIFM6gQTfTaA+WLMNGwFy4TumwilBlHEfaGIrnQpJK1QkxFs3SRHxMcN7K57SCjC7C
 iISL2PyvELVdc3Gq2fJ6ba0qoMu+3VaZEBEn8UTBTBIslgIYUK4Q5HFt0vUPZl1uF54DWWdrtCa
 5WmFPxwsAZQUr7iDhbkAv6IsAaXrTB5ogqVELklhyVoKG++RSHUj9MGcOcTs0a0uEy6R0v0u0K4
 6TAvq6VryXF5GWpi/HA==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7ed33 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TL2e5QhOTiOkxG16KWinOCvT5jhpx4dW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 146b3b5dfead..d04980e4a0bb 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3681,6 +3681,7 @@ static const struct qcom_cc_desc gcc_qcs8300_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qcs8300_resets),
 	.gdscs = gcc_qcs8300_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs8300_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_qcs8300_match_table[] = {

-- 
2.54.0

