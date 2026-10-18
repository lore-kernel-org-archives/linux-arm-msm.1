Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61183C4B79
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792307838; cv=none; b=DjhvDMcCbJjm4vRTGYexg86ysshfuAgfec2zYw79qoY1x1/Lb8vCMpVIqETA/LL+mtknZ2gbaPrKIgDG+sZNOBBwzuc2jgm3hKR41aU34jrFroIsEcMNOtZGavVcCkX6p5I59OsBFJ6pYOUj0VQt3mOkNBoeYptypJevKa0yZqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792307838; c=relaxed/simple;
	bh=ms71wKN46jx1oVrs1DdtFJngmBDeqxFXGYDoL9en57M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KS9B4rwP+30mzFm905J1ePajT+L7AvbYA2oRdZqsPqIQUV6U+wFg/uFwgUUcny7JI2SD6FEThOLoktzeh/yH2IaGkhcUWOS3tGKHdz/4byi+uCOsfYQRZhpNFTXQvoEj3T5L9XYy0f7aNE2hcaHjGvdB3Nu0/ubeKYn79wcwjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2+fdcr0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CwYgzNVI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2+fdcr0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CwYgzNVI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5tX4W3129250
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 07:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygf8X6ffossj1aI4TsRytKCkY0uZ+PHciaOL1GWigrM=; b=N2+fdcr092EMYViA
	8Wtc1lgI+fjDXJ6WOM8fPMK9YHZijx2GBBapioW3q2YxjsJNPKVSRqmUdwZ8w74s
	/ur8J35U/daYZMSJijP67BU+75gZopfhCWqDxClhScd9IsdESB5DAcdaX/a+Rv0v
	T0q+2lxOYkSLFgZRD6luo9R2MHKzHpznLwxvK8uS5LTIXE4UI4a+PJY7LGHV7Po6
	T8NGgo0V3Ajbnd/fZpf3YkwYWIRfN3+JH47ta0SGwGSO+bXLeCMLdflbRdZtCIx/
	w12rLSi14M/SQ/hZ6+B7VCAUVJ9YXABuFpu4izxw5Bslk/GZkVroreF6TuUWp8VV
	DaZDwA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc13utm73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 07:17:16 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-155a75f91e1so1892172c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 00:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792307836; x=1792912636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygf8X6ffossj1aI4TsRytKCkY0uZ+PHciaOL1GWigrM=;
        b=CwYgzNVIKI+mw3+Ym98MANiJ8sCiRWK9WXrqk27PiZVGwmvSOBd2zq7erKIcWTNTRc
         XbDIbaOZkxDQmqDXSL7el2eZoHa7b37d8puySxK5f0duoDmuchnS/6VsUwyYV8w775X9
         E4LxD931oRNukWtkFZzfbx4vlTJ4EEvRxLL/yCdmLGH+R0xYFnZi8gnpTh9MCrgGzaeE
         Ku7EWlRD74XmR4/njk7r6khmaEujFMRMlq75UfMuw/zCgoD/xDWN5oAD1IB4zqcv0qV5
         EyXJi3+7LYwzju626J5le1DJsOQekf9H0t1ZQwwU7VPcJRGM1fSa5CRZnRNZcklGAe6Z
         Xlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792307836; x=1792912636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygf8X6ffossj1aI4TsRytKCkY0uZ+PHciaOL1GWigrM=;
        b=Vs0kubtcwg6J8jEwYwit+UlwD/t3wFikv62deSWAaiBWMArFNeZXhZVwLrFt8MEuCv
         ytzQmeefA5kq1MFeNTFINpKiauU+gi53s0Z1pW/JJJZAHWjZZ0PjIG+dEK7IS0cR7Z56
         9Js99gOwpDCGMkpH63FIrkUhlc8GbroiZKJ9tTyIP0IBrX3B6J7loLAKPdk1jvPvGz10
         kjFBEVup74SoG0m0R+gXK1kIRnVtt8zFubj2Y/zwuDoM3gwUpcDXaKpk0W5HA9wepAHL
         jKnQNs87hKlkVvaCc6mxMEwiwOVmK8oZfCIvfDbQgAtDvtgM3sLNq+NKQZII5i/e+goL
         qElg==
X-Gm-Message-State: AFq9FYLfteUGDfBBjsPkvRrz8jvZEd62/y/sCf6TjBS5/p9ch6JQZ87D
	Tvs2O7q5jAou6gnOYjBcW0H8KnTBw6I2d1FDV0G8YN0KjFVrsec4zrXSDboDw32t5hnWyotKmLA
	igEb72LKFSINw0SpJecXGtQ0ubkzQ8yDztRN4cGxJaquTOPWmoXy5s2F81AyhiVmgQxVn
X-Gm-Gg: AYBFou3WCxs8JscDgfRp4faMGJ/9AyySrBlSUnhWoKqfe8zmdjgDoVmDRmiqD3mfJ5I
	HLVDGbmAgO4yFi06DtHN+J0VqQscuM8kVdQI5OLEwGfiJMneQQwmfD5hhZBbNU6yleYHFu5xOyh
	4L9QtnFcyqi7gUuwW3UJKEx5sh9f8BoM+yNOEO0sRL2p+Voc5ScUrXBsIm3fKpId6W+hDoR9RR4
	sj6HyDUyowGtBZMB5qz9aM0c7Mo5RYKZRPlPHqkIxB1QbqYEE+eYiQ+Iw8c7uA9+XSnGtJWiOqe
	/5ZmD3X1h5zbhNvjyC67lRYLCLkuWiiAAsWW327K27mz4DBXCH+NiC8//bZb0U/KJkHJZmTSrXR
	x0CQVNNSARKlso/O/JOkqH/8Jc4VBemKpcd4=
X-Received: by 2002:a05:701b:42d4:10b0:183:388f:c653 with SMTP id a92af1059eb24-1850fafc54cmr5788327c88.7.1792307835482;
        Sun, 18 Oct 2026 00:17:15 -0700 (PDT)
X-Received: by 2002:a05:701b:42d4:10b0:183:388f:c653 with SMTP id a92af1059eb24-1850fafc54cmr5788293c88.7.1792307834812;
        Sun, 18 Oct 2026 00:17:14 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm18646776c88.5.2026.10.18.00.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:17:14 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 12:46:47 +0530
Subject: [PATCH RFC v2 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
In-Reply-To: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: LQJDAGh2P9FTeJvzMp2qU0h9DTIiyn1Z
X-Proofpoint-ORIG-GUID: LQJDAGh2P9FTeJvzMp2qU0h9DTIiyn1Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfX4jqn5QB9UUdC
 SWp21UYWd5z1nXEpXUNttIZj11glRjhWe3qrO0BXs20qXwoElSe3QWIiWVA+kbkHrbnsn25fsdc
 PlUnTqWSmpPNix008Eiat5lWKZP5DOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfX8ylPS0+9ebXY
 /r+wSjFtNOk5zt/Q2/A3Sup7jjd+ik6wcqLCO/xRPMP+NQmC0NRLR0X1/BFEwoE5qsboJiyzPBB
 PYtu2cYrYn1En26c4E5sceK+dKEnuS3alOXcEW0dXrHJt9twEAJjrRdnE8j7HVfgI7mwk4scxuN
 0ToScA/ytprQ6G361yUZ1T6NshleCyzPulyigk313vZELuq+x/nZw8dE7qicxGv5bLlW0f+HPeL
 AjHrWaLPaqWqsEMr0ZASCiOLXijgX/cZ4MYzZ9x8WHR8gHGBc2zW7Y6rdrZqjE9PgoZamrAi4UA
 ka39vn7UKnEJLCvBmjxZam9IXKNiWer1Uj177vWxc0hurmwemfyU3b1hHD5scbalWl02ttC/cF0
 vc0agVuzB8kVrjSrgQMYBfcqJOy8LdmEDQ7EfVvEJhOMbm5wPi0w0XTqy/n4N+cPj3H6S+xD4UX
 8Ha3u8NcwFvHbQcVwxg==
X-Authority-Analysis: v=2.4 cv=SKzXx+vH c=1 sm=1 tr=0 ts=6ad4727c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HtUtNg7S4ek9MPr1-YwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180028

Add the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..89f8d36ed812 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -434,6 +434,10 @@ &spi16 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart4 {
 	status = "okay";
 };

-- 
2.43.0

