Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695116;
	b=zTdRH126iR8gb9lDv5zdFeYPUjyATeUqYGTxNln6xQ7XnY+YIK8DdxEhehvzr/cR4U4M
	 KLqFmqF+ppi6m5E+vUeV3ivpdGPjJi02VY23oCtGrPmVJV0tz2A2zFWS/IEWRQD+Ikbuu
	 tHv368f3diy6S/umId99gWkml7//LwLvGE1eaBgnF1b1raMIdJ3P1iSmkt7bbypiveEne
	 VYgA/W7SBYjkSbsZSlzUmHodcmjyYcB0Ys95+Jkvi3E49niJ+7RP3zcKcF5Xmq5H9s1B/
	 A83PWlrWSv4+9tRbTVlXNhPLEWkxmvknFWF/hRo9rVxhQQuNPET9NiaHxAz1ECOiYQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=;
	b=Pj0mMAA3Nwuyeors8+gMK5lp24ar+CA/JBLQXZ0iuo9BkrlZRzWq6W0Vufwh/Mj+1gck
	 2Fhv+/SZhFr7cy7Ap1KVAS7D8OjXnP0vJqCLel3ZDQFZUqGgwJdvJ8yuZf0CX0M/9vuMs
	 bi5C4Z5B70J1bNUZRDCkZfGMGSI4jIgtRbUdssf6rBe233dF0oqkZZ3CK6ooFEjgei9t7
	 ZAzpTSB72T2kensBIrKfPuB8lZJ+1qk+c2MYpj7p6026wcFlCn2AEwBRJUnkdyKnzE8rA
	 Gd3YWp+QqNxKK/TpCaUzBt2xUOL8PjnaIvrDv28ytTed7D+yTJ0udw7/0Nvd1wl9gjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmMNd4wI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dk1GPZEf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80322606A339
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80322606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmMNd4wI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dk1GPZEf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVPeK2758183
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=; b=mmMNd4wIHPdOkwE9
	5OBijT+0u+AFoV4Y40Grtgrw8ql36kSzPNSArWeEy2lBL8D7PJImrAEJ6t8VN4vM
	aeBtmjanXnLjVY16QM43gCd36vTsSA3qxUOygCDGQplbz/43BsPDzXC/0LeG/VKR
	emA5g0+JhC0dEC9geNDZStWDOvZ+jR10Qdd8xmnUkedbaaSPNpC1KzgvsuWG3GRD
	YlR8FIs2EiKNUiei7fwNtiVSSXZS6pEfP2pGNcLpR4sJKEWkoApAEPRaSY2h8ODR
	58abhJ46pSDbG0uyzMqwzU2DXkmMHEbg/kspi/sFFGnHzUDr9SFq7lsVinU4LgYW
	ie8kdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvbqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so1048509785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695115; x=1796299915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=;
        b=dk1GPZEfwosP0tv+mLh+acQ0fYpd6qdYdsWDcx5/Fmyy7pKgToFYyO+XiV8zSuI18U
         Mh1OfBZZrjL8QWw/Mxf3qzIjcULFbk+lBeIW5+3tpcqX17puxGyQwa7Xh/VN7rcnud3H
         vJsdPdrpHhJm9hdTwp3HGRj+Reca8+FmraHmBsG99uKvD+hGS41gttDfKFF+TwPJO9uu
         1QMUuVU3mR6K0YR6NkHxGF35PyFEZxxn8LdgKdSKDg2QfjmXC3W1nf8yFznccrPqSAAZ
         cTA7gKcLh8ePntfwn3XQ8D3gbQeanEBjwMqO3GjnbEUikTed3fHM7tGkDx4WU0vuI1oJ
         0ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695115; x=1796299915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=;
        b=oE9S2O0KmgIXcK68aJ4LEm2K8fh763n4xZxxZJZgIcd1E/+3Vfjj+n+tpW0jN6XmRW
         MzrcfAzleprOXFQ6RceuP0h5xC1gCr/lcbitUh7UGd2sD3cmc0uHLN1TU458gPmaD2ps
         lFUKRrpnBuGaE1EgYtZQauvoDVk+bFYYSXEbjCHGX0wn1PV8CnfU/AS3Gd1Hm98aWtYB
         iQOsHjD7H/JqLHNOIGbANamiIXiJf3PpIs1rXEUl4Tcq780L8per90gbhlnz/p4YCEZd
         uizJXnyvFWqQZpt2hbaXNZay1y3Z1aCqHqaju0H+YBvC+0hlaIvEwWpFArd2jrTAX180
         zAuA==
X-Gm-Message-State: APuU4Z+cnWZBDQikRje+b31bk6yzLWkdT4SikYb7gMWR497D7Z6d5s+l
	9jHuWwbfwV/beBxeSUsHVBq6c9S4pqp6xmfMy/Orfi2mxWcFqT8yYBf7+Huv8JXHUui8LOROIl5
	zCkzVACMQvGMppWXyAPKeH7jTRfUZiAcdiZYOhsNoQMLuH33MXn+yLxQtjq1yX6W6e+T/
X-Gm-Gg: AZFdTZeVcC188d9z7KFzhtqLmIU86dlu85cSzC0IQrxnWicw8LEOznQbuf5M17Bjwjr
	rVj73Ic8/cH9CPK+Up8Mu4I6ehwm+eAzl3sbu6G8KEE06O17Q80383mAxyuU7vuXkhPhz9iPA4g
	u38iuT7+Ke+DiDeggDI+53FNjyxvYXhon9BHPQDnWeH3vk9JnR0JVUpApBWKtea1UcfftyiDal+
	utwo/Gqb0GABgZFmhivLCFalJQO1XkHbFxqTs0nRDhxckGNiiaGtJizUZBjYPO1tRcH7b1tg5gl
	+VagiievjI1mz1ljfMitAhSXUozz7OHSBS5otCpxl1ojVhqFbs7JPY5O5qWJtSv+2FNGInLY7VF
	YTDMmsBSChSJh3UZXzch4iyvoHl3y90W8DFMX2tiiuXWkNgOcmZAy5llpMKh8BUPd+0pFGh3atH
	UAPySfUGhW/2SQ
X-Received: by 2002:a05:620a:2a02:b0:949:70ec:7e8e with SMTP id af79cd13be357-949ba9e4216mr3538198085a.54.1795695114891;
        Thu, 26 Nov 2026 04:11:54 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:949:70ec:7e8e with SMTP id af79cd13be357-949ba9e4216mr3538192385a.54.1795695114410;
        Thu, 26 Nov 2026 04:11:54 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm748736566b.40.2026.11.26.04.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:53 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:11:40 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: agatti: add an EL2 overlay
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
Message-Id: <20261126-agatti-el2-v2-2-1ed468b4c52b@oss.qualcomm.com>
References: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: HZdNJ2cPQSCNWsV9YWic8fditIGiVjW5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX7zvRFKLpgAvQ
 kWzvaLgAczFTM4ZC8S0ZcMJOlnLnCiq/L4DZw1cUzRTy0O580TTyUl/Rc9U91G0a1OGw8KNFZ43
 NUHeqwqQiB2dswiixn7THj/IwMWw4Sw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX9Tx2zeR6bN5u
 elIStIZo5U6gd+yFb2aRWZs/YqQ6JcXn2DQS6yGxwZN81VyjUhL+zxK/xhaCopeteqNA6o5p5Vn
 reGk6CqIf82HtZXHlpACcr7y+iiCYBWDZTeePuZyb5ESnOY1kuB7ZZncE284BI4NWkQRWrUxU1C
 9x0wbzMsHUOTpmHkKpzhaxDpp7yCoC1dNV9EXSPopZpLzjn3dN5bsfMJ5KuhmVUCA/1TPco7gRX
 zjscj0L6xOEeCqekqWRQOw4DXUUeOgoq0OFEbxTn2UV4I35UeClEF+P6t3HuKI/DYRc4zw/qvCF
 9jUFBGTxO4MkxuiJ+ceV3QoEcLQs86XJE9MWUajy/WFCBVIVIxBCGzSPX6GbNMZ3ORq6I1LF6Y6
 tFuvpjWfOBlbFw1Ft+7jWrVsAe0fn44XzZ2GsDpw5ofrDXbNbq+LcVDnM2R1ktk7WXE8/wX+/8k
 0td0DuHPKe4uo3TYWjQ==
X-Proofpoint-ORIG-GUID: HZdNJ2cPQSCNWsV9YWic8fditIGiVjW5
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b08220b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0g1k818zwqbdU_kKEKkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

With a boot chain that has no hypervisor (TF-A and OP-TEE in place of
QTEE and Gunyah) Linux runs at EL2 and owns the APPS SMMU.

Add agatti-el2.dtso for that case, as the other SoCs have:

- disable the zap shader: at EL2 the GPU driver programs the CP secure
  registers itself;
- give the ADSP remoteproc its SMMU stream (0x1c0), so the PAS driver
  maps the firmware carveout and the resource-table windows for it;
- give the WLAN firmware its SMMU stream (0x1a2) through a
  "wifi-firmware" node, so ath10k_snoc maps the wlan-msa carveout the
  firmware on the modem reaches through it.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  4 ++++
 arch/arm64/boot/dts/qcom/agatti-el2.dtso | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..70e41313b4d9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -278,6 +278,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola.dtb
+
+qrb2210-arduino-imola-el2-dtbs	:= qrb2210-arduino-imola.dtb agatti-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 
 qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
diff --git a/arch/arm64/boot/dts/qcom/agatti-el2.dtso b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
new file mode 100644
index 000000000000..aa8e85278bdc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Agatti specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1c0 0x0>;
+};
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1a2 0x1>;
+	};
+};

-- 
2.53.0

