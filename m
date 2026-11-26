Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695116;
	b=fDmmRHP24mOxoIaW6Pp7pjwuQ3rb5vwUxqwMLuzFVfbMg5VKc6B1n8dpIGpgu/G6uBQg
	 emmPvhrHpZynoSxNb6kd9oAAKTag8Z8ovgOKMMa3I6v82kswj4sLxdbRvBEFEZimzUyOw
	 0h27Jbf1swTpyTo11GfMQPvcGZpIr+ofFTT0vCJhRHp0LJeEbh5d16ZFI1HDQQOC4TEiF
	 KI6WWQA0ausvKz2YYnAVSmbKtzmHX8EEr1qp8LD0yoApixfW4Nsx84+kA7PixkffMzdt8
	 9x0hHuRXzjnDoAQVpsux/N+LaAn0/uELZ+73syvvMOGeT838Gyb5b9pdbR50t9mma0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CnKchJGd221CmUhU2CN6qD0GhP92Ow0eY2JeeRWT6S0=;
	b=fQLh+qzPPFe48KoURP9JOygogGC63SqeRIVkf53pjKPtZ9qleMko4dZV75GDyWc2WTBE
	 bxXpe0u4ZmAnQ3kC5IkrFUzzn/bTkcVLRnxbxtii/AF3aCl5Og+wHfyuv8Qh6D3znCq95
	 d+Mx1pQdzmudHQ+Gp9v3ZWajmeAvCv/02TPv0SSxuzdF3ceoD9plU2zcx1OVoAjH88b0v
	 3sFBrtXV7WW/GmlPM+E5RzAb9fCgjdPMoIJq2EM2qWRzH7FvuJkdBIRHNtIcX6Oe7G4dm
	 8ikpk3/2jV6n11sZ93rRxqnr0hMZLsrhVjm0hQ2jXYsIabUywDy0k3Ti1hBEsrbgVdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WNj3X2Fd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rr6hppkW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EA8606A33D
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36EA8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WNj3X2Fd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rr6hppkW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBW7032265103
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CnKchJGd221CmUhU2CN6qD0GhP92Ow0eY2JeeRWT6S0=; b=WNj3X2FdUlZ+m9Q0
	yZPxTJLUrWYsvIvFtSikF5I7WW14LDtpUpLk6oaFaDuP9sDuBWHTjUI0JBOF5Taa
	1ZhAXcGLYqD2PJpMvDYgxlJY1E84hASRWW0m14olVko5yOBgFOQxis83zN5nSWY0
	YtWRkKMUD5KcVJ3vPV16IuND1zAgujAevGVFsL7oA8ZmTU29DeGOfnmY52ieTVjF
	yvC/G3UUfXEIVQ+TWpZWoNV7yg19pnQ77idLYKK3u4QO7joqLsClvz4aYe3JobJh
	gFZMc2wvhd+Qwq7CQBJcFZuAzfmYEVVI1Puekbu9eZlKbrS1GYk5EXaybHKq9cwJ
	6oXGbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aem1m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so1521395685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695113; x=1796299913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnKchJGd221CmUhU2CN6qD0GhP92Ow0eY2JeeRWT6S0=;
        b=Rr6hppkWDCqVC7N9VgdykG/aTkuHJ+nmVgLfo+GRU21VNM1oo1DdXE+F+mIzKlAC73
         2pec1Hrio5a0SGe93BY3SBmV+WcMDyOraoxcV4SaOjOpEsn/BcbAcbE12QBJCpPfQHOl
         92yP/vF1Ktog22Y1aZXWgqTsxiFt6LD8xEee1vCsvB1kVLQRoh6SmenKuNXPvxk6KiDf
         JXiTMue9vbFp4yd23PXqE6sYYm2WkM7g/s60d7U5G1jdeMNaiGCInIeCLzNktNsJmXsl
         gor49JDMQY2OO1pdZZx73G3vwRkhPMauhoZUt7ldCWBTxqCNF5cQI6HZiQypzmwh8bdx
         qO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695113; x=1796299913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnKchJGd221CmUhU2CN6qD0GhP92Ow0eY2JeeRWT6S0=;
        b=V5gErngmjryWLEhky/wE1kupfNwQ1pfggYt5R7pSJcQggF+pX7BdDySJjlv99Wp9xw
         jGliBULUCqmhjhl/8ZCT0IPtbHzZPqlwVs9noHuSM6iL6C9PfYR+f8+BmSZRo+ZK7LT6
         8t8v7fKo5SoDKS9N9b9xAnhl+WtdKbKgLeC3XcH4Hu1Mt2fwREtB3DrAvPI/jzXOKysq
         niMpOcK4z4kUGsWi3ig1666VJpyjp+ujzcUjHolNwOhzIv9je1OmoiPTQCQk7Rdv8c6Z
         sd256dp3HVcmMyMyfIUDbKpbVVGIMWcfvMzo3dcrY3odkIlkMvTJYSfIKWtZLemyBkY+
         iXRw==
X-Gm-Message-State: APuU4Z/Ic/h/v+apiNIcZnky3iM0pFpIr1VgdgY16PZV45s6bzjbqE8W
	4dSir3HwPPkIWDPxqUpiyHIyeXYvFesK1CtaEszPWeY5lvXzN9gKa3hvhu7Xsh3PdEJembmnctq
	AMGeEwzH7YEqm0+LelhAezIj3AK6vlr94wQjRbhHEiQC+f6FylZfx3SI9rZxgKHPvDZjw
X-Gm-Gg: AZFdTZcznjnnnCb3thCUkGf5fI+4vpa4ASDWxohUFoZAtxhN3uBhNwGPEhAYtKdcHPk
	dUxy1MLLGQlN19RxrVeEK5GSeRtzrsXYGVvI6s2fSuVnCt3BfeuZBqjziaktKtrESFXkmWIslBP
	EpmwQDfCWifOgG2GViLVpKMruVmkotzGv8qEcHD7gaoMsb3Npa+6tZhQ13uY7i7T8AWLdy7BggG
	0xuiRlgHxsZK28dXtyoUNTH5XJIjI4GPznXDOi9hy7rxMckC0m+Pdnw1TdLWuh4sACj+FHWomoq
	eIrg+B6I/t0r1AMvtKOSZTmqs5BFNLLTwzjNMerjP+W8bqAERzu9PI+bV4ZilsUmxqlxHEoiKop
	iai1wS7X+tnsXIxYJKf+fSTE+JfcvfFYCkj4BFFEWVvYM77RypFUhM0LiQKv7PwWQ10gilsIizP
	GnbWA0fk//MG3l
X-Received: by 2002:a05:620a:8801:b0:947:8230:5328 with SMTP id af79cd13be357-949ba9cbc05mr3527092685a.34.1795695113391;
        Thu, 26 Nov 2026 04:11:53 -0800 (PST)
X-Received: by 2002:a05:620a:8801:b0:947:8230:5328 with SMTP id af79cd13be357-949ba9cbc05mr3527087785a.34.1795695112850;
        Thu, 26 Nov 2026 04:11:52 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm748736566b.40.2026.11.26.04.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:52 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:11:39 +0100
Subject: [PATCH v2 1/2] arm64: dts: qcom: qrb2210-arduino-imola: name the
 QUP firmware
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
Message-Id: <20261126-agatti-el2-v2-1-1ed468b4c52b@oss.qualcomm.com>
References: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX05+WQ8nKKHWw
 z93D3ihyUtSnTZs8ca9aIfB9qY7hOYZQwd52rtuGdWbXeCNYIP9kNXnKzZ0LQ33a+Wfv3QTOwR8
 fYUEU34iQ8RgaNTORdtdc6Hb3QGQNWHS4vylROC2x5CIY4/j5OVVjDUOa0am1UG2MmtbXxd787r
 HiTb3vwRvcylrMLI9yuKnVlcz8vKid93p44CEtAbqcKqfit5prB+xcCHs5U+l+WS8pg4xveRqGB
 nDv/QJIr8DvKyshJ37+2opBoBCUYNtukc+bEnMFqrzY4paLyimUd5oOs7KqellwMImi8oflcRK8
 /FMGCkPds+AiplhMaH2B1TtKbGCC1Vwq0TLjBtQUI8TXqB3bJWTzEEHBFV5+liNqoAs/6JtYnEP
 s9deOEgWZvyXK+N/5tJQKKhUVGmiMXd+wKTgoQ5WbcmRzNPPvxqkvFewBBh61skqYv0hv5i/R/G
 ONQvhL2mqlNCyozWglw==
X-Proofpoint-GUID: 0NIaXjpGMSpuRtCDMqfLGPKQ0wlOVsk2
X-Proofpoint-ORIG-GUID: 0NIaXjpGMSpuRtCDMqfLGPKQ0wlOVsk2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfXybHp4ZZKq77W
 +HdopfXWFTmeHxfxLDEo297MPOfjRd4NcUzLLVBBgenl5u48jB9h6gnDXK4K3/1tLr7cRMfQivu
 uETqEue3qH2cULPG1oFA4FvQ4YoHdmk=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b08220a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9bc6S-rvgswZ-E9PJ8YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

The geni-se driver loads the QUP firmware into a serial engine that the
boot firmware has left unprogrammed, but only if the wrapper node names
the image. Without the name such engines fail to probe:

  geni_i2c 4a80000.i2c: Failed to read firmware-name property: -22

On the UNO Q this happens for every I2C, SPI and UART controller except
the console when the board boots TF-A and OP-TEE instead of QTEE.

Name the firmware: qupv3fw.elf from the QRB2210 boot binaries release,
the image the stock boot chain loads from the qupfw partition. Engines
that are already programmed are not touched.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..f6db8ec25133 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -338,6 +338,8 @@ &pm4125_vbus {
 };
 
 &qupv3_id_0 {
+	firmware-name = "qcom/qcm2290/qupv3fw.elf";
+
 	status = "okay";
 };
 

-- 
2.53.0

