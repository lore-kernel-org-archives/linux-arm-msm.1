Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFC61C2AA
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284509; cv=none; b=IYd3radOoMDq6KKXn/MfcubU2tfmbh4rGUOPWVwK4kE2WXZb0LD294PHEF/l1febEtMMBbhJZGrdhbrLlLEhaWn6ChWHISF3U4PddocBJsF/bfpWVu1SQnCPHzf40tHuiZNoZ2/7Il7Jb/mPEMMoNfKZb/n2cmraCa8fAFhfoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284509; c=relaxed/simple;
	bh=iCfa7typSMRGPLA0CmVykjjNKAZSxoG8rga/WfRD878=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tOk6Ai7O5gKRbtbyF1zw6t+ImxD52olGYyen3xpOJpN6LN7qgy8cg6f34sPiGo1AxNoWFZaFZDYZE5/p1iI4amr/r9+Fd0OiEahyStxs9UjIf6Eu+O+Bq/lfgzUu8QDOeGeYVTCBKarZTKolL/TeRpplq7E+prj9K57RnYHue/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmJb+W4/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wv3FULkw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmJb+W4/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wv3FULkw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1XHx3228355
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 14:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C9G5sVV88ftybZGBcthamF
	rq5LemHvyV0Y+TsXa/ehg=; b=KmJb+W4/pJLa5F10bsOJ5KX/h3T+mUA+veubrw
	ZcdLiF3Op20U4IzOFXoivWswLZvrV9WUuR8AR2Gvq1BdRvrH2NIWo1CwuXbC+k00
	UjFc18/oWbyIRI6LKxk3K77QWZN4sJqYit+Dxhohh5d24AbDdkeX7WQemVp398X8
	r5Xop0uixmKEAJJzZAMuCdGKERpzic4rMTL1jRjDDmgql8/IpCZfeZbaPYhPYulU
	5MEp/3so20PBnlWLTY7p68P+S3MknmSIU0TyUfTrNEV31i6W1EUrGbn7+ekpWM6K
	4eRNhzbiInJJ9z+JWWJmW+OlEiBHHKRktRCShJ0r6CNWppdQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqk2pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 14:08:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so875845a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 07:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786284505; x=1786889305; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C9G5sVV88ftybZGBcthamFrq5LemHvyV0Y+TsXa/ehg=;
        b=Wv3FULkwLKSYQ+UuWPFo3/5JZbb+1k3qDX7lfq9iRwcoe9VMdY2YDesezIxfLSUY/n
         kne3eaCUCcEwtxJCPfro7oeuVkCFIvkGd5xJNZqnEyU+yQXDz0U+kLGw+75FernEWaWX
         J4UXLqPWhYuT+qb//NvXzWwJN76ni+Hq1WnfXXFUl7W3vnXcuX7B2Ul4ijZhJuuqEu2a
         5ZIXH9K0dQNBH1McHwk/0Y7giO1Nzrbom6bSlLqnwpPg7LlVGm9scbUvG+oCMcKTeVly
         0mL8Pah58Ps+egxWqL79iOTQ7Bi99gEuMcGoe3I5iDCN4OM1ZxT7LCfvX4g2VWmoSCso
         oSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786284505; x=1786889305;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C9G5sVV88ftybZGBcthamFrq5LemHvyV0Y+TsXa/ehg=;
        b=m5xKFL0zEJwgGwdMLHc2/wKB8Lv4xGrodui/7m50YN0v9rm4OSdlUvlWkMsGEggU0v
         ht4LNPspv1R8KNf0caElIBXwA6TAz9Ebl7U7TSjGeqUJAxSoFHtF3dWfeONnG0lpzPPN
         JOB7vUvKZ0ltk53wtknoSgwqLalW7M/edNiuxecjTTWtSSBBzx9W2HA15ASmFDBI3RsJ
         UIB5QSjeHDk1nLFgaVfdwTiD5vVWMQHrKFj4EEXcLQFuO6jq8jG45tzaF60wFfVjOaWn
         AgHhPLklnYG0L/2vw5c9+bXG3p955UOBqyzxPgl2s2YPxQAGpTcfRZ7N1dTVFUOCxHjE
         C/Ew==
X-Gm-Message-State: AOJu0YytWKuOOebwQwiV2pSJbe7FcRuZe5PPTtpP9a8QnhnY1bm1GRz0
	XXl+9ygTd080YycH56VEvKBm295HsxIMcuToARqBmIYYOc8is6LREhV0qYyePiqvov+5Rzd4wmy
	eLrcrNMXlYohZbyRxe//Qj+n8oLMfF18XzQkGyVI8jSx+7XZ8T//ZCHCCKZ9b9WdH9QlhR2B41S
	s0
X-Gm-Gg: AR+sD11vvvTRRF4w9Fa/OVnHB7pW61ztyhI5ukzHp4CuxgoRSmhv36MRxzByUyP1r2m
	nBbkmu3xBpA2E1iqdK+wyE2vNR39YhGx3lLrOYKGt9FxAJg1AiH6+WrBTA3/Up0ibuJ21ztz7Wx
	+yl/8QaRzrlkNq0h4Q75f/uK8ZXbKlDA6h6Md0PiwDdgrqDyATZyUtIRAurAXI6xkLk73lCdVVa
	0P+4pKQCFP8hDVrl0/g6Z/48ryz1h+0uDZh4nwuB1u5oacOm3fcx3yzquxe7HssZYWdXZ5RWU+3
	aLF47AyUjYYDrXADHLQll5S4qFTTGM5cCO7qzcMme3BfMJ/CQz0yvtiQ4gxggiaaLANnN7BdTcN
	rAMEWm+olLhw0yghKkss=
X-Received: by 2002:a05:6a20:d52a:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3cb85e99237mr44740071637.6.1786284505114;
        Sun, 09 Aug 2026 07:08:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52a:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3cb85e99237mr44739992637.6.1786284504643;
        Sun, 09 Aug 2026 07:08:24 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm25489437c88.6.2026.08.09.07.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 07:08:23 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v5 0/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra platforms
Date: Sun, 09 Aug 2026 19:37:50 +0530
Message-Id: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALaJeGoC/33PzW7CMAwH8FdBOS/IzWe7095jmlCaOGs2ICVpK
 xDquy9lk+BQdrH0t5yfnSvJmAJm8rq5koRTyCEeS5AvG2I7c/xEGlzJhAFToCpOcxe+k9kZZ3d
 57PuYBgqgGyUBW60sKQ/7hD6cb+j7x2/OY/uFdlikv4mEp7FsG+5jXchDTJfbKVO1dP/dOlUUq
 NROorLaC+3eYs7b02j2Nh4O21LIok7sLmloViVWpNo5w2uvW8+fSfxBqmBV4kVyztYCvDVg4Ik
 kHiW5Konldwi6VY5VgjUr0jzPP5REhfHAAQAA
X-Change-ID: 20260613-shikra_adc_support-0079650eb76c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786284499; l=2295;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=iCfa7typSMRGPLA0CmVykjjNKAZSxoG8rga/WfRD878=;
 b=xzkh2bKcsJ8aplcwMUGz1qUfNlGPDNGa3OBNzPvHdu7R6hiwbLLZB6lRPSuSLyIjO8zBc9H/v
 sRHdpi+eXXmBEOFhNr7h/D3vhthI6t1zE/YFmd5SWsxz+Bnju3QsK4/
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfXxQysN5jwXyW4
 vD4IdUhbwWen54kjDrWsPisAHbyJwreS2qh12FaLq18WGKIwUvWTBMXIxMDRzTznhpPiKqHo/Xa
 qIWTlqVo+GDM3Mwul2cDEKQ2XxQwGs0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfXyXP4lHAqRiSP
 5joazMwQU4Xj5BbFmsO/bfSquO6xbDfxSSAfbRcJMGVwOOJ7tUeqdhSBoXfQ+zGMvU+wO5d3U5n
 2Zin1BNcbC64IIq8SXUcc/6sqapgYVOEsgTnF0n2X0UMjj855XNCJMEwzajcoFM7WjCWxTHUkj/
 7YuGydHC/yDWNPerfzikUIvnqq34IMbxjhMFR/VrzOT7rzoGuefk40vmbGMjCc804IUEkfChQop
 n54V0enxJJU2LNddD0Nv5pKai5h2K895Wd3/OzpO1gQA03YSosQ63tMLbpiPXXOrKNek6d+N8A2
 1vaz7j8bOJfAxHBF19enNcF/gFKPMMcqNRsO4KpoV048MGTAFT7KhSmDS3SlJgGi83wb5QBwi5K
 0mqj3cVX5BwJLP1mY6k6KqOUC2xax1Za0tk1d+zB7quhs0fZho0mvMgrEthj4/ikb2Sv7EmRfOo
 1AgZ/qIMCJGeAKXtL8g==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a7889d9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Ehwq6YvRiQ2Q07RnrmwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: WCNCDAJm3ExFSe9IGGaIncUMBzpcneaX
X-Proofpoint-GUID: WCNCDAJm3ExFSe9IGGaIncUMBzpcneaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090125

This series adds the following:
- VADC and temp-alarm devices for PM4125 and temp-alarm device for PM8005
  which are used for thermal mitigation on Shikra CQ2390M SoM platform
- ADC thermistor channels and thermal configurations for same on Shikra CQ2390M SoM
- ADC thermistor channels and their thermal configurations on Shikra IQ2390S SoM

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v5:
- Collected Konrad's Reviewed-by tag on patch 2.
- Rebased to latest kernel tip.
- Link to v4: https://patch.msgid.link/20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com

Changes in v4:
- Collected Reviewed-by tags.
- Updated the pm8005-thermal trips to hot and critical.
- Link to v3: https://patch.msgid.link/20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com

Changes in v3:
- Dropping the polling-delay = <0> property from all thermal-zones as suggested by Konrad.
- Link to v2: https://patch.msgid.link/20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com

Changes in v2:
- Move thermal zones to their respective PMIC files (PM4125, PM8005) as suggested by Dmitry Baryshkov
- Rename generic-adc-thermal bridge nodes to therm-bridge suffix (msm-therm-bridge, pa-therm-bridge,
  quiet-therm-bridge) as suggested by Dmitry Baryshkov
- Update commit messages accordingly
- Link to v1: https://patch.msgid.link/20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com

---
Jishnu Prakash (4):
      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

 arch/arm64/boot/dts/qcom/pm4125.dtsi         | 104 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8005.dtsi         |  35 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 120 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++
 4 files changed, 372 insertions(+)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260613-shikra_adc_support-0079650eb76c

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

