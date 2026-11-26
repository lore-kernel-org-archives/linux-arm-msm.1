Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693069;
	b=psnrxKMyb2i53QT+R4Qsr64mRzZqLi816qnGUUi8E1Uwx6S/B7mbWnT5ZEd5ISdBau8N
	 WoQYzz0uHaBsu6nu3mZH2kMiSveigY1J4fNci96rCK6r10HcCrk9oqXmVM4Wq/6XgKCvn
	 nk2SMJSjSjjPC42L0Yd27xntVZNOHkHVFPckvR2GoXApxs+KF1ALThk4s7wnfBSmt5n3/
	 Zg8ttknrVGGwj5mXi32cZEYvYuTeKLQATbc8Nxq1BwbhSoYIgiojj7lnxx/27Vk+5lhkv
	 49fVkxnmuGZHA+9+JDw74WvE+bqiulV/+rtC5OPXdbNtAwPJ+9Cwg+VlZY1VArRY29Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=;
	b=rXrVVswxt/It3770F2+WGmxTdiHCyKQDR2TvpPZRlETu3SeQpT2W+fD1rT2LJyB5geqH
	 eEP1wefV1QfKbAorg17r1tzwNZJ6xD7EA5Eh9OLF8ADgWK085rN6Z0OhI+DdbOdweSz7g
	 qbvAWa4RrUKuCFhPr4aFv99LGaNGoNbCxNfEN4b3NpFfkmsNo9EqHTYdAPzLtsgy8Ozua
	 8AMj3/VFDvSNwaMzTVYEk+LnJ2C86tNH4PkQHhN5+Q2abftPZlAFt/AX4SOz877YiYB5g
	 xomJHFz+tyZLBdjbeOxTVkLdOKqqODFx4HpV90s4WZValyt9P2vNsbnsbRViCpsRBFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AXrIv5Gz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ARrkrFxh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB427606A337
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB427606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AXrIv5Gz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ARrkrFxh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVbBm2263762
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=; b=AXrIv5Gz8xeLTr/P
	16C6KVD3hjLVUUicfD96RUkcXn0jLCTm6gP02Puti68CDEVli60R8A93EURcJlWN
	cg9ent/Ier0zWYVG2j0SZ9ltdA8RP7/raqEW4Sc+jFbIwNX8P37lGQVBsoKVz9Xx
	7iYX2DSdtf8D+1Y0TPaXbiEkIWyU34we6k6ISzkDPLWqoxPaPpQJAK4KBALgaJv6
	HsJzcc67E6mrhdRRDFw76aeSvWT+OJzQX7CLdxOtt8NtEAjxSUM16ja6Ks1ggb3O
	ddhefQytqkOIV5svPS7RrgUtUweUsAtZIQy5dYg8jkhiwVcs5TSyPFne9XbrbHUP
	LxEF9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekx7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso539036785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693067; x=1796297867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=;
        b=ARrkrFxhxx88VZamemwQPr8Lc8H6wczgJXbxpkPKJDjUSloCDCBcKimQs8QBuj7MKY
         C7yxS8GFbEDcfMT7sm994rlkGcUF6b482Y3HCaEcxB7g6PkKATHGHyHCahgws4CAPcDh
         KwM/PFwRDsdzplYLgfTfxAdR99NM2+dOH9cXHi6OMwdGBSf34C/4JX6HZsBgewuJsS6o
         ttW+uphbX5RGZYAYvLHgvNFVcMFxegdOk0Y/gqeb4mQj0Gmo162DhtmJ/5XbOIsleJmd
         dOFS8PFH2kLcDjkeFx/UlZ6tlbSyDIs4saeKSBguKnuEcmZ5g3uVyHJS/kkfgPTDejen
         JO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693067; x=1796297867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=;
        b=cj+x7Cf2IKjFYhQoDWj59J/YeyCwEazjeEtFkU29AKXVK2Id81Wq8A50uJss5g0vbD
         lxhm+/UdJSnhRqlr/HzIwmlHGpQdaD1AFCFVN0YrZXRl3kOtv6UaCk3JeUr02DF8U5UO
         QFMYlroWgb4kzdLU/AkbaFwMzCkqer7Tw1ize+63DC7CphhPIUvDZ2E6+ap2F6CBryyw
         R3662be05Y18cCjVu3c4vHzx+6Lb57H9U7+apYCgYfwIknnepFVATUiBmciRqSYSyxX4
         xIg8vCFTsnl9fqIsEQczQ0Q8DaKs5ofljx6N6JVK2i4/MPMxjFTiEWd8UlzXY4Ys+civ
         +W+g==
X-Gm-Message-State: APuU4Z8B9Ddu0ST8aKbkfICX0x0knHNXBocq9E37YP7X8GhAknypugOq
	kDGh0wUWlbrThrb4tfvkaFEL5pxcXGiSwcuij6OWUcHebchmKC40po7izgHO7K9tMh7MNEaMcND
	zkDhnnd4926raJI2yVcdvz80YrKFgK7vCvRGcYaIAjkHuo9tZCUiBl2HFWEsG4mCxSWGv
X-Gm-Gg: AZFdTZdEpwbYkWChBfU40l9LL/+rQW5Py+sJgHKxrJZv3DNJ73Lo66oRs6MtskD2IH2
	uGj77VdsqRH0+1mnCuHGK/Vny/doFhxnskQ3ZWbPKG+Oe4IOgM5SHVm5mLrM5jEAVfhnEhkxcWw
	TPURvcfiXP3U6VeOr75O/029tKR4IJfWt4KOlXCe0uxxsaFffAobApahaFeqfiZS33kGuWSWmou
	ajr2/sIJC8yyxhP6NcZiZcY6T++gHq4WIQmMhuwtIwA+iFvxsPqZVGM4y6uMv7bWaFsJUqMvIRI
	XGL3xdq2CTpEyTBvgY+vNFW0/akbMuV3mkaj/ghV3HXcCsLKSF/Ia+HZOoDme2zXVr3YZQnOJp0
	HfQ4v0WtsHS6cty+dvWwojtE8SgruXZN+5mML5dz5c89/oWVuDj/b5AfmzpYYxGzEVIpXTlKiO/
	rYui925FogAkim
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr3486794885a.77.1795693067261;
        Thu, 26 Nov 2026 03:37:47 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr3486792285a.77.1795693066781;
        Thu, 26 Nov 2026 03:37:46 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:46 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:36:47 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: qrb2210-arduino-imola: name the QUP
 firmware
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
Message-Id: <20261126-agatti-el2-v1-1-4e25fd64f198@oss.qualcomm.com>
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfXxTVxXm3b9FQV
 9a5vrOapKnanYcw7GH1NTJ2PaJHDE8285cAQ/yV65jt7frxUXdGla4xoH7iPes7PVj7KMBuYKIv
 KALQs859WgXZPKS74/ReFc8c3If8SjWWKSoAgxAq69LFyJscdiePWo1dXX2md7PtXNp5jIOKqM2
 3lcSfGkqAGtWPlkt4oIUfTvkwYg5jvnoNrDJnZA0by5xSWGTqz651I7kIq07UMC69H+4bj97ptf
 lhFbPbS32Ja3RL7CQO4l4bj+h/2v9bo27sorJpWOsL5JuLocQahnyua9CWTliddll2XUUYnebGV
 nS2iwlc980+rQG4CsArPHMNSj3lbnXO0if8DTLaTGi6HkuqNf/+uj3in+zGUCaKq9kd+YwAQhAO
 ioHToj3lYuT8KxMnicVsrS3L2F/k1dkNOZcLKpvVqIPeOzV+RUsN+yH17QKKWLauaksAtr3EvrX
 EaLrfpXrbxsNDtNxrGg==
X-Proofpoint-GUID: oRhBbJ0ZA4tY5tKOvswbxOGsAzUpWP5F
X-Proofpoint-ORIG-GUID: oRhBbJ0ZA4tY5tKOvswbxOGsAzUpWP5F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX9Zn3iX4iKXCW
 eb6axA800XzJ5rGVK5BNJpXbf7CLmFByqbC8dc4GFEWtPeedHSvUu0XuJA9iN0Xs1vvubiniWCi
 UFm/3kZScqIy3/alfPFDLOeyq4x7VZ0=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b081a0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9bc6S-rvgswZ-E9PJ8YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

The geni-se driver loads the QUP firmware into a serial engine that the
boot firmware has left unprogrammed, but only if the wrapper node names
the image. Without the name such engines fail to probe:

  geni_i2c 4a80000.i2c: Failed to read firmware-name property: -22

On the UNO Q this happens for every I2C, SPI and UART controller except
the console when the board boots TF-A and OP-TEE instead of QTEE.

Name the firmware: qupv3fw.elf from the QRB2210 boot binaries release,
the image the stock boot chain loads from the qupfw partition. Engines
that are already programmed are not touched.

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

