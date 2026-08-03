Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385853C5833
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748509; cv=none; b=NHUw2y/9QESnsdWwolOAjaxEjqtuTbircrhubqf9rjgeirn3OndV4g1lIsHYNuk16A6dcVEfRSMHr2BnS1shpJ2gM/UxFRRab9/iyntWYha/no1r5zSPXT8+oOWuCNkspM8/OndGFk1B5w2+LAHzft9GZS/lSQC8YoikLqjarCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748509; c=relaxed/simple;
	bh=YVBftsMxqEyBM3msR4cnslQWqNvs9CAJn4EL2Iw11Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0mEsfv4ZqUKl84GBWzU8yT2P5w9d/Pd6f1BRdyZ9cv7UhEswd/oUIisjpjLMNf70FWr7wlLW3p1ofmtbD3fdvzxyG1XpUbVlS5mZnmXcH0kFNcZNpFRiqF1tIrm4Kuirwmf0xea/43WAgxPjGhy4To39//0cXxGkjSpqqLZrVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6s+po2p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5qs/pgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6s+po2p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5qs/pgX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736D37n3654505
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 09:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qhQ5X4XsQLF
	KGbaA430bYByFdkn1wqwhTXB5LdY079A=; b=H6s+po2p2lbX/FAsj9XCPvZT7Gx
	+jneZlN0ByF1DlHkBKjE7gQM5oeXZURh2XVUghRKAZ3642OxCojuVkuMidplt/Az
	GaQVM8DVL4nNNMdl6sm+1NjkTcuB1YrEf3QqzTnnuzuhRo8zMA8a+psBxr4vyBCe
	E3rf4fScsIEY5IdUVhCe1MYfs2ngzIMzv51FpHuAMQjMT3H11ysaQLk4V682quv6
	SGEMJ416u/jA8EqGtrsfmZ9WuJDrX3G1e8rGecckzg6Ot/NVGfKFBqyTPGOMQNtz
	d8KZFSfoL/IebPWY34OimutB79UZ3qrut8DCUEAYSlvzJHDMu6ocovZxd/w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb0tjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 09:15:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso6501561a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748507; x=1786353307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhQ5X4XsQLFKGbaA430bYByFdkn1wqwhTXB5LdY079A=;
        b=X5qs/pgXqas2+RDDfUwJ7bRnc9FUHWKVwzssq6iZXjnrHWQsjITc1jY4N5dbtGIodZ
         yskJUBqT7mAbzelDq6iCR51J3QsYPGrbz3CPm8jZCY1gGvJqbJHaXK3LhKHtfAakuny5
         vyjiM/znTlfXVgzMCV8kslY2Imsqc7ZdWJeELSK9ArqzIUd96swlXs5CZyCw688Cexkb
         Mu6+yd0VJkOAJzFnU8XCKPkTvt4v8+a15zUjyaXB+2AZ1uFFJLgp47SflRWgZ78tmY16
         vrQQDfj9CX5AzvS3Bp0aRa2FYtf1ZaYZZHi2Ku3TDzuVEimKtNQp4GPL7EYd9RXkXg93
         Y7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748507; x=1786353307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhQ5X4XsQLFKGbaA430bYByFdkn1wqwhTXB5LdY079A=;
        b=osHTcLdH/SFmurofBnM+y6J95qqF9QkwEJrYT6rKDEHB2AK1/2DVSFlByvvNiEyjBI
         oTGpr9k3pyzn6RNwBHrIIaQ4c8XHA7wy0rOYCPmeNzXIKlB5gSxtvHby4AUYry7dfZSK
         hXg76cfVJI8r6wO/jZpPtWlgSPz2EtTOSkJ2JzUuMStaaJC95c/Rn3S5+KyfxnBMXw5K
         n0Umw2cHopKBh28n8MKnoZdy74XBopCO0IaX8g39RCme+SmLXI/0WPhgPqX7Vwh1qGDW
         EXGigXxkiEGzZZnbG0gN7hdMaFRqsfPmgj1c8ISEdMCW3ZYb5OxbbYhzdGUcia2GrQVM
         GP9A==
X-Forwarded-Encrypted: i=1; AHgh+Rps1Ch75MBu3BchO7S+AGefzzEKINVC7UFgFxcJPp2/OonZTcMKSxz8lM8Pmofoo+PiXH87REnrmCOPQ2hR@vger.kernel.org
X-Gm-Message-State: AOJu0YznrtlScxUI3S6qM0UAMV/l/lp8v0Zvy3mBsR+eYOW2lp5q7tBp
	OrV6J+Nxe9SoFvYEJjYy8j0KCqhcMQKOLwXUaLiL7lEV2U1SBgRyhlXuwFuD4jpjuhlORDwt/vT
	ZirLhIIkKosr+j/BzQvkVsqtNTFMvf3l3noFi2f2zuKvVnpI626pQnBGWq2WkmMywriFf
X-Gm-Gg: AR+sD10pL9NLuBLcSAx5OFVwXFbmLzauQ7og1gxNNJ+dyjWH2VnGFt+ZH1tZ7uwwI4i
	NJrQURe1YpSBdKpoJqOcRNtY1ifYMFlpCSziMCRveS7HiBe76XSblN/VAUAu0wVQbvRSS3dTI7i
	hebRcpoXf84aL0N7i1iF95xUBM/OvYrMs7ht+mmBPlBxAM8cUhMednDkwfkfou689Le3grUBHn7
	a8hp/1YXc5JuiPElnnJuPAq5fxXyt67R767e9NMfLNEeEpTRai+K13jlNqo0iM4upyrrBNFnNYI
	reiaCe/dmahUMner0w6OOD5ptvK87BYbT4rMcAvRG54+3Izyv/tTB/IEZWp844vSIxHLrV/Uv14
	RqKkCVcH96gZKkjdMZ0xPyJn8h2k=
X-Received: by 2002:a05:6a00:4c0d:b0:848:76af:db34 with SMTP id d2e1a72fcca58-84ee49b4d9emr8730033b3a.76.1785748506779;
        Mon, 03 Aug 2026 02:15:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0d:b0:848:76af:db34 with SMTP id d2e1a72fcca58-84ee49b4d9emr8729992b3a.76.1785748506175;
        Mon, 03 Aug 2026 02:15:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe572d1sm3516376b3a.18.2026.08.03.02.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:15:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Mon,  3 Aug 2026 14:44:40 +0530
Message-ID: <20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GnXfVsrdbDjB_x3whCmp6RQ3znr74XT9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX+qJ5gv0mia0g
 rFBAe06mFo0zkwykAtPGJhVpSCzYkLNlV9q32Wc44H+sdwSQ7rlAO1JVJI81t64mqUscGW9ONwH
 DoNDSEQ0tLytF5fzmzle2aPh4FZKkOM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX4q/xC/bRE6YM
 WfdYDbbKULxp1e5sdMkdLutz7OQJcy5vY4dFcZ70258R0qzVylxr6cxgdp8Cz+jOcqr1f+jHQFj
 pxcNKH9/3BM9eItrOJ6VjaHc5+9o9knPxyePdjDaYIkfsBDU7gRDddcc4Hop3sx0X2wImZrGiGS
 DPk+wOuyxVtpcYyS6ic6iaD1t+OcCgiRV74Wl1vaPtxiW+Q2N+j2GW91U8tK3XlTzpWKrjBWXh+
 mSIVTWe6Sn9lHQzNk5tkRhNfOeC4KZu4YAw0KiTn8KkeBw3ZQ1R4vbcdXok6tOW92Ns5bVWa4ow
 tD7tDCKodQXxlbhtbLhXOyZUAPICBHcIlpCF7GYpiHzpeW0+FhgiKZi+oxNHALvRynyjcbsRdvY
 R60xogNBfbiMY8bNxCQEhltRHH5/L5jTOr+XYZInevEd64i5YDkMnthieAJF0LJPDJgrDQQxtFK
 bBP2NMxC8sSWiER6Rvg==
X-Proofpoint-GUID: GnXfVsrdbDjB_x3whCmp6RQ3znr74XT9
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a705c1b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=xJ7_bQKFY2SeBR32x94A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030081

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..de50d7a3c999 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5210-dwc3
@@ -206,6 +207,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
@@ -547,6 +549,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.53.0

