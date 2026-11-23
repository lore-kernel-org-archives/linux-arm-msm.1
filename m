Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425036;
	b=ty7WSy5++U+srbHJ56HV5CBBOnXRfiZlL+QWsMQfalcspRXLlz1JIeiUTm9xZydpguTp
	 CSgFp9kF35bsTav4nDT9KBkBLIx2wD5tgk5Rw3NvOwmobwhLe2XGSVyginm4GSIhgk5Ub
	 gK9l/T2jA4Yo5qUqgRsP2sfzoA9nZO8L3+sbTyhW2wboj7kZN1KMJjzeE0CN9BRCDTCAO
	 G0WPKkXeIwyaQNfED/VSXEvAcVNU5gcFW5zMse1Wyro+FVJVGB0lj/8+pWDDmB7d7UMf4
	 PWPp5L/o3oec3wDWnhzREQ7yrim6kMK0LjyMzDXBW5UnESIiu5Gcm+3+YrbV4xZO1Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
	b=Imwe5cQil/swXIm3wONLTcHuDgb2PQHUJz80JUQY0Tm0D6P7sdNia0FOxNrqfT7Z6P96
	 8QIBIRoaKRCFs8pcxu67CsPh4X9IBM6ucU4oMTTIjujHjeDQe0wVa6HR63raYF95eF2cP
	 /BQOH8M3MVuVjQ5NWI0P12uLvu5bDPH9ERa8EiBu4I/4lHbeVzm/KyG8/gffhg8Q9VcjA
	 gKaF86JACCSE9AUkfziyFX81tEMADgT6x7rdhBxizzQcwQpxKxoYL4+lSZr0sQN498/fz
	 7seqFqBfR7Y7jEvwb5a0zHb10WYf3bGUMNcULBqKoaTY7/M48/wu9HIg6oiW5nNx2IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pC3tPOtG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R61Dmwgt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4F8606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E4F8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pC3tPOtG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R61Dmwgt
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6Db421490209
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bEFV+1B8rKY
	ypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=; b=pC3tPOtGbJr7Gnzvnr2IUGdZWHS
	f96cQLRFXBf+RPxdpXEsipNm1ljDqUEFm7d6qv8fk+7MPJYfNKVk3E8IAUnuSa1o
	njUDZOyJm5UiHK0nxhi27pqAd8YWc8h/itjKM2KpRu0uQBlD1XBqldrNfa/C63OU
	5yzSWH71R86HyipHyU4aYCO/F1jnAmEuqPLyaawnWyV2N3rE+FDK6A7jZOtOa2QS
	6cHQDp1xDCIQ39ZgoO8iJvSudtK/fs5MFpIy/4PIW6FfwyTa2S7iRaMcFMdV38Un
	rnk63GkW/vdgcW02twbk9LPYBmqXUzm6cPNfG49RKLYF8ttINIt6+8r4VOw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k0mg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:10:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so1543985eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 01:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795425034; x=1796029834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
        b=R61DmwgtWjbUCjFlrYqTErf8DuccdGimjPJaezallQBJuzZJks2QNszrotyFhP/MAm
         XnlgsoHOnk0VeQXADXYmInVZWbiFTzBSCAQoTLfe/+cw8Y3FiAC2AGUFwBiznkJK81yv
         3hE8s+tlMvakl8GKSBqq3/8Tq8zr1kF8RccKwDtFfSwGVT9U3pjoTNmR7wTsf2xu9X4m
         eifwXSdk96aLmMIjG8yidkwVZNk0qNrta7bJSuapRJ3BHDeOaTi6xMPxcy0L8D8lSiO2
         gAMuIgmOXgfhjpRdGCHH3mgAX42y84FwItCLUblbk2pFoKxtju+dsiUbG2800f0w9n1m
         aGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425034; x=1796029834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
        b=qbkzaijlPfHOkIjZNnfjO/F9hck5KD6IqZmAFsbb2Y03ClHD0ubsXxobiAaEymZofs
         Mi5ivwGeyYnUoor0I8ZECm6Q4oibneveue7rhvmZWUhf1unNiF1Phe//MWxOlRDeY075
         CO6orR02h/lW31sop0E0cBEGgZuZiNeKoV6yqz79RTQgFpcRoFAi/bDuwaE71l/h9rsI
         n55gQNTowVWQ5n9RluBYoLwu8vd4S1gvJv3Z4Yd5a12nEk+qkaGat7d/FdRkWrnn0qY7
         wolbLhzoRLHsWTUSp/73b84GMViBjYx/kYGThouFvldxwCxLMR9BERWE8Ke4WnpAVqX/
         XrFQ==
X-Forwarded-Encrypted: i=1; AL+hErGW0iH10etTQ3U9xXJd4KQYSomIrzFX86SLKo2LSZqv6n+a+aPSAXUoZJ/2/1O9qM5rRNB2UxaJbtut5bNT@vger.kernel.org
X-Gm-Message-State: APuU4Z+WoT8nSR8HmbnZHIj7tTuGuY4IdB8HDPxY1ySO4pmPwtT6GWpJ
	56Y/KVsUVroGv0OBz1UflRg4/FUs5V7PySZ4ukNPA4UPUnhH3/20YNslPWc+VHNSy4sqaxh4umg
	EyYAuI2uH9IlWB8+Ua3TZ+e4lTBSNCq06M/AnMY78tBOIPWfHVKWHm2l55ZYdRBy/IVtf
X-Gm-Gg: AZFdTZftzUyWHQtJmvcWr00oJE+OUWXtSVaSYMgj5m8slu4ZP7nnoRB/kY9Oio0mDvg
	ir+kotgYU8m26PMbyfpyDYeITbdPkeetaR+VSM7Tet3VuoCXCt0st9faaq5ePbAXidWYQqEkFSM
	lXVsF3k54XS4RpSLpsfRlzQLgd38U1jNvaTlVqeC1x8zQD/8pxOc1XR7uzy6vNNQ6YAc8JIEwVZ
	3uzDLMtcLDU1MxDzdjwjtbd1H/4ABxWZZqmj/WisVolzRtUSSemebQftCgoa5HZ7lZxsEhB8DLx
	vuTILivfrM7Lv6cptF2HscILAgLy0zIDq76Zz/fi0jxHTuE7/Mw7YiuZxDO5yr6hqYBCg/2ee2x
	vfGX28rzQYEyt6rowsy40a1ocTap0QyEBTbZPkEdiJqdNm2j4I9m48F8llO8P1d7QJLiTDuy2MS
	aTjg==
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr12610670eec.8.1795425033595;
        Mon, 23 Nov 2026 01:10:33 -0800 (PST)
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr12610639eec.8.1795425032934;
        Mon, 23 Nov 2026 01:10:32 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm58687105eec.3.2026.11.23.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:10:32 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
Date: Mon, 23 Nov 2026 14:40:23 +0530
Message-ID: <20261123091024.2214918-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
References: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfXzDFJBw5fIC4o
 XCcRjdNkQxydF2O8pP0WJlDlDKKIae+R1U7BHxy1XxbU9NAtbXqrYH4f40uhXXb0gLZrhJGbztm
 VMeHVAMz4HCZKyZ17XVSl/zvO9blj9o=
X-Proofpoint-GUID: WYPtaBgQfftYbDT1E4_iWT5XecGct5Rt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX05XMhdvLbh5o
 D5h8cf8IKoMyTFxg89eFWux08C97qkPKpLr+r4OW2C57EUT0ZHELHqDhkM4InkLAqWzW6aFuu+G
 s2yjgYb7/Eb2Qg5TM6JL1i7wLz9sB1WQmXvBPoiDKhFDl341bdFXWoD7paF6UMJHFbrfZcWV+ct
 msUuRHF4jSo8AzCdNoROtaeGz0NYQAQvJijMeDNxrP2ZBuK31xEMsNSIMv2JVWz8nLEIyteH4uH
 v9s+W6nUfSnLqsyXhzaTj3Vw4KKNA7gayj3MN58EMnv9dFasQtu+ic/vjOaVIXGI8Lao+Z+1eQs
 zLtv3ti4vyWIS09x/cxbeM7C/JS34flUv9qZtDjHeAYOrShvL3h4wnNuA/0MDMHBE2L5+vwU4Ln
 kF+gMXowjhqUyOUwj9LslsFxjXP9PDft7syLpYoMeNfk4KLmvTdTOe6zXqSd4haDSDCr1hpYPq9
 bw6no17az9wdLDx1n9A==
X-Proofpoint-ORIG-GUID: WYPtaBgQfftYbDT1E4_iWT5XecGct5Rt
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b04030a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=kY59nFXYWS7NJFzbzp4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230036

Add the optional orientation-gpios property, used to sense the CC
orientation of each Type-C connector on boards where the CCGx chip
has no HPI register exposing CC polarity. Entries are ordered by
connector number; an entry may be left as <0> for connectors with no
sense line.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/cypress,cypd4226.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index d923ef82ecfa..5716c045d87e 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -59,6 +59,14 @@ properties:
     description: enable IRQ remote wakeup, see power/wakeup-source.txt
     type: boolean
 
+  orientation-gpios:
+    description:
+      GPIOs used to sense the CC orientation of each Type-C connector.
+      Entries are ordered by connector number, i.e. the first entry
+      corresponds to connector@0 and the second to connector@1.
+    minItems: 1
+    maxItems: 2
+
 patternProperties:
   '^connector@[01]$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -129,6 +137,7 @@ examples:
       };
     };
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -141,6 +150,7 @@ examples:
             pinctrl-0 = <&usb0_intr_state>;
             pinctrl-names = "default";
             wakeup-source;
+            orientation-gpios = <0>, <&tlmm XX GPIO_ACTIVE_HIGH>;
 
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.43.0

