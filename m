Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550536;
	b=bImYNb0uDdQ+FM5ySn3Uh7hM11XyQnzastFxZ/XQTB4D23nC4gDie+UOtZkyY5J3+gZP
	 vXtKBY2UC5hD8u5pmPWd2BalsMbNq2CMOMz8aZ6K2cxdRSnP0HKDtcChxYIFmJt43wvd7
	 lktS6xrEUXAZatvu/Nc+WwX+BxJh/2leYQoY3EnT9IacaLMb8D7oVKxfScpV4WGzNvOhe
	 cO5jz8UdONHX56dNQxc0Rknba2vkFpIfHhRrMpkJeTRAnIl2W75L9czHZb85W89OPHAtN
	 ggKzyRtXSE7/7M0gTvoEFQJnzcuvID4VevGooid56lofvKth6G10knSS4zUF3FzgzYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
	b=jNI9yZ2ZPBtCO1dV9JngzEd08N3p8/iCd8byqFOt3JBdmLBUaJRr9itAozwVw3MHQhMp
	 Yuywt8QgdU8S77/SynJeAAfLFVs/pMFLryIDjiInnw3l8wE5wAYDg5Kc6q+BHdGUbru4u
	 8QXAZpuTXmGdCb2Z5/9Kd/JyIOSn3rJQuaWh7j26GcTrEcGQ7YAXyRcYWPdsG5l17tite
	 agJM/OnBDjIRfRdWP7Pj902rNxPLwzxr6g5QWiYIpMww+779J93rHfzDoZTA4wL2SMHRa
	 kcsACsnMDxq7z+6Z/hj/WBw6vO/7BTrBZbJmrjSiWPefdvIUqIhq+ertm0k5/TH5S9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IC4IN98a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7t3jS7E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACE5606A6BB
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ACE5606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IC4IN98a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7t3jS7E
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXweX3702209
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=; b=IC4IN98aD3qMMEOt
	0/ZBAR6kZlsNSyoJV2ql5TRgq5Aithhlw3NiXK80diUP4tatEE8W/L0FHZNqbzeW
	cvddkNTUUUx4H9QZ/ZYL7Xjnh/XxQoWYHs+q8UN+cK9a85cOGpt99ISk5ylzfgao
	MNEtC6y2kHRUu8Nfkj4yt2f/MzpQaPBHlX/e0kvKkdeIfYWGqOp77WO0WyLXv3X8
	05v3ELy4Rzcs40UYYP4oFubxOtgYGOdhzvamXDcn9I+jp/HNFXecoMDOoU4/xSJ6
	9C4oimlwryuUy6Ixw0QVRMVxXxa2zMUvV+ZK6N4VRmVH6FU/sPXSd4ZIcZMVf8YQ
	3ZhiAw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7t56w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a6f57c066so502332eec.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550534; x=1796155334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
        b=U7t3jS7ECoUcRGBjc2c9SMcEhoOh80+/bGEYe9U8dNeaw9LCJJyVEnrkM3sGnBF8Kc
         cBXQEgVAIJV2YnjpoyvqaPrranLHyo3xZ3O1XVjSWa0Achke629T6ZCxKVITENzr+KxV
         B2oNY9nalQ6uqTIxQRueQaA0Wf1H7Mt283nOFpqsRqPybyb+mbymnG7/rNtsNLKUBrd0
         2GW3hpN2g9n3bd+wdAXXR98ZqWucmFNJcNR99ZEKLawzKwnT8a/Hi4bMYYloB8Drve8+
         06b/FmQFuLuh2msPkUAt1Vd6MznK5c35XeU+XzA5Ql7nS50BqwXk5JGDl2Siumfv0Aeq
         4iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550534; x=1796155334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
        b=mV9Zs/NFjJhpSdEjRDsLL2ekuRVG5VB6ppyUSk5SCtgsdflVAJglqSyikvGCdden0d
         4h/yOjoQadLY3foKXVgGKGiUGU68ey/6DrZ3BY0gGHVAIDOBDLRUlYLbT5PGAkdQC8UC
         uTlg0hJGq6y+M+uFZzLxVl9KUPLZXHMQGjIBd7dUEY2E5ep1pZ+z/5MOiCnBwMhahIKl
         or53iYNsDhedHBGrCml34l9qUULdEVf2MbgtkeCKGwLSI0btGSNDCNsng7YB/kq3+Fbq
         Km/OE6UedlWa2is/UjxVI9lt0M7VpOriNSIK/rdpHex7qPPs6HS288qPK5hT/EM6sw85
         XNtg==
X-Gm-Message-State: APuU4Z9+htXZ+6KjCP9EFV+KOQEvetG6Q+n7SiRKmgZiKElDozrHbh30
	Hg1cafq8RZ6XdHaaFhlScL3dTzOV9z8dobgbE9tBvt12BlpGJYXEK37+WvxMjTIKrgpvh2FwXLD
	39DmQ0X5IAxsmZjLFcA8/3qj6s7pHQWEnTBA6pda7CURs48YoyaOREP3lffDOxtpS/X88
X-Gm-Gg: AZFdTZfnxp/pT2uqxt6CJqhZwd0E12BYEVcwWxat4L5MRnLc84TU1DdYqf+UKJBHemd
	N3Vg3Ps7fOxDyuPH9xt0CBWLW7j4eVHKqNtsP9bqACUbx+jUbHAbjFrn2AJwcA8x0JUqPmXMy9o
	xL6f3YIFEoLYmi/QbxLOhuBneoeVzdAFoZOSOyAfoZF1EE8CKpcMDTymszIhdgo8xRSV2pIbMoh
	gFAlqllLmDzCW5vv+t/JPYFqGdCoKV2IMd+m+zbjbj6R8zeVEbFRbI6x3Lu0aprrOgbU+YCh5gA
	KKgWjyDt1qKpvDQbHbAK0fvowFi3Fo3DaYLgwDzWAtdmL+b7xfrSWm9teFNMYZTBGgOXFqV2v+0
	gdD8PKKipjN/ZFUStQwuAfqHccv6KZaMH4luz6J3N39MquDC1KZfPR6pZagAoZYTGPjedww0m09
	Taht781JA=
X-Received: by 2002:a05:701b:4554:10b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b5566e72c7mr23181186c88.0.1795550534204;
        Tue, 24 Nov 2026 12:02:14 -0800 (PST)
X-Received: by 2002:a05:701b:4554:10b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b5566e72c7mr23181120c88.0.1795550533379;
        Tue, 24 Nov 2026 12:02:13 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:40 +0100
Subject: [PATCH RFC DNM 11/15] thunderbolt: Raise TB_TIMEOUT to 500 ms
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-11-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=771;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=QbBiyvqAcfQWLt33cWM1d6MRIS/efAtBYRH5kpUuajs=;
 b=ceEoSnWOSQpTKTmrasnJ/E5U6w+u/Bzq7S/DCRvL5JzUoYBrFt5Cr/GlkYw1Cau+1LS5gz3BQ
 g5SlBy2yDnSCde294+DUgMW50aPABreI95lPJgrBaNZOLzRqhodnx8M
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX4RRHHhxFjHq2
 nuxzu2tkOjd+vhIttBojpv31x36njsNTeYBjd4CWkclqMtvZ7Tkwbo1ag9CotiZz+ST3Zh+2kg0
 Lj6+TkKXlsTYq33YWpXnIJOqerE51so=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05ed47 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=S55nwNfuHOdlGrVOgPkA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX3cjQCLscEUk3
 QwtterviVjVDOEinRRsWnk3VB9STBukw+PlBCLtYA8Fw9Rg/a0c/aIb9eLjexV3EiBDhPHZJFJ/
 83qxc9RdYRjLZn2ZlYNZPFEjOOG1MwpLzX3mC3egdhdXFKsZF82wrmEQufo/FxnWPv1NmYjnlLk
 HHSd08BFhNRKHQZ8m5ctfQDjOVWkMHAuw+oerls4E65tEaF9c1RB0hCB1bxM6NHgCG0rKRN7gqq
 Ni1LkHNSz8SMJUKjqgbYYjIxE1UFO4rxHrSxbNWRp+wsjauXw5DcQarbtyoflc3ZufbQr5SDsNF
 UPfogCRAJMOOZ7AKScxfq/YzWE1S8WfSmNPGq/+LKuEOzzm+M6NzyY0Q2LDVRDr/dQXE9IEbWRI
 KgZjBMgIij+ckpABPRwGWjosVI2N5sXpHXXPUpGff+WVM7mGYbGZTOVeZ2mtdqskbztIXPu774T
 JSCswry80TMwihQCAaQ==
X-Proofpoint-ORIG-GUID: gZBR1RSdQP1QOGt4JhgIRNWF4P_zoObn
X-Proofpoint-GUID: gZBR1RSdQP1QOGt4JhgIRNWF4P_zoObn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

Routers with firmware-managed link training (e.g. Qualcomm) can take
well over 100 ms to answer config requests while a link is coming up.
Increase the timeout to facilitate that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/tb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 418ad0a61a5de84717d7653c3516faca2a3db2ec..7594bc24c443fc27af651dd22c2db4b6e5acd696 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -16,7 +16,7 @@
 #include "tb_regs.h"
 #include "tunnel.h"
 
-#define TB_TIMEOUT		100	/* ms */
+#define TB_TIMEOUT		500	/* ms */
 #define TB_RELEASE_BW_TIMEOUT	10000	/* ms */
 
 /*

-- 
2.55.0

