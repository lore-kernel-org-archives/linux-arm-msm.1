Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7EE48166B
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946196; cv=none; b=m3KN7O+aQguSC16jSh6n4PRYBeykJ1Zs3zufYA/GjqSxuPV/thjl+G+wbEuO0w9mOvufH26kTg0uXMAxi6yQ6LVeu4P2eYERcuYoY4IBu50mqng7yMrerY7tPMTZPVj41qh3Q7zyvqLusbfQuR6YbSfjAYRU+ycWOfhO7RUfOiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946196; c=relaxed/simple;
	bh=G88MQNCCk6+2kZL7bQs1s3QaPljp1R/z4iWolXLINHY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qC5BavgNvywreskqdiTYGGQJidOuvr8shPprFKmLwfeCN9ZOa4OTMm9ZI0uDz0dC4WJ8/w2Ti09T3XdgN5oZviwHmqo3yxwmg8oJ61JDzUstte3epqUDx6GdGbGIp8ckw0QhGZPGuRGWdWJbrGKcHTjZL+45ie9MIq5PVaJsJdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6Xo5hkr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqrIVLSV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6Xo5hkr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqrIVLSV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nTXn344118
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 13:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GP30sOCRIKoAeEz/cHgB2U
	Qvyt440qgWZHWaH/mf8u8=; b=R6Xo5hkriee5XE9TdlSXmvkMzS3TvgHZFH4Dwv
	0gBCJ3mkLJLkPJAOG2WfTKHpoQJpVOv+X8bv8oWFs7jMU8VjomAvr3OuAct48PdK
	1PJozOtTz6aX808DI6mG4CJnp6qf137aXUN6d1TYuOs9aHQXxlxAHMdlgyZZAKxT
	x1NtSH6kJ+3jLFpcquPVvYHGwd3jZHoPKc5oX+W6SisE9w1eTH4E8kEh5GXV+6Si
	IjLwsrjM1OgjZfAesLzaHs0nUMMTVuytNOfazxptGlJvXwIm+pPZAEd/2GWdxRj6
	jjvB86RWK+kUs56dl8DV4bwFrmn0ytUEi0TdeX26z8uhz4Rg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqckkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 13:03:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so14694871eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946190; x=1791550990; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GP30sOCRIKoAeEz/cHgB2UQvyt440qgWZHWaH/mf8u8=;
        b=gqrIVLSViU3ytUVEFVVJLz3GXybrebehYmEaca+6dyagYTfbYlrulx4WssxmjsUZlk
         FUqw38vPuiWT2MAD35LVw2AzTAu2qfNUnLUCmy2qgyVk4Ukry2JAr5xFXkgQXaQL7iY3
         uu8vJIckFMnzVKF/5Stbtr0CbmCBL6wmSWmIUqPbs3u77NGP22vvg2X5pPv6PJXvKzrA
         CsOpOlUlz7HLG1p88SsDFhVY0AUjHJBEEq0xVNnesLXRedQq13d/PnfjOCpsKRywSMVi
         XTqUI+l4ayTQhBkxn0qeJrkRFQS3gYWOu6zHCd/OYbx3zRFFZ8Vx5Reh5dmml/1qgd9U
         7B7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946190; x=1791550990;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GP30sOCRIKoAeEz/cHgB2UQvyt440qgWZHWaH/mf8u8=;
        b=jbuCChIYWL94NKRSExScerPLAY+yaK8AH07nMNqXr6ocBszOHaJKfYDAZ2hukGDOa9
         QlwiyFAVA21o/yR3FoCMetdX8rrVsr2QufzGDKaMgDNSsRb2xt6rgJrXDCkvkRuA5dbH
         Gk3H48TC222IqTL/ekRTXbqCgxlAA9NaY8h3srQ8Uk85hIyA2S6k2vbc12KR1Qwm6jVR
         4WoGdhPHkq3auQG9P5KdweJHMsaskNfeNl33mZPQ7B9pj/awMc+35KAQj8y3WSNyu0dJ
         c36CqEGKtpg2qRDbPyZ3U/bsQ0oZq7n8GuCSu5Vy4JD+WTYLWkrfPPY93a+fWFaAse6+
         v3lQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9kNHAVtwg3SeELieOUynSaoKwMBUHNJlM8+NjSGultQCCvecHc8UXpSR3xByHePJ3eYh9J0Rk+PxLDsd/@vger.kernel.org
X-Gm-Message-State: AFuF++lhIo12WYELndL2X291bmz8l3tJKssVDA4suMxglS6fjIoQiuuR
	XX8Y2V32OE5IWe2jyXb/o/goZuJm3MynzO+w18mNXQSZZuV7vMJgS/9trMj7Ny1kxk7rg7SIJt9
	vfbg4XY+KthoDRipgzuvxrmmB5iutk7lwj3USfd8J4Hs+5YpRjROX3aGqVu9KO5ZKHQfk
X-Gm-Gg: AYBFou0dtxsZrW10MB+FJgpkjcs7hpy2Zb7vAuqmktb2rE4ofPtnSRJoNqoRmrF60TP
	WwrvVF8+Omgm33KCQHTDhbR0p6bwWw8aHFj/5ARcQ+XD7DNW4KMEzbN4DYBM1I1apb2vWXkW5DF
	qnVqLbl11j1OhLoGUZufD2ebfMOwrgx7K1GQ9oUk+s3d5KcK6kV0o1vh3VkTFepWnY13enqrM6s
	ZFhHVsaWQ+ZS/RTeF4vy0PTPP+t3AqVS+JT2UyW4EEydJej95AjLmWGxs0a6/q/NaRQUAp4iE9P
	DMTUc5w5YW70+f6Cqpaql8nwz6as7dAz/QDS7KIE4cRO1VryaMxpf7Cg+EUCdHujlzrsLbsTTPc
	Q8pBR4E/SOM3BQfhnk0YLgDLBVoalnZ5ggwAB4jrCbFS2sQW8yVykXq3oURmQOqH72GBN72ZJcf
	tW1LCNJ4QnMYXLD9qkNJckK8gWHm6GrBbzsw==
X-Received: by 2002:a05:7301:f2a:b0:343:fdea:998 with SMTP id 5a478bee46e88-34f150e38fcmr2658520eec.19.1790946189364;
        Fri, 02 Oct 2026 06:03:09 -0700 (PDT)
X-Received: by 2002:a05:7301:f2a:b0:343:fdea:998 with SMTP id 5a478bee46e88-34f150e38fcmr2658491eec.19.1790946188750;
        Fri, 02 Oct 2026 06:03:08 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:08 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Add support for reporting boot status on Qualcomm
 IPQ9574 and IPQ5332
Date: Fri, 02 Oct 2026 18:33:01 +0530
Message-Id: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWrv2oC/22NQQrCMBBFryJZmzITSCWuvIcUSePURkyjmbQop
 Xc3rVs3Mzz4/79ZMCVPLI67WSSaPPs4FFD7nXC9HW4k/bWwUKBqMMpIHyhcEnG2KZdvOQ4StdO
 t0Z2x2orSfCbq/HtbPTc/5rG9k8vr1JroPeeYPpt2wjW3GRAA/xomlCAPptNYG6gB4RSZq9doH
 y6GUJUjmmVZvontxmXPAAAA
X-Change-ID: 20260929-imem_restart_reason-15c5b95f9a5a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX0c8FcaLgZMaD
 pkpTsBqzDSjTbyhsHCvJM36SS8k5GqO82qUFDO0ijlLfi/vfRU1hvUu6x+C53FEbOeP/+u6tLzO
 1yoNrbOQuYduGz82WTprEVRhTNnMUx1opNpBFwLoO3V395DllnLmeFLx3teIY7AUzAgQfUoyCBf
 34y9wN3tbiGji/iVSXBBENi4IdwpO18L1Ulw1VeT73GKQpEoaYKz/bWjcT2/+DnpwVwi1d++QWD
 GNGdPni/0VkoTqa14PvXtD07lqXf8t88ZPpvFBPanJsxhop2rMb22ABLG6W4R84h89siy1G+ELZ
 X3dQfvpkDtPXg+CPu4plAlOOp2SQzyPjpD+leMXfyeTPsL0GvRDyXKV2Hnpj+Db7ibeqottoeY2
 Fo+5SrtgZFyAB15wI1HWxs+mgLNdRAFvzK7Z3ScKzU4JDVWGgREq06nbP+F4K55iYy0by4pna8V
 RO1Ru6rSAAF3LfaxVRg==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abfab8e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=BUjP7g0EBgjMYpCN6FUA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: B5Qn2EwM8DmXIOljy8AtOH9lrNx50rPf
X-Proofpoint-ORIG-GUID: B5Qn2EwM8DmXIOljy8AtOH9lrNx50rPf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfXzYBhDty81mTp
 buCCtlqOK0PdaghNpYl1MfGGA4cKnB+0q4kFxmWPnR3yx05bPU0RZBaoGSsfTjAdjMaI4zBVNuv
 rB+0/20yt8VrMuZg0eon0gZh+wqDS9s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020051

Similar to IPQ5424, add the IMEM node and the restart-reason child node
on IPQ9574 and IPQ5332 to enable reporting of watchdog boot status.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Placed the compatibles in alphabetical order
- Fixed the unit-address in the restartreason-sram node in 4/5 and 5/5
- Link to v1: https://patch.msgid.link/20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: Document IMEM found in Qualcomm's IPQ9574 and IPQ5332
      arm64: dts: qcom: ipq9574: add the IMEM node
      arm64: dts: qcom: ipq5332: add the IMEM node
      arm64: dts: qcom: ipq9574: add support to get watchdog bootstatus from IMEM
      arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

 Documentation/devicetree/bindings/sram/sram.yaml |  2 ++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 16 ++++++++++++++++
 3 files changed, 34 insertions(+)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260929-imem_restart_reason-15c5b95f9a5a

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

