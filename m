Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616140;
	b=oBaSl5zTf4ezZnof2wva7sabXh7uLNd92FKrGzQpOAT7Aq63c/UMl1wxw8enkDvveLdh
	 Xb8EuPgcMsknQ2yu9b2tGT0FU7le7fYeHcqsWLJwQ4Q7iIcZjpHbVW1A0YCj+xG/ct219
	 zNF52zu2DV+LizhU0pYHC2qthvw9S9YjGUjWwqaSAAr8D9RstxydLmD9FwNqrkV0Zcfvw
	 DCYUbAAP/4sRfHpFy1c14W1o7ZNd9mq7Nv+D8VxcRSWjhHvC9yYX6yGfAAdemNSdx4Eiy
	 9bSsmfo50JM9gKOwdWlMY1/n1jpFevEVj4rGyCXX4Q0M/Lld2q4AenHoi4MZ2CO28nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
	b=dHK8sFgkY3e2Ia+dES+hGAJqJMXicT6sbt9dr3e4pWdN55a3LqH/lDsUzy5Ci84uTitQ
	 qmS6MX2TuNI9Vo+8HHbT8B494WvmAT7Z6PonGjm/xGZbLhuIyXnyvbUEWNv2IsXrEh7OC
	 tz/O3swaiznOobkWlahbHJKoKpVOnh9IZ0J2k+ANQThZCvQ5YB7Xu/WEykhp/JM+awn8w
	 zhg/aUoMBfQOnDlmsa9nnhvQ7lvVH/lYEUeAsZkyaApExUTznsMJmNPIiy0JffKAmiOIS
	 8i8FOhfeUkLk4fS2NznjLpQ08xWJBsIRvBIgDMlSbdha+FjeuJNNuvw+9P9a6hYMuLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mvcKXKLE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kASAn+9B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF1B606A33A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF1B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mvcKXKLE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kASAn+9B
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1vc2466129
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=; b=mvcKXKLEkI6U6XF8
	/MSN+QFKX4Nb3WCXOdK+nO6AwDX71ZlbEdYk0Zy38uj8lE+Q+ugEKIfECbRYZaaL
	JyeaEwQrTAsit2hNqFvx+uqXXuWCwdM+IQNofX5cjr5cS+bUsrOPAVL/n/t6S+AF
	x+FCEqL/nyXNteBDwrVByvhm09Db/BykPRj+RLbV4QT+jVWquFIp6Cc/DMiQL49Q
	VytibPYRBJPxpzR6uQikGPh0wp/ABYRmr4CWbkzDd4k4Eu/BK+DlyGcuQnU0J1cT
	V97J1bRGmcbDigaubZ6BNss3cpo8VFIwh9ZG6KrRA7AGqEnBWViPStzl33SKm45y
	qhLiKg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhcjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:42:19 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54dbbf252cdso4299371b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616138; x=1794220938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=kASAn+9B0B9WwHKDoj+ar8KmE11y0wG4LbM541s7TfgQ9ZKR8bwlwv9PzD1DW3Ts/o
         FF6O1fZD2Vh5A2w5vtrPSQ6A7AsNXM0yk7l9JhCNdtxpFag2yvSskomdBhvP8hGXdqgX
         s6xUuGu59l5Shxx2UaKbr5P5nP8IS5xC7rw/20Bh6Zve1aBh5aDnjyz2fl3KujV5QN6L
         G93EJPzLNkXGdkWthXOGFOzDDKY5oCu//61LhoWNqfRZ4dpQyG93+0sVKReePJYoyWv9
         G5+2BbJGRZqJABiC/YX2r0+MyPAZsr3rej6fEbGojM0CCIo8EMkPslOaAD7/y24Yfyoq
         XdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616138; x=1794220938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=qYCNbHvFp8gkWPfd6uTrmLJNCZkFPLOV2z0no7nAIFYSO5uIT+DcJzCk8nBY+G1ewi
         81Feyk8Tw/DKsG44qDRf8Cmjdim/Dnq8I4Oke7MjtD4kjdQMcTRBt5BvQ9vpWJnXObWb
         B5sJcED/eEkcjVcw3Oth4/0oH1Mdo/eQ5pgFJoznatTyFPB/cP6DHg92Sm+r5QqAx4L+
         u6cLCWLeiTJQyZ2hMxvCWgUUmFwRj9+8bjasVC3c0VpuT/7D1xCI+P/QGS2QraEsFIVa
         QU6X2OIc0AygJI8oXTt9a8ihXFVG/IVaQTtUONFJ2PXmMMeTN1ysedITY25jozQHTgW6
         eg8g==
X-Forwarded-Encrypted: i=1; AKwUvBx2Ufll5ackhvCiRIrKzvDBduzh2DiQs1P8N3jhfcMC6a1bZW7ud7F22FjJ8Hwljl5Dx9Y1oXEU+j9opqKF@vger.kernel.org
X-Gm-Message-State: AFq9FYIdqNhEkzTEreuQazKdxlYtujDbL9N8QAx9KWtwXO913GbmltRL
	eWL6uedBf94TDaMMeRqB972g5QCZBrNen/sXli7SKp1AGvMRC542Ioie+/CrXVe6Uhi9mK5NmDL
	20u4YbwQAGTELvng1z32zJWSlxrDJPaoUvpXW8sBRFu+X3IxpJzEejiY0huhI6jJwgU6jlD6Zz3
	8C8PE=
X-Gm-Gg: AYBFou30ClrcWpppT+25FnfE/327Uku2pWmg37hosW3mfgmzRBfuBSVPq7CVnE61Bgc
	JlmEVcEIuoFleEghPCTlukrLgGwq0Bz5SqGXaFVZ4iZeDGsLLqT/uZq2+Qvorv+UcQf2Tp0ky/q
	eiwIKIY4pk2pACuaR8phrH5JP5AOJhXzj2dZ6CqHGlN3zykhYf7bl2FF5otSJnxrYTz16yJTBN7
	H9kEqyxd/Y7uKIf6pbZuegqwSTrIEZV0nXtJkxERTTmcIBkdTw4YzywgULmHgW49L3xbqccB30U
	HQbC52fzBX1M81x+leRa8liCHJ19W6CEWaeJmOHT6CdAyNeVHAj/rszatKKVsHUAmrRcSnXEc6X
	tGnIqyioKGX1fmOIrV9IPmjRyZG0f6o1NNNzk4DlpAt06jfQvLnsOLC2LrR5NNWsNnjHIA3MNMM
	fCb07dLSeyY4dk5vUysYEhBx/X/ddqs4sTQp4uOdug724nhOZpoQzDZgHAWtM=
X-Received: by 2002:a05:6808:1995:b0:4dd:18c7:5448 with SMTP id 5614622812f47-5640de57273mr6522664b6e.56.1793616138181;
        Mon, 02 Nov 2026 02:42:18 -0800 (PST)
X-Received: by 2002:a05:6808:1995:b0:4dd:18c7:5448 with SMTP id 5614622812f47-5640de57273mr6522644b6e.56.1793616137662;
        Mon, 02 Nov 2026 02:42:17 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:17 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:09 -0800
Subject: [PATCH v24 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
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
Message-Id: <20261102-kaanapali-camss-v24-1-d6b8f3f6f66f@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: DcB_GuDEFRUmCKwpw9tzOKGvNhIN5Sbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX0ZmGYn2XHABD
 xiFgw6Y1ftIfXW3N9TLCUTFs2dwtmEG8ISsqZuQiCpy9Q23nTrbuhOtsJATQgHlXkxfLeFkQIrV
 1S0hF/7fL3U/R3xScdr83Z1y7cAZG9Su8I61m0xFUXdDuHP7t96KaQjONd6sH7l9U/MuN8pIzY8
 BNeLRBlBSTkJvkNBVL/j/Pgyqad997Wm9CyAnloRH8lbX6WSHw1MkzMK1XKlVEaxseEDq8G4iyZ
 J0O+7jVSsXPSf6ItzlGEuAGd52roDf03hZtKaYquuB8GdwUlOqkCVzIT0ZZWkf0wus8K/GdEjYR
 S5t5xE4sfq+5suNHDpK5HrsM2lJcm9H4ALUNP7qpYvM3LJh7Z4pdy2LDkf3BaKfwbYJ2oPwWn7C
 mUMTTux894cWK+XdUREI0IGHc7ldI605m99K/k83ItPSvVf2XvFDDMO1EzM5ArJv4+vQpZTxkCW
 ulOn6A1DCT+OEdkMc2A==
X-Proofpoint-GUID: DcB_GuDEFRUmCKwpw9tzOKGvNhIN5Sbu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX2aQcWk+w8rea
 M2UNKs8ufksBclBQBGEJhIKMc+tTqHTEOJAQr5Z4WDhXiLoGAfqia6Pw4P5MFtBNXAsi6rAyXKw
 jZAhgo8upRQDS/0idcPHqA0QemieI2o=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8690b cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=quhYwmWePwexk_oO3l8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add "qcom,kaanapali-csi2-phy" as a standalone compatible. Its common
status register offset differs from x1e80100, so it cannot fall back
to that compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

