Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688485;
	b=h2g5+iAjGpwfkRWgqwYFXaXLtPUKKXTrZlDtTqps4YJLSnrTK/lX98BRMKc00gohq/uy
	 4X7/P6CrqP7I5eWeYs0YoXxsuv632q5Y/Eq13NWUpqhu7+QKEHpKPLA8XwbsdVZyB00Xc
	 O1TaZvNnj+NQBcWUu6l4G7GZLeBer+YFXgVzKtVu3mM6Lb2HBAX++2srCbq+Kdc23NJ45
	 r6W5AOTLeUPN7n8KNQAKjZup7TQ1+FcuOcOWFRpBzwSFecVsU4L1bgevyLaeZuuMISrwX
	 XztVjVbNaS7viOdp3exAUSzdwsD423nUc5QZxaNqNmrd5Jbn+/l6rh57wseujsrQzqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688485;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=;
	b=kJwEArUjk16GxpMBiBic4ly3ybVXBtWp5Jk2Usc8TqUYNrsIKy37spM2qqiXu/lKCB8E
	 0jW9uOGwVyWdmiihkZqdAaCFo/CiAptEb9sgbcRid0YO3k2SCp7J3hiusDbJdNS3P5iMl
	 JnVS+v8f2DJK4qZHElRBMzYBzw7WwGdgW6M+QTXDjZ7smwKnI8CzE3E/2LWeP+qfgnxWR
	 WJmMeafy4HRD3HlebgF/VN5/yo5S2+ogpU5P+6EQZ5GdHmGkNHZxJYr74eJckTJc/5MOQ
	 W4pn4kIIbFfl7ncBKRvLJJERxF4pR1uYXsTLxavNkCnI4E24UdzUttp7MRrbw3AI5dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHFZ+ERz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gcWqPUnQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130AD606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 130AD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHFZ+ERz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gcWqPUnQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AwS22175558
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=; b=CHFZ+ERzH4RF9Xwo
	z1VDxDVc2HjBM6hZ9/9iSIr6/Cc+/CyH7+LS/kwvpm9isf4UVZVdj2ASKg7kFxGf
	EAf/IdK2nNMah6tduZKzXfAd3S5N7aWJvO/m9bsnet/xjxchQJbbwfkmACIPgCys
	atoWa2VnWqkBeobPyIH4WCEbuw7kfb8b6OUYkmr04ofOR0ApCBQ0VgbTyoJoLZGd
	CmnpRTXotuUI3on6lHvNFcPdCC/NLm38BjqeYt7kQyTvkmkR7vjmUO97+R1ADeGO
	o2+TEIB4FEfNUrxbmEu5KFHP5nxzAvoszVlDWpa49e2nE4OB2PNoreP0qRhFVerq
	u7D0fA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuyv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so1195447185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688483; x=1796293283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=;
        b=gcWqPUnQ14wTWWz/4bvfgIdV+HZfBQ7zfg6SVAF+8b2rm05XAAV9JBd4Rd6QwBA1jM
         ukSBfj7Ys72T63S9ulZ89HaAZmuSva6KtapDBHzS+RUi5DZq9aUs5Qj8RWzOV/ArI+zk
         WwPxWqA3t+ukKaK0iQ0/q4NOvWoUOJDPLizUYddgaWpaCXFOpDob1q1C7ATWlFRSd/gq
         o0qwV4ltOOlp8oJ0hs/YZ6MyKwN9FbSsgc+sOy76As43jMQWlBC1kppHVTJUifl+0QlF
         /RThszp7GsGwgBqLqRA2aYgutFMY33wv++VFb6rql5OyAe+aUvyNO3Zk+eCs7TOb7jtT
         GMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688483; x=1796293283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=;
        b=F1Ugwua9b6aaRUHSWSgvSyxdjhghaWnuPEVWRgcIJlE2EZuGaWZJgiMJd8G6BVx6KF
         3CMVCJWBC8L6bEKG5yQuFs2Dudw24+0uLehDbcKJJDofqdj7iYhg5zxNtxn5Sp3moPAw
         sw/Fvu0KxosCs3S4ikl3gKuTjQ3w/1ChmQ+J6DjgYS/4ucpTbOEpHpBCXDnK1VrwURsS
         DS/4SHAwcDimy14XnvNfFcseenf8jRDCGxdANnsVLz35iSzkzpBsxFFO6Y6U3yPTyb9O
         KTLwzmbOmBER82unUM4MNYQjIeY5rq/PDsf/hDCjaXwaXHJPH2/+6Jkt2i7serMlF7JQ
         4Omw==
X-Gm-Message-State: APuU4Z/2r+G7bfHabxa2hU97a3jOJn0ve/av2oZ8dpATzjTjXTARlr1k
	eeoOv7+o1kXpgvNO1NF6Pid3a4EOAnpL4xjvaHnfSyH63h33JbY45sGST5wckF5NLwxkGOI8kSA
	/bwIKysN2zN8MhXMohVECfKfyTRyJT4T/5PDJgfG6y77YcqJy6Od9WW/r97Wn436ryhQY
X-Gm-Gg: AZFdTZfwRj6s5gKxqbUxWN/jscMcSYiKIIMUF3HQajKVAFkWH/q7qhBSzRKyACiAh9Q
	skUvAvZbCeF7mRjtJXsoOgAxf6usOAHAsIRkTOFMFNt9BeiFOJlr+7ZprHiBN7lRrDJcS7Zm0mz
	8widcW9narK53p9b9a2jQffG75ORzhqt+FIBrb5wYjW45g3I9qJDy+8BIFlGnTuBWVY384Y+ey1
	8AYfqYFqHRev1ywmuqbzgdFGaKzK2T3bpfs5kHFSVObvHFlZVEhyGQLKRADKMjGPyZpjOlbfz4Z
	lZ/eMDlDt/1A1bg4KSZ5HL0tFwApsYYiI1E97l/8eVpKRLtA8Ml33qQ5Jz7mxPhS/mr1m/l46nt
	ZXwlA6doanEKEWYMXsztK+qZCugOLKAOs+xlpwBtJat7nMcOFOrPImanNMlL1uEfsKutUhSOTaZ
	lWs4KeK5E4c43eeqvVaBJH3/Zlv/yvtPZz99C24SJ2Kp+d005D2IIZnn6mM9yLE7Q=
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff3 with SMTP id af79cd13be357-949ba82355dmr3753654985a.5.1795688483500;
        Thu, 26 Nov 2026 02:21:23 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff3 with SMTP id af79cd13be357-949ba82355dmr3753651385a.5.1795688483062;
        Thu, 26 Nov 2026 02:21:23 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:09 +0100
Subject: [PATCH v2 05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin
 function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-5-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PXcb7Wda7w4beGr4z8FvdCTWfP5iw2i4mvm4TpfkBlk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTFsSdMu2DU7NhEmocafPG0tvuGTey1JMbg
 xvvkiJtykiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w10mEACKw/NXXRrMJCusgib6CueanCuVm7+pDZc2nEEF+OTuLbP9D8o3yB7pR6nvUlg7rGbyT4i
 HhmWd+WzNRxRNEfcKNGzU2lXn4xqgJ5g2WW86HYIKlhNHKA9bYwYizbtNkF4cg9l6lb7z4Sb9CH
 uoS7mTdR7s0BYz8xPqKWH0mf07C6jm+opD9+g2vc/kth24NQcVbd3p93sd0gsSUK2cTH+KIkG1h
 D49rhneFdQV0NpqHOkqAO5PSQUoICTcHV133VaflKkhRo/YZLRlOluideSJyFcWz/cZ+Xo1iNt8
 PI1COK80O1sZslnztJxL54td+NxtVYlxYKZfdWwalUqfu3lltpRdgcIY3ghLSI9LxhNFGSQFZV0
 z4vJws4w0ur1m197VwvMlSNqw7E+0OZJ78EXG565vu5KwGOROP8XLhXgONs1SLy8mWsBbU1x86L
 X4jc7YZ+OU9GCwyqCdXNhGvD0iAbAwI7QrYLIiG+oKjzhfkeEX4p+5lJv/jAQ3Q9JsoowjN1Z2t
 M7klOSrSiuYDHy43yLri4l9m9RXv1rHGz7DQESkdjouK1T/P48yLMo5NHfquZJV0RrcIPx0ijjN
 4tr/u4P9Pk9uoyeifaxF1az9HRvop2f+tlHlqtdQbDNXqKKsnaBFCd4wiKAwJDKChqzOckIVa4m
 gFWtV7SZ/b7CMQQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Km7kK-Uf3bHN-i4afuenF74vZebyrJCy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXx8XyxWasrTjm
 cYTo2ri0GUIGW0JXz41mUTXhxb6EQWy0epptmjZy3A5U9ro/z3qxTD/F5+MD/C+ub5Vsp5S363N
 jvFw1lSe9ufeAwZLRq1AkL5d9vYg4b4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXyVo70+hhdbeV
 7YPGRl4fCVC3kYL30+9BH/jsiRW42D8J5NQ7XFnE9w9bddPK9O2gRStla2Jz+XvC5qK824umW2f
 tvaiNxMi8ApwJ5/IXmgR8QY0gXu5A/gPaV8q+j852+K+4gQo4XXoL47CeH5UPG0NwB8hIBzj32d
 zq+lbVheQMMFg2Kxx7Lcvlm8T/nLi6Wcjv+Y79D35U60XoP8jWbUSAnZWiIvozkTiykOaN9rXdV
 OeSXhv/ypDLMWiTZFjqWsY2LeFrHcywdIqwhR4STVmAWLedyzy/qDwot/EQ0GVDGaXndTn0z4iL
 YS3wWxJU6Q8uNTxfSJUFjFzaH58d99t3KveNvrTewA1drOYQRHTCqZ+yY6a+IS044qH7+weneWu
 jPfwg7mznkkhZFS1VFFgJKILi7+bb4K4MTkMqUno9KYUEjm3T/A2Iy8U4h+s6ds/VHyLwPe0VbO
 85P/B+sXzEd/dXEMfrw==
X-Proofpoint-ORIG-GUID: Km7kK-Uf3bHN-i4afuenF74vZebyrJCy
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080824 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=U65A1e1nmbD1eduP8fUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the hawi driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 90700e10d2ad ("pinctrl: qcom: Add Hawi pinctrl driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-hawi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-hawi.c b/drivers/pinctrl/qcom/pinctrl-hawi.c
index 3486a6d63d10e71b0ad78f10b0a88bf6f47db738..6856ace6db1b2253da1bd168a0919e72bb131c5b 100644
--- a/drivers/pinctrl/qcom/pinctrl-hawi.c
+++ b/drivers/pinctrl/qcom/pinctrl-hawi.c
@@ -1211,7 +1211,7 @@ static const struct pinfunction hawi_functions[] = {
 	MSM_PIN_FUNCTION(ddr_bist),
 	MSM_PIN_FUNCTION(ddr_pxi),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp),
 	MSM_PIN_FUNCTION(gnss_adc),
 	MSM_PIN_FUNCTION(host_rst),

-- 
2.47.3

