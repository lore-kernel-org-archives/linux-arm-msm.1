Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530571;
	b=Pqd7/0wdPaq1YunoHgY09ofQIedAR50/wAu/eDz3gCcc6zO6aAAZFXEXiIOTZAdezn41
	 VprXZTc1ZBrVixPOHSnfaqMN686Z3iYlqZ2ekP0kayHM6Vw57CJVUCaByk4FuDi962JnG
	 Y2535ZNZw0Oq9dmrdQchXFRFRAHpjAPr8yndPHdPlmLUtGjqIeXSJbwwELCFSTTsVk6Lp
	 btyNyrxJ902glxxgFQnaRemgrclgow4BDu3JaCt5v+ekEUtiBajZ4Gib/eXXoLTbycyax
	 Dwg4VamIbHOPPcpEUXbhhjQ1hpztd96Y+Jk8VTyDC3Iop2PN6NdDfHWX7KIo4q5cspw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pDx4ATD4efu0v6aDPCmWB7bmfn6OMyB56XASYCAPkS8=;
	b=uUtgJ4QFaiJPEonH8HRPQq33AwA5YjJgNkwAThoM51fVKS8TkQmMK0FR8OQ/s3wTba/q
	 TRPE5ZQ3B/kNeOVvhSkmJctRnixtFCmTcrQkQ9a/mXCGZXQxefduSxKsFvBf1Vn2NYf7i
	 /4pVja9j9DYndWu6CnCrtfE1qDucVud77+6BHSYPYtJZvHvZc0PHyfihVDuH1brHhovAM
	 R9NZIjikKnYefL4kbnJn1rm+HqbYv3Pio/sWRfcRJeZrSzxABrVvy5Nb3G1jRNqIBWtvM
	 lk5DRG0H9sz4yrIaRsyNKdCbH51Wfnekiyyfl1Ljj3QtxBQCU6lfVrKQFnzDnCL3pRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZVI6eAb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eem6zKA2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1687E606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1687E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZVI6eAb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eem6zKA2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuPtn636820
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDx4ATD4efu0v6aDPCmWB7bmfn6OMyB56XASYCAPkS8=; b=kZVI6eAbq5bMKcbJ
	r+d2CeYZ/YGlfsOaqcuGNg2Si/NaqTVwYdviVX5kfNxTgaRnNWql1BRUPLiiJuCh
	Wc7z+DI6xi1uY7QygdPGCKX0Vgem0gTMxLnPeZjZgjFJcxj3hMtgnfs8RLH3iI2D
	vxGb0SRyvp27dJNTyBofQv59JAn2BWcgHdpoz5oux6PwoGsof0ejFHvtaSl92MYe
	7gbvh39neZ98HGviHQZtFqMsIQNOapqEZmGMM0ox/R1dAzBhEEhJ5dsh1M/CdBiK
	ms2MejRcKpWXdpciMGoV6JcQvCNJk6jEc7lBjBx6ZMZJNWno9/m/JmMrFuooGQMV
	WRpnSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpj8ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so824858585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530568; x=1796135368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDx4ATD4efu0v6aDPCmWB7bmfn6OMyB56XASYCAPkS8=;
        b=eem6zKA2JdT1qmVUAztP1/oaAjWHnqrZGDGnIFZw1m6Uxsfg0D9wJpyZ3ULT2dzKJb
         2nJ0p2Yz0KUMkPszEiQ20jBGo+JlyFQJDGJCS7hPRagxzz9MxDwnxEauVmzO8YEzPkyx
         lADk19wf3UdAseX70wyYS4wI/MzTkNdVJkX8LllyguEJkGFeW0uakpzs09BXiYirhpHi
         g/LV0rlOJ/XqekLKzOylfJVT+ratPzQV7TW3oVaXxGyExHBc5O9udExVF7x1dSWLVWQj
         eD+b/5ZXkJGTInoH7WQGo2N9NAVmQydwwXFd1tsxhScE9CWjf9AudayenWEG6AFav08U
         YFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530568; x=1796135368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDx4ATD4efu0v6aDPCmWB7bmfn6OMyB56XASYCAPkS8=;
        b=vR1J1qBMRwo64tU+y8pW57zuxxP7J0G9ouATdTd5U8Re31G0s+Y2A03tFI4OEGZaSF
         PPJcxATqZ6KX7MUNPe7nnCRS3ZmloNnWKXFrhd4ZIW79+VthRaXheo/MxdkHYBzPLKHi
         /plxUvLtTIi6giufllu3gP9DP9HGPeRpSAlbXUkJJJDaNZjwSCrj0BbU4nikn81vwZl0
         GlFK54C+0424ukJ8zYUoGlsAu3t+pvr9NGMgd2TK+nyId989O47yolhDdJMyIqtXDfid
         ATdwByCUgqyOB7bs/MMAtjCLKN/rT6hSziJuzD0DM44ZdRg+iLgPJIQQgX6avH9u58HP
         XkaA==
X-Gm-Message-State: APuU4Z/EjThiQ9GZNhDBHJujtuQqEDMvtMxDeSU0Mu+2FpRJudycQtKv
	y27wj+jknEemOWWvEu4eBSq4LjsRla41lgrqgk1KszhgMaFv5iguUqsm2Zzfm2EfyOIUUMBfjEk
	P0maB5A5Bp39WOJYb6u4IVDzxdlwWHR8KcipcBUyz3YPHjtjCoeh3H/Qwq8Fk1df9Sn7P
X-Gm-Gg: AZFdTZesHZz6G/GjpF1wZEjRxRl8FgrzWp61HL+SWs/mRhch0FrpqDGVz0dQieyhAyt
	4Nkd3w4F1L39uNiRJaUiPdfgsYBgJJws9NmhPoH0ZM4+z4FRVGO5zQkiTnQyf+U7AbkzpM1a5he
	L0CiMsgjDOiqYFy1TXcZO1SJMVaYwBl9K5H/83Coks0qHR4QZMMHHlLzrAzZElBm/GRjFsS6jRb
	iBbyBjf03CixIb2i8PN8wt4Rtw3Y4xDZP13VXFjNoUPwZP3m72l9hzjglh+p0b8sNC+SS0HZmVl
	LpYvshqtNLKqe2bre4EwboXKLIJyrSbmArjSa+vQ0CnyvOpWs8lPT1VXU8SeiHWS9MhxT/bShW4
	qhEAMhIgGzK7IWHzuxdoYmYWlkkNVIbl0ptLZ3OSE7l+KDB5wWMqu13Y88fSttU2MfSv5QzwCZV
	F/p8Fg5Y+ri9XLB60peDLt5y6tiCg8zmvZGEcQC/G0pqxiZ95zeePu88SvQoUKxG8=
X-Received: by 2002:a05:620a:4625:b0:949:5c18:5347 with SMTP id af79cd13be357-949b340227dmr2743781285a.6.1795530568359;
        Tue, 24 Nov 2026 06:29:28 -0800 (PST)
X-Received: by 2002:a05:620a:4625:b0:949:5c18:5347 with SMTP id af79cd13be357-949b340227dmr2743775785a.6.1795530567868;
        Tue, 24 Nov 2026 06:29:27 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:18 +0100
Subject: [PATCH 01/11] pinctrl: qcom: sm8250: mark egpio as a GPIO pin
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-1-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EUwCuVmfEOn7bJ4/3Uy5/L6RffQPBekG+SBlxVb6MiM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9CkmrJnDvplqDSU1ZhUafxeu4dIJqff8AlX
 zvgczEqTWyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 wzNtD/9Ytv1UI/lhG7r6aM4/MH+25CRsHqfhlC1dRXBDmv1kxXWzbIC8wviC5YImWjiz1Cg3+nA
 1rebVQz4/X9ULSQaxHzV3f0Xa2RJv5x7urluMzENWj5GjNrzjpMQDq5wGFd1KaRAHeP/hRKlgWU
 /pHe11J/a3Rb2AiAXF5R0XGs/OfYSP2llZfHkTH3B8EckjOfM5DQeCuHFT38RHfIml15Ia6oqEd
 VkfA0myyfrg5h+amNE16rX0Mbd4lv6GjY4sI9XibynQeLwYH40lTwOQ0cFpJcucAQ5MTjuY/q00
 LR6YPamKwN8De7WnmsID94hlr+xLrmftnD78s8ziNn3AdkjmznqDmcGwAkEK4vI1BpLZ+GBl9E/
 17aLa3aKOPZguUYwJiyXQC+QJyOJq8SdzwXY7qqCQQtCg7Cc49Z4GHIia4dH7k5z5lRR9JkTJrw
 BKbKHEjLswPyltgge/IrJ4NyV+D0yMJFVgCop4GxQPVPqX1TgXJypWLRButVfAkEB3UdEruQUVC
 oqMvrSzti6qelFCDEz5yG2CvWZCakpGIvEQSWjm7Q8NmxxzQWWguLsEn/XC8+MeM9U6LD0v4rXk
 SYdNN8qri/4yTDJ8OKjlx8qE2nP1+bjwHiHf+B51dnDu8i5vbN8qw5epcS8yY37UDQostxObqDd
 pOqE7XDOQwMLuoQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX3WDowCyGh4RE
 G0jHHhdeo0pPkYWQeA9+FlKwkwWAwD6jxT936X/quIC21XX9sh6DCXIaWCqJRDfMh1/Im/QRzc7
 ipxeEC8a20DQxdXJlbUK9uIW/MUQXqKprv6SLVL7ZlDRSAiJaIN9dtZ6gq6H5xKRI0+LFkWbCXQ
 k1oGRC5KQMDemx3zDijQEMsCgmnTWcX6N7WT0l+ygBm9W6KCdMgninBV1clRsVYNQZbEAQT79wd
 0bF5Rh0F99e1mzIku0M8/i11arBlXo5Viub5K/6lHb0GiGFBCMFR+ybFX3GIhmwFxqvfKp3gE34
 CvMcWENbjlwkveyWWNYJzumTrtanFwVAYSQRs51bzkq9ptjjNDRKXYRECQ+qXv77YCal73ZQwEM
 Ry7EO9lx8exVIZWwVgEqTNidDKQyNCJNdnouQUosdLD9fpJu9N5yyGMabamBbTl5yvVuz7nGV+J
 GKpUT+ozWnB11aw5+PA==
X-Proofpoint-GUID: Il6vVaqNbL0LV0LTPmjtsTOzuUS_RK9D
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b059f48 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6-PDsE6mYu08rWp6JRYA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXyp3fyDE55yBV
 wKJIPpxSlxSSMU7LLHLmM7HX+CK5AtHKipVaiweIs4aDwTdz15ypt4OurcR8A1LZE6jbsG1QbYY
 zNtuidzcXSO3KtNf/m8twVywmHaER0c=
X-Proofpoint-ORIG-GUID: Il6vVaqNbL0LV0LTPmjtsTOzuUS_RK9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the sm8250 driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: b39e9199fbe1 ("pinctrl: qcom: sm8250: Add egpio support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index abf5f68ef62f58eeee3354ed8731d194d6d60b5c..8791b4f0dde415e1dd2e61e2219392782c4752d1 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1026,7 +1026,7 @@ static const struct pinfunction sm8250_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
 	MSM_PIN_FUNCTION(dp_lcd),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

