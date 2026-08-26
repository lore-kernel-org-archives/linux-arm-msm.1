Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16538429013
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752556; cv=none; b=dFL817ULKKPCVWBMCLxJbGzU0ZfM+AvbBTSlrX/qKjxWM9MRMFHROXxnBSWB1lhXk8vxB7fiXILU4vSmDmAxXE/V3j1WX3xpm/B8FFOsER3mDzrcTQ4llzJeHeFSKD9rniOcEPItXM8Gxxu1to2KK1FVFKPCAdCewgjdA2JVsdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752556; c=relaxed/simple;
	bh=otEHI81H4WDn9tOnr9Q2d2YY3f98Ld2GqVk/KVLqC6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IEtsmK2iiivPZwkftSs717nTtayVgYVW+67LvwpzufPIF8ivKIU3xyFMGBU8My07hCdrj42gMegB3FEzb4n3EeFGj8jzV7zwhRRa1sDQhcvufhaGJTPDs6hIUdHHiEXVRIiKBPh4P4TmOhOyas7UQ2/bRNu+/ps5J0TSRrzEB+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/jGLp5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uh0XtKvT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/jGLp5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uh0XtKvT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCUFoH949050
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H8h1GEu+Qlj
	UORh54PMZRj2icU0G1P+PhnZ9VWrNixE=; b=Q/jGLp5YlEK12a8Ol8D8SQCFtVj
	DMn7XQMrrURdSTog6SmesX5WQAitGQPJ41ovWo1P+tOIrWTfVIM1ochF7ZwRBMlK
	1sV1LdgP+DJHvv/NqN+5dkmZut+Ju75oqaeHybtbRQ9hXH4k71obCkPIOhpcYKGI
	QPrkM6IaPAMT9OBF2fYNo/a1JrzemuytGaELCv3AN5cEgC6H5hCrB+MKTVf77AOs
	FwDOaNyjsygwlgnWE5b16oZrYcVJcnlq+axzjxLmr3fQFj3mnwBuyl/yW1SgRiTW
	qLrGIHK3Bd+8NVOwIZwkYICvcuY6UXUSCk/TIpq9MsitOI4hOmeBjJBbaQA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0758b0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:55:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so1440535a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787752551; x=1788357351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8h1GEu+QljUORh54PMZRj2icU0G1P+PhnZ9VWrNixE=;
        b=Uh0XtKvT7ud7hkaFyy+TKm0Kpjm1Y48q+RMsL+OEoU/J2GOgM2zaFSqCWkVngffBh4
         UN1SGtUTvspgMaiMNTHW8jG/6U9G+Qo6v9u9qajRz5vpttywVWtrP3+7+kKApdAhciU4
         cMAmOK5hm4CoHwGlFrukocedmRU4zpGxFacRj2nAz+YhPuo/YRdnWmRWT+K7v+6+CGvZ
         IWcxal8WcgjcNgbmD+pbxPTtCUJR+OlS7SBhUckKb5Dg35gIe7KOkN0K11r5GyvTxOiN
         UAaQEeULG1v/8IL/OlS2gTXNzd2mwWsGHQ6kJhFcI3c+5A0N8vZxJLgz09u3uw+07k41
         o8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752551; x=1788357351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8h1GEu+QljUORh54PMZRj2icU0G1P+PhnZ9VWrNixE=;
        b=st/ZeKskTZ536RsmKIcDIAhFxpkw8OQIWzNbIgQqLcbCDMnv1COTw+wVgqhcvMZuQ0
         a1ZZxpaiSKVGCbpvqAhNGmSmVtpy7/+QrwlhXW/DQaj30c+fhxtxYdOAVgAMr45HJjfO
         nvMPcApjQ89XzOpqpzwEH1opwi0yi/OcEjTeq+J+SHphboseJEmY6+6vlcbaRyfkULUq
         PSeMYd4HbNrIQcAAwTlKqSKusvh3kMBUWtaNbQ8Qc3DUGOOsW8bZSvBAPABWkitXKclX
         vVfclv0G2RxxlihXmZqfGSZEE6IG/yDwcjuOzdpatLPhcHe0FuJO3fuiaIMETgYfql9U
         UuEA==
X-Forwarded-Encrypted: i=1; AHgh+RqRHcKxQikgan+eyM/wNWVO3m48IxaWMnM7ukgqHOEU021gmI+yZMvImwwCbqsb/s8dvIYKvPU2d84Y5V3n@vger.kernel.org
X-Gm-Message-State: AFuF++m1lgb02LYX1DYuhMOQc14PGF++LKKiYdsKExSvaOxpUi1/Z/va
	n2IzZ0UAET5PEPIp3KBJzOK/3Iu2SAyIQAVeZF0LNhQEQG6J+Mohj2tTdQFItXDe5i2T1+ggyhy
	IsJ/0C8bEZoDVkEiDYfXvbLrTGXSLCLS2V4xkKA62rIWf+TFIMI3foEwsesjrGyTuJw/o
X-Gm-Gg: AR+sD121cfVOGE3YV5lXNXPiIW7MNTA+NQS2wspNJtXaxkI14p7JoHcfYkfTlGLQ/h8
	IglX5pj/oTJLntQIFS5Lj1SeccvMJCbVtBKT3WEdXHC5UlnKZ0qPBFAyQJKeLUj/efO9jykhEU3
	hc2oLB0SqswjG0GvtVV2zdX1QYY/RXakkoTZp7bAP+urvOXbXrqOBJ+/Bv2xPG2zywOHXJWuCAB
	d8NqjsKYLBs61L1UJUsFVyKjIyR5KLFtJf+Pc8bzQTH9HzgurkgvlNXtBApwX3nsTqeMKHFQazh
	pzClLPKiF8/r/nKGbnuJBOM4Sj2qaPVUjHIlr8lzJXLE9NqiL6s08QBsKFzOVNAluMSuVbKzejX
	SGmBJuF7uYcaHzNT1n5Bg4YjRxeM7ODJdyHIAV0/PjnM8amz7AxDIzevAu0G0
X-Received: by 2002:a17:90b:48c5:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-3966d13efc0mr15615199a91.2.1787752551524;
        Wed, 26 Aug 2026 06:55:51 -0700 (PDT)
X-Received: by 2002:a17:90b:48c5:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-3966d13efc0mr15614990a91.2.1787752550699;
        Wed, 26 Aug 2026 06:55:50 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a573a1sm4347911a91.14.2026.08.26.06.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:55:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
Date: Wed, 26 Aug 2026 21:54:53 +0800
Message-ID: <20260826135454.658615-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6Lw8Ef84TqK32bmEhNa8K2zq0-_8YCjV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfX2DoxmQHm1gZ9
 N6K7b0eSvtVbbpi2aykhtFirwoXLrcVN+I0mYCK8GwVZJeyHC/yImPohEyGN0cEyVCwWG+ruQT8
 TyH1ZvfNNezMQsYEuwz9WjcoNcc6pvaJpfFB76MIJlU9aIGgmGZNudkSiF3ZJ+leybR/7VAhDiu
 5QeRM6FcHxf3C7bfV+KF64Jm/LB/iOmlFwoovmv0GahdG2Tzp5rs77LJqynhnriUNUsnmQx175L
 9w82zX8b0yEFVCgluTmJsBTk3ZsnWJSKot7hTvJigXMYASMzzfigpzaTg6acHaHozKUfn/BkpsC
 XTmVX3RRdPeI2UMPA0iBWIPLgDMYWDlwy9cFi1DzmLTdVIT72+1czlfqOrCJQxLWaxathdKwRp3
 dJqXs1qzDuwidCZGbVHDhaTlPXu1VmksACI415jADvbv1AjdxeOW3uv2O3iGpt3vw7xfmjqwzeO
 aOHJPkCH41TK5Z87TiA==
X-Proofpoint-GUID: 6Lw8Ef84TqK32bmEhNa8K2zq0-_8YCjV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfX8gx09EmmOwF/
 L5Gg+Gria1EPSsn/RmS4Vog7+p+Y/z+XKZ8KlCVtgG79Oed27NRHFPAH0AIhxPhqkqe3ZOtEyCA
 3aa71YFNmJPKOjqEL6jkavft6AaYKTI=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8ef068 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8T9gEdC4W5p8owDaN-wA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260115

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Nord routes the NSP (compute DSP) memory rail through a dedicated NMXC
resource instead of the shared MX rail. Add the index so device trees can
reference it.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom,rpmhpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 07bd2a7b0150..92c8408dbc57 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -32,6 +32,7 @@
 #define RPMHPD_GBX		22
 #define RPMHPD_NSP3		23
 #define RPMHPD_GFX1		24
+#define RPMHPD_NMXC		25
 
 /* RPMh Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION		16
-- 
2.43.0

