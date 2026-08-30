Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B750B330D2A
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 21:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126982; cv=none; b=uMT8T+ZlHinPLyfclx9Dk5rLDzq2si94h5qGBSzxwAPoebYIGbFOL2BWO697LYQdcllp8xhGpJlF4ITqeDvmUwpTVcWNkEL7sALt/559Gzno5jmFSpxakBISkRR5WJpQMQg9uS/FHEiQP7DCY9K5ZTwgt1ddnydO8P5ncnoFkX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126982; c=relaxed/simple;
	bh=i4CDdS3NcaboDh4PbI2lZHqoIEVckwLxgeEcZeqa8uI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adB1vF1gcOImCk8MUp7Xr8jIRWFwbp4QYaPFeRT7MBfZ/sF3CX1QWLXlhBPiIzMfr3vagkR3Nape8UJEujRukC3YWR+aZsaKYFWeIwhMOUQ77vX7ZMNVYPO3jHk12styho/3Rf0mnHwHlFO5xotYU+RNUS3KXEJimZBOI83lZZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jetLm8vq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTf9jrME; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jetLm8vq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTf9jrME"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJJaUq1471811
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 21:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1H2AhsQHvE3EqhoZHqt8ddGIg2EcZNaEJyzrvAhEuU=; b=jetLm8vqS1vYwW07
	FxaC1ySiTzEbxsVXfDZJ2X7twO5/bbNMU8/+QRwWQI/sAXn2aoRhDtC9KYuXgMh8
	rxtL+tvwh7iFucVpPzuHBJTRGmxXbd+Z5MqPS3EFqgzMQnsii4TSRTC04/QMkJNn
	+LxHfL6ametiqQLos/TG01kC0LBFwAVUmAJcVNP6lVPK2SJ7xKbFfaL7LbUoLnVY
	1PUeqHEMLls8X0amI9ekM6+Gg2kQ8y5L5/mMPq3BWT0fzd347RxEguarGzmDOxcJ
	qJAN1OPGVGB6Nd7TRzI4LLEZfo8DzHN1nOOzm96okLY8jYskAUG0ObNl+IuoGrOg
	n6Iopw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwbs0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 21:56:18 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836c416b236so40387927b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788126978; x=1788731778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1H2AhsQHvE3EqhoZHqt8ddGIg2EcZNaEJyzrvAhEuU=;
        b=jTf9jrME7t/CbzKfXOEzQ9+kOc76SoTd5qNRS6W4Qa1QBWIDsNb8LlhV4r3/IVV7Y3
         DRHCXfzq2iL+dLHy+GicjStGo7fUZ8BP7xqAz5Mu/umMszYZuTqYMHU06WAOXzWqjFbB
         qK/lMVvtzou1lOMriQkvredual1eltjD+wOVqTC/nnow0k9YN/bpJX5GymHP05gZYFAt
         aXUPTa8nCyZRRcCmIf+uT3eWX0JRADzeny+NY30vnbP9dCWjy9eWYRg2pX3gC+Js2mKi
         lCpt9UxTpmCpVTyR5liQiDeheJ0mBI7rdY//zp1KMCNgINItaco13NgzKHXxq+D/XJPR
         T4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788126978; x=1788731778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1H2AhsQHvE3EqhoZHqt8ddGIg2EcZNaEJyzrvAhEuU=;
        b=pj3c0OCcZop3kFQuRWJz2JBJJFJGWLXT6pL7Ew++48CpOZ3ocbgSsvIZQP+jh/YUDW
         qfGAHMlPTymErsyK5dj2mefb3kEHDKXNsTXRTQLwK/jXlCQHXGBXxeOVONfUnpdjXThw
         EWi3M+gPJ0pCsf/0wzjRv9FDsWJR7cMSBVWWcfPYMoaOAOpi9pqhtMBURUbJNdRMjWkG
         wREM3TQBMaBBaiDuf8JQNV7bT17bAAd10aQvSkWmq7AtL3pnx+y2BbgnYkg6UkzryucA
         dqCDxiYCVkCcYSbjhz/tyn5KO658xBQTD6dUv/Zxi3KOgzAw4RGYOE6kLPxpgPegkZTH
         ImYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNCED8Mep/v5ZOFLV+J6hWI5hNpouDoayxZCno8O1UMQ4DPAAb5j1Rpp7DuaVJIzNvOxcTtClGd70XANR/@vger.kernel.org
X-Gm-Message-State: AFuF++kcLY7cveB3oDwIG4SQoVJa4fD+1stsTRQy8uCYVX4I29tOSxKG
	Ky8w/5RXzigDyCkJvdis9E0RCbc0fjdat8XiR5smvrg6ZVEKluUzAPgvaRmYp4UkQWpVvl+B+TW
	Sa6IB8YEAcucrfbuOP9TZyH4QRDoieek6+rBDpZuWvzoC0/lJQmr5n3k1FlXtnGVCXlw7
X-Gm-Gg: AYBFou1y1/Smhp53MzdbbFyNmnD7LwBgE14TZX9Ub5u79IJEuqnDsjH7FaDONlmSz/V
	OfrJ5OVaFFaxhkBgIQA6ztOaiQcooYQkRYAPz1nwB4GRSyQhVW/sm6SFAQU91TSMSophcS2s09v
	NDp9CgfeellEV7uGRKQEMXpJnfl9vMzAxNZ56czM1PfTbn1bCKWegm+xBOWa1AS3PDDHqLP2zN+
	xy2NWgGkOSG/h0dCfworLX7GA5nNacGcAn2GXIwM7hLluF5akPA4VnjL+SBZtz7QflLtR5QRQB0
	HQok+o5sB2wFqC6oJmnX3vA3wvycweZ3DzZNvNaaARQUIRDaYqU9va1tg7YvZSsWvP/oEPivakb
	OosxRThWsZLNtbzaRpA==
X-Received: by 2002:a05:690c:3181:b0:85e:6840:4ea5 with SMTP id 00721157ae682-85e6840633amr54853487b3.26.1788126978045;
        Sun, 30 Aug 2026 14:56:18 -0700 (PDT)
X-Received: by 2002:a05:690c:3181:b0:85e:6840:4ea5 with SMTP id 00721157ae682-85e6840633amr54853377b3.26.1788126977652;
        Sun, 30 Aug 2026 14:56:17 -0700 (PDT)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed1dc88sm38268857b3.19.2026.08.30.14.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:56:17 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 14:56:14 -0700
Subject: [PATCH 1/3] dt-bindings: arm: qcom: add HP OmniBook Ultra
 14-kg0xxx
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x2-hp-omnibook-ship-v1-1-9feada71dc79@oss.qualcomm.com>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
In-Reply-To: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: 3_S5k8RRLGSJkbmB6mDVEqJvCZuP8mAb
X-Proofpoint-ORIG-GUID: 3_S5k8RRLGSJkbmB6mDVEqJvCZuP8mAb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE5MSBTYWx0ZWRfX6rwtrnrU/t43
 V8pnZR89USJU3P+DmbwmWWKlapJByNMQvCUOuX8+JTpNw6onfm1XBF1XkF/gaCU+EcHs58thb2S
 ZSa4mEs8tnU0qQuI75x0gswSdjn+BeY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE5MSBTYWx0ZWRfX4+BlYOYLZrX5
 sh5bRYoXzB7jOGr9ryPUVsnfhdPDpXhq25JBo24Gx6TtuTUdhHmlihHolhSW7vJ4HzEQOVjYOzh
 1Ar9yqSMcBsYCbiDLyv8nAHv+iApsogSOYFt6fx9EDeelle8KZJ/18fpYqKwocOq2Vp7rKkTy0T
 32r9kJFswE3iMi/WUe78FtmnVf+wiGFnQIEFoYZyqTXN4YkMZw4XS8Kfpvt5WoQHtJySiAcEEpo
 y7wW304RbH0AdZN6h/gL92zdNFHe7RDlBPu3Z00t5J4j6JkiY4NWAU6VjYNUPp/mbP/MMD6WfI9
 MhuwRfzn05jIennmDkXchjMwmm5ShUyaD7oM9JGCPV7vfpRGUiiUY05gk53xKn4pzGX28/UJPlo
 QlWh+jvoDV6gX52xGsWZY/ewFmt4Vt/MXPn8E8NiRnZuTZcz1T57o9AWinz7taDfMF3G1NYr2oZ
 RWR/ybckCrmcBhjpvpA==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a94a702 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=PXKRhWy-3Sq0_ZefuIcA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300191

The HP OmniBook Ultra Laptop 14-kg0xxx is a Snapdragon X2 Elite
(Glymur) laptop.

Add a compatible for this machine "hp,omnibook-ultra-kg0xxx".

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..bd940477fb24 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a16-ux3607oa
+              - hp,omnibook-ultra-kg0xxx
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.47.3

