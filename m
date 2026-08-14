Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDEB41D212
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692767; cv=none; b=urNjNVBYBG+YvUIMOoPmuj4+zSlfM8NfY6cMlH5ppFZ6X3E27l/kwqZjDEXWk6Ogl58G5SUwp7dB9xwCkUNn8gqw1plI0dO2VkxY/YLwL9Ex7CJ6d2630fk5oMXdny2+pmzY7MstWaxcUarLTIuwBSgBJewuUpB9lbioXJB/oVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692767; c=relaxed/simple;
	bh=YcUBetlcsSXeTFWwHSGREMaHV5BuwRS6tuHjLEZyQ0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8CNtv6uMmRiwWC23zNzhrw4n7wSYtUyjB8o6Dz/FJ9SD6WTzKl796IPCMZEEL9wNAMZ2kJdBk5/JG7JssADtEHJpLio2SNRNMtiMWucOONOQUEW3AImrOfiiMZCKsGiPtn+loD6esed7w1UzQxhpXaBTkqvQjggSC5DPk2l65o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnISA80p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceCaKSnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnISA80p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceCaKSnE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QdYN510037
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=; b=lnISA80pp0MtFeSl
	U3EVZCDo3EyOfVDx+/TsveQ+mF0Y80K29xOXOoWi1R5pdsmvKV4nWFDlMdiAPt4E
	GMt8xvH/Q0S3H65lQSunJmrYJRwxhsktGq1WjVY65fbpS3u3xShbRsjdzi1fg0Ms
	bShujkqlCcPu39FC0AhkncONkQw7VNMeuegIvYDp5Z1CUXh/c85OEs4O3FK1E/YA
	llm4S3UPMlKy7CrbyPw4RE0GXSv10BffY/lQc9pgYzxnQCrZPPG51DIN/PB0u1pz
	LaYeHglputGmjijYFnQsjyMiblKDbZVOtqFhF19RwOyHVlKC0HdIjvY2/8oEggSf
	Nt6I5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3uscr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so20211325ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 00:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692756; x=1787297556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=;
        b=ceCaKSnEttv/XlCPurC5I+bAMghWymXVtTTKd/L8XNmYE/ndGpmnCu9liQgclQlbvr
         BkoRgsSmMr5kW+8gIyujlW5k83GCQ4ppKI3KrthoHgm4lgbsRTfUGAiVI755ssHv2+Gv
         Zm5NBFuXy7T30rowT6hQsWEO4uIwvdvB9OyikdctgxGw9lncP1To/ab217B9NqpkUGQZ
         xLKDFRx7zRjin20Plh7lwIIkHbzPiVMxlQeXV2zFg65sLJWUSam04aTrafQSGONNBs1Z
         k7oICbRujASh4ODnWOER+ZDGj2fe1prtSP26mDq3fHPAlIM1CG+1kxENN7yar11nfv6w
         qZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692756; x=1787297556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=;
        b=fQZMInkT9v68RMzYYv/sMk9rV3eVmR/ooW/AtvjjqaD5gn3Qr5j9LBkY5+SQoIHIbp
         hpUpzyO0cT7fXW4NKfanRTCc3g38755oDsAbC5oFU2FQaM8VIe2OgeTCXCvq3ebg+AX0
         8lcip8f+PLfqhQ6diVyaGHhaoinOwLjjojyx/QIUT0UZ8EP5MbTU5kSwRAgTdoIMdHKk
         HZ5SCBm4jzwYi9HglsZEcVbCiylxL4pgv0imf9sh/ikgoiG4nRH7J8rCnaOsVnhwZ2Gn
         KovEFOgfxSY7hs7h7t0Oz454iUMtjInJJEpCiCNjEbkajsu3Hh2ir1RytpJIf22EEY4x
         93HQ==
X-Gm-Message-State: AOJu0YydsklFttdOl8H4bgtTpq/QnfBIX/W4IxKuOrymYNlNhY3OhqcS
	pk9UsCg2pzfO1xmS6jBW4X41XQansJJ9we2RNG1XQcivhYL/iP4prnjZ7OBZEl3WqZWoMVmLX6b
	kWvUHzNIrpQEX+YQpxV9bbIeH5U2X/F7HnPXbCC8ojGRw41roxLVCGILW3VgsL13SuB/e
X-Gm-Gg: AR+sD10tAxvbbkUlJSA+BLZeAJYreEMaxuJ2hosWDGPWNC4A5Pv1h4mODoUkiv+rnwO
	190YBqmvpeiydb1ROWcIELcvcrae2lavW68ySFISiz9MUamV7LM6USq6lLrK4w5BdOUwiOsMA0c
	vyicO0e7jhKGMKJYc6eH+Gc5bqC7+CvGhf02Ue/mJVA/VzcwuCdmx6rIY3lCCmiyvoC5ATQ2rg/
	yJeoJDuNybW+L4FQm8iMY0bS+rGNOBJX6rWWu9vO5lKrz5492R5pWId2JbntG7kOASyEQkLUaWe
	cNRC1GuatoFJEhx0//Bzd0QWk8Ws+e5bDbQ9RJLT7EwviwDEfkzGJaLd8BUH1p6eI16j6M0UamQ
	zlLlWcg3SqUcO7IaXPsiBviNsixsemBIVvMzARHG10KsxLqmm/v2ZpEe2JE2rPUW/xJHiHFuPtU
	S7KdKs5xaVPiCy48bu+J2XmRY=
X-Received: by 2002:a17:902:d549:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d3b0c6832dmr44861765ad.14.1786692756415;
        Fri, 14 Aug 2026 00:32:36 -0700 (PDT)
X-Received: by 2002:a17:902:d549:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d3b0c6832dmr44860775ad.14.1786692755732;
        Fri, 14 Aug 2026 00:32:35 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:35 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:35 +0530
Subject: [PATCH v2 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-4-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=832;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=YcUBetlcsSXeTFWwHSGREMaHV5BuwRS6tuHjLEZyQ0M=;
 b=m2FUOtKrBcO8lDcVtLcayWa7nyzy59baesSptJr8XNM0Qaura5kGzPtzto+lk9HJK0wo93r8l
 uo738BHCf4uAPc/1tAGHJokyJx9v32/xEviKMqHgfKVtEhcUdhQDE0+
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7ec495 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXz/z2Qbc6pYya
 l1jb+YUkaW7L+n1xt2QqhWLuE1ukGFBMIoTY9YegIJN3U2GEK8fP/XTj4p7IPajq8lnhGR96NE7
 sVl1U500ZX7oEgHNvOfpEwqxcHLFNOdoMYvKuusDIKg8la+g8Ctv1YDZlEKMFNfQbMdgbI8H4z+
 ngAsLr3DWoWkKRfcYIkXQ7tix02gmDXtjGSSyvKyBpRKGxz7cLpZDUlNeFbPH9R4RgFdbt181tM
 az7Je7lPRg8wdLSx/+l4oBu4ytb3n56gINQ1bV/ej2Sagey5xIv0EF2HaTbzGWsmwyznZHWCwSz
 1ywrmD6Xapb/o+aZ7W0vQpRSMa7XCwC47MdgDTBCQdkJbZ6lv8E5rVd/aIUJmywnxPmhGhDIi8a
 IaNWaelUGFPYdOynJIICt6Tbnp4d4ciqCdlwjn35zxX80BdmHdVtUhqXRNi5oGmpfMEKBXqyBTY
 ddVPUv9FP37VXrXysEQ==
X-Proofpoint-ORIG-GUID: Y9fvIn3MZrEp7y4LfkTaW7qr4mxGC5DA
X-Proofpoint-GUID: Y9fvIn3MZrEp7y4LfkTaW7qr4mxGC5DA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXzEG1Mrdnf4Tn
 uJJYJ4bUwRChUpKZljCFe7TNZJHAp9Aiju/KnsgZD/W5GkHMAPLxLbIK41O6wFwOKcnqGVFklaU
 QRz1OOBywIwXgFX6UrUmLmFMr48ZLoY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140058

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0

