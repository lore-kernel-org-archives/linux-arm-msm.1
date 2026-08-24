Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EE941A51D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572592; cv=none; b=U46DqLDQMhFRMTFsLyUSHQTyKlShd6/7DsRP/+MdSG2xhp9pv56LcZH2ZnegnkcN5uDj+XOhIE1ZubY0KIqvcwaXbd+CZ42TlNprFVh8DQv4FFPiMv9NWk1981nhjGaLYKDjUzZkyJU7LqpUvDXZMR+m1YXSdSRUR59TRGcR1aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572592; c=relaxed/simple;
	bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sw4fvdzeXbOToa593tyfrP24cA12uVtHzJASV6mGcOjdI1Cer0KQP5hC/+8pgi9/Mh+52ZhqwkmiRjtm0V6vUK0F2QTTaHKRP9Et195M416HNQDmLUKd/pYuXfip0G4tv66hvO890KycYM2QmTcEvQzxo7FZpYTkbeeMjcMNSWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKJAanxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwHYS2Gl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKJAanxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwHYS2Gl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMgSV2846085
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=; b=QKJAanxk7tw5Pe2J
	vEb/1vntPDrL046mvmH7b2aVD/L7vuI3+tsstMemRTI8v52JvTCOXNMHBuKnj94H
	vCVBWKOZj3tLIMReVfUelhihFo1n3OJ/VjjaSPuipuR+W6XNVdpKrlq4pf/XSxlQ
	GHiMBoAMQPosXkcmsulVcGJhyeYKoOhPNcj0xCpWLYaGr/Bwt29yhHxgK1UIQsq3
	rb9qLIAo77QfL+CGh9O+FdyB4xIHcM/uOnf2ZUhr00+EbN/g8PDT0u8LhroUlpO9
	Zd08eJJOr2Sl6hkdQt+7hqemrBnKl4V4Przj/RrPc3hh7sTCliM2qxr8RbhX5OSG
	otQqCA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7jha8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9083b049f73so42347956d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572589; x=1788177389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=JwHYS2GlKL5uswswk1SjejowxeoUNv0ZZSa+oTmJBMrdkZ3XOODeJE3Ei+Efkl0dSR
         w+VQCZEb52LOcIDtavtIqW12R9eIHItcnJRWja/v7XrSzF625pmkyhoIKIHUB74skVaa
         6NS5FshqoOrFlliIfQBWe+/AYnb9e1+Y2ANzfQ69cFM7H9SOXmYSG47ubWXAagFbFNIe
         Yfl9iuyrnlPfTGEr2xhiVw4SKhMgYcwpawPOQdesxzsV1Pxb/JLZakxPife+2BYiFAtK
         d/H+G0r7T6JD2VosSCIrz9AcVkdFnsqFgHl1RvCnkI6JsVitbchT7PSKvHyqW8WIGIZU
         xinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572589; x=1788177389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=suptBwYQj403rF4C/83S6EhHXWfuhwe0BJtUmb2pu6Zg2loDYOQIL1529Oy2e20D97
         mRh2bLWoHfikbPZy2/dL49Saw7eMGZxu55xaVxrjwJ0Ijen6XqYB8T7Lso38r4Zc7GdB
         TZ8gbWPYDAqzGuQrTVBCBp+Na/4EQHQy3/H0mz0X1kWsjPeB3S5OFBr50bjRlQZNTJY+
         CaG1aUxxDY5c5FF5v5V3J+shMttJd8apC+eMpA9hB05HaO6mDeVDId5kgE4ki387nNcY
         ER33+zFmiuOhpeibWpTipVY6SHaOJmdJxSbXAwv+0Z8E8VIpM7dhdNPnpsN59ESB8E/s
         lV2A==
X-Gm-Message-State: AFuF++n1S5jgt0K03827JdjDGcJOFfXiKjTRBHq3wXvFAoAIrySAuw4M
	5vKM2hD2cXXut5oKxwNTbtnaMKKiP2xISBiC7UWDr6gWQKqNVUv7TsDxaPKw+5URPvtqeSRgDdb
	E8QJSljh2Z28cgfdOCd9QWMrvBLW9N4tYLrHbBFuqDQRTDVm86NFMOpTuOM+XyxSClA1/
X-Gm-Gg: AR+sD10j2bQtRiUMxZHopIUG5vKMXllgFKc7K8B7nK/HBUDVWVFbUaDI+RgvZE7ilmf
	qT9hknzl5xmrbuE/BOEJlTUTykFd1HRDToLGclYTOwKESF8JbWuQ/w3NypGs+nVDZsIzbJwrUsU
	s3XO2XZjNnYvS7CW/IsVpwVDKhgF8rrdcUuBQyD6PDHVI6BF5CfbEXvcHG67rnLJm74wt3fX07Q
	y3/PZitl/x6ahE6Oq0q8Za0h0yIS6mXRY/hTbAqVVI6OTdkzjfMurhy76sY7OZk5/szRDDGrQvA
	CH2FRQmXLFDC0aB5QiKqCaOxERSSibrhOyw0QDKp2nyzLWbAXO7IoKeeohbC01aBkUiwaOfHWjo
	PfZz5U4Lb
X-Received: by 2002:ac8:5cd2:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-52df5696dd2mr214101331cf.16.1787572589421;
        Mon, 24 Aug 2026 04:56:29 -0700 (PDT)
X-Received: by 2002:ac8:5cd2:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-52df5696dd2mr214100971cf.16.1787572588857;
        Mon, 24 Aug 2026 04:56:28 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:23 +0300
Subject: [PATCH v3 36/47] arm64: dts: qcom: sdm670: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-36-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD4th83vb+iaDFw7h8AA0eJ+ytMB116I9nW3
 g4NbrOrjuyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww+AAKCRAbX0TJAJUV
 VvHID/4kWEoDANlf8jQJ+bmqqsp0huQW6H2ir73t2FMh88pXnRkAD4LsdmRt1GmjB81M67Ntvof
 I1QZ22N5yT2jV5XHpXmhe+xMdm/YwjsKujiAD9FZIndPLazmZBVtBdoQrrYtOfhOv6L+/9TEBo3
 4OCoKgfbvg45fFkeCiPFrBxCN7D5xIxjPLbco4eelv4ZJYONUtuGGkiUgatAfeAm+tovZlEdOnu
 Myqrz+FXX87aSuEwg22eExPEtg4o7KpvUR303wMF/O91ou8zkcBSpnGC2aSYzG/pvgwRt28D7Ug
 EB/qFA14bEZTd61suU0YhVGsZcLgIwTxZQEmOwvpR0GgzTmD+GBBxgNT1JVpnHuIvwv0L5N24PF
 x+aoXs4vs06Y0exJ/x/KnJcHGNoB+NDt4L0lD0QJft3gArvYlEJFfKpeGG9G1xY5KrQ5cM1slF4
 ZGJZeWunbc2L/hv5nTKLLGtCV/1TwcH3ihersO8yANkCfI0fGeXgReQDo0PIeG974V4rtsenzUC
 bFOu3tFQnJrj5ZaVPglt/fP42TuDO3oJQhJCLGjCwvrLK/ZwqxrrymtHlYR7FV/LrMTzD6sKKYS
 CEeSiPG1N+1MGBld/2aBC8Lfo9DB4uJS9ypzOgnLusfacc2+q+Tg16ZocH6qYsgpS3AqGSrQx9L
 WjLtf53PHNvAuew==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c316e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=82sHzFGN3NSTCjlL1roA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX+cHs5kK0365+
 AeveYJZ5XLaU/2FfKyrnMAcKqy4v9sdJ4RXXizNS2aKrZbNOjd7SRyeueLoj7fIRBDWZA+f7olE
 tNJmGA3R5iVuxfquRxs14UQ7T/MmB3I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX43C7CkiCbyrA
 O+Ec48KLy/xBpJyMCtkfx+fMozts2+iQtON4sUbhDVR62+KPh/ivG5yHYJGA1yBYsYuR3k6L8HO
 Rm74CEAj/npuK4RJTdYZTAYHgID2yfcPFJARg9FIXq7mGKL97F2A61pQ6m+186QUS4O4z0sNj5U
 sjp7hhwjS+msyNLUl/n2gychX218HBMzRCsYg5JCkYwBLKwvLG68XqMqb/dMdW+63hQNZS0xyDt
 UKQ1PK4+Vj5S4gyUeUSl3uFuEX8N3ynXl8njXsAMjlsCUO0+4rLyaS5hJGRTENRuDr88F43fP2y
 kTJr3XYIxxkAGJtn5wLr46QS6PG5AsTgIyBUMlVdPxybAgIw+NSvxYOJa+O3pAm9ntluuhDFMOw
 v6j3K5CHKsOKlXQl0mZFrEOj79QK2cV7tFkBpObwJrvck9Poi0EBRjGUWKEEeV9ZPUhfvRMVU4T
 x0iHkS3BvaoP19FmOzA==
X-Proofpoint-ORIG-GUID: Gr6zZGHVVaudB0guJR2zZ49Zm9uX2iZ4
X-Proofpoint-GUID: Gr6zZGHVVaudB0guJR2zZ49Zm9uX2iZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

The GCC GDSCs on SDM670 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1978a54db23b 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -626,6 +626,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SDM670_CX>;
 		};
 
 		qfprom: qfprom@784000 {

-- 
2.54.0

