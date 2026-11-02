Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616152;
	b=WPmtGCl6gtzpPdvOt+0ljzDLo6JmzfYMZCuKhY/gBGh6gRcQs32H0SC8KIhry98g7X5C
	 rdPVKrlQs/LT7zbm7eb9zOx1M7mPCHL3MYv+RGGDsZUAXbiDGWniXA+VXVJj/V+rvIkaV
	 dafi/dXAUc4FYo4oRgoab3vNc9AZKBCmS8oZpVBTWVbXCnqD64zIGLZGTSTLc5752ZKJ9
	 B8biWwAhGLlZoh1n595jmnZU5JNkNbQXachzgdLUrEwdcGPl8gJAOV2p9+qqif9uoxf9m
	 c24NmWMPVGE+GgNLtxMFPlwc09zxIiSNNc8mAR75/vw0wj/xJWTtaSkvnCuVZD3EG9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
	b=XVu8/5ebTTMoqWmonojqMl5DWcW+Zhw6f8EN/NwcffdNX107vwR6P/tvsuvMRzbUehSg
	 OmQnXS/+l4b1UjyXmR93qXOzUA1iAzEe7x6eMoJ3kIYj0gL+OiunUkfYws79cxFJHAFfD
	 gEzuX+LVajq6P/Mpgg5YFdALp86UIlqVMvjFBJwnf3LsNP1Q5R7JnC+4WtkrwSy36TMLV
	 yJjo6ejb07nPosv75Z2Hh0hR23R0wUNmxbN8ZNFrUZqZC3hWNET8yzpWQvpE1oUIIvq54
	 bkQ0MeYN1itN9S7+FC/edYSQY9auYOdn+CO9zNohDsVlv1gnwsz/4KXwLgbhImIEXKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="feLuO0l/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRPg2O75;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B219760A3823
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B219760A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=feLuO0l/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRPg2O75
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQ423440395
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=; b=feLuO0l/CT2ghoed
	uWCaqsIZ2w3ODay8cdCXrpqJJAlh3aK0fZ6dgD0motSnF7FBmwAUNfcI8j2jNpoH
	wZL2zQ48H40pkLtHNzjSuaZx9hVzE3e2cUi87n0AdL/iX/lfYvixOAgtIkm9toqv
	OIuid24eBWkfw7rBeyamFIVa2+tmGVWBBPKBB2bBxWzV/sJMcKZ0DSb6oF2AB7tl
	TGkWkB/IsAd4UmrEJdONMYIoAv4ZSxwQAYg+ky/QN/uWE0prZj23nG7I12TywpuX
	hR+3Q/I3JbsE79i7GV7+/TTzdclL9Ccz9yQQEtIdrX3Rja2f2T7syKYUic1sYfNI
	/qi0kg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201xfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:42:30 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-85c1135c289so2012571a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616150; x=1794220950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
        b=DRPg2O75oPKSxOXYQNbqEtY/HvWI4vPlEEzIw/cRp2iimgyHDxfebX62QPSais2HUg
         abMcx2aDq3DpEl3LZG/sY3btJIwMUDx5ZgIpjpukEbd59jy/qk4BuBmEA40LxQpxTc6F
         PWwucg0SDTR3RpJbjhD8/F2eEkeCp4CuRMnKp1DytBh1xGn5nWNl3BgRDt+Q1XEbGCvp
         xXr1F0be9KloMEtWNbS0FBsA9I/MK33hmElQCvKHgJ3n3IUwDIe0Zr+BKNZQqhXBW2zu
         biKWtTjz4nOj82KwlMHEJqE+jXw5F2FW5mVPpWknZxxl/00OpctP5okPmVYTTq3uQP+i
         TxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616150; x=1794220950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
        b=Jt5TZm1sq91FEtsahr1tKQX7l76xqr/I6Gh4ZRbUiN1AcLcG6GFQKhUq/dLMc1yMRC
         kJGG07XToyeAB8tujYh6CpjUe95wg79Lhjvr0K/9AacBViqpoXMjyuAlTYrp/GIpH+rd
         4zUZDNsfFIGE4vQi+zXMmm7YUd7To4AdXCaRSDC1GnJdx2qMb5SfoHddYgBKhNxhWzWK
         nNx1XoDEaMqNQH7RPB/rRKX/di0rUWsoMt8KuLf1mioIHm5CnP9dpBGVYcNM5cvmeGd7
         tfX/C88x4039icCx+PcDhOe+2B3e9vjoEB+wrRzjuHeKC7whvwXOPweEi+F74/x7PdUU
         Aj4w==
X-Forwarded-Encrypted: i=1; AKwUvBzqh9PPkE4hzc4hzEbka1KkjZ8MzP3ECp9tfdH0k3/RQsph4R0l5uxbej4OuocXendD3gE8+kwem0H6ISea@vger.kernel.org
X-Gm-Message-State: AFq9FYKDk0mRhNgCyF7vHmMQzHNLtmFvuDWoJcQSfEGv4NRiUhs3fb7G
	v4uSX1nj/+gzB2CIxfo3AqjgrEuSdpaYUAzSslYfKyAh2MgsjGTOMkbfjBKe3u/KAf25FiTPnel
	WWIbY0GwSEIAfAxAmFFW3zXzesXwW7X2XBYer/FkRw8M9wsp0JRJcnFv+iQVBsVuwlgMVA5rxXz
	p+Db4=
X-Gm-Gg: AYBFou19d65aCVeJ9xVsRHp9ibPLaK+nkDyn+WtDOMqVBtbhFGpECo1Yc869bvpZD3C
	TfrjKcqWbDk+W1epxyjUoU7bnOef8zA8w3sQDVnd9p87+zmbP5vNv3KQ20a5Tv2xiWqGQIdAMSH
	0Ev7g54uvUUIonm8aPPWHVRYgMSOkSSzHoL4XZIFyIjeYMJdWTPdhrA5uMjCqVVb8DI4JfjsZV8
	+bxef94naN0QCUVJZurcMlMyPtvVDTJ0KPX6BUNayAspZCAQnGvGhB5gMG8aixfdjd4wbatOdJQ
	nedapij6Y+fuoZZUwumRyAth2soog7TgnAt2N2PIIxj0nm+aiwU04TQx6aJqdN8soTGWcjfOI30
	y4E1DTjmWGv1v1UUDI3LFuFDd8h3tyjCmD/LiPEetqIvrbetG2VkvU85BJ0icFWjdJIVEs8it84
	Sifp1E6ZGexdznwMOY+UrwGs611tvxSjDVmu/t+YCc0qd28cGEJhv8aX1Y/Ig=
X-Received: by 2002:a05:6809:1c:20b0:4fa:8d48:3a6a with SMTP id 5614622812f47-5640dc2a78bmr4290376b6e.18.1793616149930;
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
X-Received: by 2002:a05:6809:1c:20b0:4fa:8d48:3a6a with SMTP id 5614622812f47-5640dc2a78bmr4290357b6e.18.1793616149487;
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:15 -0800
Subject: [PATCH v24 07/15] media: qcom: camss: Add PM clock definitions for
 Kaanapali
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
Message-Id: <20261102-kaanapali-camss-v24-7-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: cIyj6Pid_zHTikW4PWEEARJrDghY1lMW
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae86916 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3_5DbsQPI53TjtTAKikA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cIyj6Pid_zHTikW4PWEEARJrDghY1lMW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX8z6j6q5Rw9kA
 2Bf7d+wRh289ngwgGUfDEntA6pGOSCa1bsCelh+SVohtRcHsFSUxv7Vm31A0xCf/BNCdkyi0GBU
 8mMtYXLYccyYWZpZ4fDa2qIPXfrk9+hL3Wec9fa+hSgTgTBG0Z3YURGhOuxKwA2sQ5l1eqoR87S
 0wpV0eo8RUkZ6WgrhR5MOUirVcne35b3v1n1fwfyI5Tbs+DCZBXpkdjlXfR/MmVIHpL9Ky6uOlG
 ayiwHvQdy2NZ3PDjC1jV9aDmkaHsJZ3JMOMfQ3zGwc1Ga5bzMGekJt0+NMIH4VvCg4Bvzhfdo1I
 14l0Pogqvx4EVc6rg9oIvBvneWRew5slQW24qXPKeD+H/Gh6mVq4mNEmBwfjL3m8+Bb7puhox4Y
 wrbn6qVD0m59KBUQfw76RMLIk89Dlg63RVp85HZbffW+F5b+ObpiErhchE3DC2JtnFbqN3Ab/VR
 XP3O1OQgqAgoYbP/ZPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX1mWRH341+27q
 al8/mncAeI1wyHd6DMClptxQ6RXPVHdR8xhNTQQBYMTNcbvgVY4FB7kyPBZsCRSgWPtHe5XpB4R
 kp4RZKpGt2BNXfQv2h3TKxiDGLfLzKU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 385be682e8b9..3857515aac7c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.tpg_res = tpg_res_8775p,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),

-- 
2.34.1

