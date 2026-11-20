Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166430;
	b=FODHtHYrWDxCf610akCAnchMVoPHKsQD+81wDyFjhqiZwmrqoXkvgprFS5IMukAIEq25
	 6U7zXre1d+dUpjDHT7VsSOLF0iOV2USNbKY/dsXgxH9pQWOzExw23w38BfYhZL2zhSIip
	 3/URPDPq6XcBzy0B75ZnKaDmcpKGsUSfDiVqD+sLNZf2EtCoeYmVnsbmyQ6fv4zEJdXS4
	 g5YsYw0bpm8dITgL0hGPUAaCJ90asze6CCY7epBTr0AEQCxuVIDcyle8STiR9qm1+5ynW
	 is1e350a111ApvFbCcnPNJFC4UiZsWenLL4YOdW1QrVaDYveRjprtJ/IBb/awfQegfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=;
	b=TiaFYxPITf/XcyxyOpFBZtKlnBj6pPgpudhj3YJ4CLGWNltUGyrBws8/DGxeKi4aMlZz
	 H2bhdEAqb2LQAbDyJtLTPq+WEgrDouW8wsdmYFoP2JROo5+i0IhP7bBlo+U9rV0JHEroH
	 jRbK+4T3CnN/IIc7rc4XOgK8ebyzOaP9MadFEHM35fYIRIvAX1dieVhYzrO/2WakiTpGM
	 dt+ceSHsBv75HTpcs2DS03ISeswzADBUhAsByPwKtQc0RG8pNMSedc0rO9ToIJAAscIJd
	 2IGl8cUW/jSC2+u/rpAKyi6SXV/iOKRhv54UIhrYuPGsSnGlSQgAFKTHMDFbCYLCZDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sxx30HjK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAqBq1eC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0127606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0127606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sxx30HjK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAqBq1eC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fHmP1112695
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=; b=Sxx30HjK968a0r9i
	nN2cUmnoXw0Av8mzVOSMfRp4ONN06PUjpqFbEgR04gIGoD/LnNnXxPRLsxQ9Zq8i
	4P+unKEz3BRJ1/Pluhk5E2uw7MDuVCAxAQC9+F/esmcAwnBHl0zCYxZ9WYyHRvQh
	zq7lweKg1PCP5nHi5rWCLG5VCikm5xbXYM0hyroXWavY1DeejKB2294VGac4IpHj
	tQULnoB4SG503IpKnARyvT0erRPZDVOSpkDBlF1uIwOy0C9BwBwAIIFfVqlSDmxB
	t+aUkNkdDqWNohc+X30+8qDIw/0Z65I2ssby12ElIMQEkJcVxVV+1lL4GGy+ETJM
	cxvavA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjts2wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:20:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06750c74fso658814b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166427; x=1795771227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=;
        b=SAqBq1eCWBQT/FankBbIFETu7bCbhxbSFxTuTlKkJ2TZV5hjC5sNdpLmbScKXZw42p
         wO4OTi/1ubBwEI1Wds/s7Av33pqAE3nYGQ9sycDkZikYUQUW5ewyGzIMejXZ9Xkbk1wG
         sHbtJLqo16TzPWFY64SkHiS9nLtbDizRbavJeB5osX9pZyPFMzrViJbB5LPm7C0eDgZa
         i4EGvyq0yGvBZRWor7fud3Z0lChbPSMIPSmMTw9aGtxpdHnjpfH6n8jrCmuzXw6cuMfH
         f6m+L3TOs4yFpMs3CqnVYJ21JoGRmgjLFnq6VHLC7uwyL3K6qECb+YU7PC+/J+nPdaYT
         0oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166427; x=1795771227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76K8RMWO4SU2ZXFWs5BbTqqNkuQlMpM5CVY6Rw3sotg=;
        b=n5+pXmW1PYT5xEHpp9uYO5V2fHzbKnYAxHjUQQn9g068LTClCliVgwvg7+M9ucIpoc
         HG9kbp2j2qNGBwy6GYrNInZDC6IVHGUERfSVsPPeiwEhGWPAfnKiMHQyC7ZMQUO+CSpt
         hjvPp8u9E17tDAe8Q2OlRsnljIWRfwCi5+TUiOrPvXuRRiWm/ao1QStfCo4WEn+VIrPq
         WjcC0jIZchqCe70uz0GzU8L86Wti/d3WvnQ/1sbSrtrJl1PVgT8JveqFKwXlFDT+paCB
         IvoiMjV1jjZ7E74oo6F1g95SoB7WgTAyKA3uJfEHJqcerGkpFCteusbYlvR9ouFycP26
         I2Eg==
X-Forwarded-Encrypted: i=1; AL+hErG1KHJb3/ppZfc4nvMnMEa/5TFOtOjyn60GEShqOpuAZl0YwWUN3mev1MFbxZLO95h3xJZD+DlEFc6qguSX@vger.kernel.org
X-Gm-Message-State: APuU4Z/TSTHbQoOGZShHlc832W96D5OoHAe6p/nAta44Hvha05jSVMUM
	iiSEMtN7Yq0giQ7XFwo4avWivEmzacx0YGG/Qz0qnw8pwQF3a1gJjQsG2tcciL6DtJ1HT5LVAb9
	qb6OGyuiB4QVD7zZpoDNdRcsWc/3Mr4dk4ezOpAjH6U1MHqX6wdiUXRvJcAe/RKlivnTm
X-Gm-Gg: AYBFou2W3axp6YJKrKNSzh3omgjCEPagYJWgQvRhVWEbiAJl+DyODuO3t7ajjg+cNfT
	Xe2TUqa+7kmKd1pX0fnXRZaeJ/noDnNAu7aB1hzpjDKoIYQ5zc4LqfGyu4rTsEgZdmFT5RzgSNJ
	lO9+bCUR3H7vlVzbzz7BIarn6MHmJTnq7inyY4M7ja9T315BOMAoeMhyZbZwxXF1zCdA3TF3Gfi
	9xFncjTglmfZz/Xml3CMkcpoiwdWsd+xtc7ZOy6ZK1W8kJMASvWiljifRaEmwNtr9+vlY7SVFqk
	iwAWhVxcjVzZFF29wsaYFuJJLpYNs1l7YBN4J4AjK8ptp8crIeg1ZQ6n0TFU4bBbRgLYc9Dhdq8
	8jAsZmYTUvInXT31FjPXYQzbUWMmlmTNpaKjQhesTykUYqMqGPv51a06JXUtx6t8WtRgD
X-Received: by 2002:a05:6300:6bc8:10b0:402:13e6:58b with SMTP id adf61e73a8af0-40213e6061fmr373908637.37.1795166427442;
        Fri, 20 Nov 2026 01:20:27 -0800 (PST)
X-Received: by 2002:a05:6300:6bc8:10b0:402:13e6:58b with SMTP id adf61e73a8af0-40213e6061fmr373886637.37.1795166426985;
        Fri, 20 Nov 2026 01:20:26 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:20:26 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:41 +0530
Subject: [PATCH v2 1/7] dt-bindings: iio: adc: Add "qcom,adc5-gen4"
 property for ADC channels
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
Message-Id: <20261120-pmic5_gen4_adc-v2-1-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
In-Reply-To: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=1979;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=F3jVIKW9NilXKZEG5EHwwNF+JBuq151qbC6+MY489TM=;
 b=8ENEqOoPLDHnJzh4eRJTEVq+hTwbYAEvLcp4kzvlcSiRgRjVSn+k7VUXrN6c2rQeOwm94xhUF
 j/xnvYGUOlUC/7vayoAhBUPFpJYPfxeB1KG4OvcYZ/AhxcJRN8Va7KG
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: yFilHaP1Dk_a5pOiuZaRgLfNZ5ZdBfFa
X-Proofpoint-GUID: yFilHaP1Dk_a5pOiuZaRgLfNZ5ZdBfFa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfXznluKcXsCuKl
 96MrtQQrpkqMpJ36Z+SbGmzoscG1UloJI5QDQ/HylKfoYQk28yBhEnQ4rjZ5nmzCIunk8hnhbsT
 Anx44nLD2GFB+qaZkn85jQ/76HHqFRyRVZnRyMQ9YlYu66snLzOuhghJg7zMpF6aIV0D4SYHFKd
 zZeWgqOj7Y7hhoBJueM6ne5o5Ix8bHNHcULRSkgYLu2Vs2rF2sJ5DrJcrX94cekrBFZ0Vxg8MaS
 6MMIYxGNGXPn+7Jims2tAtH48Hmp41+RLn0xzMqkHW2t+TtkvQ4iBHsplRXiKpOmy6w/QTXSIw9
 NxY+qCapkxNqYC2zOD6Dr2JcJBR1SH/twlypqNBuBp8ZP+eWamOmwFiAX+SHCnSUCnyJBwY7MT/
 /kCAjujsSdswfpOS7WISRxHo7Ryys5c2V9+19aGNYgDNWLvgQIvfTqLwkA+zu9Kqdbjjqjcd6kf
 Ls6AdBQQA8S3xepQTZw==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b0010dc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AKg146UrkyRmMzRSXpsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX0qio98mpg1vq
 HUuG48lH8tpzQr9xihXJ9wtQi2nqfWXILfKqJESj6WNYkmsyVV+JFXY1WYs3/VF4/atLRKq1YnK
 TMMdW0B/tHsHCGyPp6EA5dVjSGD/QsA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200036

PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made for
improved performance, mostly at the hardware level. The main differences
are increased ratiometric conversion resolution (from 14 bits to 16 bits)
and increased bit field width for PMIC SID (to allow communication with an
increased number of PMICs, supported on latest SoCs).

In the Gen3 ADC topology, the ADC peripheral on the master PMIC
communicates with ADCs on other PMICs. It is possible that some of these
other PMICs have ADCs of a different generation and may need to be handled
differently (for example, on SM8750, PMK8550 is the master PMIC with Gen3
ADC peripheral and it communicates with PMIH0108, which has Gen4 ADC).
Add the "qcom,adc5-gen4" ADC channel property to indicate that a channel
is of type Gen4 ADC.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
index 149f4af8f4b8..065b82c41e86 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
@@ -83,6 +83,14 @@ patternProperties:
           This property indicates ADC_TM monitoring is done on this channel.
         type: boolean
 
+      qcom,adc5-gen4:
+        description:
+          Indicates channel is of type ADC5 Gen4. This may be needed in cases where the
+          master PMIC has an ADC peripheral of type Gen3, but some of the other PMICs it
+          communicates with have ADC peripherals of type Gen4, so channels of those PMICs
+          need to be marked as Gen4 to ensure their conversions are handled correctly.
+        type: boolean
+
 required:
   - compatible
   - reg

-- 
2.43.0

