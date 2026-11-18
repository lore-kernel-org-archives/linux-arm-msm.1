Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016016;
	b=ZyyrWg2qsgZuSoE39Mt23Szk0xZDZsV3Hmgw6sOG5oGv9RjMGkbssXpUTa8uStiFyDF9
	 UGUW2BA/iyN22xFFW7wlWkS7HL1UrdY1VNhpqcDcX5futm7JI718S7vYpYHjXpMRPJSj6
	 rGOHKFxKhtNtAxRtHpANRiGK3UilU8kiLpL315xmBci57SD0hckCliUXSy4qEvyDSlRbq
	 6X6sN3FLRl2QfY6a6wS9T62YscFnm7u2HMISOkNafQj75Q6Rf9kzQHvnvj2i1s4sjifAI
	 wDvaNJ6GNhY8mVY+EItMoZILoZxiXNtZRE9HkkBo4eayscFcMn9e0S7+RZK4drG5KCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gcrK14QXcprLb1eFWYrCgzQqBs9lqFBI0fblmJ2i3k4=;
	b=v6LWb5qcOXY3UVc7vpDCfBZu8vP2ifnus9Ybp6qAQaUEBo7q0rJAJUm9WvfcaxlMonbC
	 fVykHDYM9DZT4w7B26OR6IxuZTMQfaQLMFgw3N4YEinp7zcxn+igf/gqWYb+gpNn1zu3o
	 HPkPeenKu8eZ/QYXzBuKMDECtXedFh1GJ/uqLqpClbRFJibaimJSqYp8UEaeaGnkKkcaz
	 luV4sPYGdMQsD2oJ6GBEcvczrCm/i8zT6RZd3ChRKRBinmU7552h1cF6pp629knNGkU6h
	 EO+7bkZEDSYKbRNzZnGuLDA5QlZlFMkUcgQKdUG+44BdCVNXN3DfqHYY8xtaNsNd8Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxKwjpkN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FScE2MRz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AB3606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2AB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxKwjpkN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FScE2MRz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQE0A376689
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gcrK14QXcprLb1eFWYrCgzQqBs9lqFBI0fb
	lmJ2i3k4=; b=CxKwjpkNnk+PLK95plkeuv2Q70+w/UHQs98aV9MNw4JsOOdJvKy
	E74BfEn/uUZT27Me2YvyfKHnF8LBaDtWSNrqseXYgn4rLjf+mkCdB2N5vebNvAJz
	RHVtPKQ1D5zeTvd3sBL4/epKq3haXaAWIelxA6I8+B9lxYdoHP2KA7mEsiRfZAvR
	X4aBfcArZvJTNfVz6Q0FSlSRNV0YqO4fzzH7xlfmF0aSn5YL6haua75HEgDF5AQu
	Px6Cb8wxJPQKJZ6CiIK+IHzLCppSAtM7KmGVosgX1U85Ycb2Qpg8AKlCdo/9zwLw
	M5xVNyteu3wpEPNeyvWOAooKrj4ll2vwHCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9kqf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:33:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so210628985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016014; x=1795620814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcrK14QXcprLb1eFWYrCgzQqBs9lqFBI0fblmJ2i3k4=;
        b=FScE2MRzf2qV7DvJdfNkU3pWI4Iysf/jCXHVQT2wYjiqbSvXhktQ9gMglN5ZYB71dN
         YqhGQF6oANO4Y2Xo0szMSWcygN+2JI+JeAzOZZcqDy1Mfswf0QTpWJAwVnZcVAhGwY/l
         AqDsD/JVzx1CNuxXNq+tbjK15UTi1lkV0WsJMdkenddNvq2F/WJhgxB49i0ob7w/1FMk
         AGMz1CS4m2AltxXBzg79ruok05eR1DFWpkQLZh9wgh0r+mypmbGAwfggQudPoVpPBfII
         CrUh7s6PkH/BCZQcv5vKVQaDBGro3KkDjERV9GJUzo4xBCDy9e/A/JL4c4UIdUThDilR
         7oOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016014; x=1795620814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcrK14QXcprLb1eFWYrCgzQqBs9lqFBI0fblmJ2i3k4=;
        b=CUhnGpZk6QJC1ECoDtnYMc4pZvFae3keh2Y+TL2Yswb/XsPEm/Pbva/OwBeI2hOhPA
         zs/IhTRaheq+1cU9MPF4z7hIFrT2OtEKEH+xXrNQACUrCufng6hYRaZHQKTnzqg6LNyT
         2auXdQdsO0GWMCT+zGYe09Y7XrMe1zQr+3TDuJQkXpwMXJOQu7zHlLcAgIEwGogsy+8z
         wBYTgOHM3wlbqJzWIuEYJYYAnwrTbSONSQiT0TFA2fQDGup2EsCWXLVwLDPZNOox5TQB
         1jNcY3wZm+i8sZt8fTsnLXpuXaTC+HxkeoX37nfG98rc+UYpMDruwVun1rvOhD5HIE1p
         2FOw==
X-Forwarded-Encrypted: i=1; AL+hErEO0Z7HhM5L9nDifpcqITeKODsur/I28rZJHBjzp9Q3JKUob8r2NRnw/v2SF1Dt9R00/M4aVOAFy5TaOCX2@vger.kernel.org
X-Gm-Message-State: APuU4Z9CMVgdxam26EjtLn5/T1uOAZNleDzk9A7RTGPhkVcEjXBawjRB
	wM/2dJ9naLD9FB+UZsqw1wRxvsiVSIHZzEUPz0aJVGikELtESEJTPCLRC5kUSI3vJESOU93r8n2
	hM4e5YBPOrC8bQ+ASG4Bdu7fDSxV90uxFUmQBoShyFVo0TEXg0WStJvSpaM7pQqGTpAoP
X-Gm-Gg: AYBFou3v/tHGV+J68TxfCXYxHDVMqxuiLm6SbI41689ON2tLanBb2oNxonkbtn+HBC5
	BBSsefXsh0uOghBRXdvxBdoZvH5Q+gd+MIEhXXh+HOIFjiBYDxZpFU2XqFhTRKm/Fmrp14BsqO4
	X/RAZnYNvHIWTa7f2QsPQJ5HxB7l4yZ9z7yKPtKNx+6uuMz8upSYmQ1BIoQp2l4H4mYZnZPUUYb
	YHMzZSC/OEFlerCwtkE/NEWMyxJvjHt/3cIUWEA55yB6Bf/wsQi+Htuq2aFppqG058Ef74Y9oSq
	q0gUJizmIuYcfWolfIdysM2W18QXpud7s823WQCdSZmsQcYKCVRhZvithwLvJZokV7WsHkM73dP
	yCb7dZNyKor8P4A3JzaEgc5zD0HDuF6n8ixxIHhs8VyCx1Yt3Z9QmxsY0
X-Received: by 2002:a05:620a:1a0e:b0:949:7c43:d567 with SMTP id af79cd13be357-949995d321fmr526674285a.50.1795016013774;
        Wed, 18 Nov 2026 07:33:33 -0800 (PST)
X-Received: by 2002:a05:620a:1a0e:b0:949:7c43:d567 with SMTP id af79cd13be357-949995d321fmr526668585a.50.1795016013174;
        Wed, 18 Nov 2026 07:33:33 -0800 (PST)
Received: from t14s ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2aad96sm61034995e9.6.2026.11.18.07.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:33:32 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix touchscreen power on
Date: Wed, 18 Nov 2026 16:33:26 +0100
Message-ID: <20261118153326.12640-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LrVIJpeXMqCzRMwnKqP4iBqINiinsmyA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MSBTYWx0ZWRfX337Q4DJ6IG8v
 8tj7Ry5IOlycuqvp1YEmsMs38pTY17My7u02Wy4OnPqLXQIWVCZnxw6e4GI/2yMbOrXy1uNt8I1
 dDrRo4x65p9GUxnBLHlZtwXZTOpQyMQ=
X-Proofpoint-ORIG-GUID: LrVIJpeXMqCzRMwnKqP4iBqINiinsmyA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MSBTYWx0ZWRfX04C8w+u25eJP
 HfTEvssEZ3kfIH1/i81EPyfZuSXeAvbDG+PGVJV7vPCft+mvheuYcXPt1R2ABVEFi/h75dgRf4Q
 g+GSIc02BxKDSzky4uGS0SwfnQQTLY3KJw4ynMSQWsD94dmAoCbp8/DdeC9IPpoFJYKAUUcwsdc
 BH+5pL+y+SwS9kw255Kl4Q8G5c5nTyoo5FffCy4oB2oHLJMBV1lrb8ffTRzHJ51jHaPzNnGz8aM
 VIZNCqwz1P0owktnUi0oDL4HqbGuQpKw+4oEhUaY54SzKe42noWObzda1Pz7tItqXZr251ZQUDD
 fBATMhzrs8Pgnpa18AgbgqdwJstmwBTECIq3uEUIuFdxjNmqxHiSJPeqfEt3lFKeMP5QBIo50kJ
 vfn+iEnkCEruM4yIzOT4AwJ1csexN6EcseZE/BMegfOBFT2JzVvOMpRQlJr2DBl4GTKBD4YjadI
 of9NRWViOv7LCiyZIUw==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afdc54e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=rYM_yondQcVyUL2waWkA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180061

When the i2c-hid driver is builtin the touchpad on the ThinkPad T14s
fails to probe at boot. When the driver is builtin the touchscreen gets
probed immediately after being taken out of reset. At this point
the touchscreen is not ready to talk on the I2C bus yet, causing
the probe to fail.

The touchscreen on this laptop needs a delay of 200ms (taken from ACPI
power-sequences) before it will accept I2C transfers.

Add a post-power-on-delay-ms = 200 property to the touchscreen DT node
to fix this.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 7c9424248120..16b25e596f0d 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1349,6 +1349,7 @@ touchscreen@10 {
 		reg = <0x10>;
 
 		hid-descr-addr = <0x1>;
+		post-power-on-delay-ms = <200>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
-- 
2.56.0

