Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468028;
	b=XrBCoGnMUIimzNAdfmsOWq8vjUjWWhW+XuQM7g8iIIHZ5Zi0ZUq5dCmxP6NX4xYVI811
	 NGMDRNyGp1wpRYlT2ha1jQfkjCi+Sx+yTm1fRcL7n3QuNa/m2BShEqFQRZkde0bH+tXSm
	 q1wJnwyIzU3tLZ2EhQCpGxBYXE9+KTd72xFf+1anDhNWFJU9YzgafAYFJAaEu4ebWJGBG
	 Ijwcec97Df2Vs47SoE+QnlpLb3Ikq+zneI2eNkImqrQLxBoqIY+TJ48XCIb9P2uc4Dj1s
	 k8VKIFPhb0IKIazgxWWISVnvUfQjowrTo9x/2XZuDFW46rNb+HIjjzgyf5NgyDjT/EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4qfL7piDG4Rh9USRDzIt+sOlvyefKyWytxUWwXJiZms=;
	b=Pxv2LaHe8s1TLRNOMlo6Y1BO9J1In3Iih/4+26jDegMnZds5+H6TuoMY3heYrw5FWVmT
	 iZ3ZfsnDC7bdVlm5c6VjUizc2vG39uhk5D1GmlQSpOUaCG9Ki3TeX4BfY+B96P2IhXgMI
	 YD5HOxHBuyFKCsIcTzO/N1hzyvw+8oB88ttiykvUqWVLHjGy7cNz6SUn+4YI4zU+it+BQ
	 LH6TvxiSSbXbQpcq1pPDARPmNZfpXsflEC/57fGYPuw9MKlRLAMyjIGxQdvZDcdP8GdI0
	 ahVVK3L3n3y+rtF+WVC9nJDnIqAq7y7BY1+7b/72tMMXa603Efngvjp5DGbo9CBsJ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o7kINskI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnV54P4z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFD2606A89B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFD2606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o7kINskI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnV54P4z
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5nhqq441763
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4qfL7piDG4R
	h9USRDzIt+sOlvyefKyWytxUWwXJiZms=; b=o7kINskIVSfsohNxfhtPNksdu4R
	nwr4fsYh+RohlDcR5574SVPu4Ekm8w5eA/XkoaxitHR0S+qnfgXlNrwQO5P2JJmw
	twkMcpVrjKQllZ+if7BAw3m0cO4WvskP041LRMGPzMoFWobpOltVQlGx+aawk/jS
	TO6FvF+RYnlOw11m0vOZIhhoMhrYURWk8h4CePPNdSJzxt0lxEQbJH1mDtVLhHfN
	BmWuTtLClpEO380/+MTCI+iCU0sRFC+bx5ahid7OWjrH9Ip2/IeP5UjKrrRrD99T
	XBPeLIO2fg0sN+kx1cqcORzaA48SpQ4Cc4FrFPluFxQNrk9Gt/0wjrAuR6w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0a7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:20:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb8957b072so218349a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 23:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794468026; x=1795072826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qfL7piDG4Rh9USRDzIt+sOlvyefKyWytxUWwXJiZms=;
        b=jnV54P4z9Mcv9+V/bGWAEKREg6X6KACNKWBaR5cqKYMTzka8t9KMVpxM9cOpU0+K7o
         ydpEOKxx3dudASJEhuixpBlMh2W/LEa19Tvt1RS3Zy6z+CmeITZ8HlgFtHG93fYCdWNL
         Iwu/UkAIeASSCOwCL7KO1gUX//PL7rNJHG4+vK63A7d16zxYz+HeFo9K8DYhNHJQpuWF
         jJFnc7cdfHt3JejM/icNYfNn4E8mZRpw0CBf77Lx17CGfAVtzTS9WffAuc+4iTyyDItX
         QdEieO6Z6uKLbSxXpERnRgrK/lVIq13AETs8yjtC2BwcUixk7Jfo7sOxfWDfQ0VriCN9
         JM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468026; x=1795072826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qfL7piDG4Rh9USRDzIt+sOlvyefKyWytxUWwXJiZms=;
        b=SpaprzOl7PWErnQI9sMsawwAmejycrmsKawPTw34LgJp1eyddcJZdOIytUXAmim9PT
         MikkeaGX4GvnQk9H/oFHEAO5YW5Vp40jYIXBCItAETl/vggZ8kva6bL1mmORjyTLjGw0
         0UaV8D2g7XH3QgSUMf76zKR8/df4eZGfjpIcDG43NRYHB6so2xgwxYyFd657qoEcK9eU
         LyDGE+bHuutYmiqKhmqV2R7j9XMQndiQ7zW1jJE7W963lB11DMdvJmb0GiCxzW7wLFv4
         /SveEawycqWJT5JvKd+e5UsWAmgjeKBwQkddGb4LqSC6oMzF3oDwVdkAS9ktyWwqkPR8
         JnoA==
X-Forwarded-Encrypted: i=1; AL+hErEAku6YLltSxhR4imTFLAiWP8cjYKNv7tTc3wh7l4ykbiaHaCQrASEl9rdNdtf0K/NJf0+7/OCQg6nM27++@vger.kernel.org
X-Gm-Message-State: APuU4Z+5oiT3aoo8vLSxGRpnpUKmP/qXdabXcYp5kz124m4payFA73tY
	JfUBEYs9o1Y3kMs6zw3Pnw+hpCe+cyBgGf+bGFarxZ7SszSs11J2vTEDj1lhAlTrNDvjjntYasv
	UW03X8ORI/TMBMHdKiAYRadutAtS7+5eqx6wmCk/KyWjT6DL7nAvpHvM1WeIoMT9n+0z8
X-Gm-Gg: AYBFou12PJs/gPLEb6UYqCLwRlmcUjZHudEg+38/ySR/Bf8e0kV5omIw/2AR3YeVA9K
	s2lcwf1BQyP5eX/GtzQHQS7pnHLBH7FykWdguLkROvX8TnARBGuyCqp6nBZxtp/xVKlZRUiVKSa
	MsN+7dLXQK5wav8RmwvGvgC4jZtOU3bUqlpmRDBJyic+6WaTmFZEZQhawiB8m6H1qQRr0RkkO45
	/SwhfhNFu+ZGKCe9kB4odOv8GThtTURfBN8AYyUnab7m1oXHQ44VVgqNy4jq4cwzN+UO9kjRPCu
	KL6WhGUBX5OTRq3yXqRqMPljnncjg2TvU9dcm1oZaAiDJE6AZPEMDlieMLOp2nA5qsCPSOHZqZD
	xf9J7uw4/6BMswMXXG9HQkUnJ7OcfnVuj477BoF0NM7tw9XVtVgYRTc/dyhc70Le++1tjUyLxMz
	7P+Q==
X-Received: by 2002:a17:90b:2ecb:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b183000402mr6586900a91.6.1794468026466;
        Wed, 11 Nov 2026 23:20:26 -0800 (PST)
X-Received: by 2002:a17:90b:2ecb:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b183000402mr6586876a91.6.1794468026028;
        Wed, 11 Nov 2026 23:20:26 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c73e27sm3149185a91.9.2026.11.11.23.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:20:25 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: regulator: qcom,wcn3990-pmu: document wakeup-source
Date: Thu, 12 Nov 2026 15:20:07 +0800
Message-ID: <20261112072009.3815276-2-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: kaZg1Mq7bF_9DP3b8Wo4gVITWkZipVpV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX2B+v8i9jwL2a
 JpIjGq5p7MxEl8MiGYGQbdIbgoXjUHvS07Apw19Kck4MT7hNgXCCdkDIKXBufJdnRiVlpczwAzZ
 KZu0UX+RE8/cQk3Fe/GpJhfhAQfRYa4=
X-Proofpoint-GUID: kaZg1Mq7bF_9DP3b8Wo4gVITWkZipVpV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX4p+89KbueJfc
 fIqEALCFsjPH3M56exBZFt/0nTnFLwDHgdrFPjLFu0gFikko8bOPQzGkgGw1v2A8yH7FSh3mQLk
 FKGQ0RN0W5xdDdV5xQjH8uqC648sMGXpbFWU/pYgHkFxREILGT9X/m3uxEon7+JNamk8IxyXv0t
 ueqSPDoI1BUa2MINQ/Ua9da4Aogsv/p4LruRPJ5HS90s8vmTvIrlaZJRR9ULHzF6Hf6Rw2Z3dOC
 HvlqrT34VmWkkkVzjCAAOAtM2q9rP/l0dEkSXydsYKcTtnU69Hm+hbQJIcwuf2ofJEfWdYsQAYA
 cJWerzrn96TeYbbcBEUkVZ8fZ62Wz/WGILOQfwqOoipeJUiPdDYe3AKPiwbfJFT3INiqjSuOCS7
 L5pvKpF3TeaiAMzMShGfP3PUMlVzEIYH7DWPW8KYhhIjVmcJpv2lPPKhVsFrYb54PsQBihb6QLo
 BN6qHDpufEmP25KTTrg==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af568bb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=brVOnVl_E7YOJ4RIXMgA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120029

The SW_CTRL GPIO can be used as a wake signal on platforms where the WCN
device needs to wake the application processor.

Document wakeup-source and require the existing swctrl-gpios property
when wakeup-source is present.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
index 9a7abc878b83..f0372e28c99e 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
@@ -42,6 +42,8 @@ properties:
     maxItems: 1
     description: GPIO line indicating the state of the clock supply to the BT module
 
+  wakeup-source: true
+
   clocks:
     maxItems: 1
     description: Reference clock handle
@@ -67,6 +69,10 @@ required:
   - vddrf-supply
   - vddch0-supply
 
+dependentRequired:
+  wakeup-source:
+    - swctrl-gpios
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

