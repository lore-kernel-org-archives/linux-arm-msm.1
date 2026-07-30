Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA958443AB8
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427247; cv=none; b=R+iotAO5mAhCQNnxVXseeFFFPmo/EVLu/nBEVctAhex9xMPh8/VgcNKIOZmTuEolGmEvoJX00O+WUpOdVaYESzWPngMjMej46CvetApbfqe8Lsu4ii6iTkjk4DriA71MdC2nAqU1fitJQ+jbylSiHv36+185eLXAYCM2kPIC77g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427247; c=relaxed/simple;
	bh=k3X2tgRd1gwg/uwGuGSAVWLEEcjC1WSvGA4Lio2zQzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dT6xz4Efu/FrC3/T90i/mfQTHt2IkFYWG76exWItzGF9wR6+XtSZxScWNa0tnISoVfXvaO349YVygSZqOMRs8ew/XiVOFQMu7s6UILm10QDUIGUFwMa8k1zC948eUbdFSVTwuMa7bi3/01+qafqCZhowoYWPRs1gJykIAoqV4OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQ/naMfJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwzjeMq6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQ/naMfJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwzjeMq6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQsbq1223250
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hE5vnyYn1cQDkxfnxwPBASs1NDxIF0ypO5EEm3REHf4=; b=aQ/naMfJL/eXOSkY
	sW4u1BsAtcWL4xBVIXWzOT4Y5OjCS+pcvEQoAayCe4obG9b+yJDKdV8HcIuPeyL8
	g0moUS6y0529FrLk4p2d7OYpHyAT6CZiRoNJHQL/odMCeNjb8kZu1MEXEANETa3W
	QXJc98GHfx6AL/F/8cOsjtJQUD32au1niPzUo2HT3GUsr8EOYJS9dlEgIm4MRfwb
	e8O33IUym52qZ48RHx4dBRj4mlVCQz/LzhYUTN1LD4+4B+ryFTwzPZF6wRHv4HVW
	qhcHL7Sh7mlakv7rTdEbKii9Es5IPyOvUTZLgYG0rWm08ZPiMUJv6hk+AbWNOH9q
	OQkJKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8jmrehf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so276352685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427244; x=1786032044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hE5vnyYn1cQDkxfnxwPBASs1NDxIF0ypO5EEm3REHf4=;
        b=EwzjeMq6cmUUmGqh9bhdgdUu00wcQNKosBwFYuhNLr06CDJYFSI2OFeMsnYeDUVSsy
         NZOpxhHKYC1N5xdi87X+6Z1vey6yB5s0/k4kfkzOq4S8xtfYHMOBRIbMcU+YbcMQrpaS
         +vC5NWJHvxBLcvCe4uJvfjMP7rW+y/3fxt4L0oj7U+UFU8L5AX01vqCeZgfXxik6mejq
         uazsEa6x1G0bDojk5SIlZDpANfC0/EbE/mY4x/DzsGvMOUm8GMfbAord/0jP9N3huIhE
         0YjiStfw5KoHlnvWqQIX2XMi3SqQhdHVY3sRBVWtGAHt8VVjocSRw0kweUWS7ngc2ykX
         emng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427244; x=1786032044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hE5vnyYn1cQDkxfnxwPBASs1NDxIF0ypO5EEm3REHf4=;
        b=pzAHN63dwNrMnJck+9oDJZx1T5NIxRQ9wu66kvp87eViBpwysiM8WPESjnhVI7E6pi
         69two05uY5R3+4S+x0ddQ5wVOu7kidVe1Cu0yjwStWwO8q3C5VaKCSvpOui/1dKOtkdf
         lcu13tBZ/NNILB/DXS4Z0DXUdW99X+JUXp+n8SvY8E54/uZsOY0fXieVlMw7F2dWnDCr
         K4Yx+UcDKapUnqZjA73c0tLSi+dfgzzFTDlAhD3EGysN1Qw3+M3N09qLUL9bcHrIWzAs
         2aTEsGE/ut++NsQkpBIsyh8sgISWM+QD5qJJHsfRFcLPOC5KjCvLTZHUP+fvP8jcahtb
         chGw==
X-Forwarded-Encrypted: i=1; AHgh+RpcUyBYn5wRHmTUh6ou3pVM4yn/6pbYbHe+NSJfY9Odzc5cyCdqHrL8ZwuZuRuaTIok6GmAss4JhtBrTKVW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5jL7NwRWr0TMzjuRvxuoBAG7AIby1FGwqYwWnkPA5WhBd+fKo
	bb7O+b0Nnr4z7KWRt5OleWjg01Uyp/wNcCnZJlgyslqnoN4qt9wKKEZgNEqsfImGNBp6zwiGSpv
	l8G6kt9IVSKq/hW1K5AV63gZr46zbmj8nwOykxDcH7dItKtWoEEGc9Qd8baYTIys825V7
X-Gm-Gg: AR+sD13qc2kGqG0x1sTN1jv8MPRS2HXzsK306C/u3oJ7rvNk+aJhUoWpI9I9V7YrUsE
	pka2b4yRNcP+vVDiyxdK9wT9XFh4LGy1ls4LZxA7+/+y/49KoqthpN+laa+xn6mUhTIEuDXf3NQ
	GdvcMWSQD/kxtm/voeqm9RgBArW9Siw11IxmR9Nq/RsFrJv1PjKKQkd5DmZsW0Wfc8XEhm+PLuN
	QSt6u1safbaVwkRJ12qgEjFQNGL3q13sm2LOsmZLkWajGyOGjgT5AC6uGWDXKltvgo36Nn0pk6q
	vINe2Nd+L4Wj7gbKD4Ds91l4ASmWQ70UyLwdwtUnCDlHKdPiqMguRZqTmKXPC+eDUV/jpyNsIBZ
	iCQOj1tYlaZC0yfReQgKf0v2NCINbDjT6UUOjXF9mlp60X612JrJQc+IkMmjVinsMwyT5/e5x+P
	c8jD72US05VdsarYvhLdNNmpZYIdg2Dfu/uxFZWHPy8BCI6gZzmbtF
X-Received: by 2002:a05:622a:58c5:b0:519:efea:cf41 with SMTP id d75a77b69052e-52b384abc72mr32749371cf.28.1785427243009;
        Thu, 30 Jul 2026 09:00:43 -0700 (PDT)
X-Received: by 2002:a05:622a:58c5:b0:519:efea:cf41 with SMTP id d75a77b69052e-52b384abc72mr32741231cf.28.1785427237652;
        Thu, 30 Jul 2026 09:00:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:31 +0200
Subject: [PATCH v9 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=V4tNF+ni c=1 sm=1 tr=0 ts=6a6b752c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _MBSTLyj3_0mUKx6Q1cNUR6Kts2Ptnu8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX2LkpcxnxZjPG
 4qVEs/cw2hEltRM//wdDYW7diSaJsroflscWHXozwiALuSFqjyq2lmNQ07I/R11fmHhc3vO3RGT
 GkGO/NNc3RMSBuhkenwY5TYegIXKSEv5+9CAIexkXR/tAmb+MBIunL+Q0zkiLtrriGaL/9oB9by
 OU7tZhaj4JOzGUQQX4tS3tJ0TU2viRLg10sItbpO2XOrX7MdjW75JdWG9QLPNmDM1kqFojw0yP+
 DLwfifbWFOI0DmlNJRSORgkCvjOE0qhRr4GGQoIVdHbaV57L5yRGGYQFezoU1X3hhyV87f8DWKn
 C8WYKf/xYzdcYoqhUtyhzjCe8eTIebin5YMMxJlKTqnOYOZ2zIpQQMRZ/HKP+353XfEWkpsrpFs
 R1bO7wCO/XkCFj4vHeZDD27Svg9NH3Yl2+Z7aFjVJliSqUHgPYybTPo6U3HlVxKRq6lGRKBTaUW
 5BAbuKGmid2bMaybu+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfXzJUU8Qt7SIgS
 Na9Y+wqsaXSoAfFL6CLclvclSXA3Zff7hwKinhLEIekf0XllltnXrbh5TQB8lwe5wwKRL0iLsFp
 6inQr/fjxLmGY1+QIL4XY3whPDZOA1g=
X-Proofpoint-ORIG-GUID: _MBSTLyj3_0mUKx6Q1cNUR6Kts2Ptnu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

Allow an eMMC hardware partition node to describe an NVMEM layout so the
partition can be exposed as an NVMEM provider. This lets a partition
(e.g. an eMMC boot partition) store device-specific information such as a
WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
cells.

Accept "fixed-layout" as the partition node compatible, in addition to
"fixed-partitions", so the layout can be described directly on the
partition node.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..0422894508478c8d0ca68292b58a5fdbee218358 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -38,7 +38,9 @@ patternProperties:
     properties:
       compatible:
         contains:
-          const: fixed-partitions
+          enum:
+            - fixed-partitions
+            - fixed-layout
 
 required:
   - compatible
@@ -86,6 +88,25 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                compatible = "fixed-layout";
+
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                mac-addr@4400 {
+                    compatible = "mac-base";
+                    reg = <0x4400 0x6>;
+                    #nvmem-cell-cells = <1>;
+                };
+
+                bd-addr@5400 {
+                    compatible = "mac-base";
+                    reg = <0x5400 0x6>;
+                    #nvmem-cell-cells = <1>;
+                };
+            };
         };
     };
 

-- 
2.34.1

