Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077B836894D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554426; cv=none; b=tlkNS87lUDalrOfqQplUehMOZAloFVuZI56ZeGwg6//C8+gNxoiuhxLYeeY/0SZUBanbstWHdblJhr3QnwV46SRVk1lcLV11w6jlvtTbUorNlqDugWVZXHrh12qIPLyNe9zevrmrj0F6WoE/JmI1AYVCUpIRoRggVJlHyAjrkAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554426; c=relaxed/simple;
	bh=yPqxZEN17TSsE8y7K+fPGHdga83+K6GnBWtDAPOSCk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RAy8Ut/p2yLCRS3sQAqr9aD/tx4UgKxfo3/Eo5B39Ss+o5bv9oMv76Hc21gpQIaEdaYs9ycKgVyFWCfADITTZy/L81EXr4MStvbOhOD0uxEtX6CVoFSSZqUsT4cPd5VEXYkXI8fwox7OTfHiuDf1LZPRGcJSp8rEs5lT4WgCri4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hy4A2c3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtSMCa91; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hy4A2c3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtSMCa91"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R5Bc2058055
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DkIxjYN30xA97QN4X9jUUUIIBPxDeXPrblaonVHpOY=; b=hy4A2c3crGOGvlxi
	IQAGK9dJN22WT69YcQl1bb9zuCqunIfdTs1AEuTwDdSDOFv+RwRLKiUE/g8qrMcF
	mJEm1tN22UvsiloRljjYYgZMD8ozB7Be2/oSUWx+KXZBwf8JBQEYkuGnGiETHXuT
	VF+vyBIu40+ka64TtjNHVpTo6eyt3M/GBNJdQKgCVLoYZEb/YP487FxVoRtyb1T5
	tnXbkmORahw95/bBM7Fu5mK/XcK52mI6h4FQg16p6fTPrCo8Elwmr/rydtYwkLiQ
	xhvbiI9muKjUeIv8knkoFPbUD7+aEwW+KXf++C6S4UpBsE8WJmIicFoQtr+v+yXl
	NAhA4w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr0ydk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:53:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf1c86963bso39218075ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787554422; x=1788159222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DkIxjYN30xA97QN4X9jUUUIIBPxDeXPrblaonVHpOY=;
        b=HtSMCa91OFBcOdl99vSU5VjZjugCDW8BKlm31t2lzWUTlD4x7foz9bFtvaixIRvOJV
         58ZAbwk1eRMRg7+yc9JZneu4kbc45yQRr0tWQm2ULiWV5E6KM0zRuGPyPJbGfSsl6oez
         2zoTGwZpgoFb/aArYYIsYH3syDFgGyUuHW5Y4UphmqcVjqRsE7K+HDiW2Yk/p5MPQi/z
         R8QY4bMnrBoUgz5dpHdZT6q6+eg55eWUCnAEl87CEBLHh+vwvvjHoiWuJ65jXQexLRT1
         csWbP4kM6bEyVl03Sj7ztuq2HYhLTQUTGkfr6ZDYJ+GLoNBLYQdIT9Vkfc9tpxvYDkG3
         kB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554422; x=1788159222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DkIxjYN30xA97QN4X9jUUUIIBPxDeXPrblaonVHpOY=;
        b=l70HxqlfD258C/uHC49EFPR+1duEAjlj/8jaU7Jd/y4POmzWxowAgPmrVm/YoRr7qr
         QQO/VmV1xyZshS+UGm/8DTs1FN1e8UyLF7cMhrFU9hmrfW1Fxc5ov+DlwX9591IkH9AK
         K9XY60ADnWORnt+hc/j0Yw2CWmufwV4EQRLmJdX6DEjfozulkNWvEGR+GXWxkarhlMbz
         X2/yi1lOc5Ap9LsQtO5fyqzx/HPMKXdkZuntzlYZFsam8fnG8lp1ttEazs3i6mcnQEQf
         afRsZMaxcc+SF9IDzgiutF74fsLJvVBU/7X9hmSAS3b/QxtbFMn6hZORkj5TadwwZTvn
         hYAw==
X-Forwarded-Encrypted: i=1; AHgh+Romu1YUNJkfj78VF97pSBkLchiye7mwzY6lg/zH6FedMsJaWz2yJTciqGsx+l7lvOA6y1U0W3w31l5xYA2A@vger.kernel.org
X-Gm-Message-State: AFuF++kTgaXrD87DXnfYISh9ClObD7JrWmqHb3uOlECn4y3fRhWDFexn
	ri/626vCJ9Lyy5WOAV2+DRFnp19TDJ4dOBIcQOiSXY9xUONgidd3pCWUJhn4haBkhudA0qm0Llk
	J3TGUNbBePADhxQiyDDTGW281m+O/hHlfzJ1rC/xcFfCZRYwdjo9N0rdq2yzfEw0qmUw+MU+tuK
	ON
X-Gm-Gg: AR+sD12jzFW9QZ4ACE2NZ9wSlmiD1/p9daCzJPgEgrnOdRBGCfL/TzOYE4GOPCgHyAH
	ue4Lcl5vslNfUQOa0eD29A2zkvLAuq2u7ElNQQff+vFrorDpbgTSeZaWg+JVBQsOyJmoJt9u8M+
	yGC1ZOvVjCrGFK7RqS5+N0X235dDX6cZD1EE091vDntIK1jIFHuZH+kx6QKpQz8ch8io6IaIyr+
	9mu7MtfS75ATkBJLhXIYjJjdl0SseaDlJndMd5wLLxoYf6aHYdGv2z2RI0k2QbL0N1fuepxkuxC
	fXZrP2DaGDH8cMEE0HfFh/MDMffMvAz0qCyiVYb49aMbCtW1KgMS8kspzkHlTpCzPdXZTD3+XuM
	uU8oJVM1KDM9XTdhIcZntocMT
X-Received: by 2002:a17:90b:268b:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-395c4528324mr22880251a91.0.1787554421917;
        Sun, 23 Aug 2026 23:53:41 -0700 (PDT)
X-Received: by 2002:a17:90b:268b:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-395c4528324mr22880215a91.0.1787554421506;
        Sun, 23 Aug 2026 23:53:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4b240e7sm8768031a91.13.2026.08.23.23.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:53:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:23:29 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add EMAC CNOC APB clocks for
 Nord
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-nords_emac_apb_clk-v1-1-290767386bf5@oss.qualcomm.com>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
In-Reply-To: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfX4lVHeG3+d/Hv
 I9oPg2R4hXTKNyGPhZzFe5sD5OZnFwIR+3clR9bqQ5CmJmQt7U59WfyRuOj3OW2XU5UTTUyIO3l
 WTayHCd4HtaO05yR0KyUnStSVM1L5q/qBY9qez1m2zJ+l33TB9pxCXPdJtmrpUsmB2zlcN7Pw76
 gnpCjYzVnXL5PU/2CYxsuKwqw8REiUQeTCtYRH82UrRhIvGhSbj1hafXSL40nle1csVRoxtrdCv
 gCBGWaEdLW/25IROLJGQJkcC/yTpqVBkIORSULOVpNqaL/BNXPSQe1L5JPuTFvgoVAo7/Yib414
 Hckc/DgTgeVJD1wBqUvjzKs95NXizy2CiVWsueXJsv5fq+9SgznCD0XcNq6NfzhnN7sZgPb67pR
 ZG2WaIJKT3bKBXLsIgGJUjl/ljQE0aVCGO87YnqaffzCVfQxTlYNltYtSnoDNwd6lcQlOZ7yHAx
 wA5lKpHnFGMoZSOIA2w==
X-Proofpoint-GUID: _rvkD7H4vGKsiLYzhCpO3Vo01OICBZPF
X-Proofpoint-ORIG-GUID: _rvkD7H4vGKsiLYzhCpO3Vo01OICBZPF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfX2xKQDJzYRHbZ
 NVl0uadUyf2+8mm34fx/U2rbTutH1/rIJot+Rs3ML8gWLerY2FIln8hbIVNSn+KREY9TID2MG1h
 //9wR0TEumXQq7kqNHBWEb3Ah1giwyk=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8bea76 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0SKnWDcDATWbK4hpfooA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240059

Add the EMAC0 and EMAC1 CNOC APB clock IDs to the SE_GCC clock
controller bindings for the Qualcomm Nord SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-segcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-segcc.h b/include/dt-bindings/clock/qcom,nord-segcc.h
index f0f7422af692d05417d126c1011a22faf3bdc611..de4539b999850294926854a45db2997043c74f2c 100644
--- a/include/dt-bindings/clock/qcom,nord-segcc.h
+++ b/include/dt-bindings/clock/qcom,nord-segcc.h
@@ -84,6 +84,8 @@
 #define SE_GCC_QUPV3_WRAP1_S6_CLK				74
 #define SE_GCC_QUPV3_WRAP1_S6_CLK_SRC				75
 #define SE_GCC_QUPV3_WRAP1_S_AHB_CLK				76
+#define SE_GCC_EMAC0_CNOC_APB_CLK				77
+#define SE_GCC_EMAC1_CNOC_APB_CLK				78
 
 /* SE_GCC power domains */
 #define SE_GCC_EMAC0_GDSC					0

-- 
2.34.1

